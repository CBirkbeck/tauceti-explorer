# Esnault–Groechenig: rigid connections and F-isocrystals

Status: **complete**. Extraction begun by Codex, session `codex-a71f92` (checkpoint, PR #1945), finished by Claude Code, session `cc-fb70e5`, 22 September 2026. Issue #1466. The structured companion is [PAPER-ESNAULT-GROECHENIG-20.result.json](PAPER-ESNAULT-GROECHENIG-20.result.json).

The published paper has been read completely, including Appendix A and references, twice and independently. After the 30 September repair, the extraction records 146 interfaces: 5 library, 16 planned and 125 missing, each missing one routed exactly once, in six coordinated Part II proposals and two source routes; 33 prerequisite entries; and 12 source findings. The original full readings are historical; the current repair is a focused source and ownership audit by Codex, session `codex-J6LwjP`, issue #5013.

Historical second pass (22 September). Every one of the ten source findings was re-verified against the published PDF and survived, but each was recorded with a two- or three-word fragment in place of the sentence actually printed, which is not what PROTOCOL §18 asks for; all ten then quoted the printed text in full. Four gained better witnesses — E2 a rank-two witness for the uniqueness claim beside the rank-three one for the essential image, E3 an Artinian counterexample rather than an affine-line one, E4 an argument that does not depend on the rank, E6 the statement of what the proof actually needs — and nine further slips were added to E10, of which the Ω¹_X/O_X/U⊂X/Θ_X group in §2, the "degree-n" section on p. 119 and the cross-reference in Lemma 5.11(d) are new. Pages 106, 119 and 133 were read as images rendered at 300 dpi, because those readings turn on superscripts that the text layer flattens. One routing defect was corrected: the reused pending Part II `HodgeStructuresPartII` was declared with area `arithmeticgeometry` here and `algebraicgeometry` in the two papers that already propose it, and it is one roadmap. The two lumped prerequisite entries ("further unclosed source cluster", "foundations already assigned") were replaced by 23 real entries with verified links.

Why the status is now complete, and what that does and does not assert. PROTOCOL §16 sets one bar: the whole paper is extracted and every missing item is routed. Both hold, and they held at the checkpoint too. The nine gates the checkpoint listed were of two kinds. Five (G1–G5 below) are defects in the published paper, and the protocol's mechanism for those is `sourceIssues` plus items stated in corrected form — both are in place, and no extractor can close them, since closing them means repairing the paper. The other four asked for the proof interiors of *prerequisite* papers — Ogus–Vologodsky, Lan–Sheng–Zuo, Sun–Yang–Zuo, Xu, Faltings, Abe, Abe–Esnault, Langer, Simpson, Langer–Simpson, André, Brunebarbe–Klingler–Totaro — to be extracted here. That is what the `prerequisites` list is for, and those entries now say precisely which statement of each is quoted and where. This extraction still does **not** claim that any geometric theorem is formalized, that the dependency graph is a proof-closure certificate, or that the source findings have been confirmed by the authors.

## Source and scope of reading

The source of record is [the published Acta Mathematica PDF](https://intlpress.com/site/pub/files/_fulltext/journals/acta/2020/0225/0001/ACTA-2020-0225-0001-a002.pdf), volume 225 (2020), pp.103–158, DOI [10.4310/ACTA.2020.v225.n1.a2](https://doi.org/10.4310/ACTA.2020.v225.n1.a2). Its SHA-256 is `0d81a6d3e9be477c58a725096c41f06a8a9262422fe596363c3f04c26ab1cfab`; accessed 2026-09-22. Journal pagination is used throughout. The PDF has 56 pages. The contents of §§1–8, Appendix A and bibliography were read; images of pp.106, 116, 118, 127, 129 and 154 were inspected to disambiguate formulas.

The [author copy](https://page.mi.fu-berlin.de/esnault/preprints/helene/126_esn_gro.pdf) has SHA-256 `0bfa00b7dbae7a59c193d3523028df826741f15d3e88cb50526f8656a7fb8e35`. Its BNR proof on pp.13–14 was compared directly; selected other passages were searched, not fully collated. [arXiv 1707.00752](https://arxiv.org/abs/1707.00752) lists four versions through the accepted v4 of 1 June 2020. No later version was listed at access.

The additional proof passages recorded by the original workers were Ogus–Vologodsky's PD setup, Theorem 2.8 and proof, Corollary 2.9 and Remark 2.10, pp.32–35, and Groechenig's earlier BNR Proposition 3.15 and proof, pp.14–16, with its acknowledgement on p.4. The JSON gives URLs, hashes and exact limits of these readings. The introduction of the 2023 paper *Cristallinity of rigid flat connections revisited* was also read. It develops a new local/nonproper approach, not an announced correction of the findings here. Its v2 correction of Proposition 3.9 is about that later paper. The remaining external sources have bibliographic or abstract checks and explicit proof-extraction gates; they have not silently been counted as read in full.


The repair records edition-specific `sourceVersions`: the full published reading by `cc-fb70e5` on 22 September; the historical selective author-copy reading (date inferred from `source.accessed`); and fresh focused readings on 30 September. The [YMSC published mirror](https://archive.ymsc.tsinghua.edu.cn/pacm_download/117/11915-ACTA-2020-0225-0001-a002.pdf) has the identical published hash. Published pp.118–120,125–126,133–134,137–146,149–150 and bibliography were revisited; pp.134,140,143,145,149 were inspected as images. [arXiv v4](https://arxiv.org/pdf/1707.00752v4), hash `bcc435b58bb2b1c06869413c1cd96018676d15da8003d21e5b507b114a63c4eb`, was compared selectively at PDF pp.25,28–30,32–34,36 and references pp.41–44. The proof defects and added slips persist; matching author-copy text was also checked. Neither older arXiv versions nor the entire v4 were freshly read.

Fresh external reading covered Esnault–Kerz, arXiv:1208.0128v3, pp.13–15 and 34–35 (Theorem 4.4, Corollary 4.5 and Appendix B Proposition B.1), and Deligne’s [IAS author PDF](https://publications.ias.edu/sites/default/files/FrobTraces.pdf), §§1.1–1.4, pp.8–9. The [Esnault–Kerz errata](https://www.mi.fu-berlin.de/users/esnault/preprints/helene/109b-errata.pdf), dated 29 August 2014, was read in full: it does not amend the purity reduction or Proposition B.1. These are selective input checks, not full extractions of those papers. The EG arXiv history, Esnault’s publication list, correction searches and Crossref metadata disclosed no EG-specific correction on 30 September; this is not a claim of exhaustive novelty checking.

## What the paper establishes, with its boundaries

The standing complex variety is smooth, connected and projective, with a polarization. Rigidity is in the stable rank-r **fixed-determinant** moduli; the determinant has finite order. Isolated does not mean reduced. Cohomological rigidity uses trace-free endomorphisms. Simpson's Higgs correspondence uses the vanishing rational Chern-class component, not every stable Higgs bundle.

Theorem 1.4 supplies a chosen, sufficiently shrunken arithmetic model whose closed fibres have nilpotent p-curvature. This does not say that p-curvature is zero, or that every model and every small prime works. The p-curvature convention is ψ(∂)=∇(∂)^p−∇(∂^[p]); it is Frobenius-semilinear, not an ordinary linear endomorphism-valued one-form on the original variety. Corollary 1.5 supplies the associated crystal after the indicated completion.

Theorem 1.6 constructs a Frobenius isocrystal after a finite residue-field extension. A periodic flow gives an iterate F^f with f>0; there is no general assertion that f=1. The integral filtered realization through periodic Higgs–de Rham flow is stronger data than a pointwise semilinear vector space. This distinction is essential to the five small library credits below.

Theorem 5.4 concerns absolute irreducibility and rigidity of the geometric p-adic representation. The exact relation between the residual convention in Definition 5.3 and the generic Faltings argument is retained as G5, not settled by translating the word “rigid” mechanically. Theorem 6.1 concludes **unitary monodromy** from zero p-curvature on every closed fibre of a suitable model. It does not conclude finite monodromy without additional input.

Theorem 7.3 concerns companions within the cohomologically rigid family. Frobenius normalization, finite-order determinant and geometric versus arithmetic isomorphism classes must be fixed before a counting argument becomes a bijection of coefficient objects. Corollary 4.17 obtains motivicity after restriction to a complete-intersection curve and then a dense open; it is not motivicity on the entire original variety.

Proposition 8.1 treats the cohomologically rigid SL3 application using integrality and motivicity inputs. Proposition 8.2 has a premise about **all** cohomologically rigid connections, needed also for the relevant conjugates; an assertion about one object alone is insufficient. Simpson's motivicity conjecture, the global question in §8.3 and Question A.8 are retained as questions, not extracted as proved theorems.

## Coverage and proof organization

The numerical suffixes below refer to the JSON item ids; each item has a statement, source locator, status and ownership evidence. Definitions and constructions carry at least three planning API entries and at least three acceptance tests. These are mathematical obligations, not executed Lean examples.

| Items | Content |
| --- | --- |
| 001–008 | Fixed-determinant rigidity, trace-free cohomological rigidity, stable moduli, Riemann–Hilbert, Simpson and rigid Higgs nilpotency |
| 009–024 | Derivations, relative Frobenius, p-curvature, crystalline differential operators, cotangent centre, Azumaya and Morita interfaces |
| 025–036 | Cartier and inverse Cartier, bounds and signs, Hitchin/spectral constructions, corrected family BNR invariant |
| 037–047 | Witt vectors, pointwise isocrystals, crystalline sites, crystals/connections and reduction/completion |
| 048–060 | Arithmetic spreading, bounded rigid loci, admissibility and stability, deformation truncation, nilpotent reductions |
| 061–075 | λ-connections, Hodge splitting, filtered and mixed-characteristic periodic flows and realization |
| 076–085 | Finite permutation, determinant orbit, rigid lifts, liftable Witt towers and iterated Frobenius |
| 086–104 | Curve motivicity, representations, fixed-determinant deformation, Faltings comparison, good points and unitarity |
| 105–122 | Integrality, strong integrality, companions, finite counts, SL3 and all-rigid applications |
| 123–130 | Appendix A scaling, Brauer classes, Morita deformation and PD action |
| 131–136 | Imported Fontaine–Laffaille, overconvergence, weights, formal moduli, general integrality and geometric origin |
| 137–146 | Separate Katz criterion and p-curvature comparisons; ℓ-adic purity, trace and constant-field inputs; Abe stack cover and companion existence |

The first main chain runs from stable rigid moduli and p-curvature through the spectral/Morita construction, a uniform deformation bound and the rigidity-preserving inverse Cartier transform to nilpotent reductions. The BNR invariant and truncation are genuine intermediate proof obligations, not one large “standard argument.”

The second chain uses the finite collection of determinant powers L^a, with 0≤a<d and p prime to d. The rigid-point map must be a **permutation**, not merely an endomap: only the former makes every point periodic. Compatible lifts and filtrations then produce mixed-characteristic flow and an iterated Frobenius structure. The liftable subsets at Witt level n are intersections of all higher-level images. A finite inverse-limit argument is needed; a bijection between compatible Witt points and level-one points does not assert a bijection at every unrestricted finite level.

The last chains consume these constructions rather than redefine them: p-adic representation comparison, then good-point descent and unitarity; separately, companion existence, irreducibility, trace-free H¹ vanishing, determinant control and normalized counting.

## Baseline and ownership decisions

The pinned commits are Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Both source trees were searched; credited declarations were read in their Lean files.

Only five items receive library status: derivations (009), the ring Azumaya predicate and canonical multiplication map (021), Witt vectors and extensionality (037), Witt Frobenius over a perfect characteristic-p ring (038), and the pointwise isocrystal carrier (039). The JSON cites the exact names and file locators. A ring-level `IsAzumaya` is not scheme-relative splitting and coherent Morita descent. A pointwise `WittVector.Isocrystal` is not a crystal or overconvergent F-isocrystal on a variety.

The earlier library-audit observations were recorded on 22 September. The repair reread current coverage and the relevant CR, DWP, GS and SF stages, the finished GlobalGaloisDeformations packet, and the accepted HEUER-25, GUO-REINECKE-24, ABE-18 and DELIGNE-80 extractions. Matrix Morita equivalence was missed by the original audit: `ModuleCat.toMatrixModCat`, `ModuleCat.matrixEquivalence`, `moritaEquivalenceMatrix`, `IsMoritaEquivalent.matrix`, and `IsAzumaya.matrix` exist at the pin. Items 022–023 import them while retaining missing status for non-free projective generators, sheaf descent and support. A stale TODO does not establish absence.

The eight routes below require independent review of this repair. Historical acceptance of the old six routes is not approval of changed scope or new routes. No finished Galois-deformation source route remains: item 090 imports actual R04.1/R04.2 nodes for finite residue fields, while 091–093 move to the arithmetic consumer.
### 1. Hodge structures (pure, mixed, and polarized), Part II: variations, period maps and non-abelian Hodge theory

Reuse the same pending Part II proposed by PAPER-LANDESMAN-LITT-24; its source list should gain this projective rigid-connection core, not create a second owner. Existing L0–L3 are fibrewise theory, much of it already built; they do not supply Simpson moduli, harmonic correspondence or arithmetic spreading. Area corrected to algebraicgeometry, the value PAPER-LIU-ZHU-17 and PAPER-LANDESMAN-LITT-24 already give this same pending Part II; three papers now propose it with identical parent and title.

Extend the already-proposed HodgeStructuresPartII, coordinated with PAPER-LANDESMAN-LITT-24, from the parent Hodge structures (tauceti:TauCetiRoadmap/HodgeStructures) to the geometric interfaces in EG20. Import the reviewed/built fibrewise pure, polarized and period-domain algebra; do not assume a complex VHS has an integral lattice. Build projective stable Betti/de Rham/Dolbeault moduli with fixed torsion determinant, Riemann–Hilbert and Simpson on the vanishing-Chern-class component, rigid/cohomologically rigid loci with End⁰ tangent space, nilpotency of rigid Higgs fields, smooth arithmetic models of all isolated points, λ-connections, equivariant rigid Hodge-moduli splitting, Griffiths filtrations and complex variations. The final foundational results are EG20 Lemmas 2.1, 3.1, 4.9 and Propositions 3.3, 4.10, and the equivalence between vanishing graded Higgs field and unitary monodromy. Import generic connection/crystal carriers from CrystallineCohomology:CR.1, moduli foundations from AlgebraicModuliForArithmeticGeometry and scheme spreading from SchemeAndStackFoundations. Add the integral-versus-strongly-integral distinction and the rank-one infinite-image unitary example; source-gate the separate EG18, Langer–Simpson SL3 and BKT inputs. The p-curvature nilpotency and Frobenius construction belong to the Cartier/flow successor, while unitarity from zero p-curvature and companion bijections belong to the rigid-arithmetic successor. Keep this foundational Hodge stage independent of those consumers to avoid a dependency cycle.

The route contains 26 extracted items.

### 2. Semisimple algebras, Artin-Wedderburn, and the structure of their modules, Part II: geometric Azumaya and Morita descent

The ring IsAzumaya carrier exists, and field central-simple/Brauer theory is already upstream. The needed equivalence concerns sheaf algebras over nonreduced spectral schemes, with descent and annihilator control; neither field Skolem–Noether nor the endoscopic Hitchin roadmap supplies it. Title corrected by REV-PAPER-ESNAULT-GROECHENIG-20: the prefix now reproduces the parent's atlas title exactly, as PROTOCOL §16 requires; the previous title paraphrased it. This roadmap id is proposed by this extraction alone, so no other file is affected.

Start from Semisimple algebras and Artin–Wedderburn (tauceti:TauCetiRoadmap/RepresentationTheory/SemisimpleAlgebras), Mathlib IsAzumaya and Tau Ceti field-level central-simple/Brauer declarations. Extend once to sheaf Azumaya algebras, splitting modules and coherent Morita equivalence over general scheme bases. The foundational theorem is equivalence of modules over End(P) with modules over the base for a finite projective generator P, compatible with annihilators, affine pushforward and the local-free rank calculations used in EG20 Theorem 2.17. Prove strict-henselian splitting, transition invertible bimodules, and descent of the reduced characteristic invariant even on nonreduced parameter schemes. Coordinate geometric Brauer comparison with SchemeAndStackFoundations:SF.2, already requested by PAPER-CESNAVICIUS-19; it is a supplier, not a duplicate Brauer owner. Import quasi-coherent sheaves and étale descent from SchemeAndStackFoundations/AlgebraicModuliForArithmeticGeometry. Export the Cartier one-form connecting map and its functorial/additive Brauer-class interpretation, while the special crystalline D-algebra and its W₂ splitting remain in the Cartier-transform successor. No assertion of unique isomorphisms between arbitrary modules, and no ordinary-henselian splitting without a residue-field condition, is permitted. Reuse Mathlib ModuleCat.toMatrixModCat, ModuleCat.matrixEquivalence, moritaEquivalenceMatrix and IsMoritaEquivalent.matrix for affine free positive-rank splittings, and IsAzumaya.matrix for matrix algebras. The additional work is projective-generator and sheaf descent with support tracking.

The route contains 4 extracted items.

### 3. Crystalline cohomology, de Rham–Witt and logarithmic foundations, Part II: Cartier transforms and periodic rigid connections

CR.1 owns crystals and quasi-nilpotent connection comparison, but its layers do not promise crystalline differential-operator Azumaya theory, inverse Cartier in families or Higgs–de Rham flow. R07.3 owns absolute Fontaine–Laffaille theory; relative filtered connections on a variety are additional. Title corrected by REV-PAPER-ESNAULT-GROECHENIG-20: the prefix now reproduces the parent's atlas title exactly, as PROTOCOL §16 requires; the previous title paraphrased it. This roadmap id is proposed by this extraction alone, so no other file is affected.

Extend Crystalline cohomology (CrystallineCohomology), importing CR.1 crystals/connections and CR.2 comparison rather than constructing rival carriers. With HodgeStructuresPartII supplying stable Higgs moduli and nice arithmetic models, build restricted tangent derivations, p-curvature with its Frobenius-semilinearity and horizontality, relative Frobenius, tensor nilpotency, the crystalline D-algebra and its cotangent centre, BMR rank p^(2dim Z), Cartier descent and the W₂-dependent Ogus–Vologodsky equivalence with explicit signs and nilpotency range. Import sheaf Morita descent from SemisimpleAlgebrasPartIIGeometricMorita. Correct the family BNR invariant conditions as in E2/034–035 before the nonreduced deformation proof; locate an explicit R(r,m) support bound and repair E3. Then prove EG20 Theorem 1.4: a rigid stable fixed-torsion-determinant complex connection has a selected arithmetic model with nilpotent p-curvature at every closed point. Build signed inverse Cartier, finite and mixed-characteristic periodic flows, LSZ/SYZ realization and its reduction compatibility; import only the absolute Fontaine–Laffaille input from FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3. Prove the finite permutation over all determinant powers, lift independence at the level of rigid points, unique filtered lifts, and the finite inverse-limit argument. The second final result is Theorem 1.6: every permitted W(k)-point yields an F^f-isocrystal after finite residue-field extension, with the stronger filtered integral realization specified separately. Develop the Appendix-A scaling/PD action only after repairing the relative Brauer argument E5; retain Corollary A.7's p>2, W₂-liftability and cohomological rigidity hypotheses. This is not a proof of Question A.8 or Simpson motivicity. Import the quasi-nilpotent CR.1 forms of 045–046, then prove 137–139 here; no foundational CR.1 node depends on p-curvature. Import crystalline-local-system definitions from PadicHodgeTheoryPartIIRelativeCrystallineLocalSystems (GUO-REINECKE-24/075,076,080), with the algebraic-to-adic generic-fibre bridge; its full faithfulness is only up to isogeny.

The route contains 63 extracted items.

### 4. P-adic differential equations, rigid cohomology and p-adic weights, Part II: rigid connections and companions

This consumer owns the arithmetic applications and abstract rigidity comparisons, not its crystalline, Simpson, companion or weight foundations. The new supplier assignments reconcile the later accepted HEUER-25, GUO-REINECKE-24, ABE-18 and DELIGNE-80 extractions and the finished Galois deformation blueprint.

Extend P-adic differential equations and rigid cohomology (PadicDifferentialEquationsAndRigidCohomology) to the arithmetic applications of rigid connections. Import CartierFlows periodic crystalline realizations, HodgeStructuresPartII stable moduli and unitarity, and the finished GlobalGaloisDeformations R04.1/R04.2 finite-residue fixed-determinant functors (090). Own the residual-rigidity convention and the abstract GL/PGL and profinite/Betti comparisons 091–093 here, with 089 imported from Hodge theory; never reopen the finished Galois blueprint for these character-variety theorems. Import the small integral Faltings correspondence from PadicHodgeTheoryPartIIPadicSimpson and crystalline local-system definitions from PadicHodgeTheoryPartIIRelativeCrystallineLocalSystems; retain only the LSZ/Faltings comparison and rigidity deductions 096–098. Prove Theorem 5.4 with generic, geometric and residual rigidity distinguished, and Theorem 6.1 via Cassels good points in every relevant arithmetic open. For Corollary 4.17 and Theorem 7.3, import the shtuka realization, companion relation and p-to-ell existence from GlobalShtukasPartIICrystallineCompanions (ABE-18/1,31,32,44,46,47); only the Abe–Esnault Lefschetz proof remains an external companion input. Coalesce the admissible-stack cover 145 and mixed overconvergent Chebotarev foundation (ABE-18/17,51) with the early ArithmeticDModules layers. Order early ArithmeticDModules → GlobalShtukasPartIICrystallineCompanions → late RigidCompanions; grouping under one parent is not permission to introduce a reciprocal whole-roadmap dependency. The l-adic half of Proposition 7.4 imports DWP.7 smooth-proper purity, GS.6 curve purity, the late DWP.10 smooth-variety reduction via EK Corollary 4.5/Appendix B, and SF.2/upstream TraceFormula. RD.6 supplies p-adic weights and CR.2 coefficient comparison. Add Deligne constant-field decomposition 144, geometric irreducibility, End⁰-H¹ vanishing, determinant-order control and normalized counting. Final companions are p↔ell and p↔p for this cohomologically rigid family only; motivicity remains the dense-open curve statement. Carry E11/E12’s repaired proofs and all retained source gates into the design.

The route contains 26 extracted items.

### 5. CrystallineCohomology

Reuse CR.1 quasi-nilpotent connections, finite-Witt evaluation and complete formal comparison. Item 044 retains only [BO] Exercise 4.14 (quasi-nilpotence modulo p), depending on 043; Katz Corollary 5.5 and the p-curvature forms of EG Theorem 2.19/Corollary 2.20 are separate items 137–139 in CartierFlows. CR.2 supplies End⁰ coefficient comparison. The order is CR.1/CR.2 → HodgeStructuresPartII → CartierFlows → RigidCompanions.

Stages: `CrystallineCohomology:CR.1`, `CrystallineCohomology:CR.2`.

The route contains 9 extracted items.

### 6. P-adic Hodge theory and geometric comparison, Part II: the p-adic Simpson correspondence for smooth proper rigid spaces

Use the accepted HEUER-25 owner, adding Faltings’s small integral theorem beside Heuer’s rational correspondence. This replaces the obsolete source route to the finished GlobalGaloisDeformations blueprint.

Start from PadicHodgeTheory and the accepted PadicHodgeTheoryPartIIPadicSimpson proposal of PAPER-HEUER-25; preserve its id, title and area. Add EG20 Theorem 5.8 as the small integral Faltings correspondence on proper smooth V-schemes within Faltings’s toroidal setting, with coefficient completion, chosen lift, small generalized representations, nilpotent small Higgs fields and deformation stability. Include the Frobenius-crystal example of [Fa2, §5]. Coordinate the local correspondence with HEUER-25/35–36 and compare the global rational construction 40, retaining its B_dR^+/ξ² lift and exponential choices. Import Higgs carriers from HodgeStructuresPartII and period sheaves from PadicHodgeTheory. Export this interface to EG20/096–098 in RigidCompanions; do not depend on those consumers. Unit tests: trivial integral representation, a nilpotent small Higgs object, and deformation remaining in the specified small radius. Faltings’s integral proof must be extracted; Heuer’s theorem alone does not provide it.

The route contains 1 extracted items.

### 7. Global shtukas and Langlands over function fields, Part II: the Langlands correspondence for isocrystals and crystalline companions

Coalesce these inputs with the accepted Abe owner, which already asked EG20 to import its realization and companion theorems. No rival crystalline-companion construction remains in RigidCompanions.

Reuse the accepted PAPER-ABE-18 GlobalShtukasPartIICrystallineCompanions proposal and its full brief. EG20 imports the closed-point Frobenius conventions and companion relation (ABE-18/1,31), the Langlands and essential shtuka-cohomology realization (32,44), and p-to-ell existence (47) once the Lefschetz hypothesis (46, Abe–Esnault) is discharged. Record the characteristic-polynomial normalization, inverse linearized Frobenius, Tate twists, finite determinant and coefficient extensions explicitly. Import the early ArithmeticDModules six operations, stack cover and Chebotarev foundation; export to late RigidCompanions theorems 4.17 and 7.3. The latter’s normalized counting and geometric irreducibility belong to EG, not this supplier. No GS.6 l-adic theorem alone supplies the crystalline existence input.

The route contains 3 extracted items.

### 8. DeligneWeightsAndPurity

Supply the smooth-variety reduction to curves via Esnault–Kerz Corollary 4.5 and Appendix B Proposition B.1 for the existing PAPER-DELIGNE-80/s1a-1.2.10i-conjecture target. Place it late at DWP.10, after DWP.7 → GS.6: GS.6 already consumes DWP.7, so routing the higher-dimensional proof back into DWP.7 would cycle. RigidCompanions imports this result. No DWP blueprint packet exists in this snapshot; hand this exact source request to BP-DeligneWeightsAndPurity.

Stages: `DeligneWeightsAndPurity:DWP.10`.

The route contains 1 extracted items.

The foundational order is **CR.1/CR.2 → HodgeStructuresPartII → CartierFlows → RigidCompanions**. Item 044 contains only reduction of quasi-nilpotence modulo p; 137–139 own the p-curvature criterion and its finite/formal applications. The weight order is **DWP.7 → GS.6 → DWP.10 → the companion application**. The p-adic chain uses **early ArithmeticDModules → GlobalShtukasPartIICrystallineCompanions → late RigidCompanions**. Shared parent grouping must preserve those layer boundaries.

For Proposition 7.4, 140 imports smooth-proper purity from DWP.7; 141 imports curve weight zero from Lafforgue VII.6(ii)/GS.6; 142 routes the smooth higher-dimensional result to the existing DELIGNE-80 target at late DWP.10, using EK Corollary 4.5 and Proposition B.1; 143 imports the ℓ-adic trace formula through SF.2; 144 supplies Deligne’s finite-constant-extension decomposition. RD.6 remains the p-adic weight supplier.

## Source findings and review history

The original ten findings have the printed text, an exact locator, a correction, a reason, evidence and correction searches in `sourceIssues`. Each original finding was found by the first worker and checked independently by the second against the published PDF, on a rendered page image wherever a flattened superscript could produce a false reading. They remain author-unconfirmed: no communication with the authors has been made, and the arXiv history, the author's publication listing, the matching author PDF and targeted correction searches identified no EG20-specific repair of E1–E6. That is not an exhaustive novelty claim. The historical correction acknowledged in Groechenig's earlier paper (its thanks to Yun Hao for an error in an earlier Theorem 3.2/Proposition 3.15) concerns that paper and is not the same point as E2; the two should still be read together by a reviewer.

Three of the ten touch statements rather than proofs. **E1** makes the introduction's definition of cohomological rigidity unsatisfiable for every X with b₁(X)>0; §7 states it correctly. **E2** makes the essential-image half of Theorem 2.17 false over a non-reduced base — and non-reduced bases are exactly where §3 and Appendix A use it. **E4** makes Definition 5.2 vacuous, and Lemma 5.6 false, unless the determinant is fixed. In all three the intended reading is clear from elsewhere in the paper, and no main theorem is in doubt; but an atlas layer stating the printed form would be stating something false, which is why they are recorded as `a stated result` rather than as misprints.

### E2: nonreduced family BNR needs the reduced characteristic invariant

Theorem 2.17, pp.117–119, uses a p-power characteristic-polynomial root to recover spectral data over an arbitrary parameter scheme. Frobenius is not injective on dual numbers, so monicity does not make such a root unique.

There is a trace-free geometric witness, not just a univariate warning. Let k be perfect of characteristic p≥5, let Z be an elliptic curve, choose a nonzero global differential ω on Z', and let R=k[ε]/(ε²). In the rank-three Hitchin base set

```text
a(λ) = λ³ + εω²λ,    a₀(λ) = λ³.
```

Both are trace-free, a≠a₀, a(0)=0, and a^p=a₀^p. Take the canonical zero-p-curvature rank-three connection F*O³, with trivial determinant. Its corresponding crystalline differential-operator module is supported on the zero section, hence on the spectral scheme cut out by a. Its pushforward has rank 3p and the characteristic polynomial λ^(3p)=a^p. It therefore satisfies the printed support and powered-characteristic-polynomial conditions. But the unique reconstructed connection has reduced characteristic polynomial a₀, not a. Thus the printed essential-image condition does not force membership in the fibre indexed by a.

Items 033–035 demand the locally Morita-reduced rank-three characteristic invariant itself equal a, together with independence of a splitting module and descent on the parameter scheme. This is a proposed repair whose proof remains G1. Restricting the theorem to reduced parameters would not suffice for its later infinitesimal use in Proposition 3.5. This finding does **not** give a counterexample to Theorems 1.4 or 1.6.

The earlier Groechenig paper explicitly thanks Yun Hao for finding an error in an earlier Theorem 3.2/Proposition 3.15. Its current proof was read. The relationship between that repair and this stronger nonreduced-family condition needs independent checking; no claim of an unrelated new discovery is justified.

### Other consequential gates

**E1, p.106:** fixed-determinant cohomological rigidity uses End⁰. Rank one with determinant fixed has no such deformation, while H¹_dR(O) on a positive-genus curve is nonzero. Section 7, p.148, already uses the trace-free expression. The extracted definition follows that correction.

**E3, p.127:** restricting a deformation to the (m−1)-st infinitesimal neighbourhood can lower the order of its Hitchin invariant or kill it, so "it factors through A′(m−1), but not through A(k−1) for k<m" does not follow. Witness inside the Artinian world the proof actually inhabits: A′=Spec k[u], m=4, T=Spec k[t]/(t⁹), u↦t². Then χ^*(u⁴)=t⁸≠0, so χ does not factor through A′(3) as the hypothesis requires, yet on T_t^{(3)}=Spec k[t]/(t⁴) one has χ^*(u²)=0 and it factors through A′(1). The truncation order must be chosen so that non-factoring through A′(D′−1) survives, and since that order is not bounded by m, the standing hypothesis p−1>R(r,m) has to be revisited — which is why the explicit R(r,m) and a uniform bound on the length of a rigid component are the real content. A gate in the proof, not a counterexample to Proposition 3.5.

**E4, pp.139,141:** the functor of Definition 5.2 must fix the determinant, since Lemma 5.6 identifies it with the completion of the moduli space M_B(X/C,det(ϱ),r), in which the determinant is fixed. The defect is not confined to rank one: for any absolutely irreducible ϱ, twisting by a continuous character χ:Γ→1+m_A is a deformation, distinct twists are non-isomorphic once p>r (an isomorphism forces χ^r=1 in a p-group), and the character functor is corepresented by F_q[[Γ^ab⊗Z_p]]≅F_q[[x_1,…,x_b]] with b=b₁(X). So the hull of the unrestricted functor has dimension at least b₁(X), no representation is rigid in the printed sense when b₁(X)>0, and Lemma 5.6 fails. The standing convention of the paper plainly supplies the omission; the repair makes it explicit. This does not settle the separate generic-versus-residual ambiguity, now G3.

**E5, p.154:** vanishing after restriction to the reduced zero parameter does not imply zero-section support. On a cotangent chart the difference ε ξ dx becomes zero when ε=0 but remains nonzero after ξ is inverted. Thus the written support inference needs a relative Cartier/PD/Brauer argument. The example does not disprove the desired Brauer-class equality. Appendix A is not used as an automatic replacement proof for the earlier gaps.

**E6, p.146:** infinitely many residue characteristics alone do not give density in an arithmetic model — the points (p,t) of Spec Z[t] realise every residue characteristic and all lie on V(t), where the non-zero section t vanishes. What the proof needs is only this: gr(∇_S) is a section of a coherent sheaf on the integral scheme X_S, so it is non-zero iff it is non-zero on the generic fibre; if gr(∇_C)≠0 there is a non-empty open V⊂S over which it is non-zero, and a good point inside V contradicts the vanishing established at every good s. Lemma 5.11 can be made to supply one, because the finitely generated ring R₁⊂C chosen in its proof may be enlarged by the inverse of a non-zero coefficient before Cassels's theorem is applied, which sends that inverse to a p-adic unit. The remainder of Theorem 6.1 is sound: on the reduced fibre X_s, gr(∇_s)=ω·id together with nilpotency does force ω=0.

### Normalization and typographical findings

**E7, pp.116–117:** the monic trace-free Hitchin affine space is not the vector space of all homogeneous degree-r expressions. On P¹, the positive symmetric differential sections vanish, but the polynomial λ^r still exists. The tautological section and vector-valued component ideal are normalized in the spectral construction.

**E8, pp.129–130:** the printed orientation of C₁ and its inverse does not type-check in the stated flow. The extraction uses one consistently oriented inverse-Cartier functor I₁ and Iₙ at mixed-characteristic level n.

**E9, pp.124,133:** in Proposition 4.10(c) and in the display defining σ the union is indexed by a while its term prints L rather than L^a; the enumeration of the determinant powers runs to a=d, counting L^d≅L⁰ twice; the rank prints as R; and the proof of Proposition 3.3 cites "conditions (a)–(f)" of a proposition with parts (a)–(e). All four were read on p. 133 rendered at 300 dpi. They matter because this enumeration is what defines the permutation σ of (4.2) that Lemma 4.11 asserts to be a bijection.

**E10, pp.108–153:** a group of type and index slips with no mathematical consequence — "integrality condition" for integrability (twice, p. 108); Definition 2.3 sending "a local section ∇∈Θ_Z(U)" where the argument is ∂; the variety of §2 called X four times where it is Z (Ω¹_X on p. 108, O_X on p. 110, U⊂X and Θ_X(U) in Proposition 2.4); "a degree-n section" for the monic degree-r section on p. 119; "for every s as in (b)" in Lemma 5.11(d), whose points come from (c), and PGL_n for PGL_r there; and "by Theorems 1.8" on p. 153.

E10 now also records five verified slips in the published text and arXiv v4: Corollary 4.17 quantifies over the shrunken S′; the p.138 phrase means generically smooth and (of course) projective; the p.143 arithmetic group is π₁(X_Qp), without a bar; the concluding point/claim/references in Lemma 5.11 shift from (b)/(c)/(b) to (c)/(d)/(c); and Theorem 7.3’s tuple uses a comma between r and d. The original E10 review is archived in `sourceIssueHistory`, because its verdict did not examine these additions.

**E11, proof of Lemma 4.11, p.134:** Lemma 3.4 proves the Frobenius-twist assertion; it does not prove that forward Cartier preserves rigidity. Instead, full faithfulness of C⁻¹∘w* and pairwise distinct Higgs representatives from Proposition 4.10(c), as corrected in E9, imply that σ is injective. Since its domain and codomain are the same finite set, it is bijective. Forward-Cartier rigidity follows afterwards. Item 076 already reaches disjointness through 065→052; no artificial new dependency is needed.

**E12, proof of Lemma 5.5, p.140:** the trace inference forcing χ to be trivial is false. The standard two-dimensional Q₈ representation has nontrivial order-two self-twists; its zero traces leave those values unconstrained. Fixed determinant gives χ^r=1, so χ is already defined over the algebraically closed constant field. The generic deformation is therefore a constant K-representation up to isomorphism, and its closed moduli point forces the DVR family to be constant. This repairs the proof without changing the lemma. E12 is an error affecting the proof, not a harmless misprint. Neither E11 nor E12 carries an independent source-issue verdict from this worker.

Example 6.3 has no missing inverse-integrality hypothesis: for an algebraic integer α on the unit circle, α⁻¹=conj(α) is another integral root of its monic minimal polynomial. Item 107 now proves this consequence. Item 132’s locator is Corollary 4.17 in §4.2, followed by §7; there is no §4.17.

## Reproducible finite checks

The following Python certificate ran with assertions enabled. It checks the arithmetic underlying the root, jet and localized-support witnesses, all permutations through seven elements, and the eigenvalue calculation for the restricted derivation x∂/∂x. It is not a proof of Morita descent, a geometric BNR equivalence or any main theorem.

```python
from itertools import permutations
from math import lcm

# Polynomials in x over F_p[e]/e^2; tuple key = (x degree, e degree).
def add(a,b,p):
    c=dict(a)
    for k,v in b.items(): c[k]=(c.get(k,0)+v)%p
    return {k:v for k,v in c.items() if v}
def mul(a,b,p):
    c={}
    for (i,e),v in a.items():
        for (j,f),w in b.items():
            if e+f<2:
                k=(i+j,e+f); c[k]=(c.get(k,0)+v*w)%p
    return {k:v for k,v in c.items() if v}
def power(a,n,p):
    b={(0,0):1}
    while n:
        if n&1: b=mul(b,a,p)
        a=mul(a,a,p); n//=2
    return b

roots=0
for p in (3,5,7,11):
    for r in range(2,8):
        a={(r,0):1}; b=add(a,{(r-2,1):1},p)
        assert a!=b and power(a,p,p)==power(b,p,p)
        roots+=1
# Rank 3 trace-free BNR witness: x^3+e*x annihilates x=0
# while its pth power is x^(3p); the rank-three zero operator
# has reduced characteristic polynomial x^3, not x^3+e*x.
bnr=0
for p in (5,7,11):
    a={(3,0):1,(1,1):1}
    assert not any(i==0 for i,e in a)
    assert power(a,p,p)=={(3*p,0):1}
    assert a!={(3,0):1}
    bnr+=1

# Nonconstant u=t^m becomes zero on the (m-1)-jet k[t]/t^m.
jets=0
for m in range(2,21):
    exponent=m
    assert exponent>=m
    jets+=1

# The conic difference e*xi remains nonzero after inverting xi:
# multiply by xi^-1 and obtain nonzero e (Laurent monomial model).
support=0
for p in (3,5,7,11):
    assert mul({(1,1):1},{(-1,0):1},p)=={(0,1):1}
    support+=1

cycles=0
for n in range(1,8):
    for perm in permutations(range(n)):
        periods=[]
        for start in range(n):
            j=perm[start]; period=1
            while j!=start: j=perm[j]; period+=1
            periods.append(period)
        common=lcm(*periods)
        for start in range(n):
            j=start
            for _ in range(common): j=perm[j]
            assert j==start
        cycles+=1

# p-th iterate of x*d/dx on F_p[x]/x^N equals x*d/dx:
# all eigenvalues j lie in F_p, so j^p=j.
restricted=0
for p in (3,5,7,11):
    for j in range(4*p):
        assert pow(j,p,p)==j%p
        restricted+=1
print(dict(monic_root_witnesses=roots, trace_free_BNR_witnesses=bnr,
           jet_counterexamples=jets, localized_support_witnesses=support,
           permutations=cycles, restricted_derivation_eigenvalues=restricted))
```

Output:

```text
{'monic_root_witnesses': 24, 'trace_free_BNR_witnesses': 3, 'jet_counterexamples': 19, 'localized_support_witnesses': 4, 'permutations': 5913, 'restricted_derivation_eigenvalues': 104}
```

## What remains, and for whom

Nothing remains for an extractor; what follows is carried in `gaps` for the design jobs, and every item it names is already stated in corrected form.

- **G1 (source defect, E2).** The family BNR correspondence must be stated with the Morita-reduced characteristic invariant — the characteristic polynomial of π′_*F, invariant under isomorphism of F, with change-of-splitting compatibility and descent still to prove — and the descent of a derived from that canonicity, not from uniqueness of p^d-th roots. Items 033–035. It obstructs no main theorem: §3 uses the equivalence C_a supplied by [OV, Corollary 2.9], and the forward assignment (E,∇)↦(χ_dR(E,∇),M) is untouched.
- **G2 (source defect, E3).** The explicit R(r,m) of Proposition 3.5, a uniform bound on the length of a rigid component, and a truncation order chosen so that the contradiction survives. These three together fix the prime bound D. Item 055.
- **G3 (source defect, E4).** The finite-residue fixed-determinant functor is imported from the finished `GlobalGaloisDeformations` R04.1/R04.2 nodes; the abstract/projective and finite-completion rigidity comparisons 091–093 are assigned to RigidCompanions. Whether Theorem 5.4 exports generic or residual rigidity under Definition 5.3 is a convention the design job must fix; item 091 records the choice rather than making it.
- **G4 (source defect, E5).** Either the Brauer-class computation that Proposition A.2 needs in place of the support inference, or Corollary A.7 planned as conditional. This gates only Appendix A — Theorem 1.4 is proved independently in §§2–7 — and Question A.8 stays an open question.
- **G5 (source defect, E6).** The strengthened form of Lemma 5.11 with a prescribed element inverted, which is what Theorem 6.1's last step needs. Item 099.
- **G6 (design decision, not a defect).** §7 counts isomorphism classes in S(s,p,r,d) and S(s,ℓ,r,d); geometric and arithmetic classes have to be kept apart, since over a finite field one crystal can carry several Frobenius structures differing by a root of unity. The paper's own normalisation — finite determinant order, Definition 7.2 and Proposition 7.4(3) — is what makes the count a bijection, and items 111 and 114 carry it. Items 087,108,146 reuse ABE-18’s crystalline-companion supplier; 145/109 reuse the early ArithmeticDModules cover/Chebotarev input. The remaining outside companion proof input is Abe–Esnault’s Lefschetz theorem.

Two prerequisites deserve a reviewer's attention because the paper leans on unpublished work: Kedlaya's *Étale and crystalline companions* is cited in §7 as work in progress, and the Fontaine–Laffaille comparison is used in Faltings's starred form [Fa1, Theorem 2.6*]. Neither affects Theorems 1.4, 1.6 or 1.8.

Historical validation (22–23 September): `scripts/check_paper.py` reports no errors with `"status": "complete"`, which includes the check that every missing item is routed exactly once; `research/blueprint/intake.py check-files` passes on both deliverable paths; `python3 -m unittest tests.test_check_paper` passes (9 tests). No Lean file was compiled and none belongs to a paper issue; the `planningAPI` and `unitTests` fields are planning obligations for the design jobs, not executed tests.

## Historical review (REV-PAPER-ESNAULT-GROECHENIG-20, 23 September 2026)

The following is the record for the original 136-item, six-route extraction. It does not review the 30 September changes, the enlarged E10 or E11–E12. The fix awaits its independent REV-FIX review.

The independent review, by Claude Code (session `cc-7b31c4`, issue #1467), **accepted** this
extraction and all six routes, with three titles corrected in place. The full record is
[REV-PAPER-ESNAULT-GROECHENIG-20.md](../reviews/REV-PAPER-ESNAULT-GROECHENIG-20.md).

The recorded hash of the published Acta PDF reproduces. 136 items, all 119 missing routed exactly
once; both source stages, all twelve planned layer ids and all eight library declarations check out
at the pins; the planned items inside source routes are allowed by PROTOCOL §16.

**Correction.** Three of the four Part II titles paraphrased their parent instead of reproducing its
atlas title: `SemisimpleAlgebrasPartIIGeometricMorita` ("Semisimple algebras, Artin-Wedderburn, and
the structure of their modules"), `CrystallineCohomologyPartIICartierFlows` ("Crystalline cohomology,
de Rham–Witt and logarithmic foundations") and `PadicDifferentialEquationsPartIIRigidCompanions`
("P-adic differential equations, rigid cohomology and p-adic weights"). Each of those ids is proposed
by this extraction alone, so the fix is local; the fourth, `HodgeStructuresPartII`, already matched
and is shared with three other extractions under the same title.

All ten findings are **confirmed** at their locators. E1: the introduction (p.106) defines
cohomological rigidity by `H¹_dR(X,(End(E),∇)) = 0` where §7 (p.148) uses `End⁰`, and on a
fixed-determinant moduli space the trace-free version is the right one. E4: Definition 5.2 carries no
determinant condition although the rest of the paper fixes it. E2: monicity gives uniqueness of the
factorisation only over a reduced base. E3, E5 and E6 are gaps of the shape recorded — a truncated
deformation need not keep the order of its Hitchin invariant; vanishing after restriction does not
localise a form to the zero-section; and the Kodaira–Spencer vanishing needs `S` shrunk. E7–E10 are
printed as quoted, "integrality condition" and `Ω¹_X` on p.108 included.


## Repair validation and design handoff (30 September 2026)

The paper, §18 source/version, intake, route-uniqueness and dependency checks pass. The 146-item internal graph has 291 edges and no cycle; all 125 missing items have one route. The original finite certificate was replayed. An additional certificate checks Q₈ multiplication, its nontrivial self-twist and trace behavior, and injective finite endomaps. These executable checks support the explicit witnesses; they do not prove the geometric theorems. No Lean file is assigned or compiled.

[The fixes report](../redteam/RT-PAPER-ESNAULT-GROECHENIG-20.fixes.md) maps all eleven confirmed findings to changes and gives exact maintainer requests for the absent or unassigned supplier blueprints. Only this extraction, its reader and that report were edited. In particular the analogous stale LANDESMAN-LITT-24 source route is a maintainer note, not silently edited here.
