# Roadmap: Hilbert modular varieties and Shimura curves, Part II: mod p cohomology of Shimura curves at infinite level and Gelfand–Kirillov dimension

**Summary.** The second part of HilbertModularVarietiesAndShimuraCurves plans the global half of Breuil–Herzig–Hu–Morra–Schraen, Gelfand–Kirillov dimension and mod p cohomology for GL₂ (Invent. Math. 234 (2023)): for a totally real F unramified at p, a quaternion algebra split above p and at at most one infinite place, and a modular r̄ that is generic above p and semisimple of a generic shape at a place v above p of degree f, the r̄-part of the mod p cohomology of Shimura curves at infinite level at v has Gelfand–Kirillov dimension f. It plans the generic global datum, Buzzard–Diamond–Jarvis weights and the Gee–Kisin weight theorem, the Emerton–Gee–Savitt patching functors and the big patched module of Shimura curves, the Gee–Newton noncommutative grade and miracle-flatness results, freeness of patched modules of Serre weights, tame types, projective lifts and the glued lattices of the first-order projective envelope, and the consequences: the GK dimension, the structure of π[𝔪²\_{K₁}], faithful flatness of the patched module, nonzero Banach lifts and, for p inert, big R = big T with flatness of completed cohomology. The local mod p representation theory is imported from ModpRepresentationsOfGL2OverLocalFields, the tame potentially Barsotti–Tate deformation rings from the pending LocalGaloisDeformationRingsPartII design (recorded gaps), and curves, cohomology, patching algebra, deformation rings and completed cohomology from their owners. The quaternionic Shimura varieties with arbitrary split set (Ichino–Prasanna) and the Hilbert–Siegel varieties (Boxer–Calegari–Gee–Pilloni) proposed for this Part II are independent directions and are split off.

