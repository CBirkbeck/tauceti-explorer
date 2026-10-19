# PKG-PhiGammaModulesAndIwasawaCohomology

Issue: #10776. Worker: Codex (GPT-6), session `codex-3xW4w9`. Date: 2026-10-19. This is a complete package submission, not a checkpoint. No second issue was claimed.

## Deliverable and scope

The package contains an eight-layer README, a compact representative `Suggested.lean`, and `topic = "math.NT"`. The README carries every retained mathematical target, its hypotheses, source locators, intended API, discriminating Checks and layer dependencies. Heavy arithmetic carriers remain README targets. The Lean file defines only tensor contraction, inverse-linearization ψ, rank-one ψ, native fixed/kernel/cokernel expressions and component maps on existing linear-map carriers. It states representative milestones, including the corrected chain section and both nonzero homotopy equations. Nothing here claims a formalization of the arithmetic theory.

The accepted input has 98 nodes, 102 API items, 102 tests and 26 planets. The coverage table below accounts for all nodes: 85 are retained, sometimes narrowed, and 13 are supplied elsewhere and removed from the target list. Three Wach planets are consequently removed, leaving 23 recommended planets. The packet, campaign files and all other jobs' files are unchanged.

## Current upstream and ownership audit

Read the current TauCetiRoadmap checkout, including the nine roadmaps newer than the atlas snapshot and the Completed roadmaps. Its checkout commit was `0d144d04`; the current Tau Ceti library was `a91d3aaf`. No lake command was run there. The writing models read were ProfiniteArithmetic and Completed/RestrictedProducts, with their Suggested files; LocalGaloisGroups was also inspected for the character interface. Mathematical searches covered the structures and hypotheses, not only the proposed names.

The PadicHodgeTheory package has evolved since the input review: use its actual §§4.1, 4.3–4.5 and 7.5–7.6, rather than the old inferred section locators. The current LocalGaloisDeformationRings upstream PR 923 head `75c459351afb7877196d3ed6418e4c0dbcacbc05` was read for §0.4. PadicMeasuresIwasawaAlgebras main was read through blob `93a23f`; RigidAnalyticGeometry main through blob `d2c906`. The latter does not supply analytic blowups or the required flattening theorem.

All twelve baseline declaration statements were read at the pins: TensorProduct lift/ext, ModuleCat.ofHom, native cochain-complex constructors, native Homotopy and its homology equivalence, native module-cycle/homology identifications, the cyclotomic character, and Tau Ceti explicit cup/transfer. The current completed-group-algebra and Fitting-ideal sources were also read. Mathlib already proves `cyclotomicCharacter.continuous`; the roadmap does not plan that theorem again. Tau Ceti's explicit continuous cup and transfer allow topological coefficients; their supplier contract is not artificially restricted to discrete coefficients.

Removed targets are listed individually in the coverage table. Their exact suppliers are:

- PadicHodgeTheory §4.1: norm field and classical period coefficients.
- PadicHodgeTheory §4.3: Fontaine D, V and their equivalence, including rational overconvergence.
- PadicHodgeTheory §4.4: the Wach object, existence, height, crystalline comparison and reconstruction.
- PadicHodgeTheory §4.5: field-valued Herr comparison, Euler characteristic and duality. The retained Herr targets add explicit algebra, integral/affinoid coefficients or the residue scalar.
- PadicHodgeTheory §§7.5–7.6: integral local-system and Frobenius-cohomology roofs and the nonequivariant all-module bundle/B-pair comparison.
- VectorBundlesAndIsocrystals VB4: the pure-local-system definition and sheaf equivalence. The retained pure theorem is the global-ring statement with a global pure model.
- LocalGaloisDeformationRings §0.4: ordinary finite local Artinian Herr/Ext. The retained localized Artinian category inverts t and assumes an underlying stable lattice; it is not a duplicate of the ordinary category.

The README's boundary contracts also cite the existing ClassFieldTheory Layers 7–9, LocalFieldsRamification Layer 2 and AdicSpaces Layer 6. It does not re-plan reciprocity, unramified extensions or the curve. Current Tau Ceti completed-group-algebra, character-division and Fitting-ideal APIs replace generic library-integration references.

## Dependency decisions and moves down

