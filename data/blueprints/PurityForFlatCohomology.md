# Roadmap: purity for flat cohomology and the conjectures of Gabber

**Summary.** Purity for flat cohomology after Česnavičius and Scholze: for a Noetherian local complete intersection R and a commutative finite flat R-group G, flat cohomology with supports at the closed point vanishes below dim R, and through degree dim R when R is regular and not a field. The proof passes through virtual dimension and étale depth, a root-extraction lemma in positive characteristic, prismatic Dieudonné modules and a key formula expressing flat cohomology of perfectoid rings by A\_inf-cohomology. Consequences are global purity, Gabber's conjectures on local Picard and Brauer groups of complete intersections, purity for groups of multiplicative type, and Česnavičius's purity for the Brauer group of regular schemes with its codimension-one and residue descriptions.

This roadmap plans the purity results of Česnavičius–Scholze, *Purity for flat cohomology*, and Česnavičius, *Purity for the Brauer group*. CS24 locators refer to arXiv:1912.10932v3 and C19 locators to arXiv:1711.06456v4. Page numbers below belong to those versions, unless a different source is named. Source findings concern the versions actually read; they do not assert an error in a journal printing.

| Layer | Title | Targets |
|---|---|---:|
| PF.0 | Punctured spectra, flat cohomology with supports and Hartogs extension | 4 |
| PF.1 | Virtual dimension, étale depth and Zariski–Nagata purity | 5 |
| PF.2 | Purity in positive characteristic | 4 |
| PF.3 | Perfectoid rings: Dieudonné modules and the key formula | 10 |
| PF.4 | Purity for complete intersections and regular local rings | 5 |
| PF.5 | Global purity and the conjectures of Gabber | 13 |
| PF.6 | Purity for the Brauer group and for tori on regular schemes | 16 |

## Scope and ownership

The owned targets are the semilocal punctured-spectrum adapter, the fppf-specific supported-cohomology adapter and local-to-global statement, virtual dimension, étale depth, Zariski–Nagata purity for virtual dimension at least three, positive-characteristic and perfectoid purity, the key formula, the complete-intersection and regular-local purity theorems, their global consequences, parafactoriality, the local Picard and Brauer conjectures, purity for groups of multiplicative type, higher torsion for the multiplicative group, coniveau and the codimension-one Brauer and residue descriptions.

LocalPurity §1.1 already owns the local punctured spectrum. SchemeAndStackFoundations §2.7 already owns general derived cohomology with supports. The targets here reuse those carriers and operations. Absolute purity is imported from LefschetzPencilsAndVanishingCycles §0.10; regular Zariski–Nagata purity from LocalPurity; complete intersections and local Grothendieck–Lefschetz from DeformationAndDerivedPatchingAlgebra; Auslander–Buchsbaum from PurityOfBranchLocus. PerfectoidSpaces P7.16a–P7.17 already owns the regular finite-flat residue and perfectoid towers. They are imported, rather than assigned again to PerfectoidQuotientsPartII.

The atlas suppliers provide arc descent, integral perfectoid algebra, André’s lemma, the prism associated to a perfectoid ring, finite flat groups and prismatic Dieudonné theory. The three PD.6 targets used here were checked individually; PrismaticCohomologyPartII as a whole still has a needs_changes review concerning PD.7. This roadmap does not certify that packet’s closure. Exact contracts and remaining Part II inputs are recorded below.

The completed target-level pass has 57 nodes, 52 API entries and 34 definition/construction tests. All seven layers remain planned, none closed. The 14 named gaps, nine requests and unchecked implementation statuses remain part of the plan. Acceptance of the independent review is not a claim that these gaps are discharged or that the mathematics is formalised.

## Conventions

- Rings are commutative and unital. Regular sequences follow EGA (CS24 §1.4): weakly regular, with no condition that the final quotient be nonzero; Mathlib's RingTheory.Sequence.IsWeaklyRegular. A Noetherian local ring is a complete intersection if its completion is a quotient of a regular local ring by a regular sequence (DeformationAndDerivedPatchingAlgebra §3.4); dimensions are Krull dimensions.
- Cohomology is fppf cohomology on the big fppf site (Mathlib's AlgebraicGeometry.Scheme.fppfTopology), identified with étale cohomology for smooth coefficients and with Zariski cohomology for quasi-coherent coefficients (SchemeAndStackFoundations §2.10). H^i\_Z(X, F) is cohomology with supports in the closed subset Z; for a local ring (R, 𝔪), H^i\_𝔪(R, G) means supports in the closed point and U\_R is the punctured spectrum.
- G denotes a commutative finite locally free (equivalently, over a local base, finite flat) group scheme unless stated otherwise; G^\* is its Cartier dual (Tau Ceti's FiniteLocallyFreeCommAffineGroupSchemeCat.cartierDual over affine bases). A torsion class in H^i(X, T) is one killed by a locally constant positive integer.
- Perfectoid rings are integral perfectoid in the sense of Bhatt–Morrow–Scholze (PerfectoidQuotients Q0); A\_inf(A) = W(A^♭) with Fontaine's θ; ξ is a chosen generator of ker θ, fixed compatibly over all perfectoid A-algebras, and 𝕄(G) is the covariant prismatic Dieudonné module of PrismaticCohomologyPartII PD.6 (F Frob-semilinear, V Frob^{-1}-semilinear, FV = Frob(ξ), VF = ξ); for perfect 𝔽\_p-algebras ξ = p and 𝕄 is the crystalline module of Berthelot, Gabber and Lau. The superscript V = 1 denotes the fibre of V − 1.
- Br(X) is the Brauer group of Azumaya algebras, Br′(X) = H^2(X, 𝔾\_m)\_tors (SchemeAndStackFoundations §2.22); they are kept distinct until a comparison theorem applies.
- Names of suggested declarations live in the namespace TauCetiRoadmap.PurityForFlatCohomology.





## Exact supplier contracts

### Pinned libraries

Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Each of the 22 declaration statements was read at its pin; the ring-localization companion module was also read.

- `mathlib:AlgebraicGeometry.Scheme` in `Mathlib/AlgebraicGeometry/Scheme.lean`: Schemes as locally ringed spaces locally isomorphic to spectra; the carrier of every scheme in this roadmap.
- `mathlib:AlgebraicGeometry.Scheme.fppfTopology` in `Mathlib/AlgebraicGeometry/Sites/Fpqc.lean`: The fppf Grothendieck topology on the category of schemes, generated by the fppf precoverage; the big fppf site on which flat cohomology is taken. It provides no cohomology with supports.
- `mathlib:CategoryTheory.Sheaf.H` in `Mathlib/CategoryTheory/Sites/SheafCohomology/Basic.lean`: Sheaf cohomology of an abelian sheaf on a site, as Ext from the constant sheaf; the cohomology groups whose relative (supported) version PF.0 constructs.
- `mathlib:localCohomology` in `Mathlib/Algebra/Homology/LocalCohomology.lean`: Local cohomology of modules over a commutative ring with support in an ideal, as the colimit of Ext from R/J^t; compared with Zariski cohomology with supports by SchemeAndStackFoundations §2.7 for Noetherian rings.
- `mathlib:IsRegularLocalRing` in `Mathlib/RingTheory/RegularLocalRing/Defs.lean`: A Noetherian local ring whose maximal ideal is generated by dim R elements (spanFinrank = ringKrullDim).
- `mathlib:RingTheory.Sequence.IsWeaklyRegular` in `Mathlib/RingTheory/Regular/RegularSequence.lean`: Weakly regular sequences: each element is a nonzerodivisor modulo the previous ones (the EGA convention used by CS24 §1.4).
- `mathlib:RingTheory.Sequence.IsRegular` in `Mathlib/RingTheory/Regular/RegularSequence.lean`: Regular sequences: weakly regular with nonzero final quotient.
- `mathlib:ringKrullDim` in `Mathlib/RingTheory/KrullDimension/Basic.lean`: Krull dimension of a commutative ring in WithBot ℕ∞.
- `mathlib:Submodule.spanFinrank` in `Mathlib/Algebra/Module/SpanRank.lean`: Natural-number truncation of spanRank: minimal generator count for finitely generated submodules, but zero for infinite rank. The virtual-dimension targets use Noetherian regular presentations, so the relevant ideals are finitely generated.
- `mathlib:IsLocalRing.closedPoint` in `Mathlib/RingTheory/Spectrum/Prime/Topology.lean`: The closed point of the prime spectrum of a local ring; its complement is the punctured spectrum.
- `mathlib:AdicCompletion` in `Mathlib/RingTheory/AdicCompletion/Basic.lean`: The I-adic completion of a module as an inverse limit of quotients; classical completion, not derived completion.
- `mathlib:IsAlgClosed` in `Mathlib/FieldTheory/IsAlgClosed/Basic.lean`: Algebraically closed fields: every polynomial splits.
- `mathlib:frobenius` in `Mathlib/Algebra/CharP/Lemmas.lean`: The Frobenius ring endomorphism x ↦ x^p of a ring of characteristic p; the twist of Frobenius-semilinear maps.
- `mathlib:WittVector` in `Mathlib/RingTheory/WittVector/Defs.lean`: p-typical Witt vectors; A\_inf(A) = W(A^♭) and W(A) for perfect A.
- `mathlib:Localization.Away` in `Mathlib/GroupTheory/MonoidLocalization/Away.lean`: The localization-away carrier at the cited monoid module; its commutative-ring and algebra structures used for A[1/a] are supplied by Mathlib/RingTheory/Localization/Away/Basic.lean, also read at the pin.
- `mathlib:Module.FinitePresentation` in `Mathlib/Algebra/Module/FinitePresentation.lean`: Finitely presented modules; the hypothesis of the product lemma for Dieudonné modules.
- `mathlib:Module.Free` in `Mathlib/LinearAlgebra/FreeModule/Basic.lean`: Free modules; the conclusion of Auslander's criterion.
- `mathlib:Module.IsReflexive` in `Mathlib/LinearAlgebra/Dual/Defs.lean`: Reflexive modules: the evaluation map to the double dual is bijective.
- `mathlib:IsAzumaya` in `Mathlib/Algebra/Azumaya/Defs.lean`: Azumaya algebras over a commutative ring: finite projective, faithful, with A ⊗ A^op → End(A) bijective; the affine Azumaya notion behind SchemeAndStackFoundations §2.22.
- `mathlib:IsDiscreteValuationRing` in `Mathlib/RingTheory/DiscreteValuationRing/Basic.lean`: Discrete valuation rings; the local rings at height-one points in the residue sequences.
- `mathlib:UniqueFactorizationMonoid` in `Mathlib/RingTheory/UniqueFactorizationDomain/Defs.lean`: Unique factorization; factorial (strictly henselian) local rings in the divisor sequence for 𝔾\_m.
- `tauceti:TauCeti.AlgebraicGeometry.LineBundleClass` in `TauCeti/AlgebraicGeometry/LineBundle/Class.lean`: The commutative group of isomorphism classes of invertible sheaves on a scheme; Pic(U\_R) of the punctured spectrum.

### Existing TauCetiRoadmap targets

- **TauCetiRoadmap SchemeAndStackFoundations**, commit `f30bfe0a3b9d28515e04a1b779af08792e57ea76 (main)`: §0.3; §0.4; §0.6 coherent\_hartogs, reflexive\_extension\_normal; §0.14 henselian\_finiteEtale\_equivalence; §0.17 depth; §§1.15, 1.18 torsors and gerbes; §§2.1–2.3; §2.7 cohomology with supports; §2.9; §2.10; §2.11; §2.15; §2.22 Brauer groups; §3.4 Picard groups. Scheme, site and coherent foundations; Kummer and Artin–Schreier sequences; Hilbert 90; Gabber's affine proper base change; Azumaya and cohomological Brauer groups. Used by `PurityForFlatCohomology:PF.0/flat-cohomology-with-supports`, `PurityForFlatCohomology:PF.0/hartogs-regular-sequence`, `PurityForFlatCohomology:PF.1/zariski-nagata-virtual-dimension`, `PurityForFlatCohomology:PF.2/additive-group-depth-vanishing`, `PurityForFlatCohomology:PF.5/torsor-gerbe-purity`, `PurityForFlatCohomology:PF.5/regular-dimension-two-extension`, `PurityForFlatCohomology:PF.5/brauer-purity-complete-intersection`, `PurityForFlatCohomology:PF.6/strict-local-brauer-purity`.
- **TauCetiRoadmap DeformationAndDerivedPatchingAlgebra (pull request #1034)**, commit `e0abc60100ba74746306a44d12ac151d5dc6cc9a`: §3.4 absolute local complete intersections and the flat-local criterion; §6.9 localCI\_parafactorial and punctured regular Picard triviality. Complete intersections; SGA 2 XI 3.13(ii). Used by `PurityForFlatCohomology:PF.2/finite-flat-cover-reduction`, `PurityForFlatCohomology:PF.5/parafactorial-local-ring`, `PurityForFlatCohomology:PF.5/local-picard-torsion-vanishing`.
- **TauCetiRoadmap LefschetzPencilsAndVanishingCycles (draft pull request #873)**, commit `4c9b59c5f758c3964ca73ce60826b2c52d5f1f90`: §0.10 absolute cohomological purity. Gabber's absolute purity for regular pairs. Used by `PurityForFlatCohomology:PF.1/etale-depth-virtual-dimension`, `PurityForFlatCohomology:PF.4/flat-purity-regular`.
- **TauCetiRoadmap LocalPurity (pull request #1102)**, commit `6fd7dbe7d6eb7d835483f6ed90fbe305ec65e664`: §1.1 IsLocalRing.puncturedSpectrum and its basic-open/compactness API; §2.1 purity for regular local rings (Stacks 0BMA); §2.2 extension across points where purity holds (Stacks 0EY7). Zariski–Nagata purity for regular schemes (SGA 2 X 3.4(i)). Used by `PurityForFlatCohomology:PF.0/punctured-spectrum`, `PurityForFlatCohomology:PF.1/zariski-nagata-virtual-dimension`.
- **TauCetiRoadmap PurityOfBranchLocus (pull request #1103)**, commit `8ba23ff82baa03183998c791a4565ff2f6a5fdf8`: §0.3 auslander\_buchsbaum. The Auslander–Buchsbaum formula. Used by `PurityForFlatCohomology:PF.1/depth-virtual-dimension-incomparable`, `PurityForFlatCohomology:PF.5/auslander-endomorphism-freeness`, `PurityForFlatCohomology:PF.5/regular-dimension-two-extension`.
- **TauCetiRoadmap PerfectoidSpaces (pull request #818)**, commit `506f5211b5d2e497588b614fcb008f54adfb0688`: §P7.16a regular-finite-flat-residue-tower; §P7.17 regular-finite-flat-perfectoid-tower. The existing finite flat regular towers for residue extension and perfectoid p-adic completion; neither is new work for PerfectoidQuotientsPartII. Used by `PurityForFlatCohomology:PF.4/flat-purity-complete-intersection`, `PurityForFlatCohomology:PF.4/flat-purity-regular`.

### Requests and refinements

- **`SchemeAndStackFoundations:SF.0`**: Imported from TauCetiRoadmap SchemeAndStackFoundations (main f30bfe0a), no new content: §0.6 coherent\_hartogs and reflexive\_extension\_normal (EGA IV 5.10.5, Stacks 0E9I, 0EBJ), §0.4 coherent extension with the coherence of j\_\*F across closed subsets of depth ≥ 2 in the form of EGA IV 5.11.4, §0.3 graded modules and relative Proj for the affine-cone comparison of global complete intersections, §0.14 henselian\_finiteEtale\_equivalence (Stacks 09ZL). Also import LocalPurity §1.1 IsLocalRing.puncturedSpectrum and its local basic-open/compactness API; PF.0 adds only the semilocal adapter and comparison maps. Needed by `PurityForFlatCohomology:PF.0/hartogs-regular-sequence`, `PurityForFlatCohomology:PF.1/zariski-nagata-virtual-dimension`, `PurityForFlatCohomology:PF.5/torsor-gerbe-purity`, `PurityForFlatCohomology:PF.5/parafactorial-local-ring`, `PurityForFlatCohomology:PF.5/global-complete-intersection-picard`, `PurityForFlatCohomology:PF.5/regular-dimension-two-extension`, `PurityForFlatCohomology:PF.0/punctured-spectrum`.
- **`SchemeAndStackFoundations:SF.1`**: Imported from TauCetiRoadmap SchemeAndStackFoundations (main f30bfe0a) §§1.15, 1.18: torsors and gerbes under finite locally free, possibly noncommutative, group schemes with étale descent of gerbes. Not in that roadmap and requested for SchemeAndStackFoundationsPartII (gap SF-PII-tori): tori and finite-type groups of multiplicative type over a scheme (SGA 3 IX–X: étale-local diagonalizability, character modules, realization as kernels of maps of tori), flasque tori (Colliot-Thélène–Sansuc 0.5, 1.2), and C19 Propositions 2.2–2.3 and Corollary 2.4 (injectivity of H^1 and H^2 of tori on punctured spectra under finite étale or finite flat covers, with the commutativity correction of PAPER-CESNAVICIUS-19/E1). Include the character-module construction of the torus S = image([m]:T→T) when m kills character torsion, and the fppf epimorphism T→S whose kernel is T[m]; these give the finite-coefficient reduction for PF.5. Needed by `PurityForFlatCohomology:PF.5/torsor-gerbe-purity`, `PurityForFlatCohomology:PF.6/henselian-torus-punctured-vanishing`, `PurityForFlatCohomology:PF.6/flasque-generic-injectivity`, `PurityForFlatCohomology:PF.6/norm-torus-counterexample`.
- **`SchemeAndStackFoundations:SF.2`**: Imported from TauCetiRoadmap SchemeAndStackFoundations (main f30bfe0a): §§2.1–2.3 site cohomology, Leray and Čech spectral sequences and torsor classes; §2.7 cohomology with supports, depth\_localCohomology\_vanishing and localCohomology\_module\_comparison; §2.9 𝔾\_a, 𝔾\_m, μ\_n; §2.10 quasiCoherent\_topology\_comparison and smoothGroup\_fppf\_etale\_comparison; §2.11 hilbert90, fppf\_kummer\_sequence and artinSchreier\_sequence; §2.15 gabber\_affine\_proper\_base\_change, etale\_galois\_comparison, etale\_cohomology\_limits; §2.22 SchemeBrauerGroup, CohomologicalBrauer, toCohomologicalBrauer, brauer\_henselian\_local. Requested beyond that roadmap (gaps SF-PII-\*): fppf cohomology of finitely presented commutative group schemes commutes with cofiltered limits of qcqs schemes with affine transition maps; Gabber–de Jong Br(X) = H^2(X, 𝔾\_m)\_tors for X with an ample line bundle and Br = Br′ for regular schemes of dimension ≤ 2; and the flat-cohomology results over animated rings of CS24 §§4.1, 5.1–5.5 listed in the gaps. For supported continuity require a fixed descended closed support with qc open complement. For the general DVR residue kernel also supply the precise unramified descent criterion in gap BR-RESIDUE-DESCENT. Needed by `PurityForFlatCohomology:PF.0/flat-cohomology-with-supports`, `PurityForFlatCohomology:PF.2/additive-group-depth-vanishing`, `PurityForFlatCohomology:PF.3/perfectoid-low-degree-cohomology`, `PurityForFlatCohomology:PF.5/local-picard-torsion-vanishing`, `PurityForFlatCohomology:PF.5/brauer-purity-complete-intersection`, `PurityForFlatCohomology:PF.5/regular-dimension-two-extension`, `PurityForFlatCohomology:PF.5/gm-cohomology-torsion`, `PurityForFlatCohomology:PF.6/strict-local-brauer-purity`, `PurityForFlatCohomology:PF.6/brauer-residue`.
- **`SchemeAndStackFoundations:SF.4`**: Algebraization on punctured spectra, beyond the proper-morphism results of SchemeAndStackFoundations §§4.7–4.10: (i) for a Noetherian local A with a dualizing complex, I-adically complete, U=Spec A∖{𝔪}, and coherent F on U, require colim\_V H^0(V,F) ≅ lim\_n H^0(U,F/I^nF), with V ranging over neighborhoods of U∩V(I), provided every associated point x of F has dim(closure{x} in Spec A)>cd(A,I)+1 (Stacks 0DXR; 0DX9 bounds cd by the generator count); (ii) in Stacks Situation 0EHC, let I⊂𝔞⊂A, X=Spec A, Y=V(I), Z=V(𝔞), U=X∖Z. Assume A is Noetherian local with a dualizing complex, X equidimensional, X∖Y Cohen–Macaulay, I generated by d elements, dim X−dim Z>d+2, and a coherent formal module (F\_n) on (U,I𝒪\_U) whose completed stalk at every y∈U∩Y is locally free outside V(I) (in particular if every F\_n is finite locally free over 𝒪\_U/I^n). Then (F\_n) extends to X and, if A is I-adically complete, algebraizes to a coherent module on U (Stacks 0EJP); (iii) Ferrand–Raynaud patching of finite étale covers along completion, Proposition 4.2, credited through CS24 pp. 34–35. Proposed owner: SchemeAndStackFoundationsPartII, gap SF-PII-algebraization. Needed by `PurityForFlatCohomology:PF.1/zariski-nagata-virtual-dimension`.
- **`DeformationAndDerivedPatchingAlgebra:R03.3`**: Commutative algebra for complete intersections and regular rings: (i) Stacks 07DV, f\_1, …, f\_r is M-regular iff f\_1^{e\_1}, …, f\_r^{e\_r} is; (i′) Stacks 09Q1 and DeformationAndDerivedPatchingAlgebra §3.4: in a regular local ring every ideal cutting out a complete intersection is generated by a regular sequence, independently of the presentation, and complete intersections are stable under localization at primes; (ii) the flat-local complete-intersection criterion (Stacks 09Q7; DeformationAndDerivedPatchingAlgebra §3.4 upstream): for flat local A → B of Noetherian local rings, B is a complete intersection iff A and B/𝔪\_AB are; (iii) factoriality of regular local rings (Auslander–Buchsbaum), as requested by the PAPER-CESNAVICIUS-19 route; (iv) DeformationAndDerivedPatchingAlgebra §6.9 upstream, localCI\_parafactorial (SGA 2 XI 3.13(ii)) and triviality of line bundles on punctured regular local spectra admitting finite coherent extensions; (v) Avramov's additivity of the complete-intersection defect along flat local maps and the Burch–Kohn three-generated ideals of maximal projective dimension (gaps AVRAMOV and BURCH-KOHN). For (ii), also supply stability of finite-dimensional local complete-intersection k-algebras under field extension, tensor product over k and localization: use regular-sequence presentations, flat base change and transitivity; this is the closed-fibre step in CS24 Lemma 4.1.12. Needed by `PurityForFlatCohomology:PF.0/hartogs-regular-sequence`, `PurityForFlatCohomology:PF.1/virtual-dimension-flat-additivity`, `PurityForFlatCohomology:PF.1/depth-virtual-dimension-incomparable`, `PurityForFlatCohomology:PF.2/root-extraction-comparison`, `PurityForFlatCohomology:PF.2/finite-flat-cover-reduction`, `PurityForFlatCohomology:PF.4/flat-purity-complete-intersection`, `PurityForFlatCohomology:PF.5/auslander-endomorphism-freeness`, `PurityForFlatCohomology:PF.5/local-picard-torsion-vanishing`, `PurityForFlatCohomology:PF.5/gm-cohomology-torsion`, `PurityForFlatCohomology:PF.0/regular-sequence-support-vanishing`.
- **`DerivedDeRhamCohomology:DD.1`**: Complete flatness over Noetherian rings (CS24 Lemma 6.2.1, Yekutieli 2018, Theorems 1.3 and 1.5): for an ideal I of a Noetherian ring R, every I-adically complete R-module M with M ⊗^L\_R R/I discrete and R/I-flat is R-flat; in particular I-adic completions of flat modules are flat. DD.1/complete-flatness defines the notion but does not state this flatness theorem. Also the a-adic form of DD.1/bounded-torsion-criterion for an arbitrary element a: for an A-module M with bounded a^∞-torsion, derived and classical a-adic completion agree (CS24 Lemma 6.2.2). Needed by `PurityForFlatCohomology:PF.4/flat-purity-complete-intersection`, `PurityForFlatCohomology:PF.4/flat-purity-regular`, `PurityForFlatCohomology:PF.4/completion-regular-sequence`.
- **`InverseGaloisAndArithmeticFundamentalGroups:IG.0`**: Functoriality of étale fundamental groups along pullback of finite étale covers (SGA 1 V 6.9–6.10): for a morphism Y → X of connected schemes with compatible geometric points, π\_1^ét(Y) → π\_1^ét(X) is surjective iff FÉt(X) → FÉt(Y) is fully faithful (equivalently, connected covers stay connected), and is an isomorphism iff the functor is an equivalence. IG.0/etale-fundamental-group supplies the Galois category and π\_1 = Aut(fibre functor); this comparison statement is what CS24 Theorem 3.3.1 uses. Needed by `PurityForFlatCohomology:PF.1/zariski-nagata-virtual-dimension`.
- **`LefschetzPencilsAndVanishingCycles:LPV.0`**: Imported, no new content: Gabber's absolute cohomological purity as planned in TauCetiRoadmap LefschetzPencilsAndVanishingCycles §0.10 (draft pull request #873): for a regular Noetherian scheme X, a regular closed Z of pure codimension c and n invertible, Ri^!ℤ/n ≅ ℤ/n(−c)[−2c] through the fundamental class. Used in its local form: for a regular local ring R of dimension d and G finite étale of order invertible in R, H^i\_𝔪(R, G) = 0 for i < 2d (CS24 Theorem 3.1.3). Needed by `PurityForFlatCohomology:PF.1/etale-depth-virtual-dimension`, `PurityForFlatCohomology:PF.4/flat-purity-regular`.
- **`PerfectoidSpaces:P7`**: Import, do not re-plan: TauCetiRoadmap PerfectoidSpaces §P7.16a regular-finite-flat-residue-tower and §P7.17 regular-finite-flat-perfectoid-tower at PR #818 head 506f5211b5d2e497588b614fcb008f54adfb0688. The first allows any complete regular local ring and supplies finite flat regular residue extensions with algebraically closed residue in the colimit; the second assumes mixed characteristic and perfect residue and supplies regular finite flat p-power towers with perfectoid p-adic completion. Use the ordinary perfection tower separately in equal characteristic. The specific tilt-completion and integral-valuation refinements are not supplied by these statements and remain PQ-PII-towers. Needed by `PurityForFlatCohomology:PF.4/flat-purity-complete-intersection`, `PurityForFlatCohomology:PF.4/flat-purity-regular`.

The exact external node references are `ArcTopologyAndDescent:AT.11/complete-etale-hyperdescent`, `ArcTopologyAndDescent:AT.11/complete-valuation-product-basis`, `ArcTopologyAndDescent:AT.12/integral-perfectoid-hyperdescent`, `ArcTopologyAndDescent:AT.6/torsion-arc-hyperdescent`, `ArcTopologyAndDescent:AT.8/gabber-affine-proper-base-change`, `ArcTopologyAndDescent:AT.8/open-henselian-completion`, `DeformationAndDerivedPatchingAlgebra:R03.1/cohen-series-presentation`, `DeformationAndDerivedPatchingAlgebra:R03.1/cohen-structure-and-compatible-coefficients`, `DeformationAndDerivedPatchingAlgebra:R03.3/ci-cohen-macaulay`, `DeformationAndDerivedPatchingAlgebra:R03.3/complete-intersections`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/raynaud-abelian-embedding`, `InverseGaloisAndArithmeticFundamentalGroups:IG.0/etale-fundamental-group`, `InverseGaloisAndArithmeticFundamentalGroups:IG.0/finite-etale-covers`, `PerfectoidQuotients:Q0:integral-algebra/completed-perfectoid-tensor-products`, `PerfectoidQuotients:Q0:integral-algebra/completed-root-stable-quotients`, `PerfectoidQuotients:Q0:integral-algebra/completely-etale-and-henselian-perfectoid`, `PerfectoidQuotients:Q0:integral-algebra/perfectoid-rings-reduced`, `PerfectoidQuotients:Q0:integral-algebra/products-of-perfectoid-rings`, `PerfectoidQuotients:Q0:integral-algebra/theta-naturality`, `PerfectoidQuotients:Q3/andre-flatness-lemma`, `PerfectoidSpaces:P7/regular-finite-flat-perfectoid-tower`, `PerfectoidSpaces:P7/regular-finite-flat-residue-tower`, `PrismaticCohomology:PR.0/ainf-prism`, `PrismaticCohomologyPartII:PD.6/covariant-normalisation`, `PrismaticCohomologyPartII:PD.6/perfect-base-classification`, `PrismaticCohomologyPartII:PD.6/torsion-base-change`.

### Recorded gaps

Each item states the missing input and its consumers. The SF-PII inputs belong to the SchemeAndStackFoundationsPartII design (#3361), PQ-PII refinements to PerfectoidQuotientsPartII (#3362), and EDP-PII to EtaleDualityAndPerverseSheavesPartII (#3363). The internal Auslander proof and general-DVR residue argument remain explicit gaps.

- **`PurityForFlatCohomology/gap/SF-PII-key-formula`: Positive-characteristic key formula for flat cohomology (CS24 §4.1).** CS24 Proposition 4.1.4 (low-degree identifications over perfect 𝔽\_p-schemes), 4.1.5–4.1.6 (pro-fppf site, stability under perfection), Proposition 4.1.7 (0 → G → 𝕄(G) → 𝕄(G) → 0 on perfect schemes in the pro-fppf topology), Theorem 4.1.8 (Rε\_\*G → 𝕄(G) → 𝕄(G) with V − 1, hence RΓ\_Z(S, G) ≅ RΓ\_Z(W\_n(S), 𝕄(G))^{V=1}) and Corollary 4.1.9 (H^{≥2}(A, G) = 0 for perfect A), pp. 37–39; items 057–062. Owner: the pending design DESIGN-SchemeAndStackFoundationsPartII (issue #3361; route SchemeAndStackFoundationsFlatCohomologyPartII of PAPER-CESNAVICIUS-SCHOLZE-24). Not planned here. Needed by `PurityForFlatCohomology:PF.2/char-p-complete-intersection-purity`, `PurityForFlatCohomology:PF.3/flat-side-arc-descent`, `PurityForFlatCohomology:PF.3/perfectoid-low-degree-cohomology`.
- **`PurityForFlatCohomology/gap/SF-PII-deformation`: Bégueri resolution and deformation theory of group cohomology (CS24 (1.4.2), §§5.1–5.2).** The Bégueri resolution 0 → G → Res\_{G^\*/S}(𝔾\_m) → Q → 0 by smooth affine commutative groups (CS24 (1.4.2), item 005); the deformation sequence for smooth commutative groups along a square-zero thickening with ideal J, 0 → Hom(e^\*Ω^1, J) → G → j\_\*G → 0 (Česnavičius 2015, Lemma B.14; CS24 Theorem 5.1.13, item 084); the deformation triangle of CS24 Theorem 5.2.8 (item 091) and étale = fppf cohomology for smooth groups over animated rings (Theorem 5.2.6, item 090). Owner: the pending design DESIGN-SchemeAndStackFoundationsPartII (issue #3361; route SchemeAndStackFoundationsFlatCohomologyPartII of PAPER-CESNAVICIUS-SCHOLZE-24). Needed by `PurityForFlatCohomology:PF.2/root-extraction-comparison`, `PurityForFlatCohomology:PF.3/product-valuation-local-analysis`, `PurityForFlatCohomology:PF.3/flat-side-arc-descent`.
- **`PurityForFlatCohomology/gap/SF-PII-continuity`: p-adic continuity of flat cohomology (CS24 §5.3).** CS24 Theorem 5.3.5 (RΓ(A, G) ≅ R lim\_n RΓ(A/^L p^n, G) for p-henselian π\_0(A), G of p-power order), Corollary 5.3.7 (H^{≥3} = 0, H^{≥2} = 0 when (π\_0A/p)\_red is perfect; in particular H^{≥2}(A, G) = 0 for perfectoid A) and Corollary 5.3.8 (invariance under maps inducing equivalences modulo p), pp. 59–61; items 096–098. Owner: the pending design DESIGN-SchemeAndStackFoundationsPartII (issue #3361; route SchemeAndStackFoundationsFlatCohomologyPartII of PAPER-CESNAVICIUS-SCHOLZE-24). Needed by `PurityForFlatCohomology:PF.3/perfectoid-low-degree-cohomology`, `PurityForFlatCohomology:PF.3/flat-side-arc-descent`, `PurityForFlatCohomology:PF.4/flat-purity-complete-intersection`, `PurityForFlatCohomology:PF.4/flat-purity-regular`.
- **`PurityForFlatCohomology/gap/SF-PII-excision`: Excision and p-complete descent for flat cohomology (CS24 §§5.4–5.5).** CS24 Theorem 5.4.4 (RΓ\_I(A, G) ≅ RΓ\_I(A', G) when A → A' is an equivalence after iterated derived a\_i-adic completions), Corollary 5.4.5 (H^i\_𝔪(R, G) ≅ H^i\_𝔪(R̂, G) for Noetherian local R) and Corollary 5.5.3 (hyperdescent of RΓ\_Z for cosimplicial algebras that are fpqc hypercovers modulo p), pp. 67–70; items 102, 103, 105. Owner: the pending design DESIGN-SchemeAndStackFoundationsPartII (issue #3361; route SchemeAndStackFoundationsFlatCohomologyPartII of PAPER-CESNAVICIUS-SCHOLZE-24). Needed by `PurityForFlatCohomology:PF.3/flat-side-arc-descent`, `PurityForFlatCohomology:PF.4/flat-purity-complete-intersection`.
- **`PurityForFlatCohomology/gap/SF-PII-brauer`: Azumaya and cohomological Brauer groups agree (Gabber–de Jong; Grothendieck in dimension ≤ 2).** Br(X) = H^2(X, 𝔾\_m)\_tors for X with an ample line bundle, in particular quasi-affine X (de Jong 2002 after Gabber; CS24 p. 90, item 119), and Br(X) = Br′(X) for regular X of dimension ≤ 2 (Grothendieck, Brauer II). SchemeAndStackFoundations §2.22 constructs Br → Br′ and proves the affine regular dimension ≤ 2 case only. Owner: the pending design DESIGN-SchemeAndStackFoundationsPartII (issue #3361; route SchemeAndStackFoundationsFlatCohomologyPartII of PAPER-CESNAVICIUS-SCHOLZE-24) (its Brauer layer, shared with the PAPER-CESNAVICIUS-19 items cohom-brauer and affine-brauer-comparison). Needed by `PurityForFlatCohomology:PF.5/brauer-purity-complete-intersection`, `PurityForFlatCohomology:PF.5/regular-dimension-two-extension`.
- **`PurityForFlatCohomology/gap/SF-PII-tori`: Tori and groups of multiplicative type over schemes; C19 §2 and Appendix A.** Finite-type groups of multiplicative type and tori over a scheme (SGA 3 IX–X), flasque tori (Colliot-Thélène–Sansuc 0.5, 1.2), C19 Lemma 2.1, Propositions 2.2–2.3, Corollaries 2.4–2.5 (finite flat and finite étale descent of H^1 and H^2 on punctured spectra; Proposition 2.2 restricted to commutative G, PAPER-CESNAVICIUS-19/E1) and Appendix A (fields of dimension ≤ 1, Lemma A.2). These were routed by the PAPER-CESNAVICIUS-19 extraction to SchemeAndStackFoundations SF.1/SF.2 as sources; that roadmap is now on TauCetiRoadmap main without them, so their owner is the pending design DESIGN-SchemeAndStackFoundationsPartII (issue #3361; route SchemeAndStackFoundationsFlatCohomologyPartII of PAPER-CESNAVICIUS-SCHOLZE-24). Needed by `PurityForFlatCohomology:PF.6/henselian-torus-punctured-vanishing`, `PurityForFlatCohomology:PF.5/multiplicative-type-purity-low-degree`, `PurityForFlatCohomology:PF.5/multiplicative-type-purity-higher`, `PurityForFlatCohomology:PF.6/flasque-generic-injectivity`, `PurityForFlatCohomology:PF.6/generic-h2-injectivity`.
- **`PurityForFlatCohomology/gap/SF-PII-algebraization`: Algebraization over punctured spectra and Ferrand–Raynaud patching.** Stacks 0DXR (with 0DX9) and 0EJP, and Ferrand–Raynaud 1970, Proposition 4.2, as stated in the request to SchemeAndStackFoundations:SF.4. The PAPER-CESNAVICIUS-SCHOLZE-24 extraction marked them planned by SF.4 (item 051), but SchemeAndStackFoundations on TauCetiRoadmap main states algebraization only for proper morphisms and adic thickening systems. Owner: the pending design DESIGN-SchemeAndStackFoundationsPartII (issue #3361; route SchemeAndStackFoundationsFlatCohomologyPartII of PAPER-CESNAVICIUS-SCHOLZE-24). Needed by `PurityForFlatCohomology:PF.1/zariski-nagata-virtual-dimension`.
- **`PurityForFlatCohomology/gap/PQ-PII-towers`: Integral perfectoid valuation and explicit tilt refinements beyond the existing regular towers.** Import the regular residue and perfectoid towers from PerfectoidSpaces P7.16a–P7.17 (PR #818); do not plan CS24 Lemma 3.1.1 or C19 Lemmas 5.1–5.2 again. The remaining contract is CS24 (2.1.2.3), (2.1.3.2) and Proposition 2.1.9: the radical/torsion identities; p-adically complete rank ≤ 1 valuation rings with algebraically closed fraction field are perfectoid; A is an integral valuation ring with algebraically closed fraction field iff A^♭ is, and local tilts are local. Also supply the explicit tilt of the complete-regular tower used in CS24 proof of Theorem 3.1.3 and 6.2.7: the f-adic completion of k⟦(x^♭)^{1/p^∞}⟧ and its comparisons modulo parameter powers. Proposed owner: the pending PerfectoidQuotientsPartII design (#3362), importing the two existing P7 towers. The p-adic completion of A[1/a] in Corollary 2.1.6 already follows from Q0/completely-etale-and-henselian-perfectoid, so it is imported rather than requested again. Needed by `PurityForFlatCohomology:PF.4/flat-purity-complete-intersection`, `PurityForFlatCohomology:PF.4/flat-purity-regular`, `PurityForFlatCohomology:PF.3/product-valuation-local-analysis`, `PurityForFlatCohomology:PF.3/flat-side-arc-descent`, `PurityForFlatCohomology:PF.3/key-formula`.
- **`PurityForFlatCohomology/gap/EDP-PII-local-lefschetz`: The local Lefschetz theorem in étale cohomology (CS24 Lemma 3.2.3).** For a regular local ring R, f ∈ 𝔪 and a prime ℓ invertible in R, H^i\_𝔪(R, ℤ/ℓ) → H^i\_𝔪(R/(f), ℤ/ℓ) is bijective for i < dim R − 1 and injective for i = dim R − 1 (CS24 Lemma 3.2.3, p. 33, items 046–048), proved from Gabber's affine Lefschetz theorem (ILO XV 1.2.4), the dualizing complex (μ\_ℓ^{⊗d})[2d] on excellent regular local rings (ILO XVII 0.2, normalized by ILO XVI 3.1.1) and local duality (SGA 5 I). Owner: the pending design DESIGN-EtaleDualityAndPerverseSheavesPartII (issue #3363; route EtaleDualityAbsolutePurityPartII). Its absolute-purity input is already planned upstream (LefschetzPencilsAndVanishingCycles §0.10). Needed by `PurityForFlatCohomology:PF.1/etale-depth-virtual-dimension`.
- **`PurityForFlatCohomology/gap/AVRAMOV`: Additivity of the complete-intersection defect (Avramov).** Avramov 1977, Proposition 3.6: the complete-intersection defect is additive along flat local homomorphisms of Noetherian local rings. No roadmap plans deviations of local rings; proposed owner: DeformationAndDerivedPatchingAlgebra (commutative algebra of complete intersections), requested from R03.3. The uses in this roadmap need only the separable-fibre and complete-intersection cases, which are planned without it. Needed by `PurityForFlatCohomology:PF.1/virtual-dimension-flat-additivity`.
- **`PurityForFlatCohomology/gap/BURCH-KOHN`: Three-generated ideals of maximal projective dimension (Burch, Kohn).** Every regular local ring R̃ of dimension ≥ 3 has a three-generated ideal I with pd(R̃/I) = dim R̃ (Burch 1968; Kohn 1972, Theorem A), cited by CS24 Remark 3.2.2. Proposed owner: DeformationAndDerivedPatchingAlgebra R03.3; only part (b) of the sharpness remark depends on it. Needed by `PurityForFlatCohomology:PF.1/depth-virtual-dimension-incomparable`.
- **`PurityForFlatCohomology/gap/BR-RESIDUE-LANG`: Vanishing of the Brauer group of the maximal unramified extension.** For a complete discretely valued field K with perfect residue field, Br(K^unr) = 0 (Lang: K^unr is C\_1), and for ℓ ≠ char k the ℓ-primary part vanishes for any residue field (Grothendieck, Brauer III, 1.3); Poonen pp. 196–197. Neither SchemeAndStackFoundations nor Tau Ceti's ClassFieldTheory states it beyond local fields; proposed owner: SchemeAndStackFoundationsPartII (Brauer layer). Needed by `PurityForFlatCohomology:PF.6/brauer-residue`.
- **`PurityForFlatCohomology/gap/BR-RESIDUE-DESCENT`: Descent of unramified Brauer classes from the completion of an arbitrary DVR.** For a DVR 𝒪 with fraction field K and residue k, and a prime ℓ invertible in k or equal to char k with k perfect, a class α ∈ Br(K)[ℓ^∞] extends to Br(𝒪) iff its pullback to Br(K̂) extends to Br(𝒪̂). This is the scheme-localization/unramified descent input behind Poonen Proposition 6.8.1, pp. 196–197 (citing Grothendieck Brauer III, Proposition 2.1). It is not the generally false assertion that Br(K)→Br(K̂) is an isomorphism. Proposed owner: SchemeAndStackFoundationsPartII, Brauer layer; the public Poonen statement verifies the desired result, while the original localization proof is not read here. Needed by `PurityForFlatCohomology:PF.6/dvr-brauer-residue-sequence`.
- **`PurityForFlatCohomology/gap/AUSLANDER-FREENESS`: Homological proof of Auslander's endomorphism freeness criterion.** Supply the homological argument for a finite reflexive module M over a regular local ring R with End\_R(M)≅M^{⊕r} to be free (Auslander, On the purity of the branch locus, Theorem 1.3, Amer. J. Math. 84 (1962), 116–125). CS24 p. 88 verifies the precise theorem used, but does not give its proof; the public JSTOR endpoint https://www.jstor.org/stable/2372807 did not serve the text during this review. The Auslander–Buchsbaum formula is available from PurityOfBranchLocus §0.3, but the missing homological step must not be labelled routine. Owner: PurityForFlatCohomology PF.5/auslander-endomorphism-freeness; a later refinement supplies this proof without planning the criterion in a second roadmap. Needed by `PurityForFlatCohomology:PF.5/auslander-endomorphism-freeness`.

## Targets, APIs and checks

Each numbered item is one target at the granularity of this blueprint. Its proof outline includes the nontrivial reductions, with imports or gaps named explicitly. API and test names are planned declarations in the stated namespace. The suggested Lean file states only what the pinned carriers allow; the other declarations and checks remain mathematical targets here. No implementation is claimed.

## Layer PF.0: Punctured spectra, flat cohomology with supports and Hartogs extension

Extend the existing LocalPurity local punctured spectrum to semilocal rings R, with fppf cohomology with supports H^i\_Z(X, F) for abelian sheaves on the big fppf site, with its long exact sequences, excision, Mayer–Vietoris, finite flat descent spectral sequence, limit formula and the étale local-to-global spectral sequence E\_2^{ij} = H^i\_ét(X, ℋ^j\_Z(−, F)) ⇒ H^{i+j}\_Z(X, F) (Česnavičius–Scholze Lemma 7.1.1). Prove that a weakly M-regular sequence a\_1, …, a\_d vanishing on Z kills H^i\_Z(Spec A, M\~) for i < d over any ring, and the non-Noetherian Hartogs lemma: regular elements (resp. regular pairs) in the local rings along Z give injectivity (resp. bijectivity) of Y(X) → Y(X ∖ Z) for separated (resp. X-affine) Y (Česnavičius–Scholze Lemma 7.2.7). Reuse SchemeAndStackFoundations §2.7 for the general derived-support formalism; include nested-support composition and continuity for a fixed support with qc complement.

Layer imports: `SchemeAndStackFoundations:SF.0`, `SchemeAndStackFoundations:SF.2`, `DeformationAndDerivedPatchingAlgebra:R03.3`.

### 0.1 The punctured spectrum of a semilocal ring

**Definition** (`PurityForFlatCohomology:PF.0/punctured-spectrum`; planet **Punctured spectrum**). For a semilocal commutative ring R (finitely many maximal ideals), the punctured spectrum U\_R is the open subscheme of Spec R obtained by removing all closed points: U\_R = Spec R ∖ V(J), where J is the Jacobson radical of R. For a local ring (R, 𝔪) this is Spec R ∖ {𝔪}. When R is Noetherian, U\_R is quasi-compact; for nonzero R it is empty exactly when R has Krull dimension 0. For the zero ring it is empty as well, but Mathlib assigns that ring dimension ⊥.

**Hypotheses and conventions.** R a commutative semilocal ring; quasi-compactness of U\_R is asserted only when R is Noetherian, or more generally when J is the radical of a finitely generated ideal. The closed points removed are all maximal ideals, so for a nonlocal semilocal ring U\_R is not the complement of one point. Ownership: LocalPurity §1.1 already owns IsLocalRing.puncturedSpectrum and its local basic-open/compactness API. This target adds the semilocal adapter and the finite-map/completion compatibilities; it imports the local carrier through the SF.0 supplier contract.

**Proof outline.**

1. Reuse LocalPurity §1.1 for local R. Extend to semilocal R by taking the complement of V(J), where J is the Jacobson radical; this removes all and only the finitely many maximal ideals. The local compatibility map identifies this open with the imported local punctured spectrum.
2. For R Noetherian, J is finitely generated, so Spec R ∖ V(J) is a finite union of principal opens D(f\_i) and is quasi-compact.
3. For nonzero semilocal R, U\_R is empty iff every prime is maximal, equivalently ringKrullDim R = 0. Treat the zero ring separately: its spectrum is empty and its dimension is ⊥.

**API.**

- `TauCetiRoadmap.PurityForFlatCohomology.puncturedSpectrum` (constructor): For R semilocal, the open subscheme U\_R ⊂ Spec R, as an object of Mathlib's Scheme with its open immersion ι\_R : U\_R → Spec R.
- `TauCetiRoadmap.PurityForFlatCohomology.puncturedSpectrum_carrier` (characterisation): A point of Spec R lies in U\_R iff it is not a maximal ideal; for R local iff it differs from IsLocalRing.closedPoint R.
- `TauCetiRoadmap.PurityForFlatCohomology.puncturedSpectrum_isCompact` (other): For R Noetherian semilocal, U\_R is quasi-compact, and the open immersion ι\_R is quasi-compact.
- `TauCetiRoadmap.PurityForFlatCohomology.puncturedSpectrum_eq_empty_iff` (characterisation): For R semilocal and nonzero, U\_R = ∅ iff ringKrullDim R = 0.
- `TauCetiRoadmap.PurityForFlatCohomology.puncturedSpectrum_baseChange_of_finite` (functoriality): For a finite ring map R → R' with R semilocal, R' is semilocal, the maximal ideals of R' are those over maximal ideals of R, and U\_{R'} = U\_R ×\_{Spec R} Spec R'.
- `TauCetiRoadmap.PurityForFlatCohomology.puncturedSpectrum_completion` (functoriality): For R Noetherian local with completion R̂, U\_{R̂} = U\_R ×\_{Spec R} Spec R̂, and similarly for the henselization and strict henselization.
- `TauCetiRoadmap.PurityForFlatCohomology.puncturedSpectrum_sections_of_depth` (relation): For R Noetherian local of depth ≥ 2 the restriction R = Γ(Spec R, 𝒪) → Γ(U\_R, 𝒪) is bijective (SchemeAndStackFoundations §0.6, coherent\_hartogs).
- `TauCetiRoadmap.PurityForFlatCohomology.puncturedSpectrum_dvr` (example): For a discrete valuation ring R with fraction field K, U\_R = Spec K.

**Definition/construction tests.**

- `TauCetiRoadmap.PurityForFlatCohomology.puncturedSpectrum_field` (degenerate): For a field K, U\_K is empty.
- `TauCetiRoadmap.PurityForFlatCohomology.puncturedSpectrum_dvr_eq` (computation): For a DVR R with uniformizer π and fraction field K, U\_R = Spec K and Γ(U\_R, 𝒪) = R[1/π] ≠ R. In particular π = p for ℤ\_p and π = t for k⟦t⟧; the depth-two hypothesis of Hartogs is needed.
- `TauCetiRoadmap.PurityForFlatCohomology.puncturedSpectrum_plane_sections` (computation): For R = k⟦x, y⟧, U\_R is the union D(x) ∪ D(y), is not affine, and Γ(U\_R, 𝒪) = R.
- `TauCetiRoadmap.PurityForFlatCohomology.puncturedSpectrum_semilocal_product` (non-example): For R = k × k (two closed points) U\_R = ∅; removing only one closed point would leave Spec k, so the semilocal definition is not the complement of a single point.
- `TauCetiRoadmap.PurityForFlatCohomology.puncturedSpectrum_local_compat` (compatibility): For R local, the underlying set of U\_R is the complement of Mathlib's IsLocalRing.closedPoint R in PrimeSpectrum R.
- `TauCetiRoadmap.PurityForFlatCohomology.puncturedSpectrum_zero` (degenerate): For the zero ring, U\_R = ∅ but ringKrullDim R = ⊥, so the dimension-zero equivalence requires R nonzero.

**Checks.**

- U\_R is empty for a field and equals Spec K for a DVR with fraction field K.
- For k⟦x, y⟧, U\_R is quasi-compact, not affine, with Γ(U\_R, 𝒪) = k⟦x, y⟧.

**Uses.** CS24 Theorems 3.3.1, 7.2.1, 7.2.5, 7.2.8: every local purity statement compares Spec R with U\_R. C19 Theorem 5.3 and Corollaries 2.4–2.5: H²(U\_R, 𝔾\_m) and the identity V\_{R'} = U\_{R'} for finite R → R'. Lemma 4.1.12 of CS24: the closed points of R' ⊗\_R ⋯ ⊗\_R R' lie over 𝔪.

**Sources.**

- `C19`, §1.5 Notation and conventions, p. 3: The punctured spectrum of a semilocal ring is defined there as the complement of all closed points; in the local case it is the complement of the maximal ideal.
- `CS24`, Theorem 1.1.3, p. 3; Theorem 3.3.1, p. 34: U\_R = Spec(R) ∖ {𝔪} for Noetherian local R is the open on which the statements about local Picard groups, local Brauer groups and finite étale covers are phrased; the flat purity theorems themselves are phrased through H^i\_𝔪(R, G).
- `TCR-LocalPurity`, §1.1, The punctured spectrum and purity for a local ring: Owns the local open IsLocalRing.puncturedSpectrum, its basic-open cover and compactness API; the semilocal adapter here must agree with it.

**Needs.** `mathlib:AlgebraicGeometry.Scheme`, `mathlib:IsLocalRing.closedPoint`, `mathlib:ringKrullDim`, `SchemeAndStackFoundations:SF.0`.

**Used by.** `PurityForFlatCohomology:PF.0/flat-cohomology-with-supports`, `PurityForFlatCohomology:PF.0/hartogs-regular-sequence`, `PurityForFlatCohomology:PF.1/zariski-nagata-virtual-dimension`, `PurityForFlatCohomology:PF.5/torsor-gerbe-purity`, `PurityForFlatCohomology:PF.5/parafactorial-local-ring`, `PurityForFlatCohomology:PF.5/local-picard-torsion-vanishing`, `PurityForFlatCohomology:PF.5/cohen-macaulay-counterexample`, `PurityForFlatCohomology:PF.5/regular-dimension-two-extension`, `PurityForFlatCohomology:PF.5/brauer-purity-sharpness`, `PurityForFlatCohomology:PF.6/henselian-torus-punctured-vanishing`.

**Proposed location.** `TauCeti/AlgebraicGeometry/Purity/PuncturedSpectrum.lean`, namespace `TauCetiRoadmap.PurityForFlatCohomology`. Implementation status: unchecked.

### 0.2 Flat cohomology with supports and its local-to-global spectral sequence

**Construction** (`PurityForFlatCohomology:PF.0/flat-cohomology-with-supports`; planet **Flat cohomology with supports**). Let X be a scheme, Z ⊂ X a closed subset with open complement j : U = X ∖ Z → X, and F an abelian sheaf on the big fppf site of X (for instance a commutative group scheme over X, finite locally free or smooth or of multiplicative type, or the sheaf 𝒢^a attached to a quasi-coherent 𝒪\_X-module 𝒢). Define RΓ\_Z(X, F) as the fibre of restriction RΓ\_fppf(X, F) → RΓ\_fppf(U, F) and H^i\_Z(X, F) as its cohomology; equivalently H^i\_Z(X, −) are the right derived functors of Γ\_Z(X, F) = ker(F(X) → F(U)) on fppf abelian sheaves. Writing ℋ^j\_Z(−, F) for the étale sheafification of X' ↦ H^j\_{Z×\_X X'}(X', F) on X\_ét, there is a spectral sequence E\_2^{ij} = H^i\_ét(X, ℋ^j\_Z(−, F)) ⇒ H^{i+j}\_Z(X, F). When U → X is quasi-compact and F is a finitely presented commutative group scheme (or 𝒢^a with 𝒢 quasi-coherent), the stalk of ℋ^j\_Z(−, F) at a geometric point x̄ is H^j\_{Z\_x̄}(Spec 𝒪^sh\_{X,x̄}, F) with Z\_x̄ = Z ×\_X Spec 𝒪^sh\_{X,x̄}.

**Hypotheses and conventions.** X any scheme; Z closed; F an abelian fppf sheaf on the big fppf site of X (Mathlib's AlgebraicGeometry.Scheme.fppfTopology restricted to schemes over X). The stalk formula for ℋ^j\_Z requires U → X quasi-compact and F locally of finite presentation; without quasi-compactness only the colimit over étale neighbourhoods is asserted. Ownership: SchemeAndStackFoundations §2.7 supplies the derived-support formalism. This target specializes it to the big fppf site and adds the étale local-to-global/stalk comparison, descent and continuity interfaces used here.

**Proof outline.**

1. Define RΓ\_Z as the fibre of restriction, using SchemeAndStackFoundations §§2.1–2.2 for cohomology on sites and pullback along U → X; Γ\_Z is left exact and injective fppf sheaves restrict to injectives on U, which identifies the fibre with the derived functors of Γ\_Z.
2. The long exact sequence of the pair, excision (H^i\_Z(X, F) ≅ H^i\_Z(V, F) for an open V ⊃ Z, and H^i\_Z(X, F) ≅ H^i\_{Z'}(X', F) for an étale X' → X inducing Z' = Z ×\_X X' ≅ Z) and the triple sequence for Z' ⊂ Z follow from the fibre description and from the Čech sequence for the fppf (in fact étale) covering {U, X'} of X (SchemeAndStackFoundations §2.2).
3. The local-to-global spectral sequence is the Leray spectral sequence of the composite of RΓ\_ét(X, −) with the étale-sheafified local functor RℋZ; this is SGA 4 V 6.4 in the étale case and Bouthier–Česnavičius, Lemma 2.3.2 in the fppf case, cited in CS24 Lemma 7.1.1.
4. The stalk formula follows by writing Spec 𝒪^sh\_{X,x̄} as the limit of affine étale neighbourhoods and using that fppf cohomology of a finitely presented group commutes with such limits on quasi-compact quasi-separated schemes; quasi-compactness of U → X makes U ×\_X Spec 𝒪^sh\_{X,x̄} the limit of the U ×\_X X'.
5. For smooth commutative G and for quasi-coherent 𝒢 the comparisons with étale and with Zariski cohomology with supports follow from SchemeAndStackFoundations §2.10 (smoothGroup\_fppf\_etale\_comparison, quasiCoherent\_topology\_comparison) and the five lemma.
6. For nested supports, use ℋ\_Z ℋ\_W = ℋ\_Z on injectives and preservation of injective/acyclic objects by the sheaf-support functor. This is the support localization formalism of SchemeAndStackFoundations §2.7, specialized to the chosen site; it does not identify non-Noetherian geometric supports with the native colimit-of-Ext module functor.

**API.**

- `TauCetiRoadmap.PurityForFlatCohomology.flatCohomologyWithSupports` (constructor): H^i\_Z(X, F) for X a scheme, Z closed, F an abelian fppf sheaf; the complex RΓ\_Z(X, F) in the derived category of abelian groups.
- `TauCetiRoadmap.PurityForFlatCohomology.flatCohomologyWithSupports_les` (relation): The long exact sequence … → H^i\_Z(X, F) → H^i(X, F) → H^i(X ∖ Z, F) → H^{i+1}\_Z(X, F) → …, natural in (X, Z, F).
- `TauCetiRoadmap.PurityForFlatCohomology.flatCohomologyWithSupports_zero` (characterisation): H^0\_Z(X, F) = ker(F(X) → F(X ∖ Z)), the sections supported in Z.
- `TauCetiRoadmap.PurityForFlatCohomology.flatCohomologyWithSupports_excision_open` (other): For an open V ⊂ X containing Z, restriction H^i\_Z(X, F) → H^i\_Z(V, F) is bijective.
- `TauCetiRoadmap.PurityForFlatCohomology.flatCohomologyWithSupports_excision_etale` (other): For an étale X' → X inducing an isomorphism Z ×\_X X' → Z of reduced closed subschemes, H^i\_Z(X, F) ≅ H^i\_{Z'}(X', F).
- `TauCetiRoadmap.PurityForFlatCohomology.flatCohomologyWithSupports_triple` (relation): For closed Z' ⊂ Z ⊂ X, the long exact sequence H^i\_{Z'}(X, F) → H^i\_Z(X, F) → H^i\_{Z∖Z'}(X ∖ Z', F) → H^{i+1}\_{Z'}(X, F).
- `TauCetiRoadmap.PurityForFlatCohomology.flatCohomologyWithSupports_localToGlobal` (relation): The spectral sequence E\_2^{ij} = H^i\_ét(X, ℋ^j\_Z(−, F)) ⇒ H^{i+j}\_Z(X, F) (CS24 Lemma 7.1.1), with the strict-henselization stalk formula under quasi-compactness of X ∖ Z → X.
- `TauCetiRoadmap.PurityForFlatCohomology.flatCohomologyWithSupports_mayerVietoris` (relation): For X = V\_1 ∪ V\_2 open, the Mayer–Vietoris sequence … → H^i(V\_1 ∪ V\_2, F) → H^i(V\_1, F) ⊕ H^i(V\_2, F) → H^i(V\_1 ∩ V\_2, F) → H^{i+1}(V\_1 ∪ V\_2, F) → … (the Čech-to-derived spectral sequence of SchemeAndStackFoundations §2.2 for the two-element cover).
- `TauCetiRoadmap.PurityForFlatCohomology.flatCohomologyWithSupports_finiteFlatDescent` (relation): For a finite faithfully flat local homomorphism R → R′ and G commutative finite locally free over R, fppf descent gives E\_1^{s,t} = H^t\_{Z\_s}(Spec((R′)^{⊗\_R(s+1)}), G) ⇒ H^{s+t}\_𝔪(R, G), with Z\_s the inverse image of the closed point. The tensor powers may be semilocal; their supports are all points over 𝔪.
- `TauCetiRoadmap.PurityForFlatCohomology.flatCohomologyWithSupports_etale_comparison` (compatibility): For F a smooth commutative group scheme over X, H^i\_Z(X, F) agrees with étale cohomology with supports (SchemeAndStackFoundations §2.10).
- `TauCetiRoadmap.PurityForFlatCohomology.flatCohomologyWithSupports_quasiCoherent` (compatibility): For 𝒢 quasi-coherent, H^i\_Z(X, 𝒢^a) agrees with Zariski cohomology with supports; for X = Spec A Noetherian, Z = V(I) and 𝒢 = M\~ it is Mathlib's (localCohomology I i).obj M (SchemeAndStackFoundations §§2.7, 2.10).
- `TauCetiRoadmap.PurityForFlatCohomology.flatCohomologyWithSupports_limit` (other): Let X = lim X\_λ be a cofiltered limit of qcqs schemes with affine transition maps, let Z\_0 ⊂ X\_0 be closed with quasi-compact open complement, and set Z\_λ = Z\_0 ×\_{X\_0} X\_λ and Z = Z\_0 ×\_{X\_0} X. For a finitely presented commutative group scheme G over X\_0, colim\_λ H^i\_{Z\_λ}(X\_λ, G) ≅ H^i\_Z(X, G). The fixed support and quasi-compact complement are part of the hypothesis.
- `TauCetiRoadmap.PurityForFlatCohomology.flatCohomologyWithSupports_nested` (relation): For closed Z ⊂ W ⊂ X, the derived sheaf-support functors satisfy Rℋ\_Z(Rℋ\_W(F)) ≅ Rℋ\_Z(F), naturally in F. In particular, if ℋ^j\_W(F) = 0 for j < d, then ℋ^j\_Z(F) = 0 for j < d, since Rℋ\_Z preserves lower cohomological bounds.

**Definition/construction tests.**

- `TauCetiRoadmap.PurityForFlatCohomology.flatCohomologyWithSupports_empty` (degenerate): For Z = ∅, H^i\_Z(X, F) = 0 for every i.
- `TauCetiRoadmap.PurityForFlatCohomology.flatCohomologyWithSupports_all` (degenerate): For Z = X, H^i\_Z(X, F) = H^i\_fppf(X, F).
- `TauCetiRoadmap.PurityForFlatCohomology.flatCohomologyWithSupports_dvr_Gm` (computation): For a discrete valuation ring R with fraction field K and Z the closed point, H^0\_Z(R, 𝔾\_m) = 0 and H^1\_Z(R, 𝔾\_m) ≅ K^×/R^× ≅ ℤ via the valuation (from H^1(R, 𝔾\_m) = Pic R = 0).
- `TauCetiRoadmap.PurityForFlatCohomology.flatCohomologyWithSupports_Ga_compat` (compatibility): For A Noetherian, I an ideal, Z = V(I): H^i\_Z(Spec A, 𝔾\_a) ≅ (localCohomology I i).obj A as A-modules; for A = k[t] and I = (t): H^1 ≅ k[t, t^{-1}]/k[t].
- `TauCetiRoadmap.PurityForFlatCohomology.flatCohomologyWithSupports_not_restriction` (non-example): H^0\_Z(X, F) is not F(Z): for X = 𝔸^1\_k, Z = {0} and F = 𝔾\_a, H^0\_Z = 0 while 𝔾\_a(Z) = k.

**Checks.**

- H^i\_∅ = 0 and H^i\_X(X, F) = H^i(X, F).
- For a DVR and 𝔾\_m: H^1\_𝔪(R, 𝔾\_m) ≅ ℤ by the valuation.
- For quasi-coherent coefficients on a Noetherian affine scheme it is Mathlib's localCohomology.

**Uses.** CS24 Theorems 3.2.4, 6.1.1, 6.2.3, 7.1.2: all purity statements are vanishing of H^i\_𝔪(R, G) or H^i\_Z(X, G). CS24 Lemma 4.1.12: descent spectral sequence for a finite flat local cover. CS24 proofs of Theorems 7.1.2 and 7.2.8, C19 Theorem 6.1: local-to-global reduction to strict henselizations and Mayer–Vietoris shrinking of Z. C19 Theorem 6.2: Mayer–Vietoris for two opens.

**Sources.**

- `CS24`, Lemma 7.1.1, p. 86; Section 1.4, p. 8 (fppf convention): The local-to-global spectral sequence for fppf cohomology with supports with étale-sheafified local terms, and the convention that cohomology is fppf with étale or Zariski identifications made implicitly.
- `C19`, Proof of Theorem 6.1, p. 13: The exact sequence of cohomology with supports for X' étale over X, the local-to-global spectral sequence, and the identification of stalks of the local sheaves with cohomology with supports of strict henselizations by a limit argument when X ∖ Z → X is quasi-compact.
- `BC22`, Lemma 2.3.2 and its proof, p. 27: Directly read: the fppf support local-to-global spectral sequence is obtained by étale-sheafifying local supported cohomology; injective fppf sheaves give the needed acyclicity.

**Needs.** `mathlib:AlgebraicGeometry.Scheme.fppfTopology`, `mathlib:CategoryTheory.Sheaf.H`, `mathlib:localCohomology`, `SchemeAndStackFoundations:SF.2`, `PurityForFlatCohomology:PF.0/punctured-spectrum`.

**Used by.** `PurityForFlatCohomology:PF.0/regular-sequence-support-vanishing`, `PurityForFlatCohomology:PF.1/etale-depth-virtual-dimension`, `PurityForFlatCohomology:PF.2/additive-group-depth-vanishing`, `PurityForFlatCohomology:PF.2/root-extraction-comparison`, `PurityForFlatCohomology:PF.2/finite-flat-cover-reduction`, `PurityForFlatCohomology:PF.2/char-p-complete-intersection-purity`, `PurityForFlatCohomology:PF.3/dieudonne-side-complex`, `PurityForFlatCohomology:PF.3/perfectoid-low-degree-cohomology`, `PurityForFlatCohomology:PF.3/dieudonne-side-arc-descent`, `PurityForFlatCohomology:PF.3/flat-side-arc-descent`, `PurityForFlatCohomology:PF.4/flat-purity-complete-intersection`, `PurityForFlatCohomology:PF.4/virtual-dimension-flat-counterexample`, `PurityForFlatCohomology:PF.4/flat-purity-regular`, `PurityForFlatCohomology:PF.5/global-flat-purity`, `PurityForFlatCohomology:PF.5/multiplicative-type-purity-low-degree`, `PurityForFlatCohomology:PF.5/multiplicative-type-purity-higher`, `PurityForFlatCohomology:PF.6/strict-local-brauer-purity`, `PurityForFlatCohomology:PF.6/coniveau-spectral-sequence`, `PurityForFlatCohomology:PF.6/torus-low-support-vanishing`, `PurityForFlatCohomology:PF.6/torus-purity`, `PurityForFlatCohomology:PF.6/codimension-one-torus-intersection`, `PurityForFlatCohomology:PF.6/norm-torus-counterexample`.

**Proposed location.** `TauCeti/AlgebraicGeometry/Purity/Supports.lean`, namespace `TauCetiRoadmap.PurityForFlatCohomology`. Implementation status: unchecked.

### 0.3 Regular sequences force vanishing of cohomology with supports

**Theorem** (`PurityForFlatCohomology:PF.0/regular-sequence-support-vanishing`). Let A be a commutative ring, M an A-module, Z ⊂ Spec A a closed subset and a\_1, …, a\_d ∈ A a weakly M-regular sequence each of whose members vanishes on Z. Then H^i\_Z(Spec A, M\~) = 0 for i < d. Consequently, if M admits a resolution 0 → P\_1 → P\_0 → M → 0 by A-modules P\_k for which a\_1, …, a\_{d+1} is weakly regular (for instance P\_k finite projective and a\_1, …, a\_{d+1} weakly A-regular vanishing on Z), then H^i\_Z(Spec A, M\~) = 0 for i < d.

**Hypotheses and conventions.** No Noetherian hypothesis: A arbitrary, M arbitrary; weakly regular means each a\_k is a nonzerodivisor on M/(a\_1, …, a\_{k−1})M, with no nonvanishing condition on the last quotient (EGA convention used by CS24 §1.4). Cohomology with supports is Zariski cohomology of M\~, equal to fppf cohomology with supports of the associated sheaf by PF.0/flat-cohomology-with-supports.

**Proof outline.**

1. Put W = V(a\_1, …, a\_d), so Z ⊂ W. The finite principal-open cover of Spec A ∖ W computes supported cohomology by the augmented Čech complex, equivalently the filtered colimit of the Koszul cochain complexes for (a\_1^n, …, a\_d^n). Powers remain weakly M-regular, so these complexes have zero cohomology below degree d. This argument localizes on Spec A and gives ℋ^j\_W(M\~) = 0 for j < d.
2. Use the nested-support identity Rℋ\_Z Rℋ\_W(M\~) ≅ Rℋ\_Z(M\~) from PF.0. Left t-exactness gives the same lower bound for Z, even when Spec A ∖ Z is not quasi-compact. Taking derived global sections preserves this bound. No commutation of localization with cohomology on a non-qc complement is assumed.
3. For 0 → P\_1 → P\_0 → M → 0, use the support long exact sequence and vanishing for P\_0 and P\_1 below d + 1. Then both H^i\_Z(P\_0) and H^{i+1}\_Z(P\_1) vanish when i < d.

**Checks.**

- For A = k[x\_1, …, x\_d], M = A and Z the origin, the theorem gives H^i\_Z = 0 for i < d, and H^d\_Z(A) ≠ 0 shows the bound is sharp.
- For A = A\_inf(A₀) of a perfectoid A₀ with the regular sequence ξ, a\_1, …, a\_d, it gives the vanishing (6.1.2.1) of CS24 in degrees i < d + 1.
- The hypothesis that the a\_k vanish on Z cannot be dropped: for Z = Spec A and d ≥ 1, H^0\_Z(A) = A ≠ 0.

**Sources.**

- `CS24`, Proof of Proposition 4.1.13, p. 40; proof of Theorem 6.1.2, pp. 82–83: The decreasing induction along the quotients by initial segments of a regular sequence vanishing on Z, applied to W(R\_∞) and to A\_inf(A), together with the reduction from a module of projective dimension at most one to the free case.
- `CS24`, Example 4.1.10, p. 39: The cohomological characterisation of depth for Noetherian local rings, of which this is the non-Noetherian supported form.

**Needs.** `PurityForFlatCohomology:PF.0/flat-cohomology-with-supports`, `mathlib:RingTheory.Sequence.IsWeaklyRegular`, `mathlib:Localization.Away`, `DeformationAndDerivedPatchingAlgebra:R03.3`.

**Used by.** `PurityForFlatCohomology:PF.2/root-extraction-comparison`, `PurityForFlatCohomology:PF.2/char-p-complete-intersection-purity`, `PurityForFlatCohomology:PF.3/perfectoid-purity`.

**Proposed location.** `TauCeti/AlgebraicGeometry/Purity/PF0.lean`, namespace `TauCetiRoadmap.PurityForFlatCohomology`. Implementation status: unchecked.

### 0.4 Hartogs extension along closed subsets of large regular depth

**Theorem** (`PurityForFlatCohomology:PF.0/hartogs-regular-sequence`). Let X be a scheme and Z ⊂ X a closed subset. (a) If for every z ∈ Z the maximal ideal 𝔪\_{X,z} contains an 𝒪\_{X,z}-regular element, then Y(X) → Y(X ∖ Z) is injective for every separated X-scheme Y. (b) If for every z ∈ Z the maximal ideal 𝔪\_{X,z} contains an 𝒪\_{X,z}-regular sequence of length 2, then Y(X) → Y(X ∖ Z) is bijective for every X-affine X-scheme Y; in particular Γ(X, 𝒪\_X) → Γ(X ∖ Z, 𝒪\_X) is bijective.

**Hypotheses and conventions.** X arbitrary (not necessarily Noetherian or locally Noetherian); for Noetherian local rings the hypotheses say depth ≥ 1, respectively ≥ 2, at every point of Z. Y separated in (a); Y affine over X in (b).

**Proof outline.**

1. (a) The diagonal of Y is a closed immersion, so it suffices that no nonzero local section f of 𝒪\_X vanishes off Z: if f vanished on a maximal open U ⊋ X ∖ Z with U ≠ X, take a generic point z of X ∖ U and an 𝒪\_{X,z}-regular m ∈ 𝔪\_{X,z}; then 𝒪\_{X,z} → 𝒪\_{X,z}[1/m] is injective and f dies in the target, a contradiction.
2. (b) Injectivity is (a). Working locally, embed Y into an affine space over X and reduce to Y = 𝔸^1\_X, i.e. to extending functions. Take the largest open U ⊃ X ∖ Z to which a given function extends; at a generic point z of X ∖ U a limit argument reduces to bijectivity of 𝒪\_{X,z} → Γ(Spec 𝒪\_{X,z} ∖ {z}, 𝒪).
3. For Noetherian 𝒪\_{X,z} this is EGA IV 5.10.5 (SchemeAndStackFoundations §0.6, coherent\_hartogs). In general, for an 𝒪\_{X,z}-regular pair m\_1, m\_2, the Čech complex 𝒪 → 𝒪[1/m\_1] ⊕ 𝒪[1/m\_2] → 𝒪[1/(m\_1m\_2)] is the filtered colimit of the Koszul complexes K(m\_1^n, m\_2^n) (Stacks 0913), whose first homology vanishes because m\_1^n, m\_2^n is again regular (Stacks 07DV).

**Checks.**

- For X = Spec k[x, y] and Z the origin, (b) gives Γ(X ∖ Z, 𝒪) = k[x, y].
- For Z = V(x) ⊂ 𝔸^2 (no regular sequence of length two at the generic point of Z), Γ(𝔸^2 ∖ Z, 𝒪) = k[x^{±1}, y] ≠ k[x, y]: the length-two hypothesis is necessary.
- Separatedness is needed in (a): two sections of the affine line with doubled origin over 𝔸^1 that agree off the origin need not agree.

**Sources.**

- `CS24`, Lemma 7.2.7 and its proof, pp. 90–91: Injectivity for separated targets under a regular element at each point of Z, and bijectivity for X-affine targets under a regular sequence of length two, proved through the Koszul description of the Čech complex of two localizations.
- `C19`, §2.4 via EGA IV₂ 5.10.5, used in the proof of Corollary 2.4, p. 5: The Noetherian depth-two case Γ(Spec R, 𝒪) ≅ Γ(U\_R, 𝒪) used to verify hypothesis (1) of Propositions 2.2–2.3.

**Needs.** `PurityForFlatCohomology:PF.0/punctured-spectrum`, `SchemeAndStackFoundations:SF.0`, `mathlib:RingTheory.Sequence.IsWeaklyRegular`, `mathlib:Localization.Away`, `DeformationAndDerivedPatchingAlgebra:R03.3`.

**Used by.** `PurityForFlatCohomology:PF.5/torsor-gerbe-purity`, `PurityForFlatCohomology:PF.5/multiplicative-type-purity-low-degree`, `PurityForFlatCohomology:PF.6/torus-low-support-vanishing`.

**Proposed location.** `TauCeti/AlgebraicGeometry/Purity/PF0.lean`, namespace `TauCetiRoadmap.PurityForFlatCohomology`. Implementation status: unchecked.

## Layer PF.1: Virtual dimension, étale depth and Zariski–Nagata purity

Define the virtual dimension vdim(R) = dim R̃ − μ(I) of a Noetherian local ring with R̂ ≅ R̃/I (SGA 2 XIV 5.2–5.5): independence of the presentation, vdim ≤ dim with equality exactly for complete intersections, invariance under completion, henselization and strict henselization, additivity along flat local maps (Avramov), and its incomparability with depth. Prove Gabber's bound H^i\_𝔪(R, G) = 0 for i < vdim(R) for finite étale G of invertible order (Česnavičius–Scholze Theorem 3.2.4) from absolute purity and the local Lefschetz theorem, and Zariski–Nagata purity for finite étale covers of U\_R when vdim(R) ≥ 2 (full faithfulness) and vdim(R) ≥ 3 (equivalence, π\_1^ét(U\_R) ≅ π\_1^ét(R)) (Theorem 3.3.1).

Layer imports: `PurityForFlatCohomology:PF.0`, `DeformationAndDerivedPatchingAlgebra:R03.1`, `DeformationAndDerivedPatchingAlgebra:R03.3`, `ArcTopologyAndDescent:AT.8`, `LefschetzPencilsAndVanishingCycles:LPV.0`, `SchemeAndStackFoundations:SF.0`, `SchemeAndStackFoundations:SF.4`, `InverseGaloisAndArithmeticFundamentalGroups:IG.0`.

### 1.1 The virtual dimension of a Noetherian local ring

**Definition** (`PurityForFlatCohomology:PF.1/virtual-dimension`; planet **Virtual dimension**). Let (R, 𝔪) be a Noetherian local ring with residue field k. By the Cohen structure theorem the 𝔪-adic completion is R̂ ≅ R̃/I for a complete regular local ring R̃ and an ideal I. The virtual dimension is vdim(R) = dim(R̃) − μ(I) ∈ ℤ, where μ(I) = dim\_k(I ⊗\_{R̃} k) is the minimal number of generators of I. It does not depend on the presentation (SGA 2 XIV 5.2), and for any surjection B → R̂ from a regular local ring B with kernel J, vdim(R) = dim B − μ(J). Grothendieck calls this number the geometric depth of R.

**Hypotheses and conventions.** R Noetherian local; vdim takes values in ℤ and may be negative. μ(I) is the minimal number of generators, Mathlib's Submodule.spanFinrank of I; dimensions are Krull dimensions (ringKrullDim).

**Proof outline.**

1. Existence of a presentation: Cohen's theorem (DeformationAndDerivedPatchingAlgebra R03.1/cohen-structure-and-compatible-coefficients).
2. Independence (SGA 2 XIV 5.2): if B → B' → R̂ is a factorisation through surjections of regular local rings with J = ker(B → B'), then J is generated by part of a regular system of parameters, dim B' = dim B − μ(J), and 0 → J ⊗ k → I ⊗ k → I' ⊗ k → 0 is exact; two arbitrary presentations are dominated by a third, a power series ring over a Cohen ring mapping onto both.
3. Comparison with dim: dim R̂ ≥ dim R̃ − μ(I) by Krull's height theorem, with equality iff a minimal generating set of I is part of a system of parameters of R̃, iff it is a regular sequence (R̃ is Cohen–Macaulay), iff R is a complete intersection (SGA 2 XIV 5.4); being cut out by a regular sequence does not depend on the regular local presentation (Stacks 09Q1; DeformationAndDerivedPatchingAlgebra §3.4, requested from R03.3).
4. Flat base change with separable residue fibre (SGA 2 XIV 5.5): for a flat local R → R' with R'/𝔪R' a separable field extension of k, a presentation of R̂ lifts to a presentation of R̂' with the same μ, so vdim(R') = vdim(R); this covers the henselization and the strict henselization.

**API.**

- `TauCetiRoadmap.PurityForFlatCohomology.virtualDimension` (constructor): vdim(R) ∈ ℤ for R Noetherian local, defined through any Cohen presentation of R̂.
- `TauCetiRoadmap.PurityForFlatCohomology.virtualDimension_eq_of_presentation` (characterisation): For a surjection B → R̂ (or B → R) from a regular local ring B with kernel J, vdim(R) = dim B − spanFinrank J.
- `TauCetiRoadmap.PurityForFlatCohomology.virtualDimension_le_dim` (relation): vdim(R) ≤ dim R, with equality iff R is a complete intersection in the sense of DeformationAndDerivedPatchingAlgebra R03.3.
- `TauCetiRoadmap.PurityForFlatCohomology.virtualDimension_completion` (compatibility): vdim(R̂) = vdim(R); likewise for the henselization R^h.
- `TauCetiRoadmap.PurityForFlatCohomology.virtualDimension_flat_separable` (functoriality): For a flat local homomorphism R → R' of Noetherian local rings whose closed fibre is a separable field extension of k, vdim(R') = vdim(R); in particular vdim(R^sh) = vdim(R).
- `TauCetiRoadmap.PurityForFlatCohomology.virtualDimension_quotient` (relation): For f\_1, …, f\_r ∈ 𝔪, vdim(R/(f\_1, …, f\_r)) ≥ vdim(R) − r.
- `TauCetiRoadmap.PurityForFlatCohomology.virtualDimension_regular` (example): For R regular local, vdim(R) = dim R.

**Definition/construction tests.**

- `TauCetiRoadmap.PurityForFlatCohomology.virtualDimension_powerSeries` (computation): vdim(k⟦x\_1, …, x\_n⟧) = n.
- `TauCetiRoadmap.PurityForFlatCohomology.virtualDimension_node` (computation): vdim(k⟦x, y⟧/(xy)) = 1 = dim, a complete intersection.
- `TauCetiRoadmap.PurityForFlatCohomology.virtualDimension_fatPoint` (non-example): For R = k⟦x, y⟧/(x, y)^2, μ((x, y)^2) = 3, so vdim(R) = −1 while dim R = 0: vdim is not the dimension and can be negative.
- `TauCetiRoadmap.PurityForFlatCohomology.virtualDimension_remark626` (computation): For R = 𝔽\_p⟦x, y, z, t⟧/(x^2, y^2, xz − yt), vdim(R) = 4 − 3 = 1 while dim R = 2, so R is not a complete intersection.
- `TauCetiRoadmap.PurityForFlatCohomology.virtualDimension_redundant_presentation` (degenerate): Presenting k⟦x⟧ as k⟦x, y⟧/(y) gives 2 − 1 = 1 = vdim(k⟦x⟧): the value does not depend on the presentation.

**Checks.**

- vdim(k⟦x\_1, …, x\_n⟧) = n; vdim(k⟦x, y⟧/(x, y)^2) = −1.
- vdim(R) = dim R exactly for complete intersections.

**Uses.** CS24 Theorem 3.2.4 and Theorem 6.2.4: the étale depth is at least vdim(R). CS24 Theorem 3.3.1: purity for the fundamental group when vdim ≥ 3. CS24 proof of Theorem 3.2.4: vdim(R\_\*) ≥ vdim(R) + 1 for the rings R\_1, R\_2, R\_12 obtained by dropping one equation, and vdim(R^sh) = vdim(R). CS24 proof of Lemma 4.1.12: dimension and complete-intersection property of the local rings of R' ⊗\_R ⋯ ⊗\_R R'.

**Sources.**

- `CS24`, Paragraph 3.2.1, p. 32, equations (3.2.1.1)–(3.2.1.3): The virtual dimension is dim(R̃) minus the minimal number of generators of I for a Cohen presentation of the completion; it is independent of the presentation, bounded by dim R with equality exactly for complete intersections, and invariant under completion, henselization and strict henselization.
- `SGA2`, Exposé XIV, Proposition 5.2 and Définition 5.3, pp. 198–200; Propositions 5.4–5.5, p. 200: Independence of dim B − μ(I) from the regular presentation, the definition as geometric depth, the inequality with dim and the complete-intersection case of equality, and invariance under flat local maps whose closed fibre is a separable field extension.

**Needs.** `DeformationAndDerivedPatchingAlgebra:R03.1/cohen-structure-and-compatible-coefficients`, `DeformationAndDerivedPatchingAlgebra:R03.3/complete-intersections`, `DeformationAndDerivedPatchingAlgebra:R03.3`, `mathlib:IsRegularLocalRing`, `mathlib:Submodule.spanFinrank`, `mathlib:ringKrullDim`, `mathlib:AdicCompletion`.

**Used by.** `PurityForFlatCohomology:PF.1/virtual-dimension-flat-additivity`, `PurityForFlatCohomology:PF.1/depth-virtual-dimension-incomparable`, `PurityForFlatCohomology:PF.1/etale-depth-virtual-dimension`, `PurityForFlatCohomology:PF.1/zariski-nagata-virtual-dimension`, `PurityForFlatCohomology:PF.2/finite-flat-cover-reduction`, `PurityForFlatCohomology:PF.4/flat-purity-complete-intersection`, `PurityForFlatCohomology:PF.4/etale-purity-virtual-dimension`, `PurityForFlatCohomology:PF.4/virtual-dimension-flat-counterexample`.

**Proposed location.** `TauCeti/RingTheory/VirtualDimension.lean`, namespace `TauCetiRoadmap.PurityForFlatCohomology`. Implementation status: unchecked.

### 1.2 Additivity of the virtual dimension along flat local maps

**Theorem** (`PurityForFlatCohomology:PF.1/virtual-dimension-flat-additivity`). For a flat local homomorphism R → R' of Noetherian local rings with maximal ideal 𝔪 of R, vdim(R') = vdim(R) + vdim(R'/𝔪R'). Equivalently, the complete-intersection defect cid = dim − vdim is additive: cid(R') = cid(R) + cid(R'/𝔪R').

**Hypotheses and conventions.** R → R' flat and local; R and R' Noetherian; the closed fibre R'/𝔪R' is a Noetherian local ring with its own virtual dimension.

**Proof outline.**

1. Dimension is additive along flat local maps (EGA IV 6.1.2), so the two formulations are equivalent.
2. Avramov proves additivity of the complete-intersection defect (Avramov 1977, Proposition 3.6 with equations (3.2.1)–(3.2.2)) through the second deviation of the minimal model of the residue field; this input is recorded as a gap.
3. Special cases planned without the gap: when the closed fibre is a separable field extension, this is PF.1/virtual-dimension (API virtualDimension\_flat\_separable); when R and the fibre are complete intersections, R' is a complete intersection by the flat-local criterion of DeformationAndDerivedPatchingAlgebra §3.4, which gives the formula in the form used by CS24 Lemma 4.1.12.

**Checks.**

- For R → R^sh the fibre is a separable field and the formula reads vdim(R^sh) = vdim(R).
- For R = k⟦x⟧ → R' = k⟦x, y⟧/(y^2) (flat, fibre k[y]/(y^2) with vdim 0) both sides equal 1.
- For a flat map with fibre k⟦y, z⟧/(y, z)^2 (vdim −1), vdim drops by one although dim is unchanged.

**Sources.**

- `CS24`, Paragraph 3.2.1, p. 32, equation (3.2.1.3) and the sentence after it, p. 33: Additivity of vdim along flat local maps, deduced from Avramov's additivity of the complete-intersection defect and the additivity of dimension.
- `Avr77`, Proposition 3.6 and equations (3.2.1)–(3.2.2): Additivity of the complete-intersection defect along flat local homomorphisms (not read; cited through CS24 p. 32).

**Needs.** `PurityForFlatCohomology:PF.1/virtual-dimension`, `DeformationAndDerivedPatchingAlgebra:R03.3/complete-intersections`, `DeformationAndDerivedPatchingAlgebra:R03.3`.

**Used by.** None.

**Proposed location.** `TauCeti/AlgebraicGeometry/Purity/PF1.lean`, namespace `TauCetiRoadmap.PurityForFlatCohomology`. Implementation status: unchecked.

### 1.3 Depth and virtual dimension are incomparable

**Theorem** (`PurityForFlatCohomology:PF.1/depth-virtual-dimension-incomparable`). (a) A Noetherian local ring R that is Cohen–Macaulay but not a complete intersection has depth\_𝔪(R) = dim R > vdim(R). (b) Every regular local ring R̃ of dimension ≥ 3 has an ideal I generated by three elements such that R = R̃/I has depth\_𝔪(R) = 0, while vdim(R) ≥ dim R̃ − 3. Hence no inequality between depth and vdim holds in general, and the étale-depth bound of PF.1/etale-depth-virtual-dimension is not a consequence of the depth bound for quasi-coherent coefficients.

**Hypotheses and conventions.** R Noetherian local in (a); R̃ regular local in (b).

**Proof outline.**

1. (a) For Cohen–Macaulay R, depth R = dim R, and dim R > vdim R when R is not a complete intersection (PF.1/virtual-dimension, API virtualDimension\_le\_dim; SGA 2 XIV 5.4).
2. (b) By Burch's theorem, in Kohn's form (Kohn 1972, Theorem A), R̃ has a three-generated ideal I with projective dimension pd\_{R̃}(R̃/I) = dim R̃; by the Auslander–Buchsbaum formula (PurityOfBranchLocus §0.3, auslander\_buchsbaum) depth(R̃/I) = 0. Presenting R = R̃/I with three generators gives vdim(R) ≥ dim R̃ − 3. The existence of such ideals is recorded as a gap (no roadmap plans Burch–Kohn).

**Checks.**

- The determinantal ring k⟦x, y, z, w⟧/(xz − y^2, yw − z^2, xw − yz) (the twisted cubic cone) is Cohen–Macaulay of dimension 2, not a complete intersection, with vdim = 4 − 3 = 1 < 2 = depth.
- For a complete intersection both depth and vdim equal dim, so (a) is sharp.

**Sources.**

- `CS24`, Remark 3.2.2, p. 33: There is no inequality between depth and vdim: Cohen–Macaulay non-complete-intersections have depth larger than vdim, and three-generated ideals of maximal projective dimension (Burch, Kohn) give depth zero with vdim at least dim R̃ − 3.
- `SGA2`, Exposé XIV, Proposition 5.4, p. 200: vdim ≤ dim with equality exactly for complete intersections.

**Needs.** `PurityForFlatCohomology:PF.1/virtual-dimension`, `DeformationAndDerivedPatchingAlgebra:R03.3`.

**Used by.** None.

**Proposed location.** `TauCeti/AlgebraicGeometry/Purity/PF1.lean`, namespace `TauCetiRoadmap.PurityForFlatCohomology`. Implementation status: unchecked.

### 1.4 The étale depth is at least the virtual dimension (Gabber)

**Theorem** (`PurityForFlatCohomology:PF.1/etale-depth-virtual-dimension`; planet **Étale depth bound**). For a Noetherian local ring (R, 𝔪) and a commutative finite étale R-group G whose order is invertible in R, H^i\_𝔪(R, G) = 0 for i < vdim(R).

**Hypotheses and conventions.** R Noetherian local, arbitrary otherwise (not necessarily excellent or a complete intersection). G commutative finite étale over R of order invertible in R; the restriction on the order is removed in PF.4/etale-purity-virtual-dimension.

**Proof outline.**

1. By the local-to-global spectral sequence of PF.0/flat-cohomology-with-supports and the invariance vdim(R^sh) = vdim(R) (PF.1/virtual-dimension, SGA 2 XIV 5.5), assume R strictly henselian; then G is constant and a dévissage reduces to G = ℤ/ℓ for a prime ℓ invertible in R.
2. By the henselian–completion comparison for torsion étale cohomology with supports (ArcTopologyAndDescent AT.8/open-henselian-completion, its clause for Noetherian I-henselian rings applied with I = 𝔪 and supports in V(𝔪); CS24 Lemma 3.1.2) assume R complete, R = R̃/(f\_1, …, f\_n) with R̃ complete regular local and f\_1, …, f\_n a minimal generating set, so vdim(R) = dim R̃ − n.
3. Reduction to hypersurfaces (n = 1): for n > 1 put R\_1 = R̃/(f\_1, …, f\_{n−1}), R\_2 = R̃/(f\_n), R\_12 = R̃/(f\_1f\_n, …, f\_{n−1}f\_n); set-theoretically Spec R\_1 ∩ Spec R\_2 = Spec R and Spec R\_1 ∪ Spec R\_2 = Spec R\_12, giving the exact sequence 0 → ℤ/ℓ\_{R\_12} → ℤ/ℓ\_{R\_1} ⊕ ℤ/ℓ\_{R\_2} → ℤ/ℓ\_R → 0 of étale sheaves on Spec R̃ (étale sites are insensitive to nilpotents); each R\_\* has vdim ≥ vdim(R) + 1, so the cohomology-with-supports sequence and induction on n conclude.
4. Hypersurface case R = R̃/(f): by absolute cohomological purity (LefschetzPencilsAndVanishingCycles §0.10, Gabber's theorem: Ri^!ℤ/ℓ ≅ ℤ/ℓ(−d)[−2d] at the closed point of the regular R̃ of dimension d) H^i\_𝔪(R̃, ℤ/ℓ) = 0 for i < 2d; the local Lefschetz theorem (CS24 Lemma 3.2.3: H^i\_𝔪(R̃, ℤ/ℓ) → H^i\_𝔪(R̃/(f), ℤ/ℓ) bijective for i < d − 1) then gives H^i\_𝔪(R, ℤ/ℓ) = 0 for i < d − 1 = vdim(R). The local Lefschetz theorem is a recorded gap owned by the pending EtaleDualityAndPerverseSheavesPartII design.

**Checks.**

- For R regular this gives H^i\_𝔪(R, ℤ/ℓ) = 0 for i < dim R, weaker than absolute purity (i < 2 dim R).
- For R = k⟦x, y⟧/(xy) (vdim 1) it gives H^0\_𝔪(R, ℤ/ℓ) = 0, i.e. no nonzero locally constant function is supported at the closed point.
- For the depth-zero rings of PF.1/depth-virtual-dimension-incomparable(b) with vdim ≥ 2, H^0\_𝔪(R, 𝔾\_a) ≠ 0 while H^i\_𝔪(R, ℤ/ℓ) = 0 for i < 2: the étale depth is not controlled by the depth.

**Sources.**

- `CS24`, Theorem 3.2.4 and its proof, pp. 33–34: For Noetherian local R and finite étale G of invertible order, cohomology with supports vanishes below vdim(R), proved by reduction to strictly henselian complete R, then to hypersurfaces through the closed-cover exact sequence, and finally by absolute purity with the local Lefschetz theorem.
- `CS24`, Theorem 3.1.3, p. 30, and Lemma 3.2.3, p. 33: Absolute cohomological purity for regular local rings in degrees below 2 dim R, and the local Lefschetz comparison H^i\_𝔪(R) → H^i\_𝔪(R/(f)) for regular R.
- `SGA2`, Exposé XIV, Théorème 5.6, p. 200: The earlier excellent characteristic-zero case of the inequality between étale depth and geometric depth.

**Needs.** `PurityForFlatCohomology:PF.1/virtual-dimension`, `PurityForFlatCohomology:PF.0/flat-cohomology-with-supports`, `ArcTopologyAndDescent:AT.8/open-henselian-completion`, `LefschetzPencilsAndVanishingCycles:LPV.0`.

**Used by.** `PurityForFlatCohomology:PF.4/flat-purity-complete-intersection`, `PurityForFlatCohomology:PF.4/etale-purity-virtual-dimension`.

**Proposed location.** `TauCeti/AlgebraicGeometry/Purity/PF1.lean`, namespace `TauCetiRoadmap.PurityForFlatCohomology`. Implementation status: unchecked.

### 1.5 Zariski–Nagata purity in virtual dimension at least three

**Theorem** (`PurityForFlatCohomology:PF.1/zariski-nagata-virtual-dimension`; planet **Zariski–Nagata purity in virtual dimension ≥ 3**). Let (R, 𝔪) be a Noetherian local ring with punctured spectrum U\_R, and let FÉt(R), FÉt(U\_R) be the categories of finite étale schemes over Spec R and over U\_R. (a) If vdim(R) ≥ 2, pullback FÉt(R) → FÉt(U\_R) is fully faithful, U\_R is connected and π\_1^ét(U\_R) → π\_1^ét(R) is surjective. (b) If vdim(R) ≥ 3, pullback FÉt(R) → FÉt(U\_R) is an equivalence of categories and π\_1^ét(U\_R) → π\_1^ét(R) is an isomorphism.

**Hypotheses and conventions.** R Noetherian local; no excellence, complete-intersection or normality hypothesis; vdim as in PF.1/virtual-dimension. Fundamental groups are those of the Galois categories of finite étale covers, with a geometric point of U\_R as base point (connectedness of U\_R is part of (a)).

**Proof outline.**

1. Granted full faithfulness, connectedness of U\_R follows by comparing sections of Spec R ⊔ Spec R → Spec R and of its restriction to U\_R; the statements about π\_1 follow from those about the functors by SGA 1 V 6.9–6.10: an exact functor of Galois categories compatible with fibre functors induces a surjection of fundamental groups when it is fully faithful and an isomorphism when it is an equivalence (InverseGaloisAndArithmeticFundamentalGroups IG.0/etale-fundamental-group; requested from IG.0).
2. Patching along the completion (Ferrand–Raynaud 1970, Proposition 4.2) and flat descent reduce to R complete, R = R̃/(f\_1, …, f\_n) with R̃ complete regular local and f\_1, …, f\_n minimal generators of 𝔣 = (f\_1, …, f\_n).
3. Let 𝔛 ⊃ 𝔘 be the 𝔣-adic formal completions of Spec R̃ ⊃ U\_{R̃}. Étale sites are insensitive to nilpotents, so FÉt(𝔛) ≃ FÉt(R) and FÉt(𝔘) ≃ FÉt(U\_R); and FÉt(R̃) ≃ FÉt(𝔛) by the henselian-pair equivalence (Stacks 09ZL; SchemeAndStackFoundations §0.14). It remains to study FÉt(R̃) → FÉt(𝔘).
4. (a) Since vdim(R) = dim R̃ − n ≥ 2, the algebraization of formal sections over punctured spectra (Stacks 0DXR with the cohomological-dimension bound 0DX9) algebraizes a morphism between the 𝔘-restrictions of two finite étale R̃-schemes to a morphism over an open V with U\_R ⊂ V ⊂ U\_{R̃}, unique up to shrinking V. The complement of V has dimension ≤ n (the f\_i cut out its closed point), hence codimension ≥ 2 in Spec R̃, and the morphism extends uniquely by Hartogs (EGA IV 5.10.5; SchemeAndStackFoundations §0.6, coherent\_hartogs). This gives full faithfulness.
5. (b) For vdim(R) ≥ 3 the algebraization of coherent formal modules (Stacks 0EJP, with 0DXR for the algebra structure) algebraizes every finite étale 𝔘-scheme to a finite étale scheme over such an open V, now with complement of codimension ≥ 3; Zariski–Nagata purity for the regular ring R̃ (SGA 2 X 3.4(i), planned upstream in LocalPurity §§2.1–2.2: purity for regular local rings of dimension ≥ 2 (Stacks 0BMA) and extension across points where purity holds (Stacks 0EY7)) extends it to a finite étale R̃-scheme. This gives essential surjectivity.
6. The punctured-spectrum algebraization results (Stacks 0DXR, 0DX9, 0EJP) and the Ferrand–Raynaud patching are recorded as a gap: SchemeAndStackFoundations §§4.7–4.10 states algebraization for proper morphisms and adic thickening systems, not over punctured spectra.

**Checks.**

- For R regular of dimension 2, vdim = 2, and (a) gives full faithfulness; the equivalence for regular R of dimension 2 is the stronger Zariski–Nagata theorem itself (LocalPurity §2.1).
- For R = k⟦x, y⟧/(xy), vdim = 1 and U\_R is the disjoint union of two punctured lines, so U\_R is disconnected and (a) fails below vdim 2.
- For the A\_1 singularity R = ℂ⟦u, v, w⟧/(uw − v^2) (a hypersurface, vdim = dim = 2), the quotient map from ℂ⟦x, y⟧ restricts to a connected étale double cover of U\_R, so π\_1^ét(U\_R) = ℤ/2 ≠ π\_1^ét(R) = 1: (b) fails at vdim 2.
- For the complete intersection R = k⟦x, y, z, w⟧/(xy − zw) of dimension 3 = vdim, every finite étale cover of U\_R extends (SGA 2 X 3.4(ii)).

**Sources.**

- `CS24`, Theorem 3.3.1 and its proof, pp. 34–35; Remark 3.3.2, p. 35: Full faithfulness, connectedness and surjectivity on π\_1 for vdim ≥ 2, and the equivalence with isomorphism on π\_1 for vdim ≥ 3, proved through formal completion along the defining ideal of R inside a regular ring, Stacks' algebraization over punctured spectra and Zariski–Nagata purity for regular rings.
- `SGA2`, Exposé X, Définitions 3.1–3.2 and Théorème 3.4, p. 94: Purity of a local ring, Zariski–Nagata purity for regular local rings of dimension ≥ 2 and the complete-intersection case in dimension ≥ 3, which the theorem extends to vdim ≥ 3.
- `STACKS`, Lemmas 52.11.3 (0DXR), 51.4.3 (0DX9), 52.22.5 (0EJP), 15.13.2 (09ZL): Algebraization of formal sections and of coherent formal modules on punctured spectra of complete Noetherian local rings with dualizing complexes under dimension bounds, the cohomological-dimension bound by the number of generators, and finite étale algebras over henselian pairs.

**Needs.** `PurityForFlatCohomology:PF.1/virtual-dimension`, `PurityForFlatCohomology:PF.0/punctured-spectrum`, `InverseGaloisAndArithmeticFundamentalGroups:IG.0/etale-fundamental-group`, `InverseGaloisAndArithmeticFundamentalGroups:IG.0/finite-etale-covers`, `InverseGaloisAndArithmeticFundamentalGroups:IG.0`, `SchemeAndStackFoundations:SF.0`, `SchemeAndStackFoundations:SF.4`.

**Used by.** None.

**Proposed location.** `TauCeti/AlgebraicGeometry/Purity/ZariskiNagata.lean`, namespace `TauCetiRoadmap.PurityForFlatCohomology`. Implementation status: unchecked.

## Layer PF.2: Purity in positive characteristic

Prove vanishing of H^i\_𝔪(R, 𝔾\_a), H^i\_𝔪(R, α\_p) and H^i\_𝔪(R, ℤ/p) below the depth (Example 4.1.10); the root-extraction lemma comparing H^i\_I(A/(f\_1, …, f\_m), G) with H^i\_I(A/(f\_1^{1/n\_1}, …, f\_m^{1/n\_m}), G) for a regular sequence f and smooth or finite locally free G, injective for i < d and bijective for i < d − 1 (Lemma 4.1.11, where the complete-intersection hypothesis enters); passage to finite flat local covers of complete intersections (Lemma 4.1.12); and purity H^i\_𝔪(R, G) = 0 for i < dim R for complete complete-intersection 𝔽\_p-algebras with perfect residue field and G of p-power order (Proposition 4.1.13), through the crystalline key formula of SchemeAndStackFoundationsPartII.

Layer imports: `PurityForFlatCohomology:PF.0`, `PurityForFlatCohomology:PF.1`, `DeformationAndDerivedPatchingAlgebra:R03.1`, `DeformationAndDerivedPatchingAlgebra:R03.3`, `PrismaticCohomologyPartII:PD.6`, `SchemeAndStackFoundations:SF.2`.

### 2.1 Vanishing of 𝔾\_a, α\_p and ℤ/p cohomology below the depth

**Theorem** (`PurityForFlatCohomology:PF.2/additive-group-depth-vanishing`). Let (R, 𝔪) be a Noetherian local ring. Then H^i\_𝔪(R, 𝔾\_a) = 0 for i < depth\_𝔪(R). If R is an 𝔽\_p-algebra, then also H^i\_𝔪(R, α\_p) = 0 and H^i\_𝔪(R, ℤ/p) = 0 for i < depth\_𝔪(R). In particular, for a complete intersection R these vanish for i < dim R.

**Hypotheses and conventions.** R Noetherian local; for α\_p and ℤ/p, R of characteristic p; cohomology is fppf cohomology with supports at the closed point (PF.0).

**Proof outline.**

1. For 𝔾\_a = 𝒪^a, H^i\_𝔪(R, 𝔾\_a) is local cohomology H^i\_𝔪(R) (PF.0/flat-cohomology-with-supports, API quasiCoherent), which vanishes below the depth (SchemeAndStackFoundations §2.7, depth\_localCohomology\_vanishing; SGA 2 III 3.3(iv)).
2. In characteristic p the Frobenius-kernel sequence 0 → α\_p → 𝔾\_a → 𝔾\_a → 0 (F(x) = x^p, fppf-surjective because F is finite flat) and the Artin–Schreier sequence 0 → ℤ/p → 𝔾\_a → 𝔾\_a → 0 (x ↦ x^p − x, étale-surjective; SchemeAndStackFoundations §2.11) give the long exact sequences of cohomology with supports from which the vanishing of the outer terms in degrees < depth yields that of the middle.
3. Complete intersections are Cohen–Macaulay (DeformationAndDerivedPatchingAlgebra R03.3/ci-cohen-macaulay), so depth = dim.

**Checks.**

- For R = 𝔽\_p⟦x, y⟧ (depth 2): H^0\_𝔪 = H^1\_𝔪 = 0 for α\_p and ℤ/p.
- For R = 𝔽\_p⟦x⟧/(x^2) (depth 0): x ∈ α\_p(R) is supported at 𝔪 and H^0\_𝔪(R, α\_p) ≠ 0, so no vanishing is asserted in degree 0.
- For R = 𝔽\_p⟦x, y, z, t⟧/(x^2, y^2, xz − yt) (CS24 Remark 6.2.6) the element xy ∈ α\_p(R) is killed by a power of 𝔪, so H^0\_𝔪(R, α\_p) ≠ 0; this is consistent with depth\_𝔪(R) = 0.

**Sources.**

- `CS24`, Example 4.1.10, p. 39, equation (4.1.10.1): The cohomological characterisation of depth gives vanishing of 𝔾\_a cohomology with supports below the depth, and the Frobenius-kernel and Artin–Schreier sequences transfer it to α\_p and ℤ/p; for complete intersections this is a case of the main theorem.
- `SGA2`, Exposé III, Proposition 3.3(iv): Vanishing of local cohomology below the depth (cited by CS24 Example 4.1.10).

**Needs.** `PurityForFlatCohomology:PF.0/flat-cohomology-with-supports`, `DeformationAndDerivedPatchingAlgebra:R03.3/ci-cohen-macaulay`, `SchemeAndStackFoundations:SF.2`, `mathlib:localCohomology`.

**Used by.** None.

**Proposed location.** `TauCeti/AlgebraicGeometry/Purity/PF2.lean`, namespace `TauCetiRoadmap.PurityForFlatCohomology`. Implementation status: unchecked.

### 2.2 Extracting roots of the equations of a complete intersection

**Theorem** (`PurityForFlatCohomology:PF.2/root-extraction-comparison`; planet **Root-extraction lemma**). Let A be a ring, f\_1, …, f\_m ∈ A an A-regular sequence, B = A/(f\_1, …, f\_m), and G a commutative B-group scheme that is smooth or finite locally free. Let n\_1, …, n\_m > 0 and g\_1, …, g\_m ∈ A with g\_i^{n\_i} = f\_i, and put B' = A/(g\_1, …, g\_m). For every ideal I ⊂ B containing a B-regular sequence a\_1, …, a\_d of length d, restriction H^i\_I(B, G) → H^i\_{IB'}(B', G) is injective for i < d and bijective for i < d − 1.

**Hypotheses and conventions.** A arbitrary commutative ring; regular sequences in the EGA sense (no nonvanishing condition on the final quotient), as in CS24 §1.4. The elements a\_j are taken in B and lifted to A where needed; cohomology is fppf cohomology with supports in V(I) (PF.0).

**Proof outline.**

1. Reduce to G smooth: the Bégueri resolution 0 → G → Res\_{G^\*/B}(𝔾\_m) → Q → 0 of a finite locally free commutative G by smooth affine commutative groups (CS24 (1.4.2); Bégueri 1980, 2.2.1) and the five lemma reduce the finite locally free case to the smooth case (recorded gap SF-PII-deformation).
2. For all exponents 0 < e\_k ≤ n\_k, the sequence g\_1^{e\_1}, …, g\_m^{e\_m}, a\_1, …, a\_d is A-regular (Stacks 07DV, powers of a regular sequence; request to DeformationAndDerivedPatchingAlgebra R03.3).
3. If n\_1 > 1, the closed immersion j : Spec A/(g\_1^{n\_1−1}, f\_2, …, f\_m) → Spec B is cut out by the square-zero ideal J = g\_1^{n\_1−1}A/(f\_1, …) which is free of rank one over A/(g\_1, f\_2, …, f\_m). Deformation theory for smooth commutative groups (Česnavičius 2015, Lemma B.14) gives the exact sequence 0 → Hom(e^\*Ω^1\_{G/B}, J) → G → j\_\*(G|\_{Spec A/(g\_1^{n\_1−1}, f\_2, …)}) → 0 of étale sheaves, whose kernel is a finite projective module over A/(g\_1, f\_2, …, f\_m) (recorded gap SF-PII-deformation).
4. By PF.0/regular-sequence-support-vanishing applied to that finite projective module and the regular sequence a\_1, …, a\_d, its cohomology with supports in V(I) vanishes in degrees < d; the long exact sequence makes H^i\_I for B → A/(g\_1^{n\_1−1}, f\_2, …) injective for i < d and bijective for i < d − 1.
5. Iterate through g\_1^{n\_1−2}, …, g\_1 and then induct on m.

**Checks.**

- For m = 0 (B = A) the statement is the identity.
- In PF.2/char-p-complete-intersection-purity it is applied with A = k⟦t\_1^{1/p^∞}, …, t\_N^{1/p^∞}⟧ and n\_i = p^j, to pass from the equations f\_i to their p^j-th roots.
- Regularity is what makes J free: for the non-regular pair f\_1 = x^2, f\_2 = xy in A = k⟦x, y⟧ and g\_1 = x, the ideal J = xA/(x^2, xy) ≅ k is killed by y and is not free over A/(x, xy) = k⟦y⟧, so the depth argument breaks down.

**Sources.**

- `CS24`, Lemma 4.1.11 and its proof, p. 39: Injectivity below d and bijectivity below d − 1 of the restriction from A/(f\_1, …, f\_m) to A/(f\_1^{1/n\_1}, …, f\_m^{1/n\_m}) for smooth or finite locally free commutative G, through the Bégueri sequence, Stacks 07DV and the deformation-theoretic exact sequence with a free square-zero ideal.
- `CS24`, §1.3, p. 7 (last paragraph) to p. 8: This lemma is where the complete-intersection hypothesis enters: the square-zero ideals between the successive root quotients are free because the f\_i form a regular sequence.
- `STACKS`, Lemma 10.68.9 (07DV): f\_1, …, f\_r is M-regular iff f\_1^{e\_1}, …, f\_r^{e\_r} is.

**Needs.** `PurityForFlatCohomology:PF.0/flat-cohomology-with-supports`, `PurityForFlatCohomology:PF.0/regular-sequence-support-vanishing`, `DeformationAndDerivedPatchingAlgebra:R03.3`, `mathlib:RingTheory.Sequence.IsRegular`.

**Used by.** `PurityForFlatCohomology:PF.2/char-p-complete-intersection-purity`, `PurityForFlatCohomology:PF.4/flat-purity-complete-intersection`.

**Proposed location.** `TauCeti/AlgebraicGeometry/Purity/PF2.lean`, namespace `TauCetiRoadmap.PurityForFlatCohomology`. Implementation status: unchecked.

### 2.3 Passage to a finite flat cover of complete intersections

**Theorem** (`PurityForFlatCohomology:PF.2/finite-flat-cover-reduction`). Let (R, 𝔪) → (R', 𝔪') be a finite flat local homomorphism of Noetherian local rings that are complete intersections, let n < dim R be an integer, and let G be a commutative finite flat R-group. Suppose that for every finite nonempty tensor power R' ⊗\_R ⋯ ⊗\_R R' and every local ring (A, 𝔮) of it at a maximal ideal, H^i\_𝔮(A, G) = 0 for i < n. Then H^i\_𝔪(R, G) = 0 for i < n and H^n\_𝔪(R, G) → H^n\_{𝔪'}(R', G) is injective.

**Hypotheses and conventions.** R → R' finite, flat and local; both complete intersections; n < dim R.

**Proof outline.**

1. Since R and R′ are complete intersections and R→R′ is flat local, its finite-dimensional closed fibre B=R′/𝔪R′ is a complete-intersection algebra over k=R/𝔪 (Stacks 09Q7). Tensor powers B⊗\_k⋯⊗\_kB and their localizations are complete intersections: use regular-sequence presentations, flat base change and transitivity of local complete-intersection morphisms over a field. Thus every maximal localization A of R′^{⊗(s+1)} is flat local over R with a zero-dimensional complete-intersection closed fibre. The flat-local criterion makes A a complete intersection, and the flat dimension formula gives dim A=dim R. Merely being Artinian would not suffice for the complete-intersection conclusion.
2. The hypothesis gives H^i\_𝔪(R'^{⊗(s+1)}, G) = ⊕\_𝔮 H^i\_𝔮(A\_𝔮, G) = 0 for i < n (excision to the semilocal pieces, PF.0).
3. The fppf descent spectral sequence E\_1^{st} = H^t\_𝔪(R'^{⊗(s+1)}, G) ⇒ H^{s+t}\_𝔪(R, G) for Spec R' → Spec R (PF.0/flat-cohomology-with-supports, API finiteFlatDescent) has E\_1^{st} = 0 for t < n, which gives the vanishing in degrees < n and the edge injection in degree n.

**Checks.**

- For R' = R it is a tautology.
- For R = k⟦t⟧ → R' = k⟦t^{1/p}⟧ (finite flat of degree p, both regular) the tensor powers are k⟦t^{1/p}⟧ ⊗ ⋯, local complete intersections of dimension 1, as used for the passage to perfections in CS24 Proposition 4.1.13.
- The complete-intersection hypothesis on R' is needed to apply the hypothesis to the local rings of the tensor powers.

**Sources.**

- `CS24`, Lemma 4.1.12 and its proof, p. 40: For a finite flat local map of complete intersections, purity in degrees below n on the local rings of all tensor powers implies vanishing below n for R and injectivity in degree n, from the descent spectral sequence for R' over R.
- `C19`, Remark 2.7, pp. 5–6: Gabber's spectral-sequence argument for passage to a finite flat cover, which CS24 Lemma 4.1.12 follows.
- `STACKS`, Lemma 23.8.9 (09Q7): For a flat local homomorphism of Noetherian local rings, the target is a complete intersection iff the source and the closed fibre are.

**Needs.** `PurityForFlatCohomology:PF.0/flat-cohomology-with-supports`, `DeformationAndDerivedPatchingAlgebra:R03.3/complete-intersections`, `DeformationAndDerivedPatchingAlgebra:R03.3`, `PurityForFlatCohomology:PF.1/virtual-dimension`.

**Used by.** `PurityForFlatCohomology:PF.2/char-p-complete-intersection-purity`, `PurityForFlatCohomology:PF.4/flat-purity-complete-intersection`, `PurityForFlatCohomology:PF.4/flat-purity-regular`.

**Proposed location.** `TauCeti/AlgebraicGeometry/Purity/PF2.lean`, namespace `TauCetiRoadmap.PurityForFlatCohomology`. Implementation status: unchecked.

### 2.4 Purity for flat cohomology of complete intersections in characteristic p

**Theorem** (`PurityForFlatCohomology:PF.2/char-p-complete-intersection-purity`; planet **Purity in characteristic p**). Let (R, 𝔪) be a complete Noetherian local 𝔽\_p-algebra that is a complete intersection with perfect residue field k, and G a commutative finite flat R-group of p-power order. Then H^i\_𝔪(R, G) = 0 for i < dim R.

**Hypotheses and conventions.** R complete, local, Noetherian, of characteristic p, a complete intersection, with perfect residue field; G of p-power order.

**Proof outline.**

1. Induct on i simultaneously for all such R. By the Cohen structure theorem (DeformationAndDerivedPatchingAlgebra R03.1/cohen-structure-and-compatible-coefficients) R ≅ k⟦t\_1, …, t\_N⟧/(f\_1, …, f\_m) with f\_1, …, f\_m regular, so dim R = N − m.
2. PF.2/finite-flat-cover-reduction applied to the finite flat covers k⟦t\_1^{1/p^j}, …, t\_N^{1/p^j}⟧/(f\_1, …, f\_m) and a limit argument (PF.0, API limit) reduce to H^i\_{(t)}(k⟦t^{1/p^∞}⟧/(f\_1, …, f\_m), G) = 0 for i < N − m, where k⟦t^{1/p^∞}⟧ is the uncompleted colimit of CS24 (1.4.1).
3. The ring k⟦t^{1/p^∞}⟧ is perfect, so PF.2/root-extraction-comparison (with the roots f\_i^{1/p^j}) and a limit argument reduce to the same vanishing for the perfect ring R\_∞ = k⟦t^{1/p^∞}⟧/(f\_1^{1/p^∞}, …, f\_m^{1/p^∞}).
4. For the perfect 𝔽\_p-algebra R\_∞, the positive-characteristic key formula RΓ\_Z(R\_∞, G) ≅ RΓ\_Z(W(R\_∞), 𝕄(G))^{V=1} (CS24 Theorem 4.1.8; recorded gap SF-PII-key-formula) and the Dieudonné module 𝕄(G) of projective dimension ≤ 1 over W(R\_∞) (PrismaticCohomologyPartII PD.6/perfect-base-classification) reduce to H^i\_Z(W(R\_∞), W(R\_∞)) = 0 for i < N − m + 1 with Z = V(p, t\_1, …, t\_N).
5. An R-regular sequence a\_1, …, a\_{N−m} ⊂ 𝔪 stays R\_∞-regular (Stacks 07DV), so p, a\_1, …, a\_{N−m} is W(R\_∞)-regular, and PF.0/regular-sequence-support-vanishing gives the required vanishing.

**Checks.**

- For R = 𝔽\_p⟦x, y⟧ and G = μ\_p, H^0\_𝔪 = H^1\_𝔪 = 0: sections extend uniquely and restriction on H^1 is injective. Surjectivity on H^1 also needs H^2\_𝔪 = 0, supplied separately by PF.4/flat-purity-regular.
- For G = α\_p it recovers PF.2/additive-group-depth-vanishing for complete intersections.
- For the non-complete-intersection ring of CS24 Remark 6.2.6 the conclusion fails in degree 0 (PF.4/virtual-dimension-flat-counterexample), so the complete-intersection hypothesis cannot be weakened to vdim.

**Sources.**

- `CS24`, Proposition 4.1.13 and its proof, p. 40: For complete complete-intersection 𝔽\_p-algebras with perfect residue field and G of p-power order, H^i\_𝔪 vanishes below dim R, by passing to perfect root towers with Lemmas 4.1.11–4.1.12, the key formula (4.1.8.2) and projective dimension ≤ 1 of 𝕄(G).
- `CS24`, Theorem 4.1.8, p. 38; §4.1.1, p. 36: The positive-characteristic key formula RΓ\_Z(S, G) ≅ RΓ\_Z(W\_n(S), 𝕄(G))^{V=1} for perfect S and G killed by p^n, and the crystalline Dieudonné classification of Berthelot, Gabber and Lau.

**Needs.** `PurityForFlatCohomology:PF.2/finite-flat-cover-reduction`, `PurityForFlatCohomology:PF.2/root-extraction-comparison`, `PurityForFlatCohomology:PF.0/regular-sequence-support-vanishing`, `PurityForFlatCohomology:PF.0/flat-cohomology-with-supports`, `PrismaticCohomologyPartII:PD.6/perfect-base-classification`, `DeformationAndDerivedPatchingAlgebra:R03.1/cohen-structure-and-compatible-coefficients`, `DeformationAndDerivedPatchingAlgebra:R03.3/complete-intersections`, `mathlib:WittVector`.

**Used by.** None.

**Proposed location.** `TauCeti/AlgebraicGeometry/Purity/PF2.lean`, namespace `TauCetiRoadmap.PurityForFlatCohomology`. Implementation status: unchecked.

## Layer PF.3: Perfectoid rings: Dieudonné modules and the key formula

Define the Dieudonné side RΓ\_Z(A\_inf(A), 𝕄(G))^{V=1} for perfectoid A and G of p-power order. Prove G(A) ≅ 𝕄(G)^{V=1}, H^1(A, G) ≅ 𝕄(G)/(V − 1) and H^{≥2}(A, G) = 0 (Proposition 4.2.4); p-complete arc hyperdescent of the Dieudonné side (Proposition 4.2.7) and of flat cohomology with supports on perfectoid algebras (Theorem 5.5.1); the product lemmas 4.2.8–4.2.9, Katz's lemma on Frobenius-fixed vectors and the analysis over products of perfectoid valuation rings with algebraically closed fraction fields (Proposition 4.2.10). Conclude the key formula RΓ\_Z(A, G) ≅ RΓ\_Z(A\_inf(A), 𝕄(G))^{V=1} (Theorem 6.1.1) and purity for perfectoid rings: H^i\_Z(A, G) = 0 below the length of a regular sequence vanishing on Z (Theorem 6.1.2).

Layer imports: `PurityForFlatCohomology:PF.0`, `PrismaticCohomologyPartII:PD.6`, `PrismaticCohomology:PR.0`, `ArcTopologyAndDescent:AT.6`, `ArcTopologyAndDescent:AT.8`, `ArcTopologyAndDescent:AT.11`, `ArcTopologyAndDescent:AT.12`, `PerfectoidQuotients:Q0:integral-algebra`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1`, `SchemeAndStackFoundations:SF.2`.

### 3.1 The Dieudonné side RΓ\_Z(A\_inf(A), 𝕄(G))^{V=1}

**Construction** (`PurityForFlatCohomology:PF.3/dieudonne-side-complex`). Let A be a perfectoid ring (integral perfectoid in the sense of PerfectoidQuotients Q0), ξ a generator of ker(θ : A\_inf(A) → A), G a commutative finite locally free A-group of p-power order with covariant prismatic Dieudonné module 𝕄(G) (finitely presented, p-power torsion, of projective dimension ≤ 1 over A\_inf(A), with Frob-semilinear F and Frob^{-1}-semilinear V, FV = Frob(ξ), VF = ξ), and Z ⊂ Spec(A/pA) closed. Define RΓ\_Z(A\_inf(A), 𝕄(G))^{V=1} as the fibre of V − 1 : RΓ\_Z(A\_inf(A), 𝕄(G)) → RΓ\_Z(A\_inf(A), 𝕄(G)), where Z is viewed as a closed subset of Spec A\_inf(A) through A\_inf(A) → A → A/p, and V acts on cohomology with supports through its Frob^{-1}-semilinear structure (Frob is an automorphism of A\_inf(A) preserving the support). The construction is functorial in A (for a fixed compatible choice of ξ over perfectoid A-algebras), in G and in Z. For a perfect 𝔽\_p-algebra and ξ = p it is the complex RΓ\_Z(W(A), 𝕄(G))^{V=1} of the crystalline theory.

**Hypotheses and conventions.** A perfectoid; the choice of ξ fixes V, and the same ξ is used over all perfectoid A-algebras A' (CS24 §2.1.2 and §4.2.1). 𝕄 is PrismaticCohomologyPartII PD.6/covariant-normalisation's covariant functor; for perfect 𝔽\_p-algebras PD.6/perfect-base-classification's crystalline functor.

**Proof outline.**

1. Cohomology with supports of the A\_inf(A)-module 𝕄(G) is Zariski cohomology with supports (PF.0/flat-cohomology-with-supports, API quasiCoherent); Frob^{-1}-semilinear maps act on it because Frob is a ring automorphism of A\_inf(A) fixing V(p, z) for every z vanishing on Z.
2. Functoriality in A uses that 𝕄 commutes with base change (PD.6/covariant-normalisation), naturality of Fontaine's θ (PerfectoidQuotients Q0/theta-naturality), and that the image of ξ in A\_inf(A') is again a distinguished element of ker θ', hence a generator (PrismaticCohomology PR.0/ainf-prism; BMS Lemma 3.10); functoriality in G and Z is that of cohomology with supports.
3. The comparison with the crystalline case for perfect 𝔽\_p-algebras with ξ = p is part of PD.6/covariant-normalisation.

**API.**

- `TauCetiRoadmap.PurityForFlatCohomology.dieudonneSide` (constructor): The complex RΓ\_Z(A\_inf(A), 𝕄(G))^{V=1} = fib(V − 1) for A perfectoid, ξ, G of p-power order and Z ⊂ Spec(A/p) closed.
- `TauCetiRoadmap.PurityForFlatCohomology.dieudonneSide_les` (relation): The long exact sequence … → H^i(dieudonneSide) → H^i\_Z(A\_inf(A), 𝕄(G)) → H^i\_Z(A\_inf(A), 𝕄(G)) → H^{i+1}(dieudonneSide) → … with middle map V − 1.
- `TauCetiRoadmap.PurityForFlatCohomology.dieudonneSide_map` (functoriality): Write D(A,G,Z) = RΓ\_Z(A\_inf(A),𝕄(G))^{V=1}. A perfectoid map A → A′ with compatible ξ and a homomorphism G\_{A′} → G′ give D(A,G,Z) → D(A′,G′,Z\_{A′}). Separately, for Z′ ⊂ Z\_{A′}, extension of supports gives D(A′,G′,Z′) → D(A′,G′,Z\_{A′}). Require identity, composition and commuting-square laws; the inclusion of supports points toward the larger support.
- `TauCetiRoadmap.PurityForFlatCohomology.dieudonneSide_exact` (relation): A short exact sequence 0 → G' → G → G'' → 0 gives a distinguished triangle of Dieudonné sides (exactness of 𝕄, PD.6/covariant-normalisation).
- `TauCetiRoadmap.PurityForFlatCohomology.dieudonneSide_localization` (relation): For the open complement U of Z in Spec A\_inf(A), there is the natural support triangle RΓ\_Z(A\_inf,𝕄) → RΓ(A\_inf,𝕄) → RΓ(U,𝕄). Compute the last term by the derived limit over the principal-open basis D(z) ⊂ U, including its restriction and intersection maps; apply fib(V − 1) compatibly. This is the indexed localization diagram of CS24 (4.2.7.1), not a product of unrelated localizations.
- `TauCetiRoadmap.PurityForFlatCohomology.dieudonneSide_crystalline` (compatibility): For A a perfect 𝔽\_p-algebra and ξ = p, dieudonneSide is RΓ\_Z(W(A), 𝕄(G))^{V=1} for the crystalline 𝕄 of PD.6/perfect-base-classification.

**Definition/construction tests.**

- `TauCetiRoadmap.PurityForFlatCohomology.dieudonneSide_zero` (degenerate): For G = 0 the complex is 0; for Z = ∅ it is 0.
- `TauCetiRoadmap.PurityForFlatCohomology.dieudonneSide_constant_perfect` (computation): For A perfect of characteristic p, ξ = p, G = ℤ/p and Z = Spec A: 𝕄 = A with V = Frob^{-1}, so H^0 = {a : a^p = a} = ℤ/p(A) and H^1 = A/(F − 1)A, the Artin–Schreier cohomology.
- `TauCetiRoadmap.PurityForFlatCohomology.dieudonneSide_mu_perfect` (computation): For A perfect of characteristic p, ξ = p, G = μ\_p and Z = Spec A: 𝕄 = A with V = 0, so V − 1 is invertible and the complex vanishes, matching μ\_p(A) = 0 and H^1(A, μ\_p) = A^×/A^{×p} = 0 for perfect A.
- `TauCetiRoadmap.PurityForFlatCohomology.dieudonneSide_not_without_fixed_points` (non-example): Without taking V = 1: for A = 𝔽̄\_p, G = ℤ/p, Z = Spec A, H^0\_Z(W(A), 𝕄(G)) = 𝔽̄\_p ≠ ℤ/p = H^0(A, G).
- `TauCetiRoadmap.PurityForFlatCohomology.dieudonneSide_crystalline_compat` (compatibility): For A perfect, the complex agrees with the crystalline one of CS24 (4.1.8.2) under PD.6/covariant-normalisation's comparison.

**Checks.**

- For A perfect and G = ℤ/p it computes Artin–Schreier cohomology; for G = μ\_p it vanishes.
- Without the fixed points of V it does not compute flat cohomology.

**Uses.** CS24 Theorem 6.1.1: right side of the key formula. CS24 Proposition 4.2.7: its arc hyperdescent on perfectoid A-algebras. CS24 Theorem 6.1.2 and Theorem 6.2.7: vanishing of H^i\_Z(A\_inf(A), 𝕄(G)) in low degrees and of V-fixed points in the top degree.

**Sources.**

- `CS24`, Theorem 6.1.1 and (6.1.1.1), p. 82; §4.2.1, p. 41; (4.1.8.2), p. 38: The right side of the key formula is the V = 1 part of quasi-coherent cohomology with supports of A\_inf(A) with coefficients 𝕄(G), with a fixed ξ defining V; in characteristic p it is the crystalline version with W(S).
- `CS24`, Example 4.2.2, p. 41; Example 4.1.2, p. 36: 𝕄(μ\_{p^n}) = A\_inf/p^n with F = Frob, V = ξ·Frob^{-1}; 𝕄(ℤ/p^n) = A\_inf/p^n with F = Frob(ξ)·Frob, V = Frob^{-1}.

**Needs.** `PrismaticCohomologyPartII:PD.6/covariant-normalisation`, `PrismaticCohomologyPartII:PD.6/perfect-base-classification`, `PrismaticCohomology:PR.0/ainf-prism`, `PerfectoidQuotients:Q0:integral-algebra/theta-naturality`, `PurityForFlatCohomology:PF.0/flat-cohomology-with-supports`, `mathlib:WittVector`.

**Used by.** `PurityForFlatCohomology:PF.3/perfectoid-low-degree-cohomology`, `PurityForFlatCohomology:PF.3/dieudonne-side-arc-descent`, `PurityForFlatCohomology:PF.3/key-formula`, `PurityForFlatCohomology:PF.3/perfectoid-purity`.

**Proposed location.** `TauCeti/AlgebraicGeometry/Purity/KeyFormula.lean`, namespace `TauCetiRoadmap.PurityForFlatCohomology`. Implementation status: unchecked.

### 3.2 Low-degree flat cohomology of a perfectoid ring through Dieudonné modules

**Theorem** (`PurityForFlatCohomology:PF.3/perfectoid-low-degree-cohomology`). For a perfectoid ℤ\_p-algebra A and a commutative finite locally free A-group G of p-power order there are identifications G(A) ≅ 𝕄(G)^{V=1} and H^1(A, G) ≅ 𝕄(G)/(V − 1)𝕄(G), functorial in A and G. Moreover H^i(A, G) = 0 for i ≥ 2.

**Hypotheses and conventions.** A perfectoid ℤ\_p-algebra (integral perfectoid, PerfectoidQuotients Q0); G of p-power order; ξ fixed as in PF.3/dieudonne-side-complex.

**Proof outline.**

1. For p^n killing G, H^1(A, G) ≅ Ext^1(ℤ/p^n, G) in fppf sheaves of ℤ/p^n-modules, and G(A) = Hom(ℤ/p^n, G).
2. The exact equivalence G ↦ 𝕄(G) (PD.6/covariant-normalisation) with 𝟙\_n := 𝕄(ℤ/p^n) = (A\_inf/p^n, F = Frob(ξ)·Frob, V = Frob^{-1}) turns Hom into evaluation at 1, giving G(A) ≅ 𝕄(G)^{V=1}, and turns extensions of 𝟙\_n by 𝕄(G) into the classes m ∈ 𝕄(G) modulo (V − 1)𝕄(G): an extension is determined by the value of V on a lift of 1, and isomorphisms change it by V(a) − a (as in CS24 Proposition 4.1.4).
3. The vanishing for i ≥ 2 is CS24 Remark 4.2.5, deduced in CS24 Corollary 5.3.7 from the perfect case (Corollary 4.1.9) by p-adic continuity; it is recorded in the gap SF-PII-continuity.

**Checks.**

- For A perfect of characteristic p and G = ℤ/p it is Artin–Schreier: H^1(A, ℤ/p) = A/(F − 1)A.
- For G = μ\_p: 𝕄(μ\_p)/(V − 1) recovers H^1(A, μ\_p) = A^×/A^{×p} by the Kummer sequence (SchemeAndStackFoundations §2.11).
- For A=𝒪\_C with C algebraically closed, every finite flat G-torsor has a C-point on its generic fibre. Properness of the finite torsor extends this point to an 𝒪\_C-section by the valuative criterion. Hence H^1(𝒪\_C,G)=0 for every such G, including those beyond μ\_p and ℤ/p.

**Sources.**

- `CS24`, Proposition 4.2.4, (4.2.4.1), p. 41; Remark 4.2.5, p. 41: Over a perfectoid ℤ\_p-algebra, G(A) is the V-fixed part of 𝕄(G) and H^1(A, G) is its V − 1 coinvariants, functorially; higher cohomology vanishes by Corollary 5.3.7.
- `CS24`, Proposition 4.1.4, p. 37: The positive-characteristic prototype with sheaf Hom and Ext of ℤ/p^n-module sheaves.

**Needs.** `PrismaticCohomologyPartII:PD.6/covariant-normalisation`, `PurityForFlatCohomology:PF.3/dieudonne-side-complex`, `PurityForFlatCohomology:PF.0/flat-cohomology-with-supports`, `SchemeAndStackFoundations:SF.2`.

**Used by.** `PurityForFlatCohomology:PF.3/product-valuation-local-analysis`, `PurityForFlatCohomology:PF.3/key-formula`.

**Proposed location.** `TauCeti/AlgebraicGeometry/Purity/PF3.lean`, namespace `TauCetiRoadmap.PurityForFlatCohomology`. Implementation status: unchecked.

### 3.3 p-complete arc hyperdescent of the Dieudonné side

**Theorem** (`PurityForFlatCohomology:PF.3/dieudonne-side-arc-descent`). Let A be a perfectoid ℤ\_p-algebra, Z ⊂ Spec(A/pA) closed, a ∈ A\_inf(A) and G a commutative finite locally free A-group of p-power order. The functors A' ↦ 𝕄(G\_{A'})[1/a] and A' ↦ RΓ\_Z(A\_inf(A'), 𝕄(G\_{A'})), on perfectoid A-algebras A', satisfy hyperdescent for p-complete arc hypercovers A' → A'^• whose terms are perfectoid A-algebras; so does the Dieudonné side A' ↦ RΓ\_Z(A\_inf(A'), 𝕄(G\_{A'}))^{V=1}.

**Hypotheses and conventions.** Hypercovers in the p-complete arc topology (ArcTopologyAndDescent AT.11/AT.12) whose terms are perfectoid; cosimplicial limits are R lim over Δ.

**Proof outline.**

1. A cosimplicial abelian group computes R lim\_Δ by its alternating complex and localisation is exact, so it suffices to treat a = 1.
2. 𝕄(G\_{A'}) = 𝕄(G) ⊗\_{A\_inf(A)} A\_inf(A') (PD.6/covariant-normalisation, base change; the tensor product is underived because 𝕄(G) lies in DM\_tors, PD.6/torsion-base-change) and 𝕄(G) has a resolution 0 → M\_0 → M\_1 → 𝕄(G) → 0 by finite projective A\_inf(A)-modules which stays exact after base change because 𝕄(G) is p-power torsion and A\_inf(A') is p-torsion free (PD.6/torsion-base-change).
3. A' ↦ A\_inf(A') satisfies the required hyperdescent (ArcTopologyAndDescent AT.12/integral-perfectoid-hyperdescent, BS22 Proposition 8.10, CS24 Lemma 4.2.6), hence so do A' ↦ M\_i ⊗ A\_inf(A') and A' ↦ 𝕄(G\_{A'}), and also their localisations.
4. For cohomology with supports, use the triangle RΓ\_Z → RΓ → R lim\_z RΓ(A\_inf(A')[1/z], 𝕄[1/z]) over z ∈ A\_inf(A) vanishing on Z, with RΓ(A\_inf(A')[1/z], 𝕄[1/z]) = 𝕄(G\_{A'})[1/z] on the affine scheme; the fibre of V − 1 commutes with limits.

**Checks.**

- For G = ℤ/p over a perfect A, the statement is p-complete arc hyperdescent of A' ↦ RΓ\_Z(A', 𝒪) with V = Frob^{-1} for perfect A-algebras, a case of AT.12/integral-perfectoid-hyperdescent.
- For the cover 𝒪\_C → ∏ V\_j by products of rank-one valuation rings, it identifies 𝕄(G) with the equaliser of the 𝕄(G\_{∏V\_j}) terms.

**Sources.**

- `CS24`, Proposition 4.2.7 and its proof, pp. 42–43; Lemma 4.2.6, p. 42: Hyperdescent of 𝕄(G)[1/a] and of RΓ\_Z(A\_inf, 𝕄(G)) for p-complete arc hypercovers by perfectoids, from the hyperdescent of A\_inf, A and A^♭ (Bhatt–Scholze, Proposition 8.10) and a two-term projective resolution of 𝕄(G).

**Needs.** `ArcTopologyAndDescent:AT.12/integral-perfectoid-hyperdescent`, `PrismaticCohomologyPartII:PD.6/covariant-normalisation`, `PrismaticCohomologyPartII:PD.6/torsion-base-change`, `PurityForFlatCohomology:PF.3/dieudonne-side-complex`, `PurityForFlatCohomology:PF.0/flat-cohomology-with-supports`.

**Used by.** `PurityForFlatCohomology:PF.3/flat-side-arc-descent`, `PurityForFlatCohomology:PF.3/key-formula`.

**Proposed location.** `TauCeti/AlgebraicGeometry/Purity/PF3.lean`, namespace `TauCetiRoadmap.PurityForFlatCohomology`. Implementation status: unchecked.

### 3.4 Finitely presented modules over a product of rings

**Theorem** (`PurityForFlatCohomology:PF.3/finitely-presented-modules-over-products`). For a family of commutative rings (R\_i)\_{i∈I} with product R = ∏\_i R\_i and a finitely presented R-module M, the natural map M → ∏\_i (M ⊗\_R R\_i) is an isomorphism.

**Hypotheses and conventions.** I an arbitrary index set; M finitely presented (a finite free presentation R^n → R^m → M → 0).

**Proof outline.**

1. Choose a presentation R^n → R^m → M → 0. The functors − ⊗\_R R\_i and arbitrary products of abelian groups are right exact, resp. exact, so the claim for M follows from the evident case of finite free modules, R^m = ∏\_i R\_i^m, by the five lemma.

**Checks.**

- For M = R it is the identity R = ∏ R\_i.
- Finite presentation is needed: for I infinite and M = ⊕\_i R\_i (not finitely generated) the map M → ∏\_i M ⊗ R\_i = ∏\_i R\_i is not surjective.
- For M = R/J with J = ∏ J\_i finitely generated, it gives R/J = ∏ R\_i/J\_i.

**Sources.**

- `CS24`, Lemma 4.2.8 and its proof, p. 43: A finitely presented module over a product of rings is the product of its base changes to the factors, by reduction to finite free modules through a presentation.

**Needs.** `mathlib:Module.FinitePresentation`.

**Used by.** `PurityForFlatCohomology:PF.3/dieudonne-modules-over-products`.

**Proposed location.** `TauCeti/AlgebraicGeometry/Purity/PF3.lean`, namespace `TauCetiRoadmap.PurityForFlatCohomology`. Implementation status: unchecked.

### 3.5 Dieudonné modules over a product of perfectoid rings

**Theorem** (`PurityForFlatCohomology:PF.3/dieudonne-modules-over-products`). For perfectoid rings (A\_i)\_{i∈I} with product A = ∏\_i A\_i (perfectoid) and a commutative finite locally free A-group G of p-power order, the natural map 𝕄(G) → ∏\_i 𝕄(G\_{A\_i}) is an isomorphism over A\_inf(A) ≅ ∏\_i A\_inf(A\_i), compatibly with F and V when compatible generators ξ of ker θ are used.

**Hypotheses and conventions.** A\_i perfectoid; the product is perfectoid with tilt ∏ A\_i^♭ (PerfectoidQuotients Q0/products-of-perfectoid-rings); ξ = (ξ\_i).

**Proof outline.**

1. W(∏ A\_i^♭) = ∏ W(A\_i^♭) since Witt vectors are computed componentwise on coordinates.
2. 𝕄(G\_{A\_i}) = 𝕄(G) ⊗\_{A\_inf(A)} A\_inf(A\_i) by base change (PD.6/covariant-normalisation), and 𝕄(G) is finitely presented over A\_inf(A), so PF.3/finitely-presented-modules-over-products gives the isomorphism; F and V are compatible because they are compatible with base change.

**Checks.**

- For I a singleton it is the identity.
- For G = μ\_{p^n}, both sides are ∏ A\_inf(A\_i)/p^n with V = ξ·Frob^{-1}.

**Sources.**

- `CS24`, Proposition 4.2.9 and its proof, p. 43: 𝕄(G) over a product of perfectoid rings is the product of the 𝕄(G\_{A\_i}) over A\_inf(A) = ∏ A\_inf(A\_i), by base change and Lemma 4.2.8.

**Needs.** `PurityForFlatCohomology:PF.3/finitely-presented-modules-over-products`, `PrismaticCohomologyPartII:PD.6/covariant-normalisation`, `PerfectoidQuotients:Q0:integral-algebra/products-of-perfectoid-rings`, `mathlib:WittVector`.

**Used by.** `PurityForFlatCohomology:PF.3/product-valuation-local-analysis`.

**Proposed location.** `TauCeti/AlgebraicGeometry/Purity/PF3.lean`, namespace `TauCetiRoadmap.PurityForFlatCohomology`. Implementation status: unchecked.

### 3.6 Frobenius-fixed vectors over an algebraically closed field (Katz)

**Theorem** (`PurityForFlatCohomology:PF.3/frobenius-fixed-points-algebraically-closed`). Let K be an algebraically closed field of characteristic p and M a finite-dimensional K-vector space with a bijective Frobenius-semilinear map F : M → M (F(am) = a^p F(m)). Then M^{F=1} is a finite-dimensional 𝔽\_p-vector space and the natural map M^{F=1} ⊗\_{𝔽\_p} K → M is an isomorphism compatible with F (acting as 1 ⊗ Frob on the source). Consequently V − 1 is surjective for any bijective Frob^{-1}-semilinear V on M, and ξ·Frob^{-1} − 1 and ξ·x − Frob(x) are surjective on K for ξ ∈ K^×.

**Hypotheses and conventions.** K algebraically closed of characteristic p; dim\_K M < ∞; F bijective and p-semilinear.

**Proof outline.**

1. In a basis, F(x) = A x^{(p)} with A invertible. The additive map x ↦ A x^{(p)} − x is finite étale of degree p^n (invertibility of A gives finiteness and the Jacobian is −1). Its kernel therefore has p^n points over algebraically closed K, an 𝔽\_p-space of dimension n; this is the field case of Katz Proposition 4.1.1.
2. Linear independence over K of 𝔽\_p-independent F-fixed vectors follows by a minimal-relation argument applying F; comparing dimensions gives the isomorphism.
3. Apply the fixed-basis result to V^{-1}, which is Frobenius-semilinear. In that basis V − 1 is coordinatewise Frob^{-1} − 1 and is surjective over K. The two scalar variants are likewise surjective because their equations become nonconstant polynomials x^p − c x + b = 0.

**Checks.**

- For M = K with F = Frob, M^{F=1} = 𝔽\_p and 𝔽\_p ⊗ K = K.
- For M = K with F = c·Frob (c ≠ 0), M^{F=1} is spanned by a root of x^{p−1} = c^{-1}, which exists because K is algebraically closed.
- Algebraic closedness is needed: for K = 𝔽\_3(t)^perf and F = t·Frob, a nonzero fixed vector would give x^2 = 1/t. The t-adic value group of K is ℤ[1/3], which does not contain −1/2, so there is no such vector.

**Sources.**

- `CS24`, Proof of Claim 4.2.10.1, p. 45: Over the algebraically closed fraction field of a tilted valuation ring, a finite vector space with bijective F is spanned by its F-fixed points (Katz), which reduces surjectivity of V − 1 to solvability of x^p − ξx + b = 0.
- `Kat73`, Proposition 4.1.1 and its proof, pp. 142–145 (field case, n = 1): Directly read: unit-root Frobenius modules correspond to finite locally constant ℤ/p^n-modules; over an algebraically closed field the local system is constant and gives a basis of fixed vectors.

**Needs.** `mathlib:IsAlgClosed`, `mathlib:frobenius`.

**Used by.** `PurityForFlatCohomology:PF.3/product-valuation-local-analysis`.

**Proposed location.** `TauCeti/AlgebraicGeometry/Purity/PF3.lean`, namespace `TauCetiRoadmap.PurityForFlatCohomology`. Implementation status: unchecked.

### 3.7 Flat cohomology over products of perfectoid valuation rings

**Theorem** (`PurityForFlatCohomology:PF.3/product-valuation-local-analysis`). Let (A\_i)\_{i∈I} be p-adically complete valuation rings of rank ≤ 1 with algebraically closed fraction fields K\_i, A = ∏\_i A\_i, K = ∏\_i K\_i, a ∈ A, and G a commutative finite locally free A-group of p-power order. Then: V − 1 is surjective on 𝕄(G)[1/[a^♭]] for any ξ used to define V; H^j(A[1/a], G) = 0 for j ≥ 1; and there is a unique commutative square with top row G(A) ≅ 𝕄(G)^{V=1} (PF.3/perfectoid-low-degree-cohomology), bottom row G(A[1/a]) ≅ (𝕄(G)[1/[a^♭]])^{V=1} and vertical restriction maps, and the vertical maps are bijective when a is a nonzerodivisor. Here a^♭ ∈ A^♭ = ∏ A\_i^♭ is a compatible system of p-power roots of a and [−] the Teichmüller lift.

**Hypotheses and conventions.** A\_i p-adically complete valuation rings of rank ≤ 1 with algebraically closed fraction fields; A is perfectoid (PerfectoidQuotients Q0/products-of-perfectoid-rings). V on 𝕄(G)[1/[a^♭]] is V(m/[a^♭]^n) = V(m)/[a^♭]^{n/p}.

**Proof outline.**

1. Each A\_i is perfectoid (a p-adically complete rank ≤ 1 valuation ring with algebraically closed fraction field: perfect if p = 0, the ring of integers of an algebraically closed perfectoid field otherwise; CS24 (2.1.2.3), recorded in gap PQ-PII-towers), so A is perfectoid with tilt ∏ A\_i^♭ (PerfectoidQuotients Q0/products-of-perfectoid-rings). Decompose I into finitely many parts to assume a = 0 or a a nonzerodivisor. Each A\_i^♭ is a valuation ring with algebraically closed fraction field K\_i^♭ (CS24 Proposition 2.1.9, second part; gap PQ-PII-towers), so a^♭ is a nonzerodivisor.
2. Since A ⊂ A[1/a] ⊂ K and G is finite, G(A) = G(K) by the valuative criterion, so G(A) = G(A[1/a]); the local rings of Spec A[1/a] are valuation rings with fraction fields localizations of K (the connected components of Spec of a product of valuation rings are ultraproduct valuation spectra, ArcTopologyAndDescent AT.11/complete-valuation-product-basis; CS24 Lemma 2.2.4), so every G-torsor over A[1/a] is trivial (valuative criterion locally, K a product of algebraically closed fields) and H^1(A[1/a], G) = 0; the Bégueri resolution (gap SF-PII-deformation) and the absence of nonsplit étale covers give H^j = 0 for j ≥ 2.
3. Cover Spec A by finitely many opens over which G embeds in an abelian scheme B (Raynaud's embedding, FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1/raynaud-abelian-embedding, as in BBM 3.1.1); if p^n kills G then G ⊂ B[p^n], a truncated p-divisible group with finite locally free quotient B[p^n]/G. Subdividing I, assume 0 → G → G\_1 → G\_2 → 0 with G\_1 = B[p^n]. By exactness of 𝕄 (PD.6/covariant-normalisation) and the snake lemma reduce to G = B[p^n], and through the filtration by the B[p^i] (whose graded pieces are ≅ B[p]) to G = B[p], the p-torsion of the p-divisible group B[p^∞]; then 𝕄(G) is a finite projective A^♭-module, a direct summand of a finite free one.
4. Right vertical map: injective as a^♭ is a nonzerodivisor; surjective because a V-fixed m ∈ 𝕄(G)[1/a^♭] with b·m ∈ 𝕄(G) also has b^{1/p}·m ∈ 𝕄(G), and elements b of A^♭[1/a^♭] all of whose p-power roots stay bounded lie in A^♭.
5. Surjectivity of V − 1: first after base change to ∏ K\_i^♭ (Claim 4.2.10.1): factorwise, either A\_i has characteristic p and it is (4.2.4.1), or ξ is invertible, F and V are bijective on M = 𝕄(G\_{A\_i}) ⊗ K\_i^♭ and PF.3/frobenius-fixed-points-algebraically-closed applies. Then descend from ∏ K\_i^♭ to 𝕄(G)[1/a^♭] stalkwise on Spec A^♭[1/a^♭], whose local rings are perfect valuation rings, using Claim 4.2.10.2: for a perfect valuation ring W with fraction field L, a finite free W-module M and Frob^{-1}-semilinear V, any x ∈ M\_L with V(x) − x ∈ M lies in M.
6. Uniqueness of the square follows from bijectivity of the vertical maps.

**Checks.**

- For I a singleton and A = 𝒪\_C with C algebraically closed perfectoid, a = p: H^j(C, G) = 0 for j ≥ 1 and G(𝒪\_C) = G(C).
- For G = μ\_p: (𝕄(μ\_p)[1/[a^♭]])^{V=1} = μ\_p(A[1/a]) = μ\_p(K) = ∏\_i μ\_p(K\_i), where μ\_p(K\_i) = ℤ/p if K\_i has characteristic 0 and μ\_p(K\_i) = 0 if it has characteristic p.
- The algebraic closedness of the K\_i is needed for the surjectivity of V − 1: over a perfectoid field C that is not algebraically closed, H^1(C, ℤ/p) can be nonzero.

**Sources.**

- `CS24`, Proposition 4.2.10 and its proof with Claims 4.2.10.1–4.2.10.2, pp. 43–45: Over products of complete rank-≤1 valuation rings with algebraically closed fraction fields, V − 1 is surjective on localized Dieudonné modules, flat cohomology of A[1/a] vanishes in positive degrees, and the low-degree identifications are compatible with localization.
- `CS24`, Lemma 2.2.4, p. 19; Proposition 2.1.9, p. 14: Local structure of Spec of a product of valuation rings, and tilting of valuation rings with algebraically closed fraction fields.

**Needs.** `PurityForFlatCohomology:PF.3/perfectoid-low-degree-cohomology`, `PurityForFlatCohomology:PF.3/dieudonne-modules-over-products`, `PurityForFlatCohomology:PF.3/frobenius-fixed-points-algebraically-closed`, `ArcTopologyAndDescent:AT.11/complete-valuation-product-basis`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/raynaud-abelian-embedding`, `PrismaticCohomologyPartII:PD.6/covariant-normalisation`, `PerfectoidQuotients:Q0:integral-algebra/products-of-perfectoid-rings`.

**Used by.** `PurityForFlatCohomology:PF.3/key-formula`.

**Proposed location.** `TauCeti/AlgebraicGeometry/Purity/PF3.lean`, namespace `TauCetiRoadmap.PurityForFlatCohomology`. Implementation status: unchecked.

### 3.8 p-complete arc hyperdescent of flat cohomology on perfectoids

**Theorem** (`PurityForFlatCohomology:PF.3/flat-side-arc-descent`; planet **Arc descent for flat cohomology of perfectoids**). For a prime p, a perfectoid ring A, a commutative finite locally free A-group G and a closed Z ⊂ Spec(A/pA), the functors A' ↦ RΓ(A', G) and A' ↦ RΓ\_Z(A', G) satisfy hyperdescent for p-complete arc hypercovers A' → A'^• whose terms are perfectoid A-algebras.

**Hypotheses and conventions.** A perfectoid; hypercovers with perfectoid terms; G arbitrary commutative finite locally free (not only of p-power order).

**Proof outline.**

1. Reduce to Z = Spec(A/p): for a ∈ A vanishing on Z the p-adic completion of A[1/a] is perfectoid (CS24 Corollary 2.1.6; A[1/a] is étale over A, so this is PerfectoidQuotients Q0/completely-etale-and-henselian-perfectoid once derived and classical p-completion agree, which holds by bounded p-torsion), excision (CS24 Theorem 5.4.4 or Corollary 5.3.8; gap SF-PII-excision) gives RΓ\_{p=0}(A[1/a], G) ≅ RΓ\_{p=0}(A[1/a]^∧, G), and the fibre sequence RΓ\_Z(A) → RΓ\_{p=0}(A) → R lim\_a RΓ\_{p=0}(A[1/a]) (5.5.1.1) reduces to supports {p = 0}.
2. A' ↦ RΓ(A'[1/p], G) satisfies the hyperdescent by arc descent for étale cohomology (ArcTopologyAndDescent AT.11/complete-etale-hyperdescent and AT.6/torsion-arc-hyperdescent, CS24 Theorem 2.2.5), so the support triangle reduces to A' ↦ RΓ(A', G).
3. The prime-to-p part of G is handled by arc descent and Gabber's henselian invariance (ArcTopologyAndDescent AT.8/gabber-affine-proper-base-change); for G of p-power order use p-adic continuity RΓ(A', G) ≅ R lim\_n RΓ(A'/^L p^n, G) (CS24 Theorem 5.3.5; gap SF-PII-continuity).
4. A' ↦ A'/^L x satisfies the hyperdescent for x = p and x = π^{1/p^n} (π a unit multiple of p with compatible roots), as the cofibre of multiplication by x on A' ↦ A' (AT.12/integral-perfectoid-hyperdescent); the deformation triangle (CS24 Theorem 5.2.8; gap SF-PII-deformation) reduces from A'/^L p^n to A'/^L p and then, because the fibres of the comparison maps are identified along n, to the filtered colimit A'/^L π^{1/p^∞} ≅ (A'/pA')\_red, a perfect 𝔽\_p-algebra (CS24 (2.1.2.3) and (2.1.3.2), gap PQ-PII-towers; PerfectoidQuotients Q0/perfectoid-rings-reduced).
5. For perfect 𝔽\_p-algebras the positive-characteristic key formula (CS24 (4.1.8.2); gap SF-PII-key-formula) identifies RΓ(A', G) with RΓ(W(A'), 𝕄(G\_{A'}))^{V=1}, which satisfies the hyperdescent by PF.3/dieudonne-side-arc-descent.

**Checks.**

- For G étale of order prime to p it is arc hyperdescent of étale cohomology on perfectoids.
- For A = 𝒪\_C and the cover by a product of rank-one valuation rings with algebraically closed fraction fields, it computes RΓ(𝒪\_C, G) from the products, where it is concentrated in degree 0 by PF.3/product-valuation-local-analysis.

**Sources.**

- `CS24`, Theorem 5.5.1 and its proof, pp. 68–69; announced as Theorem 1.2.3, p. 6: Flat cohomology and flat cohomology with supports of perfectoid rings satisfy p-complete arc hyperdescent on perfectoid algebras, proved by excision to supports along p = 0, arc descent for the generic fibre, p-adic continuity, deformation theory down to the perfect ring (A/p)\_red and the crystalline key formula.

**Needs.** `PurityForFlatCohomology:PF.3/dieudonne-side-arc-descent`, `ArcTopologyAndDescent:AT.11/complete-etale-hyperdescent`, `ArcTopologyAndDescent:AT.6/torsion-arc-hyperdescent`, `ArcTopologyAndDescent:AT.8/gabber-affine-proper-base-change`, `ArcTopologyAndDescent:AT.12/integral-perfectoid-hyperdescent`, `PerfectoidQuotients:Q0:integral-algebra/completely-etale-and-henselian-perfectoid`, `PerfectoidQuotients:Q0:integral-algebra/perfectoid-rings-reduced`, `PrismaticCohomologyPartII:PD.6/perfect-base-classification`, `PurityForFlatCohomology:PF.0/flat-cohomology-with-supports`.

**Used by.** `PurityForFlatCohomology:PF.3/key-formula`.

**Proposed location.** `TauCeti/AlgebraicGeometry/Purity/PF3.lean`, namespace `TauCetiRoadmap.PurityForFlatCohomology`. Implementation status: unchecked.

### 3.9 The key formula for flat cohomology of perfectoid rings

**Theorem** (`PurityForFlatCohomology:PF.3/key-formula`; planet **The key formula**). For a prime p, a perfectoid ring A, a commutative finite locally free A-group G of p-power order and a closed Z ⊂ Spec(A/pA), there is an identification RΓ\_Z(A, G) ≅ RΓ\_Z(A\_inf(A), 𝕄(G))^{V=1}, functorial in A, G and Z (with the same ξ used to define V over all perfectoid A-algebras).

**Hypotheses and conventions.** A perfectoid (one may assume A a ℤ\_p-algebra); G of p-power order; Z closed in Spec(A/p).

**Proof outline.**

1. Assume A a ℤ\_p-algebra and, by passing to an inverse limit, Z the vanishing locus of finitely many elements.
2. Case A = ∏ A\_i with A\_i perfectoid valuation rings of rank ≤ 1 with algebraically closed fraction fields: Z is cut out by one a | p, with compatible roots a^♭ cutting out Z in Spec(A^♭/p^♭). PF.3/product-valuation-local-analysis gives H^i(A, G) = H^i(A[1/a], G) = 0 for i ≥ 1, surjectivity of V − 1 on 𝕄(G) and 𝕄(G)[1/[a^♭]], and the unique compatible square of degree-zero identifications; by the support sequences both sides are concentrated in degree 0 and identified, functorially by uniqueness.
3. General A: both sides satisfy hyperdescent for p-complete arc hypercovers with perfectoid terms (PF.3/flat-side-arc-descent and PF.3/dieudonne-side-arc-descent), and products as above form a basis of the p-complete arc topology of A (ArcTopologyAndDescent AT.11/complete-valuation-product-basis, CS24 Lemma 2.2.3, with the factors perfectoid by CS24 (2.1.2.3) and the product perfectoid by PerfectoidQuotients Q0/products-of-perfectoid-rings); conclude by descent along such a hypercover.

**Checks.**

- For A a perfect 𝔽\_p-algebra and ξ = p it is the crystalline key formula RΓ\_Z(A, G) ≅ RΓ\_Z(W(A), 𝕄(G))^{V=1} (CS24 (4.1.8.2)).
- For Z = Spec(A/p) and G = ℤ/p over a perfect A it is the Artin–Schreier description of RΓ(A, ℤ/p).
- For perfect A of characteristic p, Z = Spec A and ξ = p, the formula recovers the absolute low-degree descriptions of PF.3/perfectoid-low-degree-cohomology. For mixed-characteristic A, Z = Spec(A/p) is a support condition and need not be all of Spec A; use the localization triangle instead of identifying it with absolute cohomology.

**Sources.**

- `CS24`, Theorem 6.1.1, (6.1.1.1) and its proof, p. 82; announced as (1.1.6), p. 4: RΓ\_Z(A, G) ≅ RΓ\_Z(A\_inf(A), 𝕄(G))^{V=1} for perfectoid A, functorially, proved on products of perfectoid valuation rings and extended by p-complete arc hyperdescent of both sides.

**Needs.** `PurityForFlatCohomology:PF.3/product-valuation-local-analysis`, `PurityForFlatCohomology:PF.3/flat-side-arc-descent`, `PurityForFlatCohomology:PF.3/dieudonne-side-arc-descent`, `PurityForFlatCohomology:PF.3/dieudonne-side-complex`, `PurityForFlatCohomology:PF.3/perfectoid-low-degree-cohomology`, `ArcTopologyAndDescent:AT.11/complete-valuation-product-basis`, `PerfectoidQuotients:Q0:integral-algebra/products-of-perfectoid-rings`.

**Used by.** `PurityForFlatCohomology:PF.3/perfectoid-purity`, `PurityForFlatCohomology:PF.4/flat-purity-regular`.

**Proposed location.** `TauCeti/AlgebraicGeometry/Purity/PF3.lean`, namespace `TauCetiRoadmap.PurityForFlatCohomology`. Implementation status: unchecked.

### 3.10 Purity for flat cohomology of perfectoid rings

**Theorem** (`PurityForFlatCohomology:PF.3/perfectoid-purity`; planet **Purity for perfectoid rings**). For a prime p, a perfectoid ring A, a commutative finite locally free A-group G of p-power order, a closed Z ⊂ Spec(A/pA) and an A-regular sequence a\_1, …, a\_d ∈ A vanishing on Z, H^i\_Z(A, G) = 0 for i < d.

**Hypotheses and conventions.** A perfectoid; a\_1, …, a\_d an A-regular sequence (EGA convention) whose members vanish on Z; G of p-power order.

**Proof outline.**

1. By PF.3/key-formula and the long exact sequence of PF.3/dieudonne-side-complex, it suffices that H^i\_Z(A\_inf(A), 𝕄(G)) = 0 for i < d (6.1.2.1).
2. 𝕄(G) is finitely presented of projective dimension ≤ 1 over A\_inf(A) (PD.6/covariant-normalisation), so it suffices that H^i\_Z(A\_inf(A), A\_inf(A)) = 0 for i < d + 1.
3. Let ξ generate ker θ and choose lifts ã\_1, …, ã\_d ∈ A\_inf(A) of a\_1, …, a\_d ∈ A = A\_inf(A)/ξ. Since ξ is a nonzerodivisor (PrismaticCohomology PR.0/ainf-prism) and the a\_k are regular on A\_inf(A)/ξ = A, the sequence ξ, ã\_1, …, ã\_d is A\_inf(A)-regular; it vanishes on Z ⊂ Spec(A/p) ⊂ Spec A\_inf(A), and PF.0/regular-sequence-support-vanishing concludes by decreasing induction along A\_inf(A)/(ξ, ã\_1, …, ã\_j).

**Checks.**

- For A a perfect 𝔽\_p-algebra (ξ = p) it is the last step of PF.2/char-p-complete-intersection-purity.
- For A = the p-adic completion of W(k)⟦x\_1^{1/p^∞}, …, x\_d^{1/p^∞}⟧/(p − f) and Z the closed point, the regular sequence x\_1, …, x\_d gives H^i\_Z(A, G) = 0 for i < d, the input to PF.4/flat-purity-regular.
- For d = 0 nothing is asserted, and indeed H^0(𝔽\_p, ℤ/p) = ℤ/p ≠ 0 for A = 𝔽\_p and Z = Spec 𝔽\_p; the degree i = d is analysed separately for the towers of PF.4/flat-purity-regular.

**Sources.**

- `CS24`, Theorem 6.1.2 and its proof, pp. 82–83; announced as Theorem 1.1.5, p. 4: On a perfectoid ring, flat cohomology with supports vanishes below the length of a regular sequence vanishing on Z, by the key formula, projective dimension ≤ 1 of 𝕄(G) and the A\_inf-regular sequence ξ, a\_1, …, a\_d.
- `CS24`, §1.1, p. 5: The decisive point is that depth\_Z(A) ≥ d implies depth\_Z(A\_inf(A)) ≥ d + 1 through ξ.

**Needs.** `PurityForFlatCohomology:PF.3/key-formula`, `PurityForFlatCohomology:PF.3/dieudonne-side-complex`, `PurityForFlatCohomology:PF.0/regular-sequence-support-vanishing`, `PrismaticCohomologyPartII:PD.6/covariant-normalisation`, `PrismaticCohomology:PR.0/ainf-prism`.

**Used by.** `PurityForFlatCohomology:PF.4/flat-purity-complete-intersection`, `PurityForFlatCohomology:PF.4/flat-purity-regular`.

**Proposed location.** `TauCeti/AlgebraicGeometry/Purity/PF3.lean`, namespace `TauCetiRoadmap.PurityForFlatCohomology`. Implementation status: unchecked.

## Layer PF.4: Purity for complete intersections and regular local rings

Prove the main theorem of Česnavičius–Scholze: for a Noetherian local complete intersection (R, 𝔪) and a commutative finite flat R-group G, H^i\_𝔪(R, G) = 0 for i < dim R (Theorem 6.2.3), by completion, residue and perfectoid towers, André's lemma and the root-extraction lemma; its virtual-dimension form H^i\_𝔪(R, G) = 0 for i < vdim(R) for all finite étale G (Theorem 6.2.4), with the counterexample 𝔽\_p⟦x, y, z, t⟧/(x^2, y^2, xz − yt) showing that vdim cannot replace dim for α\_p (Remark 6.2.6); and the sharpening H^i\_𝔪(R, G) = 0 for i ≤ dim R for regular R not a field (Theorem 6.2.7). Includes the completion lemma for regular sequences with bounded torsion (Lemma 6.2.2). The regular residue/perfectoid towers are imports from PerfectoidSpaces P7.16a–P7.17; only their explicit-tilt refinements are requested elsewhere.

Layer imports: `PurityForFlatCohomology:PF.0`, `PurityForFlatCohomology:PF.1`, `PurityForFlatCohomology:PF.2`, `PurityForFlatCohomology:PF.3`, `PerfectoidQuotients:Q0:integral-algebra`, `PerfectoidQuotients:Q3`, `DeformationAndDerivedPatchingAlgebra:R03.1`, `DeformationAndDerivedPatchingAlgebra:R03.3`, `DerivedDeRhamCohomology:DD.1`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1`, `PrismaticCohomologyPartII:PD.6`, `LefschetzPencilsAndVanishingCycles:LPV.0`, `PerfectoidSpaces:P7`.

### 4.1 Regular sequences survive adic completion under bounded torsion

**Theorem** (`PurityForFlatCohomology:PF.4/completion-regular-sequence`). Let A be a ring, a ∈ A and Â the a-adic completion. If a\_1, …, a\_n ∈ A is an A-regular sequence such that each A/(a\_1, …, a\_i), 0 ≤ i ≤ n, has bounded a^∞-torsion, then a\_1, …, a\_n is Â-regular and Â/(a\_1, …, a\_n) ≅ (A/(a\_1, …, a\_n))^∧ (a-adic completion).

**Hypotheses and conventions.** A arbitrary commutative ring; bounded a^∞-torsion of a module M means M[a^∞] = M[a^N] for some N; regular sequences in the EGA sense.

**Proof outline.**

1. Bounded a^∞-torsion makes derived and classical a-adic completion agree on each A/(a\_1, …, a\_{i−1}) (the a-adic form of DerivedDeRhamCohomology DD.1/bounded-torsion-criterion, which states it for p; requested from DD.1 for an arbitrary element a), so the derived completion of 0 → A/(a\_1, …, a\_{i−1}) → A/(a\_1, …, a\_{i−1}) → A/(a\_1, …, a\_i) → 0 (first map multiplication by a\_i) is the classical one and stays exact.
2. The resulting short exact sequences of completions show inductively that a\_i is a nonzerodivisor on Â/(a\_1, …, a\_{i−1}) = (A/(a\_1, …, a\_{i−1}))^∧ and identify the quotients.

**Checks.**

- For A Noetherian every finite module has bounded a^∞-torsion, so the lemma applies to every regular sequence.
- For A = ℤ\_p[x], a = p and the sequence x, it gives ℤ\_p⟨x⟩/(x) = ℤ\_p.
- In CS24 it is applied to A = R̃\_∞ = W(k)⟦x^{1/p^∞}⟧/(p − f) with a = p and to A/(f\_1^{1/p^∞}, …, f\_n^{1/p^∞}), whose p^∞-torsion is killed by a fixed p^N.

**Sources.**

- `CS24`, Lemma 6.2.2 and its proof, p. 83: Under bounded a^∞-torsion of all partial quotients, a regular sequence stays regular in the a-adic completion and completion commutes with the quotient, because derived and classical completions agree.

**Needs.** `mathlib:AdicCompletion`, `mathlib:RingTheory.Sequence.IsWeaklyRegular`, `DerivedDeRhamCohomology:DD.1`.

**Used by.** `PurityForFlatCohomology:PF.4/flat-purity-complete-intersection`.

**Proposed location.** `TauCeti/AlgebraicGeometry/Purity/PF4.lean`, namespace `TauCetiRoadmap.PurityForFlatCohomology`. Implementation status: unchecked.

### 4.2 Purity for flat cohomology of local complete intersections

**Theorem** (`PurityForFlatCohomology:PF.4/flat-purity-complete-intersection`; planet **Purity for flat cohomology of complete intersections**). For a Noetherian local ring (R, 𝔪) that is a complete intersection and a commutative finite flat R-group G, H^i\_𝔪(R, G) = 0 for i < dim R.

**Hypotheses and conventions.** R Noetherian local complete intersection (DeformationAndDerivedPatchingAlgebra R03.3/complete-intersections); G commutative finite flat (equivalently finite locally free, R being local).

**Proof outline.**

1. Decompose G into primary parts. If the order of the part is invertible in R, PF.1/etale-depth-virtual-dimension applies with vdim(R) = dim R; so assume G of p-power order with p = char(R/𝔪) > 0.
2. Excision to the completion (CS24 Corollary 5.4.5; gap SF-PII-excision) allows R 𝔪-adically complete; by the Cohen structure theorem with a Cohen ring C(k) (DeformationAndDerivedPatchingAlgebra R03.1/cohen-series-presentation) R ≅ R̃/J with R̃ = C(k)⟦x\_1, …, x\_N⟧ unramified complete regular local, and J is generated by a regular sequence f\_1, …, f\_n ∈ 𝔪̃ because R is a complete intersection and this property does not depend on the regular presentation (Stacks 09Q1; requested from R03.3). Argue by induction on i for all R at once.
3. Residue extension: the regular finite flat system R̃\_j of CS24 Lemma 3.1.1(a) (gap PQ-PII-towers), PF.2/finite-flat-cover-reduction, a limit argument (PF.0, API limit) and Corollary 5.4.5 again reduce to R̃ with algebraically closed residue field.
4. Perfectoid tower: Lemma 3.1.1(b) (gap PQ-PII-towers) supplies a faithfully flat R̃-algebra R̃\_∞ = W(k)⟦x^{1/p^∞}⟧/(p − f) with perfectoid p-adic completion, and the same reductions bring us to H^i\_𝔪(R̃\_∞/(f\_1, …, f\_n), G) = 0 for i < dim R. By CS24 Corollary 5.3.8 (gap SF-PII-continuity) and PF.4/completion-regular-sequence replace R̃\_∞ by its completion: it suffices to treat every p-torsion-free perfectoid A, p-completely faithfully flat over R̃; such A is R̃-flat (CS24 Lemma 6.2.1, Yekutieli; request to DerivedDeRhamCohomology DD.1), so f\_1, …, f\_n is A-regular.
5. Roots: André's lemma (PerfectoidQuotients Q3/andre-flatness-lemma, BS22 Theorem 7.14, CS24 footnote 25) gives a p-completely faithfully flat perfectoid A → A' containing compatible p-power roots of the f\_i; Corollary 5.5.3 with Theorem 5.4.4 (gap SF-PII-excision) and PF.4/completion-regular-sequence give the descent spectral sequence whose terms are the completed tensor powers of A' (perfectoid by PerfectoidQuotients Q0/completed-perfectoid-tensor-products), so assume the f\_i^{1/p^∞} lie in A.
6. PF.2/root-extraction-comparison with a limit argument reduces to H^i\_𝔪(A/(f\_1^{1/p^∞}, …, f\_n^{1/p^∞}), G) = 0 for i < dim R. A fixed power p^N kills the p^∞-torsion of all A/(f^{1/p^{m}}, r\_1, …, r\_j) for an R-regular sequence r\_1, …, r\_{dim R} (Stacks 07DV and R̃-flatness), so PF.4/completion-regular-sequence keeps r\_1, …, r\_{dim R} regular on the p-adic completion of A/(f^{1/p^∞}), which is perfectoid (PerfectoidQuotients Q0/completed-root-stable-quotients). PF.3/perfectoid-purity and Corollary 5.3.8 conclude.

**Checks.**

- For regular local R of dimension 2 and G = μ\_p, this theorem gives H^0\_𝔪 = H^1\_𝔪 = 0, hence unique extension of sections and injectivity on torsors. PF.4/flat-purity-regular additionally kills H^2\_𝔪 and gives extension of every μ\_p-torsor.
- For R = W(k)⟦x, y⟧/(p − xy) (a mixed-characteristic hypersurface of dimension 2) and G = ℤ/p or μ\_p, H^i\_𝔪(R, G) = 0 for i < 2.
- For G = α\_p over the 𝔽\_p-algebra 𝔽\_p⟦x, y⟧, it agrees with PF.2/additive-group-depth-vanishing.
- The complete-intersection hypothesis cannot be relaxed to Cohen–Macaulay (PF.5/cohen-macaulay-counterexample) nor to vdim (PF.4/virtual-dimension-flat-counterexample).

**Sources.**

- `CS24`, Theorem 6.2.3 and its proof, pp. 83–84; announced as Theorem 1.1.1, p. 3: For Noetherian local complete intersections and commutative finite flat G, H^i\_𝔪(R, G) = 0 below dim R, reduced to the perfectoid purity theorem through completion, residue and perfectoid towers, André's lemma and the root-extraction lemma.
- `CS24`, Footnote 25, p. 84: André's lemma in the form of Bhatt–Scholze, Theorem 7.14, combined with Corollary 5.5.3 and Theorem 5.4.4, may replace the ind-syntomic Theorem 2.3.4.

**Needs.** `PurityForFlatCohomology:PF.1/etale-depth-virtual-dimension`, `PurityForFlatCohomology:PF.2/finite-flat-cover-reduction`, `PurityForFlatCohomology:PF.2/root-extraction-comparison`, `PurityForFlatCohomology:PF.3/perfectoid-purity`, `PurityForFlatCohomology:PF.4/completion-regular-sequence`, `PurityForFlatCohomology:PF.0/flat-cohomology-with-supports`, `PurityForFlatCohomology:PF.1/virtual-dimension`, `PerfectoidQuotients:Q3/andre-flatness-lemma`, `PerfectoidQuotients:Q0:integral-algebra/completed-perfectoid-tensor-products`, `PerfectoidQuotients:Q0:integral-algebra/completed-root-stable-quotients`, `DeformationAndDerivedPatchingAlgebra:R03.1/cohen-series-presentation`, `DeformationAndDerivedPatchingAlgebra:R03.3/complete-intersections`, `DerivedDeRhamCohomology:DD.1`, `DeformationAndDerivedPatchingAlgebra:R03.3`, `PerfectoidSpaces:P7/regular-finite-flat-residue-tower`, `PerfectoidSpaces:P7/regular-finite-flat-perfectoid-tower`.

**Used by.** `PurityForFlatCohomology:PF.4/etale-purity-virtual-dimension`, `PurityForFlatCohomology:PF.4/flat-purity-regular`, `PurityForFlatCohomology:PF.5/global-flat-purity`, `PurityForFlatCohomology:PF.5/local-picard-torsion-vanishing`, `PurityForFlatCohomology:PF.5/brauer-purity-complete-intersection`, `PurityForFlatCohomology:PF.5/multiplicative-type-purity-low-degree`.

**Proposed location.** `TauCeti/AlgebraicGeometry/Purity/PF4.lean`, namespace `TauCetiRoadmap.PurityForFlatCohomology`. Implementation status: unchecked.

### 4.3 Purity for finite étale coefficients below the virtual dimension

**Theorem** (`PurityForFlatCohomology:PF.4/etale-purity-virtual-dimension`; planet **Étale purity below the virtual dimension**). For a Noetherian local ring (R, 𝔪) and a commutative finite étale R-group G, H^i\_𝔪(R, G) = 0 for i < vdim(R).

**Hypotheses and conventions.** R Noetherian local, arbitrary; G finite étale commutative of any order.

**Proof outline.**

1. The proof of PF.1/etale-depth-virtual-dimension settles the part of G of order invertible in R and, for the rest, reduces (strict henselization, completion, closed-cover reduction, which work for any finite étale G) to G = ℤ/p with p = char(R/𝔪) > 0 and R = R̃/(f) a hypersurface.
2. A hypersurface in a regular local ring is a complete intersection with vdim(R) = dim R (PF.1/virtual-dimension), so PF.4/flat-purity-complete-intersection gives H^i\_𝔪(R, ℤ/p) = 0 for i < dim R = vdim(R).

**Checks.**

- For R = 𝔽\_p⟦x, y, z, t⟧/(x^2, y^2, xz − yt) (vdim 1) it gives H^0\_𝔪(R, ℤ/p) = 0, although H^0\_𝔪(R, α\_p) ≠ 0 (PF.4/virtual-dimension-flat-counterexample).
- For R a complete intersection it is the étale case of PF.4/flat-purity-complete-intersection.
- For vdim(R) ≤ 0 nothing is asserted.

**Sources.**

- `CS24`, Theorem 6.2.4 and its proof, pp. 84–85; announced as Theorem 1.3.1, p. 8: The virtual-dimension bound for all finite étale G, obtained from the reduction of Theorem 3.2.4 to hypersurfaces and Theorem 6.2.3 for ℤ/p.
- `CS24`, Remark 6.2.5, p. 85: For G = ℤ/p the proof of Theorem 6.2.3 simplifies: completion by Lemma 3.1.2, no root-extraction lemma, and tilting in place of the perfectoid purity theorem.

**Needs.** `PurityForFlatCohomology:PF.1/etale-depth-virtual-dimension`, `PurityForFlatCohomology:PF.4/flat-purity-complete-intersection`, `PurityForFlatCohomology:PF.1/virtual-dimension`.

**Used by.** None.

**Proposed location.** `TauCeti/AlgebraicGeometry/Purity/PF4.lean`, namespace `TauCetiRoadmap.PurityForFlatCohomology`. Implementation status: unchecked.

### 4.4 Flat purity fails below the virtual dimension for non-étale coefficients

**Theorem** (`PurityForFlatCohomology:PF.4/virtual-dimension-flat-counterexample`). Let R = 𝔽\_p⟦x, y, z, t⟧/(x^2, y^2, xz − yt). Then vdim(R) = 1, and the element xy ∈ R is nonzero, satisfies (xy)^p = 0 and is killed by the maximal ideal; hence it defines a nonzero element of H^0\_𝔪(R, α\_p). So PF.4/flat-purity-complete-intersection does not extend from complete intersections to rings of given virtual dimension for G = α\_p.

**Hypotheses and conventions.** p any prime; R as displayed (dimension 2, not a complete intersection).

**Proof outline.**

1. vdim(R) = 4 − 3 = 1 because x^2, y^2, xz − yt are minimal generators (PF.1/virtual-dimension).
2. xy ≠ 0 in R (a monomial basis computation), (xy)^p = 0 since x^2 = 0, and x·xy = y·xy = 0, z·xy = y·(xz) = y^2t = 0, t·xy = x·(yt) = x^2z = 0; thus xy is supported at 𝔪, i.e. lies in ker(α\_p(R) → α\_p(U\_R)) = H^0\_𝔪(R, α\_p) (PF.0/flat-cohomology-with-supports).

**Checks.**

- By PF.4/etale-purity-virtual-dimension, H^0\_𝔪(R, ℤ/p) = 0 for the same R, so the failure is specific to non-étale G.
- The same element lies in H^0\_𝔪(R, 𝔾\_a), so depth\_𝔪(R) = 0.

**Sources.**

- `CS24`, Remark 6.2.6, p. 85: For 𝔽\_p⟦x, y, z, t⟧/(x^2, y^2, xz − yt) the nonzero element xy dies on the punctured spectrum and gives a nonzero class in H^0\_𝔪(R, α\_p), so vdim cannot replace dim in Theorem 6.2.3.

**Needs.** `PurityForFlatCohomology:PF.1/virtual-dimension`, `PurityForFlatCohomology:PF.0/flat-cohomology-with-supports`.

**Used by.** None.

**Proposed location.** `TauCeti/AlgebraicGeometry/Purity/PF4.lean`, namespace `TauCetiRoadmap.PurityForFlatCohomology`. Implementation status: unchecked.

### 4.5 Purity for flat cohomology of regular local rings in degree dim R

**Theorem** (`PurityForFlatCohomology:PF.4/flat-purity-regular`; planet **Purity in degree dim R for regular rings**). For a regular local ring (R, 𝔪) that is not a field and a commutative finite flat R-group G, H^i\_𝔪(R, G) = 0 for i ≤ dim R.

**Hypotheses and conventions.** R regular local of dimension d ≥ 1; G commutative finite flat.

**Proof outline.**

1. PF.4/flat-purity-complete-intersection gives i < d; it remains to treat i = d. For the parts of G of order invertible in R, absolute purity (LefschetzPencilsAndVanishingCycles §0.10) gives vanishing below 2d > d; so assume G of p-power order with p = char(R/𝔪) > 0.
2. Embed G into an abelian scheme B (Raynaud's embedding, FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1/raynaud-abelian-embedding, as in BBM 3.1.1; R is local), so G ⊂ B[p^n] when p^n kills G; the long exact sequence with PF.4/flat-purity-complete-intersection for the finite locally free cokernel B[p^n]/G reduces to G = B[p^n], and the filtration by the B[p^i], with graded pieces ≅ B[p], to G = B[p], the p-torsion of the p-divisible group H = B[p^∞].
3. Complete R using gap SF-PII-excision. At the boundary degree d, use PF.0 finite faithfully flat descent, together with the already proved CI vanishing H^t = 0 for t < d on localizations of the self-tensor products. These local rings are complete intersections: they are finite flat over the regular base with zero-dimensional complete-intersection fibres. The spectral sequence gives an injection H^d\_𝔪(R,G) → H^d\_{𝔪R′}(R′,G). It therefore permits the residue-field tower of PerfectoidSpaces P7.16a (CS24 Lemma 3.1.1(a)), followed by continuity and completion. This uses the descent spectral sequence at degree d, not the n < dim R hypothesis of PF.2/finite-flat-cover-reduction.
4. Now the residue field k is algebraically closed and R ≅ W(k)⟦x\_1,…,x\_d⟧/(p − f), with f = x\_1 or f ∈ (p,x\_1,…,x\_d)^2; f = 0 includes equal characteristic. Use the finite flat regular tower of PerfectoidSpaces P7.17 in mixed characteristic and the ordinary perfection tower in characteristic p. Boundary-degree descent as above reduces to the colimit; gap SF-PII-continuity then allows its perfectoid p-adic completion R̂\_∞. Complete flatness (request DD.1) keeps x\_1,…,x\_d regular. The explicit tilt-completion description remains in the narrowed gap PQ-PII-towers.
5. The pd ≤ 1 module estimate (6.1.2.1) gives H^i\_Z(A\_inf(R̂\_∞),𝕄(G)) = 0 for i < d, not i < d + 1. Its degree d − 1 vanishing and PF.3/key-formula identify H^d\_Z(R̂\_∞,G) with ker(V − 1 on H^d\_Z(A\_inf(R̂\_∞),𝕄(G))). Because G = H[p], 𝕄(G) is a finite free module over the local tilt R̂\_∞^♭; thus this kernel is computed on the tilt.
6. The tilt is the f-adic completion of k⟦(x\_1^♭)^{1/p^∞},…,(x\_d^♭)^{1/p^∞}⟧. The completion agrees with that ring modulo every tuple ((x\_1^♭)^{n\_1},…,(x\_d^♭)^{n\_d}), so its top local cohomology has k-basis the monomials with all exponents negative in ℤ[1/p]. An element has finite support in this basis. Choose its smallest signed total exponent a\_1 + ⋯ + a\_d. Frobenius inverse divides this negative sum by p and matrix coefficients have nonnegative exponents, so every surviving term after applying V has strictly larger total exponent. Thus V has no nonzero fixed vector.

**Checks.**

- For R a discrete valuation ring (d = 1) with fraction field K and G = μ\_p, H^0\_𝔪 = H^1\_𝔪 = 0 amounts to μ\_p(R) = μ\_p(K) and injectivity of R^×/R^{×p} = H^1(R, μ\_p) → K^×/K^{×p}; both hold because R is integrally closed.
- The field case fails, for example for the constant nonzero group G = ℤ/n with n > 1: U\_K = ∅ and H^0\_𝔪(K,G) = G(K) = ℤ/n. A nontrivial group scheme need not have nontrivial K-points (μ\_p in characteristic p), so specify the coefficient group.
- For R = 𝔽\_p⟦x, y⟧ and G = α\_p: H^2\_𝔪(R, α\_p) = ker(F : H^2\_𝔪(R) → H^2\_𝔪(R)) (as H^1\_𝔪(R) = 0), which vanishes because Frobenius is flat on the regular ring R (Kunz) and hence injective on local cohomology.

**Sources.**

- `CS24`, Theorem 6.2.7 and its proof, pp. 85–86; announced in Theorem 1.1.1, p. 3: For regular local R that is not a field, H^i\_𝔪(R, G) = 0 for i ≤ dim R; the top degree is reduced to truncated p-divisible groups over the perfectoid tower and settled by the contracting action of V on the explicit top local cohomology of the tilt.
- `C19`, Lemmas 5.1–5.2, pp. 11–12: The residue-field and perfectoid towers over complete regular local rings used in the reduction.

**Needs.** `PurityForFlatCohomology:PF.4/flat-purity-complete-intersection`, `PurityForFlatCohomology:PF.3/key-formula`, `PurityForFlatCohomology:PF.3/perfectoid-purity`, `PurityForFlatCohomology:PF.2/finite-flat-cover-reduction`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/raynaud-abelian-embedding`, `PrismaticCohomologyPartII:PD.6/covariant-normalisation`, `DeformationAndDerivedPatchingAlgebra:R03.1/cohen-structure-and-compatible-coefficients`, `LefschetzPencilsAndVanishingCycles:LPV.0`, `DerivedDeRhamCohomology:DD.1`, `PurityForFlatCohomology:PF.0/flat-cohomology-with-supports`, `PerfectoidSpaces:P7/regular-finite-flat-residue-tower`, `PerfectoidSpaces:P7/regular-finite-flat-perfectoid-tower`.

**Used by.** `PurityForFlatCohomology:PF.5/global-flat-purity`, `PurityForFlatCohomology:PF.5/brauer-purity-complete-intersection`, `PurityForFlatCohomology:PF.5/multiplicative-type-purity-low-degree`, `PurityForFlatCohomology:PF.6/strict-local-brauer-purity`.

**Proposed location.** `TauCeti/AlgebraicGeometry/Purity/PF4.lean`, namespace `TauCetiRoadmap.PurityForFlatCohomology`. Implementation status: unchecked.

## Layer PF.5: Global purity and the conjectures of Gabber

Prove global purity H^i(X, G) ≅ H^i(X ∖ Z, G) for i < d − 1 and injectivity for i < d along complete intersections of dimension ≥ d or regular rings of dimension ≥ max(d − 1, 1) (Theorem 7.1.2, corrected), Moret-Bailly's purity for torsors and gerbes under finite locally free groups over regular schemes (Theorem 7.1.3, with Auslander's freeness criterion), Gabber's local Picard conjecture Pic(U\_R)\_tors = 0 for complete intersections of dimension ≥ 3 (Theorem 7.2.1) with its Cohen–Macaulay counterexample and the global Picard corollary for complete intersections in ℙ^n (Corollary 7.2.3), Gabber's local Brauer conjecture Br(R) ≅ Br(U\_R) for complete intersections of dimension ≥ 4 or regular of dimension ≥ 2 (Theorem 7.2.5) with its sharpness (Remark 7.2.6), and purity for groups of multiplicative type (Theorems 7.2.8–7.2.9). Defines parafactorial and geometrically parafactorial local rings and states Grothendieck's torsion and dimension-two results.

Layer imports: `PurityForFlatCohomology:PF.0`, `PurityForFlatCohomology:PF.4`, `SchemeAndStackFoundations:SF.0`, `SchemeAndStackFoundations:SF.1`, `SchemeAndStackFoundations:SF.2`, `DeformationAndDerivedPatchingAlgebra:R03.3`.

### 5.1 Global purity for flat cohomology with finite flat coefficients

**Theorem** (`PurityForFlatCohomology:PF.5/global-flat-purity`; planet **Global purity for finite flat coefficients**). Let X be a scheme, G a commutative finite locally free X-group, d an integer and Z ⊂ X a closed subset such that X ∖ Z → X is quasi-compact and, for every z ∈ Z, the local ring 𝒪\_{X,z} is either a complete intersection of dimension ≥ d or regular of dimension ≥ max(d − 1, 1). Then H^i(X, G) → H^i(X ∖ Z, G) is injective for i < d and bijective for i < d − 1; equivalently H^i\_Z(X, G) = 0 for i < d.

**Hypotheses and conventions.** X arbitrary scheme; the local rings at points of Z are Noetherian by hypothesis. The regular case requires dimension ≥ max(d − 1, 1), not merely ≥ d − 1: for d = 1 the source's condition admits fields, for which the statement is false (PurityForFlatCohomology/E1, after PAPER-CESNAVICIUS-SCHOLZE-24/E1).

**Proof outline.**

1. The assertion is H^i\_Z(X, G) = 0 for i < d. By the local-to-global spectral sequence of PF.0/flat-cohomology-with-supports and quasi-compactness of X ∖ Z → X (stalks of ℋ^j\_Z are cohomology with supports of strict henselizations) reduce to X strictly henselian local with Z ≠ ∅; the strict henselization of a complete intersection (regular ring) is a complete intersection (regular ring) of the same dimension, by the flat-local criterion (R → R^sh is flat with residue fibre a field), and so are the localizations at the generic points of Z used below (requested from DeformationAndDerivedPatchingAlgebra R03.3); X is Noetherian.
2. Noetherian induction on Z: if Z ≠ {𝔪}, choose a generic point z of Z and open neighbourhoods U of z. The Mayer–Vietoris sequence for U ∪ (X ∖ Z) (PF.0, API mayerVietoris) and, in the limit over U, the local theorems for 𝒪\_{X,z} — PF.4/flat-purity-complete-intersection (vanishing below dim ≥ d) and PF.4/flat-purity-regular (vanishing up to dim ≥ max(d − 1, 1)) — show that H^i(U, G) → H^i(U ∖ Z, G) is bijective for i < d − 1 and injective for i = d − 1, so classes extend over (or die on) U ∪ (X ∖ Z) and Z may be replaced by Z ∖ U.
3. At Z = {𝔪} the vanishing is exactly the local theorems.

**Checks.**

- For X = Spec R with R regular local of dimension 2, Z the closed point and d = 3: H^i(R, G) → H^i(U\_R, G) is injective for i < 3 and bijective for i < 2.
- For X = Spec k ⊔ Spec k, Z one point and d = 1 the uncorrected hypothesis would allow 𝒪\_{X,z} = k and the map H^0(X, G) → H^0(X ∖ Z, G) is not injective: the corrected bound max(d − 1, 1) excludes it.
- For a smooth variety X over a field and Z of codimension ≥ c, it gives H^i(X, μ\_p) ≅ H^i(X ∖ Z, μ\_p) for i < c − 1, even in characteristic p.

**Sources.**

- `CS24`, Theorem 7.1.2 and its proof, pp. 86–87; Lemma 7.1.1, p. 86: Injectivity below d and bijectivity below d − 1 of restriction to X ∖ Z for finite locally free commutative G when the local rings along Z are complete intersections of dimension ≥ d or regular of dimension ≥ d − 1, by the local-to-global spectral sequence, Mayer–Vietoris shrinking of Z and the local purity theorems.
- `CS24`, Source issue E1 of the paper extraction (Theorem 7.1.2, p. 87): At d = 1 the regular clause admits fields; the corrected hypothesis is dimension ≥ max(d − 1, 1).

**Needs.** `PurityForFlatCohomology:PF.4/flat-purity-complete-intersection`, `PurityForFlatCohomology:PF.4/flat-purity-regular`, `PurityForFlatCohomology:PF.0/flat-cohomology-with-supports`, `DeformationAndDerivedPatchingAlgebra:R03.3/complete-intersections`, `DeformationAndDerivedPatchingAlgebra:R03.3`.

**Used by.** `PurityForFlatCohomology:PF.5/multiplicative-type-purity-higher`.

**Proposed location.** `TauCeti/AlgebraicGeometry/Purity/PF5.lean`, namespace `TauCetiRoadmap.PurityForFlatCohomology`. Implementation status: unchecked.

### 5.2 Auslander's freeness criterion through endomorphisms

**Theorem** (`PurityForFlatCohomology:PF.5/auslander-endomorphism-freeness`). Let R be a regular local ring and M a finitely generated reflexive R-module such that Hom\_R(M, M) ≅ M^{⊕r} as R-modules for some r. Then M is free.

**Hypotheses and conventions.** R regular local; M finitely generated and reflexive (Mathlib Module.IsReflexive).

**Proof outline.**

1. The exact freeness criterion used here is explicitly invoked in CS24, proof of Theorem 7.1.3, p. 88; the hypotheses in this node are the reflexive finite-module case of that input. The case M=0 is immediate; for M nonzero the endomorphism isomorphism forces r>0.
2. The proposed proof by depth induction in the original plan was not justified: the Auslander–Buchsbaum formula alone does not show that End\_R(M)≅M^{⊕r} forces maximal depth. The original Auslander Theorem 1.3 proof could not be read from the public publisher endpoint. Its homological freeness argument is therefore an explicit proof obligation, gap AUSLANDER-FREENESS, rather than a claimed routine reduction. This node retains ownership of the criterion; its application in torsor-gerbe-purity uses the criterion exactly as stated in CS24.

**Checks.**

- For M = R^n the hypothesis holds with r = n and M is free.
- Over a non-regular ring reflexivity and maximal depth do not force freeness: over the A\_1 singularity R = k⟦x, y, z⟧/(xz − y^2) the ideal M = (x, y) is reflexive of rank one and of depth 2 = dim R but not free; here End\_R(M) ≅ R is not a sum of copies of M, so the criterion does not apply.
- For R a discrete valuation ring, finitely generated reflexive modules are free and the criterion is automatic.

**Sources.**

- `CS24`, Proof of Theorem 7.1.3, p. 88: A result of Auslander, which uses the regularity of the base, reduces flatness of j\_\*(𝒪\_Y) to an isomorphism between its endomorphism module and a direct sum of copies of itself.
- `Aus62`, Theorem 1.3: Over a regular local ring a finitely generated module whose endomorphism module is a direct sum of copies of it is free (not read; cited through CS24 p. 88).

**Needs.** `mathlib:IsRegularLocalRing`, `mathlib:Module.IsReflexive`, `mathlib:Module.Free`, `DeformationAndDerivedPatchingAlgebra:R03.3`.

**Used by.** `PurityForFlatCohomology:PF.5/torsor-gerbe-purity`.

**Proposed location.** `TauCeti/AlgebraicGeometry/Purity/PF5.lean`, namespace `TauCetiRoadmap.PurityForFlatCohomology`. Implementation status: unchecked.

### 5.3 Purity for torsors and gerbes under finite locally free groups (Moret-Bailly)

**Theorem** (`PurityForFlatCohomology:PF.5/torsor-gerbe-purity`; planet **Purity for torsors and gerbes**). Let X be a scheme, G a finite locally free X-group (not necessarily commutative) and Z ⊂ X a closed subset such that j : X ∖ Z → X is quasi-compact and each 𝒪\_{X,z}, z ∈ Z, is regular of dimension ≥ 2. Then pullback is an equivalence from G-torsors over X to G\_{X∖Z}-torsors over X ∖ Z. More generally, for every G-gerbe 𝔅 over X, 𝔅(X) → 𝔅(X ∖ Z) is an equivalence of groupoids; in particular ker(H^2(X, G) → H^2(X ∖ Z, G)) is trivial for the nonabelian H^2.

**Hypotheses and conventions.** X arbitrary; G finite locally free, possibly noncommutative; regularity of dimension ≥ 2 at every point of Z (Remark 7.1.4 of CS24 expects but does not prove the complete-intersection-of-dimension-≥-3 variant).

**Proof outline.**

1. Étale locally every G-gerbe is BG (BG is smooth), so étale descent reduces to G-torsors.
2. By glueing the claim is Zariski-local; localizing at a point of Z and spreading out (quasi-compactness of j) reduce to X local Noetherian with Z ≠ ∅. Full faithfulness: torsors are affine over X and depth\_Z(X) ≥ 2, so isomorphisms extend uniquely (PF.0/hartogs-regular-sequence(b), EGA IV 5.10.5).
3. Essential surjectivity: by Noetherian induction and spreading out assume Z is the closed point. For a G\_{X∖Z}-torsor Y, j\_\*(𝒪\_Y) is a coherent 𝒪\_X-algebra (EGA IV 5.11.4; SchemeAndStackFoundations §0.4); it suffices that it is flat, for then the torsor structure extends by full faithfulness to Spec\_X j\_\*(𝒪\_Y).
4. Flatness: by PF.5/auslander-endomorphism-freeness it suffices that Hom(j\_\*𝒪\_Y, j\_\*𝒪\_Y) ≅ (j\_\*𝒪\_Y)^{⊕r}; both sides are reflexive (depth ≥ 2), so it suffices to check over X ∖ Z, where the action map gives Hom(𝒪\_G ⊗ 𝒪\_Y, 𝒪\_Y) ≅ Hom(𝒪\_Y, 𝒪\_Y) through the isomorphism G × Y ≅ Y × Y, with 𝒪\_G free of rank r over 𝒪\_X.

**Checks.**

- For X = Spec R regular local of dimension 2 and G = ℤ/n with n invertible this is Zariski–Nagata purity for ℤ/n-torsors.
- For G = α\_p over 𝔽\_p⟦x, y⟧, every α\_p-torsor on U\_R extends, consistent with PF.4/flat-purity-regular in degree 1.
- Regularity cannot be weakened to normality: the μ\_2-torsor ℂ⟦x, y⟧ over the punctured spectrum of ℂ⟦x, y⟧^{μ\_2} does not extend.

**Sources.**

- `CS24`, Theorem 7.1.3 and its proof, pp. 87–88; Remark 7.1.4, p. 88: Moret-Bailly's purity for torsors under finite locally free groups over regular schemes of dimension ≥ 2 along Z, and its extension to gerbes and the nonabelian H^2, by Hartogs for full faithfulness and Auslander's criterion for flatness of the pushed-forward algebra.
- `MB85`, Lemme 2: The original nonabelian purity statement (not read; cited through CS24 p. 87).

**Needs.** `PurityForFlatCohomology:PF.5/auslander-endomorphism-freeness`, `PurityForFlatCohomology:PF.0/hartogs-regular-sequence`, `PurityForFlatCohomology:PF.0/punctured-spectrum`, `SchemeAndStackFoundations:SF.1`, `SchemeAndStackFoundations:SF.0`.

**Used by.** None.

**Proposed location.** `TauCeti/AlgebraicGeometry/Purity/PF5.lean`, namespace `TauCetiRoadmap.PurityForFlatCohomology`. Implementation status: unchecked.

### 5.4 Parafactorial and geometrically parafactorial local rings

**Definition** (`PurityForFlatCohomology:PF.5/parafactorial-local-ring`; planet **Parafactorial local rings**). A local ring (R, 𝔪) is parafactorial if, with X = Spec R and U = U\_R, pullback is an equivalence from invertible sheaves on X to invertible sheaves on U; equivalently Γ(X, 𝒪) → Γ(U, 𝒪) is bijective and Pic(U) = 0. It is geometrically parafactorial if its strict henselization is parafactorial. A pair (X, Y) of a scheme and a closed subset is parafactorial if for every open V ⊂ X restriction of invertible sheaves from V to V ∖ Y is an equivalence.

**Hypotheses and conventions.** R local (Noetherian where depth is used); Pic(U) is Tau Ceti's LineBundleClass of U.

**Proof outline.**

1. The equivalence of the two forms: every invertible sheaf on the local scheme X is trivial, so essential surjectivity is Pic(U) = 0 and full faithfulness is bijectivity of Γ(X, 𝒪) → Γ(U, 𝒪) (EGA IV 21.13.3, 21.13.8).
2. For R Noetherian, bijectivity on global sections is depth R ≥ 2 (EGA IV 21.13.4 and 5.10.5; SchemeAndStackFoundations §0.6), so parafactorial rings have dimension ≥ 2 (21.13.9(i)).

**API.**

- `TauCetiRoadmap.PurityForFlatCohomology.IsParafactorial` (constructor): The predicate on a local ring R: pullback of invertible sheaves Spec R → U\_R is an equivalence.
- `TauCetiRoadmap.PurityForFlatCohomology.IsParafactorial.iff_depth_pic` (characterisation): For R Noetherian local: IsParafactorial R ↔ 2 ≤ depth R ∧ LineBundleClass (U\_R) is trivial (EGA IV 21.13.8).
- `TauCetiRoadmap.PurityForFlatCohomology.IsParafactorial.two_le_dim` (relation): A Noetherian parafactorial local ring has dimension ≥ 2 (EGA IV 21.13.9(i)).
- `TauCetiRoadmap.PurityForFlatCohomology.IsParafactorial.of_factorial` (relation): A Noetherian local unique factorization domain of dimension ≥ 2 is parafactorial (EGA IV 21.13.9(ii)).
- `TauCetiRoadmap.PurityForFlatCohomology.IsParafactorial.of_completion` (functoriality): If the completion R̂ is parafactorial, so is R; more generally parafactoriality descends along faithfully flat local maps with zero-dimensional closed fibre (EGA IV 21.13.6(iii), 21.13.12.1).
- `TauCetiRoadmap.PurityForFlatCohomology.IsParafactorial.of_completeIntersection` (relation): A Noetherian local complete intersection of dimension ≥ 4 is parafactorial (SGA 2 XI 3.13(ii); DeformationAndDerivedPatchingAlgebra §6.9, localCI\_parafactorial).
- `TauCetiRoadmap.PurityForFlatCohomology.IsGeometricallyParafactorial` (constructor): The strict henselization R^sh is parafactorial.
- `TauCetiRoadmap.PurityForFlatCohomology.IsParafactorialPair.iff_local` (characterisation): For X locally Noetherian, (X, Y) is parafactorial iff 𝒪\_{X,y} is parafactorial for every y ∈ Y (EGA IV 21.13.10).

**Definition/construction tests.**

- `TauCetiRoadmap.PurityForFlatCohomology.isParafactorial_powerSeries_two` (computation): k⟦x, y⟧ is parafactorial (factorial of dimension 2).
- `TauCetiRoadmap.PurityForFlatCohomology.not_isParafactorial_dvr` (degenerate): A discrete valuation ring is not parafactorial: Γ(U, 𝒪) = K ≠ R.
- `TauCetiRoadmap.PurityForFlatCohomology.not_isParafactorial_A1` (non-example): The normal surface singularity k⟦x, y, z⟧/(xz − y^2) has depth 2 but Pic(U\_R) = Cl(R) = ℤ/2, so it is not parafactorial.
- `TauCetiRoadmap.PurityForFlatCohomology.not_isParafactorial_node3` (non-example): The three-dimensional node k⟦x, y, z, w⟧/(xy − zw) is a complete intersection with Pic(U\_R) ≠ 0 (the ideal (x, z)), so the dimension bound 4 in the complete-intersection case is sharp.
- `TauCetiRoadmap.PurityForFlatCohomology.isParafactorial_lineBundle_compat` (compatibility): For R Noetherian local of depth ≥ 2, IsParafactorial R is equivalent to the vanishing of Tau Ceti's LineBundleClass of the scheme U\_R.

**Checks.**

- k⟦x, y⟧ is parafactorial; DVRs, the A\_1 surface singularity and the three-dimensional node are not.
- Complete intersections of dimension ≥ 4 are parafactorial (imported).

**Uses.** CS24 Theorem 7.2.8(a): geometric parafactoriality of the 𝒪\_{X,z} gives purity for groups of multiplicative type in degrees ≤ 1 and injectivity in degree 2. CS24 Theorem 7.2.1: Pic(U\_R) = 0 for complete intersections of dimension ≥ 4. C19 Corollary 2.5 and Remark 2.7: Grothendieck–Lefschetz vanishing of Pic of the punctured spectrum of R' ⊗\_R R'.

**Sources.**

- `EGA44`, Définition 21.13.7, Proposition 21.13.8, Exemples 21.13.9 (i)–(ii), pp. 316–317; Corollaire 21.13.6 (iii), p. 316; Proposition 21.13.10, p. 319; 21.13.12.1, pp. 320–321: Parafactoriality of a local ring through the punctured spectrum, its characterisation by depth ≥ 2 and Pic(U) = 0, the dimension bound, factorial rings of dimension ≥ 2 being parafactorial, descent along faithfully flat quasi-compact maps and from the completion, and the pointwise criterion for pairs.
- `CS24`, Footnote 26 to Theorem 7.2.8, p. 91: Geometric parafactoriality is parafactoriality of the strict henselization; geometrically factorial rings of dimension ≥ 2 and complete intersections of dimension ≥ 4 are geometrically parafactorial.
- `SGA2`, Exposé XI §3, Définitions 3.1–3.2 and Lemme 3.6, pp. 101–102: A pair (X, Z) is parafactorial when restriction of locally free modules of rank one from V to V ∖ Z is an equivalence for every open V, a local ring when its pair with the closed point is, and parafactoriality descends along faithfully flat quasi-compact maps.
- `C19`, Proof of Corollary 2.5, p. 5: The Grothendieck–Lefschetz theorem (SGA 2 XI 3.13(ii)) is used in the form: the Picard group of the punctured spectrum of a local complete intersection of dimension ≥ 4 vanishes.

**Needs.** `PurityForFlatCohomology:PF.0/punctured-spectrum`, `tauceti:TauCeti.AlgebraicGeometry.LineBundleClass`, `SchemeAndStackFoundations:SF.0`.

**Used by.** `PurityForFlatCohomology:PF.5/local-picard-torsion-vanishing`, `PurityForFlatCohomology:PF.5/multiplicative-type-purity-low-degree`.

**Proposed location.** `TauCeti/RingTheory/Parafactorial.lean`, namespace `TauCetiRoadmap.PurityForFlatCohomology`. Implementation status: unchecked.

### 5.5 Gabber's conjecture on the local Picard group

**Theorem** (`PurityForFlatCohomology:PF.5/local-picard-torsion-vanishing`; planet **Gabber's local Picard conjecture**). For a Noetherian local ring (R, 𝔪) that is a complete intersection of dimension ≥ 3, Pic(U\_R)\_tors = 0. If R has dimension ≥ 4 or is regular (of any dimension ≥ 2), then Pic(U\_R) = 0.

**Hypotheses and conventions.** R Noetherian local complete intersection; U\_R its punctured spectrum (PF.0).

**Proof outline.**

1. Dimension ≥ 4: SGA 2 XI 3.13(ii), planned upstream as DeformationAndDerivedPatchingAlgebra §6.9 (localCI\_parafactorial).
2. Regular R: a line bundle on U\_R is trivial iff it extends to R; extend it as a coherent module and take the determinant of a finite free resolution (DeformationAndDerivedPatchingAlgebra §6.9, punctured regular local spectra), or use factoriality of R and Weil divisors.
3. Torsion: for n ≥ 1, PF.4/flat-purity-complete-intersection (dim R ≥ 3, so H^1\_𝔪 = H^2\_𝔪 = 0 for μ\_n) makes H^1(R, μ\_n) → H^1(U\_R, μ\_n) bijective. A class of Pic(U\_R)[n] lifts to H^1(U\_R, μ\_n) by the fppf Kummer sequence (SchemeAndStackFoundations §2.11), hence comes from H^1(R, μ\_n), whose image in H^1(R, 𝔾\_m) = Pic(R) = 0 vanishes (the source writes n ≥ 0 where n ≥ 1 is meant, PurityForFlatCohomology/E4).

**Checks.**

- For the three-dimensional node R = k⟦x, y, z, w⟧/(xy − zw), Pic(U\_R) ≅ ℤ (generated by the ideal (x, z)) is torsion free and nonzero: dimension 3 gives only torsion vanishing.
- For R regular local of dimension 2, Pic(U\_R) = 0 although the torsion statement needs dimension ≥ 3 in general.
- Dimension 2 complete intersections can have torsion: let S be the local ring at the vertex of the affine cone over a smooth plane cubic over ℂ. Then S is a two-dimensional hypersurface and Pic(U\_S)\_tors is infinite (CS24 Remark 7.2.6).

**Sources.**

- `CS24`, Theorem 7.2.1 and its proof, pp. 88–89; announced as Theorem 1.1.3(a), p. 3: Pic(U\_R)\_tors = 0 for complete intersections of dimension ≥ 3, and Pic(U\_R) = 0 in dimension ≥ 4 or for regular R, from purity for μ\_n, the Kummer sequence and SGA 2 XI 3.13(ii).
- `SGA2`, Exposé XI, Théorème 3.13, p. 105: Part (i): regular local rings are factorial (Auslander–Buchsbaum), hence parafactorial in dimension ≥ 2; part (ii), the local Grothendieck–Lefschetz theorem: complete intersections of dimension ≥ 4 are parafactorial.

**Needs.** `PurityForFlatCohomology:PF.4/flat-purity-complete-intersection`, `PurityForFlatCohomology:PF.5/parafactorial-local-ring`, `PurityForFlatCohomology:PF.0/punctured-spectrum`, `SchemeAndStackFoundations:SF.2`, `DeformationAndDerivedPatchingAlgebra:R03.3`.

**Used by.** `PurityForFlatCohomology:PF.5/cohen-macaulay-counterexample`, `PurityForFlatCohomology:PF.5/global-complete-intersection-picard`, `PurityForFlatCohomology:PF.5/brauer-purity-complete-intersection`, `PurityForFlatCohomology:PF.6/henselian-torus-punctured-vanishing`, `PurityForFlatCohomology:PF.6/torus-low-support-vanishing`.

**Proposed location.** `TauCeti/AlgebraicGeometry/Purity/PF5.lean`, namespace `TauCetiRoadmap.PurityForFlatCohomology`. Implementation status: unchecked.

### 5.6 Purity fails for Cohen–Macaulay rings

**Theorem** (`PurityForFlatCohomology:PF.5/cohen-macaulay-counterexample`). For n ≥ 3 let R = ℂ⟦x\_1, …, x\_n⟧^{ℤ/2} with ℤ/2 acting by x\_i ↦ −x\_i. Then R is a Cohen–Macaulay normal local domain of dimension n, ℂ⟦x\_1, …, x\_n⟧ restricts to a nontrivial ℤ/2-torsor over U\_R, and its class is a nonzero element of Pic(U\_R)[2]. Hence PF.5/local-picard-torsion-vanishing and PF.4/flat-purity-complete-intersection fail for Cohen–Macaulay rings.

**Hypotheses and conventions.** n ≥ 3 (for n = 2, R is the A\_1 singularity, also with nonzero Pic(U\_R)[2]).

**Proof outline.**

1. R → ℂ⟦x⟧ is the normalization of R in a quadratic extension of fraction fields, free of fixed points off the closed point, hence a ℤ/2-torsor over U\_R; it is connected, so nontrivial.
2. R is a direct summand of ℂ⟦x⟧ (anti-invariants as complement), so a system of parameters of R is one of ℂ⟦x⟧ and R is Cohen–Macaulay.
3. depth R = n ≥ 2 gives R^× = H^0(U\_R, 𝔾\_m), and units of R are squares (Hensel, residue field ℂ), so the Kummer sequence identifies H^1(U\_R, μ\_2) with Pic(U\_R)[2] and the torsor gives a nonzero class.
4. Use H^1(R,μ\_2) = 0 and the support long exact sequence to send this nonzero punctured torsor injectively into H^2\_𝔪(R,μ\_2). It is this degree-two class, not degree one, that violates flat CI purity for n ≥ 3.

**Checks.**

- For n = 3, R is the cone over the Veronese surface: Cohen–Macaulay of dimension 3 but not a complete intersection, with Pic(U\_R) ⊃ ℤ/2.
- H^2\_𝔪(R,μ\_2) ≠ 0: the nontrivial μ\_2-torsor on U\_R cannot come from H^1(R,μ\_2) = R^×/R^{×2} = 0, so its localization boundary is nonzero. Since n ≥ 3, this contradicts the below-dimension CI bound. H^1\_𝔪(R,μ\_2) is zero here.

**Sources.**

- `CS24`, Remark 7.2.2, p. 89: The ℤ/2-invariants of a power series ring form a Cohen–Macaulay normal domain over whose punctured spectrum the power series ring is a nontrivial ℤ/2-torsor, giving 2-torsion in Pic(U\_R); so Theorems 7.2.1 and 1.1.1 fail for Cohen–Macaulay rings.

**Needs.** `PurityForFlatCohomology:PF.0/punctured-spectrum`, `PurityForFlatCohomology:PF.5/local-picard-torsion-vanishing`, `SchemeAndStackFoundations:SF.2`.

**Used by.** None.

**Proposed location.** `TauCeti/AlgebraicGeometry/Purity/PF5.lean`, namespace `TauCetiRoadmap.PurityForFlatCohomology`. Implementation status: unchecked.

### 5.7 Picard groups of global complete intersections

**Theorem** (`PurityForFlatCohomology:PF.5/global-complete-intersection-picard`). For a field k and a global complete intersection X ⊂ ℙ^n\_k of dimension ≥ 2, (Pic(X)/ℤ·[𝒪(1)])\_tors = 0. If dim X ≥ 3, then Pic(X) is free of rank one, generated by [𝒪(1)]. The torsion condition cannot be dropped in dimension 2 (the quadric surface has Pic ≅ ℤ^2), nor the dimension lowered (an elliptic curve over an algebraically closed field has infinite Pic\_tors).

**Hypotheses and conventions.** X = Proj k[x\_0, …, x\_n]/(f\_1, …, f\_{n−d}) with f\_i homogeneous forming a regular sequence, d = dim X.

**Proof outline.**

1. The homogeneous coordinate ring R = k[x\_0, …, x\_n]/(f\_1, …, f\_{n−d}) satisfies R ≅ ⊕\_{m≥0} Γ(X, 𝒪\_X(m)) compatibly with the gradings. A line bundle L defines the finite graded module M\_L = ⊕\_{m≥0} Γ(X, L(m)) whose restriction to Spec R\_𝔪 ∖ {𝔪} (𝔪 = (x\_0, …, x\_n)) is a line bundle L̃, with L̃ ⊗ L̃' ≅ (L ⊗ L')\~ (EGA II 3.2.4, 3.2.6, 3.4.3, 3.4.4); if L̃ is trivial then M\_L is free and L ≅ 𝒪(m). This gives an injection Pic(X)/ℤ·[𝒪(1)] → Pic(U\_{R\_𝔪}).
2. R\_𝔪 is a complete intersection of dimension d + 1 ≥ 3, so PF.5/local-picard-torsion-vanishing gives the torsion statement; for d ≥ 3, dim R\_𝔪 ≥ 4 gives Pic(U\_{R\_𝔪}) = 0, hence Pic(X) = ℤ·[𝒪(1)], free since 𝒪(1) has positive degree (SGA 2 XII 3.7 for the original argument).
3. Sharpness: the quadric xw − yz = 0 is ℙ^1 × ℙ^1 with Pic = ℤ^2, and Pic of an elliptic curve over an algebraically closed field contains its torsion points.

**Checks.**

- For a cubic threefold X ⊂ ℙ^4 (a hypersurface of dimension 3), Pic(X) = ℤ[𝒪(1)].
- For the quadric surface, Pic(X)/ℤ[𝒪(1)] ≅ ℤ is torsion free but nonzero.
- For a plane cubic curve (dim 1) the torsion of Pic(X)/ℤ[𝒪(1)] is infinite over k̄, so dim ≥ 2 is needed.

**Sources.**

- `CS24`, Corollary 7.2.3 and its proof, p. 89; Remark 7.2.4, p. 90: Torsion-freeness of Pic(X)/ℤ[𝒪(1)] for global complete intersections of dimension ≥ 2 and freeness on 𝒪(1) in dimension ≥ 3, via the affine cone and Theorem 7.2.1; sharpness by the quadric surface and elliptic curves.
- `SGA2`, Exposé XII, Corollaire 3.7, p. 121: For a complete intersection of dimension ≥ 3 in projective space, Pic(X) is free on the class of 𝒪\_X(1), by induction on the number of hypersurfaces.

**Needs.** `PurityForFlatCohomology:PF.5/local-picard-torsion-vanishing`, `SchemeAndStackFoundations:SF.0`, `DeformationAndDerivedPatchingAlgebra:R03.3/complete-intersections`.

**Used by.** `PurityForFlatCohomology:PF.5/brauer-purity-sharpness`.

**Proposed location.** `TauCeti/AlgebraicGeometry/Purity/PF5.lean`, namespace `TauCetiRoadmap.PurityForFlatCohomology`. Implementation status: unchecked.

### 5.8 Torsion of 𝔾\_m-cohomology for schemes with factorial strict henselizations (Grothendieck)

**Theorem** (`PurityForFlatCohomology:PF.5/gm-cohomology-torsion`). Let X be a Noetherian integral scheme with function field K. (a) If every strict henselization 𝒪^sh\_{X,x̄} is factorial, then H^i\_ét(X, 𝔾\_m) is torsion for every i ≥ 2. (b) If X is regular, then H^2\_ét(X, 𝔾\_m) → H^2\_ét(K, 𝔾\_m) is injective; in particular H^2\_ét(X, 𝔾\_m) is torsion.

**Hypotheses and conventions.** X Noetherian integral; in (b) X regular, so its strict henselizations are regular, hence factorial (Auslander–Buchsbaum).

**Proof outline.**

1. Let g : Spec K → X. Under geometric local factoriality the divisor sequence 0 → 𝔾\_m → g\_\*𝔾\_{m,K} → ⊕\_{x∈X^{(1)}}(i\_x)\_\*ℤ → 0 is exact on X\_ét. This is Grothendieck 1966, §1, Proposition 1.4, with the divisor sheaf identified by factoriality.
2. For a point inclusion i\_x and any étale abelian sheaf on Spec k(x), positive direct images and positive-degree cohomology of its pushforward are torsion (Grothendieck Lemma 1.1). One way to see the all-degree assertion is to rationalize the Leray spectral sequence: higher direct images are torsion, their cohomology is torsion on Noetherian X, and field cohomology is torsion in positive degrees. Apply this to g and to each i\_x. Cohomology commutes with the direct sum on Noetherian X, so the divisor sheaf also has torsion cohomology in every positive degree.
3. The divisor long exact sequence now gives H^i(X,𝔾\_m) torsion for every i ≥ 2. For injectivity in degree two, H^1(X,(i\_x)\_\*ℤ) = 0 (Lemma 1.9) and R^1g\_\*𝔾\_m = 0 by Hilbert 90. Consequently H^2(X,𝔾\_m) injects into H^2(X,g\_\*𝔾\_m), which injects into H^2(K,𝔾\_m) by Leray. This is Corollary 1.8, not an assertion that the latter injection holds in all degrees.
4. Regular local rings and their strict henselizations are factorial; import this commutative algebra through the R03.3 contract. The source read directly for the divisor argument is the freely available Bourbaki 1966 version, not an unread copy of Dix exposés.

**Checks.**

- For X = Spec of a regular local ring of dimension 1 (a DVR), (b) is the injectivity Br(R) → Br(K).
- For X = 𝔸^2\_ℂ, H^2(X, 𝔾\_m) = Br(𝔸^2\_ℂ) = 0 is torsion.
- For X = Spec K a field both parts say that H^i(K, 𝔾\_m) is torsion for i ≥ 1, as Galois cohomology in positive degrees is torsion.

**Sources.**

- `CS24`, Proof of Theorem 7.2.9, p. 93: For the strictly local Noetherian integral X reached there, factoriality makes H^i(X, 𝔾\_m) and H^i(X ∖ Z, 𝔾\_m) torsion for i ≥ 2 (Grothendieck, Le groupe de Brauer II, 1.4).
- `C19`, Lemma 3.2, p. 7: For Noetherian integral regular X with function field K, H^2(X, 𝔾\_m) → H^2(K, 𝔾\_m) is injective, so H^2(X, 𝔾\_m) is torsion (Grothendieck, Brauer II, 1.8).
- `Gro68`, Le groupe de Brauer II, Proposition 1.4 and Corollaire 1.8: Torsion and injectivity into the generic point (not read; cited through CS24 p. 93 and C19 p. 7).
- `Gro66`, Le groupe de Brauer II, §1, Lemma 1.1, Proposition 1.4, Lemmas 1.6 and 1.9, Corollary 1.8, pp. 290–293: Directly read: torsion in all higher degrees follows from the divisor sheaf; the degree-two map to the generic point is injective under geometric local factoriality.

**Needs.** `SchemeAndStackFoundations:SF.2`, `DeformationAndDerivedPatchingAlgebra:R03.3`, `mathlib:UniqueFactorizationMonoid`.

**Used by.** `PurityForFlatCohomology:PF.5/regular-dimension-two-extension`, `PurityForFlatCohomology:PF.5/multiplicative-type-purity-higher`, `PurityForFlatCohomology:PF.6/strict-local-brauer-purity`, `PurityForFlatCohomology:PF.6/generic-h2-injectivity`, `PurityForFlatCohomology:PF.6/dvr-brauer-residue-sequence`.

**Proposed location.** `TauCeti/AlgebraicGeometry/Purity/PF5.lean`, namespace `TauCetiRoadmap.PurityForFlatCohomology`. Implementation status: unchecked.

### 5.9 Vector bundles and Azumaya algebras on punctured regular surfaces

**Theorem** (`PurityForFlatCohomology:PF.5/regular-dimension-two-extension`). Let R be a regular local ring of dimension 2. Pullback is an equivalence from vector bundles on Spec R to vector bundles on U\_R, and from Azumaya algebras on Spec R to Azumaya algebras on U\_R; hence Br(R) → Br(U\_R) is bijective for the Azumaya Brauer groups. If R is strictly henselian, then H^2\_ét(U\_R, 𝔾\_m) = 0.

**Hypotheses and conventions.** R regular local of dimension exactly 2; Br is SchemeAndStackFoundations §2.22's SchemeBrauerGroup.

**Proof outline.**

1. Full faithfulness is Hartogs (depth R = 2; SchemeAndStackFoundations §0.6, coherent\_hartogs). For a vector bundle E on U\_R, j\_\*E is coherent and reflexive (SchemeAndStackFoundations §0.6, reflexive\_extension\_normal), hence of depth 2 = dim R at the closed point, hence free by the Auslander–Buchsbaum formula (PurityOfBranchLocus §0.3).
2. For an Azumaya algebra A on U\_R, j\_\*A is a free algebra; the map j\_\*A ⊗ (j\_\*A)^op → End(j\_\*A) of free modules is an isomorphism on U\_R, hence on Spec R by Hartogs, so j\_\*A is Azumaya (SchemeAndStackFoundations §2.22, azumaya\_equivalent\_conditions).
3. If R is strictly henselian, Br(R) = Br(k) = 0 (SchemeAndStackFoundations §2.22, brauer\_henselian\_local, k separably closed), so Br(U\_R) = 0; H^2(U\_R, 𝔾\_m) is torsion (PF.5/gm-cohomology-torsion(b), U\_R regular integral) and its torsion is Br(U\_R) because U\_R is regular of dimension ≤ 2 (Grothendieck, Brauer II, Br = Br′ in dimension ≤ 2; recorded gap SF-PII-brauer).

**Checks.**

- For R = k⟦x, y⟧ every vector bundle on U\_R is trivial, since it extends to a free R-module.
- In dimension 3 vector bundles need not extend: on U\_R for R = k⟦x, y, z⟧ the syzygy bundle of (x, y, z) is not free, although Br(R) ≅ Br(U\_R) still holds (PF.5/brauer-purity-complete-intersection).
- Regularity is needed: over the A\_1 singularity the rank-one reflexive module (x, y) restricts to a nontrivial line bundle on U\_R.

**Sources.**

- `CS24`, Proof of Theorem 7.2.5, p. 90: For regular local rings of dimension 2 pullback is an equivalence on vector bundles and on Azumaya algebras between R and U\_R (Grothendieck, Brauer III, 6.1 b)), giving Br(R) ≅ Br(U\_R).
- `C19`, Theorem 1.3 case (i), p. 2; proof of Theorem 5.3, p. 12: The case dim R = 2 of the strict-local purity H^2(U\_R, 𝔾\_m) = 0 follows from the equivalence of vector bundles on Spec R and on U\_R.
- `Gro68`, Le groupe de Brauer III, 6.1 b): Vector bundles and Azumaya algebras extend over the closed point of a regular local ring of dimension 2 (not read; cited through CS24 p. 90 and C19 p. 2).

**Needs.** `PurityForFlatCohomology:PF.0/punctured-spectrum`, `PurityForFlatCohomology:PF.5/gm-cohomology-torsion`, `SchemeAndStackFoundations:SF.0`, `SchemeAndStackFoundations:SF.2`, `mathlib:IsAzumaya`.

**Used by.** `PurityForFlatCohomology:PF.5/brauer-purity-complete-intersection`, `PurityForFlatCohomology:PF.6/strict-local-brauer-purity`.

**Proposed location.** `TauCeti/AlgebraicGeometry/Purity/PF5.lean`, namespace `TauCetiRoadmap.PurityForFlatCohomology`. Implementation status: unchecked.

### 5.10 Gabber's conjecture on the Brauer group of local complete intersections

**Theorem** (`PurityForFlatCohomology:PF.5/brauer-purity-complete-intersection`; planet **Gabber's local Brauer conjecture**). For a Noetherian local ring (R, 𝔪) that is either a complete intersection of dimension ≥ 4 or regular of dimension ≥ 2, pullback Br(R) → Br(U\_R) is bijective, where Br is the Brauer group of Azumaya algebras.

**Hypotheses and conventions.** R Noetherian local; Br(X) = ⋃\_n im(H^1(X, PGL\_n) → H^2(X, 𝔾\_m)\_tors), SchemeAndStackFoundations §2.22.

**Proof outline.**

1. By Gabber and de Jong, Br(X) = H^2(X, 𝔾\_m)\_tors for X with an ample line bundle, in particular for X quasi-affine such as Spec R and U\_R (recorded gap SF-PII-brauer; SchemeAndStackFoundations §2.22 constructs Br → Br′).
2. Pic(R) = 0 and Pic(U\_R) = 0 (PF.5/local-picard-torsion-vanishing), so the Kummer sequences give Br(R)[n] ≅ H^2(R, μ\_n) and Br(U\_R)[n] ≅ H^2(U\_R, μ\_n) for n ≥ 1 (the source writes n ≥ 0, PurityForFlatCohomology/E5; SchemeAndStackFoundations §2.11).
3. Except for R regular of dimension 2, H^2(R, μ\_n) ≅ H^2(U\_R, μ\_n) because H^2\_𝔪 = H^3\_𝔪 = 0: by PF.4/flat-purity-complete-intersection for complete intersections of dimension ≥ 4 and by PF.4/flat-purity-regular for regular rings of dimension ≥ 3.
4. For R regular of dimension 2 use PF.5/regular-dimension-two-extension.

**Checks.**

- For R = W(k)⟦x, y, z⟧ (regular of dimension 4), Br(U\_R) = Br(R) = Br(k).
- For R = k⟦x\_1, …, x\_5⟧/(f) a hypersurface of dimension 4, Br(R) ≅ Br(U\_R).
- Dimension 3 complete intersections are excluded: PF.5/brauer-purity-sharpness gives a three-dimensional strictly henselian complete intersection with Br(R) = 0 and Br(U\_R) infinite.

**Sources.**

- `CS24`, Theorem 7.2.5 and its proof, p. 90; announced as Theorem 1.1.3(b), p. 3: Br(R) ≅ Br(U\_R) for complete intersections of dimension ≥ 4 or regular rings of dimension ≥ 2, via Gabber–de Jong, vanishing of Pic, the Kummer sequence, purity for μ\_n, and Grothendieck's dimension-two case.
- `C19`, Theorem 1.3 and Theorem 5.3, p. 2 and p. 12: The regular case: H^2(U\_R, 𝔾\_m) = 0 for strictly henselian regular R of dimension ≥ 2, i.e. Br(U\_R) = Br(R) = 0 there.

**Needs.** `PurityForFlatCohomology:PF.4/flat-purity-complete-intersection`, `PurityForFlatCohomology:PF.4/flat-purity-regular`, `PurityForFlatCohomology:PF.5/local-picard-torsion-vanishing`, `PurityForFlatCohomology:PF.5/regular-dimension-two-extension`, `SchemeAndStackFoundations:SF.2`.

**Used by.** `PurityForFlatCohomology:PF.5/brauer-purity-sharpness`, `PurityForFlatCohomology:PF.5/multiplicative-type-purity-low-degree`.

**Proposed location.** `TauCeti/AlgebraicGeometry/Purity/PF5.lean`, namespace `TauCetiRoadmap.PurityForFlatCohomology`. Implementation status: unchecked.

### 5.11 Sharpness of the dimension bound for Brauer purity

**Theorem** (`PurityForFlatCohomology:PF.5/brauer-purity-sharpness`). Let S be the local ring at the vertex of the affine cone over a smooth plane cubic over ℂ. Then R = S^sh⟦x,y⟧/(xy) is a three-dimensional strictly henselian complete intersection with Br(R) = 0 and Br(U\_R) infinite. With the Segre embedding of ℙ^1\_ℂ × ℙ^1\_ℂ instead, S has dimension 3 and R dimension 4; H^2(U\_R,𝔾\_m) has non-extendable, necessarily nontorsion classes.

**Hypotheses and conventions.** In the elliptic case S is a two-dimensional normal local hypersurface over ℂ with infinite Pic(U\_S)\_tors. In the Segre case it is a three-dimensional normal hypersurface. Both R are strictly henselian complete intersections; the dimensions of the two examples differ.

**Proof outline.**

1. Pic(U\_S) → Pic(U\_{S^sh}) is injective (Γ(U\_S, L) is free for L in the kernel), so Pic(U\_{S^sh})\_tors is infinite while Pic(U\_{S^sh⟦t⟧}) is finitely generated (Boutot 1978, V 4.9).
2. The exact sequence 0 → 𝔾\_m → (i\_{x=0})\_\*𝔾\_m ⊕ (i\_{y=0})\_\*𝔾\_m → (i\_{x=y=0})\_\*𝔾\_m → 0 on Spec(R)\_ét (Boutot 1978, IV 5.1) relates Br(U\_R) to the Picard groups of the punctured spectra of the components and of their intersection, giving #Br(U\_R) = ∞, whereas Br(R) = 0 because R is strictly henselian.
3. For the Segre cone, Pic(U\_{S^sh}) has a free cyclic contribution. The same component sequence produces non-extendable classes in H^2(U\_R,𝔾\_m). Here H^2(R,𝔾\_m) = 0 because R is strictly local. Since dim R = 4, Brauer purity identifies the torsion subgroup on U\_R with Br(R) = 0; hence these nonzero classes are nontorsion. The general H^2 assertion cannot replace the torsion Brauer assertion.

**Checks.**

- The elliptic example has dimension 3, below the dimension-four CI Brauer threshold. The Segre example has dimension 4 but only nontorsion H^2 classes, so neither contradicts Brauer purity.
- Pic(U\_S)\_tors is infinite for the elliptic cone, matching the sharpness of PF.5/global-complete-intersection-picard in dimension 1.

**Sources.**

- `CS24`, Remark 7.2.6, p. 90: A three-dimensional strictly henselian complete intersection built from the cone over an elliptic curve has trivial Brauer group but infinite Brauer group of its punctured spectrum; the ℙ^1 × ℙ^1 variant gives non-extendable classes in H^2(U\_R, 𝔾\_m).
- `Bou78`, Chapitre IV, Lemme 5.1; Chapitre V, Corollaire 4.9: The Mayer–Vietoris sequence for 𝔾\_m along two components and finite generation of local Picard groups (not read; cited through CS24 p. 90).

**Needs.** `PurityForFlatCohomology:PF.5/brauer-purity-complete-intersection`, `PurityForFlatCohomology:PF.5/global-complete-intersection-picard`, `PurityForFlatCohomology:PF.0/punctured-spectrum`, `SchemeAndStackFoundations:SF.2`.

**Used by.** None.

**Proposed location.** `TauCeti/AlgebraicGeometry/Purity/PF5.lean`, namespace `TauCetiRoadmap.PurityForFlatCohomology`. Implementation status: unchecked.

### 5.12 Purity for groups of multiplicative type in degrees ≤ 2

**Theorem** (`PurityForFlatCohomology:PF.5/multiplicative-type-purity-low-degree`; planet **Purity for groups of multiplicative type**). Let X be a scheme, T a finite type X-group of multiplicative type and Z ⊂ X a closed subset with X ∖ Z → X quasi-compact. (a) If each 𝒪\_{X,z}, z ∈ Z, is Noetherian and geometrically parafactorial, then H^0(X, T) ≅ H^0(X ∖ Z, T), H^1(X, T) ≅ H^1(X ∖ Z, T) and H^2(X, T) → H^2(X ∖ Z, T) is injective. (b) If each 𝒪\_{X,z}, z ∈ Z, is a complete intersection of dimension ≥ 3 (resp. ≥ 4) or regular of dimension ≥ 2, then H^1(X, T)\_tors ≅ H^1(X ∖ Z, T)\_tors (resp. H^2(X, T)\_tors ≅ H^2(X ∖ Z, T)\_tors), where torsion means killed by a locally constant function. In particular, for Noetherian X with each 𝒪\_{X,z} a complete intersection of dimension ≥ 4 or regular of dimension ≥ 2, H^2(X, 𝔾\_m)\_tors ≅ H^2(X ∖ Z, 𝔾\_m)\_tors.

**Hypotheses and conventions.** X arbitrary; groups of multiplicative type over X are those of SGA 3 IX (recorded gap SF-PII-tori for their scheme-level theory); cohomology is fppf, equal to étale cohomology for smooth T. α ∈ H^i(X, T)\_tors iff X = ⊔\_{n>0} X\_n (clopens) with α|\_{X\_n} killed by n.

**Proof outline.**

1. (a) It suffices that H^i\_Z(X, T) = 0 for i ≤ 2. Parafactorial rings have depth ≥ 2 (PF.5/parafactorial-local-ring), so PF.0/hartogs-regular-sequence(b) gives i ≤ 1. By PF.0's local-to-global spectral sequence reduce to X strictly local, Noetherian, Z ≠ ∅; realizing T as the kernel of a map of tori, assume T = 𝔾\_m; the claim is that j\_\*L is a line bundle for every line bundle L on X ∖ Z. By Noetherian induction and flat base change of j\_\*, pass to the strict henselization at a generic point of Z, where Z is the closed point and parafactoriality gives the claim.
2. (b) Injectivity follows from PF.0 Hartogs in degree one and from (a) in degree two. Hartogs also identifies clopens, so reduce to a class α killed by n > 0. After a clopen decomposition, choose m > 0 killing the torsion of the locally constant character module of T. Then [m] factors as T →^q S ↪ T, with S a torus, q an fppf epimorphism and kernel T[m]. The epimorphism [n]∘q : T → S has finite locally free kernel T[mn]. Since ([n]∘q)(α) = q(nα) = 0, the coefficient long exact sequence lifts α to H^i(X∖Z,T[mn]). This explains the reduction to finite coefficients; it does not assume T itself is n-torsion.
3. For these finite coefficients, the support local-to-global sequence, limits, Noetherian induction and Mayer–Vietoris reduce surjectivity to a strictly local ring with Z the closed point. PF.4 gives extension except in the regular dimension-two case. There use (a) for H^1; for H^2 reduce étale-locally to diagonalizable T and use Kummer with PF.5/brauer-purity-complete-intersection. The scheme character-module and torus embedding interfaces are requested in SF-PII-tori. The resulting extension in H^i(X,T) is torsion because the finite coefficient group is killed by mn.

**Checks.**

- For X = Spec R with R regular local of dimension 2 and T = 𝔾\_m: H^2(R, 𝔾\_m)\_tors ≅ H^2(U\_R, 𝔾\_m)\_tors, i.e. Br(R) ≅ Br(U\_R).
- For T = μ\_n with n invertible, (b) in degree 1 is purity for μ\_n-torsors.
- Geometric parafactoriality in (a) is needed: for the A\_1 surface singularity, Pic(U\_R) ≠ 0 = Pic(R), so H^1(X, 𝔾\_m) → H^1(X ∖ Z, 𝔾\_m) is not surjective.

**Sources.**

- `CS24`, Theorem 7.2.8 and its proof, pp. 91–92; announced as Theorem 1.1.4, p. 4; footnotes 26–27, pp. 91–92: Purity for H^0, H^1 and injectivity for H^2 of groups of multiplicative type along geometrically parafactorial local rings, and purity for torsion classes in H^1 (resp. H^2) along complete intersections of dimension ≥ 3 (resp. ≥ 4) or regular rings of dimension ≥ 2.
- `C19`, Theorem 6.1, p. 13: The regular case for tori, with bijectivity of H^2 and injectivity of H^3 (PF.6/torus-purity).

**Needs.** `PurityForFlatCohomology:PF.5/parafactorial-local-ring`, `PurityForFlatCohomology:PF.0/hartogs-regular-sequence`, `PurityForFlatCohomology:PF.0/flat-cohomology-with-supports`, `PurityForFlatCohomology:PF.4/flat-purity-complete-intersection`, `PurityForFlatCohomology:PF.4/flat-purity-regular`, `PurityForFlatCohomology:PF.5/brauer-purity-complete-intersection`.

**Used by.** `PurityForFlatCohomology:PF.5/multiplicative-type-purity-higher`.

**Proposed location.** `TauCeti/AlgebraicGeometry/Purity/PF5.lean`, namespace `TauCetiRoadmap.PurityForFlatCohomology`. Implementation status: unchecked.

### 5.13 Purity for groups of multiplicative type in higher degrees

**Theorem** (`PurityForFlatCohomology:PF.5/multiplicative-type-purity-higher`). Let X be a scheme, T a finite type X-group of multiplicative type, d ≥ 3 and Z ⊂ X a closed subset with X ∖ Z → X quasi-compact such that each 𝒪\_{X,z}, z ∈ Z, is either a complete intersection of dimension ≥ d all of whose strict henselizations are factorial, or regular of dimension ≥ d − 1. Then H^i(X, T) → H^i(X ∖ Z, T) is injective for i < d and bijective for i < d − 1.

**Hypotheses and conventions.** d ≥ 3; complete intersections whose local rings of height ≤ 3 are factorial are factorial (SGA 2 XI 3.14), e.g. regular ones.

**Proof outline.**

1. It suffices that H^i\_Z(X, T) = 0 for i < d. PF.0's local-to-global sequence reduces to X strictly local with Z ≠ ∅, so X is Noetherian and integral, and realizing T inside a torus reduces to T = 𝔾\_m.
2. By PF.5/gm-cohomology-torsion(a), which uses factoriality of the strict henselizations, H^i(X, 𝔾\_m) and H^i(X ∖ Z, 𝔾\_m) are torsion for i ≥ 2; by PF.5/multiplicative-type-purity-low-degree(a), H^i(X, 𝔾\_m) ≅ H^i(X ∖ Z, 𝔾\_m) for i ≤ 1. Hence all H^i\_Z(X, 𝔾\_m) are torsion.
3. The vanishing H^i\_Z(X, μ\_n) = 0 for i < d from PF.5/global-flat-purity and the Kummer sequence then give H^i\_Z(X, 𝔾\_m)[n] = 0 and hence H^i\_Z(X, 𝔾\_m) = 0 for i < d.

**Checks.**

- For X regular and Z of codimension ≥ 2 (d = 3) it gives bijectivity of H^i(X, T) → H^i(X ∖ Z, T) for i ≤ 1 and injectivity for i = 2; for tori C19 Theorem 6.1 strengthens this to bijectivity for i ≤ 2 and injectivity for i = 3 (PF.6/torus-purity).
- For T = μ\_n it is PF.5/global-flat-purity.

**Sources.**

- `CS24`, Theorem 7.2.9 and its proof, pp. 92–93; footnote 28, p. 92: Injectivity below d and bijectivity below d − 1 for groups of multiplicative type along complete intersections of dimension ≥ d with factorial strict henselizations or regular rings of dimension ≥ d − 1, from torsion of 𝔾\_m-cohomology and Theorem 7.1.2 for μ\_n.

**Needs.** `PurityForFlatCohomology:PF.5/gm-cohomology-torsion`, `PurityForFlatCohomology:PF.5/multiplicative-type-purity-low-degree`, `PurityForFlatCohomology:PF.5/global-flat-purity`, `PurityForFlatCohomology:PF.0/flat-cohomology-with-supports`, `SchemeAndStackFoundations:SF.2`.

**Used by.** None.

**Proposed location.** `TauCeti/AlgebraicGeometry/Purity/PF5.lean`, namespace `TauCetiRoadmap.PurityForFlatCohomology`. Implementation status: unchecked.

## Layer PF.6: Purity for the Brauer group and for tori on regular schemes

Prove Česnavičius's purity for the Brauer group: H^2(U\_R, 𝔾\_m) = 0 for strictly henselian regular R of dimension ≥ 2 (Theorem 5.3), the vanishing of H^1 and H^2 of tori on U\_R for henselian regular R with residue field of dimension ≤ 1 (Theorem 1.4), H^q\_Z(X, T) = 0 for q ≤ 3 and the resulting isomorphisms H^q(X, T) ≅ H^q(X ∖ Z, T) for q ≤ 2 with injectivity for q = 3 along regular local rings of dimension ≥ 2 (Theorem 6.1), Theorem 1.1 for 𝔾\_m on locally Noetherian schemes, the coniveau spectral sequence, the codimension-one intersection formula for H^2 of tori with generically injective H^2 and for the Brauer group (Theorems 6.2, 1.2), flasque tori and the norm-one-torus counterexample (Remark 6.3), and the residue sequences for discrete valuation rings and regular integral schemes with the imperfect-residue exclusion (Remark 6.4).

Layer imports: `PurityForFlatCohomology:PF.0`, `PurityForFlatCohomology:PF.4`, `PurityForFlatCohomology:PF.5`, `SchemeAndStackFoundations:SF.1`, `SchemeAndStackFoundations:SF.2`.

### 6.1 Purity for the Brauer group of a punctured strictly henselian regular local ring

**Theorem** (`PurityForFlatCohomology:PF.6/strict-local-brauer-purity`; planet **Strict-local purity for the Brauer group**). For a strictly henselian regular local ring R of dimension ≥ 2, H^2\_ét(U\_R, 𝔾\_m) = 0.

**Hypotheses and conventions.** R strictly henselian, regular, of dimension d ≥ 2; U\_R its punctured spectrum (PF.0).

**Proof outline.**

1. U\_R is a regular Noetherian integral scheme, so H^2(U\_R, 𝔾\_m) is torsion (PF.5/gm-cohomology-torsion(b)).
2. d = 2: PF.5/regular-dimension-two-extension (Grothendieck, Brauer III 6.1 b)).
3. d ≥ 3: fix n ≥ 1. The Kummer sequence (SchemeAndStackFoundations §2.11) makes H^2(U\_R, μ\_n) → H^2(U\_R, 𝔾\_m)[n] surjective. In the support sequence H^2(R, μ\_n) → H^2(U\_R, μ\_n) → H^3\_𝔪(R, μ\_n), the first group vanishes because R is strictly henselian (H^i\_ét(R, 𝔾\_m) = 0 for i ≥ 1, SchemeAndStackFoundations §2.15, and Kummer), and the last vanishes by PF.4/flat-purity-regular (3 ≤ d). Hence H^2(U\_R, 𝔾\_m)[n] = 0 for every n, and H^2(U\_R, 𝔾\_m) = 0.
4. This is the route of CS24 Theorem 1.1.3(b); it covers C19's equal-characteristic, mixed-characteristic, prime-to-p and dimension-three cases at once. C19's own proof (passage to finite flat covers by Corollary 2.5, the towers of Lemmas 5.1–5.2, vanishing of the p-primary Brauer group of perfect schemes and of perfectoid rings, Gabber's dimension-three theorem and absolute purity) is an alternative whose inputs are routed to SchemeAndStackFoundations and PerfectoidQuotients Part II as sources.

**Checks.**

- For R = k⟦x, y⟧ with k separably closed, H^2(U\_R, 𝔾\_m) = 0 although U\_R is not affine.
- For R = W(k̄)⟦x, y, z⟧ (mixed characteristic, dimension 4) the p-primary part of H^2(U\_R, 𝔾\_m) vanishes, the case left open before C19.
- Regularity is needed: for the three-dimensional strictly henselian complete intersection of PF.5/brauer-purity-sharpness, Br(U\_R) is infinite.

**Sources.**

- `C19`, Theorem 5.3 (= Theorem 1.3) and its proof, p. 12; Theorem 1.3 cases (i)–(iii), p. 2: For strictly henselian regular local R of dimension ≥ 2, H^2(U\_R, 𝔾\_m) = 0; dimension 2 by Grothendieck, dimension 3 by Gabber, the prime-to-p part by absolute purity, and the remaining p-primary part by finite flat descent and perfectoid towers.
- `CS24`, Theorem 1.1.3(b) and the paragraph after it, p. 4; proof of Theorem 7.2.5, p. 90: Brauer purity for regular rings follows from purity for μ\_n in degrees ≤ 3 and the dimension-two case, without treating dimension three separately.

**Needs.** `PurityForFlatCohomology:PF.4/flat-purity-regular`, `PurityForFlatCohomology:PF.5/regular-dimension-two-extension`, `PurityForFlatCohomology:PF.5/gm-cohomology-torsion`, `PurityForFlatCohomology:PF.0/flat-cohomology-with-supports`, `SchemeAndStackFoundations:SF.2`.

**Used by.** `PurityForFlatCohomology:PF.6/henselian-torus-punctured-vanishing`, `PurityForFlatCohomology:PF.6/torus-low-support-vanishing`.

**Proposed location.** `TauCeti/AlgebraicGeometry/Purity/PF6.lean`, namespace `TauCetiRoadmap.PurityForFlatCohomology`. Implementation status: unchecked.

### 6.2 Tori on punctured spectra of henselian regular local rings with small residue fields

**Theorem** (`PurityForFlatCohomology:PF.6/henselian-torus-punctured-vanishing`). For a henselian regular local ring R of dimension ≥ 2 whose residue field k has dimension ≤ 1 (H^i(k, G) = 0 for i ≥ 2 and every commutative finite étale G, and, if char k > 0, Br(k') = 0 for every finite separable k'/k), and an R-torus T, H^1\_ét(U\_R, T) = H^2\_ét(U\_R, T) = 0.

**Hypotheses and conventions.** R henselian (not necessarily strictly), regular, dim ≥ 2; k of dimension ≤ 1 in Serre's sense (C19 Definition A.1); T an R-torus.

**Proof outline.**

1. For finite étale local R'/R, pullback H^i(U\_R, T) → H^i(U\_{R'}, T) is injective for i = 1, 2 (C19 Corollary 2.4, from Propositions 2.2–2.3 on homogeneous spaces Res\_{R'/R}(T\_{R'})/T and Lemma A.2 for tori over fields of dimension ≤ 1; recorded gap SF-PII-tori, with the commutativity correction of C19 E1).
2. Passing to the colimit over all finite étale local R' (étale cohomology commutes with the limit, SchemeAndStackFoundations §2.15) reduces to R strictly henselian, where T is split.
3. Then H^1(U\_R, 𝔾\_m) = Pic(U\_R) = 0 (PF.5/local-picard-torsion-vanishing, regular case) and H^2(U\_R, 𝔾\_m) = 0 (PF.6/strict-local-brauer-purity).

**Checks.**

- For R strictly henselian and T = 𝔾\_m it is Pic(U\_R) = 0 and PF.6/strict-local-brauer-purity.
- For R = ℤ\_p⟦x⟧ (henselian, residue field 𝔽\_p of dimension 1) and T = 𝔾\_m: H^2(U\_R, 𝔾\_m) = 0.
- The residue-field hypothesis cannot be dropped: for R = ℝ⟦x, y⟧ and T the norm-one torus of ℂ/ℝ, H^1(U\_R, T) ≅ H^1(R, T) ≅ H^1(ℝ, T) = ℤ/2 by PF.6/torus-purity and henselian invariance, and ℝ does not have dimension ≤ 1.

**Sources.**

- `C19`, Theorem 1.4, p. 3; §5.4, p. 13; Corollary 2.4, p. 5; Definition A.1 and Lemma A.2, p. 15: For henselian regular R of dimension ≥ 2 with residue field of dimension ≤ 1 and an R-torus T, H^1 and H^2 of T on U\_R vanish, by injectivity of pullback to finite étale covers and the strictly henselian case.

**Needs.** `PurityForFlatCohomology:PF.6/strict-local-brauer-purity`, `PurityForFlatCohomology:PF.5/local-picard-torsion-vanishing`, `PurityForFlatCohomology:PF.0/punctured-spectrum`, `SchemeAndStackFoundations:SF.2`, `SchemeAndStackFoundations:SF.1`.

**Used by.** None.

**Proposed location.** `TauCeti/AlgebraicGeometry/Purity/PF6.lean`, namespace `TauCetiRoadmap.PurityForFlatCohomology`. Implementation status: unchecked.

### 6.3 The coniveau spectral sequence for cohomology with supports

**Theorem** (`PurityForFlatCohomology:PF.6/coniveau-spectral-sequence`). Let X be a Noetherian scheme of finite Krull dimension, Z ⊂ X closed and F an abelian sheaf on X\_ét (for instance 𝔾\_m). There is a convergent spectral sequence E\_1^{a,b} = ⊕\_{z ∈ Z, dim 𝒪\_{X,z} = a} H^{a+b}\_{z}(Spec 𝒪\_{X,z}, F) ⇒ H^{a+b}\_Z(X, F), where H\_z denotes cohomology with supports in the closed point of Spec 𝒪\_{X,z}; it arises from the filtration by families of closed supports contained in Z of codimension at least a in X.

**Hypotheses and conventions.** X Noetherian of finite dimension; F an abelian étale sheaf. Any fppf analogue used here must include the continuity hypotheses of PF.0 for its local terms.

**Proof outline.**

1. For each a use the filtered family Φ^a of closed W ⊂ Z all of whose points have codimension at least a in X. Take filtered colimits of the support triple sequences over W′ ⊂ W with W′ ∈ Φ^{a+1} and W ∈ Φ^a; exactness of filtered colimits gives the exact couple. The set of all points of codimension at least a need not be closed and is never used as a single closed support.
2. The graded pieces are computed by shrinking around the finitely many generic points of a closed support and then taking the colimit. Excision and localization give ⊕\_{z∈Z, dim 𝒪\_{X,z}=a} H^i\_z(Spec 𝒪\_{X,z},F). Each class occurs on a finite closed support, which explains the direct sum.
3. The bounded codimension range for finite-dimensional Noetherian X gives convergence. For fppf coefficients retain the same support formalism and the finite-presentation continuity hypotheses when identifying point terms by limits; the unrestricted étale assertion is the stated target.

**Checks.**

- For Z = {x} a closed point it degenerates to H^i\_Z(X, F) = H^i\_x(Spec 𝒪\_{X,x}, F) (excision).
- For X a Dedekind scheme and Z = X it gives the localization sequence relating H^i(X, F), H^i(K, F) and ⊕\_x H^{i+1}\_x.
- In C19 it is applied with F = 𝔾\_m and X regular, strictly henselian of dimension ≥ 2.

**Sources.**

- `C19`, Proof of Theorem 6.1, p. 13: The coniveau spectral sequence with E\_1 terms the cohomology with supports at the points of Z of given codimension reduces the vanishing of H^q\_Z(X, 𝔾\_m) to the case Z = closed point of a regular local X.
- `ILO14`, Exposé XVIII-A, §2.2, Lemma 2.2 and display (2.a), p. 333 in arXiv:1207.3648v1: Directly read: families of closed supports indexed by codimension give the coniveau spectral sequence. The preprint numbering is Lemma 2.2/display (2.a), while C19 cites the published 2.2.1.
- `Gro68`, Le groupe de Brauer III, §10.1: The coniveau spectral sequence for 𝔾\_m (not read; cited through C19 p. 13).

**Needs.** `PurityForFlatCohomology:PF.0/flat-cohomology-with-supports`, `SchemeAndStackFoundations:SF.2`.

**Used by.** `PurityForFlatCohomology:PF.6/torus-low-support-vanishing`.

**Proposed location.** `TauCeti/AlgebraicGeometry/Purity/PF6.lean`, namespace `TauCetiRoadmap.PurityForFlatCohomology`. Implementation status: unchecked.

### 6.4 Vanishing of torus cohomology with supports in degrees ≤ 3

**Theorem** (`PurityForFlatCohomology:PF.6/torus-low-support-vanishing`). Let X be a scheme, Z ⊂ X a closed subset with X ∖ Z → X quasi-compact, and T an X-torus. If 𝒪\_{X,z} is regular of dimension ≥ 2 for every z ∈ Z, then H^q\_Z(X, T) = 0 for q ≤ 3.

**Hypotheses and conventions.** X arbitrary; T an X-torus (étale locally isomorphic to 𝔾\_m^r); cohomology étale, equal to fppf (T smooth).

**Proof outline.**

1. By the local-to-global spectral sequence (PF.0/flat-cohomology-with-supports) it suffices that the étale sheaves ℋ^q\_Z(−, T) vanish for q ≤ 3. Tori are étale locally split, so T = 𝔾\_m, and quasi-compactness of X ∖ Z → X identifies the stalk at x̄ with H^q\_{Z ×\_X Spec 𝒪^sh\_{X,x̄}}(Spec 𝒪^sh\_{X,x̄}, 𝔾\_m) (limit argument, SGA 4 VII 5.9).
2. So assume X strictly henselian regular local of dimension ≥ 2 with Z ≠ ∅, hence Noetherian of finite dimension. The coniveau spectral sequence (PF.6/coniveau-spectral-sequence) reduces to Z the closed point of a regular local scheme of dimension ≥ 2, and the first step reduces again to X strictly local.
3. For X = Spec R strictly local regular of dimension ≥ 2 and Z the closed point: H^0(R, 𝔾\_m) ≅ H^0(U\_R, 𝔾\_m) (depth ≥ 2, PF.0/hartogs-regular-sequence), H^i(R, 𝔾\_m) = 0 for i > 0 (strictly henselian), H^1(U\_R, 𝔾\_m) = Pic(U\_R) = 0 (PF.5/local-picard-torsion-vanishing) and H^2(U\_R, 𝔾\_m) = 0 (PF.6/strict-local-brauer-purity); the support sequence gives H^q\_𝔪(R, 𝔾\_m) = 0 for q ≤ 3.

**Checks.**

- For X = Spec R with R strictly henselian regular of dimension 2 and Z the closed point it is equivalent to Pic(U\_R) = 0 and H^2(U\_R, 𝔾\_m) = 0.
- Codimension one is excluded: for Z = V(x) ⊂ 𝔸^2, H^1\_Z(𝔸^2, 𝔾\_m) ≅ ℤ (the divisor of x) ≠ 0.
- Degree 4 is not covered: H^4\_Z may be nonzero, which is why only injectivity on H^3 is asserted in PF.6/torus-purity.

**Sources.**

- `C19`, Proof of Theorem 6.1, p. 13: Reduction of H^q\_Z(X, T) = 0 for q ≤ 3 to strictly henselian regular local rings of dimension ≥ 2 by the local-to-global spectral sequence, a limit argument and the coniveau spectral sequence, and the local vanishing from Hartogs, Pic(U\_R) = 0 and Theorem 5.3.

**Needs.** `PurityForFlatCohomology:PF.6/coniveau-spectral-sequence`, `PurityForFlatCohomology:PF.6/strict-local-brauer-purity`, `PurityForFlatCohomology:PF.5/local-picard-torsion-vanishing`, `PurityForFlatCohomology:PF.0/hartogs-regular-sequence`, `PurityForFlatCohomology:PF.0/flat-cohomology-with-supports`, `SchemeAndStackFoundations:SF.2`.

**Used by.** `PurityForFlatCohomology:PF.6/torus-purity`.

**Proposed location.** `TauCeti/AlgebraicGeometry/Purity/PF6.lean`, namespace `TauCetiRoadmap.PurityForFlatCohomology`. Implementation status: unchecked.

### 6.5 Purity for tori along regular closed subsets of codimension ≥ 2

**Theorem** (`PurityForFlatCohomology:PF.6/torus-purity`; planet **Purity for tori**). For a scheme X, an X-torus T and a closed Z ⊂ X with X ∖ Z → X quasi-compact such that 𝒪\_{X,z} is regular of dimension ≥ 2 for every z ∈ Z, restriction H^q\_ét(X, T) → H^q\_ét(X ∖ Z, T) is an isomorphism for q ≤ 2 and injective for q = 3.

**Hypotheses and conventions.** As in PF.6/torus-low-support-vanishing.

**Proof outline.**

1. The long exact sequence of PF.0/flat-cohomology-with-supports and PF.6/torus-low-support-vanishing (H^q\_Z(X, T) = 0 for q ≤ 3).

**Checks.**

- For T = 𝔾\_m and q = 1 it is Pic(X) ≅ Pic(X ∖ Z) for regular X and Z of codimension ≥ 2.
- For X = 𝔸^2\_ℂ and Z = {0}: Br(𝔸^2\_ℂ ∖ {0}) = Br(𝔸^2\_ℂ) = 0.
- For d = 3 and regular local rings of dimension ≥ 2 it strengthens PF.5/multiplicative-type-purity-higher for tori.

**Sources.**

- `C19`, Theorem 6.1 and its proof, p. 13: Bijectivity of restriction of torus cohomology in degrees ≤ 2 and injectivity in degree 3 across a closed subset along which the local rings are regular of dimension ≥ 2.

**Needs.** `PurityForFlatCohomology:PF.6/torus-low-support-vanishing`, `PurityForFlatCohomology:PF.0/flat-cohomology-with-supports`.

**Used by.** `PurityForFlatCohomology:PF.6/brauer-purity-regular`, `PurityForFlatCohomology:PF.6/codimension-one-torus-intersection`.

**Proposed location.** `TauCeti/AlgebraicGeometry/Purity/PF6.lean`, namespace `TauCetiRoadmap.PurityForFlatCohomology`. Implementation status: unchecked.

### 6.6 Purity for the Brauer group of regular schemes

**Theorem** (`PurityForFlatCohomology:PF.6/brauer-purity-regular`; planet **Purity for the Brauer group**). For a locally Noetherian scheme X and a closed Z ⊂ X such that 𝒪\_{X,z} is regular of dimension ≥ 2 for every z ∈ Z, restriction H^2\_ét(X, 𝔾\_m) → H^2\_ét(X ∖ Z, 𝔾\_m) is an isomorphism and H^3\_ét(X, 𝔾\_m) → H^3\_ét(X ∖ Z, 𝔾\_m) is injective.

**Hypotheses and conventions.** X locally Noetherian, so X ∖ Z → X is quasi-compact; no regularity is assumed away from Z.

**Proof outline.**

1. Apply PF.6/torus-purity with T = 𝔾\_m.

**Checks.**

- For X regular and Z of codimension ≥ 2, Br′(X) ≅ Br′(X ∖ Z).
- Codimension two is necessary: Br(𝔸^2\_ℂ) = 0 while the complement of the coordinate axes has nonzero Brauer group (PF.6/codimension-one-deletion-example).
- Regularity along Z is necessary: for the three-dimensional complete intersection of PF.5/brauer-purity-sharpness, Br(U\_R) is infinite while Br(R) = 0.

**Sources.**

- `C19`, Theorem 1.1, p. 1; deduced in §6, p. 13: Bijectivity on H^2 and injectivity on H^3 of 𝔾\_m-cohomology across a closed subset along which the local rings are regular of dimension ≥ 2, for locally Noetherian X: the purity conjecture of Grothendieck and Auslander–Goldman.

**Needs.** `PurityForFlatCohomology:PF.6/torus-purity`.

**Used by.** `PurityForFlatCohomology:PF.6/codimension-one-deletion-example`.

**Proposed location.** `TauCeti/AlgebraicGeometry/Purity/PF6.lean`, namespace `TauCetiRoadmap.PurityForFlatCohomology`. Implementation status: unchecked.

### 6.7 Generic injectivity of H^2 for a torus

**Definition** (`PurityForFlatCohomology:PF.6/generic-h2-injectivity`). Let X be a Noetherian integral regular scheme with function field K and T an X-torus. T has generically injective H^2 on X if for every nonempty open V ⊂ X the pullback H^2\_ét(V, T) → H^2\_ét(Spec K, T) is injective.

**Hypotheses and conventions.** X Noetherian integral regular; T an X-torus.

**Proof outline.**

1. A property of the pair (X, T); it is stable under passing to nonempty opens of X.

**API.**

- `TauCetiRoadmap.PurityForFlatCohomology.GenericallyInjectiveH2` (constructor): The predicate on (X, T): H^2(V, T) → H^2(K, T) is injective for every nonempty open V ⊂ X.
- `TauCetiRoadmap.PurityForFlatCohomology.GenericallyInjectiveH2.restrict` (functoriality): If it holds for (X, T), it holds for (V, T|\_V) for every nonempty open V.
- `TauCetiRoadmap.PurityForFlatCohomology.GenericallyInjectiveH2.gm` (example): It holds for T = 𝔾\_m (PF.5/gm-cohomology-torsion(b), C19 Lemma 3.2).
- `TauCetiRoadmap.PurityForFlatCohomology.GenericallyInjectiveH2.flasque` (relation): It holds for flasque tori (PF.6/flasque-generic-injectivity).
- `TauCetiRoadmap.PurityForFlatCohomology.GenericallyInjectiveH2.prod` (functoriality): It holds for T\_1 × T\_2 iff it holds for T\_1 and T\_2.

**Definition/construction tests.**

- `TauCetiRoadmap.PurityForFlatCohomology.genericallyInjectiveH2_split` (computation): For T = 𝔾\_m^r it holds, by the 𝔾\_m case.
- `TauCetiRoadmap.PurityForFlatCohomology.genericallyInjectiveH2_point` (degenerate): For X = Spec K a field it holds trivially (V = X).
- `TauCetiRoadmap.PurityForFlatCohomology.not_genericallyInjectiveH2_normTorus` (non-example): For X = ℙ^1\_ℝ and T the norm-one torus of ℂ/ℝ it fails (PF.6/norm-torus-counterexample).
- `TauCetiRoadmap.PurityForFlatCohomology.genericallyInjectiveH2_weilRestriction` (compatibility): For X'/X finite étale with X' integral and T = Res\_{X'/X} 𝔾\_m (a quasi-trivial, hence flasque, torus) it holds, compatibly with the 𝔾\_m case on X' through H^2(V, T) = H^2(V ×\_X X', 𝔾\_m).

**Checks.**

- Holds for 𝔾\_m and flasque tori; fails for the norm-one torus over ℙ^1\_ℝ.

**Uses.** C19 Theorem 6.2: the hypothesis under which H^2(X, T) is the intersection of the local H^2 at height-one points. C19 Remark 6.3: examples (flasque tori) and counterexample (norm-one torus over ℙ^1\_ℝ).

**Sources.**

- `C19`, Theorem 6.2, condition (6.2.1), p. 13; Remark 6.3, p. 14: The injectivity hypothesis on H^2 of every nonempty open into H^2 of the generic point, satisfied by 𝔾\_m and by flasque tori and failing for some tori.

**Needs.** `PurityForFlatCohomology:PF.5/gm-cohomology-torsion`, `SchemeAndStackFoundations:SF.2`.

**Used by.** `PurityForFlatCohomology:PF.6/codimension-one-torus-intersection`, `PurityForFlatCohomology:PF.6/brauer-codimension-one-intersection`, `PurityForFlatCohomology:PF.6/flasque-generic-injectivity`, `PurityForFlatCohomology:PF.6/norm-torus-counterexample`.

**Proposed location.** `TauCeti/AlgebraicGeometry/Purity/TorusIntersection.lean`, namespace `TauCetiRoadmap.PurityForFlatCohomology`. Implementation status: unchecked.

### 6.8 H^2 of a torus as an intersection over codimension-one points

**Theorem** (`PurityForFlatCohomology:PF.6/codimension-one-torus-intersection`). Let X be a Noetherian integral regular scheme with function field K and T an X-torus with generically injective H^2 (PF.6/generic-h2-injectivity). Then H^2\_ét(X, T) = ⋂\_{x ∈ X^{(1)}} H^2\_ét(Spec 𝒪\_{X,x}, T) inside H^2\_ét(K, T).

**Hypotheses and conventions.** X Noetherian integral regular; x ranges over points of height one; the local groups embed in H^2(K, T) by the injectivity hypothesis applied to opens and a limit.

**Proof outline.**

1. Let α lie in the intersection. If α extends to H^2(U, T) and to H^2(V, T) for nonempty opens U, V, then by the Mayer–Vietoris sequence for {U, V} (PF.0, API mayerVietoris) and injectivity of H^2(U ∩ V, T) → H^2(K, T), α extends to H^2(U ∪ V, T).
2. By a limit argument α extends over a neighbourhood of each height-one point, hence to an open U containing all height-one points; X ∖ U has codimension ≥ 2 with regular local rings, so PF.6/torus-purity extends α to H^2(X, T).

**Checks.**

- For X a Dedekind scheme the statement is the usual description of H^2(X, T) as classes unramified at every closed point.
- Without generic injectivity it can fail: PF.6/norm-torus-counterexample gives a nonzero class on ℙ^1\_ℝ that vanishes at the generic point.

**Sources.**

- `C19`, Theorem 6.2 and its proof, (6.2.2), pp. 13–14: Under generic injectivity, H^2(X, T) is the intersection of the H^2(𝒪\_{X,x}, T) over height-one points, by Mayer–Vietoris glueing of extensions and Theorem 6.1.

**Needs.** `PurityForFlatCohomology:PF.6/generic-h2-injectivity`, `PurityForFlatCohomology:PF.6/torus-purity`, `PurityForFlatCohomology:PF.0/flat-cohomology-with-supports`.

**Used by.** `PurityForFlatCohomology:PF.6/brauer-codimension-one-intersection`.

**Proposed location.** `TauCeti/AlgebraicGeometry/Purity/PF6.lean`, namespace `TauCetiRoadmap.PurityForFlatCohomology`. Implementation status: unchecked.

### 6.9 The Auslander–Goldman question: the Brauer group as an intersection over codimension one

**Theorem** (`PurityForFlatCohomology:PF.6/brauer-codimension-one-intersection`; planet **Auslander–Goldman intersection formula**). For a Noetherian integral regular scheme X with function field K, H^2\_ét(X, 𝔾\_m) = ⋂\_{x ∈ X^{(1)}} H^2\_ét(𝒪\_{X,x}, 𝔾\_m) inside H^2\_ét(K, 𝔾\_m).

**Hypotheses and conventions.** X Noetherian integral regular.

**Proof outline.**

1. 𝔾\_m has generically injective H^2 (PF.6/generic-h2-injectivity, API gm), so PF.6/codimension-one-torus-intersection applies.

**Checks.**

- For X = Spec R with R regular affine, this is the Auslander–Goldman description Br(R) = ⋂\_{ht 𝔭 = 1} Br(R\_𝔭) (Br = Br′ on affines by Gabber).
- For X = 𝔸^2\_ℂ: every class of Br(ℂ(x, y)) unramified along all curves is zero.

**Sources.**

- `C19`, Theorem 1.2 (= Theorem 6.2 for 𝔾\_m), p. 2; Lemma 3.2, p. 7: The Brauer group of a Noetherian integral regular scheme is the intersection of the Brauer groups of its local rings at height-one points inside the Brauer group of the function field, answering the question of Auslander and Goldman for affine X.

**Needs.** `PurityForFlatCohomology:PF.6/codimension-one-torus-intersection`, `PurityForFlatCohomology:PF.6/generic-h2-injectivity`.

**Used by.** `PurityForFlatCohomology:PF.6/global-brauer-residue-sequence`.

**Proposed location.** `TauCeti/AlgebraicGeometry/Purity/PF6.lean`, namespace `TauCetiRoadmap.PurityForFlatCohomology`. Implementation status: unchecked.

### 6.10 Flasque tori have generically injective H^2

**Theorem** (`PurityForFlatCohomology:PF.6/flasque-generic-injectivity`). Let X be a Noetherian integral regular scheme and T an X-torus that is flasque: there is a finite étale Galois cover X'/X splitting T such that the Gal(X'/X)-module Hom\_{X'-gp}(T\_{X'}, 𝔾\_{m,X'}) admits no nontrivial extension by any permutation module ℤ[Gal(X'/X)/H]. Then T has generically injective H^2 on X. Every torus direct factor of Res\_{X''/X}(𝔾\_m) for a finite étale X''/X is flasque.

**Hypotheses and conventions.** X Noetherian integral regular; the flasque condition as in Colliot-Thélène–Sansuc 1987, 0.5 and 1.2; the scheme-level theory of tori and their character modules is recorded in the gap SF-PII-tori.

**Proof outline.**

1. Colliot-Thélène–Sansuc 1987, Theorem 2.2(ii): for flasque T, H^2(V, T) → H^2(K, T) is injective on regular integral V; restrict to nonempty opens.
2. Direct factors of quasi-trivial tori Res\_{X''/X}𝔾\_m are flasque because permutation character modules have no nontrivial extensions by permutation modules (Shapiro's lemma and H^1(H, ℤ) = 0).

**Checks.**

- T = 𝔾\_m and T = Res\_{X'/X}𝔾\_m are flasque.
- For the norm-one torus of ℂ/ℝ, its character lattice ℤ\_sign is not flasque: 0 → ℤ\_trivial → ℤ[ℤ/2] → ℤ\_sign → 0 is nonsplit, giving Ext¹(ℤ\_sign,ℤ\_trivial) = ℤ/2. The sublattice ℤ\_trivial is a permutation lattice; using the regular permutation lattice as the Ext target would instead give zero.

**Sources.**

- `C19`, Remark 6.3, p. 14: Flasque tori, defined through Galois-module extensions of the character module by permutation modules, satisfy the injectivity hypothesis (6.2.1), e.g. torus direct factors of Weil restrictions of 𝔾\_m along finite étale covers.
- `CTS87`, §0.5, p. 155; Definition 1.2, pp. 157–158; Theorem 2.2(ii), pp. 161–163: Directly read: flasqueness of a character lattice is equivalent to vanishing Ext¹ into every permutation lattice; flasque tori on integral geometrically locally factorial schemes have injective H² restriction to nonempty opens and the generic point.

**Needs.** `PurityForFlatCohomology:PF.6/generic-h2-injectivity`, `SchemeAndStackFoundations:SF.1`.

**Used by.** None.

**Proposed location.** `TauCeti/AlgebraicGeometry/Purity/PF6.lean`, namespace `TauCetiRoadmap.PurityForFlatCohomology`. Implementation status: unchecked.

### 6.11 Generic injectivity fails for the norm-one torus over ℙ^1\_ℝ

**Theorem** (`PurityForFlatCohomology:PF.6/norm-torus-counterexample`). Let X = ℙ^1\_ℝ and T the base change to X of the norm-one torus defined by 0 → T → Res\_{ℂ/ℝ}(𝔾\_m) → 𝔾\_{m,ℝ} → 0 (the second map the norm). Then H^2\_ét(X, T) contains a nonzero class whose restriction to the generic point vanishes.

**Hypotheses and conventions.** X = ℙ^1\_ℝ; T as displayed.

**Proof outline.**

1. The norm map Res\_{ℂ/ℝ}𝔾\_m → 𝔾\_m restricted to the open 𝔾\_{m,ℝ} ⊂ ℙ^1\_ℝ is a T-torsor over 𝔾\_{m,ℝ} whose fibres over real points sweep out H^1(ℝ, T) ≅ ℤ/2, so it is not constant.
2. Every T-torsor over 𝔸^1\_ℝ is constant (Colliot-Thélène–Sansuc 1987, 2.4).
3. Cover ℙ^1\_ℝ by two copies of 𝔸^1 meeting in 𝔾\_{m,ℝ}; the Mayer–Vietoris sequence (PF.0, API mayerVietoris) maps the non-constant torsor to a nonzero class in H^2(ℙ^1\_ℝ, T), which is generically trivial because it is trivial on each 𝔸^1.

**Checks.**

- The class restricts to zero in H^2(ℝ(t), T), so the intersection formula of PF.6/codimension-one-torus-intersection fails for this T.
- H^1(ℝ, T) = ℝ^×/N(ℂ^×) = ℤ/2 is the source of the non-constancy.

**Sources.**

- `C19`, Remark 6.3, display (6.3.3), p. 14: The norm-one torus sequence over ℝ, viewed as a torsor over 𝔾\_{m,ℝ}, is not constant while all torsors over 𝔸^1\_ℝ are, so Mayer–Vietoris produces a nonzero generically trivial class in H^2(ℙ^1\_ℝ, T).
- `CTS87`, Lemma 2.4 and its proof, p. 164: Directly read: H¹(A,S) ≅ H¹(A[T\_1,…,T\_r],S) for a regular ring A and torus S, hence torsors on 𝔸¹ over a field are constant.

**Needs.** `PurityForFlatCohomology:PF.6/generic-h2-injectivity`, `PurityForFlatCohomology:PF.0/flat-cohomology-with-supports`, `SchemeAndStackFoundations:SF.1`.

**Used by.** None.

**Proposed location.** `TauCeti/AlgebraicGeometry/Purity/PF6.lean`, namespace `TauCetiRoadmap.PurityForFlatCohomology`. Implementation status: unchecked.

### 6.12 The residue homomorphism of a discrete valuation ring on Brauer groups

**Definition** (`PurityForFlatCohomology:PF.6/brauer-residue`). Let 𝒪 be a DVR with fraction field K and residue field k. Fix a prime ℓ different from char k, or ℓ = char k with k perfect. Pull back Br(K)[ℓ^∞] to Br(K̂)[ℓ^∞]. For the complete field K̂ and its maximal unramified extension K̂^unr, Br(K̂^unr)[ℓ^∞] = 0 gives the Hochschild–Serre identification with H²(G\_k,(K̂^unr)^×)[ℓ^∞]. Apply the valuation, then the inverse of δ : H¹(k,ℚ/ℤ) ≅ H²(k,ℤ) from 0 → ℤ → ℚ → ℚ/ℤ → 0. The composite is the ℓ-primary residue ∂\_𝒪. No isomorphism Br(K) ≅ Br(K̂) is assumed.

**Hypotheses and conventions.** 𝒪 a DVR; ℓ as stated (for ℓ = char k with k imperfect no such exact residue theory exists, Poonen Warning 6.8.2). The vanishing Br(K^unr)[ℓ^∞] = 0 for complete K with perfect residue field (Lang's theorem that K^unr is C\_1; for ℓ ≠ char k, Grothendieck, Brauer III, 1.3) is recorded in the gap BR-RESIDUE-LANG.

**Proof outline.**

1. Define the residue for a complete DVR using maximal-unramified Galois cohomology and the valuation; the permitted-primary vanishing over K̂^unr is exactly gap BR-RESIDUE-LANG.
2. For an arbitrary DVR, define ∂ by pullback to completion. Compatibility with henselization and unramified base change is part of the residue construction; it never requires a completion isomorphism on Brauer groups.
3. Use δ^{-1} after the valuation map. Fix the crossed-product convention by generators u a = σ(a)u and u^n = π for an unramified cyclic extension L/K of degree n, with χ(σ)=1/n. With this convention ∂[(L/K,σ,π)] = χ; this fixes the sign.

**API.**

- `TauCetiRoadmap.PurityForFlatCohomology.brauerResidue` (constructor): ∂ : Br(K)[ℓ^∞] → H^1(k, ℚ/ℤ)[ℓ^∞] for (𝒪, ℓ) admissible.
- `TauCetiRoadmap.PurityForFlatCohomology.brauerResidue_completion` (compatibility): ∂ for 𝒪 agrees with ∂ for its completion and its henselization under the natural maps.
- `TauCetiRoadmap.PurityForFlatCohomology.brauerResidue_unramified_base_change` (functoriality): For an unramified extension of DVRs 𝒪 → 𝒪' with residue extension k'/k, ∂' ∘ res = res ∘ ∂.
- `TauCetiRoadmap.PurityForFlatCohomology.brauerResidue_kernel` (relation): ker ∂ = image of Br(𝒪)[ℓ^∞] (PF.6/dvr-brauer-residue-sequence).
- `TauCetiRoadmap.PurityForFlatCohomology.brauerResidue_cyclic` (example): For an unramified cyclic extension L/K of degree n with generator σ, let χ(σ) = 1/n ∈ ℚ/ℤ. The crossed product has u a = σ(a)u and u^n = π for a uniformizer π. With ∂ defined using δ^{-1} as above, ∂[(L/K,σ,π)] = χ.

**Definition/construction tests.**

- `TauCetiRoadmap.PurityForFlatCohomology.brauerResidue_padic` (computation): For 𝒪 = ℤ\_p, ∂ : Br(ℚ\_p) → H¹(𝔽\_p,ℚ/ℤ) is an isomorphism. Evaluating its character on arithmetic Frobenius agrees with the local invariant normalized by the displayed crossed product; check the Frobenius convention when adapting Tau Ceti ClassFieldTheory.
- `TauCetiRoadmap.PurityForFlatCohomology.brauerResidue_unramified_zero` (degenerate): ∂ vanishes on the image of Br(𝒪).
- `TauCetiRoadmap.PurityForFlatCohomology.brauerResidue_laurent` (computation): For 𝒪 = ℂ⟦t⟧, H^1(ℂ, ℚ/ℤ) = 0 and Br(ℂ((t))) = 0, so ∂ = 0.
- `TauCetiRoadmap.PurityForFlatCohomology.not_brauerResidue_imperfect` (non-example): For 𝒪 = k⟦t⟧ with k separably closed and imperfect of characteristic p, Br(𝒪) = 0 and H^1(k, ℚ/ℤ) = 0 but Br(k((t)))[p] ≠ 0, so no exact p-primary residue sequence exists (Poonen Warning 6.8.2).

**Checks.**

- For ℤ\_p the residue is the local invariant Br(ℚ\_p) ≅ ℚ/ℤ.
- No exact p-primary residue exists over k⟦t⟧ with k separably closed imperfect.

**Uses.** C19 Remark 6.4: the residue sequence for DVRs and its global form (6.4.4). Poonen Theorem 6.8.3: the global residue sequence on regular integral schemes.

**Sources.**

- `C19`, Remark 6.4, p. 14: For a discrete valuation ring, the residue sequence on ℓ-primary Brauer groups for ℓ ≠ char k, and for ℓ = char k when k is perfect (Grothendieck, Brauer III, 2.1).
- `Poo17`, Proposition 6.8.1 and the construction after it, pp. 196–197; Warning 6.8.2, p. 197: The residue homomorphism Br K → H^1(k, ℚ/ℤ) through the maximal unramified extension and the valuation, with the caveat that p-primary parts are excluded when k is imperfect of characteristic p.

**Needs.** `SchemeAndStackFoundations:SF.2`, `mathlib:IsDiscreteValuationRing`.

**Used by.** `PurityForFlatCohomology:PF.6/dvr-brauer-residue-sequence`, `PurityForFlatCohomology:PF.6/global-brauer-residue-sequence`.

**Proposed location.** `TauCeti/AlgebraicGeometry/Purity/Residue.lean`, namespace `TauCetiRoadmap.PurityForFlatCohomology`. Implementation status: unchecked.

### 6.13 The residue sequence of a discrete valuation ring

**Theorem** (`PurityForFlatCohomology:PF.6/dvr-brauer-residue-sequence`). Under the hypotheses of PF.6/brauer-residue, the sequence 0 → H^2\_ét(𝒪, 𝔾\_m)[ℓ^∞] → H^2\_ét(K, 𝔾\_m)[ℓ^∞] → H^1\_ét(k, ℚ/ℤ)[ℓ^∞] is exact. No surjectivity of the residue is asserted.

**Hypotheses and conventions.** As in PF.6/brauer-residue.

**Proof outline.**

1. Injectivity: PF.5/gm-cohomology-torsion(b) for the regular one-dimensional Spec 𝒪.
2. For complete 𝒪, use 0 → (𝒪^unr)^× → (K^unr)^× → ℤ → 0, its Galois-cohomology sequence and the henselian Brauer identification Br(𝒪) ≅ Br(k). This identifies the kernel with the unramified classes in the admissible primary parts.
3. For an arbitrary DVR, use the unramified descent criterion: a class of Br(K)[ℓ^∞] whose pullback lies in Br(𝒪̂)[ℓ^∞] already extends over 𝒪. This is the remaining scheme-localization input in Poonen Proposition 6.8.1 (Grothendieck Brauer III, Proposition 2.1), recorded separately as gap BR-RESIDUE-DESCENT. Completion alone proves only the complete case.

**Checks.**

- For 𝒪 = ℤ\_p: 0 → 0 → ℚ/ℤ → ℚ/ℤ, the residue being the local invariant.
- For 𝒪 = ℝ⟦t⟧: Br(ℝ⟦t⟧) = ℤ/2 → Br(ℝ((t))) = ℤ/2 ⊕ ℤ/2 → H^1(ℝ, ℚ/ℤ) = ℤ/2 is exact and the residue is onto here.

**Sources.**

- `C19`, Remark 6.4, p. 14: The exact residue sequence 0 → H^2(𝒪, 𝔾\_m)[ℓ^∞] → H^2(K, 𝔾\_m)[ℓ^∞] → H^1(k, ℚ/ℤ)[ℓ^∞] for ℓ ≠ char k, and for ℓ = char k if k is perfect (Grothendieck, Brauer III, 2.1).
- `Poo17`, Proposition 6.8.1, p. 196: Exactness of 0 → Br R → Br K → H^1(k, ℚ/ℤ) with the p-primary caveat.

**Needs.** `PurityForFlatCohomology:PF.6/brauer-residue`, `PurityForFlatCohomology:PF.5/gm-cohomology-torsion`, `SchemeAndStackFoundations:SF.2`.

**Used by.** `PurityForFlatCohomology:PF.6/global-brauer-residue-sequence`.

**Proposed location.** `TauCeti/AlgebraicGeometry/Purity/PF6.lean`, namespace `TauCetiRoadmap.PurityForFlatCohomology`. Implementation status: unchecked.

### 6.14 The residue sequence of a regular integral scheme

**Theorem** (`PurityForFlatCohomology:PF.6/global-brauer-residue-sequence`; planet **Global residue sequence**). For a Noetherian integral regular scheme X with function field K, the sequence 0 → H^2\_ét(X, 𝔾\_m) → H^2\_ét(K, 𝔾\_m) → ⊕\_{x ∈ X^{(1)}} H^1\_ét(k(x), ℚ/ℤ) is exact after excluding the p-primary parts of all groups for every prime p such that some height-one point x has an imperfect residue field k(x) of characteristic p.

**Hypotheses and conventions.** X Noetherian integral regular; for each excluded p the p-primary parts of all three groups are removed.

**Proof outline.**

1. Combine PF.6/brauer-codimension-one-intersection (H^2(X, 𝔾\_m) is the intersection of the H^2(𝒪\_{X,x}, 𝔾\_m) over height-one x) with PF.6/dvr-brauer-residue-sequence for each 𝒪\_{X,x} (a DVR) in the admissible primary parts; the residue of a class is nonzero at only finitely many x (it extends over a dense open).

**Checks.**

- For X = Spec ℤ: 0 → Br(ℤ) = 0 → Br(ℚ) → ⊕\_p H^1(𝔽\_p, ℚ/ℤ) = ⊕\_p ℚ/ℤ is exact (the real place is not a point of Spec ℤ).
- For X a smooth variety over a field of characteristic 0 nothing is excluded.
- For X = 𝔸^2\_{𝔽\_p} every p-primary part is excluded, as PF.6/imperfect-residue-exclusion shows.

**Sources.**

- `C19`, Remark 6.4, (6.4.4), p. 14: Theorem 6.2 implies the exact residue sequence for Noetherian integral regular schemes once the p-primary parts are excluded for primes p at which some height-one residue field is imperfect, as anticipated in Poonen 6.8.4.
- `Poo17`, Theorem 6.8.3 and Warning 6.8.4, p. 197: The global residue sequence with Poonen's caveat, and his remark that excluding only the primes at which some height-one residue field is imperfect might suffice even when dim X ≥ 2.

**Needs.** `PurityForFlatCohomology:PF.6/brauer-codimension-one-intersection`, `PurityForFlatCohomology:PF.6/dvr-brauer-residue-sequence`, `PurityForFlatCohomology:PF.6/brauer-residue`.

**Used by.** `PurityForFlatCohomology:PF.6/imperfect-residue-exclusion`, `PurityForFlatCohomology:PF.6/codimension-one-deletion-example`.

**Proposed location.** `TauCeti/AlgebraicGeometry/Purity/PF6.lean`, namespace `TauCetiRoadmap.PurityForFlatCohomology`. Implementation status: unchecked.

### 6.15 Points of height ≥ 2 in characteristic p force imperfect height-one residue fields

**Theorem** (`PurityForFlatCohomology:PF.6/imperfect-residue-exclusion`). Let X be a Noetherian integral regular scheme with a point y of height ≥ 2 and residue characteristic p > 0. Then y specializes from (is a specialization of) a point x of height one with residue characteristic p whose residue field k(x) carries a nontrivial discrete valuation; in particular k(x) is imperfect, so the p-primary parts are excluded in PF.6/global-brauer-residue-sequence.

**Hypotheses and conventions.** X Noetherian integral regular; y of height ≥ 2 with char k(y) = p.

**Proof outline.**

1. Choose a height-one prime of 𝒪\_{X,y} containing p (or, in equal characteristic p, any height-one prime): it gives x with char k(x) = p. The closure of x is a scheme of dimension ≥ 1 at y, so k(x) is the function field of a Noetherian local domain of positive dimension and carries a nontrivial discrete valuation (EGA II 7.1.7).
2. A field of characteristic p with a nontrivial discrete valuation v is imperfect: a uniformizer has valuation 1, not divisible by p.

**Checks.**

- For X = Spec ℤ\_p⟦x⟧, y the closed point and x = (p): k(x) = 𝔽\_p((x)) is imperfect.
- For X of dimension 1 (Dedekind) no point of height ≥ 2 exists and the lemma is vacuous.

**Sources.**

- `C19`, Footnote 5 to Remark 6.4, p. 14: A point of residue characteristic p and height ≥ 2 generalizes to a height-one point of residue characteristic p whose residue field has a nontrivial discrete valuation (EGA II 7.1.7), hence is imperfect, so the p-primary parts are excluded.

**Needs.** `PurityForFlatCohomology:PF.6/global-brauer-residue-sequence`, `mathlib:IsDiscreteValuationRing`.

**Used by.** None.

**Proposed location.** `TauCeti/AlgebraicGeometry/Purity/PF6.lean`, namespace `TauCetiRoadmap.PurityForFlatCohomology`. Implementation status: unchecked.

### 6.16 Removing a divisor changes the Brauer group

**Theorem** (`PurityForFlatCohomology:PF.6/codimension-one-deletion-example`). The Brauer group of 𝔸^2\_ℂ is zero, while the Brauer group of the complement of the two coordinate axes, 𝔾\_m^2 over ℂ, is nonzero; hence the codimension ≥ 2 hypothesis of PF.6/brauer-purity-regular cannot be weakened to codimension 1.

**Hypotheses and conventions.** Over ℂ; the coordinate axes form a divisor.

**Proof outline.**

1. On 𝔾\_m² over ℂ choose a primitive nth root ζ, n ≥ 2, and the cyclic algebra generated by v^n = y, u^n = x, u v = ζ v u. It is Azumaya where x and y are units. Along x = 0 it is the crossed product with unramified extension adjoining an nth root of y, σ(v)=ζv, so PF.6/brauer-residue gives the nonzero character of y in H¹(ℂ(y),ℤ/n). Thus its generic class and its class on 𝔾\_m² are nonzero. Br(𝔸²\_ℂ) = 0 is the homotopy-invariance calculation cited in C19 §1 through DeMeyer–Ford Remark 3.

**Checks.**

- For the displayed crossed product, the x = 0 residue is the Kummer character of y, nonzero in ℂ(y)^×/ℂ(y)^{×n}. The explicit generators specify the convention instead of leaving the sign of a symbol (x,y)\_n ambiguous.
- Removing only the origin does not change Br (PF.6/brauer-purity-regular).

**Sources.**

- `C19`, §1, p. 1: The codimension requirement of the purity conjecture is necessary: the Brauer group of 𝔸^2\_ℂ differs from that of the complement of the coordinate axes (DeMeyer–Ford, Remark 3).
- `DF84`, Remark 3: Brauer groups of surfaces (not read; cited through C19 p. 1).

**Needs.** `PurityForFlatCohomology:PF.6/global-brauer-residue-sequence`, `PurityForFlatCohomology:PF.6/brauer-purity-regular`.

**Used by.** None.

**Proposed location.** `TauCeti/AlgebraicGeometry/Purity/PF6.lean`, namespace `TauCetiRoadmap.PurityForFlatCohomology`. Implementation status: unchecked.

## Source findings

All six findings received an independent verdict. Their mathematical descriptions are paraphrases. No journal-version claim is made without reading that version. E6 identifies a gap in a noncommutative proof; it does not supply a counterexample to the theorem.

### E1 — `CS24`, Theorem 7.1.2, p. 87

**Version.** arXiv:1912.10932v3

**Kind.** error

**Source assertion.** Each 𝒪\_{X,z} is assumed to be a complete intersection of dimension ≥ d or regular of dimension ≥ d − 1, and restriction H^i(X, G) → H^i(X ∖ Z, G) is asserted injective for i < d.

**Correction.** Require regular local rings of dimension ≥ max(d − 1, 1) (not fields), or d ≥ 2.

**Reason.** For d = 1, X = Spec k ⊔ Spec k and Z one point, H^0(X, G) → H^0(X ∖ Z, G) is not injective; the proof uses Theorem 6.2.7, which excludes fields.

**Affects.** a stated result

**Handling.** PF.5/global-flat-purity is stated with the corrected hypothesis.

**Known status.** Recorded and confirmed by the paper extraction (PAPER-CESNAVICIUS-SCHOLZE-24/E1, review verdict confirmed); no published correction was verified in this review; the finding is scoped to the arXiv version read.

**Search record.** arXiv versions and the journal abstract page as recorded in the paper extraction; PAPER-CESNAVICIUS-SCHOLZE-24/E1.

**Independent verdict.** `confirmed`: Confirmed in arXiv v3: for d=1 a field component satisfies the printed regular dimension bound but supports nonzero constant sections. The proof needs the nonfield hypothesis of 6.2.7. Reviewed by `REV-DESIGN-PurityForFlatCohomology`.

### E2 — `CS24`, Proof of Theorem 3.3.1(b), p. 35

**Version.** arXiv:1912.10932v3

**Kind.** misprint

**Source assertion.** The hypothesis is written vdim(Rd) ≥ 3.

**Correction.** vdim(R) ≥ 3.

**Reason.** No ring Rd occurs; the hypothesis of (b) is vdim(R) ≥ 3.

**Affects.** the proof

**Handling.** None; PF.1/zariski-nagata-virtual-dimension uses vdim(R).

**Known status.** Recorded and confirmed by the paper extraction (PAPER-CESNAVICIUS-SCHOLZE-24/E4, review verdict confirmed); no published correction was verified in this review; the finding is scoped to the arXiv version read.

**Search record.** arXiv versions and the journal abstract page as recorded in the paper extraction; PAPER-CESNAVICIUS-SCHOLZE-24/E4.

**Independent verdict.** `confirmed`: Confirmed in arXiv v3: the extra d in the displayed ring name has no defined referent; the theorem and argument concern R. Reviewed by `REV-DESIGN-PurityForFlatCohomology`.

### E3 — `CS24`, Proof of Theorem 6.2.7, p. 85

**Version.** arXiv:1912.10932v3

**Kind.** misprint

**Source assertion.** f ∈ (p, x\_1, …, x\_n)^2.

**Correction.** f ∈ (p, x\_1, …, x\_d)^2.

**Reason.** The variables are x\_1, …, x\_d; n is not defined there.

**Affects.** the proof

**Handling.** PF.4/flat-purity-regular uses the corrected form.

**Known status.** Recorded and confirmed by the paper extraction (PAPER-CESNAVICIUS-SCHOLZE-24/E11, review verdict confirmed); no published correction was verified in this review; the finding is scoped to the arXiv version read.

**Search record.** arXiv versions and the journal abstract page as recorded in the paper extraction; PAPER-CESNAVICIUS-SCHOLZE-24/E11.

**Independent verdict.** `confirmed`: Confirmed in arXiv v3: the presentation uses d variables, but the square of the maximal ideal in this line is indexed by n. Reviewed by `REV-DESIGN-PurityForFlatCohomology`.

### E4 — `CS24`, Proof of Theorem 7.2.1, p. 89

**Version.** arXiv:1912.10932v3

**Kind.** misprint

**Source assertion.** Every element of Pic(U\_R)\_tors comes from H^1(U\_R, μ\_n) for some n ≥ 0.

**Correction.** … for some n ≥ 1.

**Reason.** μ\_0 is not meant; torsion classes are killed by a positive integer.

**Affects.** the proof

**Handling.** PF.5/local-picard-torsion-vanishing uses n ≥ 1.

**Known status.** Recorded and confirmed by the paper extraction (PAPER-CESNAVICIUS-SCHOLZE-24/E12, review verdict confirmed); no published correction was verified in this review; the finding is scoped to the arXiv version read.

**Search record.** arXiv versions and the journal abstract page as recorded in the paper extraction; PAPER-CESNAVICIUS-SCHOLZE-24/E12.

**Independent verdict.** `confirmed`: Confirmed in arXiv v3: the Kummer step requires a positive integer annihilator; the printed nonnegative range inadvertently includes zero. Reviewed by `REV-DESIGN-PurityForFlatCohomology`.

### E5 — `CS24`, Proof of Theorem 7.2.5, p. 90

**Version.** arXiv:1912.10932v3

**Kind.** misprint

**Source assertion.** Br(R)[n] ≅ H^2(R, μ\_n) and Br(U\_R)[n] ≅ H^2(U\_R, μ\_n) for n ≥ 0.

**Correction.** … for n ≥ 1.

**Reason.** The Kummer identification is for positive n.

**Affects.** the proof

**Handling.** PF.5/brauer-purity-complete-intersection uses n ≥ 1.

**Known status.** Recorded and confirmed by the paper extraction (PAPER-CESNAVICIUS-SCHOLZE-24/E13, review verdict confirmed); no published correction was verified in this review; the finding is scoped to the arXiv version read.

**Search record.** arXiv versions and the journal abstract page as recorded in the paper extraction; PAPER-CESNAVICIUS-SCHOLZE-24/E13.

**Independent verdict.** `confirmed`: Confirmed in arXiv v3: the Kummer identification used here requires n>0, not the printed nonnegative range. Reviewed by `REV-DESIGN-PurityForFlatCohomology`.

### E6 — `C19`, Proposition 2.2 and its proof, p. 4

**Version.** arXiv:1711.06456v4

**Kind.** gap

**Source assertion.** Injectivity of H^1(V, G) → H^1(V\_{R'}, G) is claimed for every affine smooth R-group G.

**Correction.** For the applications here, restrict to commutative G. To retain full noncommutative injectivity, an argument for every twisted fibre is required; this review establishes a proof gap, not a counterexample to the stated theorem.

**Reason.** Surjectivity of H(V) → X(V) for H = Res\_{R'/R}(G\_{R'}) and X = H/G only makes the fibre of H^1(V, G) → H^1(V, H) over the trivial class trivial; for noncommutative G the other fibres involve the twisted forms of H and X, which the proof does not control. Both uses (Proposition 2.3 and Corollary 2.4) have G commutative.

**Affects.** the proof

**Handling.** PF.6/henselian-torus-punctured-vanishing uses Corollary 2.4 for tori only (gap SF-PII-tori).

**Known status.** Recorded and confirmed by the paper extraction (PAPER-CESNAVICIUS-19/E1, review verdict confirmed); no published correction was verified in this review; the finding is scoped to the arXiv version read.

**Search record.** arXiv versions and the journal abstract page as recorded in the paper extraction; PAPER-CESNAVICIUS-19/E1.

**Independent verdict.** `confirmed`: Confirmed as a proof gap in arXiv v4: triviality of the distinguished H¹ fibre does not establish injectivity of all nonabelian fibres. The commutative restriction suffices for the cited uses. This does not establish that the unrestricted theorem is false. Reviewed by `REV-DESIGN-PurityForFlatCohomology`.

## Coverage and extraction routes

| Layer | Status | Remaining inputs |
|---|---|---|
| PF.0 | planned | Discharge the import request to SchemeAndStackFoundations:SF.2 for limits of fppf cohomology of finitely presented groups. |
| PF.1 | planned | Gap EDP-PII-local-lefschetz (CS24 Lemma 3.2.3), owned by the pending EtaleDualityAndPerverseSheavesPartII design. Gap SF-PII-algebraization (Stacks 0DXR, 0DX9, 0EJP; Ferrand–Raynaud patching). Gaps AVRAMOV and BURCH-KOHN for the two sharpness and additivity statements. |
| PF.2 | planned | Gaps SF-PII-key-formula and SF-PII-deformation (CS24 §4.1 and the Bégueri/deformation inputs). Import the individually checked PD.6 perfect-base classification target; the PrismaticCohomologyPartII packet as a whole still has needs\_changes (its unresolved node is in PD.7). |
| PF.3 | planned | Gaps SF-PII-key-formula, SF-PII-deformation, SF-PII-continuity, SF-PII-excision and PQ-PII-towers (Proposition 2.1.9). The three PD.6 supplier nodes used here exist and were read individually: perfect-base-classification, covariant-normalisation and torsion-base-change. The packet as a whole has needs\_changes because of PD.7; this review does not promote it or certify its full closure. |
| PF.4 | planned | Gaps SF-PII-continuity, SF-PII-excision and PQ-PII-towers; request to DerivedDeRhamCohomology:DD.1 (CS24 Lemma 6.2.1). Import PerfectoidSpaces P7.16a–P7.17 for the two regular towers; the explicit tilt and valuation refinements alone remain PQ-PII-towers. |
| PF.5 | planned | Gaps SF-PII-brauer and SF-PII-tori; requests to DeformationAndDerivedPatchingAlgebra:R03.3 (factoriality of regular local rings, Stacks 07DV, 09Q7). Gap AUSLANDER-FREENESS: read and outline the original homological argument for the criterion owned by PF.5; its exact statement and application are checked through CS24 p. 88. |
| PF.6 | planned | Gaps SF-PII-tori, BR-RESIDUE-LANG and BR-RESIDUE-DESCENT; the latter supplies general-DVR middle exactness after the complete-DVR calculation. |

The extraction routes below include the imported SGA 2 proof route. The imported items do not add duplicate targets to this roadmap.

| Extraction item | Targets or supplier | Disposition |
|---|---|---|
| `PAPER-CESNAVICIUS-SCHOLZE-24/043` | `PurityForFlatCohomology:PF.1/virtual-dimension` | Planned here at target level. |
| `PAPER-CESNAVICIUS-SCHOLZE-24/044` | `PurityForFlatCohomology:PF.1/virtual-dimension`, `PurityForFlatCohomology:PF.1/virtual-dimension-flat-additivity` | Invariance under completion, henselization and separable-fibre flat maps is API of the definition; general additivity is a node with the Avramov gap. |
| `PAPER-CESNAVICIUS-SCHOLZE-24/045` | `PurityForFlatCohomology:PF.1/depth-virtual-dimension-incomparable` | Planned here at target level. |
| `PAPER-CESNAVICIUS-SCHOLZE-24/049` | `PurityForFlatCohomology:PF.1/etale-depth-virtual-dimension` | Planned here at target level. Local Lefschetz input recorded as gap EDP-PII-local-lefschetz. |
| `PAPER-CESNAVICIUS-SCHOLZE-24/050` | None. | Owned upstream: TauCetiRoadmap LocalPurity §§2.1–2.2 (Stacks 0BMA, 0EY7), open pull request #1102; consumed by PF.1/zariski-nagata-virtual-dimension (upstreamImports). |
| `PAPER-CESNAVICIUS-SCHOLZE-24/052` | `PurityForFlatCohomology:PF.1/zariski-nagata-virtual-dimension` | Planned here at target level. |
| `PAPER-CESNAVICIUS-SCHOLZE-24/064` | `PurityForFlatCohomology:PF.2/additive-group-depth-vanishing` | Planned here at target level. |
| `PAPER-CESNAVICIUS-SCHOLZE-24/065` | `PurityForFlatCohomology:PF.2/root-extraction-comparison` | Planned here at target level. |
| `PAPER-CESNAVICIUS-SCHOLZE-24/066` | `PurityForFlatCohomology:PF.2/finite-flat-cover-reduction` | Planned here at target level. |
| `PAPER-CESNAVICIUS-SCHOLZE-24/067` | `PurityForFlatCohomology:PF.2/char-p-complete-intersection-purity` | Planned here at target level. |
| `PAPER-CESNAVICIUS-SCHOLZE-24/071` | `PurityForFlatCohomology:PF.3/perfectoid-low-degree-cohomology` | Planned here at target level. |
| `PAPER-CESNAVICIUS-SCHOLZE-24/073` | `PurityForFlatCohomology:PF.3/dieudonne-side-arc-descent` | Planned here at target level. |
| `PAPER-CESNAVICIUS-SCHOLZE-24/074` | `PurityForFlatCohomology:PF.3/finitely-presented-modules-over-products` | Planned here at target level. |
| `PAPER-CESNAVICIUS-SCHOLZE-24/075` | `PurityForFlatCohomology:PF.3/dieudonne-modules-over-products` | Planned here at target level. |
| `PAPER-CESNAVICIUS-SCHOLZE-24/076` | `PurityForFlatCohomology:PF.3/frobenius-fixed-points-algebraically-closed` | Planned here at target level. |
| `PAPER-CESNAVICIUS-SCHOLZE-24/077` | `PurityForFlatCohomology:PF.3/product-valuation-local-analysis` | Planned here at target level. |
| `PAPER-CESNAVICIUS-SCHOLZE-24/120` | `PurityForFlatCohomology:PF.3/flat-side-arc-descent` | Planned here at target level. |
| `PAPER-CESNAVICIUS-SCHOLZE-24/121` | `PurityForFlatCohomology:PF.3/key-formula`, `PurityForFlatCohomology:PF.3/dieudonne-side-complex` | Planned here at target level. |
| `PAPER-CESNAVICIUS-SCHOLZE-24/122` | `PurityForFlatCohomology:PF.3/perfectoid-purity` | Planned here at target level. |
| `PAPER-CESNAVICIUS-SCHOLZE-24/124` | `PurityForFlatCohomology:PF.4/completion-regular-sequence` | Planned here at target level. |
| `PAPER-CESNAVICIUS-SCHOLZE-24/125` | `PurityForFlatCohomology:PF.4/flat-purity-complete-intersection` | Planned here at target level. |
| `PAPER-CESNAVICIUS-SCHOLZE-24/126` | `PurityForFlatCohomology:PF.4/etale-purity-virtual-dimension` | Planned here at target level. |
| `PAPER-CESNAVICIUS-SCHOLZE-24/127` | `PurityForFlatCohomology:PF.4/virtual-dimension-flat-counterexample` | Planned here at target level. |
| `PAPER-CESNAVICIUS-SCHOLZE-24/128` | `PurityForFlatCohomology:PF.4/flat-purity-regular` | Planned here at target level. |
| `PAPER-CESNAVICIUS-SCHOLZE-24/129` | `PurityForFlatCohomology:PF.5/global-flat-purity` | Planned here at target level. With the corrected hypothesis of PurityForFlatCohomology/E1. |
| `PAPER-CESNAVICIUS-SCHOLZE-24/130` | `PurityForFlatCohomology:PF.5/auslander-endomorphism-freeness` | Planned here at target level. |
| `PAPER-CESNAVICIUS-SCHOLZE-24/131` | `PurityForFlatCohomology:PF.5/torsor-gerbe-purity` | Planned here at target level. |
| `PAPER-CESNAVICIUS-SCHOLZE-24/132` | `PurityForFlatCohomology:PF.5/parafactorial-local-ring`, `PurityForFlatCohomology:PF.5/gm-cohomology-torsion` | Definition and API planned here; the Brauer II torsion statement in the item is PF.5/gm-cohomology-torsion. |
| `PAPER-CESNAVICIUS-SCHOLZE-24/133` | `PurityForFlatCohomology:PF.5/parafactorial-local-ring`, `PurityForFlatCohomology:PF.5/global-complete-intersection-picard` | SGA 2 XI 3.13(ii) is owned upstream (DeformationAndDerivedPatchingAlgebra §6.9, localCI\_parafactorial) and enters as API of PF.5/parafactorial-local-ring; SGA 2 XII 3.7 is recovered through the affine cone in PF.5/global-complete-intersection-picard. |
| `PAPER-CESNAVICIUS-SCHOLZE-24/134` | `PurityForFlatCohomology:PF.5/local-picard-torsion-vanishing` | Planned here at target level. |
| `PAPER-CESNAVICIUS-SCHOLZE-24/135` | `PurityForFlatCohomology:PF.5/cohen-macaulay-counterexample` | Planned here at target level. |
| `PAPER-CESNAVICIUS-SCHOLZE-24/136` | `PurityForFlatCohomology:PF.5/global-complete-intersection-picard` | Planned here at target level. |
| `PAPER-CESNAVICIUS-SCHOLZE-24/137` | `PurityForFlatCohomology:PF.5/regular-dimension-two-extension`, `PurityForFlatCohomology:PF.5/gm-cohomology-torsion` | Planned here at target level. |
| `PAPER-CESNAVICIUS-SCHOLZE-24/138` | `PurityForFlatCohomology:PF.5/brauer-purity-complete-intersection` | Planned here at target level. |
| `PAPER-CESNAVICIUS-SCHOLZE-24/139` | `PurityForFlatCohomology:PF.5/brauer-purity-sharpness` | Planned here at target level. |
| `PAPER-CESNAVICIUS-SCHOLZE-24/140` | `PurityForFlatCohomology:PF.0/hartogs-regular-sequence` | Planned here at target level. |
| `PAPER-CESNAVICIUS-SCHOLZE-24/141` | `PurityForFlatCohomology:PF.5/multiplicative-type-purity-low-degree` | Planned here at target level. |
| `PAPER-CESNAVICIUS-SCHOLZE-24/142` | `PurityForFlatCohomology:PF.5/multiplicative-type-purity-low-degree` | Planned here at target level. |
| `PAPER-CESNAVICIUS-SCHOLZE-24/143` | `PurityForFlatCohomology:PF.5/multiplicative-type-purity-higher` | Planned here at target level. |
| `PAPER-CESNAVICIUS-19/punctured` | `PurityForFlatCohomology:PF.0/punctured-spectrum` | Planned here at target level. |
| `PAPER-CESNAVICIUS-19/hartogs` | `PurityForFlatCohomology:PF.0/punctured-spectrum`, `PurityForFlatCohomology:PF.0/hartogs-regular-sequence` | The Noetherian depth-two statement is TauCetiRoadmap SchemeAndStackFoundations §0.6 (coherent\_hartogs); it is API of PF.0/punctured-spectrum and the Noetherian case of PF.0/hartogs-regular-sequence. |
| `PAPER-CESNAVICIUS-19/pic-regular` | `PurityForFlatCohomology:PF.5/local-picard-torsion-vanishing` | Regular case of the node; its extension argument is DeformationAndDerivedPatchingAlgebra §6.9 upstream. |
| `PAPER-CESNAVICIUS-19/purity-dim2` | `PurityForFlatCohomology:PF.5/regular-dimension-two-extension` | Planned here at target level. |
| `PAPER-CESNAVICIUS-19/purity-dim3` | `PurityForFlatCohomology:PF.6/strict-local-brauer-purity` | Covered by the node in dimension 3 through PF.4/flat-purity-regular (CS24 does not treat dimension 3 separately); Gabber's 1981 proof is not planned. |
| `PAPER-CESNAVICIUS-19/absolute-purity-input` | None. | Owned upstream: TauCetiRoadmap LefschetzPencilsAndVanishingCycles §0.10 (draft pull request #873); consumed through stage LefschetzPencilsAndVanishingCycles:LPV.0 by PF.1/etale-depth-virtual-dimension and PF.4/flat-purity-regular. |
| `PAPER-CESNAVICIUS-19/prime-to-p-purity` | `PurityForFlatCohomology:PF.6/strict-local-brauer-purity` | Special case of the node (its prime-to-p part). |
| `PAPER-CESNAVICIUS-19/equal-char-purity` | `PurityForFlatCohomology:PF.6/strict-local-brauer-purity` | Special case of the node; C19's perfection argument is replaced by the CS24 route. |
| `PAPER-CESNAVICIUS-19/mixed-char-purity` | `PurityForFlatCohomology:PF.6/strict-local-brauer-purity` | Special case of the node; C19's perfectoid-tower argument is replaced by the CS24 route. |
| `PAPER-CESNAVICIUS-19/strict-local-purity` | `PurityForFlatCohomology:PF.6/strict-local-brauer-purity` | Planned here at target level. |
| `PAPER-CESNAVICIUS-19/local-torus-h2` | `PurityForFlatCohomology:PF.6/henselian-torus-punctured-vanishing` | Planned here at target level. Its finite-étale descent input is gap SF-PII-tori. |
| `PAPER-CESNAVICIUS-19/support-coniveau` | `PurityForFlatCohomology:PF.6/coniveau-spectral-sequence` | Planned here at target level. |
| `PAPER-CESNAVICIUS-19/low-support-vanish` | `PurityForFlatCohomology:PF.6/torus-low-support-vanishing` | Planned here at target level. |
| `PAPER-CESNAVICIUS-19/global-purity-h0` | `PurityForFlatCohomology:PF.6/torus-purity` | Planned here at target level. |
| `PAPER-CESNAVICIUS-19/global-purity-h1` | `PurityForFlatCohomology:PF.6/torus-purity` | Planned here at target level. |
| `PAPER-CESNAVICIUS-19/global-purity-h2` | `PurityForFlatCohomology:PF.6/torus-purity` | Planned here at target level. |
| `PAPER-CESNAVICIUS-19/global-purity-h3` | `PurityForFlatCohomology:PF.6/torus-purity` | Planned here at target level. |
| `PAPER-CESNAVICIUS-19/global-gm-purity` | `PurityForFlatCohomology:PF.6/brauer-purity-regular` | Planned here at target level. |
| `PAPER-CESNAVICIUS-19/generic-injective-torus` | `PurityForFlatCohomology:PF.6/generic-h2-injectivity` | Planned here at target level. |
| `PAPER-CESNAVICIUS-19/torus-mayer-vietoris` | `PurityForFlatCohomology:PF.0/flat-cohomology-with-supports` | API mayerVietoris of the supports construction, from the Čech spectral sequence of SchemeAndStackFoundations §2.2. |
| `PAPER-CESNAVICIUS-19/codim1-intersection` | `PurityForFlatCohomology:PF.6/codimension-one-torus-intersection` | Planned here at target level. |
| `PAPER-CESNAVICIUS-19/brauer-intersection` | `PurityForFlatCohomology:PF.6/brauer-codimension-one-intersection` | Planned here at target level. |
| `PAPER-CESNAVICIUS-19/flasque-injectivity` | `PurityForFlatCohomology:PF.6/flasque-generic-injectivity` | Planned here at target level. |
| `PAPER-CESNAVICIUS-19/torus-counterexample` | `PurityForFlatCohomology:PF.6/norm-torus-counterexample` | Planned here at target level. |
| `PAPER-CESNAVICIUS-19/brauer-residue` | `PurityForFlatCohomology:PF.6/brauer-residue` | Planned here at target level. |
| `PAPER-CESNAVICIUS-19/dvr-residue-exact` | `PurityForFlatCohomology:PF.6/dvr-brauer-residue-sequence` | Planned here at target level. |
| `PAPER-CESNAVICIUS-19/global-residue-exact` | `PurityForFlatCohomology:PF.6/global-brauer-residue-sequence` | Planned here at target level. |
| `PAPER-CESNAVICIUS-19/residue-primary-boundary` | `PurityForFlatCohomology:PF.6/imperfect-residue-exclusion` | Planned here at target level. |
| `PAPER-CESNAVICIUS-19/global-gm-h3` | `PurityForFlatCohomology:PF.6/brauer-purity-regular` | Planned here at target level. |
| `PAPER-CESNAVICIUS-19/codim1-boundary-example` | `PurityForFlatCohomology:PF.6/codimension-one-deletion-example` | Planned here at target level. |
| `PAPER-CESNAVICIUS-19/local-pic-lefschetz` | `PurityForFlatCohomology:PF.5/parafactorial-local-ring` | Owned upstream: DeformationAndDerivedPatchingAlgebra §6.9 (localCI\_parafactorial, SGA 2 XI 3.13(ii)), TauCetiRoadmap pull request #1034; enters as API IsParafactorial.of\_completeIntersection. |
| `PAPER-CESNAVICIUS-19/parafactorial` | `PurityForFlatCohomology:PF.5/parafactorial-local-ring` | Planned here at target level. |
| `PAPER-CESNAVICIUS-19/lefschetz-condition` | None. | Owned upstream as part of the proof route of DeformationAndDerivedPatchingAlgebra §6.9 (localCI\_parafactorial: SGA 2 XI 3.13(ii) with SGA 2 X §2 and XI §§1–3), TauCetiRoadmap pull request #1034; not planned here (upstreamNotes records the inputs that proof needs). |
| `PAPER-CESNAVICIUS-19/effective-lefschetz` | None. | Owned upstream as part of the proof route of DeformationAndDerivedPatchingAlgebra §6.9 (localCI\_parafactorial: SGA 2 XI 3.13(ii) with SGA 2 X §2 and XI §§1–3), TauCetiRoadmap pull request #1034; not planned here (upstreamNotes records the inputs that proof needs). |
| `PAPER-CESNAVICIUS-19/local-lef` | None. | Owned upstream as part of the proof route of DeformationAndDerivedPatchingAlgebra §6.9 (localCI\_parafactorial: SGA 2 XI 3.13(ii) with SGA 2 X §2 and XI §§1–3), TauCetiRoadmap pull request #1034; not planned here (upstreamNotes records the inputs that proof needs). |
| `PAPER-CESNAVICIUS-19/local-leff` | None. | Owned upstream as part of the proof route of DeformationAndDerivedPatchingAlgebra §6.9 (localCI\_parafactorial: SGA 2 XI 3.13(ii) with SGA 2 X §2 and XI §§1–3), TauCetiRoadmap pull request #1034; not planned here (upstreamNotes records the inputs that proof needs). |
| `PAPER-CESNAVICIUS-19/pic-formal-comparison` | None. | Owned upstream as part of the proof route of DeformationAndDerivedPatchingAlgebra §6.9 (localCI\_parafactorial: SGA 2 XI 3.13(ii) with SGA 2 X §2 and XI §§1–3), TauCetiRoadmap pull request #1034; not planned here (upstreamNotes records the inputs that proof needs). |
| `PAPER-CESNAVICIUS-19/parafactorial-descent` | None. | Owned upstream as part of the proof route of DeformationAndDerivedPatchingAlgebra §6.9 (localCI\_parafactorial: SGA 2 XI 3.13(ii) with SGA 2 X §2 and XI §§1–3), TauCetiRoadmap pull request #1034; not planned here (upstreamNotes records the inputs that proof needs). |
| `PAPER-CESNAVICIUS-19/pic-thickening-sequence` | None. | Owned upstream as part of the proof route of DeformationAndDerivedPatchingAlgebra §6.9 (localCI\_parafactorial: SGA 2 XI 3.13(ii) with SGA 2 X §2 and XI §§1–3), TauCetiRoadmap pull request #1034; not planned here (upstreamNotes records the inputs that proof needs). |
| `PAPER-CESNAVICIUS-19/pic-formal-injectivity` | None. | Owned upstream as part of the proof route of DeformationAndDerivedPatchingAlgebra §6.9 (localCI\_parafactorial: SGA 2 XI 3.13(ii) with SGA 2 X §2 and XI §§1–3), TauCetiRoadmap pull request #1034; not planned here (upstreamNotes records the inputs that proof needs). |
| `PAPER-CESNAVICIUS-19/pic-hypersurface-descent` | None. | Owned upstream as part of the proof route of DeformationAndDerivedPatchingAlgebra §6.9 (localCI\_parafactorial: SGA 2 XI 3.13(ii) with SGA 2 X §2 and XI §§1–3), TauCetiRoadmap pull request #1034; not planned here (upstreamNotes records the inputs that proof needs). |

## Ownership adjustments

**PurityForFlatCohomology, EtaleDualityAndPerverseSheaves, LefschetzPencilsAndVanishingCycles.** The PAPER-CESNAVICIUS-SCHOLZE-24 route EtaleDualityAbsolutePurityPartII (pending design DESIGN-EtaleDualityAndPerverseSheavesPartII, issue #3363) and the PAPER-CESNAVICIUS-19 item absolute-purity-input assign Gabber's absolute cohomological purity to a Part II of EtaleDualityAndPerverseSheaves. TauCetiRoadmap now plans it in LefschetzPencilsAndVanishingCycles §0.10 (draft pull request #873, Riou's proof), and EtaleCohomologyFoundations (#938) assigns absolute purity there. The Part II design imports absolute purity (CS24 Theorem 3.1.3 and Remark 3.1.4) from LefschetzPencilsAndVanishingCycles §0.10 instead of planning it, and plans only algebraic tilting of étale cohomology (CS24 Theorem 2.2.7) and the local Lefschetz theorem (CS24 Lemma 3.2.3) with Gabber's affine Lefschetz theorem, dualizing complexes on excellent regular schemes and local duality; this roadmap consumes Lemma 3.2.3 (gap EDP-PII-local-lefschetz).

**PurityForFlatCohomology, DeformationAndDerivedPatchingAlgebra.** The PAPER-CESNAVICIUS-19 route to this roadmap includes eleven SGA 2 X–XI items on Lefschetz conditions and local Picard groups (lefschetz-condition, effective-lefschetz, local-lef, local-leff, pic-formal-comparison, parafactorial-descent, pic-thickening-sequence, pic-formal-injectivity, pic-hypersurface-descent, local-pic-lefschetz, parafactorial). DeformationAndDerivedPatchingAlgebra §6.9 on TauCetiRoadmap (pull request #1034) now states localCI\_parafactorial (SGA 2 XI 3.13(ii)) and proves it by that argument. These items are owned by DeformationAndDerivedPatchingAlgebra §6.9 as the proof route of localCI\_parafactorial; this roadmap keeps only the definition of parafactorial and geometrically parafactorial local rings (PF.5/parafactorial-local-ring) and imports the theorem.

**PurityForFlatCohomology, SchemeAndStackFoundations.** SchemeAndStackFoundations is on TauCetiRoadmap main and does not contain the flat-cohomology results over animated rings of CS24 §§4.1, 5.1–5.7, Gabber–de Jong, the quasi-affine Gabber–de Jong comparison beyond its affine regular dimension ≤ 2 case, groups of multiplicative type over schemes, C19 §§2–4 and Appendix A, or algebraization over punctured spectra; these are the gaps SF-PII-\* of this packet. Its Layer 2 conventions also point absolute purity and Brauer purity to EtaleDualityAndPerverseSheaves, which plans neither. The pending design DESIGN-SchemeAndStackFoundationsPartII (issue #3361) owns the SF-PII gaps with the exact statements recorded here. It imports from this packet the fppf-specific supported-cohomology adapter and local-to-global statement (PF.0/flat-cohomology-with-supports, reusing its existing general derived-support formalism in §2.7) and Grothendieck's torsion results (PF.5/gm-cohomology-torsion, which contains C19 Lemma 3.2) rather than planning them again. Brauer purity is owned here (PF.5, PF.6).

**PurityForFlatCohomology, PerfectoidQuotients.** The route sends CS24 Lemma 3.1.1 (C19 Lemmas 5.1–5.2) and the valuation-ring portion of Proposition 2.1.9 to a pending PerfectoidQuotientsPartII. The two regular tower targets already exist in PerfectoidSpaces P7.16a–P7.17 (PR #818). Q0 already supplies products, completed tensor products, root-stable quotients, completely étale and henselian perfectoids; Q3 supplies André's lemma. PerfectoidQuotientsPartII (#3362) imports the existing PerfectoidSpaces towers and Q0 results. It plans only the remaining integral-valuation, radical/torsion and explicit-tilt refinements in gap PQ-PII-towers. This roadmap uses Q3/andre-flatness-lemma with the SF-PII descent results (CS24 footnote 25), so the ind-syntomic André lemma is not a prerequisite.

### Notes for upstream maintainers

- `tauceti:TauCetiRoadmap/DeformationAndDerivedPatchingAlgebra`: §6.9 localCI\_parafactorial cites SGA 2 XI 3.13(ii). Its proof uses SGA 2 X §2 (the conditions Lef and Leff and Example 2.1), XI 1.1 (the infinitesimal Picard sequence), XI 2.1–2.2, XI 3.6–3.7 (descent of parafactoriality), XI 3.12 and XI 3.16–3.17 (hypersurface descent). Lemma 3.17(e) of the Laszlo edition should read y ∉ Y (PAPER-CESNAVICIUS-19/E4). The PAPER-CESNAVICIUS-19 extraction routed these inputs to the atlas roadmap PurityForFlatCohomology; that roadmap now imports the theorem from §6.9.
- `tauceti:TauCetiRoadmap/SchemeAndStackFoundations`: The Layer 2 conventions say that étale supports, the étale f^!, absolute purity and purity for the Brauer group are EtaleDualityAndPerverseSheaves. EtaleDualityAndPerverseSheaves (#1040) excludes general Gabber absolute purity, EtaleCohomologyFoundations (#938) assigns absolute purity to LefschetzPencilsAndVanishingCycles §0.10, and Brauer purity (Česnavičius 2019; Česnavičius–Scholze 2024) is planned in the atlas roadmap PurityForFlatCohomology. The pointer could be updated.

## References and reading scope

The reading record distinguishes sources directly checked from secondary credits carried through CS24 or C19. A secondary credit is not a claim to have inspected the original proof. Full source files and source passages are not reproduced in this roadmap.

- **`CS24`.** Kęstutis Česnavičius and Peter Scholze, [Purity for flat cohomology](https://arxiv.org/abs/1912.10932v3). arXiv:1912.10932v3 (26 April 2023, final version); Annals of Mathematics 199 (2024), no. 1, 51–180.
  Reading scope: §1.1–1.4, pp. 3–8; Proposition 2.1.9 and proof, pp. 14–15; Lemma 2.2.4 and proof, pp. 19–20; §3 (3.1–3.3), pp. 29–35; §4.1–4.2, pp. 36–45; §5.4–5.5 statements and proofs of Theorems 5.5.1–5.5.2, pp. 68–70; §6, pp. 82–86; §7, pp. 86–93; References, pp. 93–97.
  SHA-256: `2f9d3ee868c244a7ddd6579a5dafed10a7ac9eb8b2ffe840db9f2bc115cd6ed4`.
  Accessed 2026-10-19.
- **`C19`.** Kęstutis Česnavičius, [Purity for the Brauer group](https://arxiv.org/abs/1711.06456v4). arXiv:1711.06456v4 (1 December 2018); Duke Mathematical Journal 168 (2019), no. 8, 1461–1486.
  Reading scope: §1, pp. 1–3; §2, pp. 3–6; §3, pp. 6–7; §5, pp. 11–13; §6, pp. 13–14; Appendix A, p. 15; References, pp. 16–17; §4, pp. 7–11 (alternative perfectoid proof inputs, read for scope comparison, not rebuilt here).
  SHA-256: `a62a12bbe26595aec89d31d24d46774a1ee3eff73c08da0febf5a2b472118709`.
  Accessed 2026-10-19.
- **`SGA2`.** Alexander Grothendieck (augmented edition by Yves Laszlo), [Cohomologie locale des faisceaux cohérents et théorèmes de Lefschetz locaux et globaux (SGA 2)](https://arxiv.org/abs/math/0511279v1). arXiv:math/0511279v1, Documents Mathématiques 4, SMF 2005.
  Reading scope: Exposé X §3, p. 94 (Définitions 3.1–3.2, Théorème 3.4); Exposé XIV §5, pp. 198–200 (Proposition 5.2 to Théorème 5.6); Exposé XI §3, pp. 101–102 (Définitions 3.1–3.2, Lemme 3.6); Exposé XI, Théorème 3.13, p. 105; Exposé XII, Corollaire 3.7, p. 121; Exposé III, Proposition 3.3 and Example 3.4, pp. 27–28 (regular-sequence supported vanishing).
  SHA-256: `41ad02c57321a8d2200ff32a929bc93adbc3de0d59dcd5a284d28d859fb87a90`.
  Accessed 2026-10-19.
- **`EGA44`.** Alexander Grothendieck (with Jean Dieudonné), [Éléments de géométrie algébrique IV. Étude locale des schémas et des morphismes de schémas, quatrième partie](http://www.numdam.org/item/PMIHES_1967__32__5_0/). Publications Mathématiques de l'IHÉS 32 (1967); Numdam copy.
  Reading scope: §21.13, pp. 314–321 (Corollaire 21.13.3 to Remarque 21.13.13).
  SHA-256: `b4277fb99c6edf8feec5b01f54368e4b8521bcd52871316c0edf6ff4ae69389e`.
  Accessed 2026-10-19.
- **`STACKS`.** The Stacks project authors, [The Stacks project](https://stacks.math.columbia.edu). online, tags 07DV, 09Q1, 09Q7, 09ZL, 0DX9, 0DXR, 0EHC and 0EJP read on 2026-10-19.
  Reading scope: Lemma 10.68.9 (07DV); Lemma 23.8.9 (09Q7); Lemma 51.4.3 (0DX9); Lemma 52.11.3 (0DXR); Lemma 52.22.5 (0EJP); Lemma 23.8.3 (09Q1); Situation 52.16.1 (0EHC); Lemma 15.13.2 (09ZL).
  Accessed 2026-10-19.
- **`Poo17`.** Bjorn Poonen, [Rational points on varieties](https://math.mit.edu/~poonen/papers/Qpoints.pdf). Graduate Studies in Mathematics 186, AMS 2017; author's unofficial version of 18 December 2018.
  Reading scope: §6.8, pp. 196–198 (Proposition 6.8.1 to Corollary 6.8.5).
  SHA-256: `42e92ce4599420f6b72139e78cb9f5230e4bf81258c202e7cee4716887353579`.
  Accessed 2026-10-19.
- **`TCR-SSF`.** Tau Ceti contributors, [TauCetiRoadmap SchemeAndStackFoundations README](https://github.com/TauCetiProject/TauCetiRoadmap/blob/f30bfe0a3b9d28515e04a1b779af08792e57ea76/TauCetiRoadmap/SchemeAndStackFoundations/README.md). TauCetiRoadmap main at f30bfe0a3b9d28515e04a1b779af08792e57ea76.
  Reading scope: Scope/ownership; the statements of §§0.3–0.4, 0.6, 0.14, 0.17, 1.15, 1.18, 2.1–2.3, 2.7, 2.9–2.11, 2.15, 2.22, 3.4 used by the import contracts.
  SHA-256: `121062fb15b9c0bd67de1eb3ff53fd370ecaf441cbfa22aefaffb5d53cf0d176`.
  Accessed 2026-10-19.
- **`TCR-DDPA`.** Tau Ceti contributors, [TauCetiRoadmap DeformationAndDerivedPatchingAlgebra README (open pull request #1034)](https://github.com/TauCetiProject/TauCetiRoadmap/blob/e0abc60100ba74746306a44d12ac151d5dc6cc9a/TauCetiRoadmap/DeformationAndDerivedPatchingAlgebra/README.md). head e0abc60100ba74746306a44d12ac151d5dc6cc9a.
  Reading scope: §3.4 Regular-sequence ideals and complete intersections; §6.9 Extending maps from a regular locus (localCI\_parafactorial).
  SHA-256: `17030abf852168609bfcdb086f7f12c300d9bceab8fc0828d9f9fee6c38716e2`.
  Accessed 2026-10-19.
- **`TCR-LPV`.** Tau Ceti contributors, [TauCetiRoadmap LefschetzPencilsAndVanishingCycles README (draft pull request #873)](https://github.com/TauCetiProject/TauCetiRoadmap/blob/4c9b59c5f758c3964ca73ce60826b2c52d5f1f90/TauCetiRoadmap/LefschetzPencilsAndVanishingCycles/README.md). head 4c9b59c5f758c3964ca73ce60826b2c52d5f1f90.
  Reading scope: §0.10 Absolute cohomological purity.
  SHA-256: `660d06b3c35a97d4bd11a687611af378df61591690d607e1cd95f9b55f6b6b6b`.
  Accessed 2026-10-19.
- **`TCR-LocalPurity`.** Tau Ceti contributors, [TauCetiRoadmap LocalPurity README (open pull request #1102)](https://github.com/TauCetiProject/TauCetiRoadmap/blob/6fd7dbe7d6eb7d835483f6ed90fbe305ec65e664/TauCetiRoadmap/LocalPurity/README.md). head 6fd7dbe7d6eb7d835483f6ed90fbe305ec65e664.
  Reading scope: Whole README; in particular §1.1 and §§2.1–2.2.
  SHA-256: `763a91b7c90c4be9907db9a19a560d834bab1afc54712ab09a4f1e94336afd2d`.
  Accessed 2026-10-19.
- **`TCR-PBL`.** Tau Ceti contributors, [TauCetiRoadmap PurityOfBranchLocus README (open pull request #1103)](https://github.com/TauCetiProject/TauCetiRoadmap/blob/8ba23ff82baa03183998c791a4565ff2f6a5fdf8/TauCetiRoadmap/PurityOfBranchLocus/README.md). head 8ba23ff82baa03183998c791a4565ff2f6a5fdf8.
  Reading scope: Summary and §0.3 (auslander\_buchsbaum).
  SHA-256: `3a0ee10dac0facda550a2e0d794278b65790ac48be4cc0df217a13175581c762`.
  Accessed 2026-10-19.
- **`BC22`.** Alexis Bouthier and Kęstutis Česnavičius, [Torsors on loop groups and the Hitchin fibration](https://arxiv.org/abs/1908.07480). Ann. Sci. ÉNS 55 (2022); arXiv:1908.07480.
  Reading scope: Lemma 2.3.2 and proof, p. 27; Theorem 2.3.4 is credited through CS24, not independently verified.
  SHA-256: `ec4b02a2b0821c28646c94699fa4b7eae24c5a07ed48ed1baecf1004934564b7`.
  Accessed 2026-10-19.
- **`ILO14`.** Luc Illusie, Yves Laszlo and Fabrice Orgogozo (eds.), [Travaux de Gabber sur l'uniformisation locale et la cohomologie étale des schémas quasi-excellents](https://arxiv.org/abs/1207.3648v1). Astérisque 363–364 (2014); arXiv:1207.3648.
  Reading scope: Exposé XVIII-A §2.2, Lemma 2.2 and display (2.a), p. 333; other Lefschetz/duality references are credited through CS24.
  SHA-256: `18a6193d6b71ff5ac91eae4443e1c8a54ab8f27f2173fda200d4bec547e3644a`.
  Accessed 2026-10-19.
- **`Gro68`.** Alexander Grothendieck, Le groupe de Brauer I–III. Dix exposés sur la cohomologie des schémas, North-Holland/Masson 1968.
  Reading scope: Not read (no free or cleared copy); Brauer II 1.4 and 1.8, Brauer III 2.1, 6.1 b), 10.1 cited through CS24 pp. 90, 93 and C19 pp. 2, 7, 13–14.
- **`Avr77`.** Luchezar L. Avramov, Homology of local flat extensions and complete intersection defects. Mathematische Annalen 228 (1977), 27–37.
  Reading scope: Not read; Proposition 3.6 cited through CS24 p. 32.
- **`Kat73`.** Nicholas M. Katz, [p-adic properties of modular schemes and modular forms](https://web.math.princeton.edu/~nmk/old/padicpropMFMS.pdf). Modular functions of one variable III, Lecture Notes in Math. 350 (1973), 69–190.
  Reading scope: Proposition 4.1.1 and its proof, pp. 142–145.
  SHA-256: `f9c14dc0c8da65bbe355926d149141b548a03e4016b883c4b800b14150cc2b1a`.
  Accessed 2026-10-19.
- **`Aus62`.** Maurice Auslander, [On the purity of the branch locus](https://www.jstor.org/stable/2372807). American Journal of Mathematics 84 (1962), 116–125.
  Reading scope: Original text not read: public publisher endpoint did not serve it; Theorem 1.3 statement and use verified through CS24 p. 88. Original homological proof recorded as gap AUSLANDER-FREENESS..
- **`MB85`.** Laurent Moret-Bailly, Pinceaux de variétés abéliennes. Astérisque 129 (1985).
  Reading scope: Not read; lemme 2 cited through CS24 p. 87.
- **`Bou78`.** Jean-François Boutot, Schéma de Picard local. Lecture Notes in Math. 632, Springer 1978.
  Reading scope: Not read; IV Lemme 5.1 and V Corollaire 4.9 cited through CS24 p. 90.
- **`CTS87`.** Jean-Louis Colliot-Thélène and Jean-Jacques Sansuc, [Principal homogeneous spaces under flasque tori: applications](https://www.imo.universite-paris-saclay.fr/~jean-louis.colliot-thelene/PHSflasquetori.pdf). Journal of Algebra 106 (1987), 148–205.
  Reading scope: §0.5, p. 155; Definition 1.2, pp. 157–158; Theorem 2.2(ii), pp. 161–163; Lemma 2.4, p. 164.
  SHA-256: `80032e69206caa5d86f01e14891ffc59abd629a0696314ab30d05516eac10b9b`.
  Accessed 2026-10-19.
- **`DF84`.** Frank R. DeMeyer and Timothy J. Ford, On the Brauer group of surfaces. Journal of Algebra 86 (1984), 259–271.
  Reading scope: Not read; Remark 3 cited through C19 p. 1.
- **`Gro66`.** Alexander Grothendieck, [Le groupe de Brauer II: théorie cohomologique](https://www.numdam.org/item/SB_1964-1966__9__287_0/). Séminaire Bourbaki 1965/66, exposé 297, pp. 287–307 (1966); distinguish the later Dix exposés edition.
  Reading scope: §1, Lemma 1.1 through Lemma 1.9, pp. 290–293.
  SHA-256: `90c128c2101bba5cf9699c92ae4da2e72fb4b1a873b1e0b992dc242eba3e4848`.
  Accessed 2026-10-19.
- **`TCR-PerfectoidSpaces`.** Tau Ceti contributors, [TauCetiRoadmap PerfectoidSpaces README, PR #818](https://github.com/TauCetiProject/TauCetiRoadmap/blob/506f5211b5d2e497588b614fcb008f54adfb0688/TauCetiRoadmap/PerfectoidSpaces/README.md). head 506f5211b5d2e497588b614fcb008f54adfb0688.
  Reading scope: §P7.16a including coefficient/regularity contracts; §P7.17 regular-finite-flat-perfectoid-tower.
  SHA-256: `b20fe469db8cc8d35c9e1fdb1f36c021c2fd832d1d9d89af3e75ec6ebbeeecd6`.
  Accessed 2026-10-19.

## Independent review

Accepted by `independent-review-REV-DESIGN-PurityForFlatCohomology` on 2026-10-19. Independent source, pinned-baseline, ownership, supplier, closure, API/test and Lean review of all 57 nodes. Corrections include support continuity/variance, boundary-degree descent, torsion reduction, counterexample degrees, coniveau supports, residue descent and existing tower ownership. Seven stages remain planned and none closed; acceptance verifies the corrected plan, not implementation or completion of the listed supplier gaps. Source findings are version-scoped; C19 E6 is a proof gap. See the independent report for validation and the nodewise ledger. The original Auslander homological proof is explicitly left as an internal proof gap rather than certified from an unread source. See [the review report](../reviews/REV-DESIGN-PurityForFlatCohomology.md) for the complete node ledger and validation.
