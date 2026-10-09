# Parameter stacks, invariant theory and spectral coefficients

This roadmap constructs integral local Langlands parameter spaces, their excursion algebra and the representation theory controlling their perfect complexes. The local parameter classification specializes the general reconstruction theorem owned by IntegralHeckeAndGaloisDeterminants. The categorical universal properties of the spectral action belong to ExcursionOperatorsAndSpectralAction.

Revision 2 for issue #6977, by Codex, session `codex-iNzDyp`, 9 October 2026. The complete target-level pass has 79 retained declarations: 14 definitions, 11 constructions, 45 theorems, 7 comparisons and 2 lemmas. It specifies 140 API items and 90 unit tests, with 31 planets and 31 baseline citations. Ten former local targets are explicitly delegated below. All eight stages are **planned**, none is closed, and every implementation remains **unchecked**. The existing independent review is retained as historical review evidence; this revision awaits its own independent review.

## Conventions

Let E be a nonarchimedean local field with residue characteristic p and residue cardinality q, and let ℓ≠p. Let H denote the pinned split dual group, let finite Q act on H through the standard Weil action, and write J=H⋊Q. A crossed cocycle obeys c(γδ)=c(γ)·γ(c(δ)); its lift has the prescribed projection η:Γ→Q. Gauge by h acts as cʰ(γ)=h c(γ) γ(h)⁻¹. Allowing an arbitrary projection into Q would describe a different parameter problem.

Coefficients have the relatively discrete condensed structure Λ_disc⊗_{ℤ_ℓ,disc}ℤ_ℓ. In characteristic ℓ this is discrete. In characteristic zero it permits infinite-image continuous inertia characters and requires a locally finite-type coefficient condition. An ordinary continuous-group prototype does not express this full coefficient convention.

Geometric Frobenius σ has σ⁻¹τσ=τ^q and geometric degree 1. Thus σNσ⁻¹=q⁻¹N and wNw⁻¹=q^(−deg(w))N. DHKM and the upstream Weil-group supplier use arithmetic Frobenius F=σ⁻¹, with arithmetic degree −deg and scaling q. The finite-presentation model is chosen once over ℤ[1/p]; its ℤ_ℓ models are base changes. Canonical framed comparison of choices is asserted over ℤ_ℓ via continuous extension, rather than assumed over ℤ[1/p]. The scheme has relative dimension dim H and total dimension dim H+1 over a one-dimensional coefficient base.

Three invariant-theoretic conclusions have different hypotheses. The coarse quotient, semisimple geometric classification and universal-homeomorphism comparison hold for every ℓ≠p. After inverting ℓ the excursion comparison is an isomorphism. Integral isomorphism, higher-cohomology vanishing, unrestricted coefficient base change and generation of actual Perf require ℓ∤|π₁(H)_tors|. Component idempotents and algebraic finite-Q reconstruction do not require ℓ∤|Q|.

Continuous Weil cohomology uses condensed or continuous cochain complexes, not the abstract-group cohomology complex with topology forgotten. Singularities use H¹(L^∨) of the full cotangent complex and the dual Lie algebra. The good-filtration connective part is D^{≤0} on IndPerf. Perf^ind is the stable retract closure of the image of Perf(BH); equality with actual Perf is a theorem. The stable categorical centre is π₀End(id_C), and a Schur object has a specified L-algebra identification π₀End(X)=L. Ordinary CatCenter supplies its ordinary-category shadow.

## Ownership and dependency order

LP0 imports the Weil group and ramification carriers from the upstream ClassFieldTheory and LocalFieldsRamification roadmaps. LP1 owns parameter-specific cocycle equations, derived instances and deformation calculations; SF.1 supplies effective fpqc descent, S.1 supplies scheme-perfectness, and E5 is explicitly requested to extend animation to derived quotient-stack QCoh/Perf. DD.0 supplies the full cotangent complex. R03.3 and upstream DGAInfinity Layer 8 supply the requested singular-support and relative Hochschild interfaces. These requests do not assert that those extensions already exist.

The dependency order is LP0 → LP1 → unconditional excursion geometry → IHG general reconstruction → fixed-projection and local-Weil classification. Separately, LP1 → LP3 → integral-invariants and LP4 generation. Highest-weight modules, Kempf vanishing and good filtrations have one owner: the already accepted ReductiveGroupsIntegralRepresentationsPartII candidate. Until its DESIGN assigns stages, the request uses the registered upstream ReductiveGroups Layer 9 as an extension route. The proposed RG2.6 is structural only: fixed-group reductivity, unipotent-class finiteness and related root/centralizer inputs. Neither RG2.5 nor parent Layer 9 is claimed to prove the requested extensions.

The primary confirmed geomlanglands ownership decision assigns FS X.1.1–X.1.3 to ES2 and X.3.1–X.3.4/X.0.1–X.0.2 to ES3. LP4 retains universal representation bundles and VIII.5.1 generation/module comparison. The Map^Σ carrier from VIII.5 is defined at LP3; ES3 should reuse it. It is a category-valued sifted left Kan extension from finite **bases equipped with Γ-torsors**. The total torsor can be infinite when Γ is infinite; a representing derived stack is not asserted.

IHG.0 owns generic reductive and linear trace pseudocharacters; IHG.1 owns finite anchors and reconstruction. LP retains only the prescribed η-fibre, its component-preserving reconstruction specialization, a group-algebra trace adapter and local Weil continuity. The accepted IHG revision 2 supplies disconnected algebraic reconstruction via Quast Theorem 3.7. Its remaining blanket LP3 prerequisite must be replaced by exact unconditional field inputs, as recorded in G6; importing its theorem does not claim that external routing has already changed. No aggregate LP2→IHG edge is proposed.

The all-characteristic finite-anchor argument maximizes minimal-parabolic dimension, then its component count in the disconnected case, before minimizing centralizer dimension and component count. Those generic anchor declarations are delegated to IHG. The discrete-coefficient local argument uses finitely many invariant generators to find an open inertia kernel. Characteristic-zero relatively discrete continuity still has the precisely stated extension obligation G4; neither a connected profinite theorem nor Quast’s circular compactness argument settles it.

SR.6 imports LP1’s selected integral scheme and keeps its finiteness and Hecke consequences. GS.5 imports general reconstruction from IHG and keeps shtuka operators and the global continuity application. The KSS wild-enhancement boundary is specific to quasisplit classical groups, odd residue characteristic and complex coefficients. Its wild correspondence remains conjectural. An admissible extending parameter is required; trivial dual-group component means p↦(1,p), not a constant map into the entire L-group.

### Delegated targets

Former identifiers below identify removed duplicate declarations. They are migration records, not local prerequisites or new theorem nodes. Their existing suppliers were read at the stated contracts. Atlas target and consumer changes outside these deliverables are recorded in the packet’s restructuring proposals.

| Former local target | Existing supplier | Source locator |
| --- | --- | --- |
| `LanglandsParameterStacks:LP4/rational-all-colimits` | `ExcursionOperatorsAndSpectralAction:ES2/mapping-stack-commutes-with-sifted-colimits` | X.1.2 and complete proof, pp.342–343 |
| `LanglandsParameterStacks:LP4/colimit-theorem-and-monoidal-universal-property` | `ExcursionOperatorsAndSpectralAction:ES2/universal-action-theorem` | X.1.1 and proof, pp.340–342 |
| `LanglandsParameterStacks:LP4/integral-universal-property` | `ExcursionOperatorsAndSpectralAction:ES3/integral-universal-action` | X.3.1 and proof, pp.348–349 |
| `LanglandsParameterStacks:LP4/approximation-all-colimits` | `ExcursionOperatorsAndSpectralAction:ES3/approximation-commutes-with-colimits` | X.3.2 and proof, p.349 |
| `LanglandsParameterStacks:LP4/integral-free-group-comparison` | `ExcursionOperatorsAndSpectralAction:ES3/free-group-case` | X.3.3 and proof, pp.349–350 |
| `LanglandsParameterStacks:LP4/sifted-approximation` | `ExcursionOperatorsAndSpectralAction:ES3/discrete-group-presentation` | X.3.4 and proof, p.350 |
| `LanglandsParameterStacks:LP4/weil-approximation-equivalence` | `ExcursionOperatorsAndSpectralAction:ES3/discrete-integral-spectral-action` | X.0.2 p.340 and final combination p.350 |
| `LanglandsParameterStacks:LP4/compactly-supported-actions` | `ExcursionOperatorsAndSpectralAction:ES2/compactly-supported-actions` | X introduction, pp.339–340 |
| `LanglandsParameterStacks:LP2:semisimple-characters/characteristic-zero-anchor` | `IntegralHeckeAndGaloisDeterminants:IHG.1/reductive-stable-tuple` | Proposition11.7, Lemmas11.9–11.10, pp.143–147 |
| `LanglandsParameterStacks:LP2:semisimple-characters/positive-characteristic-anchor` | `IntegralHeckeAndGaloisDeterminants:IHG.1/reductive-stable-tuple` | Theorem4.5 and proof, pp.20–23 |

`ExcursionOperatorsAndSpectralAction:ES3/discrete-integral-spectral-action`: The existing ES3/discrete-integral-spectral-action contract explicitly says tame W. Extend its X.0.2 formulation to every finite-wild discretization and record the all-prime characteristic-zero coefficient version, using LP3 wild-gerbe elimination and LP4 generation. The former LP target is delegated to this owner, but its broader finite-wild contract is a requested extension, not claimed already supplied.

## Sources and reading records

The six inherited public PDFs were downloaded again and their SHA-256 hashes matched. Their recorded 7 October reading scopes are retained below; the revision-specific passages actually read on 9 October are listed separately. Quast is the added primary source for the imported disconnected algebraic theorem. No restricted-library source was needed. Results and source defects are stated in our own words.

### Geometrization of the local Langlands correspondence

Laurent Fargues; Peter Scholze. [Author-hosted 356-page PDF; printed and PDF pages agree. Same SHA-256 as the inherited packet; this pass extends the VIII.5 reading beyond p.301.](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf) Recorded reading: 2026-10-07. SHA-256 `9ab9efbd0df251bfa3b610d1d1d88a8dfb1bdf7c397bd04f4c277280d98ae905`.

- VIII introduction, VIII.1–VIII.4, pp.277–293, statements and proofs
- VIII.5, pp.293–315, including fixed groups, Donkin theorem, the cyclic fixed-locus resolution, fundamental groups, gerbes and wild elimination; statements and proofs
- X introduction and X.1, pp.339–343; X.3, pp.348–350, abstract rational and integral universal properties and proofs. X.2 elliptic applications are outside this packet.

### Chtoucas pour les groupes réductifs et paramétrisation de Langlands globale