This roadmap is the second part of HilbertModularVarietiesAndShimuraCurves (TauCetiRoadmap pull request #1005). It plans §8 of Breuil–Herzig–Hu–Morra–Schraen (BHHMS), Gelfand–Kirillov dimension and mod p cohomology for GL₂, Inventiones Mathematicae 234 (2023); BHHMS locators refer to arXiv:2009.03127v7, the version the authors mark final. EGS15 locators refer to arXiv:1305.1594v3, Gee–Newton (GN22) to arXiv:1609.06965v5, Gee–Kisin (GK14) to arXiv:1208.3179v5 and Dotto–Le (DL21) to arXiv:1909.12219v2. Results are stated in our own words with theorem, section and page numbers. Source findings concern the versions read.

| Layer | Title | Targets |
|---|---|---:|
| GK.0 | The global setting: Serre weights and mod p cohomology of Shimura curves at infinite level | 7 |
| GK.1 | Patching functors and the big patched module | 7 |
| GK.2 | Freeness over supports and noncommutative miracle flatness | 6 |
| GK.3 | Freeness for Serre weights, tame types and projective lifts | 4 |
| GK.4 | Freeness for the glued lattices of the first-order projective envelope | 9 |
| GK.5 | Gelfand–Kirillov dimension, Banach lifts and big R = big T | 7 |

## Scope and ownership

The owned targets are BHHMS §8: the generic global datum, the Buzzard–Diamond–Jarvis weight sets for unramified local fields, the quaternionic spaces of mod p forms with their residual eigenspaces, the representation π of GL₂(F\_v) at infinite level, the Gee–Kisin weight theorem in BHHMS's normalisation, the doubling at the auxiliary place w₁, the patched ring and its type quotients, fixed-determinant patching functors, the Shimura-curve patching functor at v and its fibres, the big patched module, the Gee–Newton results on grades, Cohen–Macaulay transfer and miracle flatness over Iwasawa algebras with power-series coefficients, the freeness theorems of BHHMS §§8.2–8.3, and the global theorems of §§8.4–8.5 (Theorems 1.1, 1.2, 1.3, 1.9 and 1.10 of the introduction).

Imported, never planned here: the local mod p representation theory of GL₂(O\_{F\_v}) and GL₂(F\_v) used by BHHMS §§2, 5–7 (Serre-weight combinatorics, Diamond modules D₀ and D₁, Gelfand–Kirillov dimension and the local bound of Theorem 6.4.7, first-order injective and projective envelopes, the lattice R and relative projectivity), all owned by ModpRepresentationsOfGL2OverLocalFields MP.3–MP.9; Shimura curves, definite quaternionic forms, their cohomology, Hecke operators, degeneracy maps and non-Eisenstein control, owned by the parent HilbertModularVarietiesAndShimuraCurves R18.1–R18.4; local and global deformation rings and Taylor–Wiles data (LocalGaloisDeformationRings, GlobalGaloisDeformations); patching algebra and commutative algebra (DeformationAndDerivedPatchingAlgebra); completed cohomology, completed Hecke algebras and Auslander regularity of Iwasawa algebras (CompletedCohomologyPartII); the patched weight filtration (GL2ModularityLifting R32.2); potential diagonalisability (PotentialAutomorphyInfrastructurePartII PL.1); and Schikhof duality (LocallyAnalyticDistributionsPartII ND.6).

The tame potentially Barsotti–Tate deformation rings of BHHMS §4 and the tame types of BHHMS §2 belong to the first route of the pending design LocalGaloisDeformationRingsPartII (issue #3432); they are recorded gaps here, with exact statements. The Breuil–Mézard input of the Gee–Kisin weight theorem has no owner yet; it is a recorded gap with a restructuring proposal.

The brief also proposed two other continuations of the parent: quaternionic Shimura varieties with an arbitrary split set (Ichino–Prasanna) and Hilbert–Siegel varieties for Res\_{F/ℚ}GSp₄ (Boxer–Calegari–Gee–Pilloni). They are independent of this route and are split into their own roadmaps (see Restructuring).

## Conventions

- p is a prime, F a totally real field unramified at p, S\_p its set of places above p, v ∈ S\_p the distinguished place and f = [F\_v : ℚ\_p]; K = GL₂(O\_{F\_v}), K₁ = 1 + pM₂(O\_{F\_v}), Z₁ the centre of K₁, I and I₁ the Iwahori and pro-p Iwahori subgroups; k the residue field of F\_v.
- 𝔽 is a sufficiently large finite field of characteristic p and O = W(𝔽), E = O[1/p]; Pontryagin duality (−)^∨ = Hom^{cont}(−, E/O) and Schikhof duality are those of CompletedCohomologyPartII CC.3.
- Hodge–Tate weights are normalised so that the cyclotomic character ε has weight 1 at every embedding; Frobenius elements are geometric; the Artin map sends uniformizers to geometric Frobenius elements; ω, ω\_f, ω\_{2f} are the mod p cyclotomic and fundamental characters.
- Following BHHMS, the patched rings are rings for r̄\_v^∨, the modular weights at a place w above p are W(r̄\_w^∨), and the adelic centre acts on spaces of forms through ψ^{−1}, ψ the Teichmüller lift of ω·det r̄.
- A module M over a commutative ring A is free of rank r over its scheme-theoretic support if M ≅ (A/Ann\_A(M))^r. Maximal Cohen–Macaulay means depth equal to the dimension of the ring over which it is taken (DeformationAndDerivedPatchingAlgebra R03.3).
- dim\_{GL₂(F\_v)}(π) is the Gelfand–Kirillov dimension of ModpRepresentationsOfGL2OverLocalFields MP.4: 3f minus the grade of π^∨ over 𝔽⟦K₁/Z₁⟧.
- Names of suggested declarations live in the namespace TauCetiRoadmap.HilbertModularVarietiesAndShimuraCurvesPartII.

## Exact supplier contracts

### Pinned libraries

Mathlib 082e2d3 and Tau Ceti f790474. The independent review read all 18 declarations and their surrounding hypotheses in the source modules at the pinned commit; an index lookup alone was not used as verification.

| Declaration | Module | Provides |
|---|---|---|
| `CategoryTheory.Abelian.Ext` | `Mathlib/Algebra/Homology/DerivedCategory/Ext/Basic.lean` | Ext groups in an abelian category, for grades and depths of modules. |
| `IsLocalRing` | `Mathlib/RingTheory/LocalRing/Defs.lean` | Local rings: the patched rings, deformation rings and supports. |
| `IsNoetherianRing` | `Mathlib/RingTheory/Noetherian/Defs.lean` | Noetherian rings, hypothesis of the fibre-product freeness lemma. |
| `IsRegularLocalRing` | `Mathlib/RingTheory/RegularLocalRing/Defs.lean` | Regular local rings, for the power-series cancellation in the regular case and for freeness of maximal Cohen–Macaulay modules. |
| `LinearMap.ker` | `Mathlib/Algebra/Module/Submodule/Ker.lean` | Kernels, used to define fibre products of modules as the equaliser of two maps from the product. |
| `Matrix.GeneralLinearGroup` | `Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean` | GL₂ over a ring, for Galois representations and level groups. |
| `Module.FaithfullyFlat` | `Mathlib/RingTheory/Flat/FaithfullyFlat/Basic.lean` | Faithful flatness, the conclusion of the big R = big T theorem. |
| `Module.Finite` | `Mathlib/RingTheory/Finiteness/Defs.lean` | Finitely generated modules, hypothesis of the freeness lemmas. |
| `Module.Flat` | `Mathlib/RingTheory/Flat/Basic.lean` | Flatness, the conclusion of miracle flatness. |
| `Module.Free` | `Mathlib/LinearAlgebra/FreeModule/Basic.lean` | Free modules; freeness over scheme-theoretic supports. |
| `Module.annihilator` | `Mathlib/RingTheory/Ideal/Maps.lean` | Annihilator ideals; the scheme-theoretic support A/Ann\_A(M). |
| `Module.support` | `Mathlib/RingTheory/Support.lean` | Support of a module, for the support conditions of patching functors. |
| `MvPowerSeries` | `Mathlib/RingTheory/MvPowerSeries/Basic.lean` | Multivariable power series rings, the shape of R∞ and S∞. |
| `Nat.Prime` | `Mathlib/Data/Nat/Prime/Defs.lean` | Primality of p in the generic global datum. |
| `PowerSeries` | `Mathlib/RingTheory/PowerSeries/Basic.lean` | One-variable power series rings, for the cancellation lemma. |
| `Representation` | `Mathlib/RepresentationTheory/Basic.lean` | Group representations, for Serre weights and K-representations. |
| `Submodule.spanFinrank` | `Mathlib/Algebra/Module/SpanRank.lean` | Minimal number of generators for finitely generated modules; the definition uses toNat, so its natural-number value must not be interpreted this way without finiteness. |
| `WittVector` | `Mathlib/RingTheory/WittVector/Defs.lean` | Witt vectors W(𝔽), the coefficient ring O = W(𝔽). |

### Atlas suppliers

Every cited node of another roadmap has an accepted review. Each line gives the supplier node and the targets here that use it.

**AutomorphicGaloisRepresentations**

- `R19.4/hecke-versus-langlands-normalization-and-local-global-compatibility` (Local-global compatibility away from p, in the Hecke normalization, with its exact relation to Langlands): used by [0.7](#gk0-ihara-at-auxiliary-place).

**CompletedCohomologyPartII**

- `CC.1/fixed-exponent-smooth-colimit` (Fixed-exponent cohomology): used by [0.5](#gk0-infinite-level-representation).
- `CC.1/full-local-group-smooth-action` (Smooth local-group action): used by [0.5](#gk0-infinite-level-representation).
- `CC.1/tame-hecke-on-colimits` (Tame Hecke on smooth colimits): used by [0.5](#gk0-infinite-level-representation).
- `CC.3/continuous-dual-conventions` (Continuous tower duals): used by [1.7](#gk1-big-patched-module), [5.4](#gk5-banach-lifts), [5.6](#gk5-completed-cohomology-and-big-hecke).
- `CC.5/codimension-iwasawa-dimension-and-the-torsion-theorem` (Iwasawa dimension interface): used by [2.1](#gk2-iwasawa-cohen-macaulay), [2.4](#gk2-iwasawa-grade-and-power-series).
- `CC.8/arithmetic-tower-realisation` (Arithmetic tower realisation comparisons): used by [0.5](#gk0-infinite-level-representation).
- `CC.8/completed-hecke-algebra` (Completed derived Hecke algebra): used by [5.6](#gk5-completed-cohomology-and-big-hecke).
- `CC.8/completed-residual-localisation` (Residual localisation of the completed tower): used by [5.6](#gk5-completed-cohomology-and-big-hecke).

**DeformationAndDerivedPatchingAlgebra**

- `R03.1/cohen-series-presentation` (Cohen power-series presentations): used by [1.1](#gk1-power-series-cancellation).
- `R03.3/auslander-buchsbaum` (Auslander–Buchsbaum formula): used by [1.4](#gk1-fixed-determinant-patching-functor), [3.3](#gk3-locally-algebraic-lattices).
- `R03.3/cohen-macaulay-and-full-support` (CM, maximal CM and full support): used by [1.4](#gk1-fixed-determinant-patching-functor), [2.1](#gk2-iwasawa-cohen-macaulay), [3.1](#gk3-patched-maximal-cohen-macaulay).
- `R03.3/complete-intersections` (Local complete intersections): used by [5.7](#gk5-big-r-equals-big-t).
- `R03.3/degree-indexed-multiplicity` (Dimension-normalized multiplicity): used by [0.6](#gk0-bdj-weight-theorem).
- `R03.3/depth-lemma-and-associated-primes` (Depth lemma and CM associated primes): used by [3.1](#gk3-patched-maximal-cohen-macaulay).
- `R03.3/free-of-maximal-depth-regular-local` (Maximal-depth modules over a regular local ring are free): used by [1.4](#gk1-fixed-determinant-patching-functor), [3.2](#gk3-weight-and-type-freeness).
- `R03.3/regular-local-domain` (Regular local rings are domains): used by [1.1](#gk1-power-series-cancellation).
- `R03.5/free-module-patching` (Free-module patching): used by [1.5](#gk1-shimura-curve-patching-functor).
- `R03.5/patched-module` (The patched module from a limit presentation): used by [0.6](#gk0-bdj-weight-theorem), [1.5](#gk1-shimura-curve-patching-functor), [1.7](#gk1-big-patched-module).
- `R03.5/patched-ring-action` (Continuous action on the patched module): used by [0.6](#gk0-bdj-weight-theorem), [1.5](#gk1-shimura-curve-patching-functor).
- `R03.5/patching-extraction` (Simultaneous finite-data extraction): used by [1.5](#gk1-shimura-curve-patching-functor).
- `R03.5/projectivity-by-derived-coinvariants` (Projectivity tested by derived coinvariants): used by [1.7](#gk1-big-patched-module).
- `R03.6/supported-on-components` (Modules supported on a union of irreducible components): used by [3.3](#gk3-locally-algebraic-lattices).

**FiniteFlatGroupsAndIntegralPadicHodgeTheory**

- `R07.5/serre-weights-compact-induction` (Serre weights of GL₂(F) and their compact inductions): used by [0.2](#gk0-bdj-weight-set).
- `R07.5/tame-inertia-characters` (Tame inertia and its fundamental characters): used by [0.1](#gk0-generic-global-datum), [0.2](#gk0-bdj-weight-set).

**GlobalGaloisDeformations**

- `R04.1/fixed-determinant-functors` (Lifts and deformations with fixed determinant): used by [5.6](#gk5-completed-cohomology-and-big-hecke).
- `R04.3/global-framed-ring` (Representability of global deformations of type 𝒮): used by [0.3](#gk0-residual-eigenspaces), [5.6](#gk5-completed-cohomology-and-big-hecke).
- `R04.3/local-to-global-presentation` (Presentation of the global ring over the local rings): used by [1.2](#gk1-patched-deformation-ring).
- `R04.5/odd-taylor-wiles-primes` (Existence of Taylor–Wiles primes for odd p): used by [1.5](#gk1-shimura-curve-patching-functor).
- `R04.5/taylor-wiles-datum` (Taylor–Wiles data): used by [1.5](#gk1-shimura-curve-patching-functor).
- `R04.5/taylor-wiles-generator-count` (Generator counts at Taylor–Wiles levels): used by [1.2](#gk1-patched-deformation-ring), [1.5](#gk1-shimura-curve-patching-functor).

**HilbertModularVarietiesAndShimuraCurves**

- `R18.1/canonical-quaternionic-curve` (Canonical quaternionic curve and uniformization): used by [0.1](#gk0-generic-global-datum), [0.3](#gk0-residual-eigenspaces).
- `R18.1/quaternionic-datum` (One-real-split quaternionic datum): used by [0.1](#gk0-generic-global-datum).
- `R18.1/quaternionic-effective-stabilizers` (Quaternionic central kernel and small levels): used by [0.3](#gk0-residual-eigenspaces), [0.4](#gk0-non-eisenstein-freeness).
- `R18.3/definite-class-set` (Definite quaternionic class set): used by [0.1](#gk0-generic-global-datum), [0.3](#gk0-residual-eigenspaces), [0.4](#gk0-non-eisenstein-freeness).
- `R18.3/definite-degeneracy` (Definite Ihara degeneracy map): used by [0.7](#gk0-ihara-at-auxiliary-place).
- `R18.3/definite-specialisation` (Fixed-central-character algebraic forms): used by [0.3](#gk0-residual-eigenspaces).
- `R18.3/residual-hecke-ideal` (Residual quaternionic Hecke ideal): used by [0.3](#gk0-residual-eigenspaces).
- `R18.3/tw-freeness` (Integral diamond freeness): used by [0.4](#gk0-non-eisenstein-freeness), [1.5](#gk1-shimura-curve-patching-functor).
- `R18.4/central-character-exactness` (Exact central-character localization): used by [0.3](#gk0-residual-eigenspaces), [1.5](#gk1-shimura-curve-patching-functor).
- `R18.4/cohomological-degeneracy` (Cohomological degeneracy maps): used by [0.7](#gk0-ihara-at-auxiliary-place).
- `R18.4/cohomological-eigenspaces` (Cohomological automorphic eigenspaces): used by [0.7](#gk0-ihara-at-auxiliary-place).
- `R18.4/degeneracy-gram` (GL2 degeneracy Gram operator): used by [0.7](#gk0-ihara-at-auxiliary-place).
- `R18.4/early-quaternionic-galois-hecke-support` (Early finite-level quaternionic Galois–Hecke realization): used by [0.3](#gk0-residual-eigenspaces), [5.6](#gk5-completed-cohomology-and-big-hecke).
- `R18.4/finite-cohomology` (Quaternionic finite-level cohomology): used by [0.3](#gk0-residual-eigenspaces), [0.4](#gk0-non-eisenstein-freeness), [5.6](#gk5-completed-cohomology-and-big-hecke).
- `R18.4/finite-level-descent` (Finite-level invariants and trace control): used by [0.4](#gk0-non-eisenstein-freeness).
- `R18.4/geometric-gram-identity` (Geometric degeneracy Gram identity): used by [0.7](#gk0-ihara-at-auxiliary-place).
- `R18.4/non-eisenstein-integral-control` (Non-Eisenstein integral cohomology control): used by [0.7](#gk0-ihara-at-auxiliary-place), [1.6](#gk1-patched-fibre-identity).
- `R18.4/oldspace-splitting` (Unit-discriminant oldspace splitting): used by [0.7](#gk0-ihara-at-auxiliary-place).
- `R18.4/quaternion-local-systems` (Quaternionic algebraic local systems): used by [0.3](#gk0-residual-eigenspaces).
- `R18.4/quaternionic-jacquet-langlands-bridge` (Early quaternionic Jacquet–Langlands bridge): used by [0.7](#gk0-ihara-at-auxiliary-place).
- `R18.4/residual-eisenstein-vanishing` (Residual Eisenstein vanishing): used by [0.3](#gk0-residual-eigenspaces), [0.4](#gk0-non-eisenstein-freeness).

**LocalGaloisDeformationRings**

- `R08.1/local-fixed-determinant` (Fixing the determinant of local lifts): used by [1.2](#gk1-patched-deformation-ring).
- `R08.1/local-lifting-ring` (The local framed deformation ring): used by [0.1](#gk0-generic-global-datum), [1.2](#gk1-patched-deformation-ring).
- `R08.1/local-tangent-obstruction` (Tangent and obstruction description of local lifting rings): used by [1.2](#gk1-patched-deformation-ring).
- `R08.3/hodge-and-galois-types` (p-adic Hodge types and Galois types): used by [0.2](#gk0-bdj-weight-set), [1.3](#gk1-type-quotients).
- `R08.3/pcris-generic-smooth` (Potentially crystalline rings are generically smooth): used by [1.3](#gk1-type-quotients), [3.3](#gk3-locally-algebraic-lattices).
- `R08.3/pst-deformation-ring` (Potentially semistable deformation rings of fixed type): used by [0.2](#gk0-bdj-weight-set), [0.6](#gk0-bdj-weight-theorem), [1.3](#gk1-type-quotients), [3.3](#gk3-locally-algebraic-lattices).

**LocallyAnalyticDistributionsPartII**

- `ND.6/banach-iwasawa-duality` (Admissible Banach representations and finitely generated Iwasawa modules): used by [5.4](#gk5-banach-lifts).

**ModpRepresentationsOfGL2OverLocalFields**

- `MP.3/diamond-socle` (The finite Diamond socle modules): used by [3.4](#gk3-projective-lift-freeness), [4.7](#gk4-generation-transfer), [5.1](#gk5-patched-gk-dimension).
- `MP.3/tame-weight-set` (Tame Galois weights): used by [0.1](#gk0-generic-global-datum), [0.2](#gk0-bdj-weight-set), [4.1](#gk4-glued-lattices), [4.2](#gk4-loewy-length-three), [4.4](#gk4-adjoint-type-lattices).
- `MP.4/dimension-comparisons` (Quotient and central-regular-sequence dimension comparison): used by [5.1](#gk5-patched-gk-dimension), [5.5](#gk5-shimura-curve-gk-dimension).
- `MP.4/gk-dimension` (Gelfand–Kirillov dimension of an admissible representation): used by [2.4](#gk2-iwasawa-grade-and-power-series), [5.1](#gk5-patched-gk-dimension), [5.5](#gk5-shimura-curve-gk-dimension).
- `MP.5/finite-weight-hulls` (Finite principal series and finite injective hulls): used by [3.2](#gk3-weight-and-type-freeness), [4.2](#gk4-loewy-length-three).
- `MP.5/first-order-weight-hulls` (First-order Serre-weight hulls): used by [4.2](#gk4-loewy-length-three), [4.6](#gk4-comparison-lattice-truncation), [5.2](#gk5-second-congruence-invariants).
- `MP.5/projective-adjoint` (Adjoint tensor and finite projective weight structure): used by [3.4](#gk3-projective-lift-freeness), [4.1](#gk4-glued-lattices).
- `MP.6/adjoint-tensor` (Tensoring Diamond boxes by an adjoint factor): used by [4.4](#gk4-adjoint-type-lattices), [4.6](#gk4-comparison-lattice-truncation).
- `MP.6/diamond-box` (The modules D\_{lambda,epsilon}): used by [4.4](#gk4-adjoint-type-lattices).
- `MP.6/socle-enlargement` (Multiplicity-preserving enlargement of a tame socle): used by [5.2](#gk5-second-congruence-invariants).
- `MP.7/connected-characters` (Connected semisimple Iwahori character sets): used by [5.1](#gk5-patched-gk-dimension).
- `MP.7/diamond-connected` (Connectedness of tame Diamond invariants): used by [5.1](#gk5-patched-gk-dimension).
- `MP.7/local-gk-bound` (The local Gelfand–Kirillov bound): used by [5.1](#gk5-patched-gk-dimension).
- `MP.8/lattice-coinvariants` (Coinvariants and reduction of the glued lattice): used by [4.1](#gk4-glued-lattices).
- `MP.8/projective-lattice` (The projective-cover fibre-product lattice): used by [3.4](#gk3-projective-lift-freeness), [4.1](#gk4-glued-lattices).
- `MP.8/projective-truncation` (The first radical truncation of a projective cover): used by [4.3](#gk4-adjoint-lattice-generation), [4.7](#gk4-generation-transfer), [4.9](#gk4-second-truncation-multiplicity).
- `MP.9/relative-projectivity` (Relative projectivity of all quotients): used by [4.3](#gk4-adjoint-lattice-generation), [4.7](#gk4-generation-transfer).

**PotentialAutomorphyInfrastructurePartII**

- `PL.1/potentially-barsotti-tate-diagonalizable` (Two-dimensional potentially Barsotti–Tate representations are potentially diagonalizable): used by [0.6](#gk0-bdj-weight-theorem).

### Requests

- `PadicMeasuresIwasawaAlgebras:L1`: Imported, no new content: completed group algebras O⟦K⟧ and k⟦K⟧ of compact p-adic analytic groups with their compact module categories (TauCetiRoadmap PadicMeasuresIwasawaAlgebras, merged; the current Tau Ceti library has \`completedGroupAlgebra\`, which is not at the pinned commit f790474). Needed by [2.1](#gk2-iwasawa-cohen-macaulay).
- `HilbertModularVarietiesAndShimuraCurves:R18.3`: Extension request for the definite case only: the parent plans definite class sets, fixed-central-character forms (R18.3/definite-class-set, R18.3/definite-specialisation) and Taylor–Wiles freeness (R18.3/tw-freeness) in the Khare–Wintenberger setting (F of even degree, D unramified at finite places). BHHMS's definite case needs them for a totally definite D with arbitrary finite ramification set S\_D ([F:ℚ] + |S\_D| even), at levels with V\_{w₁} unipotent upper triangular modulo w₁, with the adelic centre acting through ψ^{−1}. The indefinite case, which is the main theorem, uses R18.1 and R18.4 and is not affected. Needed by [0.3](#gk0-residual-eigenspaces), [0.4](#gk0-non-eisenstein-freeness).
- `SmoothRepresentationsOfLocalGroups:SR.0`: Imported, no new content: smooth representations of GL₂(F\_v) over 𝔽, admissibility, central characters and the smooth dual (TauCetiRoadmap SmoothRepresentationsOfLocalGroups, Layer 0). Needed by [0.5](#gk0-infinite-level-representation).

### Recorded gaps

**Tame inertial types over unramified F\_v: K-types, constituents and lattices** (`gap/tame-types`). Needed for K = GL₂(O\_{F\_v}), F\_v/ℚ\_p unramified, and for the places w ∈ S\_p ∖ {v}: (1) the tame inertial local Langlands correspondence τ ↦ σ(τ) (Henniart's appendix to Breuil–Mézard, normalised as in BM02 §2.1.1; BHHMS §2.2), and that every irreducible tame non-Steinberg smooth K-representation lies in its image (BHHMS Remark 8.2.5, citing BM02 Theorem 2.1.1.4 and Emerton–Gee–Herzig Proposition 2.4.1); (2) the tame types τ(s, μ) and the Jordan–Hölder constituents of σ(τ) as a Diamond-box set JH(D\_{μ,ε}) (BHHMS Definition 2.3.1, Proposition 2.4.3, Lemma 2.4.4; MP.3 supplies the parametrisation of weights but not σ(τ)); (3) for generic ρ̄, a type τ with JH(σ(τ)) ∩ W(ρ̄) a single weight and, for ρ̄ semisimple, the unique type τ₀ with W(ρ̄) = JH(σ(τ₀)) (EGS15 Propositions 3.5.1–3.5.2); (4) the K-stable lattices σ\_J°(τ) with irreducible cosocle, the capped intervals and the ideals I\_𝒥 (EGS15 §5.1, Definition 10.1.4, Proposition 10.1.11); and the identification τ₀ ↔ the label (2, …, 2) of BHHMS Lemma 4.1.2. Owner: the pending design DESIGN-LocalGaloisDeformationRingsPartII (issue #3432), whose first route LocalGaloisDeformationRingsPartIITamePotentiallyBarsottiTate lists PAPER-BREUIL-ETAL-23/tame-type-tau, jh-factors-type, serre-weights-tame, n-generic-type and n-generic-rhobar. Needed by [1.5](#gk1-shimura-curve-patching-functor), [3.2](#gk3-weight-and-type-freeness), [3.3](#gk3-locally-algebraic-lattices), [3.4](#gk3-projective-lift-freeness), [4.1](#gk4-glued-lattices), [4.4](#gk4-adjoint-type-lattices).

**Tame potentially Barsotti–Tate and (2,−1)\_j deformation rings of a single type** (`gap/single-type-rings`). For generic ρ̄ : G\_K → GL₂(𝔽), K/ℚ\_p unramified of degree f, and a tame type τ: (1) EGS15 Theorem 7.2.1: the fixed-determinant potentially Barsotti–Tate ring R^{(1,0),τ,ψ} is a power series ring over W(𝔽) in 3 + f variables when the type isolates one predicted weight (the types of (62)); it is regular when JH(σ(τ)) ∩ W(ρ̄) has at most two elements, with special fibre the reduced union of the weight loci; (2) BHHMS Proposition 4.2.1: for ρ̄ as in BHHMS §4.1 and λ\_j ∈ {(1,0), (2,−1)} (after twisting, (2,1), (3,0)) the rings R^{λ,τ} are domains; (3) BHHMS Corollary 4.2.6: the special fibre of R^{(2,−1)\_j,τ} is reduced. With GK14 Remark 5.2.2 for fixed versus unfixed determinants. Owner: the pending design DESIGN-LocalGaloisDeformationRingsPartII (issue #3432), route LocalGaloisDeformationRingsPartIITamePotentiallyBarsottiTate, items PAPER-BREUIL-ETAL-23/def-rings, def-ring-single, special-fibre-reduced and the Kisin-module items kisin-matrices to theta-bijection on which they rest. Needed by [1.2](#gk1-patched-deformation-ring), [1.3](#gk1-type-quotients), [3.2](#gk3-weight-and-type-freeness), [3.4](#gk3-projective-lift-freeness), [4.4](#gk4-adjoint-type-lattices), [4.5](#gk4-adjoint-lattice-freeness), [4.8](#gk4-glued-lattice-freeness).

**The multi-type deformation ring R^{≤(3,0),σ\_v} and the membership of p** (`gap/multi-type-ring`). For a generic residual representation ρ̄ and a modular indexing weight σ as in BHHMS §4.3: Proposition 4.3.1, pp. 34–35, gives the stabilised presentation R\_{ρ̄}^{≤(3,0),σ}⟦X₁, …, X\_{2f}⟧ ≅ S⟦Y₁, …, Y₄⟧, with S = (⊗̂\_j S^{(j)})/J explicit. The relevant types satisfy σ ⊗ (N\_{k/𝔽\_p} ∘ det^{−1}) ∈ JH(σ(τ)); their labels k ∈ {1,2}^f give the prime ideals p\_k^λ (with the embedding reversal of Proposition 4.3.1 included in the labelling). After the relabelling 3 → 1 used in §8.3, Lemma 4.3.2, p. 39, gives q\_1^{(j),(2,1)}, q\_2^{(j),(2,1)}, and Proposition 4.3.3, pp. 39–40, gives p ∈ q\_1^{(j),(2,1)} ∩ q\_2^{(j),(2,1)} + p\_2^{(j),(3,0)}. For the patched ring, increasing q and applying Hamann cancellation gives a presentation S⟦X₁, …, X\_h⟧ with h ≥ 1; no unstabilised presentation of the bare local ring is asserted. Apply the residual and weight twists as in Theorem 8.3.9, pp. 101–102. Owner: the pending design DESIGN-LocalGaloisDeformationRingsPartII (issue #3432), route LocalGaloisDeformationRingsPartIITamePotentiallyBarsottiTate, items PAPER-BREUIL-ETAL-23/def-ring-multi, q-ideals and p-membership-multi. Needed by [4.8](#gk4-glued-lattice-freeness).

**Breuil–Mézard for potentially Barsotti–Tate representations (Gee–Kisin Theorem A)** (`gap/breuil-mezard-pbt`). Gee–Kisin, Forum Math. Pi 2 (2014), Theorem A: for K/ℚ\_p finite, p > 2 and r̄ : G\_K → GL₂(𝔽), the Hilbert–Samuel multiplicities of the potentially Barsotti–Tate lifting rings satisfy e(R^{□,0,τ}/π) = Σ\_σ n\_{0,τ}(σ)μ\_σ(r̄) with μ\_σ(r̄) ≠ 0 exactly for the predicted weights; Corollary 5.4.5 (nonvanishing of patched weight modules exactly for the Breuil–Mézard weights) and the support of patched modules of Serre weights on the crystalline weight loci (cited by EGS15 §6.4 as Corollaries 5.6.4 and 4.5.7 of the 2012 version; arXiv v5 has §§4.5 and 5.4 for these); and the identification of W^{BT} with the Buzzard–Diamond–Jarvis set for K unramified (Gee–Liu–Savitt). No atlas roadmap plans these: PadicLocalLanglandsForGL2Qp R30.5–R30.6 own the Breuil–Mézard conjecture over ℚ\_p only. A home is proposed in \`restructure\` (a Part II of LocalGaloisDeformationRings or a paper route for Gee–Kisin). Needed by [0.6](#gk0-bdj-weight-theorem), [1.5](#gk1-shimura-curve-patching-functor).

## Targets, APIs and checks

Each target gives its statement, hypotheses, proof outline, sources and dependencies; definitions and constructions also give their uses, API and unit tests (Checks). Planets are the targets the atlas shows on the layer.

<a id="layer-gk0"></a>

## Layer GK.0: The global setting: Serre weights and mod p cohomology of Shimura curves at infinite level

Fix the generic global datum of Breuil–Herzig–Hu–Morra–Schraen §8.1: F totally real unramified at p, a quaternion algebra D split above p and at no more than one infinite place, r̄ : G\_F → GL₂(𝔽) absolutely irreducible on G\_{F(ζ\_p)}, generic above p, semisimple at the distinguished place v with the exponent bounds 12 ≤ r\_i ≤ p − 15 (resp. 13 ≤ r\_0 ≤ p − 14), formally smooth local rings at the bad places away from p, the auxiliary place w₁ and the level U. Define the Buzzard–Diamond–Jarvis weight sets W(ρ) for K/ℚ\_p unramified (agreeing with ModpRepresentationsOfGL2OverLocalFields MP.3 in the tame case), the twisted quaternionic spaces of forms S(σ) with the residual ideal 𝔪 and the modules M(σ) (EGS15 §6.2 with BHHMS Remark 8.1.3), and the admissible smooth representation π of GL₂(F\_v): the colimit over levels at v of the r̄-part of H¹ of Shimura curves (or of the 𝔪-torsion of definite forms), weighted by Serre weights at the other places above p. Prove the weight part of Serre's conjecture in this setting (Gee–Kisin Corollary 5.5.4, with W(r̄\_w^∨)) and the doubling at w₁ (the easy Ihara lemma). Import the curves, local systems, finite-level cohomology and Hecke theory from HilbertModularVarietiesAndShimuraCurves R18.1–R18.4.

*Layer dependencies:* `AutomorphicGaloisRepresentations:R19.4`, `CompletedCohomologyPartII:CC.1`, `CompletedCohomologyPartII:CC.8`, `DeformationAndDerivedPatchingAlgebra:R03.3`, `DeformationAndDerivedPatchingAlgebra:R03.5`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.5`, `GlobalGaloisDeformations:R04.3`, `HilbertModularVarietiesAndShimuraCurves:R18.1`, `HilbertModularVarietiesAndShimuraCurves:R18.3`, `HilbertModularVarietiesAndShimuraCurves:R18.4`, `LocalGaloisDeformationRings:R08.1`, `LocalGaloisDeformationRings:R08.3`, `ModpRepresentationsOfGL2OverLocalFields:MP.3`, `PotentialAutomorphyInfrastructurePartII:PL.1`, `SmoothRepresentationsOfLocalGroups:SR.0`.

<a id="gk0-generic-global-datum"></a>

### 0.1 The generic global datum of Breuil–Herzig–Hu–Morra–Schraen

**Definition** (`GK.0/generic-global-datum`). Planet: *Generic global datum*. A generic global datum consists of: a prime p > 5; a totally real field F unramified at every place of the set S\_p of places above p; a quaternion algebra D with centre F, split at every place of S\_p and at no more than one infinite place (the indefinite case when it is split at exactly one, the definite case when at none), with (F, D) ≠ (ℚ, M₂(ℚ)) in the indefinite case, S\_D its set of finite ramified places, a maximal order O\_D and fixed isomorphisms (O\_D)\_w ≅ M₂(O\_{F\_w}) for w ∉ S\_D; a finite field 𝔽 of characteristic p, large enough, with O = W(𝔽); a continuous r̄ : G\_F → GL₂(𝔽) such that r̄|G\_{F(ζ\_p)} is absolutely irreducible, r̄\_w = r̄|G\_{F\_w} is generic (EGS15 Definition 2.1.1) for every w ∈ S\_p, and the framed deformation ring of r̄\_w over W(𝔽) is formally smooth for every w ∈ (S\_D ∪ S\_r) ∖ S\_p, where S\_r is the set of places at which r̄ ramifies (S\_p ⊆ S\_r by genericity); the character ψ : G\_F → W(𝔽)^× that is the Teichmüller lift of ω·det r̄, ω the mod p cyclotomic character; a distinguished place v ∈ S\_p, f = [F\_v : ℚ\_p], such that r̄\_v is semisimple and, up to twist, r̄\_v|I\_{F\_v} ≅ ω\_f^{Σ\_i p^i(r\_i+1)} ⊕ 1 with 12 ≤ r\_i ≤ p − 15 for all i, or r̄\_v|I\_{F\_v} ≅ ω\_{2f}^{Σ\_i p^i(r\_i+1)} ⊕ ω\_{2f}^{p^f Σ\_i p^i(r\_i+1)} with 13 ≤ r\_0 ≤ p − 14 and 12 ≤ r\_i ≤ p − 15 for 0 < i < f; an auxiliary finite place w₁ ∉ S\_D ∪ S\_r with Norm(w₁) ≢ 1 mod p, with the ratio of the eigenvalues of r̄(Frob\_{w₁}) outside {1, Norm(w₁), Norm(w₁)^{−1}}, and with w₁ dividing no ζ + ζ^{−1} − 2 for ζ a nontrivial root of unity in a quadratic extension of F; a finite set S of finite places containing S\_D ∪ S\_r and not w₁, with the framed deformation ring of r̄\_w^∨ formally smooth for w ∈ S ∖ S\_p; and a compact open U = ∏\_w U\_w ⊆ ∏\_w (O\_D)\_w^× with U\_w = GL₂(O\_{F\_w}) for w ∉ S ∪ {w₁} and for w ∈ S\_p, U\_{w₁} contained in the matrices that are upper triangular and unipotent modulo w₁, and such that r̄ is modular at the level V = ∏\_{w ∉ S\_D ∪ S\_r}(O\_D)\_w^× · ∏\_{w ∈ (S\_D ∪ S\_r)∖S\_p} U\_w · ∏\_{w ∈ S\_p}(1 + pM₂(O\_{F\_w})): Hom\_{G\_F}(r̄, H¹\_ét(X\_V ×\_F F̄, 𝔽)) ≠ 0 in the indefinite case, S(V, 𝔽)[𝔪] ≠ 0 in the definite case.

*Hypotheses and conventions.*

- The genericity bounds at v force p > 23 (BHHMS, remark after the genericity conditions, p. 5); in fact 12 ≤ p − 15 needs p ≥ 27, so p ≥ 29 since p is prime (arithmetic derived here, not stated in BHHMS).
- Hodge–Tate weights are normalized so that the p-adic cyclotomic character ε has weight 1 at every embedding; Frobenius elements are geometric (BHHMS §1.4 and §8.1).
- r̄\_v^∨ satisfies the same semisimplicity and genericity hypotheses as r̄\_v (BHHMS §8.1 (i)); this is used because the patched rings are rings for r̄\_v^∨.

*Proof outline.*

1. Record the data and conditions of BHHMS §8.1, items (i)–(iv) together with the standing assumptions on F, D, r̄ and ψ (pp. 86–87); the genericity conditions of the introduction, (i)–(iii) on p. 5, are the same conditions in another order.
2. The auxiliary place w₁ exists by Chebotarev (EGS15 §6.2, citing Lemma 4.11 of Darmon–Diamond–Taylor; BHHMS cite EGS15 §§6.2 and 6.5); the conditions on w₁ make the level U sufficiently small in the sense of Kisin (2.1.2) (EGS15 §6.2).
3. The shape of V in the modularity hypothesis is always available once r̄ is modular at some level (BHHMS §8.1, citing Breuil–Diamond Theorem 3.2.2 and the proof of Corollary 3.2.3).

*Uses.*

- BHHMS23 §§8.1–8.5: Every global statement of §8 is made under this datum; Theorem 1.1 is Corollary 8.4.6 for it.
- [1.5 The patching functor of Shimura curves at v](#gk1-shimura-curve-patching-functor): The places S, w₁, the level U and ψ are the inputs of the Taylor–Wiles–Kisin construction.
- [5.5 Gelfand–Kirillov dimension of mod p cohomology of Shimura curves (BHHMS Theorem 1.1)](#gk5-shimura-curve-gk-dimension): The hypotheses of the main theorem are exactly the fields of this structure.

*API.*

- `IsGenericReducibleExponents` (data): The exponent condition 12 ≤ r\_i ≤ p − 15 of the reducible inertial shape at v (stated in the suggested Lean file, with IsGenericIrreducibleExponents for 13 ≤ r\_0 ≤ p − 14, 12 ≤ r\_i ≤ p − 15).
- `IsEGSGenericReducible` (data): EGS15 genericity of the reducible shape: 0 ≤ r\_j ≤ p − 3, not all 0, not all p − 3 (with IsEGSGenericIrreducible: 1 ≤ r\_0 ≤ p − 2, 0 ≤ r\_j ≤ p − 3); implied by the BHHMS bounds.
- `GenericGlobalDatum` (structure): The data (p, F, D, 𝔽, r̄, ψ, v, w₁, S, U) with the conditions of BHHMS §8.1 as fields; the indefinite and definite cases are a field \`split\_at\_infinity : Bool\` (or a two-constructor inductive), not two structures.
- `GenericGlobalDatum.prime_ge_29` (characterisation): The exponent bounds at v imply p ≥ 29.
- `GenericGlobalDatum.residual_generic_at_v` (relation): r̄\_v is generic in the sense of EGS15 Definition 2.1.1, so the datum is a special case of the EGS15 setting.
- `GenericGlobalDatum.dual_at_v` (functoriality): r̄\_v^∨ is again semisimple of one of the two inertial shapes, up to twist, with exponents satisfying the same bounds (BHHMS §8.1 (i)); the patched rings of GK.1 are rings for r̄\_v^∨.
- `GenericGlobalDatum.exists_auxiliaryPlace` (other): For r̄ with absolutely irreducible restriction to G\_{F(ζ\_p)} and p > 5, infinitely many places w₁ satisfy the three auxiliary conditions.
- `GenericGlobalDatum.level_sufficientlySmall` (characterisation): For every compact open V ⊆ U the level V is sufficiently small in the sense of Kisin (2.1.2), and the finite group V(𝔸\_F^∞)^×/V F^× acts on X\_V without fixed geometric points (BHHMS Remark 8.1.3(iii), from the conditions on w₁).

*Checks (unit tests).*

- `genericExponents_p29` (computation): For p = 29 and f = 1 in the first (reducible) shape the admissible exponents are exactly r\_0 ∈ {12, 13, 14}; in the second shape r\_0 ∈ {13, 14, 15}.
- `genericExponents_p23_empty` (degenerate): For p = 23 no exponent satisfies 12 ≤ r ≤ p − 15, so no datum exists; the condition p > 23 is forced, not assumed separately.
- `genericExponents_boundary` (non-example): For p = 29 the exponent r\_0 = 11 (inertial weight just below the box) is excluded although ω^{12} ⊕ 1 is generic in the sense of EGS15 Definition 2.1.1; BHHMS genericity is strictly stronger.
- `modularCurve_excluded` (non-example): (F, D) = (ℚ, M₂(ℚ)) is excluded in the indefinite case: X\_V would be a modular curve, which is not proper, and the main theorem was already known there.
- `egsGeneric_p3_reducible` (degenerate): For p = 3 no reducible residual representation is generic in the sense of EGS15 (EGS15 Remark 2.1.3); the BHHMS bound p > 5 is not the binding constraint.

*Acceptance.*

- The two inertial shapes at v carry the stated exponent bounds and no others; the genericity at the other places above p is the weaker EGS15/BP12 condition.
- The modularity hypothesis is stated at the specific level V of BHHMS §8.1 (iv)(b), not at an arbitrary level.

*Sources.* BHHMS23, §8.1, pp. 86–88, items (i)–(iv) and the standing assumptions preceding them; genericity conditions (i)–(iii), §1.2, p. 5: The global hypotheses of §8: F totally real unramified at p, D split above p and at at most one infinite place, r̄ absolutely irreducible on G\_{F(ζ\_p)}, generic above p, formally smooth local rings at the bad places away from p, the inertial shape of r̄\_v with the stated exponent bounds, the auxiliary place w₁, the set S and the level U. EGS15, Definition 2.1.1, p. 10; §6.2, pp. 34–35: Genericity of a local residual representation by the shape of its restriction to inertia, and the choice of the auxiliary place w₁ with the three listed properties.

*Needs:* HilbertModularVarietiesAndShimuraCurves `R18.1/quaternionic-datum` (One-real-split quaternionic datum); HilbertModularVarietiesAndShimuraCurves `R18.1/canonical-quaternionic-curve` (Canonical quaternionic curve and uniformization); HilbertModularVarietiesAndShimuraCurves `R18.3/definite-class-set` (Definite quaternionic class set); LocalGaloisDeformationRings `R08.1/local-lifting-ring` (The local framed deformation ring); FiniteFlatGroupsAndIntegralPadicHodgeTheory `R07.5/tame-inertia-characters` (Tame inertia and its fundamental characters); ModpRepresentationsOfGL2OverLocalFields `MP.3/tame-weight-set` (Tame Galois weights); `WittVector` (mathlib); `Matrix.GeneralLinearGroup` (mathlib); `Nat.Prime` (mathlib).

<a id="gk0-bdj-weight-set"></a>

### 0.2 The Buzzard–Diamond–Jarvis set of Serre weights

**Definition** (`GK.0/bdj-weight-set`). Planet: *Buzzard–Diamond–Jarvis weights*. Let K/ℚ\_p be unramified of degree f with residue field k, embeddings κ\_j = κ\_0 ∘ φ^j : k → 𝔽, and let ρ : G\_K → GL₂(𝔽) be continuous. A Serre weight is an irreducible 𝔽-representation σ\_{t,s} = ⊗\_{j=0}^{f−1}(det^{t\_j} Sym^{s\_j} k²) ⊗\_{k, κ\_j} 𝔽 of GL₂(k), 0 ≤ s\_j, t\_j ≤ p − 1, not all t\_j equal to p − 1. The set W(ρ) of Buzzard–Diamond–Jarvis is a set of Serre weights depending only on ρ, with W(ρ) ⊆ W(ρ^ss). For semisimple reducible ρ, σ\_{t,s} ∈ W(ρ) if and only if there is J ⊆ {0, …, f − 1} with ρ|I\_K ≅ ω\_f^{Σ\_j t\_j p^j} ⊗ (ω\_f^{Σ\_{j∈J}(s\_j+1)p^j} ⊕ ω\_f^{Σ\_{j∉J}(s\_j+1)p^j}); for irreducible ρ, σ\_{t,s} ∈ W(ρ) if and only if there is J ⊆ {0, …, 2f − 1}, antisymmetric in the sense that i ∈ J exactly when i + f ∉ J (indices modulo 2f, s\_j extended f-periodically), with ρ|I\_K ≅ ω\_f^{Σ\_j t\_j p^j} ⊗ (ω\_{2f}^{Σ\_{j∈J}(s\_j+1)p^j} ⊕ ω\_{2f}^{Σ\_{j∉J}(s\_j+1)p^j}). For a nonsplit reducible ρ, W(ρ) is the subset of W(ρ^ss) of those weights for which the extension class of ρ lies in the subspace L\_α ⊆ H¹(G\_K, 𝔽(χ₁χ₂^{−1})) attached by BDJ10 §3.2 to the weight and its subset J: the classes that are reductions of crystalline extensions with the associated labelled Hodge–Tate weights, enlarged to all of H¹ when χ₁χ₂^{−1} is cyclotomic, b = (p, …, p) and J is everything, and by the unramified classes when χ₁χ₂^{−1} is trivial and J is not everything. The displayed descriptions use BDJ10 §3 and BHHMS §2.3: ω\_f is the character I\_K → O\_K^× → k^× → 𝔽^× induced by inverse geometric Artin reciprocity, with ω₁ equal to the mod p cyclotomic character. EGS15 uses the inverse fundamental characters; with the same Galois representation as input its set D is related by W(ρ) = D\_EGS(ρ^∨), not by W(ρ) = D\_EGS(ρ).

*Hypotheses and conventions.*

- K/ℚ\_p unramified; for ramified K the Buzzard–Diamond–Jarvis recipe is replaced by the generalisations of Schein and Gee, which are not needed here.
- Use the BDJ/BHHMS fundamental characters throughout. EGS15 §2 has κ\_{j+1}^p = κ\_j and writes weights using κ\_{−j}; hence its weight embeddings κ\_{−j} agree with our κ₀ ∘ φ^j. Its ω\_f is our ω\_f^{−1}, so comparison with its formula requires dualising the input Galois representation.
- BHHMS use W(r̄\_w^∨), the weight set of the dual representation, because their patched rings are deformation rings of r̄\_w^∨ (BHHMS §8.1, (61)).

*Proof outline.*

1. Use BDJ10 §3.1–3.2 directly for the semisimple recipes, including the antisymmetric subset condition, and for W(ρ) ⊆ W(ρ^ss). Translate EGS15 §2 by both its embedding convention and its inverse fundamental characters: W(ρ) = D\_EGS(ρ^∨).
2. For the nonsplit reducible case the subset condition is BDJ10's L\_J condition, phrased through crystalline lifts with prescribed labelled Hodge–Tate weights (LocalGaloisDeformationRings R08.3 supplies the crystalline lifting rings and their points).
3. When ρ is tame and its inertial parameter is 1-deep, the description agrees with the parametrisation of MP.3/tame-weight-set by the extension-graph labels; prove agreement by matching the subset J with the sign vector of MP.3.

*Uses.*

- [0.6 The weight part of Serre's conjecture for quaternion algebras (Gee–Kisin)](#gk0-bdj-weight-theorem): The modular weights at each place above p are exactly W(r̄\_w^∨).
- [1.5 The patching functor of Shimura curves at v](#gk1-shimura-curve-patching-functor): At w ∈ S\_p ∖ {v} a tame type with exactly one weight of W(r̄\_w^∨) among its constituents is fixed (EGS15 Proposition 3.5.1).
- [3.2 Freeness for Serre weights and for lattices in tame types](#gk3-weight-and-type-freeness): The freeness statements are made for σ\_v ∈ W(r̄\_v^∨).
- [5.2 Structure of π[𝔪²\_{K₁}] (BHHMS Theorem 1.9)](#gk5-second-congruence-invariants): The decomposition of π[𝔪²\_{K₁}] is indexed by W(r̄\_v^∨).

*API.*

- `bdjWeights` (constructor): W(ρ) as a Finset of Serre weights of GL₂(k), for K unramified.
- `mem_bdjWeights_of_semisimple` (characterisation): The subset (reducible) and antisymmetric subset (irreducible) descriptions for semisimple ρ.
- `bdjWeights_subset_semisimplification` (relation): W(ρ) ⊆ W(ρ^ss).
- `bdjWeights_eq_tameWeights` (compatibility): For tame ρ with 1-deep parameter, W(ρ) equals MP.3's tame weight set.
- `bdjWeights_twist` (functoriality): W(ρ ⊗ χ) = {σ ⊗ (χ̄ ∘ det) : σ ∈ W(ρ)}, χ̄ the character of k^× matching χ|I\_K through ω\_f.
- `bdjWeights_regular_of_generic` (characterisation): For generic ρ every weight is regular (no s\_j = p − 1) and not of the form σ\_{t,0} (EGS15 Lemma 2.1.6).
- `card_bdjWeights_generic_semisimple` (characterisation): For generic semisimple ρ, W(ρ) has exactly 2^f elements.

*Checks (unit tests).*

- `bdjWeights_f1_reducible` (computation): For K = ℚ\_p and ρ|I ≅ ω^{s+1} ⊕ 1 with 0 < s < p − 3, W(ρ^ss) = {Sym^s 𝔽², det^{s+1} ⊗ Sym^{p−3−s} 𝔽²}; for p = 5, s = 1 this is {Sym¹, det² ⊗ Sym¹}.
- `bdjWeights_f1_irreducible` (computation): For K = ℚ\_p and ρ|I ≅ ω\_2^{s+1} ⊕ ω\_2^{p(s+1)}, 0 ≤ s ≤ p − 1, W(ρ) = {Sym^s 𝔽², det^s ⊗ Sym^{p−1−s} 𝔽²}.
- `bdjWeights_tres_ramifie` (non-example): For K = ℚ\_p and ρ a très ramifiée extension of 1 by ω, W(ρ) = {Sym^{p−1} 𝔽²} although W(ρ^ss) also contains the trivial weight: the nonsplit condition removes weights (Serre's weight p + 1).
- `bdjWeights_card_generic` (computation): For f = 2 and generic semisimple ρ, W(ρ) has 4 weights, one for each subset J ⊆ {0, 1}.
- `bdjWeights_tame_agrees` (compatibility): For a tame 1-deep ρ the Finset agrees with MP.3/tame-weight-set elementwise.
- `bdjWeights_boundary_and_duality` (non-example): For p = 5 and semisimple ρ|I = ω³ ⊕ 1, the boundary s = p − 3 gives three weights {Sym², det³, det³ ⊗ Sym⁴}; the two-weight formula applies only away from this boundary. EGS15 computes these weights from the dual inertial input ω\_EGS³ ⊕ 1. Using its inverse character on ρ itself fails this test.

*Acceptance.*

- The semisimple descriptions use ω\_f^{Σ t\_j p^j} as the twist and ω\_{2f} in the irreducible case, with the antisymmetry condition on J ⊆ ℤ/2f.
- The nonsplit reducible case is a subset of the semisimple set, never larger.

*Sources.* EGS15, §2.1, pp. 10–11, the description of D(ρ) after Definition 2.1.4 and Lemma 2.1.6: For semisimple ρ the weights are given by subsets J (reducible case) or antisymmetric subsets (irreducible case); in general D(ρ) ⊆ D(ρ^ss); for generic ρ every weight is regular and none has s = 0. These statements use EGS’s inverse fundamental characters; translate to this node by D\_EGS(ρ^∨) = W(ρ). BDJ10, §3.1 (the irreducible case), p. 18; §3.2 (the reducible case, with the spaces L\_α and their two exceptional modifications), pp. 21–26: The weight set of Buzzard–Diamond–Jarvis, defined from the restriction to inertia and, for reducible ρ, from the subspaces of extension classes attached to the weights and subsets J. BHHMS23, §2.2, pp. 13–14; §8.1, p. 87 (the use of W(r̄\_w^∨)): For tame ρ the set W(ρ) of BDJ depends only on ρ|I\_K; in §8 the weight sets of the duals r̄\_w^∨ are the ones that occur.

*Needs:* ModpRepresentationsOfGL2OverLocalFields `MP.3/tame-weight-set` (Tame Galois weights); FiniteFlatGroupsAndIntegralPadicHodgeTheory `R07.5/tame-inertia-characters` (Tame inertia and its fundamental characters); FiniteFlatGroupsAndIntegralPadicHodgeTheory `R07.5/serre-weights-compact-induction` (Serre weights of GL₂(F) and their compact inductions); LocalGaloisDeformationRings `R08.3/hodge-and-galois-types` (p-adic Hodge types and Galois types); LocalGaloisDeformationRings `R08.3/pst-deformation-ring` (Potentially semistable deformation rings of fixed type); `Representation` (mathlib).

<a id="gk0-residual-eigenspaces"></a>

### 0.3 Quaternionic spaces of mod p forms and their residual eigenspaces

**Construction** (`GK.0/residual-eigenspaces`). Fix a generic global datum and a compact open V = ∏\_w V\_w ⊆ U with V\_w = (O\_D)\_w^× outside S ∪ {w₁}. For a continuous representation σ of K\_S = ∏\_{w∈S} V\_w on a finite O-module with a central character compatible with ψ, let σ(θ) be its twist by the square roots θ\_w of the central characters (p > 2), and extend the action to V·(𝔸\_F^∞)^× by letting (𝔸\_F^∞)^× act through (𝔸\_F^∞)^×/F^× → G\_F^{ab} → O^× composed with ψ^{−1}. In the indefinite case let X\_V be the smooth projective Shimura curve over F (sign convention of BDJ10), replaced by its quotient by the free action of the finite group V(𝔸\_F^∞)^×/VF^×, and S(σ) = H¹(X\_V ×\_F F̄, F\_{σ(θ)^\*}); in the definite case S(σ) is the space of functions f : D^×∖(D ⊗\_F 𝔸\_F^∞)^× → σ(θ)^\* with f(gu) = u^{−1}f(g) for u ∈ V(𝔸\_F^∞)^×. The algebra T^{S,univ} = O[T\_w, S\_w : w ∉ S ∪ {w₁}] acts through the double cosets of diag(ϖ\_w, 1) and diag(ϖ\_w, ϖ\_w); 𝔪 is the maximal ideal generated by T\_w − S\_w tr r̄(Frob\_w) and Norm(w) − S\_w det r̄(Frob\_w). Then σ ↦ S(σ)\_𝔪 is contravariantly exact; in the indefinite case the evaluation map Hom\_{T(σ)\_𝔪[G\_{F,S}]}(ρ(σ)\_𝔪, S(σ)\_𝔪) ⊗\_{T(σ)\_𝔪} ρ(σ)\_𝔪 → S(σ)\_𝔪 is an isomorphism, where ρ(σ)\_𝔪 : G\_{F,S} → GL₂(T(σ)\_𝔪) is induced from the universal deformation; and M(σ) is the Pontryagin dual of Hom\_{T(σ)\_𝔪[G\_{F,S}]}(ρ(σ)\_𝔪, S(σ)\_𝔪) (indefinite) or of S(σ)\_𝔪 (definite). The resulting σ ↦ M(σ) is covariantly exact. For σ = 𝔽 trivial, when its central character is compatible, the r̄-part Hom\_{G\_F}(r̄, H¹\_ét(X\_V ×\_F F̄, 𝔽)) is unchanged by the passage to the quotient curve.

*Hypotheses and conventions.*

- V sufficiently small in the sense of Kisin (2.1.2), guaranteed by the choice of V\_{w₁}; 𝔪 non-Eisenstein because r̄ is absolutely irreducible.
- The action of (𝔸\_F^∞)^× is through ψ^{−1}, not ψ: BHHMS Remark 8.1.3(i) corrects EGS15 §6.2 here (recorded as a source finding).
- In the indefinite case the curve is replaced by its quotient by the finite group of central elements (BHHMS Remark 8.1.3(iii)); this is needed for S(σ) to be well defined with the extended central action.
- In the definite case D may ramify at finite places (any F with [F:ℚ] + |S\_D| even); the parent R18.3 plans the definite class sets only in the Khare–Wintenberger setting, and the general case is requested from it.

*Proof outline.*

1. Construct S(σ) on the HMV R18.4 finite-level cohomology with the R18.4 algebraic local systems (indefinite) and on the R18.3 definite class set with its fixed-central-character forms (definite).
2. The Hecke operators T\_w, S\_w are the R18.4 correspondences; 𝔪 is the R18.3 residual Hecke ideal in the normalisation of BDJ10 §4 (BHHMS Remark 8.1.3(ii)).
3. Local systems: a finite σ factoring through K\_S/V′ for V′ ⊆ V open normal gives a local system by descent of the constant sheaf along the finite Galois cover X\_{V′} → X\_V, the same torsor construction as R18.4/quaternion-local-systems for algebraic coefficients.
4. Exactness: localisation at the non-Eisenstein 𝔪 kills H⁰ and H² of every finite coefficient system (R18.4/residual-eisenstein-vanishing over 𝔽, by dévissage for finite length coefficients), so the long exact sequences give contravariant exactness of σ ↦ S(σ)\_𝔪, since the coefficient system uses σ^\*; the additional dual in M restores covariance; taking ψ-parts is exact by R18.4/central-character-exactness.
5. The Galois representation ρ(σ)\_𝔪 comes from R18.4/early-quaternionic-galois-hecke-support (constant weight-two coefficients) through the map from the universal deformation ring: for σ trivial on V′, T(σ)\_𝔪 is a quotient of the Hecke algebra acting on constant-coefficient cohomology at level V′; the evaluation isomorphism is the Eichler–Shimura/Boston–Lenstra–Ribet statement cited by EGS15 §6.2 (Carayol, Théorème 4).
6. Quotient curve: the finite group acts freely (R18.1/quaternionic-effective-stabilizers), the quotient is a smooth projective curve over F, and Hom\_{G\_F}(r̄, H¹) does not change (BHHMS Remark 8.1.3(iii), arguing as in Breuil–Diamond Theorem 3.7.1).

*Uses.*

- [0.5 Mod p cohomology of Shimura curves at infinite level at v](#gk0-infinite-level-representation): The representations π are colimits of r̄-parts of S(σ).
- [1.5 The patching functor of Shimura curves at v](#gk1-shimura-curve-patching-functor): The patched modules are limits of the M(σ) at Taylor–Wiles levels.
- [5.6 Completed cohomology at the r̄-part and the big Hecke algebra](#gk5-completed-cohomology-and-big-hecke): Completed cohomology and the big Hecke algebra are built from the same spaces with W(𝔽)/pⁿ coefficients.

*API.*

- `spaceOfForms` (constructor): S(σ) for a finite O-representation σ of K\_S with compatible central character, in both cases, functorial in σ. A map σ → σ′ induces S(σ′) → S(σ).
- `residualIdeal` (data): The maximal ideal 𝔪 ⊆ T^{S,univ} attached to r̄, in the BDJ10 normalisation; with geometric Frobenius elements it is the ideal that HMV R18.3/residual-hecke-ideal (T\_v ↦ tr, S\_v ↦ q\_v^{−1}det) attaches to r̄^∨ ⊗ ω^{−1}.
- `spaceOfForms_localized_exact` (characterisation): For 0 → σ₁ → σ₂ → σ₃ → 0, there is an exact sequence 0 → S(σ₃)\_𝔪 → S(σ₂)\_𝔪 → S(σ₁)\_𝔪 → 0; the modules M give the covariant exact sequence.
- `evaluation_iso` (equivalence): In the indefinite case M(σ)^∨ ⊗\_{T(σ)\_𝔪} ρ(σ)\_𝔪 ≅ S(σ)\_𝔪 as T(σ)\_𝔪[G\_{F,S}]-modules.
- `rbarPart_quotientCurve` (compatibility): Hom\_{G\_F}(r̄, H¹(X\_V, 𝔽)) is the same for X\_V and for its quotient by the free finite central action.
- `spaceOfForms_changeLevel` (functoriality): For V′ ⊆ V normal, S\_{V}(σ) = S\_{V′}(σ)^{V/V′} after localisation at 𝔪, compatibly with Hecke operators and G\_F.

*Checks (unit tests).*

- `spaceOfForms_zero` (degenerate): S(0) = 0 and M(0) = 0.
- `spaceOfForms_trivial_indefinite` (compatibility): If the trivial coefficient has the required central character, S(𝔽) is the constant-coefficient H¹ of the central quotient curve used in the definition. Comparison with the original Shimura curve is asserted on its r̄-part, not on all of H¹.
- `residualIdeal_charpoly` (computation): Modulo 𝔪, X² − S\_w^{−1}T\_w X + Norm(w)S\_w^{−1} is the characteristic polynomial of r̄(Frob\_w) for w ∉ S ∪ {w₁}.
- `unlocalized_not_exact` (non-example): A concrete obstruction before localisation: for a connected étale C\_p-cover of a proper connected curve, the augmentation 𝔽[C\_p] → 𝔽 sends the invariant norm vector to p = 0, so H⁰ of the associated local systems is not right exact. Its long exact sequence gives a nonzero connecting class and failure of exactness on H¹. Dualise the coefficients to express this as a failure of exactness of S; non-Eisenstein localisation removes it.

*Acceptance.*

- The central action is through ψ^{−1} and the curve is the quotient curve, as corrected in BHHMS Remark 8.1.3.
- Exactness is asserted only after localisation at the non-Eisenstein 𝔪 and at sufficiently small level.

*Sources.* EGS15, §6.2, pp. 34–36: The twisted spaces S(σ) for indefinite and definite quaternion algebras, the abstract Hecke algebra away from S ∪ {w₁}, the residual maximal ideal, exactness of σ ↦ S(σ)\_𝔪, the Galois representation on the localized Hecke algebra and the module M(σ) with its evaluation isomorphism. BHHMS23, Remark 8.1.3 (i)–(iii), pp. 88–89; §8.1, p. 89 (definite case): Three corrections to EGS15 §6.2: the adelic centre acts through ψ^{−1}; the maximal ideal is the one of BDJ10 §4; the Shimura curve is replaced by its quotient by a finite group acting freely, which does not change the r̄-part.

*Needs:* [0.1 The generic global datum of Breuil–Herzig–Hu–Morra–Schraen](#gk0-generic-global-datum); HilbertModularVarietiesAndShimuraCurves `R18.1/canonical-quaternionic-curve` (Canonical quaternionic curve and uniformization); HilbertModularVarietiesAndShimuraCurves `R18.1/quaternionic-effective-stabilizers` (Quaternionic central kernel and small levels); HilbertModularVarietiesAndShimuraCurves `R18.4/quaternion-local-systems` (Quaternionic algebraic local systems); HilbertModularVarietiesAndShimuraCurves `R18.4/finite-cohomology` (Quaternionic finite-level cohomology); HilbertModularVarietiesAndShimuraCurves `R18.3/definite-class-set` (Definite quaternionic class set); HilbertModularVarietiesAndShimuraCurves `R18.3/definite-specialisation` (Fixed-central-character algebraic forms); HilbertModularVarietiesAndShimuraCurves `R18.3/residual-hecke-ideal` (Residual quaternionic Hecke ideal); HilbertModularVarietiesAndShimuraCurves `R18.4/residual-eisenstein-vanishing` (Residual Eisenstein vanishing); HilbertModularVarietiesAndShimuraCurves `R18.4/central-character-exactness` (Exact central-character localization); HilbertModularVarietiesAndShimuraCurves `R18.4/early-quaternionic-galois-hecke-support` (Early finite-level quaternionic Galois–Hecke realization); GlobalGaloisDeformations `R04.3/global-framed-ring` (Representability of global deformations of type 𝒮).

<a id="gk0-non-eisenstein-freeness"></a>

### 0.4 Projectivity and injectivity of the residual eigenspaces over the level quotient

**Theorem** (`GK.0/non-eisenstein-freeness`). Let V′ ⊆ V be compact open subgroups of (D ⊗\_F 𝔸\_F^∞)^×, V′ normal in V, with V sufficiently small in the sense of Kisin (2.1.2) (for example V\_{w₁} unipotent upper triangular modulo w₁), so that G = V/V′ (modulo the central part, as in GK.0/residual-eigenspaces) acts freely on the quotient curve X\_{V′}, respectively on D^×∖(D ⊗ 𝔸\_F^∞)^×/V′(𝔸\_F^∞)^×. Then H¹\_ét(X\_{V′} ×\_F F̄, 𝔽)\_𝔪 (indefinite) and S(V′, 𝔽)\_𝔪 (definite) are finite projective 𝔽[G]-modules, hence injective; for every finite 𝔽[V]-representation σ factoring through G, the Hochschild–Serre map identifies the 𝔪-localised cohomology at level V with coefficients in σ^∗ with Hom\_G(σ, H¹\_ét(X\_{V′} ×\_F F̄, 𝔽)\_𝔪) (resp. Hom\_G(σ, S(V′, 𝔽)\_𝔪)), compatibly with the Hecke operators away from S ∪ {w₁} and with G\_F. The same holds with W(𝔽)/pⁿ coefficients, with projectivity and injectivity over (W(𝔽)/pⁿ)[G]. When G is a p-group these projective modules are free, since the group algebra is local; this includes the Taylor–Wiles quotients and the pro-p congruence quotients used below.

*Hypotheses and conventions.*

- 𝔪 is non-Eisenstein because r̄ is absolutely irreducible; the free action of G at small level is the condition imposed by the auxiliary place w₁ (EGS15 §6.2; BHHMS Remark 8.1.3(iii), citing Breuil–Diamond Lemme 3.6.2).

*Proof outline.*

1. Indefinite case: X\_{V′} → X\_V is a finite étale Galois cover with group G, so RΓ(X\_{V′}, 𝔽) ≅ RΓ(X\_V, 𝔽[G]) is a perfect complex of 𝔽[G]-modules computed by the Hochschild–Serre spectral sequence of R18.4/finite-level-descent (the case where p divides |G|).
2. After localisation at 𝔪, H⁰ and H² vanish (R18.4/residual-eisenstein-vanishing). The remaining finite module has finite projective dimension over 𝔽[G]. The finite group algebra is self-injective, so finite projective dimension forces projectivity and hence injectivity. For W(𝔽)/pⁿ the same argument uses its Frobenius group algebra and the corresponding perfect coefficient complex. Projective implies free when G is a p-group, not for an arbitrary finite G.
3. The Hochschild–Serre spectral sequence for coefficients σ therefore degenerates and gives the Hom description; Hecke operators and G\_F commute with the comparison maps.
4. Definite case: S(V′, 𝔽) is the space of functions on a finite set on which G acts freely, so it is free over 𝔽[G] before localisation; the 𝔪-part is a direct summand (as in R18.3/tw-freeness, which is the Taylor–Wiles instance of this statement). A direct summand is projective; no assertion that it is free for arbitrary G is needed.

*Acceptance.*

- Projectivity and injectivity hold for arbitrary finite level quotients; freeness is asserted only for p-group quotients. For odd p, the one-dimensional trivial summand of 𝔽[C₂] is projective but not free, so replacing projective by free in the general statement fails a dimension check.
- The level must be small enough for G to act freely; this is where the auxiliary place w₁ enters.

*Sources.* BHHMS23, proof of Corollary 8.4.6, part (i), p. 107; (64), p. 89: The localised H¹ at level V^vV\_v is an injective representation of U^v/V^v because 𝔪 is non-Eisenstein, and the Hochschild–Serre spectral sequence identifies the weighted spaces at level U with Hom\_{U/V}(−, H¹ at level V). EGS15, §6.2, p. 35: Because the level is sufficiently small and 𝔪 is non-Eisenstein, σ ↦ S(σ)\_𝔪 is exact.

*Needs:* [0.3 Quaternionic spaces of mod p forms and their residual eigenspaces](#gk0-residual-eigenspaces); HilbertModularVarietiesAndShimuraCurves `R18.4/finite-level-descent` (Finite-level invariants and trace control); HilbertModularVarietiesAndShimuraCurves `R18.4/residual-eisenstein-vanishing` (Residual Eisenstein vanishing); HilbertModularVarietiesAndShimuraCurves `R18.4/finite-cohomology` (Quaternionic finite-level cohomology); HilbertModularVarietiesAndShimuraCurves `R18.1/quaternionic-effective-stabilizers` (Quaternionic central kernel and small levels); HilbertModularVarietiesAndShimuraCurves `R18.3/definite-class-set` (Definite quaternionic class set); HilbertModularVarietiesAndShimuraCurves `R18.3/tw-freeness` (Integral diamond freeness).

<a id="gk0-infinite-level-representation"></a>

### 0.5 Mod p cohomology of Shimura curves at infinite level at v

**Construction** (`GK.0/infinite-level-representation`). Planet: *Mod p cohomology at infinite level*. Fix a generic global datum and Serre weights σ\_w ∈ W(r̄\_w^∨) for w ∈ S\_p ∖ {v}, and a tame level V^v = ∏\_{w≠v} V\_w with V\_w = U\_w for w ∉ S\_p and V\_w ⊆ 1 + pM₂(O\_{F\_w}) normal in GL₂(O\_{F\_w}) for w ∈ S\_p ∖ {v}. Define the smooth representation π of GL₂(F\_v) over 𝔽 as the colimit over compact open V\_v ⊆ GL₂(F\_v) of Hom\_{U^v/V^v}(⊗\_{w∈S\_p∖{v}} σ\_w, Hom\_{G\_F}(r̄, H¹\_ét(X\_{V^vV\_v} ×\_F F̄, 𝔽))) in the indefinite case, and of Hom\_{U^v/V^v}(⊗\_w σ\_w, S(V^vV\_v, 𝔽)[𝔪]) in the definite case; GL₂(F\_v) acts through the Hecke action of g ∈ GL₂(F\_v) between the levels V\_v and gV\_vg^{−1}. Then π is admissible, has central character ψ^{−1} (on F\_v^× through local class field theory), and π ≠ 0. The unweighted variant π(V^v) = colim\_{V\_v} Hom\_{G\_F}(r̄, H¹\_ét(X\_{V^vV\_v} ×\_F F̄, 𝔽)) (definite: colim S(V^vV\_v, 𝔽)[𝔪]) is admissible smooth for every tame level V^v; when V\_{w₁} consists of the matrices upper triangular and unipotent modulo w₁, V\_w = U\_w at the other places outside S\_p, and V\_w ⊆ 1 + pM₂(O\_{F\_w}) is normal in GL₂(O\_{F\_w}) at w ∈ S\_p ∖ {v}, it has a finite filtration whose graded pieces are subrepresentations of weighted π's, at least one of them nonzero if π(V^v) ≠ 0 (BHHMS (83)).

*Hypotheses and conventions.*

- Admissibility: for every compact open V\_v the invariants π^{V\_v} are finite-dimensional, being contained in the r̄-part of a finite-level cohomology group (non-Eisenstein localisation makes the comparison with finite level exact).
- The σ\_w are taken in W(r̄\_w^∨) so that π ≠ 0 by the weight theorem; for other weights the corresponding space vanishes.

*Proof outline.*

1. The colimit is the fixed-exponent smooth colimit of CompletedCohomologyPartII CC.1, applied to the quaternionic Shimura-curve tower (CC.8/arithmetic-tower-realisation, in its quaternionic form as used by CompletedCohomologyAndLocalGlobalCompatibility R31.1/shimura-curve-completed-cohomology; in the definite case the tower is a system of finite sets) with the level varying at v only, which is cofinal in the levels at v; smoothness and the GL₂(F\_v)-action are CC.1/full-local-group-smooth-action, and the Hecke operators away from S ∪ {w₁} are CC.1/tame-hecke-on-colimits for this tower, with the ψ^{−1} central twist.
2. Admissibility: by GK.0/non-eisenstein-freeness the V\_v-invariants of the colimit agree with the finite-level r̄-part at level V^vV\_v for V\_v small, which is finite-dimensional.
3. Central character: the centre acts through ψ^{−1} because of the twisted central action in the definition of the spaces (GK.0/residual-eigenspaces).
4. Nonvanishing: GK.0/bdj-weight-theorem with σ\_w ∈ W(r̄\_w^∨) and the existence of some weight σ\_v ∈ W(r̄\_v^∨).
5. Dévissage (BHHMS (83)), for the shrunken levels only: write the maximal central-character quotient of Ind\_{V\_w}^{GL₂(O\_{F\_w})} 1 as an iterated extension of Serre weights; injectivity of the localized H¹ as a U^v/V^v-representation (GK.0/non-eisenstein-freeness) lets one bound π(V^v) by the weighted pieces.

*Uses.*

- [1.6 Fibres of the patching functor at the maximal ideal](#gk1-patched-fibre-identity): M∞(σ\_v)/𝔪∞ ≅ Hom\_K(σ\_v, π)^∨.
- [5.1 Gelfand–Kirillov dimension of the weighted representation (BHHMS Theorem 1.10)](#gk5-patched-gk-dimension): The theorem computes dim\_{GL₂(F\_v)} π = f for the weighted π.
- [5.5 Gelfand–Kirillov dimension of mod p cohomology of Shimura curves (BHHMS Theorem 1.1)](#gk5-shimura-curve-gk-dimension): The unweighted π(V^v) is the representation of Theorem 1.1.

*API.*

- `infiniteLevelRep` (constructor): π for given weights σ\_w at w ∈ S\_p ∖ {v}, as a smooth 𝔽-representation of GL₂(F\_v).
- `infiniteLevelRep_admissible` (characterisation): π^{V\_v} is finite-dimensional for every compact open V\_v.
- `infiniteLevelRep_centralCharacter` (characterisation): The centre F\_v^× acts on π through ψ^{−1} composed with local class field theory.
- `infiniteLevelRep_invariants` (compatibility): For V\_v ⊆ 1 + pM₂(O\_{F\_v}) normal in GL₂(O\_{F\_v}), π^{V\_v} is the finite-level space Hom\_{U^v/V^v}(⊗σ\_w, Hom\_{G\_F}(r̄, H¹(X\_{V^vV\_v}))) .
- `infiniteLevelRep_ne_zero` (characterisation): π ≠ 0 for σ\_w ∈ W(r̄\_w^∨).
- `unweighted_devissage` (relation): For the shrunken tame levels of BHHMS (83) (unipotent at w₁, normal pro-p levels above p other than v), π(V^v) has a finite filtration whose graded pieces embed into weighted π's.

*Checks (unit tests).*

- `infiniteLevelRep_wrongWeight` (degenerate): If σ\_w ∉ W(r̄\_w^∨) for some w ∈ S\_p ∖ {v} then the weighted π is 0.
- `infiniteLevelRep_K1_invariants` (compatibility): π^{K₁} with K₁ = 1 + pM₂(O\_{F\_v}) is the finite-level weighted r̄-part at level V^vK₁; it is a GL₂(k\_v)-representation (used in GK.3/projective-lift-freeness).
- `infiniteLevelRep_twist` (compatibility): Under a compatible global character twist r̄ ↦ r̄ ⊗ χ, ψ changes to ψχ², so the new central character is ψ^{−1}χ^{−2}. The corresponding local determinant twist, when levels and away-from-v weights are transported, is χ̃^{−1} ∘ det. The positive twist gives the wrong central character.
- `infiniteLevelRep_not_finite` (non-example): For the nonzero weighted π, GK.5/patched-gk-dimension gives dimension f ≥ 1. A finite-dimensional smooth representation has dimension 0 because its dual is a finite-length Iwasawa module. Thus π is infinite-dimensional; this is a downstream consequence, not an assumption in its definition.

*Acceptance.*

- The colimit is over levels at v only; the levels away from v are fixed.
- The weighted π uses Hom\_{U^v/V^v}(⊗σ\_w, −), not a tensor product.

*Sources.* BHHMS23, (1) and (2), §1.1–1.2, pp. 2–4; (66)–(67), §8.1, p. 90; (83) and the proof of Corollary 8.4.6, pp. 106–107: The admissible smooth representation π of GL₂(F\_v): the colimit over levels at v of the r̄-part of H¹ of Shimura curves (or of the 𝔪-torsion of definite forms), possibly weighted by fixed Serre weights at the other places above p, with central character ψ^{−1}; the unweighted version reduces to weighted ones by dévissage. DL21, §6.1, pp. 53–54: The global representation π\_glob as a colimit of r̄-parts of mod p cohomology of quaternionic Shimura curves (or definite forms) over levels at v, with commuting Hecke and Galois actions.

*Needs:* [0.3 Quaternionic spaces of mod p forms and their residual eigenspaces](#gk0-residual-eigenspaces); [0.4 Projectivity and injectivity of the residual eigenspaces over the level quotient](#gk0-non-eisenstein-freeness); [0.2 The Buzzard–Diamond–Jarvis set of Serre weights](#gk0-bdj-weight-set); CompletedCohomologyPartII `CC.1/fixed-exponent-smooth-colimit` (Fixed-exponent cohomology); CompletedCohomologyPartII `CC.1/full-local-group-smooth-action` (Smooth local-group action); CompletedCohomologyPartII `CC.1/tame-hecke-on-colimits` (Tame Hecke on smooth colimits); CompletedCohomologyPartII `CC.8/arithmetic-tower-realisation` (Arithmetic tower realisation comparisons); `SmoothRepresentationsOfLocalGroups:SR.0`.

<a id="gk0-bdj-weight-theorem"></a>

### 0.6 The weight part of Serre's conjecture for quaternion algebras (Gee–Kisin)

**Theorem** (`GK.0/bdj-weight-theorem`). Planet: *Gee–Kisin weight theorem*. Let p > 2, F totally real, r̄ : G\_F → GL₂(𝔽) modular with r̄|G\_{F(ζ\_p)} irreducible (and, for p = 5, projective image of r̄|G\_{F(ζ\_5)} not A₅), and D a quaternion algebra over F split above p and at no more than one infinite place, compatible with r̄ at its finite ramified places. For Serre weights σ\_w of GL₂(k\_w), w | p, r̄ is modular for D of weight ⊗\_w σ\_w if and only if σ\_w ∈ W^{BT}(r̄|G\_{F\_w}) for all w | p, where W^{BT} is the set of weights with nonzero Breuil–Mézard multiplicity. When p is unramified in F, W^{BT}(ρ) is the Buzzard–Diamond–Jarvis set. Here ψ is a fixed character with det r̄ = ψε^{−1} modulo p, the weights are compatible with ψ, and r̄ is modular for D of weight σ if the 𝔪-part of the space of forms of weight σ is nonzero at some level (GK14 Definitions 5.5.2–5.5.3). In the setting of a generic global datum (BHHMS normalisations, which dualise r̄): for V with V\_w ⊆ 1 + pM₂(O\_{F\_w}) normal at w ∈ S\_p and such that r̄ is modular at level V (BHHMS (60)), Hom\_{GL₂(O\_F ⊗ ℤ\_p)}(⊗\_{w∈S\_p}σ\_w, Hom\_{G\_F}(r̄, H¹\_ét(X\_V ×\_F F̄, 𝔽))) ≠ 0 if and only if σ\_w ∈ W(r̄\_w^∨) for every w ∈ S\_p, and in the definite case the same holds with S(V, 𝔽)[𝔪] in place of the r̄-part of H¹.

*Hypotheses and conventions.*

- p > 2 and, for p = 5, the A₅ exception excluded; both hold for a generic global datum (BHHMS: p > 23).
- The identification W^{BT} = W^{BDJ} for p unramified rests on Gee–Liu–Savitt and Gee–Kisin Theorem A(1); it is a recorded gap of this roadmap (no atlas roadmap plans the Breuil–Mézard conjecture for potentially Barsotti–Tate representations).

*Proof outline.*

1. Patching (GK14 §5.4): for each potentially Barsotti–Tate type, patch the spaces of quaternionic forms with that type at p (DeformationAndDerivedPatchingAlgebra R03.5) and compare the Hilbert–Samuel multiplicity of the patched module modulo ϖ (R03.3/degree-indexed-multiplicity) with the Breuil–Mézard multiplicity of the potentially Barsotti–Tate deformation ring; filtering the type lattice modulo ϖ by Serre weights gives one inequality (the analogue for general totally real F of GL2ModularityLifting R32.2/patched-weight-filtration, which is stated only for p totally split) and the Breuil–Mézard identity (GK14 Theorem A, the recorded gap) the other.
2. Deduce (GK14 Corollary 5.4.5) that the patched module of a Serre weight σ is nonzero exactly when its Breuil–Mézard multiplicity is nonzero, using potential diagonalisability of potentially Barsotti–Tate lifts (PotentialAutomorphyInfrastructurePartII PL.1) to see that r̄ is modular of some type.
3. Translate into the original BDJ formulation (GK14 Corollary 5.5.4): Shapiro-type identity (5.5.5) between forms of type τ^p and forms of weight σ at smaller level, and the compatibility of r̄ with D at the ramified places.
4. For BHHMS's normalisation: the space Hom(⊗σ\_w, Hom\_{G\_F}(r̄, H¹)) corresponds to the 𝔪-part of forms of weight ⊗σ\_w^∨ twisted by ψ; this replaces W(r̄\_w) by W(r̄\_w^∨) (BHHMS (61), citing GK14 §5.5).

*Acceptance.*

- Stated with W(r̄\_w^∨) in BHHMS's normalisation and with the compatibility condition with D implicit in a generic global datum.
- The dependence on Gee–Kisin Theorem A is recorded as a gap, not hidden.

*Sources.* GK14, Theorem B (= Corollary 5.5.7), p. 3 and p. 35; Corollary 5.5.4 with Definitions 5.5.2–5.5.3, p. 34; Corollary 5.4.5, p. 33: Modularity of a given Serre weight for a quaternion algebra holds exactly when each local weight lies in the Breuil–Mézard weight set and r̄ is compatible with D; for p unramified this is the conjecture of Buzzard, Diamond and Jarvis. BHHMS23, (61), §8.1, p. 87: Nonvanishing of the weighted r̄-part of H¹ of Shimura curves at level V is equivalent to σ\_w ∈ W(r̄\_w^∨) for all w above p, citing Gee–Kisin §5.5. EGS15, §6.4, last paragraph, p. 37: The support condition for Serre weights of the patching functor follows from Gee–Kisin, cited as Corollaries 5.6.4 and 4.5.7 of the 2012 version (numbering absent from arXiv v5, recorded as a source finding).

*Needs:* [0.2 The Buzzard–Diamond–Jarvis set of Serre weights](#gk0-bdj-weight-set); [0.3 Quaternionic spaces of mod p forms and their residual eigenspaces](#gk0-residual-eigenspaces); DeformationAndDerivedPatchingAlgebra `R03.5/patched-module` (The patched module from a limit presentation); DeformationAndDerivedPatchingAlgebra `R03.5/patched-ring-action` (Continuous action on the patched module); DeformationAndDerivedPatchingAlgebra `R03.3/degree-indexed-multiplicity` (Dimension-normalized multiplicity); PotentialAutomorphyInfrastructurePartII `PL.1/potentially-barsotti-tate-diagonalizable` (Two-dimensional potentially Barsotti–Tate representations are potentially diagonalizable); LocalGaloisDeformationRings `R08.3/pst-deformation-ring` (Potentially semistable deformation rings of fixed type).

<a id="gk0-ihara-at-auxiliary-place"></a>

### 0.7 Doubling at the auxiliary place w₁

**Theorem** (`GK.0/ihara-at-auxiliary-place`). Let V^v = ∏\_{w≠v}V\_w be a tame level with V\_{w₁} = GL₂(O\_{F\_{w₁}}) (r̄ unramified at w₁), and let V′^v agree with V^v except that V′\_{w₁} is the group of matrices upper triangular and unipotent modulo w₁. Then for every sufficiently small V\_v there is an isomorphism Hom\_{G\_F}(r̄, H¹\_ét(X\_{V^vV\_v} ×\_F F̄, 𝔽))^{⊕2} ≅ Hom\_{G\_F}(r̄, H¹\_ét(X\_{V′^vV\_v} ×\_F F̄, 𝔽)), and hence a GL₂(F\_v)-equivariant isomorphism π(V^v)^{⊕2} ≅ π(V′^v). BHHMS prove the indefinite case and state that the definite case (with S(−, 𝔽)[𝔪]) is similar; the compatibility of the finite-level isomorphisms with change of V\_v, which gives the equivariance of the colimit, is part of the argument below.

*Hypotheses and conventions.*

- The three conditions on w₁ of the generic global datum: Norm(w₁) ≢ 1 mod p, eigenvalue ratio of r̄(Frob\_{w₁}) outside {1, Norm(w₁)^{±1}}, and the root-of-unity condition.

*Proof outline.*

1. Since Norm(w₁) ≢ 1 mod p, the torus quotient (k\_{w₁}^×)² of the Iwahori level by V′\_{w₁} has order prime to p, so the cohomology at level V′ splits into isotypic parts for its characters; an eigenform in a part with a nontrivial character is a ramified principal series at w₁, and by local–global compatibility away from p (AutomorphicGaloisRepresentations R19.4) its Galois representation is ramified at w₁ through a character of order prime to p, which stays nontrivial modulo p; as r̄ is unramified at w₁, only the trivial character contributes to the r̄-part, and V′\_{w₁}-level equals Iwahori level after taking r̄-parts (work with the integral, 𝔪-localised, O-free cohomology of R18.4/non-eisenstein-integral-control and its eigenspace decomposition R18.4/cohomological-eigenspaces).
2. At Iwahori level the two degeneracy maps (HMV R18.4/cohomological-degeneracy) give δ from two copies of the hyperspecial level to Iwahori level, with δ†δ the Gram operator (R18.4/geometric-gram-identity, R18.4/degeneracy-gram). On the 𝔪-part at hyperspecial level, T\_{w₁} and S\_{w₁} act through the Eichler–Shimura relation for r̄(Frob\_{w₁}), whose eigenvalues α, β are distinct, so the Gram determinant becomes Δ = (Norm(w₁) − α/β)(Norm(w₁) − β/α), a unit by the eigenvalue condition; hence δ is injective with image a direct summand (R18.4/oldspace-splitting).
3. There is no new part after localisation: an eigenform new at w₁ is special at w₁; transferring it to GL₂ by the Jacquet–Langlands bridge (HMV R18.4/quaternionic-jacquet-langlands-bridge), local–global compatibility (R19.4, Carayol) shows that the eigenvalue ratio of its residual Frobenius would be Norm(w₁)^{±1}, which is excluded; comparing ranks in characteristic zero and using the direct-summand property gives an isomorphism integrally, hence modulo p.
4. The isomorphisms are induced by correspondences at w₁ only, so they commute with change of V\_v and with the GL₂(F\_v)-action, and pass to the colimit (BHHMS proof of Corollary 8.4.6 (ii)). The definite case uses R18.3/definite-degeneracy in place of the cohomological degeneracy maps.

*Acceptance.*

- The determinant of the degeneracy Gram matrix modulo 𝔪 factors as (N − α/β)(N − β/α) with N = Norm(w₁), and is a unit exactly under the eigenvalue condition.
- The statement is used only to compare GK dimensions: dim π(V^v) = dim π(V′^v).

*Sources.* BHHMS23, proof of Corollary 8.4.6, part (ii), p. 107: By Ihara's lemma at w₁, easy under the assumptions on w₁, two copies of the r̄-part at maximal level at w₁ give the r̄-part at the level of matrices upper triangular unipotent modulo w₁, for V\_v small; hence π^{⊕2} ≅ π′. EGS15, §6.2, p. 34: The three conditions on the auxiliary place w₁ and the level at w₁ consisting of matrices upper triangular and unipotent modulo w₁.

*Needs:* [0.1 The generic global datum of Breuil–Herzig–Hu–Morra–Schraen](#gk0-generic-global-datum); [0.5 Mod p cohomology of Shimura curves at infinite level at v](#gk0-infinite-level-representation); HilbertModularVarietiesAndShimuraCurves `R18.4/cohomological-degeneracy` (Cohomological degeneracy maps); HilbertModularVarietiesAndShimuraCurves `R18.4/degeneracy-gram` (GL2 degeneracy Gram operator); HilbertModularVarietiesAndShimuraCurves `R18.4/geometric-gram-identity` (Geometric degeneracy Gram identity); HilbertModularVarietiesAndShimuraCurves `R18.4/oldspace-splitting` (Unit-discriminant oldspace splitting); HilbertModularVarietiesAndShimuraCurves `R18.4/non-eisenstein-integral-control` (Non-Eisenstein integral cohomology control); HilbertModularVarietiesAndShimuraCurves `R18.4/cohomological-eigenspaces` (Cohomological automorphic eigenspaces); HilbertModularVarietiesAndShimuraCurves `R18.3/definite-degeneracy` (Definite Ihara degeneracy map); HilbertModularVarietiesAndShimuraCurves `R18.4/quaternionic-jacquet-langlands-bridge` (Early quaternionic Jacquet–Langlands bridge); AutomorphicGaloisRepresentations `R19.4/hecke-versus-langlands-normalization-and-local-global-compatibility` (Local-global compatibility away from p, in the Hecke normalization, with its exact relation to Langlands).

<a id="layer-gk1"></a>

## Layer GK.1: Patching functors and the big patched module

Construct the patched ring R∞ ≅ W(𝔽)⟦X₁, …, X\_{4|S|+q−1+2f}⟧ over S∞ = W(𝔽)⟦x₁, …, x\_{4|S|+q−1}⟧ (BHHMS (63)), with the power-series cancellation lemma (Hamann; BHHMS Lemma 8.1.2) and its type quotients R∞^{λ,τ} (BHHMS (69)); define fixed-determinant patching functors (EGS15 Definitions 6.1.1 and 6.1.3, Lemma 6.1.4); construct the Shimura-curve patching functor M∞^{σ\_p^v} on representations of GL₂(O\_{F\_v}) by functorial Taylor–Wiles–Kisin patching (EGS15 §§6.2, 6.4; BHHMS (62)), prove that its fibre at 𝔪∞ is Hom\_K(σ\_v, π)^∨ (BHHMS (64)–(68)), and construct the big patched module M∞ with its GL₂(F\_v)-action, finite free over S∞⟦K₁/Z₁⟧, with M∞/𝔪∞ ≅ π^∨ and, for p inert, M∞ ⊗\_{S∞} W(𝔽) the dual of completed cohomology (Dotto–Le §6.2; BHHMS (84)). Taylor–Wiles data and patching algebra come from GlobalGaloisDeformations and DeformationAndDerivedPatchingAlgebra.

*Layer dependencies:* `HilbertModularVarietiesAndShimuraCurvesPartII:GK.0`, `CompletedCohomologyPartII:CC.3`, `DeformationAndDerivedPatchingAlgebra:R03.1`, `DeformationAndDerivedPatchingAlgebra:R03.3`, `DeformationAndDerivedPatchingAlgebra:R03.5`, `GlobalGaloisDeformations:R04.3`, `GlobalGaloisDeformations:R04.5`, `HilbertModularVarietiesAndShimuraCurves:R18.3`, `HilbertModularVarietiesAndShimuraCurves:R18.4`, `LocalGaloisDeformationRings:R08.1`, `LocalGaloisDeformationRings:R08.3`.

<a id="gk1-power-series-cancellation"></a>

### 1.1 Cancellation of a power-series variable (Hamann)

**Theorem** (`GK.1/power-series-cancellation`). If R and S are commutative local rings and R⟦x⟧ ≅ S⟦x⟧ as rings, then R ≅ S. In the complete regular case used here, if A is a complete Noetherian local W(𝔽)-algebra with residue field 𝔽 and A⟦x⟧ ≅ W(𝔽)⟦X₁, …, X\_n⟧ as W(𝔽)-algebras, with n ≥ 1, then A ≅ W(𝔽)⟦X₁, …, X\_{n−1}⟧. If instead A⟦x⟧ ≅ B⟦x⟧ with B ≅ W(𝔽)⟦X₁, …, X\_n⟧, cancellation gives A ≅ B with n variables.

*Hypotheses and conventions.*

- The general statement is Hamann's theorem for local rings; every application in this roadmap is the complete regular case, which has the elementary proof below.

*Proof outline.*

1. (The second form in the statement is derived here, not stated in BHHMS.) Complete regular case: A⟦x⟧ ≅ W(𝔽)⟦X₁, …, X\_n⟧ is regular local and x lies in its maximal ideal but not in its square, so A = A⟦x⟧/(x) is regular local of dimension n (the quotient of a regular local ring by an element of a regular system of parameters).
2. A is complete with residue field 𝔽 and p ∉ 𝔪\_A² (because p ∉ 𝔪² in A⟦x⟧ ≅ W(𝔽)⟦X⟧ and 𝔪\_A² ⊆ 𝔪\_{A⟦x⟧}²); Cohen's structure theorem gives a surjection W(𝔽)⟦X₁, …, X\_{n−1}⟧ ↠ A, which is an isomorphism because both are domains of dimension n (a surjection between Noetherian local domains of the same dimension has zero kernel).
3. General local rings: Hamann, On power-invariance, Theorem 4.

*Acceptance.*

- Used only to pass between deformation rings with and without one extra formal variable (fixed versus unfixed determinant, GK14 Remark 5.2.2).
- The Lean statement takes an arbitrary ring isomorphism of power series rings, not one over a fixed base.

*Sources.* BHHMS23, Lemma 8.1.2, p. 88: For local rings R, S, an isomorphism of power series rings in one variable over R and over S implies R ≅ S; attributed to Hamann, Theorem 4. HAM75, Theorem 4: Power-invariance of local rings, as recorded in BHHMS Lemma 8.1.2.

*Needs:* `PowerSeries` (mathlib); `IsLocalRing` (mathlib); `IsRegularLocalRing` (mathlib); DeformationAndDerivedPatchingAlgebra `R03.1/cohen-series-presentation` (Cohen power-series presentations); DeformationAndDerivedPatchingAlgebra `R03.3/regular-local-domain` (Regular local rings are domains).

<a id="gk1-patched-deformation-ring"></a>

### 1.2 The patched local deformation ring R∞

**Construction** (`GK.1/patched-deformation-ring`). Planet: *Patched deformation ring*. For a generic global datum and integers q ≥ [F : ℚ], put R^loc = (⊗̂\_{w∈S∖S\_p} R\_{r̄\_w}^{ψ\_w}) ⊗̂ (⊗̂\_{w∈S\_p∖{v}} R\_{r̄\_w}^{(0,−1),τ\_w,ψ\_w}) ⊗̂ R\_{r̄\_v}^{ψ\_v} over W(𝔽), where R^{ψ\_w} is the framed deformation ring of r̄\_w with determinant ε^{−1}ψ\_w and R^{(0,−1),τ\_w,ψ\_w} its reduced p-torsion-free quotient of parallel Hodge–Tate weights (0, −1) and inertial type τ\_w; R∞ = R^loc⟦X₁, …, X\_{q−[F:ℚ]+|S|−1}⟧ and S∞ = W(𝔽)⟦x₁, …, x\_{4|S|+q−1}⟧ with a local W(𝔽)-algebra map S∞ → R∞. Then R\_{r̄\_w}^{ψ\_w} ≅ W(𝔽)⟦X₁, X₂, X₃⟧ for w ∈ S ∖ S\_p, R\_{r̄\_v}^{ψ\_v} ≅ W(𝔽)⟦X₁, …, X\_{3+3f}⟧, R\_{r̄\_w}^{(0,−1),τ\_w,ψ\_w} ≅ R\_{r̄\_w^∨}^{(1,0),τ\_w^∨,ψ\_w^{−1}} ≅ W(𝔽)⟦X₁, …, X\_{3+[F\_w:ℚ\_p]}⟧ for w ∈ S\_p ∖ {v}, and consequently R∞ ≅ R\_{r̄\_v}^{ψ\_v}⟦X₁, …, X\_{4(|S|−1)+q−f}⟧ ≅ W(𝔽)⟦X₁, …, X\_{4|S|+q−1+2f}⟧; in particular dim R∞ − dim S∞ = 2f.

*Hypotheses and conventions.*

- For a fixed Hodge and inertial type, the unfixed-determinant lifting ring is the fixed-determinant ring with one unramified determinant variable (GK14 Remark 5.2.2). The analogous one-variable assertion is not made for the unrestricted local deformation ring at v, where determinant characters have ramified directions as well.
- Formal smoothness of R\_{r̄\_w}^{ψ\_w} for w ∈ S ∖ S\_p is a hypothesis of the datum; for R\_{r̄\_v}^{ψ\_v} BHHMS deduce it from genericity of r̄\_v (the reason, supplied here, is that H²(G\_{F\_v}, ad⁰ r̄\_v) vanishes by local duality).
- The structure of the potentially Barsotti–Tate rings at w ∈ S\_p ∖ {v} is EGS15 Theorem 7.2.1(2), a recorded gap owned by the pending design LocalGaloisDeformationRingsPartII (issue #3432).

*Proof outline.*

1. Build R^loc and R∞ as completed tensor products and power series rings of the local lifting rings of LocalGaloisDeformationRings R08.1 with fixed determinant (R08.1/local-fixed-determinant).
2. Away from p: formal smoothness of the unfixed ring gives W(𝔽)⟦X₁, …, X₄⟧; fixing the determinant and cancelling one variable gives three variables.
3. At v: genericity gives H²(G\_{F\_v}, ad⁰ r̄\_v) = 0 by local duality (ad⁰ r̄\_v has no ω-twist of the trivial character as a quotient), so the fixed-determinant ring is formally smooth of relative dimension 3 + 3f (R08.1/local-tangent-obstruction).
4. At w ∈ S\_p ∖ {v}: duality of Galois representations identifies the (0, −1) ring of r̄\_w with the (1, 0) ring of r̄\_w^∨, which is a power series ring in 3 + [F\_w : ℚ\_p] variables (EGS15 Theorem 7.2.1(2), the gap).
5. Count: Σ\_{w∈S\_p} [F\_w : ℚ\_p] = [F : ℚ] since p is unramified in F, so the number of variables over R\_{r̄\_v}^{ψ\_v} is 3|S∖S\_p| + Σ\_{w∈S\_p∖{v}}(3 + [F\_w:ℚ\_p]) + q − [F:ℚ] + |S| − 1 = 4(|S| − 1) + q − f, and adding 3 + 3f gives 4|S| + q − 1 + 2f.

*Uses.*

- [1.3 Type and Hodge–Tate quotients of the patched ring](#gk1-type-quotients): Type quotients R∞^{λ,τ} are base changes of R∞.
- [1.5 The patching functor of Shimura curves at v](#gk1-shimura-curve-patching-functor): The patched modules are R∞-modules.
- [5.1 Gelfand–Kirillov dimension of the weighted representation (BHHMS Theorem 1.10)](#gk5-patched-gk-dimension): The equality dim R∞ − dim S∞ = 2f gives the grade 2f of the big patched module.

*API.*

- `localDeformationRing` (constructor): R^loc as the completed tensor product of the fixed-determinant local rings with the type quotients at w ∈ S\_p ∖ {v}.
- `patchedRing` (constructor): R∞ = R^loc⟦X₁, …, X\_{q−[F:ℚ]+|S|−1}⟧.
- `auxiliaryRing` (constructor): S∞ = W(𝔽)⟦x₁, …, x\_{4|S|+q−1}⟧ with the local map S∞ → R∞.
- `patchedRingNumVars` (data): The number 4|S| + q − 1 + 2f of variables of R∞ over W(𝔽), with auxiliaryRingNumVars = 4|S| + q − 1 for S∞ (suggested Lean file).
- `patchedRing_equiv_powerSeries` (characterisation): R∞ ≅ W(𝔽)⟦X₁, …, X\_{4|S|+q−1+2f}⟧ as local W(𝔽)-algebras.
- `patchedRing_dim_sub` (relation): Krull dim R∞ − Krull dim S∞ = 2f.
- `localRing_at_v_formallySmooth` (characterisation): R\_{r̄\_v}^{ψ\_v} ≅ W(𝔽)⟦X₁, …, X\_{3+3f}⟧ for generic r̄\_v.
- `typeRing_dual` (equivalence): R\_{r̄\_w}^{(0,−1),τ\_w,ψ\_w} ≅ R\_{r̄\_w^∨}^{(1,0),τ\_w^∨,ψ\_w^{−1}} by dualising lifts.

*Checks (unit tests).*

- `patchedRing_numVars_small` (computation): For f = 1, |S| = 1 and q = 1 the ring R∞ has 4·1 + 1 − 1 + 2 = 6 variables and S∞ has 4 variables.
- `patchedRing_numVars_identity` (computation): (3 + 3f) + (4(|S| − 1) + q − f) = 4|S| + q − 1 + 2f for all |S| ≥ 1, q ≥ f.
- `unfixedDeterminant_extraVariable` (non-example): A fixed Hodge/inertial-type quotient gains one unramified determinant variable when its determinant is released (GK14 Remark 5.2.2). For the unrestricted factor at v, local class field theory gives f + 1 determinant directions for p > 2; treating this factor as a one-variable extension of its fixed-determinant ring gives the wrong dimension.
- `patchedRing_trivialPrime` (degenerate): If S = {v} (so F has a single place above p, f = [F:ℚ]) then R∞ = R\_{r̄\_v}^{ψ\_v}⟦X₁, …, X\_{q−f}⟧.

*Acceptance.*

- The variable count 4|S| + q − 1 + 2f and the difference 2f are checked arithmetically.
- The potentially Barsotti–Tate rings at w ∈ S\_p ∖ {v} are taken from the gap owner, not reproved.

*Sources.* BHHMS23, §8.1, (63) and the paragraph before it, pp. 88–89: The local ring R^loc, the patched ring R∞ as a power series ring over it in q − [F:ℚ] + |S| − 1 variables, the formal smoothness of the factors, and the resulting presentation of R∞ as a power series ring over W(𝔽) in 4|S| + q − 1 + 2[F\_v:ℚ\_p] variables. GK14, §5.4.1 and Remark 5.2.2: The patched ring as a power series ring over the completed tensor product of local framed rings with fixed determinant, and the relation between fixed and unfixed determinant rings by one formal variable. EGS15, §6.4, p. 36: The patching data: integers g, q, the ring S∞ in 4#S + q − 1 variables, R∞ a power series ring over the local ring and the map S∞ → R∞.

*Needs:* [0.1 The generic global datum of Breuil–Herzig–Hu–Morra–Schraen](#gk0-generic-global-datum); [1.1 Cancellation of a power-series variable (Hamann)](#gk1-power-series-cancellation); LocalGaloisDeformationRings `R08.1/local-lifting-ring` (The local framed deformation ring); LocalGaloisDeformationRings `R08.1/local-fixed-determinant` (Fixing the determinant of local lifts); LocalGaloisDeformationRings `R08.1/local-tangent-obstruction` (Tangent and obstruction description of local lifting rings); GlobalGaloisDeformations `R04.3/local-to-global-presentation` (Presentation of the global ring over the local rings); GlobalGaloisDeformations `R04.5/taylor-wiles-generator-count` (Generator counts at Taylor–Wiles levels); `MvPowerSeries` (mathlib).

<a id="gk1-type-quotients"></a>

### 1.3 Type and Hodge–Tate quotients of the patched ring

**Definition** (`GK.1/type-quotients`). For a tame inertial type τ of I\_{F\_v} and λ = ((a\_j, b\_j))\_{0≤j&lt;f} with a\_j > b\_j, let R\_{r̄\_v^∨}^{λ,τ} be the reduced p-torsion-free quotient of the framed ring R\_{r̄\_v^∨} whose Q̄\_p-points are the potentially crystalline lifts of r̄\_v^∨ of inertial type τ and labelled Hodge–Tate weights (a\_j, b\_j) at the embedding σ\_j; put R∞^{λ,τ} = R∞ ⊗\_{R\_{r̄\_v^∨}} R\_{r̄\_v^∨}^{λ,τ}, p\_{λ,τ} = ker(R∞ ↠ R∞^{λ,τ}), R̄∞^{λ,τ} = R∞^{λ,τ}/(p), and write R∞^{(a,b),τ} when λ\_j = (a, b) for all j. Because of the fixed determinant, R∞^{λ,τ} ≠ 0 forces a\_j + b\_j = 1 for all j; the cases used are λ\_j ∈ {(1, 0), (2, −1)}, and after twisting by ε, λ\_j ∈ {(2, 1), (3, 0)}.

*Hypotheses and conventions.*

- τ tame; R∞ is the patched ring of GK.1/patched-deformation-ring (whose local factor at v is a ring for r̄\_v^∨ under the duality used there).
- The domain property of R∞^{λ,τ} for the relevant λ, τ and the reducedness of R̄∞^{(2,−1)\_j,τ} come from the gap owned by LocalGaloisDeformationRingsPartII (BHHMS Proposition 4.2.1, Corollary 4.2.6).

*Proof outline.*

1. Define R\_{r̄\_v^∨}^{λ,τ} as Kisin's potentially crystalline quotient of LocalGaloisDeformationRings R08.3/pst-deformation-ring with the p-adic Hodge type given by λ and Galois type τ (R08.3/hodge-and-galois-types), after twisting by a power of ε so that the weights lie in [0, h] as R08.3 requires (for example (2, −1) becomes (3, 0)), and base change along R\_{r̄\_v^∨} → R∞.
2. The nonvanishing condition a\_j + b\_j = 1: points of the fixed-determinant ring of r̄\_v^∨ have determinant εψ\_v^{−1} (the dual of ε^{−1}ψ\_v), of labelled Hodge–Tate weight 1 at every embedding, and the labelled weight of the determinant at σ\_j is a\_j + b\_j.
3. Twisting all lifts by ε shifts every weight by (1, 1), identifying the (1,0)/(2,−1) rings with the (2,1)/(3,0) rings and changing determinants to ε³ψ\_v^{−1} (BHHMS proof of Theorem 8.3.9).

*Uses.*

- [1.4 Fixed-determinant patching functors](#gk1-fixed-determinant-patching-functor): Supports of patched modules of lattices in types are the type quotients.
- [3.2 Freeness for Serre weights and for lattices in tame types](#gk3-weight-and-type-freeness): Freeness over R∞^{(1,0),τ}.
- [4.5 Freeness of M∞(R′\_{2,j})](#gk4-adjoint-lattice-freeness): The primes p\_{(2,−1)\_j,τ}.
- [4.8 Freeness of the patched glued lattices (BHHMS Theorem 1.8)](#gk4-glued-lattice-freeness): Intersections ∩\_{λ,τ} p\_{λ,τ} and the ring R∞^{≤(3,0),σ\_v}.

*API.*

- `typeQuotient` (constructor): R∞^{λ,τ} for λ = ((a\_j, b\_j)) and tame τ, with the quotient map from R∞.
- `typePrime` (data): p\_{λ,τ} = ker(R∞ ↠ R∞^{λ,τ}); a prime ideal whenever R∞^{λ,τ} is a domain.
- `typeQuotient_points` (characterisation): A map R∞ → O′ factors through R∞^{λ,τ} iff the induced lift of r̄\_v^∨ is potentially crystalline of type τ with labelled weights λ.
- `typeQuotient_eq_zero_of_weight_sum` (characterisation): R∞^{λ,τ} = 0 unless a\_j + b\_j = 1 for every j.
- `typeQuotient_twist` (equivalence): Twisting by ε identifies R∞^{λ,τ} with R∞^{λ+(1,1),τ} for the ring with determinant ε³ψ\_v^{−1}.
- `typeQuotient_dim` (relation): When nonzero, Krull dim R∞^{(1,0),τ} = dim S∞ = 4|S| + q.

*Checks (unit tests).*

- `typeQuotient_barsottiTate` (compatibility): λ = (1, 0) at every embedding gives potentially Barsotti–Tate lifts of type τ.
- `typeQuotient_badWeights` (degenerate): λ\_j = (2, 0) for some j gives the zero ring (a\_j + b\_j = 2 ≠ 1).
- `typeQuotient_dim_count` (computation): 1 + (3 + f) + 4(|S| − 1) + q − f = 4|S| + q: the type quotient has the dimension of S∞.
- `typeQuotient_not_crystalline` (non-example): For τ trivial and λ\_j = (2, −1) at one embedding, a nonzero characteristic-zero point is crystalline but not Barsotti–Tate: its labelled Hodge–Tate weights differ from (1, 0). This point cannot factor through the Barsotti–Tate quotient. The test makes no nonzero-point assertion for a zero quotient.

*Acceptance.*

- The determinant condition a\_j + b\_j = 1 is part of the API and is tested.
- The domain property is cited from the gap owner, not asserted in the definition.

*Sources.* BHHMS23, (69), §8.2, p. 91; proof of Theorem 8.3.9, p. 101: The quotients R∞^{λ,τ} = R∞ ⊗ R\_{r̄\_v^∨}^{λ,τ} for tame τ and labelled Hodge–Tate weights λ, nonzero only if a\_j + b\_j = 1, with the notations R∞^{(a,b),τ} and reduction mod p; twisting by ε replaces (1,0), (2,−1) by (2,1), (3,0). EGS15, §6.1, pp. 32–33: The quotients R^{ψ,τ} and R^{ψ,σ} of the local deformation ring attached to an inertial type (Hodge type 0) and to a Serre weight, and their base change to R∞.

*Needs:* [1.2 The patched local deformation ring R∞](#gk1-patched-deformation-ring); LocalGaloisDeformationRings `R08.3/pst-deformation-ring` (Potentially semistable deformation rings of fixed type); LocalGaloisDeformationRings `R08.3/hodge-and-galois-types` (p-adic Hodge types and Galois types); LocalGaloisDeformationRings `R08.3/pcris-generic-smooth` (Potentially crystalline rings are generically smooth).

<a id="gk1-fixed-determinant-patching-functor"></a>

### 1.4 Fixed-determinant patching functors

**Definition** (`GK.1/fixed-determinant-patching-functor`). Planet: *Patching functor*. Let K = GL₂(O\_{F\_v}) (more generally a product of compact open subgroups of GL₂ or of units of quaternion division algebras at finitely many places), R∞ = R⟦x₁, …, x\_h⟧ over a completed tensor product R of framed local deformation rings, and C\_Z′ a Serre subcategory of the category of continuous representations of K on finitely generated O-modules with central character lifting (ε det ρ̄)|\_I ∘ Art. A fixed-determinant patching functor is a covariant exact functor M∞ from C\_Z′ to finitely generated R∞-modules (coherent sheaves on Spf R∞) such that: (1) for every σ, M∞(σ) is supported on the fixed-determinant locus X∞^{ψ\_σ}; (2) for every K-stable O-lattice σ°(τ) in σ(τ) for an inertial type τ, M∞(σ°(τ)) is p-torsion free, supported on R∞^{ψ,τ} and maximal Cohen–Macaulay over it; (3) for every Serre weight σ (an irreducible representation killed by ϖ), M∞(σ) is supported on the special fibre of R∞^{ψ,σ} and maximal Cohen–Macaulay over it. It is minimal if M∞(σ°(τ)) is locally free of rank one over the generic fibre whenever that generic fibre is regular.

*Hypotheses and conventions.*

- Here R∞^{ψ,τ} is the potentially crystalline Hodge type 0 (that is, weights (1,0) after BHHMS's normalisation) quotient and R∞^{ψ,σ} the crystalline quotient of Hodge type σ.
- Maximal Cohen–Macaulay is in the sense of DeformationAndDerivedPatchingAlgebra R03.3: depth equals the dimension of the ring over which it is taken.

*Proof outline.*

1. Take EGS15 Definitions 6.1.1 and 6.1.3 verbatim in content, specialised to one place v with K = GL₂(O\_{F\_v}) and the BHHMS central character ψ^{−1}|I\_{F\_v}.
2. Lemma (EGS15 6.1.4): if X∞^{ψ,τ} is regular then M∞(σ°(τ)) is free over it; if its generic fibre is regular then M∞(σ°(τ))[1/p] is locally free. Proof: maximal Cohen–Macaulay modules over regular local rings are free by Auslander–Buchsbaum (R03.3/free-of-maximal-depth-regular-local).
3. Extend from finite length objects to finitely generated ones by M∞(σ) = lim\_n M∞(σ/ϖⁿσ) (EGS15 §6.4).

*Uses.*

- [1.5 The patching functor of Shimura curves at v](#gk1-shimura-curve-patching-functor): The Shimura-curve construction produces such a functor.
- [3.1 Patched modules of finite length representations are maximal Cohen–Macaulay](#gk3-patched-maximal-cohen-macaulay): Condition (3) and exactness give maximal Cohen–Macaulayness for every finite length σ.
- [3.2 Freeness for Serre weights and for lattices in tame types](#gk3-weight-and-type-freeness): Condition (2) with regular type loci gives freeness.

*API.*

- `FixedDetPatchingFunctor` (structure): An exact additive functor from the category of continuous K-representations on finite O-modules with the fixed central character to finitely generated R∞-modules, with the three support and Cohen–Macaulay fields.
- `FixedDetPatchingFunctor.map_exact` (characterisation): Short exact sequences of K-representations go to short exact sequences of R∞-modules.
- `FixedDetPatchingFunctor.free_of_regular` (relation): If R∞^{ψ,τ} is regular then M∞(σ°(τ)) is free over it (EGS15 Lemma 6.1.4).
- `FixedDetPatchingFunctor.locallyFree_generic` (relation): If R∞^{ψ,τ}[1/p] is regular then M∞(σ°(τ))[1/p] is locally free over it.
- `FixedDetPatchingFunctor.extend` (constructor): The extension to finitely generated objects by inverse limits over σ/ϖⁿσ, still exact.
- `FixedDetPatchingFunctor.IsMinimal` (data): The minimality predicate: rank one over regular generic fibres of type loci.

*Checks (unit tests).*

- `patchingFunctor_zero` (degenerate): The zero functor satisfies all three conditions (the zero module is maximal Cohen–Macaulay by convention); nonvanishing is not part of the definition.
- `patchingFunctor_free_regular` (computation): Over a regular type locus A = W(𝔽)⟦X₁, …, X\_n⟧, a maximal Cohen–Macaulay module is A^r for some r.
- `patchingFunctor_nonMCM` (non-example): A^r ⊕ A/(X₁) is supported on Spec A but not maximal Cohen–Macaulay over A, so it cannot be a value M∞(σ°(τ)).
- `patchingFunctor_torsion` (non-example): A module with nonzero p-torsion, such as A/(p) ⊕ A, cannot be M∞(σ°(τ)) by condition (2).

*Acceptance.*

- Condition (2) asserts maximal Cohen–Macaulay over the type locus R∞^{ψ,τ}, not over R∞.
- Exactness is part of the structure, and inverse limits extend the functor to finitely generated objects.

*Sources.* EGS15, §6.1: Definitions 6.1.1 and 6.1.3, Lemma 6.1.4 and the paragraph after it (minimality), pp. 32–34: A (fixed-determinant) patching functor is an exact functor to coherent sheaves on Spf R∞ whose values on lattices in types are p-torsion free maximal Cohen–Macaulay over the type locus and whose values on Serre weights are maximal Cohen–Macaulay over the special fibre of the weight locus; over regular type loci such modules are free; minimality is local freeness of rank one on regular generic fibres. BHHMS23, §1.3.2, p. 7; §8.1, p. 88: A patching functor is an exact covariant functor from continuous K-representations on finite type W(𝔽)-modules to finite type R∞-modules with Cohen–Macaulay properties, following EGS15 §6.

*Needs:* [1.3 Type and Hodge–Tate quotients of the patched ring](#gk1-type-quotients); [1.2 The patched local deformation ring R∞](#gk1-patched-deformation-ring); DeformationAndDerivedPatchingAlgebra `R03.3/cohen-macaulay-and-full-support` (CM, maximal CM and full support); DeformationAndDerivedPatchingAlgebra `R03.3/auslander-buchsbaum` (Auslander–Buchsbaum formula); DeformationAndDerivedPatchingAlgebra `R03.3/free-of-maximal-depth-regular-local` (Maximal-depth modules over a regular local ring are free); `Module.support` (mathlib).

<a id="gk1-shimura-curve-patching-functor"></a>

### 1.5 The patching functor of Shimura curves at v

**Construction** (`GK.1/shimura-curve-patching-functor`). Planet: *Shimura-curve patching functor*. Let a generic global datum be given. For each w ∈ S\_p ∖ {v} fix a tame inertial type τ\_w such that JH(σ(τ\_w^∨)) contains exactly one Serre weight σ\_w of W(r̄\_w^∨), and a GL₂(O\_{F\_w})-stable lattice σ°(τ\_w^∨), free over W(𝔽); put σ\_p^v = ⊗\_{w∈S\_p∖{v}} σ°(τ\_w^∨), a representation of ∏\_{w∈S∖{v}} U\_w through its quotient ∏\_{w∈S\_p∖{v}} GL₂(O\_{F\_w}). Taylor–Wiles–Kisin patching of the modules M(σ\_p^v ⊗ σ\_v) at auxiliary levels produces integers q ≥ [F:ℚ], the rings S∞ → R∞ of GK.1/patched-deformation-ring and an exact functor M∞ = M∞^{σ\_p^v} : σ\_v ↦ M∞(σ\_p^v ⊗ σ\_v) from continuous representations of K = GL₂(O\_{F\_v}) on finitely generated W(𝔽)-modules with central character ψ^{−1}|I\_{F\_v} to finitely generated R∞-modules, such that: M∞(σ\_v)/(x₁, …, x\_{4|S|+q−1}) ≅ M(σ\_p^v ⊗ σ\_v), compatibly with a surjection R∞/(x) ↠ R\_S^{loc-cond}, where R\_S^{loc-cond} is the global deformation ring with the specified local conditions; the action of R^loc on M∞(σ\_v) factors through the fixed-determinant quotient at v and, at w ∈ S\_p ∖ {v}, through R\_{r̄\_w}^{(0,−1),τ\_w,ψ\_w}; M∞(σ\_v) is free over S∞ when σ\_v is free over W(𝔽), and free over S∞/(p) when σ\_v is free over 𝔽; and M∞ is a fixed-determinant patching functor.

*Hypotheses and conventions.*

- The weights and types at w ∈ S\_p ∖ {v} come from EGS15 Proposition 3.5.1 (a type isolating one weight), part of the recorded gap on tame types owned by LocalGaloisDeformationRingsPartII.
- The construction uses one choice (non-principal ultrafilter or diagonal subsequence) for all σ\_v simultaneously, so that M∞ is a functor: there are only countably many isomorphism classes of finite length σ\_v (EGS15 §6.4).
- The central character convention is BHHMS's: (𝔸\_F^∞)^× acts through ψ^{−1} (BHHMS Remark 8.1.3(i)).

*Proof outline.*

1. Taylor–Wiles data Q\_N (GlobalGaloisDeformations R04.5; the generator count in Gee's convention, R04.5/taylor-wiles-generator-count, gives q − [F:ℚ] + |S| − 1 patching variables, with q ≥ [F:ℚ] for p > 5 and r̄|G\_{F(ζ\_p)} absolutely irreducible) at level N, with the spaces at auxiliary level free over the group rings of the Δ\_{Q\_N} (GK.0/non-eisenstein-freeness; R18.3/tw-freeness is its definite Taylor–Wiles instance).
2. Patch the modules M(σ\_p^v ⊗ σ\_v)\_{Q\_N} with their framings over S∞ by the finite-data extraction of DeformationAndDerivedPatchingAlgebra R03.5 (patching-extraction, patched-module, patched-ring-action), simultaneously for all finite length σ\_v; extend to finitely generated σ\_v by inverse limits.
3. The functor σ ↦ S(σ)\_𝔪 is contravariantly exact (GK.0/residual-eigenspaces); its dual multiplicity module M is covariantly exact at every auxiliary level. Patching preserves this exact system, giving covariant exactness of M∞.
4. Support at w ∈ S\_p ∖ {v}: local–global compatibility for the type σ°(τ\_w^∨) (EGS15 §6.4). Support at v for lattices in types: local–global compatibility; for Serre weights: the Gee–Kisin support statements that EGS15 §6.4 cites as Corollaries 5.6.4 and 4.5.7 of the 2012 version (the Breuil–Mézard gap).
5. Maximal Cohen–Macaulay: M∞(σ°(τ)) is finite free over the regular ring S∞ and dim R∞^{ψ,τ} = dim S∞, so Auslander–Buchsbaum gives the maximal depth (EGS15 §6.4).

*Uses.*

- [1.6 Fibres of the patching functor at the maximal ideal](#gk1-patched-fibre-identity): Its fibres at 𝔪∞ compute Hom\_K(σ\_v, π)^∨.
- [3.2 Freeness for Serre weights and for lattices in tame types](#gk3-weight-and-type-freeness): Freeness results are statements about this functor.
- [4.8 Freeness of the patched glued lattices (BHHMS Theorem 1.8)](#gk4-glued-lattice-freeness): The glued lattices L\_j are evaluated under M∞.
- BHHMS23 §§8.2–8.3: Every freeness statement is for M∞ = M∞^{σ\_p^v}.

*API.*

- `shimuraPatchingFunctor` (constructor): M∞^{σ\_p^v} as a FixedDetPatchingFunctor for the patched ring R∞, depending on the datum, σ\_p^v and the patching choice.
- `shimuraPatchingFunctor_augmentation` (compatibility): M∞(σ\_v)/(x₁, …, x\_{4|S|+q−1}) ≅ M(σ\_p^v ⊗ σ\_v), naturally in σ\_v, with a compatible surjection R∞/(x) ↠ R\_S^{loc-cond} to the global ring with the chosen local conditions. An isomorphism of these rings is not part of the patching construction.
- `shimuraPatchingFunctor_free_S` (characterisation): M∞(σ\_v) is finite free over S∞ for σ\_v free over W(𝔽), and over S∞/(p) for σ\_v free over 𝔽.
- `shimuraPatchingFunctor_support_away` (compatibility): At w ∈ S\_p ∖ {v}, R^loc acts through R\_{r̄\_w}^{(0,−1),τ\_w,ψ\_w}.
- `shimuraPatchingFunctor_functorial` (functoriality): A K-equivariant map σ\_v → σ\_v′ induces an R∞-linear map, compatibly with composition, identities and augmentation.
- `shimuraPatchingFunctor_isFixedDet` (instance): The functor satisfies the three conditions of a fixed-determinant patching functor.

*Checks (unit tests).*

- `shimuraPatching_zero` (degenerate): M∞(0) = 0.
- `shimuraPatching_nonmodularWeight` (compatibility): For a Serre weight σ\_v ∉ W(r̄\_v^∨), M∞(σ\_v) = 0 (by GK.1/patched-fibre-identity and Nakayama).
- `shimuraPatching_typeChoice` (non-example): If τ\_w were chosen with two weights of W(r̄\_w^∨) in JH(σ(τ\_w^∨)), the fibre M∞(σ\_v)/𝔪∞ would compute a space involving both weights at w, not Hom\_K(σ\_v, π)^∨ for the weighted π of GK.0; the single-weight choice is essential.
- `shimuraPatching_regularType` (computation): For a lattice σ°(τ) in a tame type τ whose ring R∞^{(1,0),τ} is regular (for example a power series ring over W(𝔽)), M∞(σ°(τ)) is free over R∞^{(1,0),τ} (patching-functor property and Auslander–Buchsbaum).

*Acceptance.*

- The functor is defined on representations of GL₂(O\_{F\_v}) only; σ\_p^v is fixed once and for all.
- The same patching choice is used for all σ\_v, so that M∞ is a functor and not just a family of modules.
- The augmentation identifies modules, while its comparison of deformation rings is initially only a surjection (GK14 §5.4.1, pp. 30–31); no early big R = big T assertion is used.

*Sources.* BHHMS23, §8.1, (62) and the definition of M∞^{σ\_p^v}, pp. 88; Remark 8.1.3, pp. 88–89: The representation σ\_p^v built from tame types at the other places above p isolating one weight each, and the patching functor σ\_v ↦ M∞(σ\_p^v ⊗ σ\_v) on representations of GL₂(O\_{F\_v}) with central character ψ^{−1}, valued in finite R∞-modules, defined as in EGS15 §§6.2 and 6.4 with the corrections of Remark 8.1.3. EGS15, §6.4, pp. 36–37: Functorial Taylor–Wiles–Kisin patching of the spaces M(σ) gives S∞, R∞, S∞ → R∞ and an exact functor with augmentation isomorphisms, support through the type and weight quotients, freeness over S∞ for free σ, and the fixed-determinant patching functor property. GK14, §5.4, pp. 30–33: The Taylor–Wiles–Kisin patching of quaternionic spaces of forms with prescribed types, giving the patched ring R∞ and patched modules supported on type and weight loci.

*Needs:* [0.3 Quaternionic spaces of mod p forms and their residual eigenspaces](#gk0-residual-eigenspaces); [0.2 The Buzzard–Diamond–Jarvis set of Serre weights](#gk0-bdj-weight-set); [0.6 The weight part of Serre's conjecture for quaternion algebras (Gee–Kisin)](#gk0-bdj-weight-theorem); [1.2 The patched local deformation ring R∞](#gk1-patched-deformation-ring); [1.3 Type and Hodge–Tate quotients of the patched ring](#gk1-type-quotients); [1.4 Fixed-determinant patching functors](#gk1-fixed-determinant-patching-functor); [0.4 Projectivity and injectivity of the residual eigenspaces over the level quotient](#gk0-non-eisenstein-freeness); GlobalGaloisDeformations `R04.5/taylor-wiles-datum` (Taylor–Wiles data); GlobalGaloisDeformations `R04.5/odd-taylor-wiles-primes` (Existence of Taylor–Wiles primes for odd p); GlobalGaloisDeformations `R04.5/taylor-wiles-generator-count` (Generator counts at Taylor–Wiles levels); DeformationAndDerivedPatchingAlgebra `R03.5/patching-extraction` (Simultaneous finite-data extraction); DeformationAndDerivedPatchingAlgebra `R03.5/patched-module` (The patched module from a limit presentation); DeformationAndDerivedPatchingAlgebra `R03.5/patched-ring-action` (Continuous action on the patched module); DeformationAndDerivedPatchingAlgebra `R03.5/free-module-patching` (Free-module patching); HilbertModularVarietiesAndShimuraCurves `R18.3/tw-freeness` (Integral diamond freeness); HilbertModularVarietiesAndShimuraCurves `R18.4/central-character-exactness` (Exact central-character localization).

<a id="gk1-patched-fibre-identity"></a>

### 1.6 Fibres of the patching functor at the maximal ideal

**Theorem** (`GK.1/patched-fibre-identity`). For every continuous representation σ\_v of K = GL₂(O\_{F\_v}) on a finitely generated W(𝔽)-module with central character ψ^{−1}|I\_{F\_v} on which some V\_v ⊆ 1 + pM₂(O\_{F\_v}), normal in K, acts trivially, there are natural isomorphisms of finite-dimensional 𝔽-vector spaces M∞(σ\_v)/𝔪∞ ≅ Hom\_{U\_v/V\_v}(σ\_v, Hom\_{U^v/V^v}(⊗\_{w∈S\_p∖{v}}σ\_w, Hom\_{G\_F}(r̄, H¹\_ét(X\_V ×\_F F̄, 𝔽))))^∨ ≅ Hom\_K(σ\_v, π)^∨ in the indefinite case, with S(V, 𝔽)[𝔪] in place of the r̄-part in the definite case, where π is the weighted representation of GK.0/infinite-level-representation and σ\_w the unique weight of W(r̄\_w^∨) in JH(σ(τ\_w^∨)). In particular M∞(σ\_v) ≠ 0 if and only if JH(σ\_v/pσ\_v) ∩ W(r̄\_v^∨) ≠ ∅.

*Hypotheses and conventions.*

- V\_w = U\_w for w ∉ S\_p and V\_w ⊆ 1 + pM₂(O\_{F\_w}) normal in GL₂(O\_{F\_w}) for w ∈ S\_p.
- The fibre is taken at the maximal ideal 𝔪∞ of R∞, after the augmentation of S∞.

*Proof outline.*

1. Reduce M∞(σ\_v) modulo (x₁, …) and then modulo the maximal ideal of R\_S^{univ}: by the augmentation isomorphism this is M(σ\_p^v ⊗ σ\_v)/𝔪, which in the indefinite case is dual to the r̄-part of S(σ\_p^v ⊗ σ\_v)[𝔪] by the evaluation isomorphism (GK.0/residual-eigenspaces).
2. Hochschild–Serre for the normal subgroup V ⊆ U (GK.0/non-eisenstein-freeness: finite quotient acting freely, non-Eisenstein localisation) identifies the r̄-part at level U with coefficients σ\_p^v ⊗ σ\_v with Hom\_{U/V}((σ\_p^v ⊗ σ\_v)/ϖ, r̄-part at level V) (BHHMS (64), citing the proofs of BDJ10 Lemma 4.11 and Breuil–Diamond Lemme 3.6.2).
3. Since JH(σ°(τ\_w^∨)/ϖ) contains only one weight σ\_w of W(r̄\_w^∨), and weights outside W(r̄\_w^∨) contribute nothing by GK.0/bdj-weight-theorem, the type lattice at w may be replaced by σ\_w; passing to the colimit over V\_v gives Hom\_K(σ\_v, π)^∨ (BHHMS (68)).
4. Nonvanishing: use M∞(σ\_v)/p ≅ M∞(σ\_v/pσ\_v), Nakayama for the finite R∞-module, and exactness. The finite-length representation σ\_v/pσ\_v has a constituent in W(r̄\_v^∨) exactly when M∞(σ\_v) is nonzero. Jordan–Hölder factors are not assigned directly to an infinite-length O-lattice.

*Acceptance.*

- Both the indefinite and the definite forms are stated.
- The nonvanishing criterion uses W(r̄\_v^∨), the weights of the dual.

*Sources.* BHHMS23, (64), (65) and (68), §8.1, pp. 89–90: The fibre of M∞^{σ\_p^v}(σ\_v) at 𝔪∞ is dual to the space of U\_v/V\_v-maps from σ\_v into the weighted r̄-part at level V, equivalently to Hom\_{GL₂(O\_{F\_v})}(σ\_v, π)^∨; by (61) and exactness M∞(σ\_v) ≠ 0 exactly when σ\_v has a constituent in W(r̄\_v^∨). EGS15, (6.1), §6.3, p. 36: For a fixed representation away from v, the module M(σ) at a level K\_v is the dual of K\_v-maps from the infinite-level module to σ\_v^∗.

*Needs:* [1.5 The patching functor of Shimura curves at v](#gk1-shimura-curve-patching-functor); [0.5 Mod p cohomology of Shimura curves at infinite level at v](#gk0-infinite-level-representation); [0.6 The weight part of Serre's conjecture for quaternion algebras (Gee–Kisin)](#gk0-bdj-weight-theorem); [0.3 Quaternionic spaces of mod p forms and their residual eigenspaces](#gk0-residual-eigenspaces); [0.4 Projectivity and injectivity of the residual eigenspaces over the level quotient](#gk0-non-eisenstein-freeness); HilbertModularVarietiesAndShimuraCurves `R18.4/non-eisenstein-integral-control` (Non-Eisenstein integral cohomology control).

<a id="gk1-big-patched-module"></a>

### 1.7 The big patched module with its GL₂(F\_v)-action

**Construction** (`GK.1/big-patched-module`). Planet: *Big patched module*. With the data of GK.1/shimura-curve-patching-functor (and the same σ\_p^v, with Hecke operators at the places of S′ forgotten), the patching construction of Dotto–Le §6.2 (a variant of Caraiani–Emerton–Gee–Geraghty–Paškūnas–Shin §2 and Scholze §9) produces a profinite R∞⟦K⟧-module M∞, K = GL₂(O\_{F\_v}), with an R∞-linear continuous action of GL₂(F\_v) extending the K-action, such that: M∞ is finite free over S∞⟦K₁/Z₁⟧; M∞ is finite projective over S∞⟦K⟧\_Z, the largest quotient of S∞⟦K⟧ on which the centre of K acts through ψ|I\_{F\_v}; M∞/𝔪∞M∞ ≅ π^∨ for the weighted π of GK.0; and for every continuous σ\_v as in GK.1 with central character ψ^{−1}|I\_{F\_v}, M∞(σ\_v) ≅ Hom^{cont}\_{W(𝔽)⟦K⟧}(M∞, σ\_v^∨)^∨, where (−)^∨ = Hom^{cont}\_{W(𝔽)}(−, E/W(𝔽)). If moreover p is inert in F, then M∞ ⊗\_{S∞} W(𝔽) ≅ Hom\_{W(𝔽)}(Ĥ¹(V^v)\_{r̄}^{ψ^{−1}}, W(𝔽)) (resp. the dual of Ŝ(V^v)\_{r̄}^{ψ^{−1}} in the definite case), compatibly with surjections R∞ ⊗\_{S∞} W(𝔽) ↠ R\_{r̄,S∪{w₁}}^ψ ↠ T̂(V^v)\_{r̄}^{ψ^{−1}}.

*Hypotheses and conventions.*

- Here K₁ = 1 + pM₂(O\_{F\_v}) and Z₁ the centre of K₁; K₁/Z₁ is a uniform pro-p group of dimension 3f (p > 2, F\_v unramified).
- The construction uses the same Taylor–Wiles data and patching choice as GK.1/shimura-curve-patching-functor, so that the two are compatible; a choice of basis of the universal deformation over R\_{r̄,S∪{w₁}}^ψ is among the choices (BHHMS §8.5).

*Proof outline.*

1. Replace K^v by U^v and the representation V of Dotto–Le §6.1 by σ\_p^v, and forget the Hecke operators T\_w at w ∈ S′ (no multiplicity one is needed); patch the dual completed cohomology at Taylor–Wiles levels as in Dotto–Le §6.2 (BHHMS proof of Theorem 8.4.1 (ii)).
2. Freeness over S∞⟦K₁/Z₁⟧ and projectivity over S∞⟦K⟧\_Z: at each auxiliary level and each finite quotient K₁/V of K₁ the dual 𝔪-localised cohomology is free over the finite group ring (GK.0/non-eisenstein-freeness, with R03.5/projectivity-by-derived-coinvariants for the finite groups); patch these finite S∞/J-modules (DeformationAndDerivedPatchingAlgebra R03.5) compatibly in J and V and pass to the inverse limit, which gives freeness over S∞⟦K₁/Z₁⟧. The same construction for definite unitary groups and definite quaternion algebras with p split is CompletedCohomologyAndLocalGlobalCompatibility R31.5 (an analogue, not a supplier here).
3. The fibre M∞/𝔪∞ ≅ π^∨ and the comparison with the patching functor M∞(σ\_v) = Hom(M∞, σ\_v^∨)^∨ follow from the construction and from (68) (GK.1/patched-fibre-identity).
4. When p is inert, reducing modulo (x₁, …) recovers the dual of the localized completed cohomology and the surjections onto the global deformation ring and the big Hecke algebra (BHHMS (84), citing CEGGPS §2, Scholze §9, Dotto–Le §6).

*Uses.*

- [5.1 Gelfand–Kirillov dimension of the weighted representation (BHHMS Theorem 1.10)](#gk5-patched-gk-dimension): Grades of M∞ over S∞⟦K₁/Z₁⟧ and R∞⟦K₁/Z₁⟧ give the lower bound.
- [5.2 Structure of π[𝔪²\_{K₁}] (BHHMS Theorem 1.9)](#gk5-second-congruence-invariants): M∞ modulo (p, x) is a sum of projective envelopes.
- [5.3 The big patched module is faithfully flat over R∞](#gk5-patched-faithful-flatness): M∞ is faithfully flat over R∞.
- [5.4 Nonzero Banach lifts of π (BHHMS Theorem 1.3)](#gk5-banach-lifts): V(x) is built from M∞.
- [5.7 Big R = big T and flatness of completed cohomology (BHHMS Theorem 1.2)](#gk5-big-r-equals-big-t): M∞ modulo the S∞ variables is the dual of completed cohomology.

*API.*

- `bigPatchedModule` (constructor): M∞ as a profinite R∞⟦K⟧-module with a continuous R∞-linear GL₂(F\_v)-action extending the K-action.
- `bigPatchedModule_free` (characterisation): M∞ is finite free over S∞⟦K₁/Z₁⟧.
- `bigPatchedModule_projective` (characterisation): M∞ is finite projective over S∞⟦K⟧\_Z.
- `bigPatchedModule_fibre` (compatibility): M∞/𝔪∞M∞ ≅ π^∨, GL₂(F\_v)-equivariantly.
- `bigPatchedModule_functor` (compatibility): M∞(σ\_v) ≅ Hom^{cont}\_{W(𝔽)⟦K⟧}(M∞, σ\_v^∨)^∨ naturally in σ\_v.
- `bigPatchedModule_completedCohomology` (compatibility): For p inert: M∞ ⊗\_{S∞} W(𝔽) ≅ the W(𝔽)-dual of Ĥ¹(V^v)\_{r̄}^{ψ^{−1}}, with the surjections R∞ ⊗\_{S∞} W(𝔽) ↠ R^ψ\_{r̄,S∪{w₁}} ↠ T̂(V^v)\_{r̄}^{ψ^{−1}}.
- `fibreBanach` (constructor): For x : R∞ → O′, V(x) = Hom^{cont}\_{O′}(M∞ ⊗\_{R∞,x} O′, E′) with its GL₂(F\_v)-action.

*Checks (unit tests).*

- `bigPatched_reduction` (compatibility): M∞/(p, x₁, …, x\_{4|S|+q−1}) is finite projective over 𝔽⟦K⟧\_Z and is ⊕\_{σ∈W(r̄\_v^∨)}(Proj\_{K/Z₁}σ^∨)^{m\_σ} with m\_σ ≥ 1 (BHHMS proof of Theorem 8.4.2).
- `bigPatched_not_finite_over_R` (non-example): M∞ is not finitely generated over R∞ alone: its fibre π^∨ at 𝔪∞ is infinite-dimensional; finiteness holds only over R∞⟦K⟧.
- `bigPatched_trivial_sigma` (computation): For σ\_v a Serre weight, Hom(M∞, σ\_v^∨)^∨ modulo 𝔪∞ is Hom\_K(σ\_v, π)^∨, agreeing with GK.1/patched-fibre-identity.
- `bigPatched_zero_iff` (degenerate): M∞ = 0 iff π = 0; for a generic global datum π ≠ 0, so M∞ ≠ 0.

*Acceptance.*

- Finite freeness is over S∞⟦K₁/Z₁⟧ and projectivity over S∞⟦K⟧\_Z, not over R∞.
- The comparison with completed cohomology is stated only when p is inert in F, as in BHHMS §8.5.

*Sources.* BHHMS23, proof of Theorem 8.4.1, part (ii), p. 104; proof of Theorem 8.4.2, p. 105; §8.5, (84), p. 108: The big patched module over R∞⟦GL₂(O\_{F\_v})⟧ with compatible GL₂(F\_v)-action, finite free over S∞⟦K₁/Z₁⟧ and finite projective over S∞⟦K⟧\_Z, with M∞/𝔪∞ ≅ π^∨ and M∞(σ\_v) recovered as the dual of continuous maps to σ\_v^∨; modulo the S∞ variables it is the dual of completed cohomology, with surjections to the global deformation ring and the big Hecke algebra. DL21, Theorem 6.2 and §6.2, pp. 54–55: A natural number h and an O[GL₂(L)]-module M∞ with an arithmetic action of the patched ring, whose fibre at the maximal ideal is the dual of π\_glob, constructed by the Taylor–Wiles method. CEGGPS16, §2, in particular the properties of M∞ listed before §2.12 and Proposition 2.13: The patched module M∞ is finite projective over S∞⟦K⟧ and carries a GL\_n(F)-action; its specialisations give admissible unitary Banach representations.

*Needs:* [1.5 The patching functor of Shimura curves at v](#gk1-shimura-curve-patching-functor); [1.6 Fibres of the patching functor at the maximal ideal](#gk1-patched-fibre-identity); [0.5 Mod p cohomology of Shimura curves at infinite level at v](#gk0-infinite-level-representation); [0.4 Projectivity and injectivity of the residual eigenspaces over the level quotient](#gk0-non-eisenstein-freeness); DeformationAndDerivedPatchingAlgebra `R03.5/patched-module` (The patched module from a limit presentation); DeformationAndDerivedPatchingAlgebra `R03.5/projectivity-by-derived-coinvariants` (Projectivity tested by derived coinvariants); CompletedCohomologyPartII `CC.3/continuous-dual-conventions` (Continuous tower duals).

<a id="layer-gk2"></a>

## Layer GK.2: Freeness over supports and noncommutative miracle flatness

Commutative algebra: freeness over the support from a submodule and quotient (BHHMS Lemma 8.2.1) and freeness of fibre products (BHHMS Lemma 8.3.8). Noncommutative algebra after Gee–Newton Appendix A: grade, depth, dimension and Cohen–Macaulay modules over Iwasawa algebras O⟦K⟧ and O⟦K⟧ ⊗̂ O⟦x₁, …, x\_r⟧ (Definitions A.2, A.5, Proposition A.4, importing Auslander regularity from CompletedCohomologyPartII CC.5), the behaviour of grade and dimension under power-series variables and along A → B (Lemmas A.15–A.19), Cohen–Macaulay transfer (Lemma A.28, Corollary A.29) and noncommutative miracle flatness (Proposition A.30).

*Layer dependencies:* `CompletedCohomologyPartII:CC.5`, `DeformationAndDerivedPatchingAlgebra:R03.3`, `ModpRepresentationsOfGL2OverLocalFields:MP.4`, `PadicMeasuresIwasawaAlgebras:L1`.

<a id="gk2-iwasawa-cohen-macaulay"></a>

### 2.1 Grade, dimension and Cohen–Macaulay modules over Iwasawa algebras

**Definition** (`GK.2/iwasawa-cohen-macaulay`). Let K be a compact p-adic analytic group and Λ = O⟦K⟧. For a finitely generated Λ-module M the grade is j\_Λ(M) = inf{i : Ext^i\_Λ(M, Λ) ≠ 0} (∞ if all vanish); when K is pro-p, Λ is local with residue field k and depth\_Λ(M) = inf{i : Ext^i\_Λ(k, M) ≠ 0}; when Λ is Auslander regular, the dimension is δ\_Λ(M) = gld(Λ) − j\_Λ(M). A nonzero finitely generated Λ-module M is Cohen–Macaulay if Ext^i\_Λ(M, Λ) ≠ 0 for exactly one i. For K torsion-free pro-p, Λ is Auslander regular with gld(Λ) = depth\_Λ(Λ) = 1 + dim K, the Auslander–Buchsbaum equality pd\_Λ(M) + depth\_Λ(M) = 1 + dim K holds, pd\_Λ(M) = max{i : Ext^i\_Λ(M, Λ) ≠ 0}, and M is Cohen–Macaulay if and only if depth\_Λ(M) = δ\_Λ(M). For K uniform, the same applies to A = Λ ⊗̂\_O O⟦x₁, …, x\_r⟧ = O⟦K × ℤ\_p^r⟧, with gld(A) = 1 + dim K + r.

*Hypotheses and conventions.*

- Left and right modules are interchanged by g ↦ g^{−1}, so the definitions do not depend on the side.
- For an arbitrary compact p-adic analytic K the ring Λ is only semilocal and need not be Auslander regular; grades are then computed on a normal open torsion-free pro-p subgroup (Lemma A.7 of Gee–Newton).

*Proof outline.*

1. Take grade, dimension and Auslander regularity of Iwasawa algebras of torsion-free uniform groups from CompletedCohomologyPartII CC.5 (Venjakob's theorem), and depth from the local ring structure of Λ for pro-p K; the Auslander–Buchsbaum equality and the formula for projective dimension over Λ are Venjakob's Theorem 6.2 and Corollary 6.3 (Gee–Newton Proposition A.4), stated here because CC.5 does not.
2. Define the Cohen–Macaulay predicate by the single nonvanishing Ext degree (Gee–Newton Definition A.5); prove its equivalence with depth = δ from the Auslander–Buchsbaum equality and the formula for projective dimension (Gee–Newton Proposition A.4 and Remark A.6, citing Venjakob Theorem 6.2 and Corollary 6.3).
3. For A = O⟦K × ℤ\_p^r⟧ apply the same statements to the uniform group K × ℤ\_p^r.
4. The commutative predicate of DeformationAndDerivedPatchingAlgebra R03.3 is used only for the comparison API in the commutative case K = {1}.

*Uses.*

- [2.5 Cohen–Macaulay transfer along A → B (Gee–Newton)](#gk2-iwasawa-cohen-macaulay-transfer): Cohen–Macaulayness transfers from S∞⟦K₁/Z₁⟧ to R∞⟦K₁/Z₁⟧.
- [2.6 Miracle flatness over Iwasawa algebras (Gee–Newton)](#gk2-iwasawa-miracle-flatness): Miracle flatness is stated for Cohen–Macaulay modules.
- [5.3 The big patched module is faithfully flat over R∞](#gk5-patched-faithful-flatness): The big patched module is Cohen–Macaulay over R∞⟦K₁/Z₁⟧.
- [5.1 Gelfand–Kirillov dimension of the weighted representation (BHHMS Theorem 1.10)](#gk5-patched-gk-dimension): Grades of the big patched module and of its fibre.

*API.*

- `grade` (constructor): j\_Λ(M) ∈ ℕ∞ for a finitely generated Λ-module M (imported from CC.5 for uniform K).
- `iwasawaDim` (constructor): δ\_Λ(M) = gld(Λ) − j\_Λ(M) for Auslander regular Λ.
- `IwasawaCohenMacaulay` (data): M ≠ 0 and Ext^i\_Λ(M, Λ) ≠ 0 for exactly one i.
- `iwasawaCohenMacaulay_iff_depth` (characterisation): For K torsion-free pro-p: CM iff depth\_Λ(M) = δ\_Λ(M).
- `free_iwasawaCohenMacaulay` (characterisation): A nonzero finite free Λ-module is Cohen–Macaulay with grade 0 and dimension gld(Λ).
- `grade_restrict_open` (compatibility): For H ⊆ K open normal, j\_{O⟦K⟧}(M) = j\_{O⟦H⟧}(M) (Gee–Newton Lemma A.7).
- `grade_shortExact` (relation): For 0 → L → M → N → 0, j(M) = min(j(L), j(N)) (Venjakob Proposition 3.6).

*Checks (unit tests).*

- `cm_free` (computation): Λ itself is Cohen–Macaulay with j = 0 and δ = 1 + dim K.
- `cm_reduction` (computation): Λ/ϖΛ is Cohen–Macaulay with j = 1 and δ = dim K (the coefficient dimension shift).
- `cm_mixed` (non-example): Λ ⊕ Λ/ϖΛ is not Cohen–Macaulay: Ext⁰ and Ext¹ into Λ are both nonzero.
- `cm_zp_quotient` (computation): For K = ℤ\_p, Λ = O⟦T⟧ and M = Λ/(T) ≅ O: j = 1, δ = 1 and depth = 1, so M is Cohen–Macaulay.
- `cm_zero` (degenerate): The zero module has grade ∞ and is not Cohen–Macaulay.
- `cm_commutative` (compatibility): For K trivial and A = O⟦x₁, …, x\_r⟧ the predicate agrees with the commutative Cohen–Macaulay predicate of DeformationAndDerivedPatchingAlgebra R03.3 on nonzero finite modules (local duality).

*Acceptance.*

- Cohen–Macaulay requires M ≠ 0 and exactly one nonvanishing Ext degree.
- Global dimension of O⟦K × ℤ\_p^r⟧ is 1 + dim K + r for torsion-free uniform K.

*Sources.* GN22, Appendix A.1: Definition A.2, Proposition A.4, Definition A.5, Remark A.6, Lemmas A.7–A.8, pp. 42–44: Grade by the first nonvanishing Ext into the ring, depth by Ext from the residue field, dimension as global dimension minus grade for Auslander regular rings; Iwasawa algebras of torsion-free pro-p groups are Auslander regular of global dimension and depth 1 + dim K with the Auslander–Buchsbaum equality; Cohen–Macaulay means a single nonvanishing Ext; grade is computed on open normal subgroups and is the minimum over a short exact sequence.

*Needs:* CompletedCohomologyPartII `CC.5/codimension-iwasawa-dimension-and-the-torsion-theorem` (Iwasawa dimension interface); DeformationAndDerivedPatchingAlgebra `R03.3/cohen-macaulay-and-full-support` (CM, maximal CM and full support); `CategoryTheory.Abelian.Ext` (mathlib); `PadicMeasuresIwasawaAlgebras:L1`.

<a id="gk2-freeness-from-extension"></a>

### 2.2 Freeness over the support from a submodule and a quotient

**Theorem** (`GK.2/freeness-from-extension`). Let A be a commutative ring, N ⊆ M A-modules and r ≥ 1 such that (i) N and M/N are free of rank r over their scheme-theoretic supports A/Ann\_A(N) and A/Ann\_A(M/N); (ii) M is generated by r elements; (iii) Ann\_A(M/N)/Ann\_A(M) ≅ A/Ann\_A(N) as A-modules. Then M is free of rank r over A/Ann\_A(M).

*Hypotheses and conventions.*

- No Noetherian or local hypothesis is needed; finiteness enters only through the generation by r elements.

*Proof outline.*

1. Replace A by A/Ann\_A(M); put I = Ann\_A(M/N) and choose a surjection f : A^r ↠ M.
2. The composite A^r → M → M/N factors through (A/I)^r; as M/N ≅ (A/I)^r, the induced surjection (A/I)^r ↠ M/N is an isomorphism (a surjective endomorphism of a finitely generated module is bijective: Stacks 05G8, Matsumura Theorem 2.4).
3. The snake lemma makes I^r → N surjective; since I ≅ A/Ann\_A(N) and N ≅ (A/Ann\_A(N))^r, the same fact makes I^r → N bijective, so f is an isomorphism.

*Acceptance.*

- Hypothesis (iii) is an isomorphism of A-modules, not merely of abelian groups.
- The conclusion is freeness over A/Ann\_A(M), with the same rank r.

*Sources.* BHHMS23, Lemma 8.2.1 and proof, pp. 90–91: If N ⊆ M with N and M/N free of rank r over their supports, M generated by r elements and Ann(M/N)/Ann(M) ≅ A/Ann(N), then M is free of rank r over its support. STACKS, Tag 05G8: A surjective module endomorphism of a finite module over a commutative ring is an isomorphism.

*Needs:* `Module.annihilator` (mathlib); `Module.Free` (mathlib); `Module.Finite` (mathlib).

<a id="gk2-fibre-product-freeness"></a>

### 2.3 Freeness of fibre products over their supports

**Theorem** (`GK.2/fibre-product-freeness`). Let R be a commutative Noetherian local ring, M₁, M₂, M nonzero R-modules each free of rank r over its scheme-theoretic support, and M\_i ↠ M surjections. Then Ann\_R(M₁ ×\_M M₂) = Ann\_R(M₁) ∩ Ann\_R(M₂), and the following are equivalent: (i) M₁ ×\_M M₂ is free of rank r over its scheme-theoretic support; (ii) Ann\_R(M) = Ann\_R(M₁) + Ann\_R(M₂); (iii) Ann\_R(M) ⊆ Ann\_R(M₁) + Ann\_R(M₂).

*Hypotheses and conventions.*

- R local is used through Nakayama to reduce to rank one; the annihilator identity holds for any ring because the maps M\_i → M are surjective.

*Proof outline.*

1. Write M\_i = (R/I\_i)^r and M = (R/I)^r with I\_i ⊆ I; after changing bases the surjections are the natural maps, so M₁ ×\_M M₂ ≅ (R/I₁ ×\_{R/I} R/I₂)^r and by Nakayama one reduces to r = 1.
2. For r = 1 the diagonal R → R/I₁ ×\_{R/I} R/I₂ has kernel I₁ ∩ I₂; it is surjective iff every pair (a, b) with a ≡ b mod I is congruent to some c modulo I₁ and I₂, iff I ⊆ I₁ + I₂ (Chinese remainder argument). Surjectivity is exactly cyclicity, i.e. freeness of rank one over R/(I₁ ∩ I₂).
3. (ii) ⇔ (iii) because I₁ + I₂ ⊆ I always holds. BHHMS cite Hu–Wang Lemma 8.11 for the rank-one case.

*Acceptance.*

- All three modules are nonzero and free of the same rank r over their supports.
- The equivalence uses the given surjections, not arbitrary maps to M.

*Sources.* BHHMS23, Lemma 8.3.8 and proof, p. 101: For nonzero modules free of rank r over their supports with surjections onto a common module, the fibre product has annihilator the intersection, and it is free of rank r over its support iff the annihilator of the target is the sum of the two annihilators, iff it is contained in that sum; the proof reduces to rank one.

*Needs:* `Module.annihilator` (mathlib); `LinearMap.ker` (mathlib); `IsLocalRing` (mathlib); `IsNoetherianRing` (mathlib); `Submodule.spanFinrank` (mathlib).

<a id="gk2-iwasawa-grade-and-power-series"></a>

### 2.4 Grade and dimension under power-series variables (Gee–Newton)

**Theorem** (`GK.2/iwasawa-grade-and-power-series`). Let K be uniform pro-p, Λ = O⟦K⟧, Ω = Λ/ϖΛ = k⟦K⟧, A = Λ ⊗̂\_O O⟦x₁, …, x\_r⟧ and B = Λ ⊗̂\_O O⟦y₁, …, y\_s⟧ with the map A → B induced by a local O-algebra map O⟦x⟧ → O⟦y⟧. For a finitely generated A-module M and x ∈ {ϖ, x₁, …, x\_r}: (1) if xM = 0 then δ\_A(M) = δ\_{A/x}(M); if M is x-torsion free then δ\_A(M) = 1 + δ\_{A/x}(M/xM), equivalently j\_A(M) = j\_{A/x}(M/xM); (2) in general j\_A(M) ≥ j\_{A/x}(M/xM), hence j\_A(M) ≥ j\_Λ(M/(x₁, …, x\_r)M) ≥ j\_Ω(M/(ϖ, x₁, …, x\_r)M); (3) for a finitely generated B-module M which is finitely generated over A, δ\_A(M) = δ\_B(M); (4) for a finitely generated Ω-module M, δ\_Ω(M) = limsup\_n log\_n dim\_k(M/J\_Ω^n M), J\_Ω the Jacobson radical.

*Hypotheses and conventions.*

- K uniform pro-p, so that A and B are Iwasawa algebras of the uniform groups K × ℤ\_p^r and K × ℤ\_p^s and hence Auslander regular.
- Statement (4) is the Gelfand–Kirillov description of the canonical dimension (Ardakov–Brown); it links grades to the growth of invariants used in MP.4.

*Proof outline.*

1. (1) Base change spectral sequence for Ext along A → A/x, with Ext^j\_A(A/x, A) = A/x concentrated in j = 1; for x-torsion free M, Levasseur's inequality j\_A(M/xM) ≥ 1 + j\_A(M) and Nakayama on the lowest Ext (Gee–Newton Lemma A.15).
2. (2) Filter M by x-power torsion; use the minimum formula for grades in short exact sequences and (1) on the graded pieces (Lemma A.16).
3. (3) J\_A B = BJ\_A and J\_AJ\_B = J\_BJ\_A because the x\_i become central (Lemma A.17); M/J\_AM is finite length over B, so the J\_A- and J\_B-adic filtrations are cofinal and the Gelfand–Kirillov dimensions (4) agree for ϖ-torsion and ϖ-torsion-free modules, hence in general by dévissage (Lemmas A.18–A.19).
4. (4) Ardakov–Brown Proposition 5.4(3), as quoted in Gee–Newton Proposition A.13 (J\_Ω-adic growth; MP.4/gk-dimension records the equivalent growth of invariants under the p-power filtration).

*Acceptance.*

- The inequality j\_A(M) ≥ j\_Ω(M/(ϖ, x)M) is stated in this direction; equality needs flatness (GK.2/iwasawa-miracle-flatness).
- (3) requires M finitely generated over A, not merely over B.

*Sources.* GN22, §A.12 (Proposition A.13), §A.14 (Lemmas A.15–A.19), pp. 45–47: Grades drop by at most the expected amount on passing to x-quotients and are preserved for x-torsion-free modules; the canonical dimension of a module finite over both A and B is the same over A and over B; over Ω it is the Gelfand–Kirillov dimension.

*Needs:* [2.1 Grade, dimension and Cohen–Macaulay modules over Iwasawa algebras](#gk2-iwasawa-cohen-macaulay); CompletedCohomologyPartII `CC.5/codimension-iwasawa-dimension-and-the-torsion-theorem` (Iwasawa dimension interface); ModpRepresentationsOfGL2OverLocalFields `MP.4/gk-dimension` (Gelfand–Kirillov dimension of an admissible representation).

<a id="gk2-iwasawa-cohen-macaulay-transfer"></a>

### 2.5 Cohen–Macaulay transfer along A → B (Gee–Newton)

**Theorem** (`GK.2/iwasawa-cohen-macaulay-transfer`). In the setting of GK.2/iwasawa-grade-and-power-series, for every B-module M, depth\_A(M) ≤ depth\_B(M); and if M is a finitely generated B-module which is finitely generated and Cohen–Macaulay as an A-module, then M is a Cohen–Macaulay B-module with depth\_B(M) = δ\_B(M) = δ\_A(M).

*Hypotheses and conventions.*

- The depth comparison is an inequality; the reverse inequality also holds but is not needed.

*Proof outline.*

1. Injective B-modules are injective over Λ because B is flat over Λ (Lemma A.21); compute Ext\_Λ(k, M) as a complex of S = k⟦y⟧-modules and compare depths over R = k⟦x⟧ and S through the forgetful functor (Lemmas A.22–A.25).
2. For complexes of modules over commutative Noetherian local rings, depth along a local map can only drop under restriction of scalars (Iyengar's depth for complexes; Lemma A.27), giving depth\_A(M) ≤ depth\_B(M) (Lemma A.28).
3. If M is CM over A: δ\_A(M) = depth\_A(M) ≤ depth\_B(M) ≤ δ\_B(M) (Auslander–Buchsbaum over the Iwasawa algebra B, GK.2/iwasawa-cohen-macaulay) and δ\_A(M) = δ\_B(M) by GK.2/iwasawa-grade-and-power-series (3), so all are equal (Corollary A.29).

*Acceptance.*

- The hypothesis is that M is finitely generated over A as well as over B.
- The conclusion identifies depth\_B(M), δ\_B(M) and δ\_A(M).

*Sources.* GN22, §A.20: Lemmas A.21–A.28 and Corollary A.29, pp. 47–49: Depth over A is at most depth over B, and a module finite over both that is Cohen–Macaulay over A is Cohen–Macaulay over B with the same dimension.

*Needs:* [2.1 Grade, dimension and Cohen–Macaulay modules over Iwasawa algebras](#gk2-iwasawa-cohen-macaulay); [2.4 Grade and dimension under power-series variables (Gee–Newton)](#gk2-iwasawa-grade-and-power-series).

<a id="gk2-iwasawa-miracle-flatness"></a>

### 2.6 Miracle flatness over Iwasawa algebras (Gee–Newton)

**Theorem** (`GK.2/iwasawa-miracle-flatness`). Planet: *Noncommutative miracle flatness*. Let K be uniform pro-p, A = O⟦K⟧ ⊗̂\_O O⟦x₁, …, x\_r⟧, Ω = k⟦K⟧, and M a finitely generated Cohen–Macaulay A-module. Then M is flat over O⟦x₁, …, x\_r⟧ if and only if j\_A(M) = j\_Ω(M/(ϖ, x₁, …, x\_r)M).

*Hypotheses and conventions.*

- M is Cohen–Macaulay over A in the sense of GK.2/iwasawa-cohen-macaulay; in particular M ≠ 0.

*Proof outline.*

1. If M is flat, (ϖ, x₁, …, x\_r) is an M-regular sequence (M/(ϖ, x)M ≠ 0 by Nakayama), and GK.2/iwasawa-grade-and-power-series (1) gives the equality of grades.
2. Conversely, for x ∈ {ϖ, x\_i} show by induction: j\_A(M) = j\_{A/x}(M/xM) (from the chain of inequalities in (2) and the hypothesis); x is M-regular (a nonzero x-power torsion submodule would have the full dimension by purity of Cohen–Macaulay modules, Venjakob Propositions 3.5 and 3.9, contradicting the grade equality); and M/xM is Cohen–Macaulay over A/x (long exact Ext sequence).
3. The regular sequence gives flatness modulo every power of the maximal ideal 𝔞 = (ϖ, x₁, …, x\_r) of B = O⟦x₁, …, x\_r⟧. For every ideal I of B, I ⊗\_B M is finitely generated over the Noetherian algebra A; since 𝔞A lies in its Jacobson radical it is 𝔞-adically separated. Apply the adic flatness criterion to these tensor modules, not just to M (Gee–Newton proof of Proposition A.30, p. 50, adapting Stacks 00MK / Matsumura Theorem 22.3). This proves B-flatness although M need not be finite over B.

*Acceptance.*

- The grade on the right is over Ω = k⟦K⟧ of the full reduction modulo (ϖ, x₁, …, x\_r).
- This is the noncommutative analogue of DeformationAndDerivedPatchingAlgebra R03.3/miracle-flatness-finite-modules, which it does not replace.

*Sources.* GN22, Proposition A.30 and proof, pp. 49–50 (BHHMS cite it as Corollary A.30): A finitely generated Cohen–Macaulay module over the Iwasawa algebra with power-series coefficients is flat over the coefficient power-series ring exactly when its grade equals the grade of its reduction modulo (ϖ, x) over k⟦K⟧. STACKS, Tag 00MK: The local criterion of flatness for ideal-separated modules.

*Needs:* [2.1 Grade, dimension and Cohen–Macaulay modules over Iwasawa algebras](#gk2-iwasawa-cohen-macaulay); [2.4 Grade and dimension under power-series variables (Gee–Newton)](#gk2-iwasawa-grade-and-power-series); `Module.Flat` (mathlib).

<a id="layer-gk3"></a>

## Layer GK.3: Freeness for Serre weights, tame types and projective lifts

For the Shimura-curve patching functor: maximal Cohen–Macaulayness of M∞(σ) for finite length σ over its support (BHHMS Lemma 8.2.2); a single rank r ≥ 1 with M∞(σ\_v) free of rank r over a formally smooth support for σ\_v ∈ W(r̄\_v^∨), and M∞(σ°(τ)) free of rank r over the domain R∞^{(1,0),τ} for lattices with irreducible cosocle in tame types (BHHMS Proposition 8.2.3, after EGS15 Theorem 10.1.1); lattices in sums of locally algebraic types are maximal Cohen–Macaulay over reduced supports and locally free after inverting p (BHHMS Corollary 8.2.4, Remark 8.2.5); and freeness of rank r of M∞(P̃\_{σ\_v}) over R∞/∩\_τ p\_τ together with π^{K₁} ≅ D₀(r̄\_v^∨)^{⊕r} (BHHMS Proposition 8.2.6). The tame-type and potentially Barsotti–Tate deformation-ring inputs are recorded gaps owned by the pending design LocalGaloisDeformationRingsPartII (issue #3432).

*Layer dependencies:* `HilbertModularVarietiesAndShimuraCurvesPartII:GK.0`, `HilbertModularVarietiesAndShimuraCurvesPartII:GK.1`, `HilbertModularVarietiesAndShimuraCurvesPartII:GK.2`, `DeformationAndDerivedPatchingAlgebra:R03.3`, `DeformationAndDerivedPatchingAlgebra:R03.6`, `LocalGaloisDeformationRings:R08.3`, `ModpRepresentationsOfGL2OverLocalFields:MP.3`, `ModpRepresentationsOfGL2OverLocalFields:MP.5`, `ModpRepresentationsOfGL2OverLocalFields:MP.8`.

<a id="gk3-patched-maximal-cohen-macaulay"></a>

### 3.1 Patched modules of finite length representations are maximal Cohen–Macaulay

**Theorem** (`GK.3/patched-maximal-cohen-macaulay`). For every smooth representation σ of K = GL₂(O\_{F\_v}) on a finite length W(𝔽)-module with central character ψ^{−1}|I\_{F\_v}, the R∞-module M∞(σ) is maximal Cohen–Macaulay over its scheme-theoretic support R∞/Ann\_{R∞}(M∞(σ)); in particular this support has no embedded associated prime.

*Hypotheses and conventions.*

- M∞ = M∞^{σ\_p^v} is the patching functor of GK.1/shimura-curve-patching-functor; finite length means killed by a power of p and of finite length as a W(𝔽)-module.

*Proof outline.*

1. If M∞(σ) = 0 there is nothing to prove. For each Serre weight σ\_v with M∞(σ\_v) ≠ 0, the patching-functor property (3) makes M∞(σ\_v) Cohen–Macaulay of Krull dimension d independent of σ\_v (all weight loci have dimension dim S∞ − 1).
2. By exactness, dim M∞(σ) is the maximum of dim M∞(σ\_v) over the constituents σ\_v of σ, so it equals d, and every nonzero M∞(σ\_v) is maximal Cohen–Macaulay over R∞/Ann\_{R∞}(M∞(σ)).
3. Being maximal Cohen–Macaulay over a fixed Noetherian local ring with residue field 𝔽 is stable under extensions (characterise depth by vanishing of Ext^i(𝔽, −) in low degrees), so M∞(σ) is maximal Cohen–Macaulay.

*Acceptance.*

- The ring over which maximal Cohen–Macaulayness is asserted is the scheme-theoretic support R∞/Ann\_{R∞}(M∞(σ)).
- The argument uses the depth characterisation by Ext from the residue field, which is extension-stable.

*Sources.* BHHMS23, Lemma 8.2.2 and proof, p. 91: For any smooth K-representation on a finite length W(𝔽)-module, the patched module is maximal Cohen–Macaulay over its scheme-theoretic support, by the dimension independence of weight loci, exactness and stability of maximal Cohen–Macaulayness under extensions.

*Needs:* [1.5 The patching functor of Shimura curves at v](#gk1-shimura-curve-patching-functor); [1.4 Fixed-determinant patching functors](#gk1-fixed-determinant-patching-functor); DeformationAndDerivedPatchingAlgebra `R03.3/cohen-macaulay-and-full-support` (CM, maximal CM and full support); DeformationAndDerivedPatchingAlgebra `R03.3/depth-lemma-and-associated-primes` (Depth lemma and CM associated primes).

<a id="gk3-weight-and-type-freeness"></a>

### 3.2 Freeness for Serre weights and for lattices in tame types

**Theorem** (`GK.3/weight-and-type-freeness`). Planet: *Freeness for weights and types*. There is an integer r ≥ 1 such that: (i) for every σ\_v ∈ W(r̄\_v^∨), M∞(σ\_v) is free of rank r over its scheme-theoretic support, which is formally smooth over 𝔽; (ii) for every tame inertial type τ with JH(σ(τ)) ∩ W(r̄\_v^∨) ≠ ∅ and every K-stable W(𝔽)-lattice σ°(τ) in σ(τ) with irreducible cosocle, M∞(σ°(τ)) is free of rank r over its scheme-theoretic support, which is the domain R∞^{(1,0),τ}.

*Hypotheses and conventions.*

- Generic global datum; M∞ = M∞^{σ\_p^v}. MP.5/finite-weight-hulls covers the principal-series intervals; the cuspidal types (second inertial shape at v) and EGS15 §§5.1, 10.1 are part of the tame-type gap.
- The structure of the tame potentially Barsotti–Tate rings (formal smoothness, domain property, special fibres; EGS15 Theorem 7.2.1) and the description of the constituents of lattices in tame types (EGS15 §5.1, Propositions 3.5.1–3.5.2) come from the gaps owned by LocalGaloisDeformationRingsPartII.

*Proof outline.*

1. By EGS15 §5.1 the lattice is σ\_J°(τ) for a unique subset J in a set P\_τ; its constituents in W(r̄\_v^∨) are indexed by a subset W ⊆ P\_τ, and for capped intervals 𝒥 ⊆ W there are subquotients σ^𝒥 with exactly those constituents (EGS15 Definition 10.1.4).
2. Supports: R∞/Ann(M∞(σ^𝒥)) is reduced, being generically reduced by dévissage (the supports of the M∞(σ\_v) are reduced, irreducible, pairwise distinct and of equal dimension, and σ^𝒥 is multiplicity free) and without embedded primes by GK.3/patched-maximal-cohen-macaulay; hence it equals the ideal I\_𝒥 of EGS15 §10.1.
3. |𝒥| ≤ 2: there is a tame type τ′ and a lattice with M∞(σ°(τ′)) ≅ M∞(σ^𝒥), and R∞^{(1,0),τ′} is regular, so M∞(σ^𝒥) is free (EGS15 Lemma 6.1.4); for |𝒥| = 2 freeness over a power series ring over 𝔽⟦X₁, X₂⟧/(X₁X₂) forces equal ranks of the two weights, and connectedness of W(r̄\_v^∨) by nonsplit extensions (EGS15 Proposition 3.5.2) gives one rank r for all weights.
4. |𝒥| > 2 with a unique minimal element 𝒥₀: M∞(σ^𝒥) is generated by r elements (as in EGS15 Theorem 10.1.1, using Le's Lemma 4.5 in place of EGS15 Lemma 10.1.13), and GK.2/freeness-from-extension with N = M∞(σ^{{𝒥₀}}) gives freeness; with two minimal elements, write M∞(σ^𝒥) as a fibre product over smaller capped intervals and use GK.2/fibre-product-freeness.
5. (ii): for 𝒥 = W this gives M∞(σ\_J°(τ))/p free of rank r over R̄∞^{(1,0),τ}; lift a basis by Nakayama to a surjection (R∞^{(1,0),τ})^r ↠ M∞(σ°(τ)) which is an isomorphism mod p; its kernel satisfies p·ker = ker because M∞(σ°(τ)) is p-torsion free, so the kernel vanishes.

*Acceptance.*

- One rank r serves all modular weights and all lattices in (ii).
- The supports in (ii) are the type quotients R∞^{(1,0),τ}, domains by the gap owner's theorem.

*Sources.* BHHMS23, Proposition 8.2.3 and proof, pp. 91–92: A single rank r ≥ 1 such that patched modules of modular Serre weights are free of rank r over formally smooth supports, and patched modules of lattices with irreducible cosocle in tame types meeting the modular weights are free of rank r over domain supports; proved along EGS15 Theorem 10.1.1 by induction over capped intervals. EGS15, Theorem 10.1.1, §10.1, Definition 10.1.4, Proposition 10.1.11, Lemma 6.1.4, Propositions 3.5.1–3.5.2: The case r = 1 (multiplicity one) by the same induction; freeness over regular type loci; the existence of types isolating one or containing all modular weights. LE19, Lemma 4.5: For M″ ⊆ M′ ⊆ M over a local ring with M′/M″ and M′ minimally generated by the same number of elements, M″ ⊆ 𝔪M, and M/M″ and M are minimally generated by the same number of elements if M is finitely generated.

*Needs:* [1.5 The patching functor of Shimura curves at v](#gk1-shimura-curve-patching-functor); [1.4 Fixed-determinant patching functors](#gk1-fixed-determinant-patching-functor); [1.3 Type and Hodge–Tate quotients of the patched ring](#gk1-type-quotients); [0.2 The Buzzard–Diamond–Jarvis set of Serre weights](#gk0-bdj-weight-set); [3.1 Patched modules of finite length representations are maximal Cohen–Macaulay](#gk3-patched-maximal-cohen-macaulay); [2.2 Freeness over the support from a submodule and a quotient](#gk2-freeness-from-extension); [2.3 Freeness of fibre products over their supports](#gk2-fibre-product-freeness); DeformationAndDerivedPatchingAlgebra `R03.3/free-of-maximal-depth-regular-local` (Maximal-depth modules over a regular local ring are free); ModpRepresentationsOfGL2OverLocalFields `MP.5/finite-weight-hulls` (Finite principal series and finite injective hulls).

<a id="gk3-locally-algebraic-lattices"></a>

### 3.3 Lattices in sums of locally algebraic types

**Theorem** (`GK.3/locally-algebraic-lattices`). Let σ = ⊕\_{i=1}^m σ\_i^{n\_i} with m, n\_i ≥ 1, where the σ\_i = σ\_i^{sm} ⊗\_E σ\_i^{alg} are pairwise nonisomorphic absolutely irreducible locally algebraic representations of K over E, each σ\_i^{sm} ⊗ Q̄\_p in the image of the inertial local Langlands correspondence τ ↦ σ(τ), and with ∪\_i JH(σ\_i) ∩ W(r̄\_v^∨) ≠ ∅; let σ° be any K-stable W(𝔽)-lattice in σ. Then (i) M∞(σ°) is maximal Cohen–Macaulay over its scheme-theoretic support S = R∞/Ann\_{R∞}(M∞(σ°)), which is reduced; (ii) M∞(σ°) ⊗\_{W(𝔽)} E is locally free over S[1/p], which is formally smooth over E. Every irreducible tame smooth σ\_i^{sm} that is not a twist of the Steinberg representation of GL₂(k) satisfies the image hypothesis.

*Hypotheses and conventions.*

- The uses in this roadmap have tame smooth parts and algebraic parts V(α\_j) or trivial; the image hypothesis is then supplied by the tame-type gap (BHHMS Remark 8.2.5, citing Breuil–Mézard Theorem 2.1.1.4 and Emerton–Gee–Herzig Proposition 2.4.1).

*Proof outline.*

1. By exactness, M∞(σ°)[1/p] ≅ ⊕\_i M∞(σ\_i°)[1/p]^{n\_i} for lattices σ\_i° (BHHMS (71)).
2. By Taylor–Wiles–Kisin, R∞ acts on M∞(σ\_i°) through a reduced equidimensional p-torsion-free quotient R∞/I\_i whose support is a union of irreducible components (CEGGPS Lemmas 4.17–4.18, proved there for unitary groups and by the same argument here; the notion is DeformationAndDerivedPatchingAlgebra R03.6/supported-on-components). The Spec (R∞/I\_i)[1/p] are disjoint because the σ\_i are pairwise distinct, so S[1/p] ≅ ∏\_i (R∞/I\_i)[1/p] by the Chinese remainder theorem (BHHMS (72)).
3. Each (R∞/I\_i)[1/p] is a union of components of a potentially crystalline generic fibre, which is formally smooth over E (Kisin; LocalGaloisDeformationRings R08.3/pcris-generic-smooth), hence regular; S has no p-torsion, so S is reduced.
4. M∞(σ°)/p ≅ M∞(σ°/p) is Cohen–Macaulay by GK.3/patched-maximal-cohen-macaulay and p is a nonzerodivisor, so M∞(σ°) is maximal Cohen–Macaulay over S; M∞(σ°)[1/p] is Cohen–Macaulay over the regular ring S[1/p], hence locally free by Auslander–Buchsbaum.

*Acceptance.*

- The supports of the summands are disjoint after inverting p because the σ\_i are pairwise nonisomorphic.
- Local freeness is asserted after inverting p only.

*Sources.* BHHMS23, Corollary 8.2.4 and proof, (71)–(72), pp. 92–93; Remark 8.2.5, p. 93: Patched modules of lattices in sums of pairwise distinct locally algebraic types meeting the modular weights are maximal Cohen–Macaulay over reduced supports and locally free after inverting p over formally smooth generic fibres; tame non-Steinberg smooth types are in the image of the inertial local Langlands correspondence. CEGGPS16, Lemmas 4.17–4.18 (arXiv v5 numbering): Patched modules of lattices in types are supported on reduced p-torsion-free quotients whose support is a union of irreducible components, and are locally free of rank one on the regular locus of the generic fibre.

*Needs:* [3.1 Patched modules of finite length representations are maximal Cohen–Macaulay](#gk3-patched-maximal-cohen-macaulay); [3.2 Freeness for Serre weights and for lattices in tame types](#gk3-weight-and-type-freeness); [1.3 Type and Hodge–Tate quotients of the patched ring](#gk1-type-quotients); DeformationAndDerivedPatchingAlgebra `R03.6/supported-on-components` (Modules supported on a union of irreducible components); DeformationAndDerivedPatchingAlgebra `R03.3/auslander-buchsbaum` (Auslander–Buchsbaum formula); LocalGaloisDeformationRings `R08.3/pcris-generic-smooth` (Potentially crystalline rings are generically smooth); LocalGaloisDeformationRings `R08.3/pst-deformation-ring` (Potentially semistable deformation rings of fixed type).

<a id="gk3-projective-lift-freeness"></a>

### 3.4 Freeness for the projective lift of a modular Serre weight

**Theorem** (`GK.3/projective-lift-freeness`). Planet: *Freeness for projective lifts*. Let σ\_v ∈ W(r̄\_v^∨), P\_{σ\_v} = Proj\_{GL₂(k)}σ\_v and P̃\_{σ\_v} its finite free projective lift to W(𝔽)[GL₂(k)], inflated to K. Then π^{K₁} ≅ D₀(r̄\_v^∨)^{⊕r} as GL₂(k)-representations, dim\_𝔽 Hom\_K(P\_{σ\_v}, π) = r, and M∞(P̃\_{σ\_v}) is free of rank r over R∞/∩\_τ p\_τ, where τ runs over the tame inertial types with σ\_v ∈ JH(σ(τ)) and p\_τ = ker(R∞ ↠ R∞^{(1,0),τ}).

*Hypotheses and conventions.*

- r is the rank of GK.3/weight-and-type-freeness; D₀(r̄\_v^∨) is the Breuil–Paškūnas representation of ModpRepresentationsOfGL2OverLocalFields MP.3/diamond-socle.
- The upper embedding W = π^{K₁} ↪ D₀(r̄\_v^∨)^{⊕r} follows from BHHMS Proposition 8.2.6 and LMS22 Proposition 4.6. Being an isomorphism on socles alone does not prove it is an isomorphism. The reverse embedding is the independent global extension argument below.
- P̃\_{σ\_v}[1/p] ≅ ⊕\_τ σ(τ), each tame type with σ\_v ∈ JH(σ(τ)) occurring once (tame-type gap).

*Proof outline.*

1. Generation by r elements: by Nakayama and GK.1/patched-fibre-identity it suffices that dim Hom\_K(P\_{σ\_v}, π) = dim Hom\_{GL₂(k)}(P\_{σ\_v}, W) = r for W = π^{K₁}. By GK.3/weight-and-type-freeness (i), dim Hom(σ, W) = r for each modular weight; since Hom(P\_{σ\_v}, D₀/soc D₀) = 0 it suffices to embed W into D₀(r̄\_v^∨)^{⊕r}, equivalently to find a surjection (D₀^∨)^{⊕r} ↠ W^∨, which follows as in Le–Morra–Schraen Lemma 4.5 and Proposition 4.6 with 1 replaced by r.
2. For the reverse embedding, embed R′ = soc(D₀^{⊕r}) into the weighted π using the weight theorem and its multiplicity r. Put R = D₀^{⊕r}; by the defining property of D₀, R/R′ has no modular Serre weight, so Hom\_K(R/R′, π) = 0. Apply the argument of Breuil Lemma 9.2 to the finite-level spaces: localisation makes Hom(−, S)\_𝔪 exact by GK.0/non-eisenstein-freeness; the zero quotient Hom space remains zero after localisation by Nakayama. Restriction Hom(R, S)\_𝔪 → Hom(R′, S)\_𝔪 is therefore an isomorphism. Taking the residual Hecke eigenspace, the Galois multiplicity space, and the fixed weights away from v preserves this isomorphism. The socle embedding extends uniquely to R → π and is injective since every nonzero submodule of R meets its socle. Thus D₀^{⊕r} ↪ W. Both modules are finite-dimensional, so together with the upper embedding this gives W ≅ D₀^{⊕r}, without GK.4 or GK.5.
3. Support: P̃\_{σ\_v}[1/p] is the direct sum of the σ(τ), each once, so by BHHMS (71)–(72) and GK.3/weight-and-type-freeness (ii) M∞(P̃\_{σ\_v})[1/p] is free of rank r over S[1/p], S the scheme-theoretic support.
4. A surjection S^r ↠ M∞(P̃\_{σ\_v}) is an isomorphism after inverting p and M∞(P̃\_{σ\_v}) has no p-torsion, so it is injective; S = R∞/∩\_τ p\_τ because the R∞^{(1,0),τ} are domains, so the support of each M∞(σ(τ)°)[1/p] is exactly R∞/p\_τ.

*Acceptance.*

- The intersection runs over all tame types whose σ(τ) contains σ\_v, each counted once.
- The identification π^{K₁} ≅ D₀(r̄\_v^∨)^{⊕r} is part of the statement and is reused in GK.4/generation-transfer and GK.5/patched-gk-dimension.
- Prove both embeddings. The upper embedding and equality of socles alone are insufficient; the reverse embedding uses no later second-congruence or dimension result.

*Sources.* BHHMS23, Proposition 8.2.6 and proof, pp. 93–94: For a modular weight, the patched module of the projective W(𝔽)[GL₂(k)]-lift of its projective envelope is free of rank r over R∞ modulo the intersection of the potentially Barsotti–Tate type primes of the types containing the weight; the proof shows π^{K₁} ↪ D₀(r̄\_v^∨)^{⊕r}. BHHMS23, proof of Proposition 8.3.7, p. 101: The proof invokes an identification of π^{K₁} with D₀^{⊕r}. Proposition 8.2.6 explicitly supplies the upper embedding; the reverse embedding is justified separately here by the extension argument used in the proof of Theorem 8.4.1(i), p. 104. LMS22, Lemma 4.5, p. 14, and Proposition 4.6, p. 15: Under multiplicity-one hypotheses on Hom spaces into Serre weights and into lattices in tame types, no modular weight lies in the radical of D₀^∨, and there is a surjection D₀^∨(ρ) ↠ D₀^∨; BHHMS follow these arguments with 1 replaced by r. BRE14, Lemma 9.2 and its proof, pp. 54–55 of the author copy: Restriction from a finite representation to an essential subrepresentation is an isomorphism on maps into residual automorphic eigenspaces when the quotient shares no constituent with the modular socle. Exactness is obtained after non-Eisenstein localisation, and an embedding extends injectively because the subrepresentation contains the socle. Applied here with multiplicity r and with the same localized exactness for Shimura-curve cohomology.

*Needs:* [3.2 Freeness for Serre weights and for lattices in tame types](#gk3-weight-and-type-freeness); [3.3 Lattices in sums of locally algebraic types](#gk3-locally-algebraic-lattices); [1.6 Fibres of the patching functor at the maximal ideal](#gk1-patched-fibre-identity); [0.5 Mod p cohomology of Shimura curves at infinite level at v](#gk0-infinite-level-representation); ModpRepresentationsOfGL2OverLocalFields `MP.3/diamond-socle` (The finite Diamond socle modules); ModpRepresentationsOfGL2OverLocalFields `MP.5/projective-adjoint` (Adjoint tensor and finite projective weight structure); ModpRepresentationsOfGL2OverLocalFields `MP.8/projective-lattice` (The projective-cover fibre-product lattice); [0.4 Projectivity and injectivity of the residual eigenspaces over the level quotient](#gk0-non-eisenstein-freeness); [0.6 The weight part of Serre's conjecture for quaternion algebras (Gee–Kisin)](#gk0-bdj-weight-theorem).

<a id="layer-gk4"></a>

## Layer GK.4: Freeness for the glued lattices of the first-order projective envelope

Construct the lattices R′\_{2,j} ⊆ V(α\_j) ⊗ P̃\_{σ\_v}, the glued lattices L\_j = L\_{j−1} ×\_{P\_{σ\_v}} R′\_{2,j} with L\_{f−1} = R of ModpRepresentationsOfGL2OverLocalFields MP.8, and the comparison lattices T′\_{2,j}, Y\_j, N\_j for the type τ₀ of the modular weights. Prove: K₁-invariance and Loewy length at most 3 for small quotients of the first-order projective envelope (BHHMS Lemma 8.3.1); minimal generation of M∞(R′\_{2,j}) by r elements (Lemma 8.3.2); freeness for lattices in V(α\_j) ⊗ τ° with cosocle σ\_v and M∞(T′\_{2,j}/p) ≅ M∞(Y\_j) (Proposition 8.3.3, Lemma 8.3.5); freeness of M∞(R′\_{2,j}) (Theorem 8.3.4); L\_j ≡ N\_j modulo the third radical (Lemma 8.3.6); equivalence of generation for L\_j and N\_j (Proposition 8.3.7); freeness of M∞(L\_j) of rank r over R∞/∩\_{λ,τ}p\_{λ,τ} (Theorem 8.3.9, the paper's Theorem 1.8); and M∞(R) free of rank r with M∞((Proj\_{K/Z₁}σ\_v)/𝔪²\_{K₁})/𝔪∞ ≅ M∞(σ\_v)/𝔪∞ (Corollary 8.3.10, Theorem 8.3.11). The multi-type deformation ring computation (BHHMS §4.3) is a recorded gap owned by LocalGaloisDeformationRingsPartII.

*Layer dependencies:* `HilbertModularVarietiesAndShimuraCurvesPartII:GK.0`, `HilbertModularVarietiesAndShimuraCurvesPartII:GK.1`, `HilbertModularVarietiesAndShimuraCurvesPartII:GK.2`, `HilbertModularVarietiesAndShimuraCurvesPartII:GK.3`, `ModpRepresentationsOfGL2OverLocalFields:MP.3`, `ModpRepresentationsOfGL2OverLocalFields:MP.5`, `ModpRepresentationsOfGL2OverLocalFields:MP.6`, `ModpRepresentationsOfGL2OverLocalFields:MP.8`, `ModpRepresentationsOfGL2OverLocalFields:MP.9`.

<a id="gk4-glued-lattices"></a>

### 4.1 The glued lattices L\_j and the comparison lattices N\_j

**Construction** (`GK.4/glued-lattices`). Planet: *Glued lattices*. Fix σ\_v ∈ W(r̄\_v^∨); write P = P\_{σ\_v} and P̃ = P̃\_{σ\_v} for its projective envelope over GL₂(k) and the projective W(𝔽)[GL₂(k)]-lift, inflated to K = GL₂(O\_{F\_v}). For j ∈ {0, …, f − 1} let V(α\_j) = (Sym²(W(𝔽)²) ⊗ det^{−1})^{(j)}, the algebraic representation of K through the embedding σ\_j, put R\_{2,j} = V(α\_j) ⊗\_{W(𝔽)} P̃ and, with the fixed embedding ι\_j : P ↪ R\_{2,j}/pR\_{2,j} of MP.8/projective-lattice, R′\_{2,j} = {x ∈ R\_{2,j} : x mod p ∈ ι\_j(P)}: a K-stable lattice with pR\_{2,j} ⊆ R′\_{2,j} ⊆ R\_{2,j}, R′\_{2,j}/pR\_{2,j} ≅ P, (R′\_{2,j}/pR′\_{2,j})\_{K₁} ≅ P and a K-equivariant exact sequence 0 → P\_{σ\_{1,j}} ⊕ P\_{σ\_{2,j}} → R′\_{2,j}/pR′\_{2,j} → P → 0, where σ\_{1,j}, σ\_{2,j} are the weights F(λ ∓ α\_j) for σ\_v = F(λ). Put L\_{−1} = P̃ and L\_j = L\_{j−1} ×\_P R′\_{2,j} (the fibre product over the reductions modulo p), a K-stable lattice in P̃[1/p] ⊕ ⊕\_{j′≤j} R\_{2,j′}[1/p]; then L\_{f−1} is the lattice R of MP.8/projective-lattice. For a tame type τ with σ\_v ∈ JH(σ(τ)), let σ(τ)° be the image of P̃ in σ(τ) (the lattice with cosocle σ\_v), T\_{2,j} = V(α\_j) ⊗ σ(τ)°, T′\_{2,j} the image of R′\_{2,j} → R\_{2,j} ↠ T\_{2,j}, Y\_j = T′\_{2,j}/pT\_{2,j} (a quotient of P, hence of L\_{j−1}) and N\_j = L\_{j−1} ×\_{Y\_j} T′\_{2,j}. With τ = τ₀, the unique tame type with JH(σ(τ₀)) = W(r̄\_v^∨) (r̄\_v semisimple), the surjection R′\_{2,j} ↠ T′\_{2,j} induces a surjection L\_j ↠ N\_j and an exact sequence 0 → T\_{2,j} →(×p) N\_j → L\_{j−1} → 0.

*Hypotheses and conventions.*

- σ\_v = F(λ) with λ 8-deep in the lowest alcove, which genericity of r̄\_v guarantees (BHHMS Proposition 2.4.2 in MP.3).
- The existence and uniqueness of τ₀ is EGS15 Proposition 3.5.2 for semisimple r̄\_v, part of the tame-type gap.

*Proof outline.*

1. R′\_{2,j}: the natural map R′₂ → R′\_{2,j} from the lattice R′₂ of MP.8 is surjective; MP.8/lattice-coinvariants gives (R′₂/pR′₂)\_{K₁} ≅ P and hence the same for R′\_{2,j}; the exact sequence comes from the decomposition R\_{2,j}/p ≅ P ⊕ P\_{σ\_{1,j}} ⊕ P\_{σ\_{2,j}} (MP.5/projective-adjoint, BHHMS (56) and (75)).
2. L\_j: iterated fibre product (BHHMS (76)); unwinding gives the explicit description by compatible tuples (x₁, (x\_{2,j′})\_{j′≤j}) with x\_{2,j′} ≡ ι\_{j′}(x₁) mod p, which for j = f − 1 is MP.8's R.
3. T′\_{2,j}, Y\_j, N\_j: as in the proof of BHHMS Proposition 8.3.3 and before Lemma 8.3.5; the kernel of T′\_{2,j} ↠ Y\_j is pT\_{2,j}, which gives the exact sequence for N\_j (proof of BHHMS Lemma 8.3.6).

*Uses.*

- [4.3 M∞(R′\_{2,j}) is minimally generated by r elements](#gk4-adjoint-lattice-generation): Quotients of R′\_{2,j}/pR′\_{2,j}.
- [4.4 Patched lattices in V(α\_j) ⊗ τ° with cosocle σ\_v](#gk4-adjoint-type-lattices): T′\_{2,j} is a lattice of the shape treated there.
- [4.6 L\_j and N\_j agree modulo the third radical](#gk4-comparison-lattice-truncation): L\_j ↠ N\_j agrees modulo rad³.
- [4.8 Freeness of the patched glued lattices (BHHMS Theorem 1.8)](#gk4-glued-lattice-freeness): Freeness of M∞(L\_j) by induction on j.
- [4.9 Multiplicity one for the first-order projective envelope (BHHMS Theorem 8.3.11)](#gk4-second-truncation-multiplicity): L\_{f−1} = R.

*API.*

- `adjointPiece` (constructor): R\_{2,j} = V(α\_j) ⊗ P̃ with its K-action through σ\_j on V(α\_j).
- `adjointLattice` (constructor): R′\_{2,j}, the preimage of ι\_j(P) in R\_{2,j}.
- `adjointLattice_exact` (characterisation): 0 → P\_{σ\_{1,j}} ⊕ P\_{σ\_{2,j}} → R′\_{2,j}/pR′\_{2,j} → P → 0 and (R′\_{2,j}/pR′\_{2,j})\_{K₁} ≅ P.
- `gluedLattice` (constructor): L\_j for −1 ≤ j ≤ f − 1, with L\_j = L\_{j−1} ×\_P R′\_{2,j}.
- `gluedLattice_last` (compatibility): L\_{f−1} = R of MP.8/projective-lattice, hence L\_{f−1}/p ≅ (Proj\_{K/Z₁}σ\_v)/𝔪²\_{K₁}.
- `gluedLattice_surj` (relation): The projections L\_{j′} ↠ L\_j (j ≤ j′) are surjective, so every L\_j/pL\_j is a quotient of (Proj\_{K/Z₁}σ\_v)/𝔪²\_{K₁} with quotient P.
- `comparisonLattice` (constructor): T\_{2,j}, T′\_{2,j}, Y\_j and N\_j = L\_{j−1} ×\_{Y\_j} T′\_{2,j} for a tame type τ ∋ σ\_v; N\_j(τ₀) for the type of the modular weights.
- `comparisonLattice_exact` (characterisation): 0 → T\_{2,j} →(×p) N\_j → L\_{j−1} → 0, and L\_j ↠ N\_j.

*Checks (unit tests).*

- `gluedLattice_start` (degenerate): L\_{−1} = P̃, the projective lift itself.
- `gluedLattice_rank` (computation): rank\_{W(𝔽)} L\_j = (1 + 3(j + 1))·dim\_𝔽 P, since dim V(α\_j) = 3; for j = f − 1 this matches dim\_𝔽 R/pR = (3f + 1) dim\_𝔽 P (MP.8/projective-truncation).
- `adjointPiece_not_glued` (non-example): R\_{2,j}/pR\_{2,j} has cosocle σ\_v ⊕ σ\_{1,j} ⊕ σ\_{2,j}, so gluing P̃ with R\_{2,j} rather than R′\_{2,j} over P is not possible: the sublattice R′\_{2,j} is what makes the reduction modulo p map onto P.
- `comparison_tau0_unique` (computation): For f = 1 and r̄\_v semisimple generic, W(r̄\_v^∨) has two weights and τ₀ is the tame type whose σ(τ₀) has exactly these two constituents.
- `gluedLattice_f1` (compatibility): For f = 1 there is a single adjoint piece and L₀ = R.

*Acceptance.*

- The fibre products are taken over the reductions modulo p (over P, resp. Y\_j), not over the lattices.
- N\_j is formed with τ₀, the type of the modular weights, in Theorem 8.3.9.

*Sources.* BHHMS23, §8.3: definition of R′\_{2,j} and (75), p. 95; (76) and the definitions of T\_{2,j}, T′\_{2,j}, Y\_j, N\_j, pp. 98–99; choice of τ₀ before Theorem 8.3.9, p. 101: The lattices R′\_{2,j} of R\_{2,j} = V(α\_j) ⊗ P̃ with reduction P, the iterated fibre products L\_j with L\_{f−1} = R, and for a tame type containing σ\_v the lattices T′\_{2,j}, their reductions Y\_j and the fibre products N\_j, with τ₀ the type whose constituents are exactly the modular weights. BHHMS23, §1.3.3, (7), pp. 8–9: L\_j = L\_{j−1} ×\_{Proj σ} R′\_{2,j}, and Theorem 1.7: L\_{f−1}/pL\_{f−1} ≅ (Proj\_{K/Z₁}σ)/𝔪²\_{K₁}.

*Needs:* ModpRepresentationsOfGL2OverLocalFields `MP.8/projective-lattice` (The projective-cover fibre-product lattice); ModpRepresentationsOfGL2OverLocalFields `MP.8/lattice-coinvariants` (Coinvariants and reduction of the glued lattice); ModpRepresentationsOfGL2OverLocalFields `MP.5/projective-adjoint` (Adjoint tensor and finite projective weight structure); ModpRepresentationsOfGL2OverLocalFields `MP.3/tame-weight-set` (Tame Galois weights); [0.2 The Buzzard–Diamond–Jarvis set of Serre weights](#gk0-bdj-weight-set); `LinearMap.ker` (mathlib).

<a id="gk4-loewy-length-three"></a>

### 4.2 K₁-invariance and Loewy length of small quotients

**Theorem** (`GK.4/loewy-length-three`). Let Q be a quotient of (Proj\_{K/Z₁}σ\_v)/𝔪²\_{K₁}(Proj\_{K/Z₁}σ\_v) such that (a) the constituents of soc\_K(Q) occur among those of Proj\_{K/K₁}σ\_v = P (up to multiplicity) and (b) [Q/soc\_K(Q) : σ\_v] = 1. Then rad\_K(Q) and Q/S are fixed by K₁, where S is the largest σ\_v-isotypic submodule of soc\_K(Q). If moreover (c) the constituents of soc\_K(Q) lie in W(r̄\_v^∨) and (d) rad\_K(Q)/soc\_K(Q) has no constituent in W(r̄\_v^∨), then Q has Loewy length at most 3.

*Hypotheses and conventions.*

- σ\_v ∈ W(r̄\_v^∨) is 2-deep, so the first-order hull statements of MP.5 apply.

*Proof outline.*

1. Embed Q into ⊕\_i Q\_{σ\_i}, one quotient with simple socle σ\_i for each summand of soc\_K(Q); taking radicals preserves surjections (Alperin), so rad\_K(Q) ⊆ ⊕ rad\_K(Q\_{σ\_i}) and rad\_K(Q)/soc\_K(Q) ↠ rad\_K(Q\_{σ\_i})/soc\_K(Q\_{σ\_i}); reduce to simple socle.
2. If soc\_K(Q) ≇ σ\_v then [Q : σ\_v] = 1 and Q is the finite interval I(soc\_K(Q), σ\_v), fixed by K₁ by (a) (MP.5/first-order-weight-hulls, the uniqueness and K₁-triviality statement; Hu–Wang Theorem 2.30).
3. If soc\_K(Q) ≅ σ\_v then Q/σ\_v is multiplicity free with one copy of σ\_v, rad\_K(Q)/σ\_v is semisimple and embeds in the sum of weights with nonzero Ext¹\_{K/K₁} to σ\_v, so rad\_K(Q) ⊆ Q^{K₁} and Q has Loewy length 3 (MP.5/first-order-weight-hulls; Hu–Wang Corollaries 2.26 and 2.31).
4. Q/S is K₁-fixed: any weight in its socle is in soc\_K(Q) or has nonzero Ext¹\_{K/Z₁} to σ\_v, hence lies in JH(P), and [Q/S : σ\_v] = 1.
5. Under (c)–(d) and soc\_K(Q) ≇ σ\_v: all constituents of I(soc\_K(Q), σ\_v) lie in W(r̄\_v^∨) (MP.5/finite-weight-hulls with MP.3/tame-weight-set), so rad/soc = 0 and the Loewy length is 2.

*Acceptance.*

- Both conclusions (K₁-fixedness and Loewy length ≤ 3) are stated with their separate hypotheses.
- Loewy length is measured for K-representations over 𝔽.

*Sources.* BHHMS23, Lemma 8.3.1 and proof, pp. 94–95: For quotients of the first-order projective envelope whose socle constituents lie in Proj\_{K/K₁}σ\_v and with σ\_v once above the socle, the radical and the quotient by the σ\_v-isotypic socle are K₁-fixed; if moreover the socle consists of modular weights and no modular weight sits between socle and radical, the Loewy length is at most 3.

*Needs:* ModpRepresentationsOfGL2OverLocalFields `MP.5/first-order-weight-hulls` (First-order Serre-weight hulls); ModpRepresentationsOfGL2OverLocalFields `MP.5/finite-weight-hulls` (Finite principal series and finite injective hulls); ModpRepresentationsOfGL2OverLocalFields `MP.3/tame-weight-set` (Tame Galois weights); [0.2 The Buzzard–Diamond–Jarvis set of Serre weights](#gk0-bdj-weight-set).

<a id="gk4-adjoint-lattice-generation"></a>

### 4.3 M∞(R′\_{2,j}) is minimally generated by r elements

**Theorem** (`GK.4/adjoint-lattice-generation`). For every j ∈ {0, …, f − 1}, the R∞-module M∞(R′\_{2,j}) is minimally generated by r elements, r the rank of GK.3/weight-and-type-freeness.

*Hypotheses and conventions.*

- σ\_v ∈ W(r̄\_v^∨); R′\_{2,j} as in GK.4/glued-lattices.

*Proof outline.*

1. Show by induction on the length of Q that M∞(Q) is minimally generated by r elements for every nonzero quotient Q of R′\_{2,j}/pR′\_{2,j}. Length one: Q = σ\_v and GK.3/weight-and-type-freeness (i).
2. If soc\_K(Q) contains a nonmodular weight σ then M∞(Q) = M∞(Q/σ) (GK.1/patched-fibre-identity); so assume all socle constituents are modular.
3. If [rad\_K(Q)/soc\_K(Q) : σ\_v] ≠ 0, pick Q′ ⊊ Q with cosocle σ\_v not in the socle; since R′\_{2,j}/p is a quotient of R/pR ≅ (Proj\_{K/Z₁}σ\_v)/𝔪²\_{K₁} (MP.8/projective-truncation, which applies because σ\_v is 8-deep, hence 3-deep), relative projectivity (MP.9/relative-projectivity) makes Q′ a quotient of Q of smaller length; apply Le's Lemma 4.5 to M∞(Q′) ⊆ M∞(Q) with a socle weight σ′ of Q′.
4. Otherwise [Q/soc\_K(Q) : σ\_v] = 1, and by GK.4/loewy-length-three the quotient Q/S is K₁-fixed, hence a quotient of P; by the exact sequence of GK.4/glued-lattices the image of P\_{σ\_{1,j}} ⊕ P\_{σ\_{2,j}} in Q lies in S and is zero, so Q is a quotient of P and M∞(Q) is generated by r elements (GK.3/projective-lift-freeness); minimality from the quotient M∞(σ\_v).
5. Conclude for R′\_{2,j} by Nakayama.

*Acceptance.*

- Minimal generation by exactly r elements, not only generation by at most r.
- The induction is over quotients of the reduction R′\_{2,j}/pR′\_{2,j}.

*Sources.* BHHMS23, Lemma 8.3.2 and proof, p. 96: By induction on the length of quotients of R′\_{2,j}/pR′\_{2,j}, using nonmodular socle weights, relative projectivity (Proposition 7.4.3), Lemma 8.3.1 and Le's Lemma 4.5, every patched quotient is minimally generated by r elements. LE19, Lemma 4.5: The Nakayama-type comparison of minimal numbers of generators of M, M/M″ and M′/M″.

*Needs:* [4.1 The glued lattices L\_j and the comparison lattices N\_j](#gk4-glued-lattices); [4.2 K₁-invariance and Loewy length of small quotients](#gk4-loewy-length-three); [3.2 Freeness for Serre weights and for lattices in tame types](#gk3-weight-and-type-freeness); [3.4 Freeness for the projective lift of a modular Serre weight](#gk3-projective-lift-freeness); [1.6 Fibres of the patching functor at the maximal ideal](#gk1-patched-fibre-identity); ModpRepresentationsOfGL2OverLocalFields `MP.9/relative-projectivity` (Relative projectivity of all quotients); ModpRepresentationsOfGL2OverLocalFields `MP.8/projective-truncation` (The first radical truncation of a projective cover).

<a id="gk4-adjoint-type-lattices"></a>

### 4.4 Patched lattices in V(α\_j) ⊗ τ° with cosocle σ\_v

**Theorem** (`GK.4/adjoint-type-lattices`). Let σ\_v ∈ W(r̄\_v^∨), let τ° be a representation of GL₂(k) on a finite free W(𝔽)-module with τ°[1/p] absolutely irreducible and cosoc\_K(τ°) ≅ σ\_v, and fix j. A K-stable lattice L in (V(α\_j) ⊗ τ°)[1/p] with cosoc\_K L ≅ σ\_v exists and is unique up to homothety, and M∞(L) is free of rank r over its scheme-theoretic support, which is the domain R∞^{(2,−1)\_j,τ}, (2,−1)\_j meaning (2, −1) at σ\_j and (1, 0) at the other embeddings, τ the tame type with σ(τ) ≅ τ°[1/p] ⊗ Q̄\_p. For the lattices of GK.4/glued-lattices, the surjection T′\_{2,j}/pT′\_{2,j} ↠ Y\_j induces an isomorphism M∞(T′\_{2,j}/pT′\_{2,j}) ≅ M∞(Y\_j).

*Hypotheses and conventions.*

- σ\_v ∈ W(r̄\_v^∨), fixed throughout BHHMS §8.3; then σ\_v = F(λ) with λ 8-deep by genericity (BHHMS Proposition 2.4.2, MP.3); τ°[1/p] is in the image of the tame inertial local Langlands correspondence (it is a tame non-Steinberg type).
- The domain property of R∞^{(2,−1)\_j,τ} and the reducedness of its special fibre are BHHMS Proposition 4.2.1 and Corollary 4.2.6, from the gap owned by LocalGaloisDeformationRingsPartII.

*Proof outline.*

1. The constituents of τ° are those of a Diamond box D\_{μ,ε} (BHHMS Proposition 2.4.3 and Lemma 2.4.4, tame-type gap), so F(α\_j) ⊗ τ̄° is multiplicity free (MP.6/adjoint-tensor); hence the lattice with cosocle σ\_v is unique up to homothety (EGS15 Lemma 4.1.1), and it is the image L₀ of R′\_{2,j} → V(α\_j) ⊗ τ°.
2. Write 0 → W₁ → L/pL → W₂ → 0 with W₁ = (V(α\_j) ⊗ τ°)/L and W₂ = L/p(V(α\_j) ⊗ τ°). The constituents of W₁ are not modular (MP.6/adjoint-tensor and MP.3), so M∞(W₁) = 0; W₂ surjects onto a lattice τ′° in a tame type with cosocle σ\_v, and the remaining constituents are not modular, so M∞(W₂) = M∞(τ′°) and M∞(L/pL) is generated by r elements (GK.3/weight-and-type-freeness).
3. The support S of M∞(L) is R∞^{(2,−1)\_j,τ} because that ring is a domain; S/pS is reduced, hence it is the scheme-theoretic support of M∞(L/pL), and the Nakayama argument of GK.3/weight-and-type-freeness gives freeness of rank r.
4. Lemma 8.3.5: T′\_{2,j}/pT′\_{2,j} and Y\_j are L/pL and W₂ for τ° = σ(τ)°, and M∞(L/pL) = M∞(W₂) because M∞(W₁) = 0.

*Acceptance.*

- The support is the type quotient with weights (2, −1) at the single embedding σ\_j.
- Uniqueness of the lattice up to homothety is part of the statement.

*Sources.* BHHMS23, Proposition 8.3.3 and proof, pp. 96–98; Lemma 8.3.5 and proof, p. 99: For a tame type lattice τ° with cosocle σ\_v and any K-stable lattice in V(α\_j) ⊗ τ° with cosocle σ\_v, the patched module is free of rank r over a domain support; such a lattice exists and is unique up to homothety; the patched modules of T′\_{2,j}/pT′\_{2,j} and of Y\_j agree. EGS15, Lemma 4.1.1: In an irreducible representation with multiplicity-free reduction, a lattice with prescribed irreducible cosocle is unique up to homothety.

*Needs:* [4.1 The glued lattices L\_j and the comparison lattices N\_j](#gk4-glued-lattices); [3.2 Freeness for Serre weights and for lattices in tame types](#gk3-weight-and-type-freeness); [1.3 Type and Hodge–Tate quotients of the patched ring](#gk1-type-quotients); [1.6 Fibres of the patching functor at the maximal ideal](#gk1-patched-fibre-identity); ModpRepresentationsOfGL2OverLocalFields `MP.6/adjoint-tensor` (Tensoring Diamond boxes by an adjoint factor); ModpRepresentationsOfGL2OverLocalFields `MP.6/diamond-box` (The modules D\_{lambda,epsilon}); ModpRepresentationsOfGL2OverLocalFields `MP.3/tame-weight-set` (Tame Galois weights).

<a id="gk4-adjoint-lattice-freeness"></a>

### 4.5 Freeness of M∞(R′\_{2,j})

**Theorem** (`GK.4/adjoint-lattice-freeness`). For j ∈ {0, …, f − 1}, M∞(R′\_{2,j}) is free of rank r over R∞/∩\_τ p\_τ, where τ runs over the tame inertial types with σ\_v ∈ JH(σ(τ)) and p\_τ = ker(R∞ ↠ R∞^{(2,−1)\_j,τ}).

*Hypotheses and conventions.*

- As in GK.4/adjoint-type-lattices; the R∞^{(2,−1)\_j,τ} are domains (gap owner).

*Proof outline.*

1. By GK.4/adjoint-lattice-generation there is a surjection f : S^r ↠ M∞(R′\_{2,j}), S the scheme-theoretic support.
2. R′\_{2,j}[1/p] = R\_{2,j}[1/p] is the direct sum of the V(α\_j) ⊗ σ(τ), each τ once; as in GK.3/projective-lift-freeness, BHHMS (71)–(72) and the domain property give S = R∞/∩\_τ p\_τ.
3. By GK.4/adjoint-type-lattices each M∞(V(α\_j) ⊗ σ(τ)°)[1/p] is free of rank r over R∞^{(2,−1)\_j,τ}[1/p], so M∞(R′\_{2,j})[1/p] is locally free of rank r over S[1/p]; hence ker(f)[1/p] = 0 and, S having no p-torsion, ker(f) = 0.

*Acceptance.*

- The weights are (2, −1) at σ\_j and (1, 0) elsewhere.
- The rank is the same r as for Serre weights.

*Sources.* BHHMS23, Theorem 8.3.4 and proof, p. 98: The patched module of R′\_{2,j} is free of rank r over R∞ modulo the intersection of the primes of the (2, −1)\_j potentially crystalline type quotients of the tame types containing σ\_v.

*Needs:* [4.3 M∞(R′\_{2,j}) is minimally generated by r elements](#gk4-adjoint-lattice-generation); [4.4 Patched lattices in V(α\_j) ⊗ τ° with cosocle σ\_v](#gk4-adjoint-type-lattices); [3.3 Lattices in sums of locally algebraic types](#gk3-locally-algebraic-lattices); [1.3 Type and Hodge–Tate quotients of the patched ring](#gk1-type-quotients).

<a id="gk4-comparison-lattice-truncation"></a>

### 4.6 L\_j and N\_j agree modulo the third radical

**Theorem** (`GK.4/comparison-lattice-truncation`). For j ∈ {0, …, f − 1} the surjection L\_j ↠ N\_j of GK.4/glued-lattices (formed with τ₀) induces an isomorphism (L\_j/pL\_j)/rad³\_K(L\_j/pL\_j) ≅ (N\_j/pN\_j)/rad³\_K(N\_j/pN\_j).

*Hypotheses and conventions.*

- rad^i\_K denotes the i-th power of the radical of finite-dimensional K-representations over 𝔽; taking rad^i preserves surjections (Alperin, Local representation theory, §1 Proposition 4).

*Proof outline.*

1. The reductions fit into a commutative diagram of short exact sequences 0 → R\_{2,j}/p → L\_j/p → L\_{j−1}/p → 0 and 0 → T\_{2,j}/p → N\_j/p → L\_{j−1}/p → 0, with left vertical map γ identified with F(α\_j) ⊗ (P̃/p ↠ σ(τ₀)°/p), surjective; so L\_j/p ↠ N\_j/p (the map β).
2. For a quotient M of (Proj\_{K/Z₁}σ\_v)/𝔪²\_{K₁} admitting P as a quotient, M/rad^i(M) ≅ P/rad^i(P) for i = 1, 2 (MP.5/first-order-weight-hulls); L\_j/p, N\_j/p and L\_{j−1}/p are such quotients (GK.4/glued-lattices), so ker β = ker rad²(β), and the same diagram for rad² gives ker rad²(β) = ker γ.
3. It remains that ker γ ⊆ rad\_K(R\_{2,j}/pR\_{2,j}), i.e. that γ is an isomorphism on cosocles, which is the dual of the proof of BHHMS Lemma 6.3.8 (MP.6/adjoint-tensor).

*Acceptance.*

- The isomorphism is modulo rad³ of the reductions modulo p, not of the lattices.

*Sources.* BHHMS23, Lemma 8.3.6 and proof, pp. 99–100: The surjection R′\_{2,j} ↠ T′\_{2,j} induces L\_j ↠ N\_j, which is an isomorphism modulo p and modulo the third power of the K-radical.

*Needs:* [4.1 The glued lattices L\_j and the comparison lattices N\_j](#gk4-glued-lattices); ModpRepresentationsOfGL2OverLocalFields `MP.5/first-order-weight-hulls` (First-order Serre-weight hulls); ModpRepresentationsOfGL2OverLocalFields `MP.6/adjoint-tensor` (Tensoring Diamond boxes by an adjoint factor).

<a id="gk4-generation-transfer"></a>

### 4.7 Generation of M∞(L\_j) and of M∞(N\_j)

**Theorem** (`GK.4/generation-transfer`). For j ∈ {0, …, f − 1}, M∞(L\_j) is generated by r elements over R∞ if and only if M∞(N\_j) is.

*Hypotheses and conventions.*

- N\_j formed with τ₀; π the weighted representation, with π^{K₁} ≅ D₀(r̄\_v^∨)^{⊕r} (GK.3/projective-lift-freeness).

*Proof outline.*

1. By GK.1/patched-fibre-identity, generation by r elements is equivalent to dim\_𝔽 Hom\_K(L\_j, π) = r (resp. Hom\_K(N\_j, π)); since N\_j is a quotient of L\_j the forward implication is clear.
2. Conversely, suppose dim Hom\_K(L\_j, π) > r; since dim Hom\_K(σ\_v, π) = r there is h : L\_j → π not factoring through cosoc L\_j = σ\_v; choose one with [Im h : σ\_v] minimal and put Q = Im h. Minimality and relative projectivity (MP.9/relative-projectivity, applicable because L\_j/p is a quotient of L\_{f−1}/p (GK.4/glued-lattices), which is (Proj\_{K/Z₁}σ\_v)/𝔪²\_{K₁} by MP.8/projective-truncation for the 8-deep σ\_v) force [Q/soc\_K Q : σ\_v] = 1.
3. From π^{K₁} = D₀(r̄\_v^∨)^{⊕r}, soc\_K Q consists of modular weights, so Q satisfies (a)–(b) of GK.4/loewy-length-three; then rad\_K(Q) ⊆ π^{K₁}, and rad\_K Q/soc\_K Q embeds in π^{K₁}/soc\_K π, giving (c)–(d); hence Q has Loewy length ≤ 3.
4. By GK.4/comparison-lattice-truncation h factors through N\_j, contradicting the hypothesis on N\_j. (In the source this step reads dim Hom\_K(σ\_v, π) = f; the correct value is r, recorded as a source finding.)

*Acceptance.*

- The proof uses dim Hom\_K(σ\_v, π) = r (the rank), not f.
- Only the direction from N\_j to L\_j needs the Loewy-length argument.

*Sources.* BHHMS23, Proposition 8.3.7 and proof, pp. 100–101: M∞(L\_j) is generated by r elements iff M∞(N\_j) is, by translating generation into dimensions of Hom spaces into π and showing that a map from L\_j to π with image of Loewy length at most 3 factors through N\_j.

*Needs:* [4.6 L\_j and N\_j agree modulo the third radical](#gk4-comparison-lattice-truncation); [4.2 K₁-invariance and Loewy length of small quotients](#gk4-loewy-length-three); [3.4 Freeness for the projective lift of a modular Serre weight](#gk3-projective-lift-freeness); [1.6 Fibres of the patching functor at the maximal ideal](#gk1-patched-fibre-identity); ModpRepresentationsOfGL2OverLocalFields `MP.9/relative-projectivity` (Relative projectivity of all quotients); ModpRepresentationsOfGL2OverLocalFields `MP.8/projective-truncation` (The first radical truncation of a projective cover); ModpRepresentationsOfGL2OverLocalFields `MP.3/diamond-socle` (The finite Diamond socle modules).

<a id="gk4-glued-lattice-freeness"></a>

### 4.8 Freeness of the patched glued lattices (BHHMS Theorem 1.8)

**Theorem** (`GK.4/glued-lattice-freeness`). Planet: *Freeness of glued lattices*. For j ∈ {−1, …, f − 1}, M∞(L\_j) is free of rank r over R∞/∩\_{λ,τ} p\_{λ,τ}, where p\_{λ,τ} = ker(R∞ ↠ R∞^{λ,τ}), τ runs over the tame inertial types with σ\_v ∈ JH(σ(τ)), and λ = (λ\_{j′})\_{0≤j′&lt;f} over the labelled weights with λ\_{j′} ∈ {(1, 0), (2, −1)} for j′ ≤ j and λ\_{j′} = (1, 0) for j′ > j. In particular the rank does not depend on j or on σ\_v ∈ W(r̄\_v^∨).

*Hypotheses and conventions.*

- Generic global datum (p > 23); σ\_v ∈ W(r̄\_v^∨).
- The presentation of the multi-type ring R\_{r̄\_v^∨}^{≤(3,0),σ\_v} (BHHMS Proposition 4.3.1), its prime ideals (Lemma 4.3.2) and the membership p ∈ q₁^{(j),(2,1)} ∩ q₂^{(j),(2,1)} + p₂^{(j),(3,0)} (Proposition 4.3.3) are the recorded multi-type gap, owned by LocalGaloisDeformationRingsPartII; all R∞^{λ,τ} are domains by the single-type gap.

*Proof outline.*

1. Use the twist/reindexing of BHHMS proof of Theorem 8.3.9: after twisting deformations by ε the labelled weights are (2, 1) and (3, 0), the determinant is ε³ψ\_v^{−1}, and the type-index condition is σ\_v ⊗ (N\_{k/𝔽\_p} ∘ det^{−1}) ∈ JH(σ(τ)) in that proof’s reindexed notation. Keep this negative norm twist in the type-to-prime bijection as well (the positive sign in its displayed ι on p. 102 is inconsistent with the defining index set). Induct on j; j = −1 is GK.3/projective-lift-freeness.
2. Generation of M∞(N\_j): M∞(N\_j) = M∞(L\_{j−1}) ×\_{M∞(Y\_j)} M∞(T′\_{2,j}) by exactness, the three modules are free of rank r over their supports (induction, GK.4/adjoint-type-lattices), so by GK.2/fibre-product-freeness it suffices that Ann(M∞(Y\_j)) ⊆ Ann(M∞(L\_{j−1})) + Ann(M∞(T′\_{2,j})); as Ann(M∞(Y\_j)) = (p) + Ann(M∞(T′\_{2,j})) (GK.4/adjoint-type-lattices), it suffices that p ∈ Ann(M∞(L\_{j−1})) + Ann(M∞(T′\_{2,j})).
3. Use the multi-type ring R∞^{≤(3,0),σ\_v} = R∞/∩\_{λ,τ}p\_{λ,τ} ≅ S⟦X₁, …, X\_h⟧ with S an explicit completed tensor product of rings S^{(j)} modulo an ideal, the explicit primes p\_k^λ = Σ\_j p\_{k\_j}^{(j),λ\_j} indexed by k ∈ {1, 2}^f via a bijection with the types, and τ₀ ↔ k = (2, …, 2). Then Ann(M∞(T′\_{2,j})) = p₂^{λ(j)} and Ann(M∞(L\_{j−1})) ⊇ q₁^{(j),(2,1)} ∩ q₂^{(j),(2,1)}, so the needed membership is p ∈ q₁^{(j),(2,1)} ∩ q₂^{(j),(2,1)} + p₂^{(j),(3,0)}, which is BHHMS Proposition 4.3.3.
4. By GK.4/generation-transfer M∞(L\_j) is generated by r elements; as in GK.3/projective-lift-freeness M∞(L\_j)[1/p] is free of rank r over its support (BHHMS (71)–(72) with GK.4/adjoint-lattice-freeness and the induction hypothesis), so any surjection S^r ↠ M∞(L\_j) is an isomorphism.

*Acceptance.*

- The weights allowed at embeddings j′ ≤ j are (1, 0) and (2, −1); beyond j only (1, 0).
- The induction step goes through N\_j and the explicit multi-type computation, not through the intersection over all types directly (the gap noted in BHHMS §1.3.4).

*Sources.* BHHMS23, Theorem 8.3.9 and proof, pp. 101–103; Theorem 1.8 (labelled there Corollary 8.3.9), p. 8: For every j, the patched module of L\_j is free of a rank r independent of j and σ\_v over R∞ modulo the intersection of the primes of the type quotients with weights (1,0) or (2,−1) at the embeddings up to j and (1,0) beyond; the induction reduces to an explicit membership of p in a sum of ideals of the multi-type deformation ring.

*Needs:* [4.1 The glued lattices L\_j and the comparison lattices N\_j](#gk4-glued-lattices); [4.7 Generation of M∞(L\_j) and of M∞(N\_j)](#gk4-generation-transfer); [4.4 Patched lattices in V(α\_j) ⊗ τ° with cosocle σ\_v](#gk4-adjoint-type-lattices); [4.5 Freeness of M∞(R′\_{2,j})](#gk4-adjoint-lattice-freeness); [3.4 Freeness for the projective lift of a modular Serre weight](#gk3-projective-lift-freeness); [2.3 Freeness of fibre products over their supports](#gk2-fibre-product-freeness); [1.3 Type and Hodge–Tate quotients of the patched ring](#gk1-type-quotients); [3.3 Lattices in sums of locally algebraic types](#gk3-locally-algebraic-lattices).

<a id="gk4-second-truncation-multiplicity"></a>

### 4.9 Multiplicity one for the first-order projective envelope (BHHMS Theorem 8.3.11)

**Theorem** (`GK.4/second-truncation-multiplicity`). Planet: *Multiplicity one at second congruence level*. M∞(R) is free of rank r over R∞/∩\_{λ,τ} p\_{λ,τ}, with τ over the tame types with σ\_v ∈ JH(σ(τ)) and λ\_j ∈ {(1, 0), (2, −1)} for every j, and dim\_𝔽 M∞(R)/𝔪∞ = r. Consequently the surjection (Proj\_{K/Z₁}σ\_v)/𝔪²\_{K₁} ↠ σ\_v induces an isomorphism of nonzero finite-dimensional 𝔽-vector spaces M∞((Proj\_{K/Z₁}σ\_v)/𝔪²\_{K₁})/𝔪∞ ≅ M∞(σ\_v)/𝔪∞; equivalently, by GK.1/patched-fibre-identity, Hom\_K(σ\_v, π) ≅ Hom\_K((Proj\_{K/Z₁}σ\_v)/𝔪²\_{K₁}, π).

*Hypotheses and conventions.*

- σ\_v ∈ W(r̄\_v^∨); R = L\_{f−1} with R/pR ≅ (Proj\_{K/Z₁}σ\_v)/𝔪²\_{K₁} (MP.8/projective-truncation).
- Without passing to the fibre at 𝔪∞ the statement is false: exactness of M∞ makes M∞((Proj σ\_v)/𝔪²) strictly larger than M∞(σ\_v) (BHHMS Remark 8.3.12).

*Proof outline.*

1. The first assertion is GK.4/glued-lattice-freeness for j = f − 1; the fibre dimension is r because a module free of rank r over a quotient of R∞ has fibre of dimension r.
2. M∞(R/pR) = M∞(R)/p has fibre dimension r as well, and R/pR ≅ (Proj\_{K/Z₁}σ\_v)/𝔪²\_{K₁} (MP.8/projective-truncation); M∞(σ\_v) has fibre dimension r by GK.3/weight-and-type-freeness (i).
3. The map M∞((Proj σ\_v)/𝔪²) → M∞(σ\_v) is surjective by exactness, so on fibres it is a surjection between r-dimensional spaces, hence an isomorphism.

*Acceptance.*

- The isomorphism is of fibres at 𝔪∞, and both sides are nonzero of dimension r.
- The equivalent Hom statement into π is the form used in GK.5.

*Sources.* BHHMS23, Corollary 8.3.10, Theorem 8.3.11 and Remark 8.3.12, p. 103: M∞(R) is free of rank r over the intersection of the relevant type primes with fibre dimension r, and the surjection from the first-order projective envelope onto σ\_v induces an isomorphism on patched fibres; without reducing modulo 𝔪∞ this fails. BHHMS23, §1.3.2, (5)–(6), p. 7: The isomorphism of patched fibres is equivalent to Hom\_K(σ, π) ≅ Hom\_K((Proj\_{K/Z₁}σ)/𝔪²\_{K₁}, π).

*Needs:* [4.8 Freeness of the patched glued lattices (BHHMS Theorem 1.8)](#gk4-glued-lattice-freeness); [3.2 Freeness for Serre weights and for lattices in tame types](#gk3-weight-and-type-freeness); [1.6 Fibres of the patching functor at the maximal ideal](#gk1-patched-fibre-identity); ModpRepresentationsOfGL2OverLocalFields `MP.8/projective-truncation` (The first radical truncation of a projective cover).

<a id="layer-gk5"></a>

## Layer GK.5: Gelfand–Kirillov dimension, Banach lifts and big R = big T

The main global results of BHHMS §§8.4–8.5. The weighted π has Gelfand–Kirillov dimension f = [F\_v : ℚ\_p] (Theorem 8.4.1 = Theorem 1.10): the upper bound from the local criterion ModpRepresentationsOfGL2OverLocalFields MP.7/local-gk-bound, the lower bound from grades of the big patched module. π[𝔪²\_{K₁}] ≅ (⊕\_σ D̃\_σ)^{⊕r} (Theorem 8.4.2 = 1.9); M∞ is faithfully flat over R∞ (Theorem 8.4.3); every specialisation V(x) of M∞ is a nonzero admissible unitary Banach lift of π (Corollary 8.4.4 = Theorem 1.3); the r̄-part of mod p cohomology of Shimura curves (or definite forms) at infinite level at v has dimension f (Corollary 8.4.6 = Theorem 1.1, with Remark 8.4.7); and for p inert, completed cohomology and the big Hecke algebra with big R = big T, faithful flatness of the dual of completed cohomology and the complete intersection property (Corollary 8.5.1 = Theorem 1.2).

*Layer dependencies:* `HilbertModularVarietiesAndShimuraCurvesPartII:GK.0`, `HilbertModularVarietiesAndShimuraCurvesPartII:GK.1`, `HilbertModularVarietiesAndShimuraCurvesPartII:GK.2`, `HilbertModularVarietiesAndShimuraCurvesPartII:GK.3`, `HilbertModularVarietiesAndShimuraCurvesPartII:GK.4`, `CompletedCohomologyPartII:CC.3`, `CompletedCohomologyPartII:CC.8`, `DeformationAndDerivedPatchingAlgebra:R03.3`, `GlobalGaloisDeformations:R04.1`, `GlobalGaloisDeformations:R04.3`, `HilbertModularVarietiesAndShimuraCurves:R18.4`, `LocallyAnalyticDistributionsPartII:ND.6`, `ModpRepresentationsOfGL2OverLocalFields:MP.3`, `ModpRepresentationsOfGL2OverLocalFields:MP.4`, `ModpRepresentationsOfGL2OverLocalFields:MP.5`, `ModpRepresentationsOfGL2OverLocalFields:MP.6`, `ModpRepresentationsOfGL2OverLocalFields:MP.7`.

<a id="gk5-patched-gk-dimension"></a>

### 5.1 Gelfand–Kirillov dimension of the weighted representation (BHHMS Theorem 1.10)

**Theorem** (`GK.5/patched-gk-dimension`). Planet: *GK dimension of patched π*. For a generic global datum and the weighted representation π of GK.0/infinite-level-representation, dim\_{GL₂(F\_v)}(π) = f = [F\_v : ℚ\_p].

*Hypotheses and conventions.*

- dim\_{GL₂(F\_v)} is the dimension of ModpRepresentationsOfGL2OverLocalFields MP.4/gk-dimension: 3f minus the grade of π^∨ over 𝔽⟦K₁/Z₁⟧.

*Proof outline.*

1. Upper bound: verify the three hypotheses of MP.7/local-gk-bound for ρ = r̄\_v^∨. (i) JH(soc\_K π) = W(r̄\_v^∨) by the weight theorem (GK.0/bdj-weight-theorem). (ii) [π[𝔪²\_{K₁}] : σ\_v] = [soc\_K π : σ\_v] for σ\_v ∈ W(r̄\_v^∨) by GK.4/second-truncation-multiplicity in its Hom form. (iii) JH(π^{I₁}) = JH(D₁(r̄\_v^∨)): since K₁ ⊆ I₁, π^{I₁} = (π^{K₁})^{I₁} = (D₀(r̄\_v^∨)^{⊕r})^{I₁} = D₁(r̄\_v^∨)^{⊕r} by GK.3/projective-lift-freeness and MP.3/diamond-socle (BHHMS argue instead with Breuil's Lemma 9.2 and Breuil–Paškūnas Lemma 14.1); MP.7/diamond-connected (D₁ of a tame 6-deep ρ is connected) and MP.7/connected-characters turn (iii) into the connectedness hypothesis. Hence dim π ≤ f.
2. Lower bound: let M∞ be the big patched module (GK.1/big-patched-module). By GK.2/iwasawa-grade-and-power-series (2) for A = R∞⟦K₁/Z₁⟧ and MP.4/dimension-comparisons, j\_{R∞⟦K₁/Z₁⟧}(M∞) ≥ j\_{𝔽⟦K₁/Z₁⟧}(M∞/𝔪∞) = 3f − dim π (BHHMS (80)).
3. M∞ is finite free over S∞⟦K₁/Z₁⟧, so its grade there is 0 and its dimension is dim S∞ + dim K₁/Z₁; by GK.2/iwasawa-grade-and-power-series (3) its dimension over R∞⟦K₁/Z₁⟧ is the same, so j\_{R∞⟦K₁/Z₁⟧}(M∞) = dim R∞ − dim S∞ = 2f (GK.1/patched-deformation-ring; BHHMS (81)).
4. Combining, 2f ≥ 3f − dim π, so dim π ≥ f.

*Acceptance.*

- Both inequalities are proved; the lower bound uses dim R∞ − dim S∞ = 2f and 3f = dim K₁/Z₁.
- The three hypotheses of the local criterion are verified for ρ = r̄\_v^∨.

*Sources.* BHHMS23, Theorem 8.4.1 and proof, (80)–(81), pp. 104–105; Theorem 1.10, p. 10: The weighted π has Gelfand–Kirillov dimension [F\_v : ℚ\_p]: the upper bound from the local criterion (Theorem 6.4.7) whose hypotheses come from the weight theorem, multiplicity one at second congruence level and the Diamond invariants; the lower bound from grades of the big patched module over S∞⟦K₁/Z₁⟧ and R∞⟦K₁/Z₁⟧. GN22, Lemmas A.16 and A.19, Definition A.2, Proposition A.4(1), pp. 42–47: The grade inequality under reduction and the equality of dimensions over A and B used for the lower bound.

*Needs:* ModpRepresentationsOfGL2OverLocalFields `MP.7/local-gk-bound` (The local Gelfand–Kirillov bound); ModpRepresentationsOfGL2OverLocalFields `MP.7/connected-characters` (Connected semisimple Iwahori character sets); ModpRepresentationsOfGL2OverLocalFields `MP.7/diamond-connected` (Connectedness of tame Diamond invariants); ModpRepresentationsOfGL2OverLocalFields `MP.4/gk-dimension` (Gelfand–Kirillov dimension of an admissible representation); ModpRepresentationsOfGL2OverLocalFields `MP.4/dimension-comparisons` (Quotient and central-regular-sequence dimension comparison); ModpRepresentationsOfGL2OverLocalFields `MP.3/diamond-socle` (The finite Diamond socle modules); [3.4 Freeness for the projective lift of a modular Serre weight](#gk3-projective-lift-freeness); [0.6 The weight part of Serre's conjecture for quaternion algebras (Gee–Kisin)](#gk0-bdj-weight-theorem); [0.5 Mod p cohomology of Shimura curves at infinite level at v](#gk0-infinite-level-representation); [4.9 Multiplicity one for the first-order projective envelope (BHHMS Theorem 8.3.11)](#gk4-second-truncation-multiplicity); [1.7 The big patched module with its GL₂(F\_v)-action](#gk1-big-patched-module); [1.2 The patched local deformation ring R∞](#gk1-patched-deformation-ring); [2.4 Grade and dimension under power-series variables (Gee–Newton)](#gk2-iwasawa-grade-and-power-series).

<a id="gk5-second-congruence-invariants"></a>

### 5.2 Structure of π[𝔪²\_{K₁}] (BHHMS Theorem 1.9)

**Theorem** (`GK.5/second-congruence-invariants`). Planet: *Second congruence invariants*. For the weighted π there is r ≥ 1 with π[𝔪²\_{K₁}] ≅ (⊕\_{σ\_v∈W(r̄\_v^∨)} D̃\_{σ\_v})^{⊕r} as K-representations, where D̃\_{σ\_v} is the largest subrepresentation of (Inj\_{K/Z₁}σ\_v)[𝔪²\_{K₁}] containing σ\_v with multiplicity one (as its socle) and no other weight of W(r̄\_v^∨). Every irreducible constituent of π[𝔪²\_{K₁}] occurs with multiplicity r.

*Hypotheses and conventions.*

- 𝔪\_{K₁} is the maximal ideal of 𝔽⟦K₁/Z₁⟧ and π[𝔪²\_{K₁}] the subspace killed by its square.
- D̃\_{σ\_v} is the summand V\_{σ\_v} of MP.6/socle-enlargement for the tame representation r̄\_v^∨ (BHHMS Corollary 6.3.13).

*Proof outline.*

1. M∞ is finite projective over S∞⟦K⟧\_Z (GK.1/big-patched-module), so M∞/(p, x₁, …) is finite projective over 𝔽⟦K⟧\_Z; since Hom(M∞/(p, x), σ\_v^∨)^∨ = M∞(σ\_v)/(p, x) is nonzero exactly for σ\_v ∈ W(r̄\_v^∨), M∞/(p, x) ≅ ⊕\_{σ\_v}(Proj\_{K/Z₁}σ\_v^∨)^{m\_{σ\_v}} with m\_{σ\_v} ≥ r.
2. By the defining property of D̃\_{σ\_v}, restriction gives Hom(M∞/(p, x), D̃\_{σ\_v}^∨) ≅ Hom(M∞/(p, x), σ\_v^∨); taking 𝔪∞-torsion and M∞/𝔪∞ ≅ π^∨ gives Hom\_K(D̃\_{σ\_v}, π) ≅ Hom\_K(σ\_v, soc\_K π).
3. As soc\_K π = (⊕σ\_v)^{⊕r} (GK.3/weight-and-type-freeness), (⊕D̃\_{σ\_v})^{⊕r} ⊆ π[𝔪²\_{K₁}]; it cannot be larger by MP.6/socle-enlargement and GK.4/second-truncation-multiplicity; multiplicities by the constituent description of MP.6/socle-enlargement.

*Acceptance.*

- The rank r is the same as in GK.3/weight-and-type-freeness.
- Taking K₁-invariants recovers π^{K₁} ≅ D₀(r̄\_v^∨)^{⊕r}, consistent with GK.3/projective-lift-freeness.

*Sources.* BHHMS23, Theorem 8.4.2 and proof, p. 105; Theorem 1.9, p. 10: π[𝔪²\_{K₁}] is r copies of the sum over modular weights of the largest subrepresentation of the second-order injective envelope with that weight once in the socle and no other modular weight; all constituents have multiplicity r.

*Needs:* [1.7 The big patched module with its GL₂(F\_v)-action](#gk1-big-patched-module); [3.2 Freeness for Serre weights and for lattices in tame types](#gk3-weight-and-type-freeness); [4.9 Multiplicity one for the first-order projective envelope (BHHMS Theorem 8.3.11)](#gk4-second-truncation-multiplicity); [1.6 Fibres of the patching functor at the maximal ideal](#gk1-patched-fibre-identity); ModpRepresentationsOfGL2OverLocalFields `MP.6/socle-enlargement` (Multiplicity-preserving enlargement of a tame socle); ModpRepresentationsOfGL2OverLocalFields `MP.5/first-order-weight-hulls` (First-order Serre-weight hulls).

<a id="gk5-patched-faithful-flatness"></a>

### 5.3 The big patched module is faithfully flat over R∞

**Theorem** (`GK.5/patched-faithful-flatness`). The big patched module M∞ is a faithfully flat R∞-module.

*Hypotheses and conventions.*

- Generic global datum; M∞ as in GK.1/big-patched-module, finite free over S∞⟦K₁/Z₁⟧.

*Proof outline.*

1. M∞ is free of finite rank over A = S∞⟦K₁/Z₁⟧, hence Cohen–Macaulay over A; by GK.2/iwasawa-cohen-macaulay-transfer it is Cohen–Macaulay over B = R∞⟦K₁/Z₁⟧ (R∞ is a power series ring over W(𝔽) by GK.1/patched-deformation-ring, so B is an Iwasawa algebra with power-series coefficients).
2. By GK.5/patched-gk-dimension and the computations (80)–(81) there, j\_B(M∞) = 2f = j\_{𝔽⟦K₁/Z₁⟧}(M∞/𝔪∞).
3. GK.2/iwasawa-miracle-flatness gives flatness over R∞; M∞/𝔪∞ ≅ π^∨ ≠ 0 and R∞ is local, so M∞ is faithfully flat.

*Acceptance.*

- Flatness is over R∞, not over R∞⟦K₁/Z₁⟧.
- The equality of grades uses the lower and upper bounds of GK.5/patched-gk-dimension.

*Sources.* BHHMS23, Theorem 8.4.3 and proof, pp. 105–106: M∞ is Cohen–Macaulay over R∞⟦K₁/Z₁⟧ by transfer from S∞⟦K₁/Z₁⟧, its grade equals that of its fibre by the main theorem, so miracle flatness makes it flat, and faithfully flat as its fibre is nonzero. GN22, Corollary A.29 and Proposition A.30: Cohen–Macaulay transfer and miracle flatness for modules over Iwasawa algebras with power-series coefficients.

*Needs:* [1.7 The big patched module with its GL₂(F\_v)-action](#gk1-big-patched-module); [1.2 The patched local deformation ring R∞](#gk1-patched-deformation-ring); [2.5 Cohen–Macaulay transfer along A → B (Gee–Newton)](#gk2-iwasawa-cohen-macaulay-transfer); [2.6 Miracle flatness over Iwasawa algebras (Gee–Newton)](#gk2-iwasawa-miracle-flatness); [5.1 Gelfand–Kirillov dimension of the weighted representation (BHHMS Theorem 1.10)](#gk5-patched-gk-dimension).

<a id="gk5-banach-lifts"></a>

### 5.4 Nonzero Banach lifts of π (BHHMS Theorem 1.3)

**Theorem** (`GK.5/banach-lifts`). Planet: *Banach lifts*. Let x : R∞ → O′ be a homomorphism of local W(𝔽)-algebras, O′ the integers of a finite extension E′ of E = W(𝔽)[1/p], with residue field 𝔽′. Then V(x) = Hom^{cont}\_{O′}(M∞ ⊗\_{R∞,x} O′, E′) is a nonzero admissible unitary Banach representation of GL₂(F\_v) over E′, with GL₂(F\_v)-invariant unit ball Hom^{cont}\_{O′}(M∞ ⊗\_{R∞,x} O′, O′) whose reduction modulo the maximal ideal of O′ is π ⊗\_𝔽 𝔽′.

*Hypotheses and conventions.*

- x induces a lift ρ\_x : G\_{F\_v} → GL₂(E′) of r̄\_v^∨ (up to the duality convention); V(x) is the candidate of CEGGPS for the p-adic Langlands correspondence, now known to be nonzero.

*Proof outline.*

1. Admissibility and unitarity: let x̄ : R∞ → 𝔽′ be x followed by residue reduction. The kernel of x̄ on S∞ is open; the kernel of x itself need not be open. The finite generation of M∞ over S∞⟦K⟧ and topological Nakayama imply finite generation of M∞ ⊗\_{R∞,x} O′ over O′⟦K⟧, using its finite residual module. CEGGPS Proposition 2.13 and the duality of LocallyAnalyticDistributionsPartII ND.6 then give an admissible unitary Banach representation.
2. Nonvanishing: M∞ is flat over R∞ (GK.5/patched-faithful-flatness), so M∞ ⊗\_{R∞,x} O′ is flat over O′, that is torsion free; it is nonzero since its reduction is π^∨ ⊗ 𝔽′ ≠ 0; Schikhof duality (Schneider–Teitelbaum, Theorem 1.2) then gives V(x) ≠ 0.
3. The unit ball reduces to the dual of M∞ ⊗\_{R∞} 𝔽′ = (M∞/𝔪∞) ⊗ 𝔽′ ≅ π^∨ ⊗ 𝔽′, i.e. to π ⊗ 𝔽′.

*Acceptance.*

- The unit ball is given explicitly and reduces to π ⊗ 𝔽′.
- Nonvanishing rests on flatness of M∞ over R∞.

*Sources.* BHHMS23, Corollary 8.4.4 and proof, p. 106; Theorem 1.3, p. 4: For every local homomorphism x : R∞ → O′, the continuous dual of M∞ ⊗\_{R∞,x} O′ is a nonzero admissible unitary Banach representation of GL₂(F\_v) with an invariant unit ball lifting π ⊗ 𝔽′; nonvanishing follows from flatness by Schikhof duality. CEGGPS16, §2.12, Proposition 2.13 and proof, p. 34 (arXiv v5): The specialisations of the patched module at points of R∞ give admissible unitary Banach representations; their nonvanishing is not known in general (Remark 2.14 there).

*Needs:* [5.3 The big patched module is faithfully flat over R∞](#gk5-patched-faithful-flatness); [1.7 The big patched module with its GL₂(F\_v)-action](#gk1-big-patched-module); CompletedCohomologyPartII `CC.3/continuous-dual-conventions` (Continuous tower duals); LocallyAnalyticDistributionsPartII `ND.6/banach-iwasawa-duality` (Admissible Banach representations and finitely generated Iwasawa modules).

<a id="gk5-shimura-curve-gk-dimension"></a>

### 5.5 Gelfand–Kirillov dimension of mod p cohomology of Shimura curves (BHHMS Theorem 1.1)

**Theorem** (`GK.5/shimura-curve-gk-dimension`). Planet: *Gelfand–Kirillov dimension theorem*. Let a generic global datum be given (with S = S\_D ∪ S\_r) and let V^v = ∏\_{w∉S\_D∪S\_r}(O\_D)\_w^× · ∏\_{w∈(S\_D∪S\_r)∖{v}} V\_w ⊆ ∏\_{w≠v}(O\_D)\_w^× be a compact open subgroup with V\_w ⊆ 1 + pM₂(O\_{F\_w}) for w ∈ S\_p ∖ {v}, such that π ≠ 0, where π = colim\_{V\_v} Hom\_{G\_F}(r̄, H¹\_ét(X\_{V^vV\_v} ×\_F F̄, 𝔽)) in the indefinite case and π = colim\_{V\_v} S(V^vV\_v, 𝔽)[𝔪] in the definite case. Then dim\_{GL₂(F\_v)}(π) = [F\_v : ℚ\_p]. Without the condition V\_w ⊆ 1 + pM₂(O\_{F\_w}) at w ∈ S\_p ∖ {v} one still has dim\_{GL₂(F\_v)}(π) ≤ [F\_v : ℚ\_p]; and the equality holds for V^v = ∏\_{w∉S}(O\_D)\_w^× ∏\_{w∈S∖{v}}V\_w for any finite S ⊇ S\_D ∪ S\_r, with the same nonvanishing and pro-p conditions at the other places above p, such that the framed deformation ring of r̄\_w is formally smooth for w ∈ S ∖ S\_p.

*Hypotheses and conventions.*

- The hypotheses on r̄: absolutely irreducible on G\_{F(ζ\_p)}, generic at the places above p other than v, of the stated semisimple inertial shape at v (so p > 23), formally smooth local rings at the bad places away from p.
- In the definite case 𝔪 is the ideal of BHHMS Remark 8.1.3(ii) for S large; the eigenspace does not depend on S (BDJ10 Lemma 4.6(a)).

*Proof outline.*

1. Upper bound: the dimension of a subrepresentation is at most that of the space, so shrink V^v: take V\_{w₁} unipotent upper triangular modulo w₁ and V\_w ⊆ 1 + pM₂(O\_{F\_w}) normal at w ∈ S\_p ∖ {v}; then S = S\_D ∪ S\_r and U = ∏U\_w (U\_w = V\_w off S\_p, U\_w = GL₂(O\_{F\_w}) on S\_p) satisfy GK.0/generic-global-datum.
2. Dévissage (BHHMS (83)): π ≅ colim Hom\_{U^v/V^v}(⊗\_w(Ind\_{V\_w}^{GL₂(O\_{F\_w})}1)\_Z, Hom\_{G\_F}(r̄, H¹)); filtering the induced representations by Serre weights and using that H¹\_𝔪 is injective over U^v/V^v (GK.0/non-eisenstein-freeness), and that the dimension of an extension is the maximum and that of a subrepresentation at most that of the whole (grades in short exact sequences, GK.2/iwasawa-cohen-macaulay), dim π is the maximum over weight tuples of the dimensions of the weighted π, which are f or zero by GK.5/patched-gk-dimension and GK.0/bdj-weight-theorem; so dim π ≤ f, with equality as soon as one modular tuple occurs, which π ≠ 0 forces.
3. For the lower bound at the original levels V\_w ⊆ K₁,w, enlarge those levels to K₁,w. The original nonzero smooth representation of the compact pro-p group ∏ K₁,w has nonzero invariant vectors; the weight theorem then provides a modular weight tuple whose weighted π embeds at these enlarged levels and has dimension f by GK.5/patched-gk-dimension. The inclusion from enlarged-level cohomology into the original smaller-level space gives dimension at least f. Remove the auxiliary level at w₁ with GK.0/ihara-at-auxiliary-place: its doubling does not change dimension. Together with the upper bound this gives equality at the original level; shrinking to K₁,w would reverse the required inclusion.
4. The variant with a larger S (BHHMS Remark 8.4.7) is the same argument with S in place of S\_D ∪ S\_r.

*Acceptance.*

- Both the indefinite and the definite statements are covered.
- The upper bound alone is stated without the pro-p level condition at w ∈ S\_p ∖ {v}.

*Sources.* BHHMS23, Corollary 8.4.6 and proof, pp. 106–107; Remark 8.4.7, p. 108; Theorem 1.1, p. 3: For generic r̄ absolutely irreducible on G\_{F(ζ\_p)} and the stated tame levels, the r̄-part of the mod p cohomology of Shimura curves (or definite forms) at infinite level at v has Gelfand–Kirillov dimension [F\_v : ℚ\_p]; the upper bound holds without the pro-p condition at the other places above p.

*Needs:* [5.1 Gelfand–Kirillov dimension of the weighted representation (BHHMS Theorem 1.10)](#gk5-patched-gk-dimension); [0.5 Mod p cohomology of Shimura curves at infinite level at v](#gk0-infinite-level-representation); [0.7 Doubling at the auxiliary place w₁](#gk0-ihara-at-auxiliary-place); [0.6 The weight part of Serre's conjecture for quaternion algebras (Gee–Kisin)](#gk0-bdj-weight-theorem); [0.1 The generic global datum of Breuil–Herzig–Hu–Morra–Schraen](#gk0-generic-global-datum); [0.4 Projectivity and injectivity of the residual eigenspaces over the level quotient](#gk0-non-eisenstein-freeness); [2.1 Grade, dimension and Cohen–Macaulay modules over Iwasawa algebras](#gk2-iwasawa-cohen-macaulay); ModpRepresentationsOfGL2OverLocalFields `MP.4/gk-dimension` (Gelfand–Kirillov dimension of an admissible representation); ModpRepresentationsOfGL2OverLocalFields `MP.4/dimension-comparisons` (Quotient and central-regular-sequence dimension comparison).

<a id="gk5-completed-cohomology-and-big-hecke"></a>

### 5.6 Completed cohomology at the r̄-part and the big Hecke algebra

**Construction** (`GK.5/completed-cohomology-and-big-hecke`). Assume p is inert in F (so S\_p = {v}) and let V^v = ∏\_{w≠v}U\_w. For compact open V\_v ⊆ 1 + pM₂(O\_{F\_v}) and n ≥ 1 let H¹\_ét(X\_{V^vV\_v} ×\_F F̄, W(𝔽)/pⁿ)^{ψ^{−1}} (definite: S(V^vV\_v, W(𝔽)/pⁿ)^{ψ^{−1}}) be the ψ^{−1}-isotypic part for the centre (𝔸\_F^∞)^×, ψ^{−1} viewed as a character of (𝔸\_F^∞)^× by the global Artin map sending uniformizers to geometric Frobenius; let T(V^vV\_v, W(𝔽)/pⁿ)^{ψ^{−1}} be the W(𝔽)-subalgebra of its endomorphisms generated by the T\_w, S\_w for w ∉ S ∪ {w₁}, and T(…)\_{r̄}^{ψ^{−1}} its localisation at 𝔪. The big Hecke algebra is T̂(V^v)\_{r̄}^{ψ^{−1}} = lim\_{n,V\_v} T(V^vV\_v, W(𝔽)/pⁿ)\_{r̄}^{ψ^{−1}}, and the localized completed cohomology is Ĥ¹(V^v)\_{r̄}^{ψ^{−1}} = lim\_n colim\_{V\_v} (H¹(…, W(𝔽)/pⁿ)^{ψ^{−1}} ⊗\_{T(…)} T(…)\_{r̄}) (definite: Ŝ(V^v)\_{r̄}^{ψ^{−1}}), whose W(𝔽)-dual Hom\_{W(𝔽)}(Ĥ¹(V^v)\_{r̄}^{ψ^{−1}}, W(𝔽)) is a T̂(V^v)\_{r̄}^{ψ^{−1}}-module. R^ψ\_{r̄,S∪{w₁}} is the universal deformation ring of r̄ for deformations unramified outside S ∪ {w₁} with ψ = ε det.

*Hypotheses and conventions.*

- p inert in F is assumed in BHHMS §8.5; for other p the corresponding statement is expected but not proved there (BHHMS Remark 8.5.2).

*Proof outline.*

1. Specialise the completed cohomology and completed Hecke algebra of CompletedCohomologyPartII CC.8 (completed-hecke-algebra, completed-residual-localisation) to the quaternionic Shimura-curve tower of HMV R18.4/finite-cohomology with level varying at v, with the ψ^{−1}-isotypic projection of the centre.
2. CC.8 defines finite Hecke images on the derived cohomology complexes. After the non-Eisenstein localisation, H⁰ and H² vanish, so the indefinite complex is concentrated in degree 1 and is its H¹ shifted; in the definite case it is concentrated in degree 0. Thus those derived Hecke images agree with the images on the cohomology modules used here, compatibly through the tower. This identifies the imported construction rather than silently changing its carrier.
3. The deformation ring is GlobalGaloisDeformations' universal deformation ring with fixed determinant (R04.1/fixed-determinant-functors, R04.3/global-framed-ring); the map R^ψ\_{r̄,S∪{w₁}} → T̂ is the inverse limit of the finite-level maps given by the Galois representations on localized Hecke algebras (HMV R18.4/early-quaternionic-galois-hecke-support), sending traces of Frobenius to Hecke operators; CompletedCohomologyAndLocalGlobalCompatibility R31.3/deformation-to-hecke-surjection is the analogue for the modular tower.

*Uses.*

- [5.7 Big R = big T and flatness of completed cohomology (BHHMS Theorem 1.2)](#gk5-big-r-equals-big-t): The flatness and R = T statement is about these objects.
- [1.7 The big patched module with its GL₂(F\_v)-action](#gk1-big-patched-module): The big patched module modulo the S∞ variables is the dual of this completed cohomology.

*API.*

- `completedCohomologyRbar` (constructor): Ĥ¹(V^v)\_{r̄}^{ψ^{−1}} (resp. Ŝ) as a p-adically complete W(𝔽)-module with commuting actions of G\_F, GL₂(F\_v) and the Hecke algebra.
- `bigHeckeAlgebra` (constructor): T̂(V^v)\_{r̄}^{ψ^{−1}} as the inverse limit of the localized finite-level Hecke algebras, a complete local W(𝔽)-algebra.
- `deformationToHecke` (data): The surjection R^ψ\_{r̄,S∪{w₁}} ↠ T̂(V^v)\_{r̄}^{ψ^{−1}} sending tr ρ^{univ}(Frob\_w) to Hecke operators.
- `completedCohomologyRbar_dual` (compatibility): The W(𝔽)-dual of Ĥ¹ is a T̂-module, and modulo pⁿ and at finite level it recovers the localized finite-level cohomology.
- `completedCohomologyRbar_independent` (characterisation): The localisation does not depend on enlarging S (BDJ10 Lemma 4.6(a)).

*Checks (unit tests).*

- `bigHecke_local` (compatibility): T̂(V^v)\_{r̄}^{ψ^{−1}} is local with residue field 𝔽 and maximal ideal the image of 𝔪.
- `completedCohomology_mod_p` (compatibility): The reduction modulo p of the localized completed cohomology, followed by r̄-parts, is the representation π(V^v) of GK.0 (with W(𝔽)/p coefficients).
- `completedCohomology_not_split_p` (degenerate): If p splits in F there is more than one place above p and the construction with level varying only at v does not give the object of §8.5 (BHHMS Remark 8.5.2).
- `bigHecke_eisenstein` (non-example): Without localising at 𝔪 the Hecke algebra is not local: Eisenstein maximal ideals (from H⁰, H²) contribute further factors.

*Acceptance.*

- The centre acts through ψ^{−1} with the geometric-Frobenius normalisation of the Artin map.
- The construction is made for p inert only.

*Sources.* BHHMS23, §8.5, pp. 108–109; §1.2 before Theorem 1.2, pp. 3–4: With p inert, the ψ^{−1}-isotypic finite-level cohomology with W(𝔽)/pⁿ coefficients, the localized Hecke algebras and their limit the big Hecke algebra, the localized completed cohomology and its dual, and the universal deformation ring with determinant condition. GN22, §4.3, Proposition 4.3.1: The analogous objects for locally symmetric spaces, and the flatness and complete-intersection statement deduced from patching.

*Needs:* [0.3 Quaternionic spaces of mod p forms and their residual eigenspaces](#gk0-residual-eigenspaces); CompletedCohomologyPartII `CC.8/completed-hecke-algebra` (Completed derived Hecke algebra); CompletedCohomologyPartII `CC.8/completed-residual-localisation` (Residual localisation of the completed tower); CompletedCohomologyPartII `CC.3/continuous-dual-conventions` (Continuous tower duals); HilbertModularVarietiesAndShimuraCurves `R18.4/finite-cohomology` (Quaternionic finite-level cohomology); HilbertModularVarietiesAndShimuraCurves `R18.4/early-quaternionic-galois-hecke-support` (Early finite-level quaternionic Galois–Hecke realization); GlobalGaloisDeformations `R04.1/fixed-determinant-functors` (Lifts and deformations with fixed determinant); GlobalGaloisDeformations `R04.3/global-framed-ring` (Representability of global deformations of type 𝒮).

<a id="gk5-big-r-equals-big-t"></a>

### 5.7 Big R = big T and flatness of completed cohomology (BHHMS Theorem 1.2)

**Theorem** (`GK.5/big-r-equals-big-t`). Planet: *Big R equals big T*. Assume p inert in F. In the sequence of surjections R∞ ⊗\_{S∞} W(𝔽) = R∞/(x₁, …, x\_{4|S|+q−1}) ↠ R^ψ\_{r̄,S∪{w₁}} ↠ T̂(V^v)\_{r̄}^{ψ^{−1}} all maps are isomorphisms; Hom\_{W(𝔽)}(Ĥ¹(V^v)\_{r̄}^{ψ^{−1}}, W(𝔽)) (resp. the dual of Ŝ(V^v)\_{r̄}^{ψ^{−1}}) is a faithfully flat T̂(V^v)\_{r̄}^{ψ^{−1}}-module; and T̂(V^v)\_{r̄}^{ψ^{−1}} is a complete intersection.

*Hypotheses and conventions.*

- Generic global datum with p inert in F; V\_{w₁} sufficiently small at the chosen auxiliary place.

*Proof outline.*

1. By GK.1/big-patched-module, M∞/(x₁, …) is the dual of the localized completed cohomology, compatibly with the surjections; it is faithfully flat over R∞/(x₁, …) by base change of GK.5/patched-faithful-flatness.
2. A faithfully flat module is faithful, so the composite R∞/(x) ↠ R^ψ ↠ T̂ → End\_{W(𝔽)}(dual of Ĥ¹) is injective; hence all maps are isomorphisms, and the dual of Ĥ¹ is faithfully flat over T̂.
3. M∞ is faithfully flat over R∞ and over S∞ (finite free over S∞⟦K₁/Z₁⟧), so R∞ is faithfully flat over S∞; thus the regular sequence (x₁, …) of S∞ is R∞-regular and T̂ ≅ R∞/(x₁, …) is a power series ring over W(𝔽) modulo a regular sequence, a complete intersection (BHHMS reproduce Gee–Newton Proposition 4.3.1 in this setting).

*Acceptance.*

- All three conclusions (isomorphisms, faithful flatness, complete intersection) are stated.
- The hypothesis that p is inert in F is kept.

*Sources.* BHHMS23, (84), p. 108; Corollary 8.5.1 and proof, p. 109; Theorem 1.2, p. 4: With p inert, the surjections from the patched ring modulo the auxiliary variables to the deformation ring and to the big Hecke algebra are isomorphisms, the dual of completed cohomology is faithfully flat over the big Hecke algebra, and the latter is a complete intersection; the proof follows Gee–Newton Proposition 4.3.1. GN22, Proposition 4.3.1, §4.3: Miracle flatness of the patched module implies big R = big T and flatness of completed homology over the big Hecke algebra.

*Needs:* [5.6 Completed cohomology at the r̄-part and the big Hecke algebra](#gk5-completed-cohomology-and-big-hecke); [5.3 The big patched module is faithfully flat over R∞](#gk5-patched-faithful-flatness); [1.7 The big patched module with its GL₂(F\_v)-action](#gk1-big-patched-module); [1.2 The patched local deformation ring R∞](#gk1-patched-deformation-ring); DeformationAndDerivedPatchingAlgebra `R03.3/complete-intersections` (Local complete intersections); `Module.FaithfullyFlat` (mathlib).

## Suggested Lean file

research/blueprint/suggested/HilbertModularVarietiesAndShimuraCurvesPartII.lean elaborates against Mathlib 082e2d3 with \`sorry\` as its only warning. It states only what the pinned libraries can carry:

- [0.1 The generic global datum of Breuil–Herzig–Hu–Morra–Schraen](#gk0-generic-global-datum): IsGenericReducibleExponents, IsGenericIrreducibleExponents, IsEGSGenericReducible, IsEGSGenericIrreducible, the bound p ≥ 27 and the implication from BHHMS to EGS15 genericity, with decidable unit tests (p = 29 admissible exponents, p = 23 empty, EGS15 Remark 2.1.3 at p = 3).
- [1.2 The patched local deformation ring R∞](#gk1-patched-deformation-ring): patchedRingNumVars, auxiliaryRingNumVars and the identities (3 + 3f) + (4(|S| − 1) + q − f) = 4|S| + q − 1 + 2f, the difference 2f, and the dimension of a type quotient.
- [1.1 Cancellation of a power-series variable (Hamann)](#gk1-power-series-cancellation): powerSeries\_cancellation for local rings.
- [2.2 Freeness over the support from a submodule and a quotient](#gk2-freeness-from-extension): IsFreeOverSupport, IsGeneratedBy and isFreeOverSupport\_of\_submodule.
- [2.3 Freeness of fibre products over their supports](#gk2-fibre-product-freeness): fibreProduct (as a kernel in M₁ × M₂), mem\_fibreProduct, annihilator\_fibreProduct, isFreeOverSupport\_fibreProduct\_iff and annihilator\_sup\_le.
- [0.7 Doubling at the auxiliary place w₁](#gk0-ihara-at-auxiliary-place): gram\_det\_factor: (N + 1)² − N(α + β)²/(αβ) = (N − α/β)(N − β/α), proved.
- [5.1 Gelfand–Kirillov dimension of the weighted representation (BHHMS Theorem 1.10)](#gk5-patched-gk-dimension): le\_gkDim\_of\_grade\_le, the arithmetic of BHHMS (80)–(81).

Shimura curves, patching functors, Iwasawa algebras (completed group algebras are in current Tau Ceti but not at f790474), grades and the freeness and dimension theorems are README targets only.

## Restructuring

- **split** (HilbertModularVarietiesAndShimuraCurvesPartII, HilbertModularVarietiesAndShimuraCurvesPartIIQuaternionic). The brief bundles three continuations of HilbertModularVarietiesAndShimuraCurves. They are independent: the patching and Gelfand–Kirillov route (PAPER-BREUIL-ETAL-23, planned here) uses only Shimura curves and definite quaternion algebras at levels varying at one place; the PAPER-ICHINO-PRASANNA-23 route HilbertModularVarietiesAndShimuraCurvesPartIIQuaternionic (items 021–024: quaternionic Shimura varieties of B split at an arbitrary set Σ of real places, the reflex field F\_Σ, automorphic local systems with rational structures, π\_B-isotypic realizations concentrated in degree d, and the tensor-induction theorem for their ℓ-adic cohomology) shares no node with it. *Proposal:* Make the Ichino–Prasanna route its own Part II roadmap, HilbertModularVarietiesAndShimuraCurvesPartIIQuaternionic, with the route's brief; its consumer HodgeClassesForJacquetLanglands records the gap 'Quaternionic Shimura realization interface' (JL.0, JL.10) waiting on it. It imports R18.1–R18.4 of the parent, ShimuraVarieties V6/V8 and the transfer and Galois representation layers named in the brief.
- **split** (HilbertModularVarietiesAndShimuraCurvesPartII, HilbertSiegelModularVarieties). The PAPER-BOXER-CALEGARI-GEE-PILLONI-21 route HilbertSiegelModularVarieties (20 items: the groups G₁ = Res\_{F/ℚ}GSp₄ and G, their Shimura varieties and PEL moduli problem, integral models at parahoric level and local models, unit actions and the quotient Y\_K^{G₁}, toroidal and minimal compactifications, Klingen and Siegel correspondences, automorphic bundles, Ekedahl–Oort and Kottwitz–Rapoport stratifications and the Taylor–Wiles covers of BCGP §§3, 7.8.10, 8.2) is the GSp₄ analogue of the parent's H0–H5 and shares nothing with the Gelfand–Kirillov route. *Proposal:* Make it its own roadmap HilbertSiegelModularVarieties (a Part II of HilbertModularVarietiesAndShimuraCurves in direction, built on PELModuli and ShimuraCompactifications, which already plans the genus-two Hilbert–Siegel boundary codimension and Koecher principle in C5). AbelianSurfacesPotentialModularity imports 'Hilbert–Siegel varieties, their integral models, compactifications and strata' from it.
- **rescope** (LocalGaloisDeformationRings, HilbertModularVarietiesAndShimuraCurvesPartII). The Gee–Kisin weight theorem (GK.0/bdj-weight-theorem) rests on the Breuil–Mézard conjecture for potentially Barsotti–Tate representations of G\_K, K/ℚ\_p finite (Gee–Kisin Theorem A) and on Gee–Liu–Savitt's identification of the Breuil–Mézard weights with the BDJ weights; no atlas roadmap plans them (PadicLocalLanglandsForGL2Qp owns the ℚ\_p case only). *Proposal:* Route Gee–Kisin (Forum Math. Pi 2 (2014)) and Gee–Liu–Savitt (Forum Math. Pi 3 (2015)) as a paper job, or add them to the LocalGaloisDeformationRingsPartII design, whose first route already plans the tame potentially Barsotti–Tate rings that Gee–Kisin's proof uses; then replace the gap breuil-mezard-pbt here by the new owner's nodes.

## Source findings

The independent review confirmed E1–E4 and E6 against the editions specified below, and rejected E5 as an allegation of a source error. Publisher metadata was checked; the BHHMS publisher PDF remains subscription-only. Public preprints and author copies establish the scoped findings.

- **E1** (BHHMS23, misprint, arXiv:2009.03127v7, proof of Proposition 8.3.7, p. 100). The proof asserts that the space of K-maps from σ\_v to π has dimension f, citing Proposition 8.2.3. *Correction:* The dimension is r, the rank of Proposition 8.2.3 (by (68) and Proposition 8.2.3(i), dim\_𝔽 Hom\_K(σ\_v, π) = dim\_𝔽 M∞(σ\_v)/𝔪∞ = r). *Reason:* Proposition 8.2.3 gives freeness of rank r, and the argument compares dim Hom\_K(L\_j, π) with r: it needs a map L\_j → π not factoring through the cosocle whenever dim Hom\_K(L\_j, π) > dim Hom\_K(σ\_v, π) = r. The integer f = [F\_v : ℚ\_p] plays no role there. *Known:* new. *Review:* **confirmed** — Confirmed in arXiv v7 p. 100 and the public author copy p. 104: (68) and Proposition 8.2.3 give r, not f.
- **E2** (EGS15, error, arXiv:1305.1594v3, §6.2, p. 35 (extension of the action to (𝔸\_F^∞)^×)). The adelic centre (𝔸\_F^∞)^× is made to act on σ(θ) through the character induced by ψ ∘ Art\_F. *Correction:* The centre should act through ψ^{−1} ∘ Art\_F. *Reason:* With ψ the normalisation contradicts det τ = ψ|I\_{F\_v} in EGS15 §7.1, because the normalisation of σ(τ) in EGS15 §1.9 is dual to that of Breuil–Mézard §2.1.1. *Known:* BHHMS Remark 8.1.3(i) (p. 89), also Caraiani–Emerton–Gee–Savitt, Components of moduli stacks of two-dimensional Galois representations, Remark A.1. *Review:* **confirmed** — Confirmed as the already published correction in BHHMS Remark 8.1.3(i), relative to the EGS15 arXiv v3 convention.
- **E3** (EGS15, gap, arXiv:1305.1594v3, §6.2, p. 35 (definition of S(σ) in the indefinite case)). S(σ) is defined as H¹ of the Shimura curve X\_K with the local system attached to σ(θ)^\*, after extending the K-action to K·(𝔸\_F^∞)^×. *Correction:* Replace X\_K by its quotient by the finite group K(𝔸\_F^∞)^×/K F^×, which acts freely, as in the definite case where functions are required to be equivariant for K(𝔸\_F^∞)^× and not only K. *Reason:* Only the quotient carries the local system with the extended central action; the r̄-part of H¹ does not change (BHHMS, arguing as in Breuil–Diamond Theorem 3.7.1). *Known:* BHHMS Remark 8.1.3(iii) (p. 89). *Review:* **confirmed** — Confirmed as the already published correction in BHHMS Remark 8.1.3(iii); the packet uses the quotient construction.
- **E5** (EGS15, misprint, arXiv:1305.1594v3, §6.4, last paragraph, p. 37). The support property of the patching functor on Serre weights is attributed to Corollaries 5.6.4 and 4.5.7 of Gee–Kisin. *Correction:* The numbering is that of the 2012 version of Gee–Kisin; arXiv:1208.3179v5 (the version matching Forum Math. Pi 2 (2014)) has no Corollaries 4.5.7 or 5.6.4, and the corresponding statements are in its §§4.5 and 5.4 (Corollary 5.4.5). *Reason:* Read in Gee–Kisin arXiv v5: its corollaries are 4.5.3, 4.5.6, 5.4.5, 5.5.4 and 5.5.7. *Known:* new. *Review:* **rejected** — Different numbering in a later edition does not establish a misprint in a reference explicitly citing the 2012 preprint. Retain the version map for readers, but reject the allegation of a source mistake.
- **E4** (BHHMS23, misprint, arXiv:2009.03127v7, §1.2, p. 5, and proof of Theorem 8.4.3, p. 106). Miracle flatness is cited as Corollary A.30 of Gee–Newton. *Correction:* In arXiv:1609.06965v5 of Gee–Newton the miracle flatness statement is Proposition A.30 (Corollary A.29 is the Cohen–Macaulay transfer). *Reason:* Read in Gee–Newton arXiv v5, Appendix A, p. 49. The published numbering in J. Inst. Math. Jussieu 21 (2022) could not be checked from this machine, so the discrepancy may be with the arXiv version only. *Known:* new. *Review:* **confirmed** — Confirmed as a cross-version label mismatch only: GN arXiv v5 p. 49 labels the result Proposition A.30. This is not a mathematical error or a verified error in the journal text.
- **E6** (BHHMS23, misprint, arXiv:2009.03127v7, proof of Theorem 8.3.9, displayed type-to-prime bijection ι, p. 102; public author copy p. 105). The type-index set in the displayed bijection uses σ\_v ⊗ (N\_{k/𝔽\_p} ∘ det), with a positive determinant exponent. *Correction:* Use σ\_v ⊗ (N\_{k/𝔽\_p} ∘ det^{−1}), as in the defining intersection immediately above it and the twist on p. 101. *Reason:* These displays must index the same primes. The defining condition of §4.3, p. 34, is σ ∈ JH(σ(τ) ⊗ N\_{k/𝔽\_p} ∘ det), equivalently σ ⊗ N\_{k/𝔽\_p} ∘ det^{−1} ∈ JH(σ(τ)). A positive twist changes that set. *Known:* new. *Review:* **confirmed** — Read all three displays and the §4.3 definition in arXiv v7, and the corresponding displays in the public author copy. The defining intersection fixes the intended sign.

### Editions checked

- [BHHMS23 — Gelfand–Kirillov dimension and mod p cohomology for GL2](https://arxiv.org/abs/2009.03127v7) (preprint, read 2026-10-19). SHA-256: `8f06c68bbb85aa3d13420181197167b3ce9158dc117e96da6299718765f99e7a`.
- [EGS15 — Lattices in the cohomology of Shimura curves](https://arxiv.org/abs/1305.1594v3) (preprint, read 2026-10-19). SHA-256: `5bc8520f1317af40af528efc8e7c1ab810351c5397872b7e4ee9256b2e97a1e1`.
- [GN22 — Patching and the completed homology of locally symmetric spaces](https://arxiv.org/abs/1609.06965v5) (preprint, read 2026-10-19). SHA-256: `068818a4b0e12f97184d72cd7704663f5269f9297f017ff99172325ed5f67601`.
- [GK14 — The Breuil–Mézard conjecture for potentially Barsotti–Tate representations](https://arxiv.org/abs/1208.3179v5) (preprint, read 2026-10-19). SHA-256: `65cb5797bbe10e328843b5fdc73f2623c80e19fa89ceb72ce6cd296881eb68f9`.
- [DL21 — Diagrams in the mod p cohomology of Shimura curves](https://arxiv.org/abs/1909.12219v2) (preprint, read 2026-10-19). SHA-256: `8c4f82ec57c4b961bca5d9adc8a3862e5614e97fb28cfd09c2cc5e3516cfaab3`.
- [LE19 — Multiplicity one for wildly ramified representations](https://arxiv.org/abs/1708.04582v2) (preprint, read 2026-10-19). SHA-256: `8ccde4d9e336a9d637abd5a0da6a80f21de7884b9a389c93f38e3143e570a814`.
- [LMS22 — Multiplicity one at full congruence level](https://arxiv.org/abs/1608.07987v3) (preprint, read 2026-10-19). SHA-256: `28d6965b625c1706b6d81503bed27d22b9cacf675a49609547ba2819a67e771e`.
- [BDJ10 — On Serre's conjecture for mod ℓ Galois representations over totally real fields](https://arxiv.org/abs/0810.2106v5) (preprint, read 2026-10-19). SHA-256: `29515a96071cc632970d41394a6a867f938ba8b09ae39a22862073fbf3ceb237`.
- [CEGGPS16 — Patching and the p-adic local Langlands correspondence](https://arxiv.org/abs/1310.0831v5) (preprint, read 2026-10-19). SHA-256: `32acd023be82598de73c1757aba877fbeb89e5b82c23a64bcb378cc0f83b1077`.
- [HAM75 — On power-invariance](https://msp.org/pjm/1975/61-1/pjm-v61-n1-p17-p.pdf) (published, read 2026-10-19). SHA-256: `29b601cf166b3c8c9771a1e57e659b77f8b731f61fca6d484db8900cedd52931`.
- [BRE14 — Sur un problème de compatibilité local-global modulo p pour GL₂](https://www.imo.universite-paris-saclay.fr/~christophe.breuil/PUBLICATIONS/compamodp.pdf) (author copy, read 2026-10-19). SHA-256: `583a4a4d069b4b069c663db9571047b7f4d02ea27e836c8df02f081809504d2a`.
- [author copy](https://www.math.toronto.edu/~herzig/GK.pdf) (author copy, read 2026-10-19). SHA-256: `b72458bd849101318871fe68f37f6ff2c0c9beac5e7f0e38bcfc6db34aff51dc`. Checked the corresponding passages for E1 and E6 (author-copy pp. 104–105); both discrepancies persist. This does not establish the text of the publisher PDF.
- [published](https://link.springer.com/article/10.1007/s00222-023-01202-8) (published, read 2026-10-19). Publisher landing page and bibliography accessible; full article is subscription-only. Mathematical findings are scoped to arXiv v7 and the public author copy, not claimed verified against the version of record.

The source-correction search also checked [Herzig’s publication page](https://www.math.toronto.edu/~herzig/); no correction for BHHMS was linked there on the review date. The packet records each search and keeps the findings scoped to the text actually read.

## Paper route coverage

| Item | Targets | Disposition |
|---|---|---|
| `PAPER-BREUIL-ETAL-23/patching` | [1.5](#gk1-shimura-curve-patching-functor), [1.2](#gk1-patched-deformation-ring), [1.4](#gk1-fixed-determinant-patching-functor) | Planned here at target level. |
| `PAPER-BREUIL-ETAL-23/freeness` | [4.8](#gk4-glued-lattice-freeness) | Planned here at target level. |
| `PAPER-BREUIL-ETAL-23/k1-invariants` | [5.2](#gk5-second-congruence-invariants) | Planned here at target level. |
| `PAPER-BREUIL-ETAL-23/gk-patched` | [5.1](#gk5-patched-gk-dimension) | Planned here at target level. |
| `PAPER-BREUIL-ETAL-23/main` | [5.5](#gk5-shimura-curve-gk-dimension) | Planned here at target level. |
| `PAPER-BREUIL-ETAL-23/banach` | [5.4](#gk5-banach-lifts) | Planned here at target level. |
| `PAPER-BREUIL-ETAL-23/flatness` | [5.7](#gk5-big-r-equals-big-t), [5.6](#gk5-completed-cohomology-and-big-hecke) | Planned here at target level. |
| `PAPER-BREUIL-ETAL-23/power-series-cancel` | [1.1](#gk1-power-series-cancellation) | Planned here at target level. |
| `PAPER-BREUIL-ETAL-23/free-support-lemma` | [2.2](#gk2-freeness-from-extension) | Planned here at target level. |
| `PAPER-BREUIL-ETAL-23/maximal-CM` | [3.1](#gk3-patched-maximal-cohen-macaulay) | Planned here at target level. |
| `PAPER-BREUIL-ETAL-23/free-types` | [3.2](#gk3-weight-and-type-freeness) | Planned here at target level. |
| `PAPER-BREUIL-ETAL-23/CM-lattices` | [3.3](#gk3-locally-algebraic-lattices) | Planned here at target level. |
| `PAPER-BREUIL-ETAL-23/free-proj-type` | [3.4](#gk3-projective-lift-freeness) | Planned here at target level. |
| `PAPER-BREUIL-ETAL-23/loewy-3` | [4.2](#gk4-loewy-length-three) | Planned here at target level. |
| `PAPER-BREUIL-ETAL-23/min-gen-R2j` | [4.3](#gk4-adjoint-lattice-generation) | Planned here at target level. |
| `PAPER-BREUIL-ETAL-23/free-V-alpha` | [4.4](#gk4-adjoint-type-lattices) | Planned here at target level. |
| `PAPER-BREUIL-ETAL-23/free-R2j` | [4.5](#gk4-adjoint-lattice-freeness) | Planned here at target level. |
| `PAPER-BREUIL-ETAL-23/M-T-Y` | [4.4](#gk4-adjoint-type-lattices), [4.1](#gk4-glued-lattices) | Planned here at target level. |
| `PAPER-BREUIL-ETAL-23/L-N-rad3` | [4.6](#gk4-comparison-lattice-truncation) | Planned here at target level. |
| `PAPER-BREUIL-ETAL-23/L-N-equiv` | [4.7](#gk4-generation-transfer) | Planned here at target level. |
| `PAPER-BREUIL-ETAL-23/fibre-product-free` | [2.3](#gk2-fibre-product-freeness) | Planned here at target level. |
| `PAPER-BREUIL-ETAL-23/M-R-free` | [4.9](#gk4-second-truncation-multiplicity) | Planned here at target level. |
| `PAPER-BREUIL-ETAL-23/proj-iso` | [4.9](#gk4-second-truncation-multiplicity) | Planned here at target level. |
| `PAPER-BREUIL-ETAL-23/faithfully-flat` | [5.3](#gk5-patched-faithful-flatness) | Planned here at target level. |
| `PAPER-ICHINO-PRASANNA-23/021` | none | Not planned here: split to the proposed roadmap HilbertModularVarietiesAndShimuraCurvesPartIIQuaternionic (see restructure). |
| `PAPER-ICHINO-PRASANNA-23/022` | none | Not planned here: split to the proposed roadmap HilbertModularVarietiesAndShimuraCurvesPartIIQuaternionic (see restructure). |
| `PAPER-ICHINO-PRASANNA-23/023` | none | Not planned here: split to the proposed roadmap HilbertModularVarietiesAndShimuraCurvesPartIIQuaternionic (see restructure). |
| `PAPER-ICHINO-PRASANNA-23/024` | none | Not planned here: split to the proposed roadmap HilbertModularVarietiesAndShimuraCurvesPartIIQuaternionic (see restructure). |
| `PAPER-BOXER-CALEGARI-GEE-PILLONI-21/35` | none | Not planned here: split to the proposed roadmap HilbertSiegelModularVarieties (see restructure). |
| `PAPER-BOXER-CALEGARI-GEE-PILLONI-21/37` | none | Not planned here: split to the proposed roadmap HilbertSiegelModularVarieties (see restructure). |
| `PAPER-BOXER-CALEGARI-GEE-PILLONI-21/39` | none | Not planned here: split to the proposed roadmap HilbertSiegelModularVarieties (see restructure). |
| `PAPER-BOXER-CALEGARI-GEE-PILLONI-21/40` | none | Not planned here: split to the proposed roadmap HilbertSiegelModularVarieties (see restructure). |
| `PAPER-BOXER-CALEGARI-GEE-PILLONI-21/41` | none | Not planned here: split to the proposed roadmap HilbertSiegelModularVarieties (see restructure). |
| `PAPER-BOXER-CALEGARI-GEE-PILLONI-21/42` | none | Not planned here: split to the proposed roadmap HilbertSiegelModularVarieties (see restructure). |
| `PAPER-BOXER-CALEGARI-GEE-PILLONI-21/43` | none | Not planned here: split to the proposed roadmap HilbertSiegelModularVarieties (see restructure). |
| `PAPER-BOXER-CALEGARI-GEE-PILLONI-21/44` | none | Not planned here: split to the proposed roadmap HilbertSiegelModularVarieties (see restructure). |
| `PAPER-BOXER-CALEGARI-GEE-PILLONI-21/45` | none | Not planned here: split to the proposed roadmap HilbertSiegelModularVarieties (see restructure). |
| `PAPER-BOXER-CALEGARI-GEE-PILLONI-21/46` | none | Not planned here: split to the proposed roadmap HilbertSiegelModularVarieties (see restructure). |
| `PAPER-BOXER-CALEGARI-GEE-PILLONI-21/182` | none | Not planned here: split to the proposed roadmap HilbertSiegelModularVarieties (see restructure). |
| `PAPER-BOXER-CALEGARI-GEE-PILLONI-21/183` | none | Not planned here: split to the proposed roadmap HilbertSiegelModularVarieties (see restructure). |
| `PAPER-BOXER-CALEGARI-GEE-PILLONI-21/209` | none | Not planned here: split to the proposed roadmap HilbertSiegelModularVarieties (see restructure). |
| `PAPER-BOXER-CALEGARI-GEE-PILLONI-21/211` | none | Not planned here: split to the proposed roadmap HilbertSiegelModularVarieties (see restructure). |
| `PAPER-BOXER-CALEGARI-GEE-PILLONI-21/212` | none | Not planned here: split to the proposed roadmap HilbertSiegelModularVarieties (see restructure). |
| `PAPER-BOXER-CALEGARI-GEE-PILLONI-21/213` | none | Not planned here: split to the proposed roadmap HilbertSiegelModularVarieties (see restructure). |
| `PAPER-BOXER-CALEGARI-GEE-PILLONI-21/214` | none | Not planned here: split to the proposed roadmap HilbertSiegelModularVarieties (see restructure). |
| `PAPER-BOXER-CALEGARI-GEE-PILLONI-21/221` | none | Not planned here: split to the proposed roadmap HilbertSiegelModularVarieties (see restructure). |
| `PAPER-BOXER-CALEGARI-GEE-PILLONI-21/321` | none | Not planned here: split to the proposed roadmap HilbertSiegelModularVarieties (see restructure). |
| `PAPER-BOXER-CALEGARI-GEE-PILLONI-21/333` | none | Not planned here: split to the proposed roadmap HilbertSiegelModularVarieties (see restructure). |

## Upstream notes

- HilbertModularVarietiesAndShimuraCurves: The parent is TauCetiRoadmap pull request #1005; the R18.x nodes cited here are its accepted atlas packets (README sections R18.1–R18.4 there). Its R18.4.29 quaternionic Ihara patching functor patches types at a place away from p and is not the patching functor at v planned in GK.1.
- CompletedCohomologyPartII: TauCetiRoadmap pull request #1035 §5.5 owns Auslander regularity and grades of O⟦U⟧ for torsion-free uniform U; Gee–Newton Appendix A beyond Lemma A.15 (power-series grade comparison, Cohen–Macaulay transfer, miracle flatness) is planned here in GK.2.
- PadicMeasuresIwasawaAlgebras: Read the current Tau Ceti source TauCeti/Algebra/CompletedGroupAlgebra/Basic.lean: TauCeti.completedGroupAlgebra R Γ is the inverse limit over open normal subgroups. It is not at f790474, so it is an imported current-library carrier, never a new target or a carrier assumed in the suggested file.
- UPSTREAM:TauCetiRoadmap: Independent review on 2026-10-19 read current TauCetiRoadmap main at 0d144d044dacebca17b654695b6f1ad58f159b27, read-only. Checked the nine post-snapshot roadmaps and the neighbouring RepresentationTheory and ModularInduction documents; their carriers and representation APIs are suppliers, not replanned here. No existing global BHHMS §8 roadmap was found.
- UPSTREAM:TauCeti: Independent review on 2026-10-19 read current Tau Ceti main at a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039, read-only, including the completed-group-algebra carrier and neighbouring representation declarations. These existing carriers are suppliers, not targets for development here; the suggested file continues to use only the pinned baseline.

## Sources

- **BHHMS23**: Christophe Breuil, Florian Herzig, Yongquan Hu, Stefano Morra and Benjamin Schraen, *Gelfand–Kirillov dimension and mod p cohomology for GL2*, arXiv:2009.03127v7 (9 June 2023, marked final version); Inventiones Mathematicae 234 (2023), 1–128, doi:10.1007/s00222-023-01202-8, [source](https://arxiv.org/abs/2009.03127v7). Read: §1.1–1.4, pp. 2–11; §2.2, p. 13; §8.1–8.5 with all statements and proofs, pp. 86–109; §2.3 fundamental-character conventions, p. 14; Proposition 4.2.1, p. 28; Corollary 4.2.6, pp. 33–34; §4.3 and Proposition 4.3.1, pp. 34–35 (gap contract statements); §4.3, Proposition 4.3.1 and proof, Lemma 4.3.2 and Proposition 4.3.3 with proofs, pp. 34–40.
- **EGS15**: Matthew Emerton, Toby Gee and David Savitt, *Lattices in the cohomology of Shimura curves*, arXiv:1305.1594v3 (19 November 2014); Inventiones Mathematicae 200 (2015), 1–96, [source](https://arxiv.org/abs/1305.1594v3). Read: §2.1 (Definition 2.1.1, Lemmas 2.1.2–2.1.6, the description of D(ρ)), pp. 9–11; Propositions 3.5.1–3.5.2, pp. 14–15; §6.1–6.4 (Definitions 6.1.1, 6.1.3, Lemma 6.1.4, the quaternionic spaces, (6.1) and functorial patching), pp. 32–37; Theorems 7.1.1 and 7.2.1, pp. 42–43; §10.1, definitions and proof of Proposition 10.1.11, pp. 59–65.
- **GN22**: Toby Gee and James Newton, *Patching and the completed homology of locally symmetric spaces*, arXiv:1609.06965v5 (18 November 2019); Journal of the Institute of Mathematics of Jussieu 21 (2022), 395–458, [source](https://arxiv.org/abs/1609.06965v5). Read: Appendix A.1 (Definitions A.2, A.5, Proposition A.4, Lemmas A.7–A.9), pp. 42–44; §§A.12–A.30 (Proposition A.13, Lemmas A.15–A.19, A.21–A.28, Corollary A.29, Proposition A.30), pp. 45–50; §4.3, Proposition 4.3.1 and proof, pp. 31–32.
- **GK14**: Toby Gee and Mark Kisin, *The Breuil–Mézard conjecture for potentially Barsotti–Tate representations*, arXiv:1208.3179v5; Forum of Mathematics, Pi 2 (2014), e1, [source](https://arxiv.org/abs/1208.3179v5). Read: Introduction, Theorems A and B, pp. 2–4; §5.2 (Remark 5.2.2), p. 26; §5.5 (Definitions 5.5.2–5.5.3, Corollary 5.5.4 and proof), pp. 33–35; §5.4.1, the augmentation surjection and module comparison, pp. 30–31; Corollary 5.5.7 and proof, pp. 35–36.
- **DL21**: Andrea Dotto and Daniel Le, *Diagrams in the mod p cohomology of Shimura curves*, arXiv:1909.12219v2; Compositio Mathematica 157 (2021), 1653–1723, [source](https://arxiv.org/abs/1909.12219v2). Read: §6.1 (spaces of mod p automorphic forms, Remark 6.1, Theorem 6.2), pp. 53–54; §6.2.1–6.2.2, pp. 54–55.
- **LE19**: Daniel Le, *Multiplicity one for wildly ramified representations*, arXiv:1708.04582v2; Algebra & Number Theory 13 (2019), 1807–1827, [source](https://arxiv.org/abs/1708.04582v2). Read: Lemma 4.5 and its proof, §4, p. 16.
- **LMS22**: Daniel Le, Stefano Morra and Benjamin Schraen, *Multiplicity one at full congruence level*, arXiv:1608.07987v3; Journal of the Institute of Mathematics of Jussieu 21 (2022), 637–658, [source](https://arxiv.org/abs/1608.07987v3). Read: §4, Lemma 4.5 and Proposition 4.6 with their proofs, pp. 14–15.
- **BDJ10**: Kevin Buzzard, Fred Diamond and Frazer Jarvis, *On Serre's conjecture for mod ℓ Galois representations over totally real fields*, arXiv:0810.2106v5; Duke Mathematical Journal 155 (2010), 105–161, [source](https://arxiv.org/abs/0810.2106v5). Read: §3.1–3.2, the definition of W_p(ρ) in the irreducible case (subsets J of the 2f embeddings mapping bijectively to the f embeddings) and in the reducible case (a subset of the semisimple set cut out by the extension class); §4, statements of Lemmas 4.6, 4.10 and 4.11.
- **CEGGPS16**: Ana Caraiani, Matthew Emerton, Toby Gee, David Geraghty, Vytautas Paškūnas and Sug Woo Shin, *Patching and the p-adic local Langlands correspondence*, arXiv:1310.0831v5 (1 July 2016); Cambridge Journal of Mathematics 4 (2016), 197–287, [source](https://arxiv.org/abs/1310.0831v5). Read: §2.12, Proposition 2.13, Remark 2.14 and the proof, p. 34; Lemmas 4.17–4.18 and proofs, pp. 62–66.
- **HAM75**: Eloise Hamann, *On power-invariance*, Pacific Journal of Mathematics 61 (1975), no. 1, 153–159, [source](https://msp.org/pjm/1975/61-1/pjm-v61-n1-p17-p.pdf). Read: Theorem 4 and proof, printed p. 155 (PDF p. 4), read directly.
- **STACKS**: The Stacks project authors, *The Stacks project*, online, accessed 2026-10-19, [source](https://stacks.math.columbia.edu). Read: Tag 05G8 (surjective endomorphisms of finite modules are injective); Tag 00MK (local criterion of flatness); Tag 090V (Auslander–Buchsbaum).
- **BRE14**: Christophe Breuil, with an appendix by Lassina Dembélé, *Sur un problème de compatibilité local-global modulo p pour GL₂*, Public author copy; Journal für die reine und angewandte Mathematik 692 (2014), 1–76; locators use the author-copy pagination, [source](https://www.imo.universite-paris-saclay.fr/~christophe.breuil/PUBLICATIONS/compamodp.pdf). Read: Lemma 9.2 and its proof, pp. 54–55.

## Independent review

Accepted after correction by Codex, session codex-4F8teW, on 2026-10-19. All 40 targets, 18 baseline declarations, supplier contracts, 80 API items and 54 definition/construction tests were checked. The four explicit gaps and three supplier requests remain recorded; this is an accepted planning pass rather than a claim that those gaps are closed. The suggested Lean file elaborated at Mathlib 082e2d3 with only eight permitted `sorry` warnings. See [the review report](../reviews/REV-DESIGN-HilbertModularVarietiesAndShimuraCurvesPartII.md).
