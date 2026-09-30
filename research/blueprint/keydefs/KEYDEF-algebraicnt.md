# KEYDEF-algebraicnt — Number fields and class field theory

Complete survey by **Codex — codex-J6LwjP**, 2026-09-30. This is a definition/API survey under PROTOCOL §19, not a paper extraction, proof-closure certificate, or claim of Lean formalization.

The 382 input definitions/constructions from 44 papers were read in full. The whole catalogue index and all 207 paper item files were searched (28,537 items); matching definition/construction statements and their surrounding catalogue records were then read. This does **not** mean that all 207 papers or all their proofs were reread. Fresh primary-source reading was selective and is recorded below.

Fourteen notions survive the definition, substantial missing work, two-paper, importance and discriminating-API tests. Counts below are distinct papers backed by the JSON item IDs; a paper is counted once within an entry. An item can witness different genuinely distinct objects, notably densities versus Siegel polynomials and adic cohomology versus derived limits.

| Definition | Papers | Existing owner stages | Size |
|---|---:|---|---|
| Hermitian lattices and integral duality | 9 | `GeometryOfNumbersAndQuadraticArithmetic:GN.2` | L |
| Sequential derived inverse limits | 8 | `ArithmeticGaloisDuality:D7`; `ArithmeticGaloisDuality:R02.1`; `CompletedCohomologyPartII:CC.2` | XL |
| Local representation densities | 7 | `GeometryOfNumbersAndQuadraticArithmetic:GN.3` | XL |
| Successive minima | 5 | `GeometryOfNumbersAndQuadraticArithmetic:GN.1` | L |
| Quadratic lattices over local integer rings | 4 | `GeometryOfNumbersAndQuadraticArithmetic:GN.2` | L |
| Normalized local Siegel series | 4 | `GeometryOfNumbersAndQuadraticArithmetic:GN.3` | L |
| Kato torsion Tate coefficient complexes | 3 | `HigherLocalFieldsAndHigherClassFieldTheory:HL.2` | XL |
| Modified adelic zero-cycle complex | 2 | **Gap: no stage** | XL |
| Generalized genus characters of binary quadratic forms | 2 | `GeometryOfNumbersAndQuadraticArithmetic:GN.2` | L |
| Classical Grothendieck–Witt and symplectic K-theory | 2 | `GeometryOfNumbersAndQuadraticArithmetic:GN.6` | XL |
| Continuous étale cohomology of adic sheaves | 2 | `ArithmeticGaloisDuality:D7` | XL |
| Kato complexes | 2 | `HigherLocalFieldsAndHigherClassFieldTheory:HL.6` | XL |
| Minkowski-reduced bases | 2 | `GeometryOfNumbersAndQuadraticArithmetic:GN.3` | L |
| Geometric stabilizers with outer Galois action | 2 | **Gap: no stage** | XL |

## Coverage and decisions

Exactly **50** distinct input items witness the retained entries, **49** are owned elsewhere, **136** are in the reasoned reserve, and **147** are routine: **382/382**, with no unaccounted item. The entries additionally cite **24** items outside the input, for 74 distinct evidence items. Every evidence item is a catalogue definition or construction, not a theorem used to inflate a count.

The JSON is the item-level ledger. Its reserve records criterion-specific reasons; “routine” follows §19 and includes single-paper specializations and technical proof constructions, not just easy proofs. In particular, routine classification does not certify a theorem, validate a source conjecture, or mark a library item as built.

- **Existing lattice and cohomology carriers are imports.** `IsZLattice`, covolume, the rational integral symmetric lattice, and canonical continuous group cohomology are not rebuilt. Ordinary lattice kernels, orthogonal complements, gcd-minor constructions and proof-specific weighted sums do not become shared key definitions. Selmer groups, local conditions and mapping fibres go to `SelmerIwasawaCohomology:L2/L4`; tangent conditions still require their deformation-theory supplier. D7/R02.5 are arithmetic consumers of this Selmer construction.