1. The relative analytic Γ rings, annulus variants and affinoid Mellin extension are constructed here in §4.1. The scalar transform in LocallyAnalyticDistributions §3.3 does not imply these coefficient variants by itself. Compact character spaces remain with that supplier, and the ℤ_p-unit universal character is the existing PadicMeasuresIwasawaAlgebras §3a.1 / PadicFunctionalAnalysis §§5.1–5.3 interface.
2. ArithmeticGaloisDuality retains its finite/compact cochain contract. The additional Banach-coefficient period acyclicity is explicitly a target here in §3.6, proved through Tate–Sen projections and strict completed tensor arguments.
3. The elementary ℚ_p character cohomology and field rank-one classification were placed in §3.5, before relative finiteness and the nontrianguline vanishing argument. This avoids using family classification or global triangulation to prove their own prerequisites.
4. Minimal local Bloch–Kato H_e and its exponential move down into §5.7. The higher regulator roadmap cannot supply this prerequisite upward. Its general regulators remain elsewhere; the maintainer should point its local exponential dependency here. H_f from Selmer theory is not substituted for H_e.
5. The exact Rees-chart blowup and Fitting-image flattening needed by triangulations are constructed in §7.6, rather than attributed to a general rigid flattening theorem absent from the supplier. Ordinary compatibility is flat base change; componentwise dominant maps use explicitly defined dominant transforms.
6. No GL₂ involution or radius-semilinearity theorem is promised. The DLB application supplies only the all-level exponential criterion and the qualified annular generation result. Nontriangulinity is explicit for that consequence.

## Source work and the twelve inherited gaps

This is source-based target planning, not a claim that source arguments have been formalized. Every inherited gap has a specified proof route and exact hypotheses in the README. The unknown numerical residue scalar is deliberately retained, as the accepted input permits.

| Inherited gap | Reading and package resolution |
| --- | --- |
| Integral overconvergent lattices | Read CC-1998 §§III.2–III.5, including the trace estimates and matrix correction. §1.3 gives the intersection D(T)∩D†(T[1/p]), the integral descent route and its lattice API. |
| Small unipotent groups | Read KL-I Proposition 3.2.9 and the preceding descent, with KL-II Appendix A. §0.5 specifies BCH, Greenberg realization, central additive quotients and the exact n bound, including p=2. |
| All-module/sheaf descent | Read KL-I §§8.6 and 9.5 and FF 11.5.1. §§1.4–1.6 specify contracting-complement descent, Γ equivariance, components and the common B-pair roof; §3.9 adds the Γ cohomology triangle. |
| Coordinate topology | Read CC's topology warning and the Frobenius-coordinate constructions. §2.5 separates rational trace/p from integral zeroth-coordinate extraction, proves continuity through actual coordinates and limits the universal weak-topology claim. |
| Period acyclicity/integral Herr | Read Pottharst 2.8/2.9 and the original CC finite/integral sequence argument. §3.6 separates ASW, compact lattice limits and Banach Tate–Sen contraction, including strict tensor exactness. |
| Dyadic integral descent | §3.7 spells out the alternating C₂ resolution, its totalization and Hochschild–Serre roof over the torsion-free tower. It never averages by two; §5.1 uses the cofinal μ₄ tower. |
| Residue normalization | §3.8 carries the nonzero C_p with Res^γ=C_p·TateInvariant; §5.5 carries the same scalar, logχ factors and inverse-generator adapter. No reported numerical value is asserted. |
| Integral derived Iwasawa | Read CC-1999 II.1.3, the cochain/norm maps in II.2 and both assertions in II.3.1 plus Remark II.3.2. §5.1 specifies the derived tower map and degree-two identification, compactness and stabilized fixed-submodule argument. |
| DLB inputs | Read Colmez VI.4.13–VI.4.16 and DLB 8.3/§12.1. §5.7 spells out the de Rham obstruction and t-lattice criterion. §5.6 separately proves both ψ cokernel vanishings under the explicit rank-two localized nontriangulinity hypothesis before annular scalar extension. |
| Wach ψ and good bases | Read original Berger-exp A.3 and LLZ-2010 3.5/3.15, not just the 2011 recall. §§6.2–6.3 retain p odd for the good-basis proof, prescribed rational versus integral bases, the explicit twist and the no-trivial-quotient condition. |
| Relative realization/uniform finiteness | Read KL-families 3.11/3.12 and KPX §§5.1–5.3. §§1.2 and 4.3 specify effectivity, determinant covers, uniform generator and relation bounds and extension devissage, before perfectness/base change. |
| Flattening/rank-one descent | Read the full KPX 6.2.13–6.2.20 and 6.3.5–6.3.13 arguments. §§7.4 and 7.6–7.8 include graph quasicompactness, nilpotents, Rees charts, Fitting-image flattening, final kernel modification and the special-fiber algebraic correction. |

Freely readable source PDFs were held only in disposable scratch. The two cleared KL manuscripts were read in the maintainer's library; neither their files nor extracted passages were copied. The README contains original mathematical descriptions and source locators, not source excerpts or a section-by-section précis.

### Source correction needing maintainer attention