Vincent Lafforgue. [Public French arXiv PDF; source numbering is that used in FS. Global shtuka constructions are imported by GS.5, not read or planned here.](https://arxiv.org/pdf/1209.5352) Recorded reading: 2026-10-07. SHA-256 `b37715f9c42862b7560d8b71da07924376e3cbbbe862ef9e89a57d8c91a64295`.

- §10, Lemma10.1 and Proposition10.8, pp.133–139, abstract relations; §11, definitions and Proposition11.7 with Lemmas11.9–11.10 and proof, pp.140–147; Remark11.8 trace comparison.

### G-hat-local systems on smooth projective curves are potentially automorphic

Gebhard Böckle; Michael Harris; Chandrashekhar Khare; Jack A. Thorne. [Published Acta Mathematica 223 (2019) PDF. General potential-automorphy arguments are outside this packet.](https://archive.intlpress.com/site/pub/files/_fulltext/journals/acta/2019/0223/0001/ACTA-2019-0223-0001-a001.pdf) Recorded reading: 2026-10-07. SHA-256 `15c4b9668e335f75225215bb367c1051769990595232f8015f441d2e2c86ba2c`.

- §3.1–§3.2, pp.10–19, all statements and proofs; §4.1–§4.7, pp.19–24, pseudocharacters, reconstruction and all three continuity clauses; Proposition8.3 and proof, p.53.

### Coherent sheaves on the stack of Langlands parameters

Xinwen Zhu. [Public revised arXiv PDF (2025 revision). Lemma3.10 is the Weil–Deligne comparison cited as Lemma3.1.8 by FS; these are different numbering versions, not different assertions.](https://arxiv.org/pdf/2008.02998) Recorded reading: 2026-10-07. SHA-256 `40b5f906d3238b80cde88e51f917e2c7a0f104a1d98bfb7366ac8dc4c35b79b2`.

- §3.1, pp.31–36: discrete groups, strong continuity, Proposition3.7, Lemmas3.9–3.10, Corollary3.11 and Proposition3.12 and proofs.

### Moduli of Langlands parameters

Jean-François Dat; David Helm; Robert Kurinczuk; Gilbert Moss. [Public arXiv PDF; arithmetic Frobenius is inverse to the geometric Frobenius of FS.](https://arxiv.org/pdf/2009.06708) Recorded reading: 2026-10-07. SHA-256 `70b647bb5fbf924f20784a5084f7f38c9a2faf88e04690f38d76fc0be2a3213c`.

- Introduction, Definition1.1 and main theorems, pp.4–7; §4.1, Theorem4.1 and Corollary4.2 with their proofs, pp.29–31.

### Endo-parameters for p-adic classical groups

Robert Kurinczuk; Daniel Skodlerack; Shaun Stevens. [Public arXiv PDF. The wild local Langlands correspondence asserted there is a conjectural boundary, not a theorem here.](https://arxiv.org/pdf/1611.02667) Recorded reading: 2026-10-07. SHA-256 `1cbcbb779d8d4ba8f3339d749b3dd7bc3d2555e6792491338a861d45009d9092`.

- §1.20–§1.21, pp.8–9: enhanced Langlands and extended wild inertial parameters, centralisers, equation(1.1) and restriction.

### Deformations of G-valued pseudocharacters

Julian Quast. [Author-hosted arXiv v1, 23 October 2023, 53 pages; used for the algebraic generalized-reductive theorem imported from accepted IHG revision 2. No continuity claim relies on the defective compactness argument of Theorem 3.8.](https://www.julianquast.de/files/Deformations_of_G-valued_Pseudocharacters.pdf) Recorded reading: 2026-10-09. SHA-256 `67eb82118e49df3f7da6c1e211ad9961fc7323fc4d09d0559bcbc2434eead827`.

- Definition 3.1, pp.11–12; Lemmas 3.4–3.6 and Theorem 3.7 with proof, pp.12–15. The beginning of the Theorem 3.8 continuity proof was compared with the accepted IHG E13 finding.

Revision-specific readings:

- 2026-10-09, `FS-geometrization`: VIII.3.1–VIII.3.8, pp.285–290; VIII.5.1 and Map^Σ setup, pp.293–294,311–312; X introduction/X.1/X.3 ownership passages, pp.339–343,348–350.
- 2026-10-09, `BHKT-local-systems`: Definition 4.1, Remark 4.2, Theorem 4.5 and Proposition 4.7 with proofs, pp.19–24.
- 2026-10-09, `Quast-pseudocharacters`: Definition 3.1, pp.11–12; Lemmas 3.4–3.6 and Theorem 3.7 with proof, pp.12–15. The beginning of the Theorem 3.8 continuity proof was compared with the accepted IHG E13 finding.
- 2026-10-09, `Lafforgue-shtukas`: Proposition 11.7, Lemmas 11.9–11.10 and Remark 11.8, pp.143–147; finite-anchor coordinate continuity and trace comparison.
- 2026-10-09, `FS-geometrization`: VIII.1–VIII.2, pp.277–284; VIII.5.11–VIII.5.16, pp.298–305: relative dimension, continuous duality, monodromy scaling, full cotangent support, derived unit fibre, fixed-group filtrations and corrected weight indices.
- 2026-10-09, `Zhu-arithmetic-parameters`: §3.1, pp.31–36: C-group normalization, Proposition 3.7 Lemmas 3.9–3.10, Corollary 3.11 and Proposition 3.12, integral discretization and Weil–Deligne comparison.
- 2026-10-09, `DHKM-parameters`: §4.1, Theorem 4.1 and Corollary 4.2, pp.29–30: chosen integral model, continuous universal cocycle and canonical comparison over Z_l.
- 2026-10-09, `KSS-endo-parameters`: §§1.20–1.21, pp.8–9: admissible extending complex parameters, centralizers, enhancements and the conjectural wild correspondence.

## Baseline interfaces

Mathlib is pinned at `082e2d37e8b0463410cdb532e111cd43d5a66174`, Tau Ceti at `f790474821cf4256814db967cb154e7af3d0c369`. The reviewed AUDIT-21 coverage was read. All 31 cited declaration statements were read at their recorded pins, including the two group-algebra additions; the scope limits below are preserved. Abstract groups, schemes and ordinary categories do not supply the missing algebraic or stable infinity-category enhancements.

- [`mathlib:Representation`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory/Basic.lean): Abstract group representations on modules. Algebraic regularity, finite-projective coefficient conditions, rational reductive representations and their tensor/derived categories are supplied separately by RG/E5, not by this abstract representation alone.
- [`mathlib:MonoidHom`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Group/Hom/Defs.lean): Group homomorphisms. A parameter is a cocycle, not a homomorphism, but the sections of the L-group projection and the maps F_n -> W indexing the excursion colimit are homomorphisms, and the distinction is exactly what LP0's first node fixes.
- [`mathlib:Subgroup`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Group/Subgroup/Defs.lean): Subgroups. The inertia and wild inertia of W_E, the open P inside the wild inertia, the discrete dense W inside W_E/P, the parabolic and Levi subgroups of G-hat semidirect W_E and the fixed-point subgroup G^P are subgroups.
- [`mathlib:FreeGroup`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/GroupTheory/FreeGroup/Basic.lean): Free groups with their universal property. The excursion algebra is a colimit over (n, F_n -> W), and AUDIT-21 records this as the indexing half of that construction, the cocycle spaces themselves being absent.
- [`mathlib:RingHom`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Ring/Hom/Defs.lean): Ring homomorphisms. The Theta_n of the universal property are maps of Z_l-algebras, and the comparison Exc -> O(Z^1)^{G-hat} is one.
- [`mathlib:MvPolynomial`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/MvPolynomial/Basic.lean): Polynomial algebras. O(Z^1(F_n,G-hat)) = O(G-hat^n) is a quotient of a polynomial algebra, and the finite presentation of the cocycle scheme is by equations in such a ring.
- [`mathlib:AlgebraicGeometry.Scheme`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/Scheme.lean): Schemes. Z^1(W_E/P,G-hat) is an affine scheme of finite type, Z^1(W_E,G-hat) is a disjoint union of such, and Sing_{X/S} is an affine X-group scheme.
- [`mathlib:Module.Flat`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Flat/Basic.lean): Flatness. Z^1(W_E/P,G-hat) is FLAT over Z_l, the excursion algebra is flat under the good-prime hypothesis, and the universal property of its l-torsion-free quotient is for FLAT test algebras.
- [`mathlib:RingTheory.Sequence.IsRegular`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Regular/RegularSequence.lean): REGULAR SEQUENCES, at the pins. AUDIT-21 records that Mathlib has no named local-complete-intersection predicate, but that the lci structure CAN be stated as a quotient by a regular sequence; this is the pinned notion that statement would use.
- [`mathlib:Algebra.Extension.H1Cotangent`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Extension/Cotangent/Basic.lean): Kernel of the naive extension cotangent-complex differential, the degree-one naive term. The full derived cotangent complex and H^1 of its dual are requested separately, not identified with this kernel.
- [`mathlib:groupCohomology`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory/Homological/GroupCohomology/Basic.lean): Cohomology of an abstract group representation by the inhomogeneous cochain complex. Rational algebraic-group cohomology and condensed continuous Weil cohomology need separate interfaces.
- [`mathlib:PrimeSpectrum.isHomeomorph_comap`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Spectrum/Prime/Homeomorph.lean): A ring map with nil kernel (every element of the kernel is nilpotent) and positive powers of every target element in its image induces a homeomorphism on spectra. Universal homeomorphism requires this after every base change; it is not asserted by this declaration alone.
- [`mathlib:CategoryTheory.Triangulated.TStructure`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Triangulated/TStructure/Basic.lean): t-structures on a triangulated category, at the pins, as the abstract notion only. The GOOD-FILTRATION t-structure is defined against it, and AUDIT-21 records that good filtrations themselves are absent.
- [`mathlib:CategoryTheory.Idempotents.Karoubi`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Idempotents/Karoubi.lean): The Karoubi envelope. 'Generated under cones and RETRACTS' is an idempotent-completion statement, and the categories of Chapter X are idempotent-complete by hypothesis.
- [`mathlib:CategoryTheory.MonoidalCategory`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Monoidal/Category.lean): Monoidal categories. Perf(*/G-hat) acts monoidally on Perf of the parameter stack, and the universal property of the colimit theorem is for exact MONOIDAL functors.
- [`mathlib:CategoryTheory.Functor.Monoidal`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Monoidal/Functor.lean): Monoidal functors, the data the universal property quantifies over.
- [`mathlib:CategoryTheory.CatCenter`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Center/Basic.lean): Ordinary categorical centre End(id_C). It supplies the ordinary shadow of the excursion target; the stable infinity-category target is π₀End(id_C), whose enhancement is requested from E5.
- [`mathlib:Condensed`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Condensed/Basic.lean): Condensed objects, at the pins. A parameter is a CONDENSED cocycle, the coefficient ring is made condensed as Lambda_disc tensor_{Z_l,disc} Z_l, and the evaluations of the excursion algebra over W_E/P are maps of condensed sets.
- [`mathlib:CondensedMod`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Condensed/Module.lean): Condensed modules, the ambient category for the condensed coefficient convention.
- [`mathlib:Module.Free`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/FreeModule/Basic.lean): Free coefficient modules in Weil duality; finite rank is an additional hypothesis. The finite-type submodules of the condensed coefficient convention need not themselves be free.
- [`mathlib:RootPairing`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/RootSystem/Defs.lean): Root-pairing carrier and RootPairing.flip for dual data. This declaration supplies neither invariant degrees, Chevalley restriction, highest-weight modules nor the algebraic-group fundamental-group calculation. Those are separate supplier obligations, not consequences already available from RootPairing.
- [`mathlib:CoxeterSystem`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/GroupTheory/Coxeter/Basic.lean): Coxeter-system carrier with its generators and relations. It does not by itself supply the Coxeter-number table or the homogeneous invariant degrees in FS VIII.2.11; those computations are requested from the reductive/root-system owner.
- [`tauceti:TauCeti.ContinuousCohomology.continuousCohomologyFunctor`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Homological/ContCohomology/Functoriality.lean): Degree-n continuous cohomology as a coefficient functor from TopRep to TopModuleCat. This is an abelian cohomology interface, not nonabelian cocycles or local Weil duality.
- [`mathlib:CategoryTheory.PresheafOfGroups.OneCocycle`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Sites/NonabelianCohomology/H1.lean): Nonabelian Čech 1-cocycles of a presheaf of groups on a family of objects. The cocycle, gauge relation and quotient H1 are already supplied; continuous crossed cocycles of a group action are a different input. Their bridge is descent via SF.1.
- [`mathlib:SemidirectProduct`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/GroupTheory/SemidirectProduct.lean): Group carrier N⋊[α]Γ with multiplication (n,γ)(n′,γ′)=(n α(γ)(n′),γγ′), rightHom projection and its sections. Does not supply a condensed or integral L-group.
- [`mathlib:Subalgebra`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Algebra/Subalgebra/Basic.lean): Subalgebras containing the base-ring image and closed under zero, one, addition and multiplication. An algebraic invariant ring also requires the rational action supplied by RG.
- [`mathlib:CommRingCat.Colimits.hasColimits_commRingCat`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Category/Ring/Colimits.lean): Small colimits of commutative rings, with cocone maps and universal descent. The excursion diagram and Z_l-algebra/animated enhancement remain additional inputs.
- [`mathlib:Equiv.Perm.cycleFactorsFinset`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/GroupTheory/Perm/Cycle/Factors.lean): Finite set of disjoint nontrivial cyclic factors of a finite permutation. Fixed one-cycles must be added separately in the trace identity.
- [`tauceti:TauCeti.fixedSubgroup`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/GroupTheory/FixedSubgroup.lean): The equaliser of a group endomorphism F and identity; membership is F(g)=g. Point-group compatibility for cyclic fixed loci only; no scheme smoothness, reductivity or connectedness follows.
- [`mathlib:MonoidAlgebra`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/MonoidAlgebra/Defs.lean): The convolution algebra A[Γ], with its finite-support coefficient carrier; its linear trace adapter is specialized from IHG.0.
- [`mathlib:MonoidAlgebra.of`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/MonoidAlgebra/Defs.lean): The canonical monoid homomorphism γ↦[γ] into A[Γ]; restriction of an A-linear trace uses this basis map.

## Layers and declaration catalogue

Each retained target below has its mathematical statement, direct prerequisites, proof route and source locators. Definition and construction APIs serve the named uses; their tests are acceptance specifications, not implemented proof reports. Every declaration remains unchecked.

## LP0 — LanglandsParameterStacks:LP0

Crossed cocycles, prescribed-action lifts and finite wild pieces precede every parameter construction. The dense discrete Weil group connects finite equations to the continuous/condensed parameter functor. Complex classical-group wild enhancements have their own stated admissibility boundary.

**Coverage: planned.** Every original stage target is represented by a retained node, baseline/requested input or explicit existing-owner delegation. This is a complete target-level planning pass; no mathematical implementation is claimed.

Remaining obligations:

- Register the RG2.6 structural/complex enhancement requests; finish the Weil/wild/condensed coefficient supplier interfaces and the corresponding omitted signatures.

**Planets:** Crossed cocycles; Condensed L-parameters; Finite wild ramification; Weil discretisation; Wild inertial parameters; Extended wild parameters.

### Crossed cocycles and gauge action

Identifier: `LanglandsParameterStacks:LP0/functoriality-of-cocycles`. Kind: construction.

For a group Γ acting on a group H by α:Γ→Aut(H), CrossedCocycle(α) consists of maps c:Γ→H with c(γδ)=c(γ)α(γ)(c(δ)). Gauge by h is c^h(γ)=h c(γ)α(γ)(h)^{-1}. Equivariant coefficient homomorphisms and restriction of Γ transport cocycles. Sections Γ→H⋊Γ are equivalent to cocycles; H¹(Γ,H) is the gauge-orbit set. In the continuous version require continuous c and a continuous action.

**Hypotheses and conventions.**

- Γ,H are groups; the continuous version has topological groups and continuous action.

**Direct prerequisites.** `mathlib:MonoidHom`, `mathlib:Subgroup`, `mathlib:CategoryTheory.PresheafOfGroups.OneCocycle`, `SchemeAndStackFoundations:SF.1`, `mathlib:SemidirectProduct`.

**Construction or proof.**

1. Multiply (c(γ),γ)(c(δ),δ) in the semidirect product to obtain the cocycle equation.
2. Use associativity for the gauge action and equivariance for coefficient transport.
3. Keep this crossed-group interface distinct from the baseline Čech cocycle; compare after the SF.1 descent bridge.

Source: [Laurent Fargues; Peter Scholze, VIII.1.1, p.278](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf). The passage states the object or result; the proof steps specify the reduction and conventions.

**API.**

- `CrossedCocycle` (data): Maps with the crossed multiplication law.
- `CrossedCocycle.ext` (extensionality): Pointwise equality implies equality of cocycles.
- `CrossedCocycle.map_one` (simp): c(1)=1.
- `CrossedCocycle.map_inv` (simp): c(γ⁻¹)=α(γ⁻¹)(c(γ)⁻¹).
- `CrossedCocycle.gauge` (functoriality): The H-action h·c has the displayed formula and satisfies one and multiplication laws.
- `CrossedCocycle.restrict` (functoriality): Precompose a group homomorphism; restrict the action, with identity and composition laws.
- `CrossedCocycle.map` (functoriality): An α-equivariant homomorphism H→H′ maps c pointwise; identity, composition and gauge compatibility.
- `CrossedCocycle.sectionEquiv` (equivalence): Cocycles are the sections of H⋊Γ→Γ.
- `CrossedCocycle.orbit` (projection): The gauge class in nonabelian H¹, compatible with restrictions.

**Uses.**

- `LanglandsParameterStacks:LP0/condensed-cocycles-and-L-parameters`: Sections and the finite-Q lift.
- `LanglandsParameterStacks:LP1/finite-presentation-over-Z-invert-p`: Universal equations and twisted conjugation.

**Unit tests.**

- `cocycle_trivial_action` (compatibility): For trivial α, crossed cocycles are precisely group homomorphisms Γ→H.
- `cocycle_trivial_group` (degenerate): For Γ=1 there is exactly one crossed cocycle.
- `cocycle_coboundary` (computation): The gauge of the unit cocycle by h evaluates to h α(γ)(h)⁻¹.
- `cocycle_not_hom` (non-example): Let Γ=C₂ act on H=ℤ additively by negation. The cocycle c(s)=1 satisfies c(s²)=1−1=0, but is not a homomorphism C₂→ℤ.

**Acceptance.**

- For trivial α, crossed cocycles are precisely group homomorphisms Γ→H.
- For Γ=1 there is exactly one crossed cocycle.
- The gauge of the unit cocycle by h evaluates to h α(γ)(h)⁻¹.
- Let Γ=C₂ act on H=ℤ additively by negation. The cocycle c(s)=1 satisfies c(s²)=1−1=0, but is not a homomorphism C₂→ℤ.

### Condensed L-parameters

Identifier: `LanglandsParameterStacks:LP0/condensed-cocycles-and-L-parameters`. Kind: definition.

Fix a pinned split dual group H/Z_l with standard algebraic action factoring through Q and W_E→Q. For a Z_l-algebra Λ use the condensed algebra Λ_disc⊗_{Z_l,disc}Z_l. On profinite S its sections are continuous maps S→Λ taking values in a finite-type Z_l-submodule. An L-parameter is a condensed crossed cocycle W_E→H(Λ), equivalently a section H(Λ)⋊W_E→W_E, or a lift of W_E→Q to H(Λ)⋊Q.

**Hypotheses and conventions.**

- l≠p; the action is the standard pinning action. The cyclotomic normalisation is compared only after adjoining sqrt(q).
- The relatively discrete condensed coefficient convention is part of the definition, not the discrete topology on all Λ.

**Direct prerequisites.** `LanglandsParameterStacks:LP0/functoriality-of-cocycles`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-9-the-local-weil-group`, `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-4-the-tame-quotient-of-the-absolute-galois-group`, `ReductiveGroupsPartII:RG2.5`, `mathlib:Condensed`, `mathlib:CondensedMod`.

**Construction or proof.**

1. Import the Weil group and the integral pinned dual, and apply the crossed-cocycle/section equivalence in condensed groups.
2. Compute the tensor coefficient convention on profinite sets; a faithful linear embedding gives the finite-type continuous matrix-coefficient criterion.

Source: [Laurent Fargues; Peter Scholze, VIII.1.1, p.278](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf). The passage states the object or result; the proof steps specify the reduction and conventions.

**API.**

- `condensedCoefficients` (structure): The relatively discrete condensed coefficient algebra with its finite-type continuous sections.
- `LParameter` (data): A condensed crossed cocycle for the standard action.
- `LParameter.asSection` (equivalence): Cocycles and sections are naturally equivalent.
- `LParameter.asLift` (equivalence): Sections and lifts to H⋊Q are naturally equivalent.
- `LParameter.matrixCriterion` (characterisation): For a closed embedding H⋊Q→GL_N, restriction to inertia has finite-type continuous matrix coefficients.
- `LParameter.restrictWild` (projection): Restriction to wild inertia with the same action and coefficient convention.
- `LParameter.ext` (extensionality): Equality of the underlying condensed cocycle on every test object and section implies equality of parameters.
- `LParameter.gauge` (functoriality): The dual group acts by h·φ(w)=hφ(w)(w·h)⁻¹; this preserves the relatively discrete coefficient and continuous cocycle conditions, with identity and multiplication laws.

**Uses.**

- `LanglandsParameterStacks:LP0/discretization-and-unique-extension`: The extension theorem concerns these coefficients.
- `LanglandsParameterStacks:LP1/representability-flatness-and-lci`: The functor of points represented by the parameter scheme.
- `ExcursionOperatorsAndSpectralAction:ES5`: Parameters of Schur objects.

**Unit tests.**

- `parameter_split_torus` (computation): For H=G_m with trivial action, parameters are continuous multiplicative characters with the prescribed coefficient convention.
- `parameter_char_l` (computation): For an F_l-algebra Λ the relatively discrete condensed structure is discrete; inertia restrictions are locally constant.
- `parameter_section` (compatibility): The projection of asSection(φ)(w) equals w, and its first coordinate equals φ(w).
- `parameter_not_discrete_Ql` (non-example): For Λ=Q_l the convention admits continuous infinite-image Z_l-valued inertia characters; imposing discrete coefficients would exclude them.

**Acceptance.**

- For H=G_m with trivial action, parameters are continuous multiplicative characters with the prescribed coefficient convention.
- For an F_l-algebra Λ the relatively discrete condensed structure is discrete; inertia restrictions are locally constant.
- The projection of asSection(φ)(w) equals w, and its first coordinate equals φ(w).
- For Λ=Q_l the convention admits continuous infinite-image Z_l-valued inertia characters; imposing discrete coefficients would exclude them.

### Finite wild ramification

Identifier: `LanglandsParameterStacks:LP0/finite-wild-ramification`. Kind: definition.

A parameter has finite wild ramification if its restriction to wild inertia P_E is trivial on an open subgroup. A finite-wild piece indexed by open normal P⊂P_E, normal in W_E and in the kernel of W_E→Q, consists of parameters trivial on P.

**Hypotheses and conventions.**

- l≠p; relatively discrete coefficients as in LParameter.

**Direct prerequisites.** `LanglandsParameterStacks:LP0/condensed-cocycles-and-L-parameters`, `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-4-the-tame-quotient-of-the-absolute-galois-group`.

**Construction or proof.**

1. A continuous image of the pro-p wild group in the l-adic matrix congruence kernel is trivial; compactness and reduction modulo l yield finite wild image.
2. Shrink a kernel to a W_E-normal open subgroup and require it to kill the fixed finite action.

Source: [Laurent Fargues; Peter Scholze, VIII.1, p.278](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf). The passage states the object or result; the proof steps specify the reduction and conventions.

**API.**

- `FiniteWildRamification` (characterisation): There exists an open wild kernel.
- `FiniteWildPiece` (data): The subfunctor of parameters trivial on P.
- `FiniteWildPiece.inflate` (functoriality): For P′⊂P, inflation embeds the P-piece in the P′-piece.
- `LParameter.finiteWild` (other): Every parameter with these coefficients has finite wild ramification.

**Uses.**

- `LanglandsParameterStacks:LP1/decomposition-by-wild-kernel`: The clopen decomposition.
- `ExcursionOperatorsAndSpectralAction:ES1:finite-ramification`: Objectwise finite ramification in the consumer.

**Unit tests.**

- `wild_unramified` (degenerate): An unramified parameter lies in the piece P=P_E when Q is unramified.
- `wild_piece_order` (characterisation): For P′⊂P, triviality on P implies triviality on P′; the inflation direction is this way.
- `wild_finite_image` (compatibility): For coefficients in a finite extension of Q_l the condition means the usual finite image on wild inertia.

**Acceptance.**

- An unramified parameter lies in the piece P=P_E when Q is unramified.
- For P′⊂P, triviality on P implies triviality on P′; the inflation direction is this way.
- For coefficients in a finite extension of Q_l the condition means the usual finite image on wild inertia.

### Discrete Weil groups and unique extension

Identifier: `LanglandsParameterStacks:LP0/discretization-and-unique-extension`. Kind: theorem.

For open normal P as above choose tame τ and geometric Frobenius σ. The dense group W⊂W_E/P generated by P_E/P, τ^{Z[1/p]} and σ is finitely presented, with σ⁻¹τσ=τ^q and the finite-wild conjugation relations. Restriction identifies condensed parameters trivial on P with crossed cocycles on W whose wild restriction is continuous (automatic for finite P_E/P).

**Hypotheses and conventions.**

- Finite action factors through W_E/P; l≠p; use relatively discrete Z_l-algebras.
- Convert the ClassFieldTheory supplier’s arithmetic Frobenius F to geometric σ=F⁻¹. The LP degree is the negative of the supplier’s arithmetic weilDegree; do not identify these degree maps.

**Direct prerequisites.** `LanglandsParameterStacks:LP0/condensed-cocycles-and-L-parameters`, `LanglandsParameterStacks:LP0/finite-wild-ramification`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-9-the-local-weil-group`, `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-4-the-tame-quotient-of-the-absolute-galois-group`, `ReductiveGroupsPartII:RG2.5`, `mathlib:FreeGroup`.

**Construction or proof.**

1. Import the exact tame quotient and its topology. Matrices conjugate to their qth powers have roots-of-unity eigenvalues of order prime to p; a suitable power is unipotent. Extend its powers by the finite binomial formula, then the tame torsion part, giving existence and uniqueness of the extension.

Source: [Laurent Fargues; Peter Scholze, Proof of VIII.1.3, pp.279–280](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf). The passage states the object or result; the proof steps specify the reduction and conventions.

**Acceptance.**

- For H=G_m the tame relation forces χ(τ)^{q−1}=1.
- Check geometric σ=Fr⁻¹ converts the DHKM relation Fr τ Fr⁻¹=τ^q into the displayed relation.

### Change of discrete Weil model

Identifier: `LanglandsParameterStacks:LP0/change-of-discretization`. Kind: comparison.

Any two choices of dense discrete W₁,W₂ inside the same W_E/P yield canonically equivalent cocycle functors over Z_l: extend to W_E/P, then restrict. The comparisons obey identity and composition. Over Z[1/p] the framed models need not be canonically choice independent; only their Z_l base changes have this universal continuous extension comparison.

**Hypotheses and conventions.**

- l≠p; same P and same action; coefficient convention fixed.

**Direct prerequisites.** `LanglandsParameterStacks:LP0/discretization-and-unique-extension`.

**Construction or proof.**

1. Use the unique extension twice; both compositions are identity because their restrictions extend to the same parameter. Compare DHKM Corollary4.2, which asserts the integral l-adic canonical identification, not choice independence of framed Z[1/p]-models.

Source: [Jean-François Dat; David Helm; Robert Kurinczuk; Gilbert Moss, §4.1, Corollary4.2, pp.30–31](https://arxiv.org/pdf/2009.06708). The passage states the object or result; the proof steps specify the reduction and conventions.

**Acceptance.**

- Changing τ scales the normalised monodromy coordinate; the parameter functor comparison is canonical, not equality of an unnormalised N.

### Wild inertial parameters

Identifier: `LanglandsParameterStacks:LP0/wild-inertial-parameter`. Kind: definition.

In the complex classical-group setting of KSS, a wild inertial parameter is a homomorphism ρ:P_F→{}^LG which extends to an admissible Langlands parameter φ:W_F×SL₂(C)→{}^LG with the prescribed projection to W_F. It is taken up to conjugation by the complex dual group H.

**Hypotheses and conventions.**

- The action on H is trivial on P_F, so this restriction is a homomorphism; admissibility and the classical-group L-group are supplied by RG2.5.
- For the KSS §1.20–1.21 instance, G is quasi-split classical over a local field of odd residual characteristic, with complex coefficients; no wild local Langlands conjecture is asserted.

**Direct prerequisites.** `LanglandsParameterStacks:LP0/condensed-cocycles-and-L-parameters`, `ReductiveGroupsPartII:RG2.5`, `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-4-the-tame-quotient-of-the-absolute-galois-group`.

**Construction or proof.**

1. Restrict an admissible parameter to P_F; require extendibility as part of the definition, not a theorem that arbitrary wild homomorphisms extend.

Source: [Robert Kurinczuk; Daniel Skodlerack; Shaun Stevens, §1.20–§1.21, pp.8–9](https://arxiv.org/pdf/1611.02667). The passage states the object or result; the proof steps specify the reduction and conventions.

**API.**

- `WildInertialParameter` (data): A wild homomorphism together with existence of an admissible extension.
- `WildInertialParameter.conjugate` (functoriality): H-conjugation preserves extendibility.
- `WildInertialParameter.ofLanglands` (constructor): Restrict an admissible complex Langlands parameter.
- `WildInertialParameter.ext` (extensionality): The underlying homomorphism determines this subtype; the extension is not chosen data.

**Uses.**

- `LanglandsParameterStacks:LP0/twisted-wild-centralizer`: The centralizer uses the wild restriction.
- `LanglandsParameterStacks:LP0/extended-wild-parameters`: Enhanced restrictions.

**Unit tests.**

- `wild_inertial_trivial` (degenerate): The wild parameter with trivial dual-group component, ρ(p)=(1,p), is extendible by the standard unramified admissible parameter.
- `wild_inertial_conjugate` (compatibility): Restriction of hφh⁻¹ equals hρh⁻¹.
- `wild_inertial_extension_not_data` (characterisation): Two admissible extensions with the same ρ define the same WildInertialParameter.

**Acceptance.**

- The wild parameter with trivial dual-group component, ρ(p)=(1,p), is extendible by the standard unramified admissible parameter.
- Restriction of hφh⁻¹ equals hρh⁻¹.
- Two admissible extensions with the same ρ define the same WildInertialParameter.

### Twisted wild centralizers

Identifier: `LanglandsParameterStacks:LP0/twisted-wild-centralizer`. Kind: construction.

Define C_{{}^LG}(ρ)={(g,w): (g,w)ρ(w⁻¹pw)(g,w)⁻¹=ρ(p) for all p∈P_F}. It is an extension of W_F by C_H(ρ). A chosen admissible extension φ identifies it with C_H(ρ)⋊_{Ad φ}W_F. This is a twisted centralizer, not the ordinary centralizer of ρ(P_F) in the L-group.

**Hypotheses and conventions.**

- ρ is extendible; φ provides a splitting; P_F is normal in W_F.

**Direct prerequisites.** `LanglandsParameterStacks:LP0/wild-inertial-parameter`, `mathlib:Subgroup`, `mathlib:MonoidHom`.

**Construction or proof.**

1. Check closure using normality of P_F. The splitting sends w to φ(w), and (g,w) factors uniquely as (gφ(w)⁻¹)φ(w).
2. Changing the extension changes this chosen splitting; the subgroup defined by the equation is intrinsic.

Source: [Robert Kurinczuk; Daniel Skodlerack; Shaun Stevens, §1.21, p.8](https://arxiv.org/pdf/1611.02667). The passage states the object or result; the proof steps specify the reduction and conventions.

**API.**

- `twistedWildCentralizer` (data): The displayed subgroup of the L-group.
- `twistedWildCentralizer.mem_iff` (characterisation): Membership is the twisted equation for every p.
- `twistedWildCentralizer.projection` (projection): The group projection to W_F.
- `twistedWildCentralizer.kernel` (characterisation): Its kernel is C_H(ρ).
- `twistedWildCentralizer.splitEquiv` (equivalence): A chosen extension gives C_H(ρ)⋊_{Ad φ}W_F.

**Uses.**

- `LanglandsParameterStacks:LP0/wild-enhancement-group`: The centre gives S_ρ.

**Unit tests.**

- `wild_centralizer_trivial` (degenerate): For ρ(p)=(1,p) and trivial P_F-action on H, the twisted centralizer is the whole L-group; this is not the constant homomorphism into a group projecting to P_F.
- `wild_centralizer_kernel` (compatibility): Elements above w=1 are exactly the usual dual-group centralizer.
- `wild_centralizer_twist` (non-example): For any extension φ, φ(w) lies in the twisted centralizer even when it does not commute with every ρ(p).

**Acceptance.**

- For ρ(p)=(1,p) and trivial P_F-action on H, the twisted centralizer is the whole L-group; this is not the constant homomorphism into a group projecting to P_F.
- Elements above w=1 are exactly the usual dual-group centralizer.
- For any extension φ, φ(w) lies in the twisted centralizer even when it does not commute with every ρ(p).

### Wild enhancement groups

Identifier: `LanglandsParameterStacks:LP0/wild-enhancement-group`. Kind: definition.

Set S_ρ=Z(C_{{}^LG}(ρ))/Z(H)^{W_F}. Via a chosen φ, the numerator is Z(C_H(ρ))^{φ(W_F)} and embeds into C_H(φ(W_F×SL₂(C))). Restriction along this centre inclusion and quotient defines a map Rep(S_φ)→Rep(S_ρ), where S_φ=C_H(φ)/(C_H(φ)°Z(H)^{W_F}).

**Hypotheses and conventions.**

- Use the trivial centre of W_F and φ(SL₂(C))⊂C_H(ρ), as in KSS(1.1); S_ρ is not defined as π₀ C_H(ρ).

**Direct prerequisites.** `LanglandsParameterStacks:LP0/twisted-wild-centralizer`, `ReductiveGroupsPartII:RG2.5`, `mathlib:Representation`.

**Construction or proof.**

1. Take centres of the split extension, noting the projection of any central element to W_F is trivial.
2. The centre commutes also with φ(SL₂), hence lies in the parameter centralizer. Inflating a representation of S_φ and restricting kills Z(H)^{W_F}.

Source: [Robert Kurinczuk; Daniel Skodlerack; Shaun Stevens, §1.21, equation(1.1), p.8](https://arxiv.org/pdf/1611.02667). The passage states the object or result; the proof steps specify the reduction and conventions.

**API.**

- `wildEnhancementGroup` (data): The quotient of the intrinsic twisted centralizer centre.
- `wildEnhancementGroup.centerIdentification` (equivalence): Using φ identifies it with Z(C_H(ρ))^{φ(W_F)}/Z(H)^{W_F}.
- `wildEnhancementGroup.restrictRep` (functoriality): Inflate from S_φ and restrict to the centre, descending to S_ρ.
- `wildEnhancementGroup.conjugateEquiv` (equivalence): Dual-group conjugation transports the quotient and its representations.

**Uses.**

- `LanglandsParameterStacks:LP0/extended-wild-parameters`: Defines the allowed enhancement.

**Unit tests.**

- `wild_enhancement_trivial_rho` (computation): For the trivial dual-group component ρ(p)=(1,p), the numerator is Z(H)^{W_F}, so S_ρ is trivial.
- `wild_enhancement_center_quotient` (characterisation): The restricted representation is trivial on Z(H)^{W_F}.
- `wild_enhancement_conjugacy` (compatibility): Conjugating φ and ρ transports the restricted representation by the induced S_ρ equivalence.

**Acceptance.**

- For the trivial dual-group component ρ(p)=(1,p), the numerator is Z(H)^{W_F}, so S_ρ is trivial.
- The restricted representation is trivial on Z(H)^{W_F}.
- Conjugating φ and ρ transports the restricted representation by the induced S_ρ equivalence.

### Extended wild inertial parameters

Identifier: `LanglandsParameterStacks:LP0/extended-wild-parameters`. Kind: definition.

An extended wild parameter is (ρ,χ_ρ), where ρ is wild inertial and χ_ρ is a representation of S_ρ obtained by restricting some irreducible enhancement χ_φ of an admissible extension φ. Wild(G) is the set of H-conjugacy classes of such pairs. Res:Lang(G)→Wild(G) sends (φ,χ_φ) to this restriction. χ_ρ is not required to be irreducible.

**Hypotheses and conventions.**

- Complex classical-group setting, as in KSS; enhanced admissible parameters come from RG2.5. No bijection with endo-parameters is asserted.
- Retain the quasi-split classical-group and odd residual-characteristic scope of KSS §1.20–1.21.

**Direct prerequisites.** `LanglandsParameterStacks:LP0/wild-enhancement-group`, `LanglandsParameterStacks:LP0/wild-inertial-parameter`, `ReductiveGroupsPartII:RG2.5`.

**Construction or proof.**

1. Use the centre restriction from the preceding construction.
2. Show conjugation transports the restriction, so Res descends to equivalence classes. Existence of the enhanced extension is retained, whereas irreducibility of the restriction is not.

Source: [Robert Kurinczuk; Daniel Skodlerack; Shaun Stevens, §1.21, pp.8–9](https://arxiv.org/pdf/1611.02667). The passage states the object or result; the proof steps specify the reduction and conventions.

**API.**

- `ExtendedWildParameter` (data): Pairs satisfying the enhancement extension condition.
- `WildParameterClasses` (data): H-conjugacy classes of extended wild pairs.
- `restrictEnhancedParameter` (functoriality): The well-defined map Res on classes.
- `ExtendedWildParameter.forget` (projection): Forget the enhancement to the wild conjugacy class.

**Uses.**

- `KSS §1.21 equation(1.2)`: The codomain of the conjectural wild correspondence; no correspondence theorem is imported.

**Unit tests.**

- `extended_wild_unramified` (degenerate): For trivial ρ the restriction enhancement is the trivial S_ρ representation on the underlying vector space, whose dimension need not be one.
- `extended_wild_conjugacy` (characterisation): Conjugate enhanced Langlands parameters have the same WildParameterClasses image.
- `extended_wild_forget` (compatibility): Forgetting Res(φ,χ_φ) equals the conjugacy class of φ|P_F.

**Acceptance.**

- For trivial ρ the restriction enhancement is the trivial S_ρ representation on the underlying vector space, whose dimension need not be one.
- Conjugate enhanced Langlands parameters have the same WildParameterClasses image.
- Forgetting Res(φ,χ_φ) equals the conjugacy class of φ|P_F.

## LP1 — LanglandsParameterStacks:LP1

Finite-presentation equations give the chosen integral model. The dimension proof uses separately requested fixed-group reductivity and unipotent-class finiteness before LP3. Derived comparison, continuous Tate duality, cotangent and singular-support calculations are parameter-specific applications of their general suppliers.

**Coverage: planned.** Every original stage target is represented by a retained node, baseline/requested input or explicit existing-owner delegation. This is a complete target-level planning pass; no mathematical implementation is claimed.

Remaining obligations:

- Supply RG2.6 fixed-group reductivity and unipotent-class finiteness before the dimension bound; discharge SF.1/S.1/E5/DD.0/R03.3/DGA8 general interfaces. Fill the omitted derived/singularity signatures.

**Planets:** Integral cocycle schemes; Weil cohomology and duality; Flat complete-intersection parameter spaces; Cotangent complexes of parameter stacks; Weil–Deligne parameters; Singularities of parameter stacks.

### Integral finite-wild cocycle schemes

Identifier: `LanglandsParameterStacks:LP1/finite-presentation-over-Z-invert-p`. Kind: construction.

For a split reductive model H over Z[1/p] with finite W-action and a finite-wild quotient W=W_F^0/P_F^e, construct Z¹(W,H) as the closed subscheme of H^r cut out by the cocycle equations of a finite presentation of W. It represents crossed cocycles on W for all Z[1/p]-algebras and carries twisted conjugation. Its base change to Z_l represents the finite-wild condensed parameter functor for l≠p.

**Hypotheses and conventions.**

- The chosen discrete W has finite wild subgroup and tame relation. The model H and action over Z[1/p] are fixed; framed choice independence is asserted only after base change to Z_l.

**Direct prerequisites.** `LanglandsParameterStacks:LP0/functoriality-of-cocycles`, `LanglandsParameterStacks:LP0/discretization-and-unique-extension`, `ReductiveGroupsPartII:RG2.5`, `SchemeAndStackFoundations:SF.1`, `mathlib:MvPolynomial`, `mathlib:AlgebraicGeometry.Scheme`.

**Construction or proof.**

1. Use generators to embed the functor into H^r and impose each relation, evaluated with the given action. The relation functor is an equaliser of algebraic maps, hence a closed affine finite-presentation scheme.
2. The universal property identifies relations with cocycles, and hence is independent of a presentation of the same W.
3. Use arithmetic Fr=σ⁻¹ to compare DHKM and FS presentations; apply the unique continuous-extension theorem after base change.

Source: [Jean-François Dat; David Helm; Robert Kurinczuk; Gilbert Moss, §1 and §4.1, pp.4–7,29–31; FS proof VIII.1.3, p.280](https://arxiv.org/pdf/2009.06708). The passage states the object or result; the proof steps specify the reduction and conventions.

**API.**

- `IntegralCocycleScheme` (data): The representing affine finite-presentation scheme over Z[1/p].
- `IntegralCocycleScheme.pointsEquiv` (universal-property): A-points are crossed cocycles W→H(A), naturally in A.
- `IntegralCocycleScheme.universalCocycle` (projection): Evaluation at w gives the universal cocycle, satisfying the crossed multiplication law.
- `IntegralCocycleScheme.gaugeAction` (structure): Twisted conjugation is an algebraic H-action.
- `IntegralCocycleScheme.baseChange` (compatibility): The base change represents cocycles for the base-changed H and action.
- `IntegralCocycleScheme.presentationEquiv` (equivalence): Two finite presentations of the same W give canonical mutually inverse scheme isomorphisms.

**Uses.**

- `LanglandsParameterStacks:LP1/representability-flatness-and-lci`: Flat lci model.
- `SmoothRepresentationsOfLocalGroups:SR.6`: DHKM finiteness and Hecke consequences import this construction.

**Unit tests.**

- `scheme_free_group` (computation): For W=F_n the cocycle scheme is H^n with twisted conjugation.
- `scheme_trivial_group` (degenerate): For W=1 it is Spec Z[1/p].
- `scheme_tame_torus` (computation): For H=G_m and unramified action, the tame scheme has coordinates s∈G_m, t∈μ_{q−1}; it is G_m×μ_{q−1}.
- `scheme_l_adic` (compatibility): Its Z_l-points functor on Z_l-algebras agrees with the corresponding finite-wild condensed parameter functor.

**Acceptance.**

- For W=F_n the cocycle scheme is H^n with twisted conjugation.
- For W=1 it is Spec Z[1/p].
- For H=G_m and unramified action, the tame scheme has coordinates s∈G_m, t∈μ_{q−1}; it is G_m×μ_{q−1}.
- Its Z_l-points functor on Z_l-algebras agrees with the corresponding finite-wild condensed parameter functor.

### Clopen finite-wild pieces

Identifier: `LanglandsParameterStacks:LP1/decomposition-by-wild-kernel`. Kind: lemma.

Z¹(W_E,H) is the filtered union of its finite-wild pieces Z¹(W_E/P,H). For P′⊂P these are open and closed subschemes inside the P′-piece; the union is a disjoint union of affine finite-type schemes after separating the clopen wild-kernel strata.

**Hypotheses and conventions.**

- l≠p; P kills the finite action.

**Direct prerequisites.** `LanglandsParameterStacks:LP0/finite-wild-ramification`, `LanglandsParameterStacks:LP1/finite-presentation-over-Z-invert-p`.

**Construction or proof.**

1. The equation φ(γ)=1 is clopen for finite p-power order γ because p is invertible in the coefficient ring. Impose finitely many such equations on P/P′.
2. Every parameter has an open wild kernel. Separate nested clopen pieces to obtain the disjoint affine cover.

Source: [Laurent Fargues; Peter Scholze, Proof VIII.1.3, pp.279–280](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf). The passage states the object or result; the proof steps specify the reduction and conventions.

**Acceptance.**

- Do not assert that the full union is quasi-compact when infinitely many distinct wild strata occur.

### Weil cohomology dimension and Euler characteristic

Identifier: `LanglandsParameterStacks:LP1/weil-cohomological-dimension-and-euler-characteristic`. Kind: theorem.

For a finite-rank free relatively discrete Λ-module M with condensed W_E-action and l≠p, RΓ(W_E,M) has perfect amplitude [0,2] and Euler characteristic zero. For field coefficients dim H⁰−dim H¹+dim H²=0. The same calculation on a finite-wild dense W gives the derived deformation complex.

**Hypotheses and conventions.**

- Λ is a Z_l-algebra; use the continuous/condensed theory, not abstract cohomology of W_E with forgotten topology.

**Direct prerequisites.** `LanglandsParameterStacks:LP0/discretization-and-unique-extension`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-9-the-local-weil-group`, `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-4-the-tame-quotient-of-the-absolute-galois-group`, `tauceti:TauCeti.ContinuousCohomology.continuousCohomologyFunctor`, `mathlib:groupCohomology`, `mathlib:Module.Free`, `EnhancedDerivedSheaves:E5:presentability`.

**Construction or proof.**

1. Kill an open wild kernel; exact invariants for the finite p-group reduce to tame inertia and Frobenius.
2. Tame l-primary inertia and the Z Frobenius each give two-term resolutions. Their total complex has amplitude [0,2] and alternating rank zero. Compare restriction to the discrete model.

Source: [Laurent Fargues; Peter Scholze, VIII.1.3 dimension argument and VIII.2.2, pp.280–282](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf). The passage states the object or result; the proof steps specify the reduction and conventions.

**Acceptance.**

- For the trivial rank-one Q_l representation, H⁰ and H¹ have dimension one and H² vanishes.

### Frobenius-tame dimension bound

Identifier: `LanglandsParameterStacks:LP1/dimension-bound-lemma`. Kind: lemma.

Let H/F_l be smooth with reductive identity component. For the prescribed action of σ on Z/l^mZ, the variety Hom(Z/l^mZ⋊σZ,H) has dimension at most dim H. Consequently each geometric fibre of the finite-wild cocycle scheme has dimension at most dim H of the dual group.

**Hypotheses and conventions.**

- l≠p; the inertia centralizer identity is reductive by the requested Prasad–Yu fixed-point input; finite unipotent conjugacy classes are a separate requested reductive-group input.

**Direct prerequisites.** `ReductiveGroupsPartII:RG2.5`, `LanglandsParameterStacks:LP1/finite-presentation-over-Z-invert-p`.

**Construction or proof.**

1. Stratify the image of the tame l-power generator by its finitely many unipotent conjugacy classes. Its orbit has dimension dim H−dim Z_H(x).
2. Frobenius choices, when nonempty, form a torsor under Z_H(x), so every stratum has dimension dim H.
3. For the parameter scheme first stratify finite prime-to-l inertia, apply the fixed-group reductivity input, then this lemma. Do not use LP3 to obtain that input.

Source: [Laurent Fargues; Peter Scholze, VIII.1.4 and end of VIII.1.3, p.281](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf). The passage states the object or result; the proof steps specify the reduction and conventions.

**Acceptance.**

- For H=G_m, the tame l-power image is finite while Frobenius varies in a one-dimensional torus.

### Flat complete-intersection parameter schemes

Identifier: `LanglandsParameterStacks:LP1/representability-flatness-and-lci`. Kind: theorem.

Each finite-wild Z¹(W,H) over Z[1/p] is flat and a relative local complete intersection of relative dimension dim H; its total dimension is dim H+1. After base change to Z_l these schemes represent finite-wild parameters, and their clopen union represents all condensed L-parameters. The quotient [Z¹/H] has expected relative dimension zero.

**Hypotheses and conventions.**

- Split reductive H with fixed finite action; l≠p for the Z_l interpretation. No condition on l dividing π₁(H)_tors is imposed.

**Direct prerequisites.** `LanglandsParameterStacks:LP1/finite-presentation-over-Z-invert-p`, `LanglandsParameterStacks:LP1/dimension-bound-lemma`, `LanglandsParameterStacks:LP1/weil-cohomological-dimension-and-euler-characteristic`, `LanglandsParameterStacks:LP1/decomposition-by-wild-kernel`, `DeformationAndDerivedPatchingAlgebra:R03.3`, `SchemeAndStackFoundations:SF.1`, `mathlib:Module.Flat`, `mathlib:RingTheory.Sequence.IsRegular`.

**Construction or proof.**

1. The finite presentation yields a complete-intersection presentation of the expected lower fibre dimension.
2. Use the dimension bound and the tame/wild reduction in DHKM4.1 to get the matching upper bound. The regular-sequence/flatness criterion gives syntomicity.
3. Base change and clopen gluing give FS VIII.1.3; subtract dim H only for the quotient stack.

Source: [Laurent Fargues; Peter Scholze, VIII.1.3, pp.279–281; DHKM Theorem4.1, pp.29–30](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf). The passage states the object or result; the proof steps specify the reduction and conventions.

**Acceptance.**

- Distinguish relative dimension dim H, absolute dimension dim H+1 and stack dimension zero.
- For the tame torus, μ_{q−1} is finite flat but may be nonreduced in characteristic l dividing q−1.

### DHKM and FS integral models

Identifier: `LanglandsParameterStacks:LP1/independent-source-and-dimension-normalisation`. Kind: comparison.

DHKM W_F^0 uses arithmetic Frobenius and the same dense tame subgroup as FS W after σ=Fr⁻¹. The finite-presentation cocycle schemes agree for matched choices over Z[1/p]; FS Z_l models are their base changes. Canonical independence of choices follows over Z_l from continuous extension, not for the framed Z[1/p]-models. DHKM dimension dim H+1 is absolute; FS dim H is relative.

**Hypotheses and conventions.**

- Match the wild quotient, action and dual integral model.

**Direct prerequisites.** `LanglandsParameterStacks:LP1/finite-presentation-over-Z-invert-p`, `LanglandsParameterStacks:LP0/change-of-discretization`, `LanglandsParameterStacks:LP1/representability-flatness-and-lci`.

**Construction or proof.**

1. Match generators and relations with the inverse Frobenius normalisation.
2. Apply the representing-functor universal property and Corollary4.2 of DHKM.
3. Record that SR.6 imports the model, retaining DHKM1.7/1.8 finiteness rather than a second construction.

Source: [Jean-François Dat; David Helm; Robert Kurinczuk; Gilbert Moss, DHKM §4.1 pp.29–31; FS VIII.1.3 p.280](https://arxiv.org/pdf/2009.06708). The passage states the object or result; the proof steps specify the reduction and conventions.

**Acceptance.**

- The same tame relation is obtained after replacing geometric Frobenius by its inverse.

### Derived parameter stacks

Identifier: `LanglandsParameterStacks:LP1/derived-parameter-stack`. Kind: construction.

Construct the derived framed cocycle stack and its quotient as the derived mapping stack over BQ, Map_{BQ}(BW,B(H⋊Q)), with framing at the base point. Its restriction to classical coefficient rings agrees with the finite-presentation parameter stack; QCoh and Perf use fpqc descent and the general derived stack enhancement.

**Hypotheses and conventions.**

- W is a finite-wild discrete model; animation and fpqc descent are imported from E5 and SF.1, and locally perfect complexes from S.1.

**Direct prerequisites.** `LanglandsParameterStacks:LP1/finite-presentation-over-Z-invert-p`, `EnhancedDerivedSheaves:E5:animation`, `EnhancedDerivedSheaves:E5:abstract`, `SchemeAndStackFoundations:SF.1`, `SchemeKTheoryOperations:S.1`, `ReductiveGroupsPartII:RG2.5`.

**Construction or proof.**

1. Use the general animated mapping-stack construction with the L-group projection.
2. A base-point framing extracts the derived crossed cocycle functor; quotient by changing framing gives the unframed mapping stack.
3. Apply the imported descent and perfectness interfaces, without constructing them again in LP1.

Source: [Laurent Fargues; Peter Scholze, VIII.2.1, pp.281–282; Zhu §3.1, Proposition3.7](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf). The passage states the object or result; the proof steps specify the reduction and conventions.

**API.**

- `DerivedParameterStack` (data): Mapping stack over BQ with the fixed quotient map.
- `DerivedParameterStack.framed` (data): Its base-point-framed fibre.
- `DerivedParameterStack.forgetFraming` (projection): Quotient of the framed stack by H.
- `DerivedParameterStack.classicalPoints` (compatibility): Classical ring points are ordinary crossed cocycles modulo gauge.
- `DerivedParameterStack.perfectPullback` (functoriality): Restriction and coefficient base change preserve locally perfect complexes by the imported S.1 interface.

**Uses.**

- `LanglandsParameterStacks:LP1/derived-comparison-with-the-classical-scheme`: Classicality of the derived model.
- `LanglandsParameterStacks:LP1/cotangent-complex-and-deformation-theory`: Tangent calculation.

**Unit tests.**

- `derived_stack_trivial_group` (degenerate): For W=1 over the trivial quotient the unframed stack is BH, and its framed space is a point.
- `derived_stack_free_group` (computation): For W=F_n with trivial quotient the stack is [H^n/H] and the framed space H^n.
- `derived_stack_gauge` (compatibility): Changing a base-point framing by h acts by c(γ)↦h c(γ)α(γ)(h)⁻¹.

**Acceptance.**

- For W=1 over the trivial quotient the unframed stack is BH, and its framed space is a point.
- For W=F_n with trivial quotient the stack is [H^n/H] and the framed space H^n.
- Changing a base-point framing by h acts by c(γ)↦h c(γ)α(γ)(h)⁻¹.

### Classicality of the derived cocycle scheme

Identifier: `LanglandsParameterStacks:LP1/derived-comparison-with-the-classical-scheme`. Kind: theorem.

The derived framed cocycle scheme of a finite-wild W is classical and equals IntegralCocycleScheme base changed to Z_l. The unframed derived stack equals [Z¹(W,H)/H].

**Hypotheses and conventions.**

- The flat lci dimension theorem and the continuous/discrete cochain comparison are used; this is more than equality on classical points.

**Direct prerequisites.** `LanglandsParameterStacks:LP1/derived-parameter-stack`, `LanglandsParameterStacks:LP1/representability-flatness-and-lci`, `LanglandsParameterStacks:LP1/weil-cohomological-dimension-and-euler-characteristic`, `DerivedDeRhamCohomology:DD.0`, `EnhancedDerivedSheaves:E5:animation`.

**Construction or proof.**

1. Compute the tangent complex using Weil cochains. Its Euler characteristic is zero for the unframed stack, hence dim H framed.
2. The classical scheme is flat lci of that expected dimension; the derived zero-locus presentation has no additional homotopy sheaves.
3. Use Zhu3.9 strong-continuity comparison to identify the derived continuous and discrete moduli problems.

Source: [Laurent Fargues; Peter Scholze, VIII.2.1, pp.281–282; Zhu Proposition3.7 and Lemma3.9, pp.32–35](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf). The passage states the object or result; the proof steps specify the reduction and conventions.

**Acceptance.**

- For W=F_n the derived presentation is the smooth classical H^n.

### Local Tate duality for Weil cochains

Identifier: `LanglandsParameterStacks:LP1/local-tate-duality`. Kind: theorem.

For a finite-rank free Λ-module M with condensed W_E-action, RΓ(W_E,M) is perfect and there is a natural duality RΓ(W_E,M)^∨ ≃ RΓ(W_E,M^∨(1))[2].

**Hypotheses and conventions.**

- Λ a Z_l-algebra, l≠p; cohomological shifts. Coefficients satisfy the relatively discrete convention.

**Direct prerequisites.** `LanglandsParameterStacks:LP1/weil-cohomological-dimension-and-euler-characteristic`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-9-the-local-weil-group`, `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-4-the-tame-quotient-of-the-absolute-galois-group`, `EnhancedDerivedSheaves:E5:presentability`.

**Construction or proof.**

1. Use the two-stage tame/Frobenius resolution after finite wild invariants, and its trace pairing.
2. The tame l-primary generator contributes the Tate twist, and the two cohomological degrees give shift [2].
3. Alternatively use local Tate duality from the requested cohomology interface; do not depend on D_lis or the spectral-action consumer.

Source: [Laurent Fargues; Peter Scholze, VIII.2.2, p.282](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf). The passage states the object or result; the proof steps specify the reduction and conventions.

**Acceptance.**

- For trivial Q_l coefficients the pairing H⁰(M)×H²(M^∨(1))→Q_l has rank one.

### Cotangent complexes of parameter stacks

Identifier: `LanglandsParameterStacks:LP1/cotangent-complex-and-deformation-theory`. Kind: theorem.

At φ over Λ the tangent complex of [Z¹(W_E,H)/H] is RΓ(W_E,Lie(H)_{Ad φ})[1]. Its dual, the pullback cotangent complex, is RΓ(W_E,Lie(H)^*_{Ad φ}(1))[1]. Thus H⁰ of the adjoint cochains gives infinitesimal automorphisms, H¹ gives deformations and H² gives obstructions.

**Hypotheses and conventions.**

- Smooth integral H, l≠p; continuous/condensed coefficients; Lie(H)^* is the dual module, not identified with Lie(H) without a specified invariant perfect pairing.

**Direct prerequisites.** `LanglandsParameterStacks:LP1/derived-parameter-stack`, `LanglandsParameterStacks:LP1/derived-comparison-with-the-classical-scheme`, `LanglandsParameterStacks:LP1/local-tate-duality`, `DerivedDeRhamCohomology:DD.0`, `ReductiveGroupsPartII:RG2.5`, `mathlib:Algebra.Extension.H1Cotangent`.

**Construction or proof.**

1. Differentiate the mapping stack: the tangent of BH is Lie(H)[1], and maps from BW take derived invariants.
2. Dualise and apply local Tate duality, obtaining the displayed cotangent shift.
3. Use the full cotangent construction from DD.0; the naive H1Cotangent declaration alone cannot represent this complex.

Source: [Laurent Fargues; Peter Scholze, VIII.2.1–VIII.2.3, pp.281–282](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf). The passage states the object or result; the proof steps specify the reduction and conventions.

**Acceptance.**

- At the trivial Q_l-valued torus parameter the adjoint deformation dimension is one and obstructions vanish.

### Weil–Deligne parameters

Identifier: `LanglandsParameterStacks:LP1/weil-deligne-parameters`. Kind: definition.

Over a Q_l-algebra Λ a Weil–Deligne parameter is (φ₀,N), where φ₀:W_E→H(Λ) is a crossed cocycle continuous for the discrete coefficient topology (trivial on an open inertia subgroup), N∈Lie(H)⊗Λ is nilpotent, and Ad(φ₀(w))(w·N)=q^{−deg(w)}N, where deg sends the chosen geometric Frobenius σ to 1 and σ⁻¹τσ=τ^q. Thus arithmetic Frobenius σ⁻¹ scales N by q; see source issue E5 for the reciprocal convention in the printed formula.

**Hypotheses and conventions.**

- Fix the tame coordinate and geometric degree convention of LP0; H has its standard finite action; nilpotence is in Lie(H), distinct from the dual nilpotent cone used for singularities.

**Direct prerequisites.** `LanglandsParameterStacks:LP0/functoriality-of-cocycles`, `ReductiveGroupsPartII:RG2.5`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-9-the-local-weil-group`.

**Construction or proof.**

1. Impose the discrete-cocycle condition and scaling equation. Conjugating exp(xN) using σ⁻¹τσ=τ^q gives Ad(φ₀(σ))(σ·N)=q⁻¹N, fixing the sign of the geometric degree.
2. Gauge sends (φ₀,N) to (h·φ₀,Ad(h)N); the condition is stable under it.

Source: [Laurent Fargues; Peter Scholze, VIII.2.4, p.282](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf). The passage states the object or result; the proof steps specify the reduction and conventions.

**API.**

- `WeilDeligneParameter` (data): A discrete-inertia cocycle and nilpotent monodromy with scaling q^{−deg(w)} for geometric degree; the split GL_n prototype takes this norm as an explicit homomorphism.
- `WeilDeligneParameter.cocycle` (projection): The discrete cocycle φ₀.
- `WeilDeligneParameter.monodromy` (projection): N, with its nilpotence and equivariance.
- `WeilDeligneParameter.gauge` (functoriality): Gauge conjugates N as well as φ₀.
- `WeilDeligneParameter.zeroMonodromy` (constructor): Discrete-inertia cocycles give parameters with N=0.
- `WeilDeligneParameter.ext` (extensionality): Equality of the discrete cocycle and of monodromy implies equality of Weil–Deligne parameters; proof fields do not introduce extra data.

**Uses.**

- `LanglandsParameterStacks:LP2:integral-invariants/weil-deligne-and-the-monodromy-map`: The characteristic-zero comparison target.

**Unit tests.**

- `WD_unramified` (degenerate): For unramified φ₀ and N=0 one obtains a Weil–Deligne parameter.
- `WD_torus` (computation): For a torus in characteristic zero the nilpotent cone is zero, so every Weil–Deligne parameter has N=0.
- `WD_gauge` (compatibility): Gauge of zeroMonodromy(φ₀) is zeroMonodromy(h·φ₀).
- `WD_geometric_frobenius` (computation): In split GL₂ with q=3, N=E₁₂ and φ₀(σ)=diag(1/3,1), conjugation sends N to N/3. This is compatible with σ⁻¹τσ=τ³ and excludes the reciprocal scaling convention. The full inertia parameter is exp(xN).

**Acceptance.**

- For unramified φ₀ and N=0 one obtains a Weil–Deligne parameter.
- For a torus in characteristic zero the nilpotent cone is zero, so every Weil–Deligne parameter has N=0.
- Gauge of zeroMonodromy(φ₀) is zeroMonodromy(h·φ₀).
- In split GL₂ with q=3, N=E₁₂ and φ₀(σ)=diag(1/3,1), conjugation sends N to N/3. This is compatible with σ⁻¹τσ=τ³ and excludes the reciprocal scaling convention. The full inertia parameter is exp(xN).

### Monodromy and the Weil–Deligne comparison

Identifier: `LanglandsParameterStacks:LP2:integral-invariants/weil-deligne-and-the-monodromy-map`. Kind: comparison.

For chosen tame coordinate and Frobenius there is an H-equivariant isomorphism Z¹(W_E,H)_{Q_l}≃Par_WD. On sufficiently small l-primary tame inertia φ(x)=exp(xN). A unipotent power of tame τ gives N=m⁻¹log φ(τ^m); subtracting its exponential gives φ₀ with finite inertia. This constructs the algebraic monodromy morphism to the Lie(H) nilpotent cone.

**Hypotheses and conventions.**

- Characteristic zero, l≠p. The isomorphism depends on choices; changing tame coordinate scales N accordingly.

**Direct prerequisites.** `LanglandsParameterStacks:LP1/weil-deligne-parameters`, `LanglandsParameterStacks:LP0/discretization-and-unique-extension`, `ArithmeticGaloisRepresentations:R01.2`, `ReductiveGroupsPartII:RG2.5`.

**Construction or proof.**

1. Use the requested quasi-unipotence theorem or the eigenvalue argument in VIII.1.3 to obtain a unipotent power. The finite logarithm and exponential are inverse on nilpotents.
2. Zhu3.10 constructs the continuous finite-inertia r and inverse exponential formula, with the chosen normal form for elements of the discrete group. Convert any arithmetic Frobenius convention to geometric degree: Ad(φ₀(σ))(σ·N)=q⁻¹N for the LP0 relation.
3. Check independence of the chosen sufficiently divisible m, then equivariance under gauge.

Source: [Laurent Fargues; Peter Scholze, VIII.2.1, pp.281–282; Zhu Lemma3.10 (formerly3.1.8), pp.35–36](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf). The passage states the object or result; the proof steps specify the reduction and conventions.

Source: [Xinwen Zhu, §3.1 Lemma3.10, pp.35–36](https://arxiv.org/pdf/2008.02998). This revised numbering is FS Zhu20 Lemma3.1.8. The finite logarithm/exponential formula gives the inverse comparison.

**Acceptance.**

- The torus case has N=0.
- Do not claim this comparison integrally: denominators in log and exp require Q_l.

### Singularities of parameter stacks

Identifier: `LanglandsParameterStacks:LP1/singularities-and-singular-support`. Kind: definition.

For X=[Z¹(W_E,H)/H] define Sing_{X/Z_l} by the general syntomic singularity construction. On an affine chart Spec B, O(Sing)=Sym_B H¹(L_{B/Z_l}^∨), representing T↦H⁻¹(L⊗_B T). It embeds into [Lie(H)^*/H]×_{BH}X. At φ the fibre is H⁰(W_E,Lie(H)^*_{Ad φ}(1)). Nilpotent singular support means support inside the pullback of the dual nilpotent cone, the closed locus of covectors whose orbit closures contain zero.

**Hypotheses and conventions.**

- Use the general construction from R03.3, full cotangent from DD.0 and smooth descent from E5. Do not replace H¹(L^∨) by H⁻¹(L)^∨ without justification.

**Direct prerequisites.** `LanglandsParameterStacks:LP1/cotangent-complex-and-deformation-theory`, `LanglandsParameterStacks:LP1/representability-flatness-and-lci`, `DeformationAndDerivedPatchingAlgebra:R03.3`, `DerivedDeRhamCohomology:DD.0`, `EnhancedDerivedSheaves:E5:animation`, `SchemeAndStackFoundations:SF.1`, `ReductiveGroupsPartII:RG2.5`.

**Construction or proof.**

1. The cotangent calculation gives the fibre and its equivariant inclusion into the dual Lie bundle.
2. Descend from affine syntomic charts using compatibility with smooth pullback.
3. Define the dual nilpotent locus by orbit closure. An identification with the usual Lie nilpotent cone requires a chosen invariant perfect pairing.

Source: [Laurent Fargues; Peter Scholze, VIII.2.2, pp.283–285](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf). The passage states the object or result; the proof steps specify the reduction and conventions.

**API.**

- `ParameterSingularities` (data): The relative singularity scheme/stack of the parameter stack.
- `ParameterSingularities.fiber` (characterisation): The fibre at φ is H⁰(W_E,Lie(H)^*_{Ad φ}(1)).
- `ParameterSingularities.embed` (projection): Closed inclusion into the dual Lie bundle pulled back from BH.
- `dualNilpotentCone` (data): Covectors with zero in their H-orbit closure.
- `NilpotentSingularSupport` (characterisation): The support of a coherent parameter complex is contained in the pullback of dualNilpotentCone.
- `ParameterSingularities.smoothPullback` (compatibility): Pullback along smooth parameter charts agrees with the affine singularity construction.

**Uses.**

- `LanglandsParameterStacks:LP1/banal-case-and-the-nilpotent-cone`: The fibre inclusion.
- `ExcursionOperatorsAndSpectralAction:ES4`: The nilpotent-support category in the consumer.

**Unit tests.**

- `singularities_smooth` (degenerate): On the smooth locus of a syntomic parameter chart the singularity fibre is zero.
- `singularities_torus_Ql` (computation): At the trivial torus parameter over Q_l, H⁰(W_E,Q_l(1))=0 and the singularity fibre is zero.
- `singularities_torus_mod_l` (non-example): For H=G_m and l dividing q−1, the trivial F_l-parameter has one-dimensional singularity fibre although the dual nilpotent cone of the torus is zero.
- `singularities_dual` (compatibility): If a specified invariant perfect Lie pairing exists, the inclusion transports to the usual Lie nilpotent cone; no such identification is implicit.

**Acceptance.**

- On the smooth locus of a syntomic parameter chart the singularity fibre is zero.
- At the trivial torus parameter over Q_l, H⁰(W_E,Q_l(1))=0 and the singularity fibre is zero.
- For H=G_m and l dividing q−1, the trivial F_l-parameter has one-dimensional singularity fibre although the dual nilpotent cone of the torus is zero.
- If a specified invariant perfect Lie pairing exists, the inclusion transports to the usual Lie nilpotent cone; no such identification is implicit.

### Hochschild action on parameter complexes

Identifier: `LanglandsParameterStacks:LP1/hochshild-action-and-support`. Kind: theorem.

On any affine syntomic parameter chart B/Z_l, The commutative square-zero-extension map H¹(L^∨)→HH²(B/Z_l) and the Hochschild action give H¹(L^∨)→Ext²_B(N,N), naturally in N. For bounded coherent N the resulting graded Sym_B H¹(L^∨)-module is coherent; its conical support descends to the parameter stack. N is perfect precisely when this support lies in the zero section, and the projection of nonzero support is the complement of its largest perfectness open.

**Hypotheses and conventions.**

- Regular noetherian base; bounded coherent N; charts syntomic. General Hochschild and complete-intersection support theorems are imported, not re-owned here.

**Direct prerequisites.** `LanglandsParameterStacks:LP1/singularities-and-singular-support`, `tauceti:TauCetiRoadmap/DGAInfinity#layer-8-hochschild-cochains-deformations-massey-products-and-formality`, `DeformationAndDerivedPatchingAlgebra:R03.3`, `SchemeKTheoryOperations:S.1`, `EnhancedDerivedSheaves:E5:animation`.

**Construction or proof.**

1. Use the commutative-extension-to-associative-extension map H¹(L^∨)→HH² and the Hochschild action on the identity bimodule from DGAInfinity8 to obtain the degree-two operators. Do not identify all HH² with H¹(L^∨); see E4.
2. Apply the requested Gulliksen finite-generation and Jørgensen/Arinkin–Gaitsgory perfectness criterion from R03.3.
3. Smooth pullback compatibility glues the result and identifies the maximal perfectness locus.

Source: [Laurent Fargues; Peter Scholze, VIII.2.6–VIII.2.10, pp.283–284](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf). The passage states the object or result; the proof steps specify the reduction and conventions.

**Acceptance.**

- A vector bundle has support in the zero section.
- Over a singular hypersurface the residue field at a singular point has nonzero singular support.

### Nilpotence of singularity fibres

Identifier: `LanglandsParameterStacks:LP1/banal-case-and-the-nilpotent-cone`. Kind: theorem.

At φ over a Z_l-field L, the fibre of ParameterSingularities is contained in the dual nilpotent cone if either L is a Q_l-field, or l∤q^{en}−1 for every homogeneous Chevalley invariant degree e, where n is the residue degree of the extension cutting out the outer action. This is an inclusion, not equality.

**Hypotheses and conventions.**

- Use Chevalley invariants in the stated very-good/banal characteristic; no assertion is made in the excluded case.

**Direct prerequisites.** `LanglandsParameterStacks:LP1/singularities-and-singular-support`, `ReductiveGroupsPartII:RG2.5`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-9-the-local-weil-group`.

**Construction or proof.**

1. A covector fixed by the Tate-twisted adjoint action has homogeneous invariant value scaled by q^{en}.
2. If q^{en}−1 is invertible every positive-degree invariant vanishes, giving the nullcone inclusion.
3. In characteristic zero all q^{en}−1 are nonzero. The source remarks that the correct support condition outside these cases is uncertain.

Source: [Laurent Fargues; Peter Scholze, VIII.2.11–VIII.2.13, pp.284–285](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf). The passage states the object or result; the proof steps specify the reduction and conventions.

**Acceptance.**

- For H=G_m and l∤q−1 both the fibre and nullcone are zero.
- At a smooth GL₂ parameter the fibre can be zero while the Lie nilpotent cone is nonzero, ruling out equality.

## LP2 — LanglandsParameterStacks:LP2

This stage aggregates the three substages below. It introduces no additional ring or reconstruction theorem; its targets are realized by the appropriate substage nodes.

**Coverage: planned.** Every original stage target is represented by a retained node, baseline/requested input or explicit existing-owner delegation. This is a complete target-level planning pass; no mathematical implementation is claimed.

Remaining obligations:

- Discharge the open supplier, coefficient-continuity and external field-input requests of its three substages; no new aggregate construction is needed.

### The three excursion comparisons

Identifier: `LanglandsParameterStacks:LP2/three-way-separation`. Kind: comparison.

At every l≠p the excursion comparison is a universal homeomorphism and classifies semisimple geometric parameters; after inverting l it is a ring isomorphism. Under l∤|π₁(H)_tors| it is an integral ring isomorphism with higher-cohomology vanishing and coefficient base change. These are three distinct mathematical strengths.

**Hypotheses and conventions.**

- Use the finite-wild piecewise interpretation. This aggregate node does not create a new hypothesis for its constituent unconditional theorems.

**Direct prerequisites.** `LanglandsParameterStacks:LP2:excursion-presentation/universal-homeomorphism`, `LanglandsParameterStacks:LP2:semisimple-characters/character-bijection`, `LanglandsParameterStacks:LP2:integral-invariants/cohomology-and-base-change`.

**Construction or proof.**

1. Combine the unconditional comparison and character theorem with the separately stated good-prime invariant theorem.
2. Keep the underlying derived cocycle colimit distinct from its stronger IndPerf(BH) version.

Source: [Laurent Fargues; Peter Scholze, VIII.3.2–VIII.3.8, pp.287–290](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf). The passage states the object or result; the proof steps specify the reduction and conventions.

**Acceptance.**

- Closed geometric points alone cannot establish an integral algebra isomorphism.

## LP2:excursion-presentation — LanglandsParameterStacks:LP2:excursion-presentation

This is the unconditional branch: coaction invariants, coarse quotients, closed semisimple orbits, finite-free-group excursion presentation and abstract categorical excursion operators. These results precede good-prime generation. Invariant functions are the coaction equalizer, not invariants of the finite group of base-field points.

**Coverage: planned.** Every original stage target is represented by a retained node, baseline/requested input or explicit existing-owner delegation. This is a complete target-level planning pass; no mathematical implementation is claimed.

Remaining obligations:

- Provide geometric-reductivity/power-lifting and quotient interfaces; elaborate their algebraic regular-function and categorical signatures. Full Exc choice independence without torsion removal remains source-open G2.

**Planets:** Coarse parameter quotients; Complete reducibility; Excursion algebras; Excursion universal homeomorphism; Excursion data; Abstract excursion centre maps.

### Coarse parameter quotients

Identifier: `LanglandsParameterStacks:LP2:excursion-presentation/coarse-quotient`. Kind: construction.

For each finite-wild affine scheme X=Z¹(W,H), let A=O(X) and define X//H=Spec(A^H) using invariants for the algebraic twisted action. The inclusion A^H→A gives the universal invariant morphism from X to an affine scheme. Inflation of finite-wild pieces induces the corresponding invariant-algebra maps and coarse maps. These objects exist without a good-prime restriction.

**Hypotheses and conventions.**

- H reductive over the base; finite generation of invariants and geometric reductivity are supplied by the reductive-group owner, not by LP3. Quotients are piecewise; the full infinite union is not silently made affine.

**Direct prerequisites.** `LanglandsParameterStacks:LP1/finite-presentation-over-Z-invert-p`, `LanglandsParameterStacks:LP1/decomposition-by-wild-kernel`, `ReductiveGroupsPartII:RG2.5`, `SchemeAndStackFoundations:SF.1`, `mathlib:RingHom`, `mathlib:Subalgebra`.

**Construction or proof.**

1. Form the algebraic coaction equaliser defining A^H. It is a subalgebra, and an invariant affine map factors uniquely through it.
2. Use geometric reductivity for finite generation and the geometric quotient properties; compatible clopen decompositions give the maps for changing wild kernels.

Source: [Laurent Fargues; Peter Scholze, VIII.3.1–VIII.3.2, pp.285–287; BHKT3.2 and3.10](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf). The passage states the object or result; the proof steps specify the reduction and conventions.

**API.**

- `ParameterInvariantAlgebra` (data): The equaliser of the algebraic coaction A→A⊗O(H) and a↦a⊗1, as a subalgebra of A=O(Z¹); taking fixed elements only under H(base) is insufficient.
- `ParameterCoarseQuotient` (data): Its spectrum, separately on each affine finite-wild piece.
- `ParameterCoarseQuotient.quotientMap` (projection): The affine map induced by the invariant inclusion.
- `ParameterCoarseQuotient.lift` (universal-property): Invariant maps to affine schemes factor uniquely, with lift and uniqueness laws.
- `ParameterCoarseQuotient.inflate` (functoriality): Shrinking P gives the compatible coarse map; identity and composition.
- `ParameterInvariantAlgebra.flatBaseChange` (compatibility): For the DVR hypotheses of the next node, flat base change commutes with invariants.
- `ParameterInvariantAlgebra.mem_iff` (characterisation): An element belongs to the invariant subalgebra exactly when its coaction equals a↦a⊗1.
- `ParameterInvariantAlgebra.inclusion` (projection): The canonical algebra injection into the coordinate algebra is injective.
- `ParameterInvariantAlgebra.lift` (universal-property): An algebra map whose image equalises the coaction and a↦a⊗1 factors uniquely through the invariant subalgebra; composing with inclusion recovers the map.

**Uses.**

- `LanglandsParameterStacks:LP2:excursion-presentation/universal-homeomorphism`: Target of the comparison.
- `LanglandsParameterStacks:LP2:semisimple-characters/character-bijection`: Coarse points used without importing LP3.

**Unit tests.**

- `coarse_trivial_group` (degenerate): For H=1 the invariant algebra is the full coordinate algebra and the quotient map is identity.
- `coarse_torus` (computation): For a torus with trivial W-action the gauge action is trivial, so the coarse quotient equals the cocycle scheme.
- `coarse_affine_universal` (characterisation): An invariant affine scalar function descends uniquely, and pulls back to itself.
- `coarse_not_orbit_set` (non-example): For the SL₂ tuple (nontrivial upper unipotent), its coarse image equals the image of the identity tuple although the two tuples are not conjugate.
- `coarse_scheme_invariants` (non-example): For the scaling action of the group scheme G_m/F₂ on A=F₂[x], coaction invariants are F₂, while the abstract group G_m(F₂) is trivial and its fixed algebra is all A. The invariant construction must use the coaction.

**Acceptance.**

- For H=1 the invariant algebra is the full coordinate algebra and the quotient map is identity.
- For a torus with trivial W-action the gauge action is trivial, so the coarse quotient equals the cocycle scheme.
- An invariant affine scalar function descends uniquely, and pulls back to itself.
- For the SL₂ tuple (nontrivial upper unipotent), its coarse image equals the image of the identity tuple although the two tuples are not conjugate.
- For the scaling action of the group scheme G_m/F₂ on A=F₂[x], coaction invariants are F₂, while the abstract group G_m(F₂) is trivial and its fixed algebra is all A. The invariant construction must use the coaction.

### Reductive quotient properties over fields and DVRs

Identifier: `LanglandsParameterStacks:LP2:excursion-presentation/quotients-over-fields-and-DVRs`. Kind: theorem.

For an integral affine finite-type X over a field with reductive G, X//G is integral finite type and normal if X is normal. Over an excellent coefficient DVR O, assume additionally X is flat; the same properties hold. For every algebraically closed O-field K, coarse K-points are closed G_K-orbits, each fibre has one closed orbit, and invariant closed sets have closed, separated images. Invariants commute with flat O-base change; invariant principal neighbourhoods exist about closed residual orbits.

**Hypotheses and conventions.**

- DVR O is the integer ring of a finite Q_l-extension as in BHKT3.2. No arbitrary nonflat base-change isomorphism is claimed. For possibly reducible parameter schemes apply the general geometric-reductivity quotient interface rather than assume integral X.

**Direct prerequisites.** `LanglandsParameterStacks:LP2:excursion-presentation/coarse-quotient`, `ReductiveGroupsPartII:RG2.5`, `SchemeAndStackFoundations:SF.1`.

**Construction or proof.**

1. Use the requested finite-generation and geometric-reductivity quotient theorem; invariants of a normal domain remain normal.
2. Apply BHKT3.10 geometric separation and invariant principal-neighbourhood properties, with flat base change computed as a flat coaction equaliser.
3. Distinguish closed-orbit point bijections from an isomorphism (A^G)⊗K≃(A⊗K)^{G_K}; the former does not imply the latter.

Source: [Gebhard Böckle; Michael Harris; Chandrashekhar Khare; Jack A. Thorne, §3.1 Proposition3.2 pp.11–12; §3.2 Proposition3.10 pp.15–16](https://archive.intlpress.com/site/pub/files/_fulltext/journals/acta/2019/0223/0001/ACTA-2019-0223-0001-a001.pdf). The passage states the object or result; the proof steps specify the reduction and conventions.

**Acceptance.**

- Check left translation (G×X)//G≃X when G acts trivially on X.
- Base change to the fraction field is flat; passage to the residue field is not flat.

### Complete reducibility and strong reductivity

Identifier: `LanglandsParameterStacks:LP2:excursion-presentation/complete-reducibility`. Kind: definition.

For connected reductive G over algebraically closed k and closed H⊂G, H is G-completely reducible when each parabolic containing H has a Levi containing H; G-irreducible when no proper parabolic contains H; strongly reductive when, for a maximal torus S of Z_G(H), H is in no proper parabolic of Z_G(S). For Γ→G(k) apply these to the Zariski closure of its image; over general k use algebraic closure. Strong G-irreducibility additionally requires every representation with the same one-variable invariant values to be G-irreducible.

**Hypotheses and conventions.**

- The strongly reductive condition is independent of the chosen maximal torus by conjugacy. Nonsplit finite-Q extensions use the separately requested nonconnected formulation.

**Direct prerequisites.** `ReductiveGroupsPartII:RG2.5`, `mathlib:Subgroup`, `mathlib:Representation`.

**Construction or proof.**

1. Import parabolic, Levi and centralizer geometry from RG. Define the three quantified predicates and the absolute representation predicates.
2. Use conjugacy of maximal tori to prove independence of S; do not identify complete reducibility with ordinary linear semisimplicity except in GL_n.

Source: [Gebhard Böckle; Michael Harris; Chandrashekhar Khare; Jack A. Thorne, §3.1 Definitions3.3,3.5 pp.11–12](https://archive.intlpress.com/site/pub/files/_fulltext/journals/acta/2019/0223/0001/ACTA-2019-0223-0001-a001.pdf). The passage states the object or result; the proof steps specify the reduction and conventions.

**API.**

- `IsGCompletelyReducible` (characterisation): Every containing parabolic admits a containing Levi.
- `IsGIrreducible` (characterisation): No proper containing parabolic.
- `IsStronglyReductive` (characterisation): No proper containing parabolic in the maximal centralizer torus centralizer.
- `IsAbsolutelyGCompletelyReducible` (characterisation): Apply complete reducibility to the geometric Zariski image.
- `IsStronglyGIrreducible` (characterisation): Irreducibility persists for representations with identical one-variable invariants.
- `IsGCompletelyReducible.conjugate` (compatibility): Each predicate is preserved by G-conjugation.
- `IsGIrreducible.completelyReducible` (relation): G-irreducible implies G-completely reducible.

**Uses.**

- `LanglandsParameterStacks:LP2:excursion-presentation/closed-orbit-criterion`: The geometric characterisation.
- `IntegralHeckeAndGaloisDeterminants:IHG.1/reductive-stable-tuple`: The minimal-parabolic reconstruction.

**Unit tests.**

- `cr_torus` (computation): A maximal torus of SL₂ is completely reducible but not SL₂-irreducible.
- `cr_unipotent` (non-example): The upper unipotent root subgroup of SL₂ lies in its Borel and in no Levi of that Borel, hence is not completely reducible.
- `cr_GL` (compatibility): For GL(V), the Zariski image is completely reducible exactly when V is a semisimple representation.
- `cr_trivial` (degenerate): The trivial subgroup is completely reducible.

**Acceptance.**

- A maximal torus of SL₂ is completely reducible but not SL₂-irreducible.
- The upper unipotent root subgroup of SL₂ lies in its Borel and in no Levi of that Borel, hence is not completely reducible.
- For GL(V), the Zariski image is completely reducible exactly when V is a semisimple representation.
- The trivial subgroup is completely reducible.

### Closed tuples and Levi semisimplification

Identifier: `LanglandsParameterStacks:LP2:excursion-presentation/closed-orbit-criterion`. Kind: theorem.

For a tuple x∈G(k)^n, with G connected reductive and k algebraically closed of any characteristic, its orbit is closed iff its generated Zariski subgroup is strongly reductive iff it is G-completely reducible. It is stable iff this subgroup is G-irreducible. Projection along a minimal containing parabolic to a Levi gives a cocharacter limit in the unique closed orbit in the closure. For a completely reducible subgroup, a containing Levi in a minimal parabolic is irreducible; all minimal containing parabolics have the same dimension.

**Hypotheses and conventions.**

- No very-good characteristic hypothesis; use the scheme-theoretic centralizer only when separability is additionally needed.

**Direct prerequisites.** `LanglandsParameterStacks:LP2:excursion-presentation/complete-reducibility`, `LanglandsParameterStacks:LP2:excursion-presentation/quotients-over-fields-and-DVRs`, `ReductiveGroupsPartII:RG2.5`.

**Construction or proof.**

1. Use the requested Richardson–Bate–Martin–Röhrle tuple criterion.
2. A cocharacter centralising a Levi contracts the unipotent radical to the identity, giving the semisimplification limit and its invariant values.
3. Apply BHKT3.7: minimal parabolics have a common Levi comparison, and a completely reducible subgroup in such a Levi cannot lie in a proper Levi parabolic.

Source: [Gebhard Böckle; Michael Harris; Chandrashekhar Khare; Jack A. Thorne, §3.1 Theorem3.4, Proposition3.6, Proposition3.7 pp.12–13](https://archive.intlpress.com/site/pub/files/_fulltext/journals/acta/2019/0223/0001/ACTA-2019-0223-0001-a001.pdf). The passage states the object or result; the proof steps specify the reduction and conventions.

**Acceptance.**

- The SL₂ unipotent tuple limits to the identity; a semisimple diagonal tuple has closed orbit.

### Semisimple L-parameters

Identifier: `LanglandsParameterStacks:LP2:semisimple-characters/semisimple-parameters-and-closed-orbits`. Kind: definition.

For an algebraically closed Z_l-field L, a parameter into H(L)⋊W_E is semisimple if every parabolic of this L-group containing its image admits a Levi containing that image. Equivalently, for every conjugate factoring through a standard action-stable parabolic, it is H(L)-conjugate to its Levi projection. The definition is also used for arbitrary Γ→Q, with image in H(L)⋊Q and the nonconnected complete-reducibility formulation.

**Hypotheses and conventions.**

- Parabolics project surjectively to the acting group and have the corresponding Levi projection. The action-stable parabolic is not an arbitrary parabolic of H with no Q condition.

**Direct prerequisites.** `LanglandsParameterStacks:LP2:excursion-presentation/complete-reducibility`, `LanglandsParameterStacks:LP0/condensed-cocycles-and-L-parameters`, `ReductiveGroupsPartII:RG2.5`.

**Construction or proof.**

1. Apply the nonconnected reductive-group interface from RG; pass between action-stable standard parabolics and their conjugates.
2. Specialise Γ to a discrete finite-wild Weil group and extend to W_E.

Source: [Laurent Fargues; Peter Scholze, VIII.3.1, pp.286–287](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf). The passage states the object or result; the proof steps specify the reduction and conventions.

**API.**

- `IsSemisimpleParameter` (characterisation): The containing-parabolic/containing-Levi property.
- `IsSemisimpleParameter.leviCriterion` (characterisation): Every standard-parabolic factorisation is conjugate to its Levi projection.
- `IsSemisimpleParameter.gauge` (compatibility): The predicate is invariant under gauge conjugation.
- `IsSemisimpleParameter.GL` (compatibility): For split GL_n it agrees with semisimplicity of the underlying linear representation.

**Uses.**

- `LanglandsParameterStacks:LP2:excursion-presentation/parameter-closed-orbits`: Closed-orbit criterion without good-prime input.
- `LanglandsParameterStacks:LP2:semisimple-characters/proof-of-the-character-bijection`: Group-agnostic reconstruction.

**Unit tests.**

- `semisimple_torus` (computation): Every parameter into a torus is semisimple because there are no proper parabolics.
- `semisimple_split_GL` (compatibility): A direct sum of characters into GL_n is semisimple.
- `semisimple_unipotent` (non-example): A nontrivial unipotent generator representation of Z in SL₂ is not semisimple although all its invariant values agree with the trivial representation.

**Acceptance.**

- Every parameter into a torus is semisimple because there are no proper parabolics.
- A direct sum of characters into GL_n is semisimple.
- A nontrivial unipotent generator representation of Z in SL₂ is not semisimple although all its invariant values agree with the trivial representation.

### Closed parameter orbits

Identifier: `LanglandsParameterStacks:LP2:excursion-presentation/parameter-closed-orbits`. Kind: theorem.

For every finite-wild component over algebraically closed L, closed H(L)-orbits of cocycles are exactly semisimple parameters, equivalently parameters conjugate to every applicable Levi projection. Consequently the coarse L-points classify semisimple gauge classes without assuming l∤|π₁(H)_tors|.

**Hypotheses and conventions.**

- L has any characteristic allowed by Z_l; twisted conjugation uses the finite Q action.

**Direct prerequisites.** `LanglandsParameterStacks:LP2:semisimple-characters/semisimple-parameters-and-closed-orbits`, `LanglandsParameterStacks:LP2:excursion-presentation/coarse-quotient`, `LanglandsParameterStacks:LP2:excursion-presentation/closed-orbit-criterion`, `ReductiveGroupsPartII:RG2.5`.

**Construction or proof.**

1. Apply Hilbert–Mumford–Kempf to the finite-generator cocycle presentation.
2. For dominant λ, lim λ(t)gλ(t)^{−τ} exists iff g lies in P_λ and τλ=λ; the limit is the Levi projection.
3. Use the nonconnected Richardson/BMR criterion for H⋊Q and the unconditional quotient geometric-point theorem.

Source: [Laurent Fargues; Peter Scholze, VIII.3.2–VIII.3.3, pp.286–287](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf). The passage states the object or result; the proof steps specify the reduction and conventions.

**Acceptance.**

- The criterion for nonsplit groups requires τλ=λ; omitting it gives the wrong degeneration.

### Finite free-group indexing

Identifier: `LanglandsParameterStacks:LP2:excursion-presentation/free-cocycle-index`. Kind: definition.

For any Γ→Q let FreeCocycleIndex(Γ) have objects (n,u:F_n→Γ) and morphisms v:F_n→F_m with u=u′∘v. The coordinate-algebra diagram is covariant by restriction of cocycles. The category is nonempty and has finite coproducts (free products), hence is sifted.

**Hypotheses and conventions.**

- Include n=0 and the unique map F₀→Γ. The invariant algebras use the pulled-back Q-actions.

**Direct prerequisites.** `mathlib:FreeGroup`, `mathlib:MonoidHom`.

**Construction or proof.**

1. Use the baseline finite free groups and their universal property to form this category.
2. Concatenate generator tuples for coproducts; the diagonal has the required finality because finite coproducts exist.

Source: [Laurent Fargues; Peter Scholze, VIII.3.2, p.287](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf). The passage states the object or result; the proof steps specify the reduction and conventions.

**API.**

- `FreeCocycleIndex` (data): Finite free group maps to Γ and commuting triangle morphisms.
- `FreeCocycleIndex.coproduct` (constructor): Free product with the induced map to Γ.
- `FreeCocycleIndex.coordinateDiagram` (functoriality): Cocycle restriction gives the covariant coordinate-ring diagram.
- `FreeCocycleIndex.sifted` (structure): The index is sifted, with the zero-generator object providing nonemptiness.
- `FreeCocycleIndex.ofTuple` (constructor): A finite tuple in Γ extends uniquely to a homomorphism F_n→Γ and hence gives an indexing object; evaluation on free generators recovers the tuple.

**Uses.**

- `LanglandsParameterStacks:LP2:excursion-presentation/excursion-algebra-and-universal-homeomorphism`: The invariant colimit index.
- `ExcursionOperatorsAndSpectralAction:ES3/discrete-group-presentation`: The animated free resolution index.

**Unit tests.**

- `index_zero` (degenerate): The zero-generator map is initial.
- `index_coproduct` (computation): The coproduct of n- and m-generator tuples is the n+m-generator concatenation.
- `index_direction` (characterisation): A word map F_n→F_m induces O(Z¹(F_n,H))→O(Z¹(F_m,H)), not the reverse ring map.

**Acceptance.**

- The zero-generator map is initial.
- The coproduct of n- and m-generator tuples is the n+m-generator concatenation.
- A word map F_n→F_m induces O(Z¹(F_n,H))→O(Z¹(F_m,H)), not the reverse ring map.

### Excursion algebras

Identifier: `LanglandsParameterStacks:LP2:excursion-presentation/excursion-algebra-and-universal-homeomorphism`. Kind: construction.

Define Exc(Γ,H)=colim_{(n,F_n→Γ)} O(Z¹(F_n,H))^H in Z_l-algebras. The action on each free cocycle space is the pulled-back Q-twisted conjugation. Restriction of the universal Γ-cocycle induces a canonical algebra map Exc(Γ,H)→O(Z¹(Γ,H))^H whenever the Γ-cocycle scheme is represented.

**Hypotheses and conventions.**

- Γ is any discrete group with map to Q for the colimit construction; the finite-wild W case has a representing finite-type scheme.

**Direct prerequisites.** `LanglandsParameterStacks:LP2:excursion-presentation/free-cocycle-index`, `LanglandsParameterStacks:LP2:excursion-presentation/coarse-quotient`, `EnhancedDerivedSheaves:E5:presentability`, `mathlib:CommRingCat.Colimits.hasColimits_commRingCat`.

**Construction or proof.**

1. Build the invariant diagram over FreeCocycleIndex and take its ring colimit.
2. Use the universal cocycle evaluation to obtain its compatible cone into the invariant algebra. Keep the universal-homeomorphism assertion as a separate theorem.

Source: [Laurent Fargues; Peter Scholze, VIII.3.4, p.287](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf). The passage states the object or result; the proof steps specify the reduction and conventions.

**API.**

- `ExcursionAlgebra` (data): The colimit of free-cocycle invariant algebras.
- `ExcursionAlgebra.ofFree` (constructor): Structure map from each free tuple invariant algebra.
- `ExcursionAlgebra.lift` (universal-property): Compatible ring maps out of the free diagram induce a unique ring map; evaluation and uniqueness laws.
- `ExcursionAlgebra.compare` (projection): The canonical map to represented Γ-cocycle invariants.
- `ExcursionAlgebra.mapGroup` (functoriality): A homomorphism Γ→Γ′ over Q induces Exc(Γ,H)→Exc(Γ′,H), with identity and composition laws.

**Uses.**

- `LanglandsParameterStacks:LP2:excursion-presentation/universal-property-of-the-excursion-algebra`: The explicit Θ presentation.
- `LanglandsParameterStacks:LP2:integral-invariants/integral-invariant-theorem`: The good-prime comparison.

**Unit tests.**

- `excursion_trivial_dual` (degenerate): For H=1 and fixed Γ→Q all free-cocycle invariant rings are the base, so Exc is the base.
- `excursion_free_group` (compatibility): For Γ=F_n the identity tuple is terminal in the index, hence Exc≃O(Z¹(F_n,H))^H.
- `excursion_lift_eval` (characterisation): For a compatible cone ξ, lift(ξ)∘ofFree(u)=ξ_u for every u.

**Acceptance.**

- For H=1 and fixed Γ→Q all free-cocycle invariant rings are the base, so Exc is the base.
- For Γ=F_n the identity tuple is terminal in the index, hence Exc≃O(Z¹(F_n,H))^H.
- For a compatible cone ξ, lift(ξ)∘ofFree(u)=ξ_u for every u.

### Excursion comparison as a universal homeomorphism

Identifier: `LanglandsParameterStacks:LP2:excursion-presentation/universal-homeomorphism`. Kind: theorem.

For a finite-wild W, Spec(O(Z¹(W,H))^H)→Spec Exc(W,H) is a universal homeomorphism, and the algebra comparison is an isomorphism after inverting l. Its proof is independent of l∤|π₁(H)_tors|.

**Hypotheses and conventions.**

- H reductive, Z_l coefficients, finite-wild W; distinguish a universal homeomorphism from an integral ring isomorphism.

**Direct prerequisites.** `LanglandsParameterStacks:LP2:excursion-presentation/excursion-algebra-and-universal-homeomorphism`, `LanglandsParameterStacks:LP2:excursion-presentation/free-cocycle-index`, `ReductiveGroupsPartII:RG2.5`, `mathlib:PrimeSpectrum.isHomeomorph_comap`.

**Construction or proof.**

1. First reconstruct the full cocycle coordinate algebra as the sifted colimit of free cocycle algebras.
2. Geometric reductivity supplies power lifting of invariant functions and nilpotent kernel after every base change, so apply the spectrum criterion base change by base change.
3. Over Q_l algebraic representations are semisimple, and invariants commute with this colimit, giving a ring isomorphism.

Source: [Laurent Fargues; Peter Scholze, VIII.3.2, p.287](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf). The passage states the object or result; the proof steps specify the reduction and conventions.

**Acceptance.**

- Geometric L-points agree at all primes; this does not prove integral equality of rings.

### The universal excursion relations

Identifier: `LanglandsParameterStacks:LP2:excursion-presentation/universal-property-of-the-excursion-algebra`. Kind: theorem.

Maps Exc(Γ,H)→A correspond to families of Z_l-algebra maps Θ_n:O((H⋊Q)^n//H)→Map(Γ^n,A), n≥1, linear over O(Q^n) via Γ→Q, compatible with coordinate reindexing and with ordered multiplication in fibres of every map between finite ordered sets. Empty products are units. These relations imply insertion of identities and inversion/word substitution, yielding the full free-group diagram compatibility.

**Hypotheses and conventions.**

- Γ is any discrete group over Q; A is any Z_l-algebra. No π₁ good-prime restriction or continuity assumption in this algebraic universal property.

**Direct prerequisites.** `LanglandsParameterStacks:LP2:excursion-presentation/excursion-algebra-and-universal-homeomorphism`, `LanglandsParameterStacks:LP2:excursion-presentation/free-cocycle-index`, `ReductiveGroupsPartII:RG2.5`.

**Construction or proof.**

1. A free tuple identifies O(Z¹(F_n,H))^H with the Q-tuple fibre of O((H⋊Q)^n//H).
2. The ring colimit is exactly the compatible family of maps on all finite words. Reindexing and multiplication give positive words and units.
3. For inverses, insert the pair (γ,γ⁻¹), multiply it to the unit and apply the group identity; this recovers arbitrary signed word substitution.

Source: [Laurent Fargues; Peter Scholze, VIII.3.7 and proof, pp.288–289](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf). The passage states the object or result; the proof steps specify the reduction and conventions.

**Acceptance.**

- For H=G_m and Γ=F₁, the presentation recovers Z_l[t,t⁻¹].
- For noncommuting Γ words, fibre products retain their specified order.

### Continuous torsion-free excursion characters

Identifier: `LanglandsParameterStacks:LP2:integral-invariants/transition-and-continuity`. Kind: theorem.

The l-torsion-free quotient Exc(W,H)_tf is flat over Z_l and has the universal property of the Θ families of VIII.3.7 for flat test algebras A when those families are maps of condensed sets on (W_E/P)^n. The torsion-free quotient is canonically independent of the dense discrete W. Inflation on finite-wild pieces is compatible with evaluation and the invariant comparison. Geometric field-valued characters do not change under removal of l-power torsion because that torsion is nilpotent.

**Hypotheses and conventions.**

- Finite-wild W inside W_E/P; standard relatively discrete coefficient convention. The torsion-free quotient is independent of W; FS leaves independence of the full Exc without this quotient open.

**Direct prerequisites.** `LanglandsParameterStacks:LP2:excursion-presentation/universal-property-of-the-excursion-algebra`, `LanglandsParameterStacks:LP2:excursion-presentation/universal-homeomorphism`, `LanglandsParameterStacks:LP0/discretization-and-unique-extension`, `LanglandsParameterStacks:LP2:excursion-presentation/coarse-quotient`, `mathlib:Module.Flat`.

**Construction or proof.**

1. Restrict continuous Θ to W and use the algebraic universal property.
2. Over torsion-free A, the matrix/binomial extension argument promotes the relations to continuous functions on W_E/P; quotient by l-torsion gives the representing algebra.
3. Flatness over the DVR is torsion-freeness. Use the power-lifting comparison to identify the nilpotent torsion and unchanged geometric characters.

Source: [Laurent Fargues; Peter Scholze, VIII.3.3 after VIII.3.7, pp.289–290](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf). The passage states the object or result; the proof steps specify the reduction and conventions.

**Acceptance.**

- Continuity is imposed on W_E/P, not a nonexistent profinite topology on all of the discrete W.

### Categorical Hecke data

Identifier: `LanglandsParameterStacks:LP2:excursion-presentation/categorical-hecke-datum`. Kind: definition.

For a Z_l-linear category C, a categorical Hecke datum assigns every finite I a Rep(Q^I)-linear monoidal functor Rep((H⋊Q)^I)→End(C)^{BΓ^I}, natural coherently in finite-set maps, where Γ→Q is fixed. The unit and diagonal/fusion identifications are part of the data. In a stable category the functors are exact. For a stable infinity-category use coherent exact functors and the operator centre π₀End(id_C); the ordinary categorical centre is only its ordinary shadow.

**Hypotheses and conventions.**

- Use the abstract category C, not Bun_G. Stable enhancements, endofunctors and equivariant objects are supplied by E5.

**Direct prerequisites.** `ReductiveGroupsPartII:RG2.5`, `EnhancedDerivedSheaves:E5:abstract`, `mathlib:CategoryTheory.MonoidalCategory`, `mathlib:CategoryTheory.Functor.Monoidal`, `mathlib:CategoryTheory.CatCenter`.

**Construction or proof.**

1. Package the representation functors, Γ^I actions and finite-set coherence.
2. Evaluation on the trivial representation is the identity endofunctor. The diagonal restriction allows invariant α and β to become creation and annihilation natural transformations.

Source: [Laurent Fargues; Peter Scholze, VIII.4 setup, pp.290–291](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf). The passage states the object or result; the proof steps specify the reduction and conventions.

**API.**

- `CategoricalHeckeDatum` (data): Coherent finite-set monoidal representation functors with Γ^I-equivariance and fusion; exact in the stable infinity-category version, whose operator centre is π₀End(id_C).
- `CategoricalHeckeDatum.unit` (simp): The trivial representation acts as identity.
- `CategoricalHeckeDatum.reindex` (compatibility): Finite-set pullback and fusion commute coherently with the Γ-action.
- `CategoricalHeckeDatum.create` (constructor): A diagonal invariant α:1→V creates a transformation id_C→T_V.
- `CategoricalHeckeDatum.annihilate` (constructor): A diagonal invariant β:V→1 annihilates T_V→id_C.

**Uses.**

- `LanglandsParameterStacks:LP2:excursion-presentation/map-to-a-bernstein-center`: Input for the abstract excursion theorem.
- `ExcursionOperatorsAndSpectralAction:ES0`: HS1/HS4 supply this datum for the Bun_G consumer.

**Unit tests.**

- `hecke_empty_set` (degenerate): For I=∅ the unit object acts as identity with trivial Γ^∅-action.
- `hecke_fold` (characterisation): Folding I⊔I to I identifies the external tensor product action with the tensor product action.
- `hecke_zero_category` (computation): The zero stable category admits the unique datum; every excursion endomorphism is zero.

**Acceptance.**

- For I=∅ the unit object acts as identity with trivial Γ^∅-action.
- Folding I⊔I to I identifies the external tensor product action with the tensor product action.
- The zero stable category admits the unique datum; every excursion endomorphism is zero.

### Excursion data

Identifier: `LanglandsParameterStacks:LP2:excursion-presentation/excursion-datum`. Kind: definition.

An excursion datum is (I,V,α,β,(γ_i)), with I finite, V a finite-projective representation of (H⋊Q)^I, α:1→V and β:V→1 invariant under diagonal H, and γ_i∈Γ. For a categorical Hecke datum define S_D=T_β∘(γ_i)∘T_αas a natural endomorphism of id_C, giving a class in π₀End(id_C) in the stable infinity-category setting.

**Hypotheses and conventions.**

- Integral finite-projective representations; the Γ^I action is part of the categorical datum.

**Direct prerequisites.** `LanglandsParameterStacks:LP2:excursion-presentation/categorical-hecke-datum`, `ReductiveGroupsPartII:RG2.5`, `mathlib:Representation`, `mathlib:CategoryTheory.CatCenter`.

**Construction or proof.**

1. Use the diagonal invariant maps as creation/annihilation transformations, then compose with the tuple action.
2. Naturality makes the composite a central natural endomorphism, not merely an endomorphism of one object.

Source: [Laurent Fargues; Peter Scholze, VIII.4.2, p.291](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf). The passage states the object or result; the proof steps specify the reduction and conventions.

**API.**

- `ExcursionDatum` (data): Finite I, V, invariant α,β and Γ-tuple.
- `ExcursionDatum.operator` (constructor): The natural endomorphism S_D, with its class in π₀End(id_C) for a stable infinity-category.
- `ExcursionDatum.reindex` (functoriality): Reindex tuples and pull back the representation; the resulting operator is unchanged.
- `ExcursionDatum.tensor` (constructor): External tensor product on I⊔J with tensor α,β and concatenated tuple.

**Uses.**

- `LanglandsParameterStacks:LP2:excursion-presentation/invariant-function-and-independence`: Matrix coefficient and its canonical presentation.
- `LanglandsParameterStacks:LP2:excursion-presentation/map-to-a-bernstein-center`: Assembly into a ring map.

**Unit tests.**

- `datum_unit` (degenerate): For the unit representation and α=β=id, S_D=id_C.
- `datum_zero_alpha` (computation): If α=0 then S_D=0.
- `datum_tensor_operator` (compatibility): For external tensor products S_{D⊗D′}=S_D S_D′.

**Acceptance.**

- For the unit representation and α=β=id, S_D=id_C.
- If α=0 then S_D=0.
- For external tensor products S_{D⊗D′}=S_D S_D′.

### Excursion matrix coefficients

Identifier: `LanglandsParameterStacks:LP2:excursion-presentation/invariant-function-and-independence`. Kind: construction.

To (I,V,α,β) associate f_D((h_i,q_i))=β(((h_i,q_i))·α), a regular function on H\(H⋊Q)^I/H. Let V_f be the finite-projective subrepresentation generated by f in the regular functions on (H⋊Q)^I/H, with α_f=f and β_f evaluation at the unit. The induced canonical presentation gives the same excursion operator, independent of (V,α,β).

**Hypotheses and conventions.**

- The finite-projective subrepresentation is taken in the integral representation framework supplied by RG, as used in FS; the function is bi-invariant because α and β are diagonal H-invariant.

**Direct prerequisites.** `LanglandsParameterStacks:LP2:excursion-presentation/excursion-datum`, `ReductiveGroupsPartII:RG2.5`.

**Construction or proof.**

1. Replace V by the subrepresentation generated by α; the map v↦(g↦β(gv)) identifies its quotient with V_f. Functoriality under the resulting representation maps identifies S_D with the canonical operator.
2. Finite-set naturality yields a commuting reindexing square. It does not generally make that square a pullback; see source issue E3.

Source: [Laurent Fargues; Peter Scholze, Proof VIII.4.1, pp.291–292](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf). The passage states the object or result; the proof steps specify the reduction and conventions.

**API.**

- `excursionMatrixCoefficient` (data): The bi-invariant regular function f_D.
- `excursionMatrixCoefficient.eval` (simp): Its value is β(g·α).
- `excursionMatrixCoefficient.canonicalPresentation` (constructor): The generated regular-function representation with α_f=f, β_f evaluation at the unit.
- `excursionMatrixCoefficient.operatorIndependent` (relation): Equal f_D give equal operators for fixed I and tuple.
- `excursionMatrixCoefficient.reindex` (functoriality): Pullback of f agrees with reindexing the datum.

**Uses.**

- `LanglandsParameterStacks:LP2:excursion-presentation/map-to-a-bernstein-center`: Independence and multiplication descend to invariant functions.

**Unit tests.**

- `coefficient_unit` (computation): For V=1 and α=β=id the coefficient is 1.
- `coefficient_zero` (degenerate): For α=0 the coefficient is zero.
- `coefficient_product` (compatibility): External tensor product gives the product of the two matrix coefficients.
- `coefficient_biinvariant` (characterisation): For diagonal a,b∈H, f_D(a g_i b)=f_D(g_i).

**Acceptance.**

- For V=1 and α=β=id the coefficient is 1.
- For α=0 the coefficient is zero.
- External tensor product gives the product of the two matrix coefficients.
- For diagonal a,b∈H, f_D(a g_i b)=f_D(g_i).

### Abstract excursion centre maps

Identifier: `LanglandsParameterStacks:LP2:excursion-presentation/map-to-a-bernstein-center`. Kind: theorem.

Every categorical Hecke datum for Γ over Q induces a natural Z_l-algebra map Exc(Γ,H)→π₀End(id_C), sending an invariant function evaluated at a Γ-tuple to its excursion operator. This is group-agnostic and has no π₁ good-prime condition. The Bun_G and Bernstein-centre comparisons are consumer applications.

**Hypotheses and conventions.**

- C is a Z_l-linear stable infinity-category and the finite-set monoidal functors are coherent and exact. The ordinary-category version targets End(id_C); the pinned CatCenter alone does not supply the enhanced target.

**Direct prerequisites.** `LanglandsParameterStacks:LP2:excursion-presentation/invariant-function-and-independence`, `LanglandsParameterStacks:LP2:excursion-presentation/universal-property-of-the-excursion-algebra`, `LanglandsParameterStacks:LP2:excursion-presentation/categorical-hecke-datum`, `mathlib:CategoryTheory.CatCenter`.

**Construction or proof.**

1. Use the matrix-coefficient presentation for operator independence. External tensors and the fold I⊔I→I prove multiplicativity, the trivial representation proves the unit.
2. Insert an extra coordinate over 1∈Q to identify the bi-invariant quotient with the simultaneous-conjugation invariant functions on n coordinates.
3. Reindexing and the evaluation/coevaluation triple-product identity γγ′⁻¹γ″ give the word relations of the universal excursion algebra; apply its universal property.

Source: [Laurent Fargues; Peter Scholze, VIII.4.1–VIII.4.2 pp.290–293; Lafforgue Lemma10.1 and Proposition10.8](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf). The passage states the object or result; the proof steps specify the reduction and conventions.

**Acceptance.**

- The zero category gives the zero ring homomorphism into its zero centre.
- Unit data evaluate to the identity and external tensor products multiply.

### Derived free-cocycle presentations

Identifier: `LanglandsParameterStacks:LP2:excursion-presentation/free-derived-cocycle-colimit`. Kind: theorem.

For finite-wild W the natural map colim_{F_n→W} O(Z¹(F_n,H))→O(Z¹(W,H)) is an isomorphism in D(Z_l), indeed of animated algebras. This underlying derived statement has no π₁ good-prime restriction.

**Hypotheses and conventions.**

- Do not upgrade this directly to an isomorphism in IndPerf(BH); that stronger equivariant assertion is the next stage.

**Direct prerequisites.** `LanglandsParameterStacks:LP2:excursion-presentation/free-cocycle-index`, `LanglandsParameterStacks:LP1/derived-comparison-with-the-classical-scheme`, `EnhancedDerivedSheaves:E5:animation`, `EnhancedDerivedSheaves:E5:presentability`.

**Construction or proof.**

1. The colimit is the universal animated algebra with a W-cocycle.
2. The classical truncation is the ordinary cocycle algebra; the derived deformation calculation and correct lci dimension force the animated algebra to be classical.

Source: [Laurent Fargues; Peter Scholze, VIII.3.5 and proof, p.288](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf). The passage states the object or result; the proof steps specify the reduction and conventions.

**Acceptance.**

- This ordinary derived isomorphism alone does not justify commuting rational H-invariants with the colimit in characteristic l.

## LP2:integral-invariants — LanglandsParameterStacks:LP2:integral-invariants

The integral isomorphism, higher rational algebraic-group cohomology vanishing and arbitrary coefficient base change are the good-π₁ conclusions. The two legacy IDs placed in earlier stages retain their identifiers: the monodromy comparison lives in LP1 and transition/continuity in excursion-presentation.

**Coverage: planned.** Every original stage target is represented by a retained node, baseline/requested input or explicit existing-owner delegation. This is a complete target-level planning pass; no mathematical implementation is claimed.

Remaining obligations:

- Supply the highest-weight/derived coefficient-change interfaces and verify the all-coefficient good-prime base-change reduction; elaborate the IndPerf theorem signatures.

**Planets:** Integral invariant comparison.

### Integral invariant comparison

Identifier: `LanglandsParameterStacks:LP2:integral-invariants/integral-invariant-theorem`. Kind: theorem.

Assume l∤|π₁(H)_tors|. Then colim_{F_n→W}O(Z¹(F_n,H))→O(Z¹(W,H)) is an isomorphism in IndPerf(BH) over Z_l. In particular Exc(W,H)≃O(Z¹(W,H))^H as Z_l-algebras.

**Hypotheses and conventions.**

- l≠p; finite-wild W. These are stronger integral assertions than the unconditional universal homeomorphism or underlying D(Z_l) comparison.

**Direct prerequisites.** `LanglandsParameterStacks:LP3/tame-case-and-the-wild-remainder`, `LanglandsParameterStacks:LP3/free-cocycle-good-filtration`, `LanglandsParameterStacks:LP2:excursion-presentation/free-derived-cocycle-colimit`, `LanglandsParameterStacks:LP2:excursion-presentation/excursion-algebra-and-universal-homeomorphism`, `EnhancedDerivedSheaves:E5:presentability`, `ReductiveGroupsPartII:RG2.5`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-9-pinned-chevalleydemazure-group-schemes-over-ℤ`.

**Construction or proof.**

1. The mod-l IndPerf comparison is the wild-to-tame theorem. Rationally H-representations are semisimple and the underlying derived comparison suffices.
2. Rational and mod-l reduction detect the cone; use the coefficient/IndPerf base-change interface.
3. Since the free cocycle algebras and the resulting algebra have good filtrations modulo l, applying H-invariants computes the ordinary invariant ring and commutes with this sifted colimit.

Source: [Laurent Fargues; Peter Scholze, VIII.3.6 p.288; VIII.5.1–VIII.5.2 pp.293–294,315](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf). The passage states the object or result; the proof steps specify the reduction and conventions.

**Acceptance.**

- For H a torus the π₁ torsion condition is automatic.
- At a bad π₁ prime retain the universal homeomorphism and geometric character bijection; this theorem is unavailable.

### Cohomology vanishing and invariant base change

Identifier: `LanglandsParameterStacks:LP2:integral-invariants/cohomology-and-base-change`. Kind: theorem.

Under the same good-prime hypotheses, the cocycle algebra has no higher rational H-cohomology, its invariant algebra is Z_l-flat, and for a Z_l-algebra Λ the canonical map O(Z¹(W,H))^H⊗Λ→O(Z¹(W,H)_Λ)^{H_Λ} is an isomorphism, with the derived base-change form supplied by the equivariant colimit.

**Hypotheses and conventions.**

- The all-coefficient base-change conclusion here is parameter-specific and uses good filtrations; it is not the generic DVR quotient theorem, which grants only flat base change.

**Direct prerequisites.** `LanglandsParameterStacks:LP2:integral-invariants/integral-invariant-theorem`, `LanglandsParameterStacks:LP3/free-cocycle-good-filtration`, `LanglandsParameterStacks:LP1/representability-flatness-and-lci`, `ReductiveGroupsPartII:RG2.5`, `EnhancedDerivedSheaves:E5:presentability`, `mathlib:Module.Flat`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-9-pinned-chevalleydemazure-group-schemes-over-ℤ`.

**Construction or proof.**

1. Each free cocycle algebra has the imported good filtration; the mod-l comparison places the result in the connective good-filtration part.
2. Use the equivariant integral colimit and coefficient change to obtain derived invariants and their concentration in degree zero.
3. Flatness of the coordinate algebra and its invariants identifies derived tensor with ordinary tensor; deduce the displayed map.

Source: [Laurent Fargues; Peter Scholze, VIII.5.1–VIII.5.2 and proof, pp.293–294](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf). The passage states the object or result; the proof steps specify the reduction and conventions.

**Acceptance.**

- Residue-field base change here is justified by the good-prime theorem, not by falsely calling Z_l→F_l flat.

## LP2:semisimple-characters — LanglandsParameterStacks:LP2:semisimple-characters

General reconstruction is imported from IHG. The local declarations impose the fixed Q-projection by component idempotents, apply reconstruction, and establish the two Weil-continuity clauses with their exact coefficient hypotheses. The group trace construction is an A[Γ] adapter of the imported linear pseudocharacter.

**Coverage: planned.** Every original stage target is represented by a retained node, baseline/requested input or explicit existing-owner delegation. This is a complete target-level planning pass; no mathematical implementation is claimed.

Remaining obligations:

- Supply the characteristic-zero finite-Q relatively discrete continuity extension G4 and full invariant-coordinate signatures.
- Apply the exact external IHG field-input prerequisite replacement in G6; generic reconstruction and finite anchors are already imported, not reproved here.

**Planets:** Projected reductive pseudocharacters; Fixed-projection reconstruction; Continuous semisimple parameter characters; Group-algebra trace adapter.

### Pseudocharacters with prescribed finite projection

Identifier: `LanglandsParameterStacks:LP2:semisimple-characters/reductive-pseudocharacters`. Kind: definition.

Let H be the pinned split reductive group over Z_l, let finite Q act on H, put J=H⋊Q, and fix η:Γ→Q. Define ProjectedPseudocharacter(η,A) as the fibre of the imported IHG.0 J-pseudocharacter functor over η. For every n≥1 and q̄∈Q^n, let e_q̄ be the component idempotent in O[J^n]^H. Its required evaluation is Θ_n(e_q̄)(γ̄)=1 if η(γ̄)=q̄ and 0 otherwise. Thus only the prescribed components contribute, with the Q-twisted H-conjugation action. The generic compatible invariant family and its relations are supplied by IHG.0; LP defines this prescribed-projection fibre.

**Hypotheses and conventions.**

- A is a commutative Z_l-algebra; Γ is arbitrary for this fibre. J⁰=H and J/H is the constant finite étale group Q, even when l divides |Q|.
- Use literal integral invariants O[J^n]^H. Coefficient change postcomposes evaluations and preserves the idempotent equations; it does not assert nonflat invariant base change.

**Direct prerequisites.** `LanglandsParameterStacks:LP2:excursion-presentation/universal-property-of-the-excursion-algebra`, `ReductiveGroupsPartII:RG2.5`, `mathlib:RingHom`, `IntegralHeckeAndGaloisDeterminants:IHG.0/reductive-pseudocharacter`.

**Construction or proof.**

1. Pull back the IHG pseudocharacter functor along the component projection J→Q and the fixed homomorphism η.
2. Finite component idempotents extend functions on the η-prescribed components by zero. The imported tuple relations restrict to exactly the twisted excursion relations.
3. A lift ρ:Γ→J(A) with πρ=η evaluates these idempotents correctly. Coefficient changes preserve η; group precomposition changes it to η∘f.

Source: [Julian Quast, Definition 3.1 and Lemma 3.5, pp.11–13](https://www.julianquast.de/files/Deformations_of_G-valued_Pseudocharacters.pdf). Generalized reductive pseudocharacters use J⁰-conjugation; the prescribed-Q fibre is the local component-idempotent specialization.

Source: [Laurent Fargues; Peter Scholze, VIII.3.7–VIII.3.8, pp.289–290](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf). The excursion relations impose the fixed finite action quotient rather than allowing an arbitrary component homomorphism.

**API.**

- `ProjectedPseudocharacter` (data): The fibre of IHG.0 J-pseudocharacters with all displayed component-idempotent evaluations.
- `ProjectedPseudocharacter.forget` (projection): Forget the fixed-projection equations to the imported J-pseudocharacter; the projection is injective.
- `ProjectedPseudocharacter.ofLift` (constructor): Evaluate a lift ρ:Γ→J(A) with πρ=η using the compatible invariant-coordinate evaluation from IHG.0.
- `ProjectedPseudocharacter.component_eval` (simp): Evaluation of e_q̄ on γ̄ is the indicator of η(γ̄)=q̄.
- `ProjectedPseudocharacter.map` (functoriality): An A→B coefficient algebra map preserves the prescribed η, with identity and composition laws.
- `ProjectedPseudocharacter.precomp` (functoriality): For f:Γ′→Γ precomposition has prescribed projection η∘f, with identity and composition laws.
- `ProjectedPseudocharacter.ext` (extensionality): Equality of the imported Θ families implies equality in this fibre.
- `ProjectedPseudocharacter.IsContinuous` (characterisation): Continuity is the imported continuity of all invariant tuple evaluations, with η carrying its prescribed finite topology.

**Uses.**

- `LanglandsParameterStacks:LP2:semisimple-characters/proof-of-the-character-bijection`: Fixes the Q-projection of the imported reconstructed J-homomorphism.
- `LanglandsParameterStacks:LP2:semisimple-characters/character-bijection`: Specializes η to the pinned Weil action without changing components.

**Unit tests.**

- `projected_rank_one` (computation): For Q=1 and H=G_m, a character χ has Θ_n(t₁^a₁⋯t_n^a_n)(γ̄)=∏χ(γ_i)^a_i.
- `projected_conjugate` (compatibility): H-conjugate lifts with the same η define the same fibre element.
- `projected_trivial_group` (degenerate): For Γ=1 its projection is the identity of Q; the trivial lift evaluates the identity component idempotent to 1 and other components to 0.
- `projected_wrong_component` (non-example): Over a nonzero coefficient ring, a lift with a different Γ→Q cannot belong to the η-fibre: a component idempotent has conflicting evaluations 0 and 1.
- `projected_unipotent` (non-example): For Q=1, H=SL₂ and Γ=Z, a nontrivial unipotent generator and the trivial representation have equal pseudocharacters, although the lifts are not conjugate.

**Acceptance.**

- For Q=1 and H=G_m, a character χ has Θ_n(t₁^a₁⋯t_n^a_n)(γ̄)=∏χ(γ_i)^a_i.
- H-conjugate lifts with the same η define the same fibre element.
- For Γ=1 its projection is the identity of Q; the trivial lift evaluates the identity component idempotent to 1 and other components to 0.
- Over a nonzero coefficient ring, a lift with a different Γ→Q cannot belong to the η-fibre: a component idempotent has conflicting evaluations 0 and 1.
- For Q=1, H=SL₂ and Γ=Z, a nontrivial unipotent generator and the trivial representation have equal pseudocharacters, although the lifts are not conjugate.

### Reconstruction with prescribed finite projection

Identifier: `LanglandsParameterStacks:LP2:semisimple-characters/proof-of-the-character-bijection`. Kind: theorem.

For finite Q acting on pinned H/Z_l, fixed η:Γ→Q and algebraically closed Z_l-field L, the η-fibre of J=H⋊Q pseudocharacters is in bijection with H(L)-gauge classes of semisimple crossed cocycles Γ→H(L) for the action induced by η. The bijection specializes IHG.1 reconstruction and preserves the prescribed Q-projection. Continuity is a separate local Weil assertion.

**Hypotheses and conventions.**

- Use J-complete reducibility and H=J⁰-conjugacy in the imported theorem. Component idempotents impose η at all characteristics; no good-π₁ or prime-to-|Q| hypothesis is added.

**Direct prerequisites.** `LanglandsParameterStacks:LP2:semisimple-characters/reductive-pseudocharacters`, `LanglandsParameterStacks:LP2:semisimple-characters/semisimple-parameters-and-closed-orbits`, `LanglandsParameterStacks:LP0/functoriality-of-cocycles`, `IntegralHeckeAndGaloisDeterminants:IHG.1/reductive-reconstruction`.

**Construction or proof.**

1. Apply IHG.1/reductive-reconstruction to the imported J-pseudocharacter over L; Quast Theorem 3.7 supplies the disconnected all-characteristic statement.
2. For each γ, the values of the one-variable component idempotents force πρ(γ)=η(γ). Extract the H-coordinate of ρ to obtain the crossed multiplication law.
3. H-conjugation of the lift is gauge of its H-coordinate. Conversely a crossed cocycle gives a lift with projection η and an element of the prescribed fibre.
4. Imported uniqueness and the LP0 section equivalence make these two constructions inverse. General finite anchors and the representation law are proved only by IHG.1.

Source: [Julian Quast, Theorem 3.7 and proof, pp.13–15](https://www.julianquast.de/files/Deformations_of_G-valued_Pseudocharacters.pdf). The imported generalized-reductive theorem applies to J=H⋊Q; component evaluations fix η.

Source: [Laurent Fargues; Peter Scholze, VIII.3.8 and proof, p.290](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf). The local semisimple parameter classification uses the prescribed-action version.

**Acceptance.**

- For Q=1 this is exactly the imported connected-group classification.
- For H=1, only the chosen η survives; allowing every Γ→Q would give the wrong parameter space.
- For split GL_r it retains multiplicities in the semisimplification; traces alone are insufficient in small characteristic.

### Relatively discrete Weil continuity

Identifier: `LanglandsParameterStacks:LP2:semisimple-characters/characteristic-zero-continuity`. Kind: theorem.

For the reconstructed semisimple lift W_E→H(L)⋊Q with prescribed finite action quotient and algebraically closed characteristic-zero Z_l-field L, condensed invariant evaluations in the relatively discrete coefficient convention imply that the lift is a condensed L-parameter. For L with a rank-one valuation topology this specializes to the usual continuous local Weil parameter. Only the compact inertia part needs the finite-coordinate continuity argument; the degree quotient is discrete.

**Hypotheses and conventions.**

- Use the finite-Q extension of the IHG characteristic-zero continuous-coordinate theorem as a requested input. Lafforgue Proposition 11.7 supplies the disconnected characteristic-zero anchor calculation; BHKT4.7(ii) alone is connected and profinite.
- The relatively discrete condensed extension is an additional finite-type coefficient statement (G4), not a conclusion inferred solely from rank-one valued continuity.

**Direct prerequisites.** `LanglandsParameterStacks:LP2:semisimple-characters/proof-of-the-character-bijection`, `LanglandsParameterStacks:LP0/condensed-cocycles-and-L-parameters`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-9-the-local-weil-group`, `IntegralHeckeAndGaloisDeterminants:IHG.1/reductive-valued-continuity`.

**Construction or proof.**

1. Import the characteristic-zero anchor coordinate-surjectivity calculation from the IHG continuity supplier, extended to J=H⋊Q with H-conjugation.
2. Apply that calculation to the fixed anchor with the last variable in compact inertia. Its finitely many coordinates are continuous functions of invariant evaluations.
3. For relatively discrete coefficients prove that these coordinate functions locally lie in finite-type Z_l-modules. This is the explicit unresolved coefficient step in G4.
4. Translate from inertia to its open Weil cosets using the crossed law and fixed Q-action. The discrete degree direction adds no compactness or finite-image assertion.

Source: [Vincent Lafforgue, Proposition 11.7, continuity argument, pp.146–147](https://arxiv.org/pdf/1209.5352). Finite-anchor coordinate surjectivity is characteristic zero; this node applies it to the compact inertia part of a Weil group.

Source: [Laurent Fargues; Peter Scholze, VIII.1.1 and VIII.3.8, pp.278,290](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf). The local classification uses relatively discrete condensed coefficients, a stronger coefficient requirement than an arbitrary valuation topology.

**Acceptance.**

- Infinite-image continuous inertia characters into Z_l-units are permitted in characteristic zero.
- A continuous unramified character may have infinite cyclic Frobenius image; the Weil group need not factor through a finite quotient.

### Discrete-coefficient Weil continuity

Identifier: `LanglandsParameterStacks:LP2:semisimple-characters/discrete-coefficient-continuity`. Kind: theorem.

Let L be an algebraically closed discrete Z_l-field and η:W_E→Q the continuous finite action quotient. A semisimple lift reconstructed from continuous invariant tuple evaluations has an open kernel on inertia and finite inertia image, and is continuous on W_E. In characteristic l this is exactly the relatively discrete coefficient convention. Its Frobenius image need not be finite.

**Hypotheses and conventions.**

- Use the generalized finite anchor from IHG.1 and finite generation of the actual integral tuple-invariant algebra. Do not replace nonflat integral invariants by fibre invariants.
- There is no good-π₁ or prime-to-|Q| condition. The component idempotents are included in the finite collection of invariant values.

**Direct prerequisites.** `LanglandsParameterStacks:LP2:semisimple-characters/proof-of-the-character-bijection`, `IntegralHeckeAndGaloisDeterminants:IHG.1/reductive-stable-tuple`, `IntegralHeckeAndGaloisDeterminants:IHG.1/reductive-one-entry-extension`, `LanglandsParameterStacks:LP2:excursion-presentation/quotients-over-fields-and-DVRs`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-9-the-local-weil-group`.

**Construction or proof.**

1. Import a generalized-reductive stable tuple and its unique appended-element characterization from IHG.1, including both maximal minimal-parabolic dimension and maximal component count before minimizing the centralizer.
2. Choose finitely many generators of the tuple-invariant algebra. Their evaluations with that anchor are locally constant near 1 on compact inertia.
3. On a common open inertia neighbourhood all generator values equal those at 1. The unique appended-element characterization forces the reconstructed lift to equal 1 there.
4. Its inertia kernel is therefore open and its inertia image finite. The homomorphism law transports continuity to each open inertia coset in W_E.

Source: [Gebhard Böckle; Michael Harris; Chandrashekhar Khare; Jack A. Thorne, Proposition 4.7(iii) and proof, pp.23–24](https://archive.intlpress.com/site/pub/files/_fulltext/journals/acta/2019/0223/0001/ACTA-2019-0223-0001-a001.pdf). Apply the finite-generator/open-kernel argument only to inertia; its generalized finite-anchor input is imported from IHG.

Source: [Julian Quast, Theorem 3.7, Claim A, pp.13–14](https://www.julianquast.de/files/Deformations_of_G-valued_Pseudocharacters.pdf). The unique appended-element characterization includes disconnected groups without a characteristic restriction.

**Acceptance.**

- For Q=1 and discrete L, the imported connected profinite theorem agrees on inertia.
- For H=G_m, an unramified character into a discrete algebraically closed characteristic-zero field may send geometric Frobenius to 2; it is continuous with infinite Weil image and trivial inertia image.

### Continuous semisimple parameter characters

Identifier: `LanglandsParameterStacks:LP2:semisimple-characters/character-bijection`. Kind: theorem.

For algebraically closed Z_l-field L there are canonical bijections between (i) semisimple condensed L-parameters up to H(L)-conjugation, (ii) L-points of the piecewise coarse parameter quotient, and (iii) condensed Θ families on W_E^n with the reindexing and ordered multiplication relations. All primes l≠p are allowed.

**Hypotheses and conventions.**

- Characteristic-zero continuity and discrete characteristic-l continuity are supplied separately. Unconditional coarse quotients are in excursion-presentation; no LP3 or integral good-prime theorem is a prerequisite.

**Direct prerequisites.** `LanglandsParameterStacks:LP2:excursion-presentation/parameter-closed-orbits`, `LanglandsParameterStacks:LP2:excursion-presentation/universal-homeomorphism`, `LanglandsParameterStacks:LP2:semisimple-characters/proof-of-the-character-bijection`, `LanglandsParameterStacks:LP2:semisimple-characters/characteristic-zero-continuity`, `LanglandsParameterStacks:LP2:semisimple-characters/discrete-coefficient-continuity`, `LanglandsParameterStacks:LP0/finite-wild-ramification`, `IntegralHeckeAndGaloisDeterminants:IHG.1/reductive-reconstruction`.

**Construction or proof.**

1. Import general reconstruction from IHG.1/reductive-reconstruction and specialise to H⋊Q with its prescribed W_E→Q projection using the component-idempotent construction in the preceding node.
2. Apply characteristic-zero relatively discrete continuity or discrete characteristic-l continuity as appropriate, and the LP0 dense Weil extension. These are additional topological assertions, not part of the abstract algebraic bijection.
3. The universal-homeomorphism comparison identifies coarse and excursion geometric points at all primes. No good-π₁ assumption or nonflat invariant-base-change isomorphism is used.

Source: [Laurent Fargues; Peter Scholze, VIII.3.8 and proof, p.290](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf). The passage states the object or result; the proof steps specify the reduction and conventions.

**Acceptance.**

- Both an algebraic closure of Q_l and F_l-bar satisfy the classification, with their respective continuity conventions.

### Group-algebra trace adapter

Identifier: `LanglandsParameterStacks:LP2:semisimple-characters/GL-trace-pseudocharacters`. Kind: construction.

For a group Γ and commutative coefficient ring A, specialize the imported IHG.0 r-dimensional A-linear pseudocharacter to R=A[Γ]. Restriction to the canonical group basis gives τ:Γ→A. Conversely τ extends uniquely by T(Σ a_γ[γ])=Σ a_γτ(γ). The normalization, centrality and signed cycle identity of IHG.0 correspond exactly to their group-basis forms, with fixed one-cycles included. This is an adapter of the imported carrier, not a second general definition or reconstruction theorem.

**Hypotheses and conventions.**

- A is any commutative ring and r≥0. This adapter makes no classification assertion in small characteristic.
- The alternating identity is multilinear in its r+1 arguments, so verification on group-basis elements extends to arbitrary finite linear combinations.

**Direct prerequisites.** `mathlib:MonoidAlgebra`, `mathlib:MonoidAlgebra.of`, `mathlib:Equiv.Perm.cycleFactorsFinset`, `IntegralHeckeAndGaloisDeterminants:IHG.0/pseudocharacter`.

**Construction or proof.**

1. Restrict the imported linear trace along MonoidAlgebra.of; normalization and centrality give the group formulas.
2. Extend a group function linearly on the monoid algebra basis. Expand products of finite sums for centrality, and use multilinearity of every signed cycle term for the alternating identity.
3. The two conversions are inverse by the monoid-algebra basis. The characteristic-zero excursion comparison uses IHG determinant/trace and reconstruction imports.

Source: [Vincent Lafforgue, Remark11.8, pp.143–144](https://arxiv.org/pdf/1209.5352). The passage states the object or result; the proof steps specify the reduction and conventions.

**API.**

- `GroupTraceAdapter.restrict` (projection): Restrict an imported IHG.0 linear pseudocharacter on A[Γ] to γ↦T([γ]).
- `GroupTraceAdapter.extend` (constructor): The unique A-linear extension of a normalized central group trace satisfying the signed cycle identity, with the imported algebra pseudocharacter axioms.
- `GroupTraceAdapter.equiv` (equivalence): Restriction and extension are inverse, by equality on every group-basis vector.
- `GroupTraceAdapter.cycleValue` (compatibility): The cycle term on basis inputs equals the group word-trace cycle term, including fixed points.
- `GroupTraceAdapter.ofRepresentation` (compatibility): Restriction of the imported representation trace equals γ↦tr(ρ(γ)).
- `GroupTraceAdapter.map` (functoriality): Coefficient change commutes with the two conversions and signed cycle terms.

**Uses.**

- `LanglandsParameterStacks:LP2:semisimple-characters/GL-trace-comparison`: Converts a group trace into the existing IHG A[Γ] pseudocharacter before importing classification.

**Unit tests.**

- `trace_rank_one` (computation): For r=1 the identity is τ(x)τ(y)=τ(xy), so normalised pseudocharacters are characters.
- `trace_zero_rank` (degenerate): For r=0 the one-variable alternating identity forces τ=0.
- `trace_semisimple_sum` (compatibility): The trace of a direct sum of characters is a trace pseudocharacter of the sum of their ranks.
- `trace_not_rank_one_constant` (non-example): The constant function 1 is not rank-two because τ(1) must be 2 in characteristic zero.
- `trace_linear_extension` (compatibility): For distinct γ,δ, extension satisfies T(2[γ]−[δ])=2τ(γ)−τ(δ); a multiplicative extension would fail this adapter.

**Acceptance.**

- For r=1 the identity is τ(x)τ(y)=τ(xy), so normalised pseudocharacters are characters.
- For r=0 the one-variable alternating identity forces τ=0.
- The trace of a direct sum of characters is a trace pseudocharacter of the sum of their ranks.
- The constant function 1 is not rank-two because τ(1) must be 2 in characteristic zero.
- For distinct γ,δ, extension satisfies T(2[γ]−[δ])=2τ(γ)−τ(δ); a multiplicative extension would fail this adapter.

### Trace and excursion character comparison

Identifier: `LanglandsParameterStacks:LP2:semisimple-characters/GL-trace-comparison`. Kind: theorem.

For algebraically closed characteristic-zero L, GL_r-pseudocharacters, r-dimensional trace pseudocharacters and conjugacy classes of semisimple representations Γ→GL_r(L) correspond. The invariant functions on tuples are generated by permutation cycle-trace functions (and inverse-determinant functions on GL_r); Cayley–Hamilton/Newton identities and group inverses express these using traces of words.

**Hypotheses and conventions.**

- Characteristic zero is essential for this stated trace classification. Higher invariant Θ data, not traces alone, give the arbitrary-characteristic reductive theorem.

**Direct prerequisites.** `LanglandsParameterStacks:LP2:semisimple-characters/GL-trace-pseudocharacters`, `LanglandsParameterStacks:LP2:semisimple-characters/proof-of-the-character-bijection`, `ReductiveGroupsPartII:RG2.5`, `IntegralHeckeAndGaloisDeterminants:IHG.0/determinant-trace-bijective-rational`, `IntegralHeckeAndGaloisDeterminants:IHG.1/algebraically-closed-reconstruction`.

**Construction or proof.**

1. Extend the group trace linearly to L[Γ] and import IHG.0/determinant-trace-bijective-rational, then IHG.1/algebraically-closed-reconstruction for the semisimple GL_r representation.
2. The connected GL_r instance of IHG reductive reconstruction matches the full invariant pseudocharacter. Compare with the excursion evaluation maps; the cycle-trace identity includes fixed one-cycles and inverse-determinant functions.
3. The group/excursion comparison is restricted to characteristic zero and uses the IHG owners. No local Taylor/Procesi or determinant reconstruction theorem is declared.

Source: [Vincent Lafforgue, Remark11.8 pp.143–144 (Procesi/Taylor inputs)](https://arxiv.org/pdf/1209.5352). The passage states the object or result; the proof steps specify the reduction and conventions.

**Acceptance.**

- For Γ=1 the unique semisimple rank-r representation has τ(1)=r.

### Parameters of Schur objects

Identifier: `LanglandsParameterStacks:LP2:semisimple-characters/schur-object-parameter`. Kind: theorem.

If L is algebraically closed and a categorical Hecke datum acts on C, every object X with π₀End_C(X)=L receives a unique semisimple cocycle Γ→H(L), up to H(L)-conjugation, whose invariant evaluations equal the excursion action on X.

**Hypotheses and conventions.**

- π₀End_C(X)=L is given as an L-algebra identification. This is for the discrete Γ datum; continuity requires the separately checked continuous consumer data. For an ordinary category this means its ordinary endomorphism algebra.

**Direct prerequisites.** `LanglandsParameterStacks:LP2:excursion-presentation/map-to-a-bernstein-center`, `LanglandsParameterStacks:LP2:semisimple-characters/proof-of-the-character-bijection`.

**Construction or proof.**

1. Evaluate the abstract centre map on X and compose with End_C(X)≃L.
2. Apply the universal excursion relations and semisimple reconstruction.

Source: [Laurent Fargues; Peter Scholze, VIII.4.3, p.293](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf). The passage states the object or result; the proof steps specify the reduction and conventions.

**Acceptance.**

- Do not infer continuity for W_E from an arbitrary discrete categorical datum.

## LP3 — LanglandsParameterStacks:LP3

The integral-representation Part II supplies highest-weight and good-filtration foundations. LP3 plans the specific FS VIII.5 t-structure, bar, unit-fibre, fixed-group, gerbe and wild-elimination applications. Quotient coordinate rings need finite good-filtration dimension; they are not assumed to inherit a good filtration. The derived unit-fibre proof uses the relative bar/IndCoh separated quotient and Borel flag argument before wild elimination.

**Coverage: planned.** Every original stage target is represented by a retained node, baseline/requested input or explicit existing-owner delegation. This is a complete target-level planning pass; no mathematical implementation is claimed.

Remaining obligations:

- Register the structural RG2.6 inputs; extend the accepted integral-representation Part II for highest weights/good filtrations; supply SF.4 normalisation/completion and the E5 enhanced bar/mapping categories. Reconcile accepted GIT routes under G6, then elaborate the missing signatures.

**Planets:** Good-filtration t-structures; Induced perfect complexes; Adjoint perfect generation; Prime-to-l fixed-group components; Donkin fixed subgroups; Integral Chevalley restriction.

### Good-filtration t-structures

Identifier: `LanglandsParameterStacks:LP3/good-filtration-t-structure`. Kind: construction.

Over algebraically closed L of characteristic l, for G with reductive identity G° and |π₀G| prime to l, IndPerf(BG) carries the good-filtration t-structure: connective M satisfy H^i(G°,M⊗∇_λ)=0 for i>0, coconnective M satisfy H^i(G°,M⊗Δ_λ)=0 for i<0 for all dominant λ. ∇_λ are induced/dual-Weyl modules and Δ_λ their Weyl counterparts. Degree-zero good-filtered modules are connective.

**Hypotheses and conventions.**

- Cohomological connective convention D^{≤0}; the t-structure is on IndPerf, not a claim that Perf is closed under truncation. General ∇,Δ, Kempf, Donkin criterion and tensor stability are RG2.6-extension requests.

**Direct prerequisites.** `ReductiveGroupsPartII:RG2.5`, `EnhancedDerivedSheaves:E5:abstract`, `EnhancedDerivedSheaves:E5:presentability`, `mathlib:CategoryTheory.Triangulated.TStructure`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-9-pinned-chevalleydemazure-group-schemes-over-ℤ`.

**Construction or proof.**

1. Import highest-weight modules and their duality/vanishing and construct the orthogonal classes as FS5.4.
2. Use generation by the highest-weight test objects to obtain truncations in the presentable Ind category; the finite component group allows passing between G and G°.

Source: [Laurent Fargues; Peter Scholze, VIII.5.1, Definition VIII.5.4, pp.294–295](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf). The passage states the object or result; the proof steps specify the reduction and conventions.

**API.**

- `goodFiltrationTStructure` (data): The t-structure on IndPerf(BG) with its connective convention.
- `goodFiltrationTStructure.connective_iff` (characterisation): Vanishing of H^i(G°,M⊗∇_λ) for all i>0 and λ.
- `goodFiltrationTStructure.coconnective_iff` (characterisation): Vanishing with Δ_λ for i<0.
- `goodFiltrationTStructure.tensorConnective` (relation): Tensor products of connective objects are connective under the imported Donkin–Mathieu tensor theorem.
- `goodFiltrationTStructure.homotopy` (compatibility): Its homotopy-category t-structure uses the baseline TStructure convention; this does not recover its infinity enhancement.

**Uses.**

- `LanglandsParameterStacks:LP3/equivariant-vector-bundles-and-Perf-ind`: The tensor-connectivity criterion.
- `LanglandsParameterStacks:LP3/fixed-points-of-prime-to-l-group-actions`: Finite-dimensional cohomology argument.

**Unit tests.**

- `good_torus` (computation): For a torus every rational module decomposes into weights, so the good-filtration t-structure is the usual cohomological one.
- `good_zero` (degenerate): The zero object is in both halves.
- `good_induced` (compatibility): A dual-Weyl module ∇_λ in degree zero is connective.
- `good_shift_sign` (non-example): For a nonzero torus representation V, V[−1] lies in positive cohomological degree and is not connective in the convention D^{≤0}.

**Acceptance.**

- For a torus every rational module decomposes into weights, so the good-filtration t-structure is the usual cohomological one.
- The zero object is in both halves.
- A dual-Weyl module ∇_λ in degree zero is connective.
- For a nonzero torus representation V, V[−1] lies in positive cohomological degree and is not connective in the convention D^{≤0}.

### Separatedness of good filtrations

Identifier: `LanglandsParameterStacks:LP3/good-filtration-separatedness-and-OG`. Kind: theorem.

The good-filtration t-structure on IndPerf(BG) is separated: an infinitely connective object and an infinitely coconnective object are zero. The induced test modules detect zero.

**Hypotheses and conventions.**

- G° reductive and |π₀G| prime to l; use the Ind category.

**Direct prerequisites.** `LanglandsParameterStacks:LP3/good-filtration-t-structure`, `ReductiveGroupsPartII:RG2.5`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-9-pinned-chevalleydemazure-group-schemes-over-ℤ`.

**Construction or proof.**

1. For infinite connectivity all H^i(G°,M⊗∇_λ) vanish, so M has no maps from the corresponding dual tests.
2. Highest-weight generation detects M=0; dual testing gives the other half.
3. This separatedness justifies later increasing-connectivity bar-cone arguments; it is not merely an assertion of finite amplitude.

Source: [Laurent Fargues; Peter Scholze, VIII.5.5 and proof, p.295](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf). The passage states the object or result; the proof steps specify the reduction and conventions.

**Acceptance.**

- A complex cannot be discarded just because its ordinary underlying module forgetful image vanishes in an Ind quotient; use the actual test detection.

### Good filtrations of free cocycle algebras

Identifier: `LanglandsParameterStacks:LP3/free-cocycle-good-filtration`. Kind: theorem.

For every action F_n→Aut(G), O(Z¹(F_n,G)) with twisted diagonal G°-conjugation has a good G°-filtration. Hence its higher rational G°-cohomology vanishes; for prime-to-l π₀G the corresponding G-cohomology also vanishes.

**Hypotheses and conventions.**

- G° reductive; π₀G prime to l for the final G assertion. Generic good filtration of O(G) as a G°×G°-module is imported from RG.

**Direct prerequisites.** `LanglandsParameterStacks:LP1/finite-presentation-over-Z-invert-p`, `LanglandsParameterStacks:LP3/good-filtration-t-structure`, `ReductiveGroupsPartII:RG2.5`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-9-pinned-chevalleydemazure-group-schemes-over-ℤ`.

**Construction or proof.**

1. Identify the free cocycle space with G^n. Each twisted conjugation restriction of O(G) preserves the imported good-filtration structure.
2. Apply Donkin–Mathieu tensor stability to the n factors and the Donkin vanishing criterion.
3. Use exact finite-component invariants for the final assertion.

Source: [Laurent Fargues; Peter Scholze, VIII.5.6–VIII.5.7, p.296](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf). The passage states the object or result; the proof steps specify the reduction and conventions.

**Acceptance.**

- For F₀ the algebra is L with the trivial good filtration.

### Perfect complexes generated from the classifying stack

Identifier: `LanglandsParameterStacks:LP3/induced-perfect-complexes`. Kind: definition.

For X=Spec A with algebraic G-action define Perf^ind(X/G) as the smallest stable idempotent-complete full subcategory of Perf(X/G) containing pullbacks of Perf(BG), closed under shifts, cones and retracts. Its Ind-completion maps to Mod_A(IndPerf(BG)); equality with all Perf is a theorem under additional hypotheses, not a definition.

**Hypotheses and conventions.**

- A can be a derived finite-type algebra as required by the derived-unit-fibre theorem. Perfectness and pullback are imported from S.1/E5.

**Direct prerequisites.** `SchemeKTheoryOperations:S.1`, `EnhancedDerivedSheaves:E5:abstract`, `EnhancedDerivedSheaves:E5:presentability`, `EnhancedDerivedSheaves:E5:animation`, `mathlib:CategoryTheory.Idempotents.Karoubi`.

**Construction or proof.**

1. Use the general stable/idempotent closure construction on the image of pullback.
2. Extend to the Ind category; on bounded induced perfect objects the algebra module comparison is fully faithful.

Source: [Laurent Fargues; Peter Scholze, VIII.5.2, pp.296–297](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf). The passage states the object or result; the proof steps specify the reduction and conventions.

**API.**

- `InducedPerfectComplexes` (data): Stable retract closure of the image of Perf(BG).
- `InducedPerfectComplexes.pullback` (constructor): Any classifying-stack perfect complex yields an induced one.
- `InducedPerfectComplexes.retract` (structure): Closed under shifts, cones and retracts.
- `InducedPerfectComplexes.moduleFunctor` (functoriality): The fully faithful comparison on the induced Ind subcategory to A-modules in IndPerf(BG).
- `InducedPerfectComplexes.minimal` (universal-property): Every stable idempotent-complete subcategory containing the pullbacks contains Perf^ind.

**Uses.**

- `LanglandsParameterStacks:LP3/bar-criterion`: The bar test for membership.
- `LanglandsParameterStacks:LP4/generation-and-module-comparison`: Generation of all parameter perfect complexes.

**Unit tests.**

- `induced_point` (degenerate): For X=Spec L, Perf^ind(BG)=Perf(BG).
- `induced_trivial_group` (computation): For G=1, finite-cell A-complexes and their retracts give all Perf(A).
- `induced_retract` (characterisation): A direct summand of an induced finite complex lies in Perf^ind.
- `induced_not_all_bad_prime` (non-example): For X=G with conjugation and l dividing |π₁(G°)_tors|, the unit skyscraper fails to be induced by VIII.5.11.

**Acceptance.**

- For X=Spec L, Perf^ind(BG)=Perf(BG).
- For G=1, finite-cell A-complexes and their retracts give all Perf(A).
- A direct summand of an induced finite complex lies in Perf^ind.
- For X=G with conjugation and l dividing |π₁(G°)_tors|, the unit skyscraper fails to be induced by VIII.5.11.

### The induced-perfect bar criterion

Identifier: `LanglandsParameterStacks:LP3/bar-criterion`. Kind: theorem.

For M∈Perf(X/G), M lies in Perf^ind iff the canonical bar map colim[…→M⊗_L A⊗_L M^∨→M⊗_L M^∨]→M⊗_A M^∨ is an isomorphism in IndPerf(BG). All tensor products on the left and its geometric realisation are formed in IndPerf(BG).

**Hypotheses and conventions.**

- X affine finite type, G° reductive, π₀G prime to l in the surrounding setting; M dualisable.

**Direct prerequisites.** `LanglandsParameterStacks:LP3/induced-perfect-complexes`, `ReductiveGroupsPartII:RG2.5`, `EnhancedDerivedSheaves:E5:presentability`, `SchemeKTheoryOperations:S.1`, `tauceti:TauCetiRoadmap/DGAInfinity#layer-8-hochschild-cochains-deformations-massey-products-and-formality`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-9-pinned-chevalleydemazure-group-schemes-over-ℤ`.

**Construction or proof.**

1. For induced objects the bar construction has extra degeneracies after the correct comparison, and extends over finite cones/retracts.
2. Conversely the isomorphism makes the module object M compact, using compactness of the unit and duality; it becomes a retract of a finite induced complex.
3. For a Borel B⊂G° use Kempf full faithfulness Perf(BG°)→Perf(BB) and conservative finite-component restriction to test the criterion there (VIII.5.9).

Source: [Laurent Fargues; Peter Scholze, VIII.5.8–VIII.5.9, pp.296–297](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf). The passage states the object or result; the proof steps specify the reduction and conventions.

**Acceptance.**

- For M=A the standard augmented bar map is an isomorphism.

### Tensor-connectivity criterion for induced perfectness

Identifier: `LanglandsParameterStacks:LP3/equivariant-vector-bundles-and-Perf-ind`. Kind: theorem.

Assume A has a good G°-filtration and M∈Perf(X/G) is connective in the good-filtration t-structure after forgetting its A-action. Then M∈Perf^ind iff for every similarly connective N∈Perf(X/G), M⊗_A N remains connective.

**Hypotheses and conventions.**

- G° reductive, π₀G prime to l. Finite good-filtration dimension of coherent modules is an explicit supplier input.

**Direct prerequisites.** `LanglandsParameterStacks:LP3/good-filtration-t-structure`, `LanglandsParameterStacks:LP3/good-filtration-separatedness-and-OG`, `LanglandsParameterStacks:LP3/bar-criterion`, `ReductiveGroupsPartII:RG2.5`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-9-pinned-chevalleydemazure-group-schemes-over-ℤ`.

**Construction or proof.**

1. For induced M the tensor product is the bar realisation of connective terms, hence connective.
2. For the converse, approximate the dual bar resolution by finite colimits with increasingly connective cones, using finite good-filtration dimension.
3. Tensor by M and apply separatedness to recover the bar criterion.

Source: [Laurent Fargues; Peter Scholze, VIII.5.10 and proof, p.297](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf). The passage states the object or result; the proof steps specify the reduction and conventions.

**Acceptance.**

- The criterion includes the connectivity hypothesis on M itself.

### Adjoint perfect generation and its prime restriction

Identifier: `LanglandsParameterStacks:LP3/adjoint-unit-generation`. Kind: theorem.

For G acting on itself by conjugation, let i:Spec L→G be the unit. With G° reductive and π₀G prime to l, the following are equivalent: l∤|π₁(G°)_tors|; i_*L∈Perf^ind(G/G); Perf^ind(G/G)=Perf(G/G).

**Hypotheses and conventions.**

- L algebraically closed of characteristic l; do not drop the π₁ restriction from integral generation.

**Direct prerequisites.** `LanglandsParameterStacks:LP3/equivariant-vector-bundles-and-Perf-ind`, `LanglandsParameterStacks:LP3/bar-criterion`, `ReductiveGroupsPartII:RG2.5`, `SchemeKTheoryOperations:S.1`, `SchemeAndStackFoundations:SF.1`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-9-pinned-chevalleydemazure-group-schemes-over-ℤ`.

**Construction or proof.**

1. For sufficiency reduce via prime-to-l central covers to simply connected derived group; build a Borel-equivariant Cartier/Bruhat flag whose divisor line bundles come from B-characters, then apply the Borel bar criterion.
2. The diagonal kernel is pulled back from the unit along (g,g′)↦gg′⁻¹; generation of the unit forces the identity functor to factor through the induced subcategory.
3. For necessity a central cover with l-primary kernel would force invariant functions on that kernel to be surjected by conjugation invariants; their constancy on the unipotent kernel contradicts this, using the tensor criterion.

Source: [Laurent Fargues; Peter Scholze, VIII.5.11 and proof, pp.297–299](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf). The passage states the object or result; the proof steps specify the reduction and conventions.

**Acceptance.**

- For a torus π₁ has no torsion and the unit is induced-perfect.
- For PGL_l the fundamental-group l-torsion excludes the generation conclusion.

### Twisted free-group perfect generation

Identifier: `LanglandsParameterStacks:LP3/twisted-free-generation`. Kind: theorem.

If G° is reductive and the orders of π₀G and π₁(G°)_tors are prime to l, then for any action F_n→Aut(G), Perf(Z¹(F_n,G)/G) is generated under cones and retracts by Perf(BG).

**Hypotheses and conventions.**

- Twisted conjugation, not just the untwisted diagonal action.

**Direct prerequisites.** `LanglandsParameterStacks:LP3/adjoint-unit-generation`, `LanglandsParameterStacks:LP1/finite-presentation-over-Z-invert-p`, `SchemeKTheoryOperations:S.1`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-9-pinned-chevalleydemazure-group-schemes-over-ℤ`.

**Construction or proof.**

1. Express the diagonal kernel on the twisted G^n quotient as a pullback of the adjoint unit kernel.
2. Apply adjoint-unit generation to the kernel and its integral transforms; the induced subcategory then contains the identity image of every perfect object.

Source: [Laurent Fargues; Peter Scholze, VIII.5.12 and proof, p.299](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf). The passage states the object or result; the proof steps specify the reduction and conventions.

**Acceptance.**

- For F₀ this reduces to Perf(BG) itself.

### Derived unit fibres and generation

Identifier: `LanglandsParameterStacks:LP3/derived-unit-fibre`. Kind: theorem.

For a G-equivariant map X̃→G with conjugation action on G, put X=X̃×^R_G Spec L at the unit and Ã=O(X̃), A=O(X). If G° is reductive and π₀G, π₁(G°)_tors have prime-to-l orders, then L⊗_{O(G)}Ã→A is an isomorphism in IndPerf(BG). If additionally Perf(X̃/G)=Perf^ind and Ã is connective for the good-filtration t-structure, then A is connective and Perf(X/G)=Perf^ind.

**Hypotheses and conventions.**

- Tensor product is in IndPerf(BG), and X may be derived. The statement does not assume the derived fibre is already classical.

**Direct prerequisites.** `LanglandsParameterStacks:LP3/adjoint-unit-generation`, `LanglandsParameterStacks:LP3/bar-criterion`, `LanglandsParameterStacks:LP3/good-filtration-separatedness-and-OG`, `ReductiveGroupsPartII:RG2.5`, `EnhancedDerivedSheaves:E5:animation`, `EnhancedDerivedSheaves:E5:presentability`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-9-pinned-chevalleydemazure-group-schemes-over-ℤ`.

**Construction or proof.**

1. Adjoint-unit generation identifies the tensor in IndPerf(BG) with the geometric derived fibre. The formula implies connectivity when Ã is connective.
2. For M∈Perf(X/G), express the cone of the relative bar comparison as a sequential colimit of M⊗_A g* K_n⊗_A M*, with K_n coherent on the derived unit self-intersection */G×_G */G. Their images vanish after forgetting the self-intersection action because the bar construction then has extra degeneracies.
3. Give IndCoh of this self-intersection the t-structure generated by the diagonal image of good-filtration-connective objects, and pass to its separated quotient. Finite good-filtration dimension bounds the t-amplitude of K↦M⊗_A g*K⊗_A M*, so it descends to that quotient.
4. Prove the forgetful functor on the separated quotient conservative using central-cover reduction and the Borel-invariant Cartier flag from the adjoint-unit proof: its successive derived intersections admit line-bundle resolutions. The colimit of K_n is therefore zero. The bar criterion gives Perf(X/G)=Perf^ind. These are the VIII.5.13 arguments, not an assumption that the geometric fibre is classical.

Source: [Laurent Fargues; Peter Scholze, VIII.5.13 and proof, pp.299–301](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf). The passage states the object or result; the proof steps specify the reduction and conventions.

**Acceptance.**

- For X̃=G and the identity map the fibre is the unit and the formula is tautological.

### Surface and tame relation fibres

Identifier: `LanglandsParameterStacks:LP3/surface-and-tame-relations`. Kind: comparison.

The derived character stack of a compact oriented surface with relation ∏[a_i,b_i]=1 and the tame Weil parameter stack with relation σ⁻¹τσ=τ^q are unit fibres of equivariant maps G^{2g}→G and G²→G respectively. Under the good π₁ and component hypotheses their coordinate algebras are connective and their Perf categories are generated from BG. The surface comparison is an application of the same mechanism; no new surface roadmap is created here.

**Hypotheses and conventions.**

- L algebraically closed characteristic l; integral lifting is a separate step. Tame semidirect twisting is included when the finite action is nontrivial.

**Direct prerequisites.** `LanglandsParameterStacks:LP3/free-cocycle-good-filtration`, `LanglandsParameterStacks:LP3/twisted-free-generation`, `LanglandsParameterStacks:LP3/derived-unit-fibre`, `LanglandsParameterStacks:LP0/discretization-and-unique-extension`.

**Construction or proof.**

1. Use the free cocycle algebra good filtration and twisted free generation for the source.
2. Apply the derived-unit-fibre theorem to the surface relation word or tame relation σ⁻¹τσ τ^{-q}. The tame dense group is Z[1/p]⋊Z with the prescribed finite quotient action. The later wild-gerbe elimination theorem handles the full finite-wild piece; no wild passage is needed for this tame unit-fibre argument.

Source: [Laurent Fargues; Peter Scholze, End VIII.5.2, p.301, and tame reduction p.312](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf). The passage states the object or result; the proof steps specify the reduction and conventions.

**Acceptance.**

- For genus one the relation is the commuting-pair fibre.
- The tame relation uses geometric Frobenius in the displayed form.

### Prime-to-l components of fixed groups

Identifier: `LanglandsParameterStacks:LP3/fixed-points-of-prime-to-l-group-actions`. Kind: theorem.

Let L be algebraically closed of characteristic l, G smooth affine with G° reductive and π₀G of order prime to l, and P finite of order prime to l acting on G. For H=G^P, the order of π₀H is prime to l. Smoothness and reductivity of H° are imported from the RG2.6 fixed-point request; this LP3 theorem owns only the component-order assertion.

**Hypotheses and conventions.**

- No solvability assumption for this component theorem; all group orders are prime to l as specified.

**Direct prerequisites.** `ReductiveGroupsPartII:RG2.5`, `LanglandsParameterStacks:LP3/free-cocycle-good-filtration`, `LanglandsParameterStacks:LP3/good-filtration-t-structure`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-9-pinned-chevalleydemazure-group-schemes-over-ℤ`.

**Construction or proof.**

1. Reduce to connected G. Embed G/H as the closed orbit of the identity in the product of Θ-twisted copies of G indexed by nonidentity Θ∈P. The AMBIENT coordinate algebra has a good G-filtration; no good filtration of its quotient O(G/H) is assumed.
2. Apply TvdK finite good-filtration dimension to equivariant coherent modules on that ambient affine scheme. If π₀H has l-torsion, choose H′ containing H° with π₀H′=C_l. The finite cover G/H′→G/H makes O(G/H′) such a coherent module, so its rational G-cohomology vanishes in sufficiently high degrees.
3. Shapiro and reductivity of H° identify RΓ(G,O(G/H′)) with RΓ(H′,L) and then RΓ(C_l,L). The latter is nonzero in arbitrarily high degrees, a contradiction. Return to disconnected G using the prime-to-l component hypothesis.

Source: [Laurent Fargues; Peter Scholze, VIII.5.14 and proof, pp.301–302](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf). The passage states the object or result; the proof steps specify the reduction and conventions.

**Acceptance.**

- P=1 gives π₀H=π₀G.
- LP1 obtains reductivity directly from RG, never through this LP3 theorem.

### Cyclic fixed-locus resolutions

Identifier: `LanglandsParameterStacks:LP3/cyclic-fixed-locus-resolution`. Kind: theorem.

Let Θ have prime order r≠l on G with G° reductive and π₀G prime to l. Put X={(g₀,…,g_{r−1}):g₀Θ(g₁)⋯Θ^{r−1}(g_{r−1})=1}, with G twisted conjugation and C_r cyclic permutation. For the augmented cosimplicial G-space X^{C_r}→X⇒∏_{C_r}X→…, the coordinate-algebra realisation is O(X^{C_r}) in IndPerf(BG).

**Hypotheses and conventions.**

- No π₁ good-prime assumption. Formal completions and pro-objects are used in the proof; their algebraic exactness is an explicit E5/SF.4 input.

**Direct prerequisites.** `LanglandsParameterStacks:LP3/free-cocycle-good-filtration`, `EnhancedDerivedSheaves:E5:presentability`, `SchemeAndStackFoundations:SF.4`, `ReductiveGroupsPartII:RG2.5`, `tauceti:TauCeti.fixedSubgroup`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-9-pinned-chevalleydemazure-group-schemes-over-ℤ`.

**Construction or proof.**

1. Complete the cosimplicial terms along the common fixed locus; the induced colimit is unchanged.
2. The formal-unit rth-root map exists because r is invertible, and constructs a (G,C_r)-equivariant retraction of the completion onto X^{C_r}, providing an extra degeneracy.
3. Use exactness in the Ind–Pro representation enlargement and a faithful GL embedding when needed; this is not averaging without a resolution.

Source: [Laurent Fargues; Peter Scholze, VIII.5.16 and proof, pp.304–307](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf). The passage states the object or result; the proof steps specify the reduction and conventions.

**Acceptance.**

- r must be prime to l for the formal rth-root construction.

### Solvable fixed groups as Donkin subgroups

Identifier: `LanglandsParameterStacks:LP3/donkin-subgroup-and-generation`. Kind: theorem.

If P is finite solvable of order prime to l acting on G with G° reductive and π₀G prime to l, then H°=(G^P)° is a Donkin subgroup of G°: restriction of a good G°-filtered representation has a good H°-filtration. Equivalently induction of a good H°-filtered representation has a good G°-filtration.

**Hypotheses and conventions.**

- The theorem is not asserted for arbitrary P. No π₁ condition is imposed.

**Direct prerequisites.** `LanglandsParameterStacks:LP3/fixed-points-of-prime-to-l-group-actions`, `LanglandsParameterStacks:LP3/cyclic-fixed-locus-resolution`, `ReductiveGroupsPartII:RG2.5`, `LanglandsParameterStacks:LP3/good-filtration-t-structure`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-9-pinned-chevalleydemazure-group-schemes-over-ℤ`.

**Construction or proof.**

1. Reduce through a solvable normal series to a cyclic prime-order automorphism and reduce the simple-group factors and central covers carefully.
2. For permutation actions the fixed identity subgroup is diagonal and tensor stability applies; for simple inner/outer actions use the explicit root/highest-weight calculations in VIII.5.15.
3. The cyclic fixed-locus resolution gives the good filtration of O(G/H); the highest-weight cohomological criterion gives Donkin restriction/induction.

Source: [Laurent Fargues; Peter Scholze, VIII.5.15 and proof, pp.302–304](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf). The passage states the object or result; the proof steps specify the reduction and conventions.

**Acceptance.**

- For a factor-permuting cyclic group on K^r, the diagonal K is Donkin by tensor stability.

### Fixed-group induction and good counit kernels

Identifier: `LanglandsParameterStacks:LP3/fixed-induction-and-counit`. Kind: theorem.

In the solvable prime-to-l fixed-group setting H=G^P, a representation W of H° has good H°-filtration iff Ind_{H°}^{G°}W has good G°-filtration, and a representation of H has good H°-filtration iff Ind_H^G W has good G°-filtration. For good W the respective restriction–induction counit kernels also have good H°-filtrations.

**Hypotheses and conventions.**

- Induction here is algebraic rational induction, not compact induction of locally profinite groups. The finite component groups are prime to l.

**Direct prerequisites.** `LanglandsParameterStacks:LP3/donkin-subgroup-and-generation`, `LanglandsParameterStacks:LP3/good-filtration-separatedness-and-OG`, `ReductiveGroupsPartII:RG2.5`, `EnhancedDerivedSheaves:E5:presentability`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-9-pinned-chevalleydemazure-group-schemes-over-ℤ`.

**Construction or proof.**

1. Follow VIII.5.17: relate induction detection, good counit kernels and restriction generation by the augmented induction–restriction bar resolution. Donkin restriction and good-filtration separatedness make the implications valid; generation is an equivalent auxiliary condition in this proof, not an imported LP3/fixed-restriction-generation theorem.
2. Reduce by induction on solvable P to prime cyclic P. For connected simply connected G, the explicit highest-weight surjections constructed in VIII.5.15 prove restriction generation; this establishes the equivalent detection and kernel conditions without a dependency cycle.
3. For a central simply connected cover, take the summand with trivial kernel character to descend the good counit-kernel condition. For general G, use its derived group and the linearly reductive quotient (torus identity and prime-to-l components); split the relevant induced representations as retracts. This preserves the actual centre, including non-smooth diagonalizable central kernels, rather than assuming an etale cover.
4. The identity-group and full-group cases then follow by the prime-to-l component splitting, as in VIII.5.17. The next node uses these established good kernels to build its separated resolution.

Source: [Laurent Fargues; Peter Scholze, VIII.5.17(i)–(iv) and proof, pp.307–310](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf). The passage states the object or result; the proof steps specify the reduction and conventions.

**Acceptance.**

- For P=1 induction and counit are identity and their kernels are zero.

### Generation by restriction to fixed groups

Identifier: `LanglandsParameterStacks:LP3/fixed-restriction-generation`. Kind: theorem.

In the same solvable prime-to-l setting, Perf(BH°) is generated under cones and retracts by restrictions from Perf(BG°), and Perf(BH) is generated by restrictions from Perf(BG). No π₁ good-prime hypothesis is added.

**Hypotheses and conventions.**

- Both identity and full group statements are required; the central quotient can affect the full-group statement.

**Direct prerequisites.** `LanglandsParameterStacks:LP3/fixed-induction-and-counit`, `LanglandsParameterStacks:LP3/good-filtration-separatedness-and-OG`, `ReductiveGroupsPartII:RG2.5`, `EnhancedDerivedSheaves:E5:presentability`, `SchemeKTheoryOperations:S.1`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-9-pinned-chevalleydemazure-group-schemes-over-ℤ`.

**Construction or proof.**

1. The successive restriction–induction counit resolution is split after induction. Good-filtration kernels and separatedness give its convergence in IndPerf.
2. Conservativity of induction supplies generation; compactness cuts the resolution down to finite cones and retracts.
3. Use simply connected central covers and diagonalizable kernel character decompositions, rather than assume that centres do not matter.

Source: [Laurent Fargues; Peter Scholze, VIII.5.17(v)–(vi), pp.307–310](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf). The passage states the object or result; the proof steps specify the reduction and conventions.

**Acceptance.**

- For P=1 restriction generates tautologically.

### The central-character fixed-group counterexample

Identifier: `LanglandsParameterStacks:LP3/bad-prime-fixed-counterexample`. Kind: comparison.

In characteristic2, for G=(SL₂×SL₂)/μ₂ with factor-swap P=C₂, the fixed group is H=PGL₂×(μ₂×μ₂)/μ₂. The nontrivial central character of H is not generated by restrictions of Perf(BG) under cones and retracts. Thus prime-to-l cannot be replaced by preserving a Borel, torus or pinning.

**Hypotheses and conventions.**

- This is a counterexample outside the order hypothesis, not a claim contradicting the preceding theorem.

**Direct prerequisites.** `ReductiveGroupsPartII:RG2.5`, `EnhancedDerivedSheaves:E5:abstract`, `EnhancedDerivedSheaves:E5:presentability`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-9-pinned-chevalleydemazure-group-schemes-over-ℤ`.

**Construction or proof.**

1. For the nontrivial central-character summand of a restricted perfect G-object, homotopy C₂-invariants in PGL₂ remain perfect.
2. This property is stable under cones and retracts, but fails for the nontrivial central character itself. Keep the full centre, not just the identity component, in the calculation.

Source: [Laurent Fargues; Peter Scholze, VIII.5.18, p.308](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf). The passage states the object or result; the proof steps specify the reduction and conventions.

**Acceptance.**

- The acting group order equals l here; the good theorem does not apply.

### Fundamental groups of solvable fixed groups

Identifier: `LanglandsParameterStacks:LP3/fixed-fundamental-group`. Kind: theorem.

If G° is reductive, P is finite solvable of order prime to l and l∤|π₁(G°)_tors|, then l∤|π₁((G^P)°)_tors|.

**Hypotheses and conventions.**

- The smooth fixed identity group is supplied by RG. This is distinct from π₀(G^P) having prime-to-l order.

**Direct prerequisites.** `ReductiveGroupsPartII:RG2.5`, `LanglandsParameterStacks:LP3/fixed-points-of-prime-to-l-group-actions`.

**Construction or proof.**

1. Reduce to prime-order actions via the solvable series and to the simply connected simple derived factors by prime-to-l central isogenies.
2. Permutation and outer actions preserve the required prime property. For inner actions use the root-subsystem list in VIII.5.19 and track the image of the centre, including exceptional types.
3. Descend central covers, noting that any new offending prime is the acting prime, already distinct from l.

Source: [Laurent Fargues; Peter Scholze, VIII.5.19 and proof, pp.310–311](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf). The passage states the object or result; the proof steps specify the reduction and conventions.

**Acceptance.**

- A cyclic diagonal fixed group in G^r has the same π₁ torsion as G.
- Do not infer this from the component-group assertion alone.

### Sifted parameter mapping approximations

Identifier: `LanglandsParameterStacks:LP3/mapping-approximation`. Kind: construction.

For a gerbe 𝒢 over BΓ with fibres a finite union of BG for groups with reductive identity, define Perf(Map^Σ_{BΓ}(S,𝒢)) as the sifted-colimit-preserving left Kan extension of Perf(Map_{BΓ}(S,𝒢)) from finite sets equipped with Γ-torsors (equivalently finite discrete anima over BΓ). The base set is finite; a principal Γ-torsor itself may be infinite when Γ is infinite. Extend to anima over BΓ. This denotes a category, not an assertion that a new representing stack exists. Use its Ind-completion and canonical comparison to actual mapping stacks. The same definition over BQ and a coefficient DVR supplies the integral categorical universal property.

**Hypotheses and conventions.**

- Generic left Kan extension, anima, linear stable categories and compact objects are imported from E5. Only parameter/gerbe instances are planned here.
- ES3 owns the Chapter X categorical universal property and colimit/free-group theorems; it should reuse this VIII.5 definition rather than construct another Map^Σ carrier.

**Direct prerequisites.** `EnhancedDerivedSheaves:E5:abstract`, `EnhancedDerivedSheaves:E5:presentability`, `EnhancedDerivedSheaves:E5:animation`, `SchemeKTheoryOperations:S.1`, `ReductiveGroupsPartII:RG2.5`.

**Construction or proof.**

1. Restrict actual Perf mapping categories to finite sets equipped with Γ-torsors and left Kan extend in the specified linear category universe.
2. Use the universal property to obtain the comparison and its naturality. Ind extends the compact linear-category diagram.

Source: [Laurent Fargues; Peter Scholze, VIII.5.4 pp.311–312; X.3 setup pp.348–349](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf). The passage states the object or result; the proof steps specify the reduction and conventions.

**API.**

- `ParameterMappingApproximation` (data): The left Kan extension category denoted Perf(Map^Σ).
- `ParameterMappingApproximation.compare` (projection): Natural comparison to the actual Perf mapping category.
- `ParameterMappingApproximation.finiteTorsor` (compatibility): It agrees with the defining Perf category on finite sets with Γ-torsors.
- `ParameterMappingApproximation.leftKan` (universal-property): Restriction to finite sets with Γ-torsors classifies sifted-colimit-preserving extensions.
- `ParameterMappingApproximation.ind` (functoriality): Ind-completion of the compact category diagram.

**Uses.**

- `LanglandsParameterStacks:LP3/free-gerbe-comparison`: Free-group comparison for wild reduction.
- `ExcursionOperatorsAndSpectralAction:ES3/integral-universal-action`: Integral universal property without falsely replacing the approximation.

**Unit tests.**

- `approx_point` (degenerate): On a one-point base equipped with its Γ-torsor (whose total set can be infinite), the category equals Perf of the gerbe fibre.
- `approx_coproduct` (characterisation): A finite disjoint union of bases equipped with Γ-torsors maps to the tensor product of their linear Perf categories.
- `approx_bad_prime` (non-example): Over F_l-bar with G=PGL_l and Γ=Z, the free-group approximation has induced-perfect image and excludes the unit skyscraper in Perf(G/G); it is not the actual mapping category.

**Acceptance.**

- On a one-point base equipped with its Γ-torsor (whose total set can be infinite), the category equals Perf of the gerbe fibre.
- A finite disjoint union of bases equipped with Γ-torsors maps to the tensor product of their linear Perf categories.
- Over F_l-bar with G=PGL_l and Γ=Z, the free-group approximation has induced-perfect image and excludes the unit skyscraper in Perf(G/G); it is not the actual mapping category.

### Free-group gerbe comparisons

Identifier: `LanglandsParameterStacks:LP3/free-gerbe-comparison`. Kind: theorem.

For a gerbe 𝒢 over BΓ banded by G with G° reductive and π₀G prime to l, the comparison IndPerf(Map^Σ_{BΓ}(BF_n,𝒢))→IndPerf(Map_{BΓ}(BF_n,𝒢)) is fully faithful, with image generated by IndPerf(BG). For a connected gerbe and extension E_G→Γ its source is modules over O(∏π⁻¹(γ_i)) in IndPerf(BG). It is an equivalence if π₁(G°)_tors has prime-to-l order; finite unions of gerbes satisfy the analogous statement.

**Hypotheses and conventions.**

- L algebraically closed characteristic l; γ_i are the generator images in Γ.

**Direct prerequisites.** `LanglandsParameterStacks:LP3/mapping-approximation`, `LanglandsParameterStacks:LP3/twisted-free-generation`, `LanglandsParameterStacks:LP3/induced-perfect-complexes`, `EnhancedDerivedSheaves:E5:presentability`, `ReductiveGroupsPartII:RG2.5`.

**Construction or proof.**

1. Write the circle as the pushout of point←two points→point and use Barr–Beck for the G-torsor.
2. Base change the module categories and take products for n generators.
3. Apply twisted-free-generation for equivalence at good primes; without it retain just full faithfulness and the induced essential image.

Source: [Laurent Fargues; Peter Scholze, VIII.5.20 and proof, p.312](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf). The passage states the object or result; the proof steps specify the reduction and conventions.

**Acceptance.**

- For F₀ the module algebra is the base and the comparison is identity.

### Solvable wild gerbe elimination

Identifier: `LanglandsParameterStacks:LP3/wild-gerbe-elimination`. Kind: theorem.

For finite solvable normal P⊂Γ of order prime to l, and a stack 𝒢 over BΓ with fibre a finite union of BG with G° reductive and π₀G prime to l, its pushforward along BΓ→B(Γ/P) has fibre Map_{BΓ}(BP,𝒢), a finite union of BH with H° reductive and π₀H prime to l. The Map^Σ(BP) comparison is an equivalence. Prime-to-l π₁ torsion of every input G° is preserved in every H°.

**Hypotheses and conventions.**

- Normal subgroup version suffices for the wild application; P finite solvable and l invertible in its order.

**Direct prerequisites.** `LanglandsParameterStacks:LP3/cyclic-fixed-locus-resolution`, `LanglandsParameterStacks:LP3/fixed-restriction-generation`, `LanglandsParameterStacks:LP3/fixed-fundamental-group`, `LanglandsParameterStacks:LP3/free-gerbe-comparison`, `LanglandsParameterStacks:LP3/mapping-approximation`, `ReductiveGroupsPartII:RG2.5`, `EnhancedDerivedSheaves:E5:presentability`.

**Construction or proof.**

1. For cyclic prime P, the twisted norm fixed-locus resolution computes the free-resolution algebra; fixed-group restriction generation gives equivalence.
2. If no extension section exists the mapping stack is empty and geometric reductivity forces the corresponding invariant colimit to vanish.
3. Induct through a solvable normal series using pushforward and left Kan extension compatibility; use the fixed-fundamental-group theorem for the good-prime clause.

Source: [Laurent Fargues; Peter Scholze, VIII.5.21 and proof, pp.313–315](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf). The passage states the object or result; the proof steps specify the reduction and conventions.

**Acceptance.**

- For P=1 this is the identity comparison.
- Finite p-groups from wild inertia are solvable and have order prime to l.

### Tame reduction of finite-wild parameter categories

Identifier: `LanglandsParameterStacks:LP3/tame-case-and-the-wild-remainder`. Kind: comparison.

For a finite-wild discrete W with finite normal p-group P and tame W/P, the gerbe pushforward and Map^Σ comparison reduce the characteristic-l cocycle algebra and Perf generation assertions to the tame relation-fibre case. Consequently colim free-cocycle algebras→O(Z¹(W,H)) is an isomorphism in IndPerf(BH), its algebra is connective in the good-filtration t-structure, and Perf(Z¹(W,H)/H) is generated from Perf(BH), under the good π₁ restriction.

**Hypotheses and conventions.**

- l≠p, l∤|π₁(H)_tors|; H split connected dual group, and finite action carried through the gerbe.

**Direct prerequisites.** `LanglandsParameterStacks:LP3/wild-gerbe-elimination`, `LanglandsParameterStacks:LP3/surface-and-tame-relations`, `LanglandsParameterStacks:LP3/free-gerbe-comparison`, `LanglandsParameterStacks:LP3/free-cocycle-good-filtration`, `LanglandsParameterStacks:LP0/discretization-and-unique-extension`.

**Construction or proof.**

1. Eliminate the finite wild p-group using VIII.5.21; the new bands retain reductive identity, prime-to-l components and good π₁.
2. Apply the tame unit-fibre result and the free-gerbe module comparison.
3. Translate the equivalence back to the coordinate-algebra and induced-perfect statements as in the end of VIII.5.2. No LP4 universal property is needed.

Source: [Laurent Fargues; Peter Scholze, VIII.5.2 and concluding proof, pp.294,312–315](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf). The passage states the object or result; the proof steps specify the reduction and conventions.

**Acceptance.**

- For trivial wild P the reduction is the tame relation-fibre argument.

### Very-good and reductive-pair centralizers

Identifier: `LanglandsParameterStacks:LP3/separable-centralizers`. Kind: theorem.

Over algebraically closed k, every closed subgroup of reductive G has smooth scheme-theoretic centralizer if char(k) is very good for G in the BMRT sense, or if G has a faithful V with G-equivariant splitting Lie(G)⊂Lie(GL(V)). Its tuple orbit maps are then separable. For simple root systems the very-good exclusions are l∤n+1 for A_n, l≠2 for B,C,D,E,F,G, l≠3 for E,F,G, and l≠5 for E₈. A positive characteristic prime to |W_G| is sufficient.

**Hypotheses and conventions.**

- Do not infer that the Lie algebra of a general reductive group is semisimple: its torus centre remains. The BMRT centralizer theorem is requested from RG, and the root-system table is scoped to simple factors.

**Direct prerequisites.** `ReductiveGroupsPartII:RG2.5`, `LanglandsParameterStacks:LP2:excursion-presentation/closed-orbit-criterion`, `mathlib:RootPairing`, `mathlib:CoxeterSystem`.

**Construction or proof.**

1. Apply the requested BMRT theorem under either hypothesis; the orbit differential criterion equates separability with smooth stabilizer.
2. Check the simple root-system exclusions and Weyl group orders using the RG root datum interface.
3. Record the torus correction in source issue E2; the quotient/slice statements retain their separate hypotheses.

Source: [Gebhard Böckle; Michael Harris; Chandrashekhar Khare; Jack A. Thorne, §3.1 Theorem3.8, table and Lemma3.9, pp.13–14](https://archive.intlpress.com/site/pub/files/_fulltext/journals/acta/2019/0223/0001/ACTA-2019-0223-0001-a001.pdf). The passage states the object or result; the proof steps specify the reduction and conventions.

**Acceptance.**

- For GL(V) the reductive-pair hypothesis holds with zero complement, so closed subgroup centralizers are smooth.
- For G_m, Lie(G_m) is one-dimensional abelian, not a nonzero semisimple Lie algebra.

### Descent of étaleness to reductive quotients

Identifier: `LanglandsParameterStacks:LP3/quotient-etale-descent`. Kind: theorem.

Let G/O be reductive and X,Y normal integral affine flat finite-type O-schemes, with a finite equivariant φ:Y→X. If y∈Y(k) and x=φ(y) have closed residual orbits, φ is étale at y, and its map on these orbits is injective on geometric points, then φ//G is étale at π(y).

**Hypotheses and conventions.**

- O the excellent coefficient DVR; finiteness, normality, closedness and orbit injectivity are explicit. The normalisation/inertia criterion is an SF.4 extension request, not implicitly available from field inertia subgroups.

**Direct prerequisites.** `LanglandsParameterStacks:LP2:excursion-presentation/quotients-over-fields-and-DVRs`, `SchemeAndStackFoundations:SF.4`, `ReductiveGroupsPartII:RG2.5`.

**Construction or proof.**

1. Take a finite Galois closure L/K of the function-field extension E/K for Y→X. For the quotient put K₀=Frac(O[X]^G), L₀=the relative algebraic closure of K₀ in L and E₀=L₀∩E=Frac(O[Y]^G). Connected G makes K₀ relatively algebraically closed in K; L₀/K₀ is finite Galois with the image of Gal(L/K) as group. Normalise the quotient in L₀ and E₀, not in the transcendental extension L/K₀. Source issue E9 records this repair.
2. The map from the full normalisation to the L₀-normalisation sends stabilizers into the image group. Closed residual orbits and orbit injectivity give Stab(z₀)⊂image Gal(L/E), using the same orbit argument as BHKT3.11. Apply SF.4’s finite-Galois intermediate integral-closure criterion to L₀/K₀ to get étaleness at the quotient point.
3. Use the invariant-neighbourhood property to localise and conclude étaleness as in BHKT3.11.

Source: [Gebhard Böckle; Michael Harris; Chandrashekhar Khare; Jack A. Thorne, §3.2 Lemmas3.11–3.12, pp.16–17](https://archive.intlpress.com/site/pub/files/_fulltext/journals/acta/2019/0223/0001/ACTA-2019-0223-0001-a001.pdf). The passage states the object or result; the proof steps specify the reduction and conventions.

**Acceptance.**

- For identity φ all hypotheses hold and the quotient map is étale.

### Formal quotient slices over coefficient DVRs

Identifier: `LanglandsParameterStacks:LP3/formal-etale-slice`. Kind: theorem.

Let G/O be reductive, X integral affine smooth finite type over O, and x∈X(k) have closed residual orbit and scheme-theoretically trivial stabilizer. For Artin local O-algebras with residue field k, the formal G-identity neighbourhood acts freely on X̂_x, and X̂_x/Ĝ≃(X//G)̂_{π(x)} as deformation functors.

**Hypotheses and conventions.**

- Scheme-theoretically trivial stabilizer is stronger than triviality of its k-points. No claim with arbitrary finite/nontrivial stabilizer is made.

**Direct prerequisites.** `LanglandsParameterStacks:LP3/quotient-etale-descent`, `LanglandsParameterStacks:LP2:excursion-presentation/quotients-over-fields-and-DVRs`, `SchemeAndStackFoundations:SF.4`, `ReductiveGroupsPartII:RG2.5`, `SchemeAndStackFoundations:SF.1`.

**Construction or proof.**

1. Choose an O-smooth transversal by splitting the tangent space of the orbit, using the trivial stabilizer.
2. The action G×S→X is étale near (1,x). Use Zariski main/normalisation and the repaired quotient étale descent to compare S with X//G at π(i(1,x)); the published point-name misprints are recorded in E10.
3. Invariant principal neighbourhoods and formal étaleness identify the completed functors, yielding free formal action and the quotient equivalence.

Source: [Gebhard Böckle; Michael Harris; Chandrashekhar Khare; Jack A. Thorne, §3.2 Proposition3.13 and proof, pp.17–19](https://archive.intlpress.com/site/pub/files/_fulltext/journals/acta/2019/0223/0001/ACTA-2019-0223-0001-a001.pdf). The passage states the object or result; the proof steps specify the reduction and conventions.

**Acceptance.**

- For X=G with left translation the formal quotient is a point.
- For tuple conjugation the action must first be by an effective adjoint group when the original centre is nontrivial.

### Integral Chevalley restriction for Levi groups

Identifier: `LanglandsParameterStacks:LP3/integral-chevalley-restriction`. Kind: theorem.

For a split reductive standard dual Levi M over Z, maximal split torus T and Weyl group W(M,T), restriction gives an isomorphism Z[M]^M≃Z[T]^{W(M,T)}. This is integral over Z with no good-prime hypothesis.

**Hypotheses and conventions.**

- The action is conjugation on M. This is group Chevalley restriction, not a statement about Lie algebra invariants in bad characteristic.

**Direct prerequisites.** `ReductiveGroupsPartII:RG2.5`, `mathlib:RootPairing`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-9-pinned-chevalleydemazure-group-schemes-over-ℤ`.

**Construction or proof.**

1. Injectivity follows from density of regular semisimple conjugates over Q and torsion-freeness.
2. Dominant highest-weight characters form a triangular Z-basis of Weyl-invariant torus characters.
3. Stable Z-lattices in the corresponding rational representations give integral characters in Z[M]^M, proving surjectivity. The highest-weight integral lattice theory is the RG2.6 request.

Source: [Gebhard Böckle; Michael Harris; Chandrashekhar Khare; Jack A. Thorne, Proposition8.3 and proof, p.53](https://archive.intlpress.com/site/pub/files/_fulltext/journals/acta/2019/0223/0001/ACTA-2019-0223-0001-a001.pdf). The passage states the object or result; the proof steps specify the reduction and conventions.

**Acceptance.**

- For M=G_m, restriction is the identity Z[t,t⁻¹].
- For GL₂, the target is Z[t₁+t₂,t₁t₂,(t₁t₂)⁻¹], realised by trace and determinant.

## LP4 — LanglandsParameterStacks:LP4

Universal representation bundles act on the parameter category. Under the good-π₁ hypothesis, VIII.5.1 gives generation and the IndPerf module comparison. The free-cocycle algebra theorem is imported from integral-invariants. Chapter X categorical action targets are supplied by the ES2/ES3 delegation table above.

**Coverage: planned.** Every original stage target is represented by a retained node, baseline/requested input or explicit existing-owner delegation. This is a complete target-level planning pass; no mathematical implementation is claimed.

Remaining obligations:

- Supply the E5/S.1 linear tensor/module and representation-bundle interfaces for VIII.5.1 generation/module comparison.
- Apply the recorded LP4 atlas target narrowing and delegated consumer mappings; ES2/ES3 supply all Chapter X universal-property targets. Extend the present tame-W ES3 comparison to all finite-wild pieces and the stated characteristic-zero coefficient range, as requested.

**Planets:** Universal representation bundles; Perfect generation on parameter stacks.

### Universal representation bundles

Identifier: `LanglandsParameterStacks:LP4/rep-action-on-perf`. Kind: construction.

For X=[Z¹(W,H)/H], evaluation of the universal H⋊Q-torsor gives, for finite I, exact Rep(Q^I)-linear symmetric monoidal functors Rep((H⋊Q)^I)→Perf(X)^{BW^I}. Tensoring these universal representation bundles acts on Perf(X). The construction exists before any good-prime generation theorem.

**Hypotheses and conventions.**

- Coefficients are the chosen base Z_l-algebra and representations finite projective; the W^I action is the universal cocycle action.

**Direct prerequisites.** `LanglandsParameterStacks:LP1/derived-parameter-stack`, `LanglandsParameterStacks:LP0/functoriality-of-cocycles`, `ReductiveGroupsPartII:RG2.5`, `SchemeKTheoryOperations:S.1`, `EnhancedDerivedSheaves:E5:abstract`.

**Construction or proof.**

1. Pull back a representation along the universal torsor with its W-equivariance.
2. Tensor I copies and use evaluation/fusion along finite-set maps.
3. Tensor with the resulting perfect bundle to obtain an exact endofunctor. Use S.1 for local perfectness and pullback stability.

Source: [Laurent Fargues; Peter Scholze, X introduction, p.340](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf). The passage states the object or result; the proof steps specify the reduction and conventions.

**API.**

- `UniversalRepresentationBundle` (constructor): Associated finite-projective bundle with universal W-equivariance.
- `UniversalRepresentationBundle.unit` (simp): The trivial representation gives O_X.
- `UniversalRepresentationBundle.tensor` (compatibility): Associated bundles preserve tensor product.
- `UniversalRepresentationBundle.reindex` (functoriality): Finite-set pullbacks give the fusion compatibilities.
- `UniversalRepresentationBundle.act` (functoriality): Tensoring defines the exact Perf action, compatible with unit and composition.
- `UniversalRepresentationBundle.baseChange` (compatibility): Pullback along coefficient change carries the bundle associated to V to the bundle associated to its scalar extension, compatibly with W-action, tensor and unit; no invariant-ring base-change isomorphism is assumed.

**Uses.**

- `ExcursionOperatorsAndSpectralAction:ES2/universal-action-theorem`: The canonical direction of the action classification.
- `ExcursionOperatorsAndSpectralAction:ES2`: The universal bundle action used by the Bun_G consumer.

**Unit tests.**

- `rep_bundle_unit` (degenerate): The trivial representation acts by identity on Perf(X).
- `rep_bundle_at_parameter` (computation): The fibre at φ is V with the W-action supplied by φ.
- `rep_bundle_tensor` (compatibility): The fibre of the tensor product is the tensor product of the two parameter representations.

**Acceptance.**

- The trivial representation acts by identity on Perf(X).
- The fibre at φ is V with the W-action supplied by φ.
- The fibre of the tensor product is the tensor product of the two parameter representations.

### Perfect generation on parameter stacks

Identifier: `LanglandsParameterStacks:LP4/generation-and-module-comparison`. Kind: theorem.

For finite-wild W and l∤|π₁(H)_tors|, Perf(Z¹(W,H)/H) over Z_l is generated under cones and retracts by the image of Perf(BH). The analogous characteristic-l statement holds over F_l-bar, and over a characteristic-zero field no restriction on l is needed.

**Hypotheses and conventions.**

- l≠p; finite-wild piece. Generation by representation bundles is a theorem, not the definition of Perf.

**Direct prerequisites.** `LanglandsParameterStacks:LP3/tame-case-and-the-wild-remainder`, `LanglandsParameterStacks:LP3/induced-perfect-complexes`, `LanglandsParameterStacks:LP4/rep-action-on-perf`, `SchemeKTheoryOperations:S.1`, `EnhancedDerivedSheaves:E5:presentability`, `ReductiveGroupsPartII:RG2.5`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-9-pinned-chevalleydemazure-group-schemes-over-ℤ`.

**Construction or proof.**

1. Use wild-to-tame reduction for the mod-l assertion.
2. Over Z_l reduce perfect amplitude by surjections from induced bundles. A vector bundle splits off an induced bundle rationally, hence up to an l-power.
3. The remaining mod-l object is induced-generated; devissage and retracts recover integral generation.

Source: [Laurent Fargues; Peter Scholze, VIII.5.1 and reduction proof, pp.293–294](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf). The passage states the object or result; the proof steps specify the reduction and conventions.

**Acceptance.**

- For W=1 the category is Perf(BH).
- The unquotiented Z¹ and the quotient Z¹/H are not interchangeable in this statement.

### Parameter IndPerf module comparison

Identifier: `LanglandsParameterStacks:LP4/module-comparison`. Kind: theorem.

Under integral good-prime generation, IndPerf(Z¹(W,H)/H)≃Mod_{O(Z¹(W,H))}(IndPerf(BH)), compatibly with pullback, tensor products and the representation bundles. Over characteristic-zero fields the same comparison holds without a π₁ restriction.

**Hypotheses and conventions.**

- Modules are in IndPerf(BH), not in the ordinary derived category with the equivariance forgotten.

**Direct prerequisites.** `LanglandsParameterStacks:LP4/generation-and-module-comparison`, `LanglandsParameterStacks:LP2:integral-invariants/integral-invariant-theorem`, `EnhancedDerivedSheaves:E5:presentability`, `SchemeKTheoryOperations:S.1`.

**Construction or proof.**

1. Pullback from BH and its right adjoint form the affine algebra adjunction. Generation makes the right adjoint conservative.
2. Apply Barr–Beck–Lurie and identify its monad with tensor by the cocycle coordinate algebra.
3. The canonical comparison identifies compact objects and the induced action.

Source: [Laurent Fargues; Peter Scholze, VIII.5.1 and proof, p.293](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf). The passage states the object or result; the proof steps specify the reduction and conventions.

**Acceptance.**

- For H=1 this is the ordinary affine perfect/module comparison.

## Open gaps and supplier requests

### LanglandsParameterStacks:G1 — Registration and verification of the reductive supplier extensions

The structural RG2.6 proposal is unregistered and its non-highest-weight needs route through RG2.5 only as extensions. The highest-weight needs instead extend the already accepted ReductiveGroupsIntegralRepresentationsPartII candidate (Kisin–Pappas18 route5 and KPZ26 route3), through its registered parent Layer9 until DESIGN assigns stage ids. Neither RG2.5 nor parent Layer9 currently establishes these inputs. Prasad–Yu, Lusztig/FG, BMRT, TvdK, Procesi and the general highest-weight sources must receive verified supplier nodes before the chains close. The reviewer checked the accepting routes and actual parent statements, not the unimplemented extensions. General GIT is not added as a new RG2.6 owner: the accepted LP and deformation-ring routes must be reconciled under G6.

Affected targets: `LanglandsParameterStacks:LP0/condensed-cocycles-and-L-parameters`, `LanglandsParameterStacks:LP0/discretization-and-unique-extension`, `LanglandsParameterStacks:LP0/wild-inertial-parameter`, `LanglandsParameterStacks:LP0/wild-enhancement-group`, `LanglandsParameterStacks:LP0/extended-wild-parameters`, `LanglandsParameterStacks:LP1/finite-presentation-over-Z-invert-p`, `LanglandsParameterStacks:LP1/dimension-bound-lemma`, `LanglandsParameterStacks:LP1/derived-parameter-stack`, `LanglandsParameterStacks:LP1/cotangent-complex-and-deformation-theory`, `LanglandsParameterStacks:LP1/weil-deligne-parameters`, `LanglandsParameterStacks:LP2:integral-invariants/weil-deligne-and-the-monodromy-map`, `LanglandsParameterStacks:LP1/singularities-and-singular-support`, `LanglandsParameterStacks:LP1/banal-case-and-the-nilpotent-cone`, `LanglandsParameterStacks:LP2:excursion-presentation/coarse-quotient`, `LanglandsParameterStacks:LP2:excursion-presentation/quotients-over-fields-and-DVRs`, `LanglandsParameterStacks:LP2:excursion-presentation/complete-reducibility`, `LanglandsParameterStacks:LP2:excursion-presentation/closed-orbit-criterion`, `LanglandsParameterStacks:LP2:semisimple-characters/semisimple-parameters-and-closed-orbits`, `LanglandsParameterStacks:LP2:excursion-presentation/parameter-closed-orbits`, `LanglandsParameterStacks:LP2:excursion-presentation/universal-homeomorphism`, `LanglandsParameterStacks:LP2:excursion-presentation/universal-property-of-the-excursion-algebra`, `LanglandsParameterStacks:LP2:excursion-presentation/categorical-hecke-datum`, `LanglandsParameterStacks:LP2:excursion-presentation/excursion-datum`, `LanglandsParameterStacks:LP2:excursion-presentation/invariant-function-and-independence`, `LanglandsParameterStacks:LP2:semisimple-characters/reductive-pseudocharacters`, `LanglandsParameterStacks:LP2:semisimple-characters/characteristic-zero-continuity`, `LanglandsParameterStacks:LP2:semisimple-characters/discrete-coefficient-continuity`, `LanglandsParameterStacks:LP2:semisimple-characters/GL-trace-pseudocharacters`, `LanglandsParameterStacks:LP2:semisimple-characters/GL-trace-comparison`, `LanglandsParameterStacks:LP3/good-filtration-t-structure`, `LanglandsParameterStacks:LP3/good-filtration-separatedness-and-OG`, `LanglandsParameterStacks:LP3/free-cocycle-good-filtration`, `LanglandsParameterStacks:LP3/bar-criterion`, `LanglandsParameterStacks:LP3/equivariant-vector-bundles-and-Perf-ind`, `LanglandsParameterStacks:LP3/adjoint-unit-generation`, `LanglandsParameterStacks:LP3/derived-unit-fibre`, `LanglandsParameterStacks:LP3/fixed-points-of-prime-to-l-group-actions`, `LanglandsParameterStacks:LP3/cyclic-fixed-locus-resolution`, `LanglandsParameterStacks:LP3/donkin-subgroup-and-generation`, `LanglandsParameterStacks:LP3/fixed-induction-and-counit`, `LanglandsParameterStacks:LP3/fixed-restriction-generation`, `LanglandsParameterStacks:LP3/bad-prime-fixed-counterexample`, `LanglandsParameterStacks:LP3/fixed-fundamental-group`, `LanglandsParameterStacks:LP3/mapping-approximation`, `LanglandsParameterStacks:LP3/free-gerbe-comparison`, `LanglandsParameterStacks:LP3/wild-gerbe-elimination`, `LanglandsParameterStacks:LP3/separable-centralizers`, `LanglandsParameterStacks:LP3/quotient-etale-descent`, `LanglandsParameterStacks:LP3/formal-etale-slice`, `LanglandsParameterStacks:LP3/integral-chevalley-restriction`, `LanglandsParameterStacks:LP2:integral-invariants/integral-invariant-theorem`, `LanglandsParameterStacks:LP2:integral-invariants/cohomology-and-base-change`, `LanglandsParameterStacks:LP4/rep-action-on-perf`, `LanglandsParameterStacks:LP4/generation-and-module-comparison`.

### LanglandsParameterStacks:G2 — Independence of the full integral excursion algebra

FS after VIII.3.7 proves independence for the l-torsion-free quotient and says it does not know whether removal of torsion is necessary. The full Exc(W,H) at arbitrary bad primes is not claimed choice independent. This is an open source question, not an unread extension theorem.

Affected targets: `LanglandsParameterStacks:LP2:integral-invariants/transition-and-continuity`.

### LanglandsParameterStacks:G3 — Unrepresented future carriers in suggested signatures

The pinned libraries have no full animated parameter/quotient stack, stable infinity-category Perf/IndPerf, full cotangent or coherent singular-support carrier. The suggested file gives exact algebraic/ordinary prototypes where possible, and explicitly lists unavailable definition/API/test signatures rather than disguising them as true propositions. The supplier requests must settle these carriers and infinity coherence before those signatures can be elaborated in full. The condensed relatively discrete coefficient tensor, algebraic group functor of points/regularity, geometric parabolic families, and admissible complex enhancement carriers are also explicit omissions: the compiled group and GL_n shadows do not assert their full signatures. The shared build lacks the TauCeti.GroupTheory.FixedSubgroup object file; its baseline point checks are recorded without rebuilding the library.

Affected targets: `LanglandsParameterStacks:LP0/functoriality-of-cocycles`, `LanglandsParameterStacks:LP1/finite-presentation-over-Z-invert-p`, `LanglandsParameterStacks:LP1/representability-flatness-and-lci`, `LanglandsParameterStacks:LP1/derived-parameter-stack`, `LanglandsParameterStacks:LP1/derived-comparison-with-the-classical-scheme`, `LanglandsParameterStacks:LP1/local-tate-duality`, `LanglandsParameterStacks:LP1/cotangent-complex-and-deformation-theory`, `LanglandsParameterStacks:LP1/singularities-and-singular-support`, `LanglandsParameterStacks:LP1/hochshild-action-and-support`, `LanglandsParameterStacks:LP2:excursion-presentation/coarse-quotient`, `LanglandsParameterStacks:LP2:excursion-presentation/quotients-over-fields-and-DVRs`, `LanglandsParameterStacks:LP2:excursion-presentation/excursion-algebra-and-universal-homeomorphism`, `LanglandsParameterStacks:LP2:excursion-presentation/categorical-hecke-datum`, `LanglandsParameterStacks:LP3/good-filtration-t-structure`, `LanglandsParameterStacks:LP3/induced-perfect-complexes`, `LanglandsParameterStacks:LP3/bar-criterion`, `LanglandsParameterStacks:LP3/adjoint-unit-generation`, `LanglandsParameterStacks:LP3/twisted-free-generation`, `LanglandsParameterStacks:LP3/derived-unit-fibre`, `LanglandsParameterStacks:LP3/cyclic-fixed-locus-resolution`, `LanglandsParameterStacks:LP3/fixed-induction-and-counit`, `LanglandsParameterStacks:LP3/fixed-restriction-generation`, `LanglandsParameterStacks:LP3/bad-prime-fixed-counterexample`, `LanglandsParameterStacks:LP3/mapping-approximation`, `LanglandsParameterStacks:LP3/free-gerbe-comparison`, `LanglandsParameterStacks:LP3/wild-gerbe-elimination`, `LanglandsParameterStacks:LP3/formal-etale-slice`, `LanglandsParameterStacks:LP2:excursion-presentation/free-derived-cocycle-colimit`, `LanglandsParameterStacks:LP2:integral-invariants/integral-invariant-theorem`, `LanglandsParameterStacks:LP2:integral-invariants/cohomology-and-base-change`, `LanglandsParameterStacks:LP4/rep-action-on-perf`, `LanglandsParameterStacks:LP4/generation-and-module-comparison`, `LanglandsParameterStacks:LP4/module-comparison`.

### LanglandsParameterStacks:G4 — Finite-Q relatively discrete characteristic-zero continuity

The accepted IHG revision 2 supplies generalized-reductive algebraic reconstruction, verified here against Quast Theorem 3.7; the old disconnected algebraic proof gap is resolved. The remaining extension is the characteristic-zero finite-Q continuity calculation and its preservation of locally finite-type Z_l coefficient modules for the relatively discrete condensed convention. IHG.1/reductive-valued-continuity presently states only the connected profinite rank-one-valued theorem. Lafforgue Proposition 11.7 supplies characteristic-zero disconnected finite-anchor coordinates, but does not by itself state this condensed coefficient extension. Quast Theorem 3.8 cannot fill the gap: the accepted IHG E13 identifies circular compactness in its proof. The discrete-coefficient Weil argument is spelled out separately and does not use that proof.

Affected targets: `LanglandsParameterStacks:LP2:semisimple-characters/characteristic-zero-continuity`, `LanglandsParameterStacks:LP2:semisimple-characters/character-bijection`.

### LanglandsParameterStacks:G6 — External field-GIT and supplier-edge reconciliation

Local duplicate generic definitions/anchors have been removed or narrowed to explicit adapters; the current IHG revision 2 is accepted. Its generic pseudocharacter/reconstruction nodes still name the entire LP3 stage. Replace those external prerequisites, including the invariant-evaluation and two-entry dependencies, by the explicit regular-function and unconditional field inputs in the route proposal, with any generalized-reductive extension stated at IHG, so semisimple reconstruction does not inherit the good-prime generation branch. The shared general Seshadri/Haboush/power-lifting inputs of LP and the accepted deformation-ring direction also need a single declared supplier before closure. No new RG2.6 GIT owner is introduced. This packet records the required external changes; it cannot edit those owners or atlas edges.

Affected targets: `LanglandsParameterStacks:LP2:excursion-presentation/coarse-quotient`, `LanglandsParameterStacks:LP2:excursion-presentation/quotients-over-fields-and-DVRs`, `LanglandsParameterStacks:LP2:excursion-presentation/closed-orbit-criterion`, `LanglandsParameterStacks:LP2:excursion-presentation/universal-homeomorphism`, `LanglandsParameterStacks:LP2:semisimple-characters/reductive-pseudocharacters`, `LanglandsParameterStacks:LP2:semisimple-characters/proof-of-the-character-bijection`, `LanglandsParameterStacks:LP2:semisimple-characters/character-bijection`.

### Request to ArithmeticGaloisRepresentations:R01.2

Grothendieck quasi-unipotence for continuous l-adic linear representations of W_E, l≠p, with its finite tame logarithm/exponential consequence after a faithful dual-group embedding. LP1 owns the Weil–Deligne parameter comparison instance.

Needed by: `LanglandsParameterStacks:LP2:integral-invariants/weil-deligne-and-the-monodromy-map`.

### Request to DeformationAndDerivedPatchingAlgebra:R03.3

Extend complete-intersection algebra to syntomic maps over regular noetherian bases: regular-sequence/dimension/flatness criterion; Sing=Spec Sym H¹(L^∨), representing H⁻¹(L⊗T); Gulliksen finite generation of graded Ext as a coherent Sing-module; Jørgensen/Arinkin–Gaitsgory perfect iff zero-section support and the maximal perfectness locus; smooth pullback compatibility. The parameter instances stay in LP1. The general singular-support extension is a Part II/rescope request, not assumed current R03.3 content.

Needed by: `LanglandsParameterStacks:LP1/representability-flatness-and-lci`, `LanglandsParameterStacks:LP1/singularities-and-singular-support`, `LanglandsParameterStacks:LP1/hochshild-action-and-support`.

### Request to DerivedDeRhamCohomology:DD.0

Full animated cotangent complex, mapping-stack tangent formula, dualisation and shift conventions, regular-quotient amplitude and base-change/smooth descent; naive H1Cotangent is insufficient.

Needed by: `LanglandsParameterStacks:LP1/derived-comparison-with-the-classical-scheme`, `LanglandsParameterStacks:LP1/cotangent-complex-and-deformation-theory`, `LanglandsParameterStacks:LP1/singularities-and-singular-support`.

### Request to EnhancedDerivedSheaves:E5:abstract

Small stable infinity-categories with exact monoidal functors, endofunctors, equivariant objects, idempotent completion and coherent finite-set data. Ordinary baseline monoidal functors, equivalences and Karoubi supply only their ordinary shadows.

Needed by: `LanglandsParameterStacks:LP1/derived-parameter-stack`, `LanglandsParameterStacks:LP2:excursion-presentation/categorical-hecke-datum`, `LanglandsParameterStacks:LP3/good-filtration-t-structure`, `LanglandsParameterStacks:LP3/induced-perfect-complexes`, `LanglandsParameterStacks:LP3/bad-prime-fixed-counterexample`, `LanglandsParameterStacks:LP3/mapping-approximation`, `LanglandsParameterStacks:LP4/rep-action-on-perf`.

### Request to EnhancedDerivedSheaves:E5:animation

Animated rings, derived affine mapping/zero loci, derived fpqc quotient stacks, QCoh and Perf with pullback/descent on [X/G], reusing SF.1 and S.1/E1; full mapping-stack/classical-truncation comparison and animated free-group resolutions. This is the general derived extension requested by finding27, not new general machinery inside LP1.

Needed by: `LanglandsParameterStacks:LP1/derived-parameter-stack`, `LanglandsParameterStacks:LP1/derived-comparison-with-the-classical-scheme`, `LanglandsParameterStacks:LP1/singularities-and-singular-support`, `LanglandsParameterStacks:LP1/hochshild-action-and-support`, `LanglandsParameterStacks:LP3/induced-perfect-complexes`, `LanglandsParameterStacks:LP3/derived-unit-fibre`, `LanglandsParameterStacks:LP3/mapping-approximation`, `LanglandsParameterStacks:LP2:excursion-presentation/free-derived-cocycle-colimit`.

### Request to EnhancedDerivedSheaves:E5:presentability

Ind-completion/compact objects; linear monoidal categories and tensor/module categories; Barr–Beck–Lurie and base change of module categories; sifted left Kan extension on anima, exact Ind–Pro constructions/formal power series and compact bar-resolution arguments. Supply continuous/condensed derived invariants and coefficient base-change so the Weil two-term resolution and good-filtration reduction have actual complexes. For VIII.5.13 supply IndCoh of the derived unit self-intersection, its good-filtration t-structure and separated quotient, and descent of colimit-preserving functors with bounded t-amplitude; the Borel-flag conservativity proof remains the parameter instance.

Needed by: `LanglandsParameterStacks:LP1/local-tate-duality`, `LanglandsParameterStacks:LP2:excursion-presentation/excursion-algebra-and-universal-homeomorphism`, `LanglandsParameterStacks:LP3/good-filtration-t-structure`, `LanglandsParameterStacks:LP3/induced-perfect-complexes`, `LanglandsParameterStacks:LP3/bar-criterion`, `LanglandsParameterStacks:LP3/derived-unit-fibre`, `LanglandsParameterStacks:LP3/cyclic-fixed-locus-resolution`, `LanglandsParameterStacks:LP3/fixed-induction-and-counit`, `LanglandsParameterStacks:LP3/fixed-restriction-generation`, `LanglandsParameterStacks:LP3/bad-prime-fixed-counterexample`, `LanglandsParameterStacks:LP3/mapping-approximation`, `LanglandsParameterStacks:LP3/free-gerbe-comparison`, `LanglandsParameterStacks:LP3/wild-gerbe-elimination`, `LanglandsParameterStacks:LP2:excursion-presentation/free-derived-cocycle-colimit`, `LanglandsParameterStacks:LP2:integral-invariants/integral-invariant-theorem`, `LanglandsParameterStacks:LP2:integral-invariants/cohomology-and-base-change`, `LanglandsParameterStacks:LP4/generation-and-module-comparison`, `LanglandsParameterStacks:LP4/module-comparison`, `LanglandsParameterStacks:LP1/weil-cohomological-dimension-and-euler-characteristic`.

### Request to ReductiveGroupsPartII:RG2.5

Existing RG2.5 supplies the integral pinned dual and finite action, semidirect L-group, parabolics/Levis and change of pinning. EXTENSION ROUTE, NOT EXISTING RG2.5 CONTENT: register the proposed RG2.6 independent of LP1 for (1) smooth fixed loci with reductive identity for prime-to-characteristic finite automorphism groups (Prasad–Yu PY02 Thm2.1, and related PY06 Cor5.2 in the confirmed routing); (2) finite unipotent classes in a smooth group with reductive identity (Lusztig/FG12 Cor2.6); (3) integral highest-weight inputs are imported instead from the already accepted ReductiveGroupsIntegralRepresentationsPartII candidate through its registered parent Layer9 request; they must not be added as a second RG2.6 owner; (4) no new general GIT owner is proposed: the primary verifier rejects that RG2.6 allocation; use the accepted BHKT19 route2 and Lafforgue18 route3 inputs at LP2/LP3, coordinated with the Seshadri theory already routed to LocalGaloisDeformationRingsPartIIComponentsAndNormality. Registration of their shared Haboush/power-lifting and nonconnected finite-anchor proof inputs remains G6; (5) BMRT centralizer separability and the very-good root tables; (6) central isogenies, Borel/Bruhat Cartier flags and fixed-root case calculations used by VIII.5.15/5.19; (7) root/fundamental-group and centralizer data beyond the pinned dual; integral character lattices come from the accepted representation Part II, and trace/pseudocharacter comparison imports the accepted IHG nodes; (8) admissible enhanced complex classical-group L-parameters and their component-group representations for KSS1.20–1.21. No statement here certifies these extensions as already supplied; gap G1 and the rescope proposal record registration and proof obligations.

Needed by: `LanglandsParameterStacks:LP0/condensed-cocycles-and-L-parameters`, `LanglandsParameterStacks:LP0/discretization-and-unique-extension`, `LanglandsParameterStacks:LP0/wild-inertial-parameter`, `LanglandsParameterStacks:LP0/wild-enhancement-group`, `LanglandsParameterStacks:LP0/extended-wild-parameters`, `LanglandsParameterStacks:LP1/finite-presentation-over-Z-invert-p`, `LanglandsParameterStacks:LP1/dimension-bound-lemma`, `LanglandsParameterStacks:LP1/derived-parameter-stack`, `LanglandsParameterStacks:LP1/cotangent-complex-and-deformation-theory`, `LanglandsParameterStacks:LP1/weil-deligne-parameters`, `LanglandsParameterStacks:LP2:integral-invariants/weil-deligne-and-the-monodromy-map`, `LanglandsParameterStacks:LP1/singularities-and-singular-support`, `LanglandsParameterStacks:LP1/banal-case-and-the-nilpotent-cone`, `LanglandsParameterStacks:LP2:excursion-presentation/coarse-quotient`, `LanglandsParameterStacks:LP2:excursion-presentation/quotients-over-fields-and-DVRs`, `LanglandsParameterStacks:LP2:excursion-presentation/complete-reducibility`, `LanglandsParameterStacks:LP2:excursion-presentation/closed-orbit-criterion`, `LanglandsParameterStacks:LP2:semisimple-characters/semisimple-parameters-and-closed-orbits`, `LanglandsParameterStacks:LP2:excursion-presentation/parameter-closed-orbits`, `LanglandsParameterStacks:LP2:excursion-presentation/universal-homeomorphism`, `LanglandsParameterStacks:LP2:excursion-presentation/universal-property-of-the-excursion-algebra`, `LanglandsParameterStacks:LP2:excursion-presentation/categorical-hecke-datum`, `LanglandsParameterStacks:LP2:excursion-presentation/excursion-datum`, `LanglandsParameterStacks:LP2:excursion-presentation/invariant-function-and-independence`, `LanglandsParameterStacks:LP2:semisimple-characters/reductive-pseudocharacters`, `LanglandsParameterStacks:LP2:semisimple-characters/characteristic-zero-continuity`, `LanglandsParameterStacks:LP2:semisimple-characters/discrete-coefficient-continuity`, `LanglandsParameterStacks:LP2:semisimple-characters/GL-trace-pseudocharacters`, `LanglandsParameterStacks:LP2:semisimple-characters/GL-trace-comparison`, `LanglandsParameterStacks:LP3/good-filtration-t-structure`, `LanglandsParameterStacks:LP3/good-filtration-separatedness-and-OG`, `LanglandsParameterStacks:LP3/free-cocycle-good-filtration`, `LanglandsParameterStacks:LP3/bar-criterion`, `LanglandsParameterStacks:LP3/equivariant-vector-bundles-and-Perf-ind`, `LanglandsParameterStacks:LP3/adjoint-unit-generation`, `LanglandsParameterStacks:LP3/derived-unit-fibre`, `LanglandsParameterStacks:LP3/fixed-points-of-prime-to-l-group-actions`, `LanglandsParameterStacks:LP3/cyclic-fixed-locus-resolution`, `LanglandsParameterStacks:LP3/donkin-subgroup-and-generation`, `LanglandsParameterStacks:LP3/fixed-induction-and-counit`, `LanglandsParameterStacks:LP3/fixed-restriction-generation`, `LanglandsParameterStacks:LP3/bad-prime-fixed-counterexample`, `LanglandsParameterStacks:LP3/fixed-fundamental-group`, `LanglandsParameterStacks:LP3/mapping-approximation`, `LanglandsParameterStacks:LP3/free-gerbe-comparison`, `LanglandsParameterStacks:LP3/wild-gerbe-elimination`, `LanglandsParameterStacks:LP3/separable-centralizers`, `LanglandsParameterStacks:LP3/quotient-etale-descent`, `LanglandsParameterStacks:LP3/formal-etale-slice`, `LanglandsParameterStacks:LP3/integral-chevalley-restriction`, `LanglandsParameterStacks:LP2:integral-invariants/integral-invariant-theorem`, `LanglandsParameterStacks:LP2:integral-invariants/cohomology-and-base-change`, `LanglandsParameterStacks:LP4/rep-action-on-perf`, `LanglandsParameterStacks:LP4/generation-and-module-comparison`.

### Request to SchemeAndStackFoundations:SF.1

Effective fpqc/fppf descent, algebraic quotient-stack interface and smooth charts, coaction-to-affine-functor equaliser construction. Reuse Mathlib nonabelian Čech cocycles for the descent bridge; they are not continuous group crossed cocycles. LP1 only instantiates these constructions for parameters.

Needed by: `LanglandsParameterStacks:LP0/functoriality-of-cocycles`, `LanglandsParameterStacks:LP1/finite-presentation-over-Z-invert-p`, `LanglandsParameterStacks:LP1/representability-flatness-and-lci`, `LanglandsParameterStacks:LP1/derived-parameter-stack`, `LanglandsParameterStacks:LP1/singularities-and-singular-support`, `LanglandsParameterStacks:LP2:excursion-presentation/coarse-quotient`, `LanglandsParameterStacks:LP2:excursion-presentation/quotients-over-fields-and-DVRs`, `LanglandsParameterStacks:LP3/adjoint-unit-generation`, `LanglandsParameterStacks:LP3/formal-etale-slice`.

### Request to SchemeAndStackFoundations:SF.4

Excellent normalisations and intermediate integral-closure étaleness criterion of BHKT3.12: A excellent normal domain, finite Galois L/K, subgroup H, B integral closure in L^H and C in L; Spec B→Spec A is étale at b below geometric c iff Stab_G(c)⊂H. Also Zariski main theorem, formal completion/deformation functors, smooth transversal lifting and exact equivariant formal-unit rth roots for r invertible. These are extensions in SF.4’s direction; LP3 owns the quotient-slice applications.

Needed by: `LanglandsParameterStacks:LP3/cyclic-fixed-locus-resolution`, `LanglandsParameterStacks:LP3/quotient-etale-descent`, `LanglandsParameterStacks:LP3/formal-etale-slice`.

### Request to SchemeKTheoryOperations:S.1

Locally bounded finite-free/perfect complexes, pullback stability, tensor/dual and cone/retract closure on schemes; provide the existing E1-enhanced descent interface to E5 quotient-stack Perf. LP1/LP4 do not own general perfectness.

Needed by: `LanglandsParameterStacks:LP1/derived-parameter-stack`, `LanglandsParameterStacks:LP1/hochshild-action-and-support`, `LanglandsParameterStacks:LP3/induced-perfect-complexes`, `LanglandsParameterStacks:LP3/bar-criterion`, `LanglandsParameterStacks:LP3/adjoint-unit-generation`, `LanglandsParameterStacks:LP3/twisted-free-generation`, `LanglandsParameterStacks:LP3/fixed-restriction-generation`, `LanglandsParameterStacks:LP3/mapping-approximation`, `LanglandsParameterStacks:LP4/rep-action-on-perf`, `LanglandsParameterStacks:LP4/generation-and-module-comparison`, `LanglandsParameterStacks:LP4/module-comparison`.

### Request to tauceti:TauCetiRoadmap/ClassFieldTheory#layer-9-the-local-weil-group

The topological local Weil group W_E, degree map, open profinite inertia and finite quotient actions; tame Frobenius normalisation and dense discrete models. Supply the exact topology and compact-inertia coordinate interface used to construct the two-stage continuous cochain model. LP1 owns the resulting Weil cohomology/duality theorem, not a new Weil-group carrier. Baseline AbsoluteGaloisGroup and valuation inertia do not supply this. The supplier fixes arithmetic Frobenius F with weilDegree(F)=1 and FτF⁻¹=τ^q. LP0 uses geometric σ=F⁻¹, σ⁻¹τσ=τ^q and deg_LP=−weilDegree; transport the topology, finite action and Tate character through this explicit conversion.

Needed by: `LanglandsParameterStacks:LP0/condensed-cocycles-and-L-parameters`, `LanglandsParameterStacks:LP0/discretization-and-unique-extension`, `LanglandsParameterStacks:LP1/weil-cohomological-dimension-and-euler-characteristic`, `LanglandsParameterStacks:LP1/local-tate-duality`, `LanglandsParameterStacks:LP1/weil-deligne-parameters`, `LanglandsParameterStacks:LP1/banal-case-and-the-nilpotent-cone`, `LanglandsParameterStacks:LP2:semisimple-characters/discrete-coefficient-continuity`.

### Request to tauceti:TauCetiRoadmap/DGAInfinity#layer-8-hochschild-cochains-deformations-massey-products-and-formality

Hochschild cochains HH(B/A)=RHom_{B⊗^L_A B}(B,B), graded composition, action on Ext(N,N) and the natural map H¹(L^∨)→HH² supplied by forgetting commutativity of square-zero extensions. It is not an identification of all HH²; a smooth two-variable polynomial ring is a counterexample (E4). Request the relative coefficient and full-cotangent bridge as an extension if the upstream Layer8 only supplies the absolute DG version; do not duplicate Hochschild cochains.

Needed by: `LanglandsParameterStacks:LP1/hochshild-action-and-support`, `LanglandsParameterStacks:LP3/bar-criterion`.

### Request to tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-4-the-tame-quotient-of-the-absolute-galois-group

Wild inertia P_E as pro-p normal subgroup, cofinal open W_E-normal kernels, tame I_E/P_E and Frobenius action τ↦τ^q, with geometric/arithmetic Frobenius conversion. Existing abstract inertia is not the wild filtration.

Needed by: `LanglandsParameterStacks:LP0/condensed-cocycles-and-L-parameters`, `LanglandsParameterStacks:LP0/finite-wild-ramification`, `LanglandsParameterStacks:LP0/discretization-and-unique-extension`, `LanglandsParameterStacks:LP0/wild-inertial-parameter`, `LanglandsParameterStacks:LP1/weil-cohomological-dimension-and-euler-characteristic`, `LanglandsParameterStacks:LP1/local-tate-duality`.

### Request to tauceti:TauCetiRoadmap/ReductiveGroups#layer-9-pinned-chevalleydemazure-group-schemes-over-ℤ

EXTENSION through the already accepted candidate ReductiveGroupsIntegralRepresentationsPartII (PAPER-KISIN-PAPPAS-18 route5 and PAPER-KISIN-PAPPAS-ZHOU-26 route3), pending registration of its DESIGN stages. Extend that single owner with integral induced/dual-Weyl and Weyl modules, dominant CHARACTER lattices, Kempf vanishing, Donkin criterion, Donkin–Mathieu tensor stability, Koppinen/Donkin O(G) good G×G-filtration, finite coherent good-filtration dimension (TvdK), and integral highest-weight tensor/base-change interfaces. The parent Layer9 supplies pinned integral groups only, not these representation theorems. Do not create a competing highest-weight owner in RG2.6 or PA.1.

Needed by: `LanglandsParameterStacks:LP3/good-filtration-t-structure`, `LanglandsParameterStacks:LP3/good-filtration-separatedness-and-OG`, `LanglandsParameterStacks:LP3/free-cocycle-good-filtration`, `LanglandsParameterStacks:LP3/bar-criterion`, `LanglandsParameterStacks:LP3/equivariant-vector-bundles-and-Perf-ind`, `LanglandsParameterStacks:LP3/adjoint-unit-generation`, `LanglandsParameterStacks:LP3/twisted-free-generation`, `LanglandsParameterStacks:LP3/derived-unit-fibre`, `LanglandsParameterStacks:LP3/fixed-points-of-prime-to-l-group-actions`, `LanglandsParameterStacks:LP3/cyclic-fixed-locus-resolution`, `LanglandsParameterStacks:LP3/donkin-subgroup-and-generation`, `LanglandsParameterStacks:LP3/fixed-induction-and-counit`, `LanglandsParameterStacks:LP3/fixed-restriction-generation`, `LanglandsParameterStacks:LP3/bad-prime-fixed-counterexample`, `LanglandsParameterStacks:LP3/integral-chevalley-restriction`, `LanglandsParameterStacks:LP2:integral-invariants/integral-invariant-theorem`, `LanglandsParameterStacks:LP2:integral-invariants/cohomology-and-base-change`, `LanglandsParameterStacks:LP4/generation-and-module-comparison`.

### Request to IntegralHeckeAndGaloisDeterminants:IHG.1/reductive-valued-continuity

Extend the existing characteristic-zero connected/profinite finite-coordinate continuity contract to J=H⋊Q with H-conjugation, using Lafforgue Proposition 11.7. LP applies it on compact inertia. State separately the preservation of locally finite-type Z_l coefficient modules needed for the relatively discrete condensed Weil convention; the present rank-one-valued theorem alone does not supply it. Do not invoke the circular compactness proof in Quast Theorem 3.8.

Needed by: `LanglandsParameterStacks:LP2:semisimple-characters/characteristic-zero-continuity`.

### Request to ExcursionOperatorsAndSpectralAction:ES3/discrete-integral-spectral-action

Owner-side scope extension of the existing tame-W X.0.2 contract to arbitrary finite-wild discretizations, using LP3 wild-gerbe elimination and LP4 generation; include the all-prime characteristic-zero version and state coefficient hypotheses precisely. This supplies the former LP4/weil-approximation-equivalence delegated target. Keep the dependency LP→ES; LP4 does not import ES3 back.

## Source corrections

The ten inherited confirmed findings are retained. The defective assertions below are paraphrases, with corrected mathematical statements and locators. The historical independent erratum reviews remain attached in the packet.

### LanglandsParameterStacks/E1 — misprint

`Lafforgue-shtukas`, Lemma11.10, p.145, public French arXiv PDF read 2026-10-07.

The appended-coordinate membership uses the symbol of the global automorphic group rather than the coefficient reductive group.

**Correction.** The appended element belongs to H (the reductive group of Proposition11.7), with the specified component, not the global automorphic group G.

**Reason.** Lemma11.10 is inside the proof for an arbitrary H, and its tuple orbit lies in H^{n+1}; G is not this coefficient group.

Applies to: nothing. Correction status: new.

### LanglandsParameterStacks/E2 — error

`BHKT-local-systems`, Published Acta223 (2019) §3.1, p.14, paragraph after the very-good table.

The Lie algebra of the reductive group is described as semisimple.

**Correction.** For a general reductive group retain the central torus Lie algebra; do not assert semisimplicity of all g. The subsequent smooth-centralizer statements retain their own hypotheses.

**Reason.** Take G=G_m in characteristic3. There are no simple-factor exclusions, but Lie(G_m) is one-dimensional abelian, so not a nonzero semisimple Lie algebra.

Applies to: a stated result. Correction status: new.

### LanglandsParameterStacks/E3 — misprint

`FS-geometrization`, Proof VIII.4.1, p.292, author-hosted 356-page PDF.

The excursion construction calls the scalar square cartesian.

**Correction.** The natural reindexing square of invariant functions and maps to End(id_C) is commutative; the required proof uses commutativity, not a pullback property.

**Reason.** Take C the zero stable category, Q=1, H=G_m, Γ=1, and fold a two-element I onto one-element J. The right rings are zero, while the left rings are Z_l[t,t⁻¹] and Z_l. A pullback square would force these two left rings to be isomorphic, which they are not.

Applies to: nothing. Correction status: new.

### LanglandsParameterStacks/E4 — error

`FS-geometrization`, VIII.2.2.1, p.282, author-hosted 356-page PDF; repeated p.283.

The Hochschild degree-two discussion identifies all Hochschild classes with commutative cotangent-extension classes.

**Correction.** Use the natural map Ext¹_B(L_{B/A},B)→HH²(B/A) from commutative to associative square-zero extensions, then the Hochschild action. It is not an equality with all associative Hochschild cohomology, defined in the preceding paragraph as bimodule Ext.

**Reason.** Take A=Q and B=Q[x,y]. The cotangent complex is the free module B dx⊕B dy in degree zero, so Ext¹_B(L,B)=0. Resolve the diagonal B over B⊗_Q B by the two-variable Koszul complex on x⊗1−1⊗x and y⊗1−1⊗y. After Hom(−,B) its differentials vanish, giving HH²(B/Q)≅B, which is nonzero. B is flat and syntomic, so the displayed hypotheses do not repair the equality.

Applies to: a stated result. Correction status: new.

### LanglandsParameterStacks/E5 — misprint

`FS-geometrization`, VIII.2.4 and preceding display p.282, compared with VIII.1.3 p.279 and IX.7.1 p.334, author-hosted 356-page PDF.

The monodromy display uses the residue-cardinality scaling for the stated geometric Frobenius convention.

**Correction.** For the geometric degree used in IX.7, use q^{−deg(σ)}N and replace the preceding conjugation exponent accordingly; alternatively use arithmetic degree in both displays and explicitly invert the Frobenius chosen in VIII.1.

**Reason.** VIII.1 uses σ⁻¹τσ=τ^q, so conjugation by geometric σ sends log τ to q⁻¹log τ. IX.7 explicitly sends geometric Frobenius to1. The p.282 positive exponent uses the reciprocal convention without saying so. For split GL₂, N=E₁₂ and φ₀(σ)=diag(q⁻¹,1) give Ad(φ₀(σ))N=q⁻¹N.

Applies to: a stated result. Correction status: new.

### LanglandsParameterStacks/E6 — misprint

`FS-geometrization`, VIII.5.1 p.294; repeated in proof VIII.5.15 p.304, author-hosted 356-page PDF.

The lattice indexing the induced Borel modules is described using cocharacters.

**Correction.** Use dominant character (weight) of T to index ∇λ=H⁰(G/B,O(λ)).

**Reason.** The line bundle O(λ) is defined by a character T→G_m, belonging to X*(T), not a cocharacter G_m→T in X_*(T). The section explicitly writes G for the group being represented, so dual-side notation does not change its weight lattice.

Applies to: nothing. Correction status: new.

### LanglandsParameterStacks/E7 — misprint

`FS-geometrization`, Proof VIII.5.15 p.303, inner-automorphism case, author-hosted 356-page PDF.

The inner-automorphism discussion strengthens semisimplicity of a finite-order element to regularity.

**Correction.** Use a semisimple element inducing the prime-order inner automorphism; regularity is not available or needed.

**Reason.** In SL₃ in characteristic different from2, diag(−1,−1,1) induces an inner involution and has a non-torus block centralizer. It is semisimple but not regular. A regular semisimple centralizer would be a maximal torus.

Applies to: the proof. Correction status: new.

### LanglandsParameterStacks/E8 — misprint

`FS-geometrization`, Proof VIII.5.15 p.304, paragraph before LemmaVIII.5.16, author-hosted 356-page PDF.

The lifting argument repeats the first character symbol for the second lift.

**Correction.** The highest weight λµ of G lifts µ, the H-weight currently used in the induction.

**Reason.** The preceding construction lifts an H-weight µ to a G-weight; the next tensor is ∇λ|H⊗∇λµ|H, used to control ∇λ|H⊗∇Hµ. Lifting λ again would not provide the required H-factor.

Applies to: nothing. Correction status: new.

### LanglandsParameterStacks/E9 — error

`BHKT-local-systems`, Proof of Lemma3.11 pp.16–18, especially p.17 quotient normalisation and p.18 final appeal to Lemma3.12.

The quotient étaleness proof takes a finite Galois closure of a field extension that can be transcendental.

**Correction.** For the quotient replace L by its relative algebraic closure L₀ over Frac(O[X]^G), and use the image of Gal(L/K) on L₀. The intermediate quotient field is L₀∩E; normalise in these finite extensions.

**Reason.** L is finite algebraic over K=Frac O[X] but generally has positive transcendence degree over K₀=Frac(O[X]^G). Lemma3.12 requires a finite Galois extension of the fraction field of its base, so it cannot be applied to L/K₀. For connected reductive G, K₀ is relatively algebraically closed in K, and the relative algebraic closure L₀ is the required finite Galois extension.

Applies to: the proof. Correction status: Already identified in the atlas by confirmed RT-PAPER-BOCKLE-HARRIS-KHARE-ETAL-19/15(h,f); still present in the published Acta copy. No separate published correction was found in the checked records..

### LanglandsParameterStacks/E10 — misprint

`BHKT-local-systems`, Proof of Proposition3.13 p.18, the action map and the quotient étale point.

The formal-slice proof uses a diagonal-looking source point in place of the product of the group identity and the chosen transversal point.

**Correction.** The action map is étale at (1,x), and η//G is étale at π_{X′}(i(1,x)).

**Reason.** The printed points belong to the wrong domains. The proof immediately supplies the intended points and the correct statement of Lemma3.11 already uses the quotient point.

Applies to: nothing. Correction status: Already identified in the atlas by confirmed RT-PAPER-BOCKLE-HARRIS-KHARE-ETAL-19/15(h,f); still present in the published Acta copy. No separate published correction was found in the checked records..

## Recorded restructuring

Finding4 requires a parameter-independent structural supplier; the confirmed verifier of finding24 names an already accepted integral-representation Part II, rather than a second highest-weight owner in RG2.6.

Register RG2.6 for the non-highest-weight structural needs (fixed-group reductivity, unipotent-class finiteness and the explicitly requested root/centralizer inputs), ahead of LP1 and LP3. Extend the existing ReductiveGroupsIntegralRepresentationsPartII DESIGN brief with the highest-weight/good-filtration request and edges to LP3 and PA.1. The temporary request via its registered parent Layer9 is an extension route, not a claim that Layer9 proves modular representation theory. PA.1 retains its GL_n-specific bounds. General GIT follows the accepted LP2/LP3 and deformation-ring routes, not a new RG2.6 owner (G6). All structural supplier verification remains G1.

Finding26: duplicate integral finite-wild scheme construction.

LP1 constructs the single chosen model over Z[1/p] with Z_l base changes and the precise DHKM/FS Frobenius comparison. SR.6 imports LP1 and owns only DHKM1.7/1.8 finiteness/Hecke consequences. Do not claim canonical framed choice independence over Z[1/p].

The primary independent verifier explicitly selected ES2/ES3. Revision 2 applies that choice locally and records the external target/consumer rerouting, with no duplicate Chapter-X theorem inventory.

Follow the primary confirmed geomlanglands/6 ownership: LP4 retains representation bundles and VIII.5.1 generation/module comparison; it cites the existing LP2:integral-invariants coordinate theorem. The eight duplicate Chapter-X declarations are removed and delegatedTargets maps each former ID to its existing ES2/ES3 supplier. ES2 owns X.1.1–X.1.3 (including X.1.2), and ES3 owns X.3.1–X.3.4/X.0.1–X.0.2. Remove the generic colimit/universal-property targets from the LP4 atlas description; downstream categorical applications import their ES owners. Keep LP→ES edges and add no ES→LP4 edge. ES3 should import LP3/mapping-approximation for the shared VIII.5 Map^Σ definition. LP2 retains abstract VIII.3.7/VIII.4.1–4.3; ES0 retains the Bun_G application.

The accepted BHKT fix and accepted IHG revision 2 establish the single reconstruction owner. Local duplication is resolved; exact external prerequisite replacement and the shared field-GIT supplier are recorded separately.

IHG.0 owns general invariant pseudocharacters and IHG.1 owns general finite anchors and reconstruction. Replace the blanket LP3 prerequisites on the IHG reconstruction path, including IHG.0/invariant-evaluation, IHG.0/reductive-pseudocharacter, IHG.1/reductive-closed-orbit, reductive-stable-tuple, reductive-one-entry-extension, reductive-two-entry-extension and reductive-reconstruction with the exact unconditional LP2:excursion-presentation complete-reducibility, closed-orbit-criterion and quotients-over-fields-and-DVRs inputs as appropriate, plus an explicitly supplied generalized-reductive extension at IHG. Add excursion-presentation→IHG.0/IHG.1 and IHG.1→semisimple-characters/GS.5. Never add aggregate LP2→IHG.1. LP retains the prescribed Γ→Q fibre, its reconstruction specialization, the group-algebra trace adapter and local Weil continuity; GS.5 retains its global application. The two local generic anchor declarations are removed and mapped to IHG.1/reductive-stable-tuple. Shared general GIT inputs with LocalGaloisDeformationRingsPartIIComponentsAndNormality need exact single-owner supplier nodes under G6; RG2.6 remains structural only. The definition-level invariant evaluation must use the regular-function/coaction interface from RG2.5/SF.1 as an explicit extension; a field quotient theorem alone does not supply it over arbitrary noetherian O. At reconstruction level, use quotients-over-fields-and-DVRs for field quotient fibres, closed-orbit-criterion and complete-reducibility for connected tuple geometry, and IHG’s generalized-reductive extension for J with H-conjugation. Existing IHG invariant-evaluation, closed-orbit, stable-tuple and reconstructed-homomorphism dependencies remain; no good-prime or highest-weight theorem enters those algebraic reconstruction contracts.

Finding27 is narrowed by its verifier to SF.1 effective fpqc descent/ordinary quotient interfaces. Enhanced stacky QCoh/Perf is a separate requested foundation extension, not a duplicate proved to exist at S.1.

SF.1 owns effective fpqc descent/ordinary quotient interfaces. S.1 supplies only its scheme-perfectness interfaces. Any enhanced derived quotient-stack/QCoh/Perf request through E5 animation is an explicit extension with G3, not an already supplied S.1 theorem and not a required consequence of finding27. LP1 owns the parameter instances and their tangent/singularity calculations.

General syntomic singular-support ingredients extend existing complete-intersection direction.

R03.3 (or its Part II) supplies the explicit Gulliksen/Jørgensen/Arinkin–Gaitsgory construction in the request, using DD.0 and DGAInfinity8. LP1 applies it to parameter charts and owns their dual-Lie fibre/nullcone condition.

Finding23 and the old monodromy/continuity placement caused backwards ownership.

Unconditional invariants, coarse quotient, closed orbits, all-prime universal homeomorphism and torsion-free continuity belong in excursion-presentation. Integral-invariants has only good-prime isomorphism/cohomology/base change. Move the legacy monodromy comparison to LP1 and the legacy transition/continuity theorem to excursion-presentation, retaining their IDs and changing parentStageId. No LP3 prerequisite for semisimple reconstruction or coarse points.

## Suggested Lean boundary

The suggested file imports individual Mathlib modules and gives typed crossed-cocycle, continuous-group, coaction-equalizer, excursion-ring, invariant-tuple, prescribed-component and group-algebra prototypes, with explicit shadow scopes. Missing regular-function, group-scheme, condensed coefficient, stable infinity-category and derived-stack signatures are listed by API and test name in its omission inventory. No proposition-valued stand-in is used for missing mathematical content. The inactive TauCeti.FixedSubgroup source checks are point-group checks only; its object is absent from the existing shared build. Compilation status and exact build limits are recorded in the handoff.

