# Handoff — BP-CrystallineCohomology--CR.5

Job #705; worker Codex; session `codex-UMbWmQ`. This is a complete target-level blueprint pass, submitted for independent review, rather than a checkpoint. The packet status is `complete`; implementation status remains `unchecked`. Exactly the four assigned scope stages are covered. No second job was claimed.

Deliverables: [packet](../packets/CrystallineCohomology--CR.5.json), [reader](../readmes/CrystallineCohomology--CR.5.md), [suggested Lean signatures](../suggested/CrystallineCohomology--CR.5.lean), and this handoff. There are 88 nodes (22 definitions, 33 constructions, 27 theorems, 6 comparisons), 165 API items, 165 discriminating unit tests, 19 planets and 25 cited baseline declarations. All 55 definition/construction nodes have three API items and three tests. The prerequisite inventory is 214 local node edges, 37 baseline edges, 30 exact external blueprint-node edges and 41 stage imports.

## Coverage and work completed

All four stages are **planned**, with no closed stage. The complete breadth pass covers fine and non-fine log algebra, divisorial/log-regular geometry, finite-level fine and integral quasi-coherent log PD theory, log crystals/connections and descent, p-adic cohomology, HK operators and proper comparisons, the Qian family comparison, DL supported convergent/Witt/residue variants, rigid/Stein/tower comparisons and the CR.7 coefficient interfaces. Each target has direct dependencies and a construction/proof outline; every chain ends in a pinned declaration, an exact owner node, a stage interface or one of the recorded gaps.

### CrystallineCohomology:CR.5:log-algebra — planned

- Obtain the full logarithmic Abhyankar proof and supplier boundary/tame-cover interfaces. Obtain the local Kato log smooth/log regular proof cited by Thompson Theorem 3.14.

- Verify the nonnoetherian formal-boundary approximation proof chain under the exact finite-model hypotheses.

### CrystallineCohomology:CR.5 — planned

- Supply the generic ordinary PD envelope/canonical-base imports from CR.0 and completion interface.

- Apply the proposed Beilinson substage and AI.6 dependency; verify the complete O_C/A_cris chart-lift proof chain.

### CrystallineCohomology:CR.6 — planned

- Provide CR.4 log Witt and Sato residue objects and the RD Part II analytic/topological interfaces.

- Supply the Tate-curve geometric monodromy calculation and compare its basis orientation.

### CrystallineCohomology:CR.7 — planned

- Provide the R07.2 crystalline Dieudonné/Grothendieck–Messing construction and actual evaluation maps.

- Verify the CR.3 torsion/rank and completed base-change inputs for the stated Gauss–Manin degrees.

The reviewed library-coverage file contains no entries for this roadmap; that absence is not presented as a reviewed missing-library verdict. The integrated decomposition has seven CR.4 BLM nodes, outside this job, so no existing in-scope IDs were replaced. RS-01 is accepted and its ownership is followed. Pinned source-wide searches and actual declaration reads precede each baseline citation.

## Confirmed red-team finding and ownership

RT-AREA-padic-2/14 is handled by a proposed `CrystallineCohomology:CR.5:qc-crystalline` substage after `CR.5:log-algebra`, importing the BKV integral quasi-coherent log prefix. The nodes cover Beilinson §§1.1–1.8, 1.12 and 1.17: integral quasi-coherent schemes, finite-level log PD envelopes, exact PD thickenings, PD smoothness, the crystalline site, crystal/connection and PD de Rham comparison, compatible p-adic cohomology, unique lifting for uniquely p-divisible sharp monoids and the induced A_cris log structure. AI.6 must require this substage and retains the specialized semistable AΩ-envelope/comparison. Apply the restructuring proposal before relying on that dependency in the atlas.

The finite-level existence theorem does not settle CK footnote 11’s uncompleted non-exact envelope question with p not nilpotent. The sharp-monoid condition on the unique-lift theorem is retained. PD smoothness is not declared étale local. Shared A_cris and its finite PD quotients are CR.0 exports under RS-01; tilt, sharp, Teichmüller, A_inf and θ are AI.0:integral exports. This packet owns the log structures, not a duplicate period-ring construction.