KPX-v3 Corollary 6.3.6 says the blowup construction commutes with dominant base change, using an unrestricted base-change assertion in its proof. An ordinary fiber-product interpretation is false even on reduced spaces. The README records the counterexample A=E⟨X,Y⟩→B=E⟨X,T⟩, Y↦XT: (X,Y) extends to the invertible ideal (X), but the pulled-back X-chart has equation X(U−T)=0 and a vertical component X=0. The dominant transform U=T is the correct blowup. The package therefore asserts flat ordinary base change and explicitly defines componentwise dominant transforms. Global canonical data retain KPX Remark 6.3.11's dominant **flat** compatibility. This correction does not require changing another job's files.

Other source corrections incorporated: KL-I's free-cover top-left-block and ASW fixed-basis/diagonal-descent errata; the Berger 2026 Wach étaleness erratum; the distinction between KL-families direct realization and its converse small-Frobenius effectivity theorem; exact theorem/lemma labels and page numbers for KPX, Berger, LLZ and Ding. The φᵃ descent coefficient extension is stated only over an 𝔽_{pᵃ} base. The finite torsion component of a full procyclic generator exponent is specified separately from its ℤ_p component.

## Mandatory adversarial mathematics pass

All claims, including the assertions bundled into each subsection and their named APIs, were checked against the stated domains and the instances below. This is a self-check required for packaging, not the independent package review. Arithmetic carrier theorems remain README targets; the Lean build verifies only the typed signatures.

