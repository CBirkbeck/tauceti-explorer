# PKG-PadicFamilies — handoff

Refs [#9888](https://github.com/CBirkbeck/tauceti-explorer/issues/9888). Codex, session `codex-1f0cyN`, 16 October 2026. The [bot confirmed this claim](https://github.com/CBirkbeck/tauceti-explorer/issues/9888#issuecomment-6211934424). Branch `codex-1f0cyN-padic-families`, base `cf8cb3a4ad56d62091e52c0f515d4fe0f1f26ad3`.

**Status: package complete for independent package review.** This is a roadmap submission, not proof closure or formalization. The accepted target-level plan has 121 nodes, 21 gaps and 15 supplier requests. All targets are represented in the package; the missing mathematical inputs are specified as construction/proof targets or exact supplier contracts. No packet, existing reader, campaign file, atlas data or external roadmap was changed. The source/proof limitations below remain material for the next review and eventual implementation.

## Deliverables and shape

- `research/blueprint/packages/PadicFamilies/README.md`: eight layers in build order, summary, scope, conventions, supplier contracts, full mathematical targets, named APIs, discriminating Checks, worked examples and dependencies in every layer, downstream consumers and version-specific references.
- `research/blueprint/packages/PadicFamilies/Suggested.lean`: only light real-bodied definitions on existing carriers, theorem signatures and examples; one module docstring and the `TauCetiRoadmap.PadicFamilies` namespace. The later layers have comments because their carriers require mathematical constructions. A closing comment identifies the heavy README objects. No sorry'd data and no theory development.
- `research/blueprint/packages/PadicFamilies/metadata.toml`: `topic = "math.NT"`.
- This handoff preserves the coverage, ownership and source records after the scratch directory is deleted.

The light definitions are `ordinaryProjector`, `ordinaryPart`, `nonOrdinaryPart`, `IsLocallyFiniteEnd`, `augmentationAnnihilator`, `congruenceSubmodule`, `congruenceModule` and `congruenceIdeal`. Their milestones retain finite-set, complete-local finite-residue, and double-annihilator hypotheses, respectively. The polynomial augmentation example explicitly rejects the cyclic-quotient comparison without the double annihilator.

## Checks

- `lean-check research/blueprint/packages/PadicFamilies/Suggested.lean`: exit 0, **21 warnings, all declaration uses sorry**, no errors or other warnings. Shared pinned build; 90 GB available before the final run. No language server, Lake project, build, update or cache operation was started.
- `python3 scripts/check_blueprint.py research/blueprint/packets/PadicFamilies.json`: **0 errors, 0 warnings**; 121 accepted nodes, 69 baseline declarations, eight planned stages, one closed stage. The packet was checked, not edited.
- `python3 research/blueprint/intake.py check-files` on all four deliverables: **4 files checked, 0 problems**.
- `python3 scripts/check_sorry_data.py` on the suggested file: passed, no sorry-dependent data declarations.
- Mechanical coverage: all 263 API names across the accepted nodes occur in the README, including the two supplier-only objects. All 50 retained definition/construction topics have at least three original discriminating Checks, with additional Checks for the newly explicit comparison/construction targets. All eight layers end with worked Examples and Dependencies.
- Mathematical checks below are manual computations and source/hypothesis audits. A successful sorry elaboration establishes typing only.

## Ownership and changes from the accepted plan

The pinned baseline is Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. I read the cited declarations at those pins, including the actual hypotheses of the Fitting results, finite quotients, polynomial-operator localization, annihilator quotients and classical newform carrier. All 69 inherited declarations exist; their presence does not prove any family theorem.

The current read-only ownership check used TauCetiRoadmap `0d144d044dacebca17b654695b6f1ad58f159b27` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The reviewed `data/library-coverage.json` entries for all eight layers were read. The current DifferentialGeometry and ArithmeticDirichletSeries READMEs were read as full prose models; AdicSpaces and IntegralHeckeAndGaloisDeterminants supplied the signature style. The current ModularForms and IntegralHeckeAndGaloisDeterminants contracts were checked directly.

The nine roadmaps added after the atlas snapshot and the four named Completed roadmaps were searched in their current Suggested files. LocalGaloisGroups' finite group-ring projectives and OperatorTheory's Hilbert-space projections are different statements from compact Nakayama and nonarchimedean Fredholm constructions. Current Tau Ceti has classical carriers, bad-prime operator aliases and unrelated real/complex Fredholm results, not the family constructions here.

Two accepted nodes are imports, not repeated generic plans:

| Accepted node | Existing owner and treatment |
| --- | --- |
| `L0a/ordinary-idempotent-finite-algebra` | IntegralHeckeAndGaloisDeterminants §2.3. Exact supplier API and five Checks in the opening contracts; apply its commutative algebra theorem to R[t] inside a finite noncommutative algebra. |
| `L2a/projective-characteristic-polynomial` | IntegralHeckeAndGaloisDeterminants §0.6 and PadicMeasuresIwasawaAlgebras §5.1. Exact supplier API and four Checks; Q_f=det(1−Xf), reversal at the module rank even when degree drops. |

The remaining 119 accepted nodes are numbered topics below. Layer5 was reordered: weight algebra, quaternionic projector, Hecke algebra, level collapse, duality, freeness, Hecke finiteness, control, density, then the parallel Hilbert and period applications. This removes the original forward construction dependencies. All local references were renumbered.

Ownership moves already required by the tier order are retained: the quaternionic ordinary projector, Hecke algebra, level-collapse and tower duality belong here rather than in the higher OrdinaryAutomorphicFormsAndModularityLifting R21.1. The family Selmer instance uses SelmerIwasawaCohomology, replacing older R07 bookkeeping. The parallel-weight Hilbert coefficient/control construction is here; it does not cite the higher HodgeTateAndCanonicalSubgroups or IgusaVarietiesAndTorsionConcentration roadmaps. Single-weight symbols, measures, generic determinants and rigid geometry remain with the named lower owners.

Additional application targets are now explicit rather than being asserted to follow from unrelated suppliers: ordinary Igusa and weight-two rank comparisons; trace-compatible homology moments and integral period pairing corrections; residual ordinary Ihara injectivity and full-Hecke vanishing; analytic chart/descent and finite-character control; elliptic overconvergent-form Banach modules; Eisenstein local smoothness; dagger theta radius comparison; the normalization and integral ordinary-line bridges; Selmer correction cones; integral Coleman/regulator and analytic period comparisons; nonordinary Galois/Robba/triangulation/Eichler–Shimura interfaces; central class-set fibres; character-twisted ordinary control and projective descent; all-degree parallel Hilbert control and full bad-prime semisimplicity.

## Every inherited gap has an explicit destination

These destinations specify work to be formalized. They do not mean that this package supplied the missing primary proofs.

| Inherited gap, in packet order | Package destination and treatment |
| --- | --- |
| Coleman forms and comparison | §2.10: `ellipticColemanForms` Banach/radius/q-expansion/base-change/classicality APIs; `eigenvariety_classicalComparison`, reduced closed immersions and separate reducedness. Primary Coleman proof still needs reading. |
| Components and density | §2a.14: Chenevier finite Hecke-image dimension argument; Conrad component/factorization contracts with relative factoriality. §2.8 states separate finite-character control and arithmetic density. |
| Higher-weight quaternionic control | §5.8: highest-weight moment map with character/conductor and ordinary kernel/cokernel calculation. Original Hida proof remains to verify. |
| Ordinary homology control | §§1.1–1.3: cohomology versus homology towers distinguished; dual/divided-power coefficients, trace moments, ordinary control and rank-one proof. Original Hida primary proofs remain to verify. |
| Big Galois representation and filtration | §§4.1–4.2: cohomological lattice, EPW/Ochiai normalization bridge, integral saturated ordinary line from p-divisible geometry. Hida–Wiles primary proofs remain to verify. |
| Two-variable Coleman map | §§4.6–4.7: separate KLZ logarithm and Ochiai map; 2003 manuscript Theorem3.13 with Gorenstein, normality and (MW), and separate 2005 branch-coefficient extension. |
| Nonordinary family inputs | §4.9: named family Galois module, relative Robba module, Herr/Iwasawa comparison, noble triangulation and family Eichler–Shimura/regulator targets, as quoted precisely by LZ. Underlying Liu/AIS/KPX proofs remain to verify. |
| Weight-two rank | §0.11: `ordinary_weightTwo_rank`, retaining the diamond components in Hida (5.8). Hida1985/Ribet proof remains to verify. |
| Raw versus free-closure congruences | §1.10: comparison with reflexive hulls and finite/pseudo-null correction; equality only under reflexivity. |
| Global coefficient charts | §§2.1–2.2: analytic universal-character charts/radii, including high conductors; bounded tensor multiplication, not full tensor-dual equality. |
| Banach symbol descent | §2.2: nice PID unit-ball argument plus `familySymb_chartDescent`; §§2.3–2.7 retain the E₂ global-image fibre. |
| Critical-slope zeros | §3.12: explicit unequal-slope paired-interpolation lemma and valuation proof, with zero functions handled separately; Pollack Lemma3.2 and Theorem3.3 proof read. |
| Galois normalization | §4.1: explicit dual, Tate, Teichmüller and universal-character bridge; j=1 still has a cyclotomic twist. |
| Selmer perfectness/local comparisons | §§4.3–4.4: named local control/error cones, extended H¹ versus classical kernel, normality/perfectness/generic acyclicity and alternating determinant lengths. |
| KLZ–Ochiai and periods | §§4.6–4.7: local regulator bridge, kernel/pole terms and analytic lattice map with fractional correction ideal; unit only for integral lattice isomorphism. |
| Quaternionic torsion-character finiteness | §5.6: twisted level control on every prime-to-p torsion factor, uniform finite generators, compatible projective descent, unramified faithfully flat descent. No constant group-ring rank claim. |
| All-degree Hilbert control and semisimplicity | §§5.10,5.12: separate all-degree ordinary tower/control/duality target and full minimal-level U-operator semisimplicity. DKV restatement is not the primary proof. |
| Quotient versus eigensymbol periods | §1.4: actual integral pairing map, saturation/factorial corrections, fractional correction ideal; unit comparison conditional on perfect saturated pairing. |
| Branch degeneracy comparison | §1.12: exact EPW ε_ℓ* maps and residual/full-Hecke vanishing statements before integral branch period comparison. |
| Theta radius comparison | §3.6: global dagger radius-loss sequence, determinant twist, U_p slope shift and finite-slope radius links. Fixed-radius surjectivity rejected. |
| Unquotiented definite class set | §5.2: central quotient map, ray-class fibre comparison with level units and finite reduced-norm square kernel. |

## Supplier requests preserved as exact interfaces

The 15 inherited requests are not silently treated as available library declarations. The README opening states the contracts; the application targets prove the parts not in the suppliers' stated scope.

| Supplier | Exact use and destination |
| --- | --- |
| AdicSpacesPartII R0 | Tate algebras at real radii, products, residue fibres and preparation: §§2a.1–2a.4. |
| AdicSpacesPartII R2 | Existing rig-point/formal-model/separation/flattening/quasi-finite interfaces, with hypotheses: §2a.3 and Conrad AppendixA.1. No claim that these formal-model nodes are absent. |
| AdicSpacesPartII R3 | Finite coherent algebras, affinoid restriction, descent and components: §§2a.9,2a.14. |
| PadicMeasuresIwasawaAlgebras L0a | Weight space and universal character; this package constructs its analytic coefficient-chart/radius instance: §§2.1,2.2,2.8. |
| ModularCurvesPartII R13.2 | Elliptic/Igusa moduli and Tate curves: §0.1; the ordinary family comparison is a target here. |
| ModularCurvesPartII R12.5 | Weight-k sections, differential normalization and classical Hecke action: §§0.1–0.3. |
| PadicMeasuresIwasawaAlgebras L1 | Completed group algebra, weight coordinate and continuous action: §§0.7,1.5,5.1. |
| GlobalGaloisDeformations R04.3 | Adjoint finite Selmer group and exact constrained refined tangent bound: §§3.4–3.5. |
| HilbertModularVarietiesAndShimuraCurves R18.3 | Auxiliary free levels, pullback and integral pairings: §§5.2–5.7; finite central fibres are constructed here. |
| GL2AutomorphicRepresentationsAndTransfer R16.6 | Classical adelic Hilbert forms, weights, full Hecke/newform and q-expansion geometry: §§5.8,5.10–5.13. Ordinary family control is a target here. |
| ModularCurvesPartII R14.3 | Integral/relative homology, cusp paths, Hecke/sign/trace actions and algebraic coefficient systems: §§1.1–1.5. |
| ModularCurvesPartII R14.6 | Residual ordinary multiplicity one plus extension to ordinary p-divisible connected–étale geometry: §§1.3,4.2. Its ℓ≠p Tate theorem alone is insufficient. |
| Current ModularForms Layer8 | Relative path classes and matrix actions: §1.5. Full family trace/control is separate. |
| Current ModularForms Layer4 | Full newform bad-prime eigenproperties and primitive semisimplicity: §§0.15,5.12; pinned Newform's good-index fields alone are insufficient. |
| LocallyAnalyticDistributions L4 | Banach, compact/Fredholm/Riesz machinery and symbol-kernel criterion: §§2a.1–2a.17,2.1–2.3. Nice-chart proof and global application descent are specified here. |

## Adversarial mathematics pass

I checked the definitions against their examples and negative examples, and checked the theorem hypotheses against the degeneracies below and the relevant source arguments. The source qualifications and additional proof targets are deliberate; no equality is justified solely by a name search, sorry elaboration or equality of geometric point sets.

| Statements/identities checked | Instances and calculation | Outcome/change |
| --- | --- | --- |
| §§0a.1–0a.9 finite projectors, Fitting, exactness and localization | Zero module; U=0,1; multiplication by2 on ℤ/6 (projector4, image order3, kernel order2); multiplication by2 versus3 on ℤ/8; same factorial index for source/target | Finite underlying set retained, naturality threshold not fixed independently of both modules. |
| Finite-algebra supplier | t=[[1,1],[0,p]] has upper-right power entry (1−p^m)/(1−p), projector [[1,(1−p)⁻¹],[0,0]]; scalar2 over discrete ℂ fails convergence | Finite residue, completeness and noncentrality distinguished; no division by p. |
| §§0a.10–0a.19 profinite/complex operations | diag(1,p) on ℤ_p²; diag(1,ϖ) on 𝔽_q[[ϖ]]²; two-term R→R byϖ and U=1 | Topological nilpotence, not literal nilpotence; cohomology may be R/(ϖ), not projective. |
| §§0a.20–0a.27 local finiteness and derived factors | Identity on completed infinite direct sum is locally finite but not perfect; shift reduces to an infinite independent orbit; unit/nonunit and zero complex | Perfect ordinary factor is an explicit hypothesis; representative idempotents not equated in a nonperfect derived object. |
| §§0.1–0.16 weights/control | p=5 weights j(a)=4,5,6,3; finite Teichmüller components; constants dual XΛ⊕Λ^{r−1}; multiplication of a normalized family by X | p≥5 scope fixed; finite characters retained; constants lattice not discarded; weight-two rank is its own target. |
| §§1.1–1.6 towers and integral periods | Trace versus pullback; dual polynomial moment j! when p divides j!; θ′=uθ has inverse basis u⁻¹θ⁻¹(1) | Cohomology/Hom dual and coefficient lattice explicit; perfect integral pairing required for a unit period ratio. |
| §§1.7–1.8 raw congruences | Fibre product O×_{O/(ϖ^n)}O gives O/(ϖ^n); identity augmentation gives0; dual numbers give O; polynomial augmentation has I=0 and double annihilator A | Double-annihilator hypothesis retained in prose and Lean; IKM finite-length/depth hypotheses separated. |
| §§1.9–1.12 branches and Euler factors | Empty Σ product1; two independent diamond/cyclotomic symbols; nonreflexive rank-one lattice versus its hull; units versus nonunits in pairing | Raw/free-closure discrepancy and branch Ihara input explicit; no circular Galois prerequisite in defining the Hecke branch. |
| Projective polynomial supplier | Rank0 gives1; scalar a gives1−aX; 2×2 determinant1−trX+detX²; nonprincipal invertible ideal (2,1+√−5); f=0 rank d reversal X^d | Corrected determinant normalization and degree-rank reversal; no fictitious free basis. |
| §§2a.1–2a.14 spectral charts/gluing | U=diag(1,p) gives roots1,p⁻¹; repeated full multiplicity versus a shared factor; nonflat specialization versus affinoid flat restriction | Coprime factors, flat Hecke base change and relatively factorial component hypothesis retained. Spectral and U eigenvalues are inverse. |
| §§2a.15–2a.17 complex support and eigenmodule | R→R identity differential cancels cohomology though termwise determinants exist; empty block; E[t]/t^e residue fibre versus full generalized factor | Homotopy-invariant cohomological support differs from a product of termwise Fredholm divisors; eigenmodule fibre conventions fixed. |
| §§2.1–2.3 analytic coefficients | Full R-dual evaluation z↦T versus completed tensor module; nice PID unit-ball reduction; weight0/sign−/ν≥1 gives E₂ quotient | Tensor-dual equality rejected; global chart/descent named; E₂ quotient retained. |
| §§2.4–2.10 eigencurve comparison | E versus E[ε]/ε² has same points; strict slope k+1 endpoint; high-conductor character needs level Np^r; root α gives coordinate α⁻¹ | Generalized fibres not inferred from points; reducedness separate; finite-character density and elliptic Coleman modules explicit. |
| §§3.1–3.5 criticality and smoothness | Ordinary nonsplit critical-slope refinement can be noncritical; split CM critical refinement; Eisenstein versus cuspidal tangent problem | Numerical critical slope not identified with criticality; smoothness of C retained for Eisenstein, equality of cuspidal germs only for cuspidal f. |
| §3.6 theta | At r=1 inverse derivative moments1/(n+1) unbounded; smaller radius compensates; locally analytic derivative has piecewise-constant kernel | Dagger radius loss, global polynomial kernel, determinant twist and U_p shift required. |
| §§3.7–3.11 local rank/eigenline/vanishing | E[t]/t^e has dimension e and one-dimensional socle t^{e−1}; opposite Eisenstein sign; θ-critical exceptional top moment | Generator of whole generalized module not mistaken for eigenvector; exceptional Eisenstein interpolation retained. |
| §3.12 zeros | Constant1 fails any inference from growth bound; zero function handled first; unequal slopes give linear-in-n valuation difference; equal slopes do not | Added paired-interpolation proof using Pollack's finite-zero lemma; extends the proof to one zero slope with explicit argument. |
| §§3.13–3.14 two variables and secondary functions | e=2 diagonal sum1⊗t+t⊗1 specializes to t; parameter/generator change acts triangularly; Mellin can have kernel | Diagonal eigenvector, henselian local normal form and intrinsic filtration retained; no strict flag-dimension claim. |
| §§4.1–4.2 Galois conventions | j=1 includes χ; dual of exact ordinary sequence reverses sub/quotient; pO⊕0 is nonsaturated in O² | Dual/Tate bridge and saturated integral line named; ℓ≠p semistable theorem not substituted. |
| §§4.3–4.4 Selmer and determinants | Local H⁰ contributes to extended Selmer H¹; two-term DVR complex multiplication byϖ^n fixes alternating/inverse determinant convention | Perfectness, generic acyclicity, local base-change errors and characteristic-ideal corrections retained. |
| §§4.5–4.8 reciprocity/divisibility | Coefficient Frobenius versus group-ring element; Ξ classϖ^n gives length n, zero class infinite; pseudo-null supported in codimension2; (Lp Pτ^k) inclusion | Correct map/domain/hypotheses and divisibility orientation; period ratio requires lattice isomorphism. |
| §4.9 Coleman regulator | Positive slope α has norm<1 but α⁻¹ norm>1; α=1 violates regularity; critical nonsplit versus split noble point | Norm-bounded parameter is α, domain R_A(α⁻¹); restricted noble neighbourhood and Iwasawa domain retained. |
| §§5.1–5.5 weight/towers | Prime-to-p character-supported projective has zero trivial coinvariants; p-primary torsion retained; constants at a=0 have N𝔭+1, at a≥1 have N𝔭 | No group-ring constant-rank conclusion, no untwisted-only finite generation; level and adjoint conventions retained. |
| §§5.6–5.9 quaternionic freeness/control/density | Every torsion factor; fixed-level idempotent presentations; μ=0 versus μ>0 highest-weight evaluation; vertical minimal prime would contradict weight torsion-freeness | Twisted control/descent and algebraic moment targets explicit; dominance precedes density. |
| §§5.10–5.14 parallel Hilbert/periods | Odd-degree F requires separate construction; ideal(ϖ,T) torsion-free nonfree; χ conductor versus tame oldforms; generic rank1 versus integral free rank1 | All-degree control and full bad-prime semisimplicity explicit; period invertibility only under integral Hecke-rank-one hypothesis. |

## Source versions and reading limits

All text is written in our own words. No PDF, source passage, source excerpt or section-by-section source summary is in the repository. The maintainer's cleared library was used in place for restricted author copies; no uncleared book copy was used. Public PDFs and temporary text stayed in scratch and are deleted after submission. Dates below are **2026-10-16** rechecks, distinct from the inherited review's dates.

The table records the actual bytes used and the relevant passages read, not a claim to have read every proof in each cited work. Manuscript and published pagination are distinguished in the README.

| Source/version | SHA-256 | Relevant reading |
| --- | --- | --- |
| Khare–Thorne arXiv1409.7007v2 | `f8a86b8d7dfd290b9b4199931238f21392cb9c82d609f0879060a890e58ec0b4` | §2.4, Lemmas2.10–2.13, pp.9–14. |
| Hida, ENS19 (1986), Numdam | `a52ea23bc8b2357746cb2191335c7af394d96c752f6e1926d3e15b995504e5a6` | Introduction; §§1,3–6 at the cited ordinary duality/control/congruence arguments, especially pp.237–242,248–253,258–262. |
| Buzzard, 2 August2006 author manuscript | `0c54243868e2da8849452c4cc5a3d4e7b118cf17dd04487d4af137ab167ef57d` | §§4–5, especially pp.27–31 and34–43; Riesz/chart/gluing/flatness/link and point proofs. |
| Chenevier, glnfam.pdf author manuscript | `eaba21cc414dd7d2431e89cb53c637dd9c362c59773f8e193ddc507ded9f496e` | Lemma6.2.10 pp.47–48, Proposition6.4.2 p.53, Lemma6.4.3 and Corollary6.4.4 p.54. |
| Conrad, Modular curves and rigid-analytic spaces, cleared author manuscript | `ab6daecb7fa0679170fdd6b92021f206a9c990f621fc246eb146c3220d64e2bc` | AppendixA.1, TheoremA.1.2, pp.37–40. |
| Conrad, Irreducible components of rigid spaces, cleared author manuscript | `cff85f8e59393eedc8ebd891daa537ed62a9e9b1515f794983431da10c0252eb` | §2.2 pp.13–16, including Corollaries2.2.7 p.15 and2.2.9 p.16; Theorems4.2.2 p.29 and4.3.2 p.31. |
| Bellaïche, arXiv0912.2925v1 (2009) | `0a1c068cfc36704c02bd741be37ef95b0ac3216db3e9293364a6368843701032` | §§2–4 at the criticality/smoothness and local eigenline/Mellin arguments, especially pp.18–22,26–41; old coefficient assertions are replaced by the later author version. |
| Bellaïche, criticalbeforepublication2.pdf (22 July2011) | `e95f4ca3a1c85d9b087dda04516f06a1d89a80f1b67015ad215b7d1567d93a5a` | §§3.1–3.2.4 pp.22–32 in full; Theorem3.27 pp.37–40 for the global-image comparison. |
| EPW arXivmath/0404484v1 | `d2d3fa555f638068a5edbaa94821956ccce5deb0500b3839ee37c0084ed10721` | §2 pp.18–22; §4.1 pp.28–31, §§4.3–4.5 pp.32–33,37–43; residual Ihara maps/vanishing and period conventions. |
| Skinner–Wiles, IHES89 (1999), Numdam | `ec0697b3e9c9fa68063b19688f10347d204a8b7b86526384c9ccd6e7fe30e6f3` | §3.2 printed pp.32–38 (PDF printed offset+3), including the projectivity/finite-generation issue. |
| Pilloni, Duke169 (2020), cleared author copy | `4c05724efeab1dbbb108f980ec9a722127d2a8cd2abf6e8c2a6a2251cf0f9f58` | §2 pp.7–11 and §13.1 pp.83–85. |
| BCGP arXiv1812.09269v3 | `7c8d74b0628d8b9cc841a853372ca2d0bc18c086ab46d138f75afd15f35689ed` | §2.11 pp.40–41; finite-slope complex and coherent application passages pp.139,152–153. |
| ACC, Annals197 (2023), cleared author copy | `c5429e4f384384045dbb48502d71547bb21699783c0f77cce27b24e742467f02` | §5.2, especially printed pp.992–1000; Propositions5.2.15 and5.2.17. Not the old arXivv2 bytes. |
| DKV, Annals188 (2018), journal PDF | `974e64272b1883923fac951f86f3491593543d050c8efaf739e53342623fb659` | §3.1 pp.846–847, §3.3 p.850, §4 pp.857–858. |
| Ochiai, AIF55 (2005), Numdam | `3bac841605774f691813344359ed8aa1c03b4e6bf5f7aefc9d60ea77d960b581` | §1 pp.114–121; §3 Propositions3.6 pp.131–135 and3.11 pp.135–137; §4 specialization/reduction passages pp.140–144. |
| Ochiai, coleman.pdf author manuscript (2003) | `519c1f9a5a35aa8b7bc516f4e2fe69382b125c6e40601a2d476812b3e3669b14` | Definitions3.1 p.9 and3.7 p.12, Theorem3.13 p.14, local modules/§5 construction passages pp.27–28; published theorem renumbered3.14. |
| KLZ arXiv1503.02888v6 | `2530d973f05ff5a4e2338618dde66d3183c1feeb98abc94a05c8cd23183c504d` | §§8.1–8.2 pp.39–43, especially Theorem8.2.3 with kernel and pole terms. |
| LZ arXiv1506.06703v2 | `8c6aa8952fb3d5f481c33d39da7c4b8e462afe19c39a5b01050b515e63290bd4` | §4.6 pp.21–22, §§6.1–6.4 pp.28–30 and §7.1 p.31; single-family rank-one regulator distinguished from Rankin quotient. |
| IKM arXiv2206.08212v3 | `8f061724a1800af6319492108835f4db0fd640b93750c213fd1bb313bb8c9d7b` | §2.2 pp.13–17, including Proposition2.10 and Example2.11. |
| Pollack, Duke118 (2003), author-hosted journal PDF | `23d0975b7d641d7d6dba7832e3cc45efb9fccf506dbedac2b78e1f8a95dcd581` | Printed pp.532–534, Lemma3.2 and Theorem3.3 with proof; equal-slope result distinguished. |

Newly consulted public copies are Ochiai's [Coleman-map author manuscript](https://www.ochiai.math.sci.titech.ac.jp/coleman.pdf) and Pollack's [author-hosted journal PDF](https://math.bu.edu/people/rpollack/Papers/On_the_padic_Lfunction_of_a_modular_form_at_a_ss_prime.pdf). The Conrad component source is cited by its [Numdam publication page](https://www.numdam.org/item/AIF_1999__49_2_473_0/), while the internal-page locators refer to the cleared author copy. Chenevier and the later Bellaïche author copies have the actual hashes above, superseding the failed first retrieval entries in temporary scratch notes.

### Primary-proof inputs still requiring verification

Do not read the package's construction targets as a claim that these primary arguments were verified in this run:

- Hida Inventiones85 (1986), ordinary cohomology control and the original big representation; Hida AJM110 (1988) Theorem1.9; Wiles Inventiones94 (1988) Theorems2.2.1–2.2.2. EPW and Ochiai state the uses, but the primary proofs were not obtained/read.
- Hida Inventiones79 (1985) Proposition6.2 and the Ribet weight-two rank input used on Hida1986 p.262.
- Hida's higher-weight nearly ordinary Corollary2.5 cited by Skinner–Wiles, and Hida Annals128 (1988) Theorem3.6/Corollary3.7 pp.381–382 cited by DKV for full ordinary reducedness.
- Coleman's primary overconvergent elliptic-form construction and strict classicality proof; Bellaïche's quoted comparison and its later correction were checked, but these do not replace Coleman's proof. The exact analytic construction and comparison targets remain in §2.10.
- The primary Eisenstein local smoothness calculation behind Bellaïche Theorem2.16, and the primary refined-period deformation input used in its cuspidal case; §3.5 separates those targets.
- Liu, Andreatta–Iovita–Stevens and Kedlaya–Pottharst–Xiao primary family proofs. LZ's precise quoted interfaces were read; §4.9 plans those application theorems and does not cite a nonexistent lower-tier implementation.
- The extension from Ochiai2003's stronger Gorenstein/(MW) hypotheses to the normal branch-coefficient formulation in Ochiai2005, and the integral analytic period bridge to Layer1. The package explicitly requires the additional construction instead of inferring it from generic rank one or KLZ's distinct logarithm.
- The new global analytic chart/descent and finite-character control interfaces, complete-flat supplier extensions, torsion-character projective descent and all-degree Hilbert ordinary control need full implementation proofs. Their named targets and negative tests specify the required generality.

These limitations concern primary-proof verification and mathematical implementation, not missing package files. Resume a review at these interfaces and the 21-gap destination table; no scratch file is required.

## Accepted target-to-topic correspondence

All names below omit the common `PadicFamilies:` prefix. A topic includes its full statement/hypotheses, source and direct dependencies; definitions/constructions also retain APIs and Checks. The two supplier-only nodes are listed separately above. The packet itself remains unchanged.

| Accepted target | README topic |
| --- | --- |
| `L0a/factorial-iterate-stabilises` | §0a.1 — Factorial iterates of a self-map of a finite set stabilise |
| `L0a/finite-ordinary-projector` | §0a.2 — Hida's ordinary projector on a finite module |
| `L0a/finite-fitting-comparison` | §0a.3 — The ordinary projector is the Fitting projection |
| `L0a/ordinary-part-bijective` | §0a.4 — U is invertible on the ordinary part and nilpotent on the rest |
| `L0a/finite-ordinary-decomposition-unique` | §0a.5 — Uniqueness of the ordinary decomposition |
| `L0a/ordinary-projector-natural` | §0a.6 — Naturality of the ordinary projector |
| `L0a/ordinary-projector-exact` | §0a.7 — Exactness of the ordinary part on finite modules |
| `L0a/ordinary-projector-quotient` | §0a.8 — Ordinary parts of quotients |
| `L0a/ordinary-part-localization` | §0a.9 — The ordinary part is the localization at U |
| `L0a/finite-quotient-system` | §0a.10 — Finite quotient systems adapted to an endomorphism |
| `L0a/profinite-ordinary-projector` | §0a.11 — The profinite ordinary projector |
| `L0a/profinite-ordinary-decomposition` | §0a.12 — The ordinary decomposition of a profinite module |
| `L0a/profinite-projector-natural` | §0a.13 — Naturality of the profinite projector |
| `L0a/adic-instance` | §0a.14 — Ordinary projectors on finite modules over complete local rings |
| `L0a/finite-inverse-limit-exact` | §0a.15 — Inverse limits of exact sequences of finite modules |
| `L0a/profinite-projector-exact` | §0a.16 — Exactness of the profinite ordinary part |
| `L0a/ordinary-part-complexes` | §0a.17 — Ordinary parts of complexes and their cohomology |
| `L0a/derived-ordinary-idempotent` | §0a.18 — The ordinary part of a perfect complex |
| `L0a/ordinary-complexes-inverse-limit` | §0a.19 — Ordinary parts along a tower of coefficient rings |
| `L0a/locally-finite-action` | §0a.20 — Locally finite endomorphisms of complete modules |
| `L0a/locally-finite-stability` | §0a.21 — Stability of local finiteness under extensions, quotients and products |
| `L0a/locally-finite-mod-maximal` | §0a.22 — Local finiteness is detected modulo the maximal ideal |
| `L0a/locally-finite-ordinary-projector` | §0a.23 — The ordinary projector of a locally finite endomorphism |
| `L0a/locally-finite-projector-exactness` | §0a.24 — Functoriality and exactness of locally finite ordinary parts |
| `L0a/locally-finite-derived-endomorphism` | §0a.25 — Locally finite endomorphisms of complete flat complexes |
| `L0a/derived-ordinary-direct-factor` | §0a.26 — The ordinary direct factor of a locally finite derived endomorphism |
| `L0a/semilocal-ordinary-projector` | §0a.27 — Ordinary projectors over complete semilocal coefficient rings |
| `L0/katz-padic-modular-functions` | §0.1 — Katz's p-adic modular functions and the q-expansion principle |
| `L0/padic-completion-of-classical` | §0.2 — p-adic modular forms are limits of classical forms (Katz) |
| `L0/padic-hecke-operators` | §0.3 — Hecke operators and the weight action on p-adic modular forms |
| `L0/universal-hecke-algebra` | §0.4 — Hida's universal Hecke algebra |
| `L0/ordinary-idempotent-hecke` | §0.5 — Hida's ordinary idempotent |
| `L0/hecke-duality` | §0.6 — Duality between Hecke algebras and modular forms |
| `L0/weight-algebra-action` | §0.7 — The weight algebra Λ and arithmetic points |
| `L0/jochnowitz-lemma` | §0.8 — Jochnowitz's lemma |
| `L0/ordinary-mod-p-weight-independence` | §0.9 — Ordinary mod-p forms live in bounded weight |
| `L0/ordinary-finite-over-lambda` | §0.10 — The ordinary Hecke algebra is finite over Λ |
| `L0/hida-control-theorem` | §0.11 — Hida's control theorem |
| `L0/ordinary-eisenstein-family` | §0.12 — The ordinary Λ-adic Eisenstein family |
| `L0/arithmetic-specialization` | §0.13 — Specialisation to classical ordinary forms |
| `L0/lambda-adic-forms` | §0.14 — Λ-adic forms as q-expansions and their duality with the ordinary Hecke algebra |
| `L0/primitive-components` | §0.15 — Primitive components of the ordinary Hecke algebra |
| `L0/compact-nakayama` | §0.16 — Nakayama's lemma for compact modules over complete local rings |
| `L1/ordinary-family-symbol-module` | §1.1 — The ordinary family modular-symbol module M_m |
| `L1/family-symbol-control` | §1.2 — Control of the family symbol module |
| `L1/family-symbol-free-rank-one` | §1.3 — Freeness of M^±_m: the family period line |
| `L1/family-period-line` | §1.4 — Family periods as trivialisations of an invertible module |
| `L1/family-measure` | §1.5 — The two-variable measure of a Hida family |
| `L1/family-measure-specialisation` | §1.6 — Specialisation to one-variable p-adic L-functions |
| `L1/congruence-module` | §1.7 — The congruence module of an augmentation |
| `L1/congruence-ideal` | §1.8 — The congruence ideal of an augmentation |
| `L1/reduced-hida-algebra` | §1.9 — The reduced Hida algebra T_Σ of a residual representation and its branches |
| `L1/family-congruence-module` | §1.10 — Congruence modules of a branch of a Hida family |
| `L1/period-change-of-trivialisation` | §1.11 — Change of trivialisation of the family period line |
| `L1/branch-l-functions` | §1.12 — Two-variable p-adic L-functions on the branches of a Hida family |
| `L2a/spectral-hypersurface` | §2a.1 — The Fredholm spectral hypersurface |
| `L2a/flat-spectral-charts` | §2a.2 — Flat quasi-finite spectral charts |
| `L2a/constant-rank-finiteness` | §2a.3 — Constant fiber rank gives finite charts |
| `L2a/newton-degree-loci` | §2a.4 — Newton polygons and fiber-degree loci |
| `L2a/strict-slope-neighborhoods` | §2a.5 — Strict neighborhoods with a fixed slope block |
| `L2a/admissible-slope-cover` | §2a.6 — An admissible cover by finite slope blocks |
| `L2a/slope-polynomials` | §2a.7 — A polynomial for each spectral block |
| `L2a/finite-hecke-images` | §2a.8 — Finite Hecke algebras on slope blocks |
| `L2a/hecke-chart-gluing` | §2a.9 — Gluing Hecke charts |
| `L2a/flat-eigenvariety-base-change` | §2a.10 — Flat base change of eigenvarieties |
| `L2a/linked-banach-families` | §2a.11 — Radius changes and linked Banach modules |
| `L2a/global-weight-gluing` | §2a.12 — The eigenvariety over weight space |
| `L2a/eigenpacket-points` | §2a.13 — Points and finite-slope eigenpackets |
| `L2a/equidimensional-components` | §2a.14 — Equidimensionality and components of the eigenvariety |
| `L2a/complex-spectral-hypersurface` | §2a.15 — The spectral hypersurface of a compact endomorphism of a complex |
| `L2a/complex-spectral-variety` | §2a.16 — The spectral variety of a compact endomorphism in the homotopy category |
| `L2a/coherent-eigenmodule-sheaf` | §2a.17 — The coherent eigenmodule sheaf on an eigenvariety |
| `L2/distribution-families` | §2.1 — Families of locally analytic distributions over an affinoid of weight space |
| `L2/family-modular-symbols` | §2.2 — Families of distribution-valued modular symbols with compact U_p |
| `L2/family-slope-pieces` | §2.3 — Finite slope pieces of family modular symbols |
| `L2/local-eigencurve-piece` | §2.4 — Local pieces of the modular-symbol eigencurve |
| `L2/specialisation-nilpotent-kernel` | §2.5 — Specialisation of Hecke algebras has nilpotent kernel |
| `L2/modular-symbol-eigencurve` | §2.6 — The eigencurves C^± from overconvergent modular symbols |
| `L2/eigensymbol-sheaf` | §2.7 — The coherent eigensymbol sheaf on C^± |
| `L2/small-slope-classicality` | §2.8 — Classicality of small-slope points of the eigencurve |
| `L2/etale-point-free-rank-one` | §2.9 — Freeness of family symbols at étale non-critical points |
| `L2/coleman-mazur-comparison` | §2.10 — Comparison with the Coleman–Mazur–Buzzard eigencurve |
| `L3/refinement-criticality` | §3.1 — Critical-slope, critical and θ-critical refinements |
| `L3/criticality-equivalences` | §3.2 — Equivalent forms of criticality |
| `L3/critical-slope-classification` | §3.3 — Which newforms have critical-slope refinements |
| `L3/decent-refinement` | §3.4 — Decent refinements |
| `L3/eigencurve-smooth-decent` | §3.5 — The eigencurve is smooth at decent points |
| `L3/theta-exact-sequence` | §3.6 — The θ exact sequence |
| `L3/family-symbols-free-rank-one` | §3.7 — Family modular symbols are free of rank one at decent points |
| `L3/local-hecke-algebra-structure` | §3.8 — The generalised eigenspace at a decent point |
| `L3/critical-eigenspace-dimension` | §3.9 — Bellaïche's theorem on critical eigensymbols |
| `L3/critical-p-adic-l-function` | §3.10 — The critical p-adic L-function |
| `L3/theta-critical-vanishing` | §3.11 — Vanishing at classical characters in the θ-critical case |
| `L3/critical-slope-infinitely-many-zeros` | §3.12 — Critical-slope L-functions have infinitely many zeros |
| `L3/two-variable-l-function` | §3.13 — Two-variable p-adic L-functions near a decent point |
| `L3/secondary-l-functions` | §3.14 — Secondary critical p-adic L-functions |
| `L4/ordinary-big-galois-representation` | §4.1 — Hida's big Galois representation and its nearly ordinary twist |
| `L4/ordinary-filtration` | §4.2 — The ordinary filtration of the big Galois representation at p |
| `L4/family-selmer-groups` | §4.3 — Greenberg and Bloch–Kato Selmer groups of the nearly ordinary deformation |
| `L4/family-selmer-complex` | §4.4 — The Selmer complex of the nearly ordinary deformation |
| `L4/big-beilinson-kato-classes` | §4.5 — Beilinson–Kato classes in Hida families |
| `L4/family-big-logarithm` | §4.6 — The Perrin-Riou big logarithm in families |
| `L4/two-variable-l-function` | §4.7 — The two-variable p-adic L-function of a Hida family and the family reciprocity law |
| `L4/euler-system-divisibility` | §4.8 — Euler system divisibility for the nearly ordinary deformation |
| `L4/coleman-family-regulator` | §4.9 — Triangulations and the regulator over Coleman families |
| `L5/totally-real-weight-algebra` | §5.1 — The nearly ordinary weight algebra of a totally real field |
| `L5/hida-freeness` | §5.6 — Hida's freeness theorem for definite quaternionic forms |
| `L5/hida-hecke-finite` | §5.7 — Finiteness of the nearly ordinary Hecke algebra over Λ′ |
| `L5/hida-control-nearly-ordinary` | §5.8 — Hida's control theorem for nearly ordinary Hilbert forms |
| `L5/algebraic-primes-dense` | §5.9 — Weight-two algebraic primes are dense on every component |
| `L5/quaternionic-ordinary-projector` | §5.2 — Hida's ordinary projector on definite quaternionic forms |
| `L5/nearly-ordinary-hecke-algebra` | §5.3 — The nearly ordinary Hecke algebra T_∞(U, 𝒪) |
| `L5/ordinary-level-independence` | §5.4 — The ordinary part does not grow in Γ₀(p^a)-level |
| `L5/ordinary-towers-duality` | §5.5 — Pontryagin duality for the ordinary quaternionic towers |
| `L5/lambda-adic-hilbert-forms` | §5.10 — Λ-adic Hilbert modular forms and their ordinary parts |
| `L5/hida-family-fourier-embedding` | §5.11 — A Hida family is determined by its Fourier expansion |
| `L5/hilbert-hecke-reduced` | §5.12 — The localised cuspidal Hecke algebra is reduced at minimal tame level |
| `L5/hecke-total-fraction-ring` | §5.13 — The total ring of fractions of the localised Hecke algebra and its eigenfamilies |
| `L5/quaternionic-period-module` | §5.14 — Period modules of totally real Hida families |

## Submission boundary

Open the PR with **Refs #9888**, record its URL in the runner's PR file, and inspect the swarm submission check. Fix only these four deliverables on the same branch if needed. Do not merge, close the issue, change labels, or claim a second job. The scratch directory is deleted after the PR is open; this handoff contains the durable record.