The generic ordinary PD envelope and completion inputs remain CR.0 and DD.1 imports. CR.4 remains the sole Witt-complex owner, including the requested logarithmic/Sato extension. R07.2 remains the sole crystalline Dieudonné and Grothendieck–Messing owner. Existing exact R07 standard-module nodes supply the constant and multiplicative tests. The RD.4 ordinary overconvergent objects do not supply the DL log convergent tube theory; the proposed RD Part II owns that missing extension and the RD.5 topology interfaces. Upstream AdicSpaces and the Part II formal/dagger carrier nodes are imported unchanged.

## Three open proof gaps

### Logarithmic Abhyankar and log-regularity proof inputs

Temkin Theorem 4.3.1 proof, Step 10 inherited from IT14b, uses the tame Kummer étale/log regular extension, and its root-chart reduction is specified, but the complete fs descent/log-regularity proof from its cited log source has not been obtained. Supply an accessible proof with exact noetherian/tameness hypotheses and reconcile it with the requested LPV.5 classical lemma; do not mark this target closed. Thompson Theorem 3.14 states log smooth preservation of log regularity and refers to Kato Toric singularities Theorem 8.2. Obtain its local completed-ring proof as well; this is separate from arbitrary non-fine log regularity.

Resume at `CrystallineCohomology:CR.5:log-algebra/log-abhyankar`, `CrystallineCohomology:CR.5:log-algebra/log-smooth-over-log-regular`.

### Tate curve geometric monodromy locator

The nonzero rank-two acceptance block and its Nφ sign are explicit, but a complete source proof deriving the coefficient v_K(q) for the Tate curve from the oriented HK/residue comparison is not present in the passages read. R06.5 must provide this calculation and its basis convention; until then the geometric acceptance theorem is planned with this gap.

Resume at `CrystallineCohomology:CR.6/hk-tate-curve`.

### Non-fine period-base and formal-boundary proof chains

Beilinson supplies the uniquely p-divisible finite-level lift, CK supplies the period-base chart, and BKV/Nizioł state the formal divisorial identification. Their full extension from noetherian fine log regularity to the nonnoetherian O_C formal boundary uses Koshikawa/Ogus and auxiliary approximation results not all proved in the read passages. Keep the O_C identification under the source finite-model hypotheses and supply the remaining proof chain; do not infer arbitrary non-fine log regularity.

Resume at `CrystallineCohomology:CR.5:log-algebra/formal-semistable-log`, `CrystallineCohomology:CR.5/a-cris-log`.

These are proof gaps, not assertions that the targets are false. Their statements, hypotheses, reductions and acceptance cases are in the packet. Supply an accessible complete proof chain and independently verify its hypotheses before closing the affected stage.

## Nine requests to supplier roadmaps

### AlgebraicModuliForArithmeticGeometry:R09.7a

Export the existing regular SNC boundary carrier, open complement, local equations and their unit-change compatibility to the étale log chart constructor. This extends that carrier without introducing a second divisor predicate; if the interface exceeds the existing stage, provide Algebraic moduli for arithmetic geometry, Part II: logarithmic boundary interfaces.

Consumers: `CrystallineCohomology:CR.5:log-algebra/divisorial-log`, `CrystallineCohomology:CR.5:log-algebra/log-regularity`.

### LefschetzPencilsAndVanishingCycles:LPV.5

Supply the source-qualified classical Abhyankar lemma for the finite normal extension of a tame finite étale cover over a regular noetherian SNC pair, with root degrees/inertia orders invertible, plus the precise étale-local domination by boundary root covers. Reuse the existing tame/vanishing-cycle input rather than define it here.

Consumers: `CrystallineCohomology:CR.5:log-algebra/log-abhyankar`.

### AInfCohomology:AI.0

Export the already-owned perfectoid tilt, sharp and Teichmüller charts, A_inf and θ from AI.0:integral, with coefficient maps to the common A_cris owned by CR.0. The generic log structures are owned here; AI.6 owns the specialized semistable period-envelope comparison.

Consumers: `CrystallineCohomology:CR.5:log-algebra/valuation-log`, `CrystallineCohomology:CR.5/a-cris-log`.

### PadicHodgeTheory:R06.1