| Statements checked | Instances and adverse controls | Result / correction |
| --- | --- | --- |
| Conventions, suppliers and scalar restrictions | χ(1), Tate basis, crystalline t⁻¹ basis; ramified K; p=2 finite factor; continuous versus discrete coefficients | φ(e_1)=e_1, γ(e_1)=χe_1, φ(t⁻¹e_1)=p⁻¹t⁻¹e_1. Preserved the opposite Hodge–Tate sign and full coefficient/component data. |
| §0.1 linearized modules, tensor/dual/maps | Zero module; σ=id; σ(U)=U^p on 𝔽_p[U]; zero F | Invertible linearization does not mean F surjective. Zero F excluded on nonzero M. |
| §0.2 covers and φ cohomology/Ext | Free and zero M; nonprojective finite M; F=id; Frobenius on U | Restored the finite-generated cover assertion separately from projective kernel/splitting. Differential is only fixed-scalar linear. Correct skew-resolution orientation retained. |
| §0.3 fixed idempotents and basis torsor | Connected field; 𝔽_p×𝔽_p; varying ranks; zero invariant tuple | Fixed ring is locally constant, not diagonal 𝔽_p. Determinant-open basis condition and rank clopens required. |
| §0.4 ASW equivalence/projectivity | n=1,2; a>1 over 𝔽_p; swapped components; W₂/p; J=(T) in perfect closure | Added the 𝔽_{pᵃ} base for constant φᵃ coefficients. Diagonal action required; p-flatness and φ(J)=J cannot be weakened. |
| §0.5 BCH, Greenberg and Lang | g=0; strict upper triangular 2×2; p=2,n=1 versus n=2 | exp( X )=1+X for X²=0. Retained n≥2, or n≥1 for odd p; finite-level solution cover is not a global trivialization. Added the natural φ-conjugacy/constant-group H¹ bijection, including its torsor orientation and pointed-class test. |
| §1.1 components and annuli | A=E; split tensor; ramified K′/K; basis indices i=0,…,p−1 | Correct finite-free direction and both extension indices. Retained F′_K and radius scaling. |
| §1.2 relative/radius category and realization | Rank zero; nonfree projective; infinitesimal A; differing radii | Radius descent starts already for φ-modules. Γ action descends at a common radius; field fibers alone do not prove effectivity. |
| §1.3 integral/extended lattices and torsion | T versus pT; p-primary torsion; non-Γ-stable φ lattice; mod p trace | Corrected intersection to D†(V), not its larger Robba extension. Integral ψ is constructed before reduction/division. |
| §1.4 extended equivalences/decompletion | Étale line; nonzero-slope line; Γ forgotten | Arbitrary-module assertion includes non-étale modules but requires the cyclotomic Γ estimates. |
| §1.5 global pure comparison | c=0,d=1; common multiples; pointwise purity without global lattice | Explicit global model hypothesis retained; local-system definition imported from VB4. |
| §1.6 equivariant roofs and operations | Unit; Tate twist; K′/K trace; nontrivial descent character | The same localized maps identify the two routes; extension degree contains both component and coset indices. |
| §2.1 balanced tensor ψ | 2⊗3; r=0; two coordinate projections | Values 6,0 and the chosen component distinguish balancing and normalization. Uses actual tensor lift. |
| §2.2 inverse linearization, uniqueness, naturality, semilinearity, continuity | L multiplication by 2; r(1)=0; mod 5; finite coordinate expansion | ψ(6)=3. Left inverse requires r(1)=1. Lean continuity signature matches the explicit finite-coordinate statement, without hidden period estimates. |
| §2.3 rank-one formula/covariance | a=2,−1; a=0 excluded; swapped product ring; e′=be | Values 3,−7 and (1/3,1/2); φ(b)ab⁻¹ and inverse coordinate b⁻¹ fixed. No pullout of a⁻¹ through ψ. |
| §2.4 projection/splitting/1−φ | φ=ψ=id; polynomial φ(U)=U³ with ψ selecting multiples of 3; γ absent | P(U)=U, P(U³)=0; ψ-fixed polynomials are constants. Kernel theorem valid, unconditional surjectivity false. |
| §2.5 period and module ψ topology | Zeroth/other Frobenius basis coordinates; integral mod p; rank-one nonconstant a; universal weak topology | Integral extraction precedes rational trace/p. Actual fixed-ring coordinate continuity required; CC weak-topology warning retained. |
| §2.6 native complex and maps/H¹/H² | ψ=id, ψ=0, zero module, composite maps | Degrees 1,2, genuine kernel and quotient. ψ=0 has both cohomology groups zero; ψ=id has both equal M. |
| §3.1 Herr differentials/maps | φ=2,γ=3; trivial operators; composites 2 and 3 | d⁰(7)=(7,14), d¹(5,11)=−1; wrong plus sign gives d¹d⁰(1)=4. |
| §3.2 signed map, surjectivity, kernel | φ=ψ=id; polynomial U,U³; γ=id on nonzero kerψ | Maps are id,diag(−ψ,id),−ψ. Graded surjection is not enough for a quasi-isomorphism. |
| §3.3 resolvent/section/homotopy/equivalence | q=0; polynomial model with γ=2id; γ=id obstruction | S¹(0,U)=(−U,U), S²(U)=−U³, H²(U)=(U,0). Recomputed Bq=qB=P, FS=id and id−SF=dH+Hd; added both homotopy component equations to Lean. |
| §3.4 powers, genuine generators, Δ | n=0,1,3; G=2; characteristic 3; odd finite torsion; dyadic sign | Q₀=0,Q₁=id,Q₃=7id; G=id over 𝔽₃ gives Q₃=0. Restricted ℤ_p exponent to the principal subgroup and tracked the full pro-order exponent. Computed the Γ-action homotopy H¹(a,b)=Q_n b, H²(c)=(Q_n c,0), including n=0,1. |
| §3.5 arithmetic inverse, ℚ_p lines and field classification | Zero kerψ; arbitrary γ=id model; δ=1,x,x|x|; exceptional/unexceptional slopes | Tate line differs from x; h¹=1+h⁰+h². Early field classification and radiuswise rank-one saturation remove a forward dependency. No integral-lattice inverse is asserted. |
| §3.6 integral/affinoid comparison and period acyclicity | Finite p-torsion; lattice limits; A with nilpotents; completed tensors | Separate ASW and Banach routes. Strictness and contraction hypotheses explicit; compact limits do not assert every transition is onto. |
| §3.7 integral p=2 descent | C₂ over 𝔽₂ and ℤ₂; sign representation; torsion-free subgroup | Positive-degree group cohomology survives integrally; bar resolution alternates 1−s and 1+s. No /2. |
| §3.8 cups, residue and field maps | (1,0) cup (0,1), reversed pair; χ_ur and κ(p); generator change; K′/K | Cup values −1,+1 fix sign; arithmetic Tate invariant +1 corresponds to C_p in residue normalization. logχ denominator is nonzero. |
| §3.9 localized Artinian Ext and Γ roof | D versus t^mD; non-étale localized line; no A-stable lattice; trivial cups | Colimit independent of underlying stable lattice; no stronger coefficient-stable lattice inferred. Degree-two BHS sign adapter retained. |
| §4.1 relative Mellin/rings and coadmissibility | A=E; both dyadic components; inverse coordinate near zero; unbounded presentation sizes | Entire-disc ring distinguished from Robba Γ ring. Uniform bounds on relations as well as generators required. |
| §4.2 ψ cokernel, t quotient and finite resolution | M=0; threshold n≠0; nilpotent coefficients; quotient cone | Single-t Herr cohomology finite in degrees 0,1; ψ−1 onto with stated length-one projective resolution. Individual t_σ perfect complexes kept distinct. |
| §4.3 uniform finiteness proof | Zero ranks; nonunit determinant; unbounded fiber presentations; A_red versus A | Actual determinant cover and uniform relations supplied before global perfectness. Nilpotents handled by devissage. |
| §4.4 perfectness, Euler and duality | Trivial and Tate lines; rank zero; H¹ torsion | Euler −[K:ℚ_p]rank. ψ complex remains perfect of amplitude [0,2], not [1,2]; no false flatness of H¹. |
| §4.5 derived coefficient change and Tor | E⟨X⟩ --X→ E⟨X⟩ specialized at X=0; flat maps | Extra H⁰ appears through Tor. README analytic example and Lean ℤ→𝔽₂ instance express the same general nonflat phenomenon on different explicit base rings. |
| §5.1 tower map, H¹/H² and derived limits | Zero T; ψ=id indexing; degree-p norms; μ₄ tower | Corestriction maps Q_p,diag(Q_p,id),id. Corrected eventual triviality claim to stabilization of fixed submodules of the finitely generated ψ cokernel. |
| §5.2 functoriality and characters | η=1; character of order >2; field norm; dyadic sign | Inverse twist fixed; derived Tor retained; full completed group algebra used. |
| §5.3 deformation, universal resolution and duality | η=1 and nonquadratic η; nonflat specialization; inversion twice | Universal Γ action is [γ]⁻¹, coinvariant M in degree one gives [−1]; ι retained in duality. |
| §5.4 analytic Iwasawa comparison | Field/lattice route; pT; nonflat affinoid map | Agreement with independent tower comparison; ordinary tensor only under the exactness hypotheses. |
| §5.5 pairing, residue and specialization | Nonquadratic character; generator log; invariant +1; zero and trace | Removed unconditional nondegeneracy on ψ-fixed vectors. Perfect ψ-zero pairing and double-vanishing ψ-fixed theorem distinguished; C_p carried. |
| §5.6 generation/nontrianguline vanishing | Polynomial counterexample; only one cokernel zero; rank-two trianguline module; Robba scalar extension | Both vanishings essential; their rank-two proof uses character quotient, top-degree base change, field duality and saturation. No generation over distributions alone. |
| §5.7 exponential and DLB t lattice | V=0,ℚ_p,ℚ_p(1); constant de Rham obstruction; trianguline V | H_e distinguished from H_f. t factor retained, weights converted to standing sign. Nontriangulinity explicit for annular generation. |
| §6.1 unramified Wach and coefficient change | Identity; unit lattice; unramified tower; ramified extension; finite flat coefficient square | Only finite unramified field extensions asserted; canonical maps fixed through the embedding and uniqueness. Finite flat coefficients preserve height and reduction; nonflat extension is not inferred. |
| §6.2 good bases and coordinates | Unit/constant basis change; nonconstant B; p=2; explicit m-twist | p odd retained. Integral congruence-basis theorem distinguished from arbitrary prescribed crystalline integral basis. Coordinates use inverse induced φ(B) matrix. |
| §6.3 Wach fixed vectors and pole bound | a=0; trivial quotient; T versus pT; ψ((1−φ)x) | π^{a−1} bound versus improved π^a bound distinguished. Integral equality uses no trivial quotient; sign agrees with downstream image. |
| §7.1 general character lines and t_σ | K=ℚ_p; δ=1,x,x|x|; distinct embeddings; product t | Tate parameter N|N|. General-K construction does not copy the ℚ_p coordinate formula. Period ideals are canonical, generators only up to units. |
| §7.2 field cohomology/submodules/classification | Trivial/Tate/nonexceptional characters; t_σ powers; K≠ℚ_p | Exceptional exponent inequalities retained, all m_σ≥0; field classification precedes families and descends from a finite slope-splitting field if needed. |
| §7.3 Artinian weights, constant characters and local algebraicity | Algebraic power; finite order; 1+εlog; Tate character; nonfaithful reduction | Weight ε survives and is not an integer in A. Constant concerns coefficient variation and differs from smooth. Added logarithm/exponential proof over the whole Artinian algebra; BHS notation and KPX Sen lemma supply exact definitions. |
| §7.4 families, de Rham lines and graph descent | Character line; nontrivial coefficient line; dual numbers; escaping components; ramified finite-order and unramified slope characters | Parameter unique, line only up to isomorphism. Field de Rham criterion uses the actual period functor and supplied labelled character theorem, allowing non-étale slopes. Formal fibers and quasicompactness required; point bijection alone rejected. |
| §7.5 saturated/strict/dense notions | Rank one/zero; repeated parameter split rank two; tR⊂R; dense cover | Projective quotients required. Strictness is stronger than existence; density on chosen admissible cover does not mean density in every subdomain. |
| §7.6 blowups, flat images and perfect flattening | Unit/invertible ideal; A --X→ A; zero-divisor minor; dominant Y↦XT | Flat image is not flat cokernel. Corrected unrestricted dominant ordinary base change using the explicit vertical-component counterexample and dominant transform. All denominators live in localized saturated Rees charts. |
| §7.7 quotient/kernel and bad locus | Rank one; bad fiber; smooth curve; nonreduced X | Final kernel flattening required; cokernel may be t-power torsion. Reducedness essential, canonical pullback limited to dominant flat maps. |
| §7.8 coherent flag and special fibers | Rank one/zero; repeated parameters; good split family; t_σ^mR(δ) | First grade is character line; global flag can fail saturation. Unsaturated parameter δx_σ^m becomes δ after saturation; special-fiber exponents need not vanish. |
| Lean signature generality and denominators | Arbitrary commutative scalar rings and modules; zero maps; units a,b; finite continuous coordinates | No arithmetic carrier introduced by sorry; no hypothesis contains its conclusion. Unit inverses and log/nonzero divisors have explicit hypotheses. Every light definition has computed examples. |