- **Hermitian lattice scope is broader than freeness.** Lipnowski–Tsimerman need projective lattices; Eischen–Harris–Li et al. supply the localized perfect pairing at p, not a claim of a globally self-dual lattice. The carrier permits fractional forms before its integrality predicate. The finite-type convention is explicit: the unramified rank-one example has O_E-type 1 and O_F-type 2, matching the distinction in Feng–Yun–Zhang. Skew-hermitian and line-bundle-valued lattices were not silently counted as ordinary O_E-hermitian lattices; thus Caraiani–Scholze’s skew form and Feng–Galatius–Venkatesh’s omega-valued rank-one Picard groupoids do not inflate this count.

- **Integral local arithmetic is an extension of the existing field theory.** Upstream QuadraticFormInvariants and GlobalQuadraticForms supply rational/field invariants and classification; Completed/IntegralLattices supplies rational Z-lattices and discriminant modules. They do not supply the local O_F and projective hermitian constructions retained here. The local quadratic entry records the factor 2 between a symmetric form B and the polar form of B(x,x); the Z_2 hyperbolic example rules out a universal diagonalization assertion.

- **A density and its Siegel polynomial are different objects.** The first is a normalized congruence-count limit; the second is an interpolating polynomial requiring a reference denominator and chosen variable. The self-dual rank-one values 4/3 and 1 distinguish them. Li–Zhang uses X=(-q)^(-k), while He–Li–Shi uses q^(-2k) and a factor -2 in the derivative. Ramified and fractional integral models retain their level shifts.

- **Successive minima and reduced bases are different objects.** Minima concern real independence; the reduced-basis recursion requires extension to a Z-basis. The vector (2,0) and the basis (e_1,e_1+e_2) distinguish both mistakes. The relaxed 3/2-short basis starting with 1 in BSTTTZ is reserved, not counted as a Minkowski-reduced basis. Browning–Sawin’s function-field/Laurent-series minima are not counted as Euclidean minima.

- **Generalized binary-form genus characters are an extension, not another ideal-class genus theory.** Upstream Multiquadratic retains its character and genus-field owners. The retained object allows imprimitive forms away from Delta, arbitrary admissible discriminants and a supported value 0; the three explicit forms in the API test these distinctions.

- **Ordinary completion is reserved; derived limits survive.** The completion A^hat=lim_n A/nA is a direct construction from existing quotients and limits, also used in HW16 and HW20. Its quotients need not be finite, so “profinite completion” needs care. The Z tower with multiplication by 2 has lim=0 and nonzero lim^1=Z_2/Z; this forces the derived-limit entry. A cone triangle in a bare triangulated category is not a functorial enhancement.

- **Tame and wild coefficients must not be conflated.** Roots of unity in a separable closure do not realize Z/p(1) in characteristic p. Kato’s shifted logarithmic de Rham–Witt coefficients and the dimension-indexed Kato complex get separate entries. Wild residues are not claimed without the hypotheses of the cited constructions; the initial complex API uses invertible torsion.

- **One-paper near misses remain visible.** The reserve includes admissible Gamma-groups/random-group measures; Koymans–Pagano raw cocycles, expansion maps, higher Artin pairings and additive systems; logarithmic potential and capacity in Smith24; negligible cohomology in Merkurjev–Scavia; Bright–Newton’s evaluation filtration; Pic_plus/Br_plus; exact horizontal-lattice and hermitian-mass packages. Different definitions sharing words such as “density”, “horizontal” or “genus” are not a second instance. Their future source-faithful blueprints remain necessary.

- **Numerical predicates and theorem statements do not create carriers.** Gonality also appears in Bakker–Tsimerman/06 and Canning–Larson–Payne/47; it is reserved under criterion 2 as a minimum of degrees using the imported curve/morphism interface, not under the two-paper criterion. Brill–Noether, normalization and map parameter spaces need their geometric owners. Period/index, u-invariant and C_i predicates receive the same distinction between a numerical/quantified definition and its difficult theorems. The conjecture-labelled inputs and the proof parameters in the random-polynomial and Smith-method arguments are not promoted.

## Ownership gaps and duplication