Provide the complete DVR/Witt coefficient embedding, rational period coefficient maps, geometric K₀^nr→C scalar extension, and convergent p-adic unit logarithm on principal units. The normalization killing Teichmüller units is specified by this packet. Shared integral A_cris and its finite PD quotients remain owned by CR.0 under RS-01.

Consumers: `CrystallineCohomology:CR.5/a-cris-log`, `CrystallineCohomology:CR.6/unit-logarithm`, `CrystallineCohomology:CR.6/stein-hk-comparison`.

### CohomologyComparisons:CP.2

Supply the derived cup product and Künneth map for the proper perfect coefficient complexes used by the log crystalline and de Rham models, with tensor signs and scalar extension; the current scope must be extended as Cohomology comparisons, Part II: log products if its existing statement is narrower.

Consumers: `CrystallineCohomology:CR.6/hk-products`.

### PadicHodgeTheory:R06.5

Supply the Tate elliptic curve semistable period module and residue/valuation computation N(e₁)=v_K(q)e₀ with variance/Tate twist conventions; provide the ordinary filtered (φ,N) coefficient interface with twist φ_r=p^{−r}φ. The generic crystal/log HK construction is not replanned there.

Consumers: `CrystallineCohomology:CR.6/hk-tate-curve`, `CrystallineCohomology:CR.7/filtered-frobenius-coefficients`.

### PadicDifferentialEquationsAndRigidCohomology:RD.4

Provide a source-qualified extension, p-adic differential equations and rigid cohomology, Part II: logarithmic convergent and weak formal cohomology. Needed interfaces are the DL quasi-étale tube specialization, exact tube support kernel and natural map (B.3), embedding independence for log convergent complexes, Grosse-Klönne log rigid boundary models and proper crystalline comparison. Existing ordinary j† overconvergent nodes are near misses and are not used as exact substitutes.

Consumers: `CrystallineCohomology:CR.6/convergent-log-complex`, `CrystallineCohomology:CR.6/tube-proper-support`, `CrystallineCohomology:CR.6/proper-log-rigid-hk`, `CrystallineCohomology:CR.6/ramified-hk-base-change`, `CrystallineCohomology:CR.6/stein-hk`.

### PadicDifferentialEquationsAndRigidCohomology:RD.5

Provide in that Part II the strict locally convex/Fréchet and ind-Fréchet derived cohomology interfaces for semistable Stein exhaustions, finite-dimensional log rigid pieces, continuous inverse limits and completed tensor products with C, including compatibility with source Gal_F and tower transitions. Ordinary algebraic finiteness does not supply these topology statements.

Consumers: `CrystallineCohomology:CR.6/stein-hk`, `CrystallineCohomology:CR.6/stein-hk-comparison`, `CrystallineCohomology:CR.6/tower-hk`.

### FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2

Provide the contravariant crystalline Dieudonné functor G↦D(G), its actual finite locally free PD evaluations and F,V linearizations, Hodge exact sequence 0→ω_G→D(G)_S→Lie(G∨)→0, and the nilpotent-PD Grothendieck–Messing filtration-lifting equivalence. Existing standard Witt modules supply the tests but do not supply a general crystalline functor. A source-qualified R07 extension remains the sole owner.

Consumers: `CrystallineCohomology:CR.7/dieudonne-evaluation`, `CrystallineCohomology:CR.7/messing-filtration-interface`.

The packet also records precise same-roadmap exports from CR.0, CR.1, CR.2, CR.3 and CR.4. Same-roadmap imports are not anonymous claims of closure: their exact remaining ordinary envelope, canonical base, log Witt, finiteness and torsion/base-change interfaces are listed. Supplier requests were recorded in the deliverable; no supplier packet, upstream layer or link file was edited.

## Sources read and still missing

Eighteen public versions are identified by URL, date and SHA-256 in the packet and reader. Reading is restricted to their listed passages; entire articles or books are not claimed read when only the relevant sections were read. All reading dates are 6 October 2026.