## Coverage of the accepted nodes

The `PG.k/...` identifiers below refer to the accepted input only; they do not appear in the upstream-facing roadmap. Each retained subsection includes the node's API and tests, combined with closely related nodes into prose. Imported portions appear only in boundaries/supplier contracts, never as receipt targets.

| Input node | Disposition / README location |
| --- | --- |
| `PG.0/phi-module` | Retained in §0.1 |
| `PG.0/free-cover` | Retained in §0.2 |
| `PG.0/phi-cohomology` | Retained in §0.2 |
| `PG.0/field-of-norms` | Removed target; import PadicHodgeTheory §4.1 |
| `PG.0/cyclotomic-coefficients` | Retained in §1.1 |
| `PG.0/coefficient-actions` | Retained in §1.1 |
| `PG.0/etale-phi-module` | Retained in §1.3 |
| `PG.1/fontaine-D` | Removed target; import PadicHodgeTheory §4.3 |
| `PG.1/fontaine-V` | Removed target; import PadicHodgeTheory §4.3 |
| `PG.1/fontaine-equivalence` | Removed target; import PadicHodgeTheory §4.3 |
| `PG.1/torsion-rational-compatibility` | Retained in §1.3 |
| `PG.1/rank-one-dictionary` | Retained in §3.5; 7.1 |
| `PG.1/frobenius-idempotents` | Retained in §0.3 |
| `PG.1/asw-fixed-basis` | Retained in §0.3 |
| `PG.1/asw-equivalence` | Retained in §0.4 |
| `PG.1/asw-projectivity` | Retained in §0.4 |
| `PG.1/unipotent-lang` | Retained in §0.5 |
| `PG.1/perfectoid-integral-local-systems` | Removed target; import PadicHodgeTheory §7.5 |
| `PG.1/pure-local-systems` | Removed target; import VectorBundlesAndIsocrystals VB4 |
| `PG.1/pure-equivalence` | Retained in §1.5 |
| `PG.1/etale-phi-cohomology` | Removed target; import PadicHodgeTheory §7.6 |
| `PG.2/cherbonnier-colmez` | Retained in §1.3 |
| `PG.2/radius-models` | Retained in §1.2 |
| `PG.2/etale-tilde-equivalence` | Retained in §1.4 |
| `PG.2/all-module-decompletion` | Retained in §1.4 |
| `PG.2/period-sheaf-equivalences` | Retained in §1.6 |
| `PG.2/realization-operations` | Retained in §1.6 |
| `PG.3/herr-differentials` | Retained in §3.1 |
| `PG.3/herr-complex` | Retained in §3.1 |
| `PG.3/herr-functoriality` | Retained in §3.1 |
| `PG.3/signed-phi-psi-map` | Retained in §3.2 |
| `PG.3/signed-map-surjectivity` | Retained in §3.2 |
| `PG.3/signed-map-kernel` | Retained in §3.2 |
| `PG.3/kernel-resolvent` | Retained in §3.3 |
| `PG.3/kernel-resolvent-identities` | Retained in §3.3 |
| `PG.3/herr-comparison-section` | Retained in §3.3 |
| `PG.3/herr-section-right-inverse` | Retained in §3.3 |
| `PG.3/herr-comparison-homotopy` | Retained in §3.3 |
| `PG.3/herr-comparison-equivalence` | Retained in §3.3 |
| `PG.3/herr-generator-map` | Retained in §3.4 |
| `PG.3/herr-generator-isomorphism` | Retained in §3.4 |
| `PG.3/arithmetic-herr` | Retained in §3.4 |
| `PG.3/analytic-kernel-inverse` | Retained in §3.5 |
| `PG.3/galois-herr-comparison` | Retained in §3.6 |
| `PG.3/herr-cup` | Retained in §3.8 |
| `PG.3/herr-tate-duality` | Retained in §3.8 |
| `PG.3/herr-field-maps` | Retained in §3.8 |
| `PG.3/integral-two-descent` | Retained in §3.7 |
| `PG.3/herr-ext` | Removed target; import LocalGaloisDeformationRings §0.4 |
| `PG.3/localized-herr` | Retained in §3.9 |
| `PG.3/period-sheaf-cohomology` | Retained in §3.9 |
| `PG.4/balanced-psi` | Retained in §2.1 |
| `PG.4/linearized-psi` | Retained in §2.2 |
| `PG.4/linearized-psi-pure` | Retained in §2.2 |
| `PG.4/linearized-psi-left-inverse` | Retained in §2.2 |
| `PG.4/linearized-psi-uniqueness` | Retained in §2.2 |
| `PG.4/linearized-psi-naturality` | Retained in §2.2 |
| `PG.4/linearized-psi-semilinear` | Retained in §2.2 |
| `PG.4/linearized-psi-continuity` | Retained in §2.2 |
| `PG.4/rank-one-psi` | Retained in §2.3 |
| `PG.4/rank-one-left-inverse` | Retained in §2.3 |
| `PG.4/rank-one-basis-covariance` | Retained in §2.3 |
| `PG.4/psi-zero-projection` | Retained in §2.4 |
| `PG.4/psi-zero-splitting` | Retained in §2.4 |
| `PG.4/psi-one-to-zero` | Retained in §2.4 |
| `PG.4/period-psi` | Retained in §2.5 |
| `PG.4/period-module-psi` | Retained in §2.5 |
| `PG.5/psi-complex` | Retained in §2.6 |
| `PG.5/psi-complex-functoriality` | Retained in §2.6 |
| `PG.5/psi-complex-h1` | Retained in §2.6 |
| `PG.5/psi-complex-h2` | Retained in §2.6 |
| `PG.5/integral-iwasawa-comparison` | Retained in §5.1 |
| `PG.5/iwasawa-functoriality` | Retained in §5.2 |
| `PG.5/finite-character-specialization` | Retained in §5.2–5.3 |
| `PG.5/iwasawa-pairing` | Retained in §5.5 |
| `PG.5/analytic-iwasawa` | Retained in §5.4; 5.6 |
| `PG.5/analytic-bloch-kato-image` | Retained in §5.7 |
| `PG.6/wach-module` | Removed target; import PadicHodgeTheory §4.4 |
| `PG.6/wach-existence` | Removed target; import PadicHodgeTheory §4.4 |
| `PG.6/wach-height` | Removed target; import PadicHodgeTheory §4.4 |
| `PG.6/wach-dcris` | Removed target; import PadicHodgeTheory §4.4 |
| `PG.6/wach-reconstruction` | Removed target; import PadicHodgeTheory §4.4 |
| `PG.6/wach-unramified-base-change` | Retained in §6.1 |
| `PG.6/wach-good-basis` | Retained in §6.2 |
| `PG.6/wach-iwasawa` | Retained in §6.3 |
| `PG.7/relative-category` | Retained in §1.2 |
| `PG.7/relative-representation-realization` | Retained in §1.2 |
| `PG.7/psi-cokernel-finiteness` | Retained in §4.2 |
| `PG.7/relative-perfectness` | Retained in §4.1; 4.3–4.4 |
| `PG.7/derived-base-change` | Retained in §4.5 |
| `PG.7/cyclotomic-deformation` | Retained in §5.3 |
| `PG.7/rank-one-characters` | Retained in §7.1 |
| `PG.7/character-cohomology` | Retained in §7.2 |
| `PG.7/triangulation` | Retained in §7.5 |
| `PG.7/global-triangulation` | Retained in §7.6–7.8 |
| `PG.7/triangulation-specialization` | Retained in §7.8 |
| `PG.7/character-weights` | Retained in §7.3 |
| `PG.7/rank-one-classification` | Retained in §7.4 |