1. **Modified adelic zero-cycle complex:** `owners: []`. The input route proposes `HeightsRationalPointsPartIIZeroCycles`, but no actual stage in the atlas or new-roadmap files constructs it. RP.2 concerns adelic points and their Brauer pairing, which does not supply Chow groups modulo rational equivalence or the archimedean norm quotients. The API asks for the complex and its functoriality; general exactness (E) remains a conjectural property, not an API theorem.

2. **Outer Galois stabilizers:** `owners: []`. The input proposes `HeightsRationalPointsPartIIHomogeneousMassey`, likewise without actual stages. RP.3 plans torsor-descent comparisons but does not explicitly provide the geometric stabilizer extension, continuous outer action and stable cyclic filtration. These need an explicit owner in that proposed continuation. The V_4 example with cyclic order-three action distinguishes outer supersolvability from abstract supersolvability.

3. **Sequential derived limits:** D7 explicitly calls itself the sole generic owner and R02.1 develops its coefficient comparison. `CompletedCohomologyPartII:CC.2`, despite depending on D7/R02, also says to construct the derived inverse limit and Milnor sequence. The JSON records both roadmaps, producing the duplication warning. Resolve the textual overlap by making CC.2 instantiate/import the generic construction and prove its particular tower’s topology and Mittag–Leffler/control conditions; it should not build another generic Rlim.

These are the checker’s three expected warnings, not unaccounted items. No upstream roadmap was edited. No other pending/promoted key-definition survey was present at the base; the remote main survey paths were rechecked before submission.

Additional boundaries are recorded rather than hidden dependencies. The ordinary theta kernel belongs to `MetaplecticAutomorphicForms:MP.5`; GN.3 should supply arithmetic lattice/density interfaces. Generic Selmer mapping fibres belong to L2. Derived completion remains with `DerivedDeRhamCohomology:DD.1`; citing a completion definition here witnesses its Rlim prerequisite, not ownership of derived completion. MotivicEtaleKTheory:M.1 imports arithmetic continuous coefficients from D7; its KU checkpoints are aggregations and are not additional generic owners.

## Dependencies and size

The JSON dependency graph names the other retained key definitions and existing Tau Ceti layers, with no cycles: local densities depend on local quadratic/hermitian lattices; Siegel series on densities; reduced bases on minima; Kato complexes on Kato coefficients; adic cohomology on derived limits. Field quadratic classification, Hilbert symbols, ordinary genus theory and discrete Galois/Kummer cohomology are upstream imports.

Several large prerequisites have no key-definition ID yet, so their existing supplier stages are recorded here rather than inventing unresolved `dependsOn` identifiers: logarithmic de Rham–Witt from `CrystallineCohomology:CR.4`; group completion and the spectrum foundation from `StableHomotopyKTheory:H.4/H.5`; scheme étale sheaves and derived global sections from the geometric étale suppliers; ordinary cycles/motivic complexes from `MotivicEtaleKTheory:M.4` and the cycle foundations. D7’s adic/equivariant extension must import the geometric site rather than construct a second one.

L means a carrier with its basic API and one or two missing prerequisites. XL records the multi-file sheaf, enhanced-derived, cycle, wild-coefficient or homotopy machinery. No M entry was forced merely because its informal notation fits on one line. This survey supplies discriminating API targets; it does not promise proof closure for all their prerequisites.

## Pinned-library evidence

Mathlib was read at `082e2d37e8b0463410cdb532e111cd43d5a66174`; Tau Ceti at `f790474821cf4256814db967cb154e7af3d0c369`. Both commits were verified locally. The declaration statements below were opened at those pins, not inferred from search hits. The reviewed `data/library-coverage.json` entries for GN.0–GN.6, D7/R02 and HL.2/HL.6 were consulted; GN.0’s existing carriers and covolume are not claimed missing. The upstream ProfiniteCohomology, IntegralLattices, GlobalQuadraticForms, QuadraticFormInvariants and Multiquadratic scope/convention texts were also read.