- **Kazuya Kato, Logarithmic structures of Fontaine–Illusie** (Algebraic Analysis, Geometry and Number Theory (1989), pp.191–224): §§1–6, definitions, chart criterion, exactification, log PD envelopes, connections and Poincaré lemma; local OCR checked against displayed page images where required. [Text](https://math.uchicago.edu/~drinfeld/p-adic_periods/Kato_log-structures.pdf).

- **Osamu Hyodo and Kazuya Kato, Semi-stable reduction and crystalline cohomology with logarithmic poles** (Astérisque 223 (1994), pp.221–268): §§1–3; §§4.1–4.4, 4.19–4.20; §§5.1–5.5. [Text](https://www.numdam.org/item/AST_1994__223__221_0.pdf).

- **Alexander Beilinson, On the crystalline period map** (arXiv:1111.3316v4 (2013)): §§1.1–1.8, 1.12, 1.17. [Text](https://arxiv.org/pdf/1111.3316v4).

- **Kęstutis Česnavičius and Teruhisa Koshikawa, The A_inf-cohomology in the semistable case** (arXiv:1710.06145v3 (2018); published Compositio Mathematica (2019)): §§5.2, 5.9–5.13; footnote 11; §9.2 statement and proof interfaces. [Text](https://arxiv.org/pdf/1710.06145v3).

- **Teruhisa Koshikawa, Logarithmic prismatic cohomology I** (arXiv:2007.14037v3 (2022)): §§2–4 statements; Appendix A, definitions and chart results; Example A.1. [Text](https://arxiv.org/pdf/2007.14037v3).

- **Federico Binda, Hiroki Kato and Alberto Vezzani, The motivic monodromy conjecture for p-adically uniformized varieties** (arXiv:2207.00369v2 (2025)): §2.1, Definitions 2.1–2.9 and Proposition 2.2 proof; §3.1, Remarks 3.4–3.5, Definition 3.6 and comparison interfaces; Remark 3.12 monoidality, using the proper algebraic Künneth formula. [Text](https://arxiv.org/pdf/2207.00369v2).

- **Michael Temkin, Tame distillation and desingularization by p-alterations** (Annals of Mathematics 186 (2017), pp.97–126): §1.2.7; proof Step 10, pp.123–124. [Text](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n1-p03-p.pdf).

- **Wiesława Nizioł, Toric singularities: log-blow-ups and global resolutions** (Author copy of Journal of Algebraic Geometry 15 (2006)): Definition 2.2; Lemmas 2.3–2.4; Proposition 2.6 and proof. [Text](https://webusers.imj-prg.fr/~wieslawa.niziol/resol7.pdf).

- **Lie Qian, Ordinarity of local Galois representation arising from Dwork motives** (arXiv:2103.00106v1 (2021), companion source routed with 2023 paper): Theorem 1.6 setup; §3 through Theorem 3.2 and its proof. [Text](https://arxiv.org/pdf/2103.00106v1).

- **Daniel Disegni and Yifeng Liu, A p-adic arithmetic inner product formula** (2024 publisher-formatted author copy): Appendix B.1–B.2, Definition B.1, Remark B.2, Lemmas B.3–B.5 and residue variant. [Text](https://disegni-daniel.perso.math.cnrs.fr/AIPF.pdf).

- **Pierre Colmez, Gabriel Dospinescu and Wiesława Nizioł, Cohomologie p-adique de la tour de Drinfeld: le cas de la dimension 1** (April 2019 author version, published JAMS (2020)): §0.3, §0.6 and their cited HK comparison inputs. [Text](https://webusers.imj-prg.fr/~wieslawa.niziol/GPW5.pdf).

- **Pierre Colmez, Gabriel Dospinescu and Wiesława Nizioł, Cohomology of p-adic Stein spaces** (arXiv:1801.06686v2 (2019)): §3.1.1–3.1.3; Proposition 3.2 and strict comparison; Appendix A.1–A.5. [Text](https://arxiv.org/pdf/1801.06686v2).

- **Elmar Grosse-Klönne, Frobenius and monodromy operators in rigid analysis, and Drinfel’d’s symmetric space** (JAG 14 (2005), author arXiv:1408.3346v1 (2014)): Introduction and Theorem 0.1; §3.4–3.11 comparison; Theorem 5.3 and its spectral-sequence proof. [Text](https://arxiv.org/pdf/1408.3346v1).

- **Kanetomo Sato, Cycle classes for p-adic étale Tate twists and the image of p-adic regulators** (Documenta Mathematica 18 (2013), pp.177–247): §8.1–8.10, especially Definition 8.3, Proposition 8.4 and its proof. [Text](https://ems.press/content/serial-article-files/26173).

- **Pierre Berthelot and Arthur Ogus, Notes on crystalline cohomology** (Mathematical Notes 21 (1978), public scan): Chapter 2, Gauss–Manin discussion; Chapter 7, Theorem 7.8 and Corollaries 7.9–7.13; statement at PDF p.147 visually read; Appendix B2.1 original statement, compared with the complete official correction. [Text](https://math.bu.edu/people/yangzhe/BO_Crystalline.pdf).

- **Pierre Berthelot and Arthur Ogus, Erratum to Notes on Crystalline Cohomology** (Official erratum, 21 August 2013): Entire two-page correction to Appendix B2.1. [Text](https://math.berkeley.edu/~ogus/preprints/BO_B2_Erratumre.pdf).

- **Aise Johan de Jong, Crystalline Dieudonné module theory via formal and rigid geometry** (Publ. Math. IHÉS 82 (1995), pp.5–96): §§2.1–2.3, actual crystal evaluations, finite locally free conditions, connection and Frobenius; §3.1–3.2.1, deformation statement and proof. [Text](https://www.numdam.org/article/PMIHES_1995__82__5_0.pdf).

- **Howard M. Thompson, Toric singularities revisited** (arXiv:math/0305441 author version (2003); Journal of Algebra 299 (2006)): §3.1 condition (*), definition and local conventions; §3.5 chart formulation and Theorem 3.14. The cited Kato proof is not claimed read.. [Text](https://arxiv.org/pdf/math/0305441).

Missing complete proof sources are identified by the three gaps: the logarithmic Abhyankar/fs descent proof cited through Temkin, Kato’s local log-smooth/log-regular theorem proof cited by Thompson, the auxiliary nonnoetherian approximation chain used for the O_C formal boundary and period-base identification, and the oriented geometric Tate-curve valuation computation. The root-chart, local dimension and rank-two acceptance statements do not fill these gaps. Broader motivic, alteration, automorphic, ordinary Witt and syntomic results from the routed papers belong to their other stages/owners and are not planned a second time here.

Four source issues are recorded with versions and correction searches. BO Appendix B2.1 uses the official 21 August 2013 projective inverse-system correction. Qian’s inverse-limit claim retains properness, scoped specifically to the companion arXiv v1 rather than the published 2023 potential-automorphy paper. BKV Remark 2.4(1)’s chart criterion uses q+q′=φ(p), as required by the group cokernel. Kato p.222 calls the final Künneth theorem 6.11 in its introduction and prints 6.12 in its heading; both labels and the page are recorded. The BO issue is officially corrected; the other correction searches and their limits are explicit.

## Suggested Lean file: verified shapes and omissions

`lean-check research/blueprint/suggested/CrystallineCohomology--CR.5.lean` finished with exit status **0** against the shared pinned Mathlib build. Its 396 warnings were exclusively declarations using `sorry`; there were no errors or other warnings. Memory was checked before compilation and exceeded the 20 GB threshold. No Lean language server, Lake build/update/cache download or additional project was started. No compile remains running.

Every packet main declaration and API name appears under its exact name: 253 names total. Each of the 165 test names appears immediately above its corresponding example. This is a signature experiment, not a formalization. The standard note and per-node comments specify that omitted geometric conditions remain in the definitive mathematical document. No arbitrary proposition fields substitute for missing conditions.

The prototype reuses the actual baseline groupification, PD structures, divided-power algebra/generators, Kähler and exterior algebra, Witt operations, module presheaves/scalar extension, derived categories, lifting properties and generic ind-category. The pinned Tau Ceti nilpotent exponential statement was read, but its module has no compiled object in the shared build; the file uses its underlying Mathlib `IsNilpotent.exp` operation instead. Compilation therefore checks pinned Mathlib signatures, not an import of the unbuilt Tau Ceti module.

The following omissions must be respected when reviewing the experiment:

- Log structure/chart constructors expose affine or geometric-stalk data. Full étale sheaves, scheme morphisms, the noetherian local rings/cotangent spaces in log regularity, toric étale maps in the smoothness criterion, tame normalization/descent and formal Spf geometry are missing supplier types. The log-regularity and Abhyankar signatures give their numerical or root-chart slices; they are not the full geometric theorems.

- Fine-model records expose finite monoid and pushout data; the underlying fine log-smooth scheme and localization conditions are omitted. PD envelope records retain ring/log maps, PD ideals and compatible morphisms, with a typed universal property; finite-level scheme/base hypotheses and exactifying neighborhoods are omitted where unavailable. The crystalline site is a supplied category with covering data, and crystals are coherent module presheaves with scalar-pullback isomorphisms; the omitted étale module-sheaf condition remains required in the document.

- Connections retain Leibniz maps, a degree-two zero-curvature condition and actual horizontal cochain maps. Stratifications retain double/triple diagonal maps and the cocycle. Quasi-nilpotence is the one-coordinate falling-factorial slice; full multiindices, log-coordinate independence and formal continuity are omitted. The PD de Rham complex, Poincaré/descent comparison and formal derived limit use supplied differential or derived functors, with the source geometric identification omitted.

- The unique-lift prototype records affine exact lifting data; unique isomorphism and QC/Frobenius descent remain mathematical conditions in the packet. A_cris is a supplied coefficient ring/chart, with actual rational characteristic tests; period-ring and finite-level lift identifications are omitted. HK prototypes retain semilinear Frobenius, monodromy, their relation, nilpotence hypotheses, normalized unit logarithm and the finite exponential. Proper generic-fiber comparisons and their geometric map identifications are omitted supplier types. The Tate block tests its algebraic sign and nonzero monodromy, while the geometric valuation proof is a recorded gap.

- DL and log rigid complexes expose supplied derived pushforwards or supported modules, with the actual tube/log-Witt geometry omitted. Stein data retains a separated topological module with continuous operators, while full Fréchet strict-limit/exhaustion statements and completed scalar extension are RD.5 inputs. The tower uses the existing generic `Ind.lim` with coherent diagrams and induced actions; identification of the source category with Fréchet spaces and of the actions with the geometric tower remains an analytic input.

- Coefficient evaluations retain finite and projective modules; the crystal evaluation and tensor/dual identification maps are supplied. Arithmetic coefficients retain actual semilinear operators and filtrations; horizontality and transversality are omitted where their differential supplier is unavailable. Dieudonné evaluation accepts the R07 contravariant functor with actual F,V maps and the standard tests; its general crystal construction is not reassigned. Messing’s exact maps are exported, with their geometric identifications supplied. Relative direct image and base change are actual supplied derived objects/maps. Gauss–Manin retains finite-projective cohomology, a specified connection boundary and zero curvature; its absolute-complex/base-form identification remains a supplier condition.

## Validation and next action

`python3 scripts/check_blueprint.py research/blueprint/packets/CrystallineCohomology--CR.5.json` reports **0 errors and 0 warnings** with the inventory above. The machine’s optional default declarations index was absent, so the checker performed reference-form checks; it is not described as a full index audit. The 25 actual cited statements were separately read at the pinned commits, including the module, derived, scalar-extension, lifting and ind-category primitives. All node implementations remain unchecked.

The source-issue schema and version metadata were validated with `source_issues.check_issues` and `check_errata.versions_checked`. The independent name/test audit reports no missing or extra names. JSON parsing, source excerpt presence, the absence of private absolute paths, reader/packet names and authorized-file scope were checked. The whitespace diff check passed before commit. The deliverables are submitted on the session branch for the automatic Swarm submission check; independent review and mathematical closure are follow-up work.

An independent reviewer should first verify the non-fine branch and owner boundaries, then the right-wedge N convention and uniformizer sign, then Qian’s properness and DL support ordering, then the contravariant Dieudonné twist and relative local-freeness hypotheses. A follow-up should obtain the three missing proof chains, resolve the nine supplier interfaces and same-roadmap refinements, and apply the proposed QC substage/AI.6 dependency and RD Part II. No stage should be marked closed before those inputs are supplied.