## Recommended planets

| Layer | Retained planets |
| --- | --- |
| 0 | Frobenius modules; Frobenius-fixed basis torsor; Artin–Schreier–Witt descent |
| 1 | Robba decompletion; Relative Robba modules |
| 2 | Module psi operator; Rank-one psi; Psi-zero projection; One minus Frobenius; Psi complex |
| 3 | Herr complex; Phi-to-psi comparison; Psi-zero resolvent; Herr comparison homotopy; Phi-psi homotopy equivalence; Herr–Galois comparison |
| 4 | Relative cohomology theorem |
| 5 | Iwasawa–ψ comparison; Derived character specialization |
| 6 | Good Wach basis |
| 7 | Character-type Robba modules; Saturated triangulations; Global triangulation theorem |

Removed planets: Wach modules, Crystalline Wach existence, Wach reconstruction. Their results are already PadicHodgeTheory §4.4 targets; the package does not display them again. The native Herr planet refers to the explicit algebra/integral-affinoid additions, and the relative Robba planet to general affinoid coefficients, so neither duplicates the imported field theorem.

## Source version manifest

Retrieved/read 2026-10-19. Public PDF hashes below identify the linked README versions; no PDF is included in the submission. Colmez-Iw-1998 was downloaded as a lead but is not a source for the deliverable and is omitted.