| Declaration read | Pinned source | Boundary checked |
|---|---|---|
| `tauceti:TauCeti.BrauerGroup.baseChange` | [TauCeti/Algebra/BrauerGroup/BaseChange.lean:136](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Algebra/BrauerGroup/BaseChange.lean#L136) | Field Brauer-group base change, not a scheme CH0 pairing. |
| `tauceti:TauCeti.ExactK0` | [TauCeti/CategoryTheory/GrothendieckGroup/Exact.lean:162](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/CategoryTheory/GrothendieckGroup/Exact.lean#L162) | Ordinary K0 via conflation relations, not GW or a higher spectrum. |
| `tauceti:TauCeti.KummerCoeff` | [TauCeti/FieldTheory/GaloisCohomology/Coefficients.lean:107](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/FieldTheory/GaloisCohomology/Coefficients.lean#L107) | Discrete additive roots of unity in a separable closure. |
| `tauceti:TauCeti.IntegralLattice` | [TauCeti/LinearAlgebra/IntegralLattice/Basic.lean:61](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/LinearAlgebra/IntegralLattice/Basic.lean#L61) | Rational symmetric space and full integral Z-submodule. |
| `tauceti:TauCeti.Multiquadratic.genusCharFun` | [TauCeti/NumberTheory/Multiquadratic/Quadratic/GenusCharacter/Basic.lean:212](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/Multiquadratic/Quadratic/GenusCharacter/Basic.lean#L212) | Product of prime-discriminant integer characters, not the supported binary-form function. |
| `mathlib:MulAut.conj` | [Mathlib/Algebra/Group/End.lean:723](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Group/End.lean#L723) | Inner conjugation homomorphism; no geometric outer action. |
| `mathlib:HomologicalComplex` | [Mathlib/Algebra/Homology/HomologicalComplex.lean:59](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Homology/HomologicalComplex.lean#L59) | Objects, differentials, shape and d-composite-zero. |
| `mathlib:CochainComplex.mappingCone` | [Mathlib/Algebra/Homology/HomotopyCategory/MappingCone.lean:57](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Homology/HomotopyCategory/MappingCone.lean#L57) | Existing cochain mapping cone, not a derived tower functor. |
| `mathlib:Submodule.IsLattice` | [Mathlib/Algebra/Module/Lattice.lean:67](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Module/Lattice.lean#L67) | Finite generation plus full scalar span; does not itself assert real discreteness. |
| `mathlib:IsZLattice` | [Mathlib/Algebra/Module/ZLattice/Basic.lean:432](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Module/ZLattice/Basic.lean#L432) | Discrete Z-submodule with full scalar span. |
| `mathlib:ZLattice.covolume` | [Mathlib/Algebra/Module/ZLattice/Covolume.lean:72](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Module/ZLattice/Covolume.lean#L72) | Real-valued additive covolume. |
| `mathlib:ZLattice.covolume_eq_measure_fundamentalDomain` | [Mathlib/Algebra/Module/ZLattice/Covolume.lean:84](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Module/ZLattice/Covolume.lean#L84) | The same covolume equals the measure of a fundamental domain. |
| `mathlib:CategoryTheory.Functor.IsMittagLeffler` | [Mathlib/CategoryTheory/CofilteredSystem.lean:137](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/CofilteredSystem.lean#L137) | Eventual stabilization of transition images. |
| `mathlib:CategoryTheory.Limits.limit` | [Mathlib/CategoryTheory/Limits/HasLimits.lean:181](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Limits/HasLimits.lean#L181) | Ordinary chosen categorical limit under HasLimit. |
| `mathlib:CategoryTheory.Pretriangulated` | [Mathlib/CategoryTheory/Triangulated/Pretriangulated.lean:65](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Triangulated/Pretriangulated.lean#L65) | Distinguished triangle axioms; no functorial cone choice. |
| `mathlib:Abelianization.of` | [Mathlib/GroupTheory/Abelianization/Defs.lean:57](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/GroupTheory/Abelianization/Defs.lean#L57) | Canonical quotient map to group abelianization. |
| `mathlib:LinearMap.BilinForm.IsAlt` | [Mathlib/LinearAlgebra/BilinearForm/Properties.lean:236](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/BilinearForm/Properties.lean#L236) | Diagonal vanishing, stronger than skew symmetry in characteristic two. |
| `mathlib:QuadraticMap.Isometry` | [Mathlib/LinearAlgebra/QuadraticForm/Isometry.lean:36](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/QuadraticForm/Isometry.lean#L36) | A linear map preserving q; injectivity is not a constructor field. |
| `mathlib:LinearMap.isSymm_iff_isHermitian_toMatrix` | [Mathlib/LinearAlgebra/SesquilinearForm/Star.lean:44](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/SesquilinearForm/Star.lean#L44) | Conjugate-linear first variable; swap arguments for the paper convention. |
| `mathlib:continuousCohomology` | [Mathlib/RepresentationTheory/Homological/ContCohomology/Basic.lean:131](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory/Homological/ContCohomology/Basic.lean#L131) | The actual pinned abbreviation takes n and a TopRep and returns TopModuleCat cohomology. |
| `mathlib:WittVector` | [Mathlib/RingTheory/WittVector/Defs.lean:52](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/WittVector/Defs.lean#L52) | Coefficient sequences with the Witt-vector operations, not a differential/logarithmic complex. |

Declaration-name searches and full-source phrase searches for the retained notions found no additional implementation at these pins (including successive minima, reduced bases, local density/Siegel series, Kato complexes and GW). Searches are bounded evidence, not a theorem of absence: the precise adjacent declarations and missing interfaces above make the claim reviewable.

## Primary-source reading record

All successful sources below were retrieved and the listed passages read on **2026-09-30 UTC**. Page numbers marked “PDF” are one-based physical pages of the downloaded file. This is a selected-reading record; no full-paper-reading date is asserted. Catalogue locators provide the additional cross-area instance evidence listed in the JSON. Hashes pin the bytes actually read.

| Public source | Passages read for this survey | PDF pages | SHA-256 |
|---|---|---:|---|
| [Li–Zhang, unitary local densities](https://arxiv.org/pdf/1908.01701v3) | PDF 8, 15–18: hermitian lattice conventions; representation functor; unramified normalization, rank-one values and functional equation | 92 | `7db1843f90c3e79741f8d58d92b6bb42b0a3b7ae001c8f9419f43b08c2119d49` |
| [Bhargava–Shankar–Wang 2022](https://arxiv.org/pdf/1611.09806v3) | PDF 24, §5 footnote: shortest vectors extendible to a Z-basis, not merely independent vectors | 29 | `6a7252706b283de3f1ee254fe6b56fd76e215f789550346aba12861dfd02af83` |
| [Bruinier–Ehlen–Yang](https://link.springer.com/content/pdf/10.1007/s00222-021-01038-0.pdf) | PDF 60–61, journal 752–753: Definition 7.1 and local Hilbert-symbol/conjugation conventions | 93 | `729e4f9daff82e8e98ae27bcd8084c4e89c8a08b91f2b5106c048ab35cda4160` |
| [Harpaz–Wittenberg 2016](https://www.math.univ-paris13.fr/~wittenberg/zcfib.pdf) | PDF 1–2: adelic modified CH0, completion, pairing and property (E) | 54 | `5c1d91c21b0d53dcc32435ea6cb77ce274820fea249790ebf8d8d2199278a424` |
| [Harpaz–Wittenberg 2020](https://www.math.univ-paris13.fr/~wittenberg/zceh.pdf) | PDF 5, 18–19: outer actions, geometric stabilizers and abelianization | 31 | `2e425ee63d77e6fc53ddd76aca8c8b7ab36be95b078fbcec5e2a8d7f325e6ad9` |
| [Harpaz–Wittenberg 2023](https://www.math.univ-paris13.fr/~wittenberg/globalmassey.pdf) | PDF 7–8: extension G_x, basepoint transport and outer supersolvability | 33 | `d95100ebd7210600873351ffbe1f3f1dc0fd3f36b815ca70286884801afc546f` |
| [Jannsen](https://annals.math.princeton.edu/wp-content/uploads/annals-v183-n1-p01-p.pdf) | PDF 1–2, 40–44: wild coefficient shifts, dimension-indexed C^{r,s}, normalization residues and the hypotheses for wild coefficients | 71 | `26dde9260f6475e4f6acbfbe651e18fac0d443a5f318fbf3974efc9f809f7d71` |
| [Dittmann–Pop](https://arxiv.org/pdf/2012.01307v2) | PDF 3–4, §2: coefficient convention, residues and C^{1,0} indexing | 19 | `f9f26f7d8d6b5cb6bf86d04bf97f8f99069d8d676623cebe706e90ea8dcb2c1f` |
| [Calmes et al.](https://arxiv.org/pdf/2009.07225v4) | PDF 2, 9–10: classical forms group completion, convention R.7 and negative-even/symplectic distinction | 63 | `1e4b6720055ebdce0012f5780bfc7cdb5b853e32f29b17224a1be0bc676f770c` |
| [Feng–Galatius–Venkatesh](https://link.springer.com/content/pdf/10.1007/s00222-022-01127-8.pdf) | PDF 26–27, journal 250–251: SP(Z), KSp and coefficient conventions; only the introductory part of PDF 36 was also inspected | 95 | `5da9a2b28d13b2b22a262a81650188025020d92238ec2b47404d177ef91d7b4d` |
| [Browning–Le Boudec–Sawin](https://arxiv.org/pdf/2006.02356v1) | PDF 7–8, §3.1: intrinsic lattice, dual, successive minima and Minkowski comparison | 66 | `210c746b6b69d466d19a0a90e8f00ca57bf2d4dfb1818b0a9955fe91ae061efb` |
| [Bright–Newton](https://link.springer.com/content/pdf/10.1007/s00222-023-01210-8.pdf) | PDF 7–8, journal 825–826: Z/n(r), H_n^q and the characteristic-p Kummer comparison | 73 | `0e96ca755aa61e748bca722ea2c1107bed115575ff4fa8d6c751b721c33e79d2` |
| [Kings–Sprang](https://arxiv.org/pdf/1912.03657v4) | PDF 81, Appendix B: triangle for derived limits, nonunique isomorphism and Hom exact sequence | 85 | `fab8e605123cf9c399753b7114c4fd65000e1863e3507abdd4129c8c940fbb72` |
| [Li–Zhang, orthogonal local densities](https://www.math.columbia.edu/~chaoli/KRO.pdf) | PDF 7–8, §2.1: quadratic lattices, dual and elementary divisors; odd residue characteristic | 80 | `c02a94d47eee2634fda148a162b54bb9aa90855eb140fb809959ab195cabfbdd` |
| [Disegni–Liu](https://link.springer.com/content/pdf/10.1007/s00222-024-01243-7.pdf) | PDF 103–105, journal 321–323, §A.2: systems of sheaves, C_L, admissibility and equivariant continuous-cohomology comparison | 153 | `e8c4e026fab0fe89fd7dcbc724009af7b867ad910937ffb9fa7e72289f0f1ef8` |

The attempted publisher path `annals-v202-n1-p01-p.pdf` for Kings–Sprang returned HTTP 404; the successfully read arXiv v4 above is the source of the Appendix B claims. No evidence is attributed to the unavailable URL.

## Validation

- `scripts/check_keydefs.py research/blueprint/keydefs/KEYDEF-algebraicnt.json`, with the pinned declaration index: **0 errors, 3 expected warnings**, explained above.
- The input-accounting audit finds no missing item and no duplicate routine ID; entries are sorted by distinct cited-paper count. All library references resolve in the pinned declaration index.
- Finite arithmetic spot checks enumerate the unramified hermitian line over Z/3^N with norm x²+y²: counts 4, 12, 36 for N=1,2,3, each giving 4/3 after normalization. The quadratic-line counts are 2 at p=3,5 and 4 at p=2 for N=3,4. The rank-one Siegel polynomials at valuations 0,1,3 give (value at 1, central derivative)=(1,0),(0,1),(0,2). The binary-form discriminants are 20,20,200. These are spot checks of worked values, not proofs of general API theorems.
- Swarm deliverable/path validation and whitespace checks are run before submission. No Lean file is a deliverable for this survey, and no Lean compilation or new library build was performed.