| Source | SHA-256 |
| --- | --- |
| BHS-2019 | `34ffd69795468054b4caab7847d5ae90393826c889b187397dbe53e16993967a` |
| Berger-Wach-2004 | `52e188211dfba449a92e5a8a66cc65379fe17688e6384a8eb6ece3a19a932110` |
| Berger-errata | `bb42b4f8d684882625adb4b0994cbaeb214141522d4f7ac27237e69317e92f5d` |
| Berger-exp-2003 | `63c3f790eaf3cd3dea7c80c24fc69c51e3408323d39f6cfadd6aabc35520e3a6` |
| Berger-intro | `fac038cb2e7a3c939f7b0c85d1060985876abc5d55407d7172fc1f6f2cc16ecc` |
| CC-1998 | `cee9e8588ba1042fd0c52edc132eb3476b8ae9b65df6456047306d67118beb3f` |
| CC-1999 | `d8f422d1f02a116ad3387826ec1947f8fa1afcac4ed8b89b6564e0e9f245f395` |
| Colmez-GL2-2010 | `ccf1a070d4fd5d8b5aaf14591fd0c7390f4ec048c986b1f88a32e90f8c933568` |
| DLB-2017 | `00fb89502da84ea38738734652733ea6487e13686a8e54d32eecf4575d6b0094` |
| Ding-2025 | `741a49c0677a77b22c9759a016e215882b70dc760eb9e41fd2fe45cc633d05ba` |
| FF-2018 | `cc159f38a3801c736b71ecea363496abe7706550bfb416600718ee9933922ca3` |
| KL-families-2010 | `2cd3c9c936458c8d315bd4f3d77a2783e6d36c6d81c41f1683d64829b720842a` |
| KPX-v3 | `dfd271fa2ef3f329b717ad02637f77def77295bb9197843eba8851fde9212b8c` |
| LLZ-2010 | `d0ce93d50a6734424baf1360982c7835570b761ed31fb8f0d184778510705dfe` |
| LLZ-2011 | `e8c488028a3000313db2fee031506f1bb8414ec71af54b80ca97f01982b6950c` |
| Liu-triangulation-2012 | `7ebfb622040a56c77da02e4b23a9c9bd5eefb8ca8663447f1d9fe2648087d73b` |
| Pottharst-2013 | `41410c5e95be1f5e6db08b3176563b8d3076d3dacdf924ddd9f809b448190f9e` |
| KL-I, cleared manuscript | `a6a117423db62aec072442bb15b70e3175bcc3b631bdcd6d74f740e3c6cfd942` |
| KL-II, cleared manuscript | `97383900492daf1c6778959c37e993f67dd5ad379ac03c31049b870382e5d42c` |

## Validation and remaining work

- `python3 scripts/check_blueprint.py research/blueprint/packets/PhiGammaModulesAndIwasawaCohomology.json`: 0 errors, 0 warnings. This validates the unchanged accepted input, not arithmetic proofs.
- `python3 scripts/check_sorry_data.py research/blueprint/packages/PhiGammaModulesAndIwasawaCohomology/Suggested.lean`: passed.
- `lean-check` on the package Suggested file: exit 0, only declaration-uses-`sorry` warnings. The final file has 311 lines and no admitted data. Memory was checked before compilation; the final check had 82 GiB available. Shared build pins: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`.
- `python3 research/blueprint/intake.py check-files` on the four deliverables: 4 files, 0 problems. Whitespace and changed-path scope were also verified before submission.

No implementation or source-reading blocker remains for this package submission. The numerical value of C_p is intentionally unspecified and consistently propagated; this is the accepted qualified interface, not an equality to a guessed constant. Independent package review and the maintainer's upstream port remain separate work. All necessary continuation information is in this note; disposable scratch is deleted after the PR and submission checks.
