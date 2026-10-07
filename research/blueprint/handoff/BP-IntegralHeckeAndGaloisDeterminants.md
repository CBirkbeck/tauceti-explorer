# BP-IntegralHeckeAndGaloisDeterminants — complete planning pass

Codex — session codex-O9kH6x, 7 October 2026. Refs #758. The bot confirmed this session’s claim before work began. This pass continues the Claude Code checkpoints and preserves their 36 node identifiers.

**Status: complete for independent review.** IHG.0–IHG.6 are all planned; none is closed. Every node remains unchecked. Complete means every target has a dependency plan, with precise proof leaves and supplier requests. It does not mean the mathematics is formalised or the gaps discharged. Work stops at 248 nodes because all stages are planned.

## Counts and coverage

- 248 nodes: 26 definitions, 39 constructions, 113 lemmas, 16 comparisons and 54 theorems.
- 209 API entries, 208 distinct names: the degree-one equivalence serves two outlines.
- 195 tests, three for each of the 65 definition/construction nodes.
- 33 planets, at most six per stage; 51 baseline declaration citations.
- 37 gaps, 19 supplier request entries, 16 source issues and four boundary proposals.

| Stage | Nodes | Status | Covered targets |
| --- | ---: | --- | --- |
| IHG.0 | 50 | planned | Laws, trace and characteristic coefficients, divided powers and representability, coordinate rings, projective/Azumaya determinants, duality, continuity and generalized reductive pseudocharacters |
| IHG.1 | 61 | planned | Field/henselian reconstruction, corners, GMAs, reducibility and extensions, lattices, completed CH finiteness, generic representation algebras, coefficient/symplectic descent, CN23 local lifting, disconnected reconstruction and deformation comparison |
| IHG.2 | 21 | planned | Chain/homotopy/derived/cohomology images, finite derived Hom, ghosts, splitting, finite-level localization, ordinary truncation and large-prime completion |
| IHG.3 | 17 | planned | GL/Satake and Frobenius dictionaries, rank-two comparison, GSp4 polynomials, full multiplier and Galois-type predicates |
| IHG.4 | 12 | planned | Gluing, uniform quotient witnesses, inverse limits, Frobenius uniqueness, completed evaluation and nilpotent quotient compatibility |
| IHG.5 | 11 | planned | Input-parametrized descent, quantified errors/limits, residual specialization, quotient reconstruction and lattice/local cohomology transport |
| IHG.6 | 76 | planned | Fitting ideals, difference modules/cocycles, local vectors and weights, both character branches, formal invariants, rational Borel cohomology, Buchsbaum–Rim complexes and both Ribet conclusions |

The packet is definitive for identifiers, hypotheses, prerequisites, locators, APIs, tests and remaining lists. The reader presents the same declarations in dependency order. The suggested file supplies signatures and test examples. No scratch file is needed by a follow-up.

## Baseline and checks

Baseline: Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174; Tau Ceti f790474821cf4256814db967cb154e7af3d0c369. Statements were inspected at those commits. The suggested file imports individual Mathlib modules and uses the existing build at exactly that pin, without relying on the shared Tau Ceti checkout’s newer HEAD.

Read data/library-coverage.json, audit/AUDIT-33.result.json and reviews/REV-AUDIT-33.md. The review document says accepted, while the aggregate still lists AUDIT-33 pending and has no promoted IHG records. Its assertions were checked directly at the pin without changing the aggregate. PolynomialLaw, DividedPowerAlgebra, derived categories, exterior powers, IsAzumaya and IsIdempotentElem.Corner are reused. The corner ring has identity e; its central coefficient-algebra structure and determinant are added interfaces.

**Lean compiled: yes.** The complete suggested file elaborates through lean-check with zero errors and only expected declaration-uses-sorry warnings. Memory was checked before compilation, with one compiler at a time. All 209 API entries were also checked by fully qualified name. This is signature elaboration, not proof verification.

scripts/check_blueprint.py reports **0 errors and 0 warnings**. The four deliverables pass intake.py check-files. Original identifiers, API/test coverage, source excerpt lengths, planet limits and allowed paths were checked.

Protocol §13 is followed: unavailable supplier conditions are omitted with explicit comments, never represented by fake Prop fields. Integral rational comodules/good filtrations await LP3; completed group algebra/CH completion await L1; some norm, slice and tensor-complex identifications await their suppliers. The reader and packet retain complete mathematical statements. A prototype with an “Omitted” comment must be read with that limitation.

## Conventions to preserve

Finite derived Hom and ghosts use bounded finite cohomology over a noetherian ring with explicit amplitude. Operator localization is an idempotent factor under artinian hypotheses; localization by p over Z_p is not such a factor. CC.8 owns completed inverse limits.

The generic representation ring is finite type, not generally finite as a module. Adapted-ring injection requires the split residually absolutely irreducible CH hypothesis. Corner degree comes from D(1−e+te), not trace. Projective/Azumaya determinants retain constant fiber rank.

For GSp4 the reversed polynomial has constant one and differs from the monic inverse-root polynomial. Spin/dual-spin multipliers are q³T₀ and q³/T₀. CG20 T₁ is Pilloni T_(ℓ,2); CG20 T₂ is Pilloni T_(ℓ,1). Keep the full multiplier in characteristic two and trace-zero fibers. Field-valued agreement cannot certify nilpotent coefficients.

Ribet cocycles use χψ⁻¹ and κ(g)=ψ(g)⁻¹b(g); local relations have sign α−1. The local weight multiplies the extended Fitting ideal in the coefficient overring. Global I=0 is allowed and vacuous under generic irreducibility. Fitting ideals use finite generators and all relations without finite presentation. Buchsbaum–Rim regularity requires all ordered prefixes; rank one uses weak regularity. Blocks with too few columns contribute zero ideals and are omitted from resolution factors. Complex tests check terms, differentials and integral signs.

## Follow-up work

Independent review comes first. After acceptance, stage follow-ups close the precise coverage.remaining lists and gap leaves. No second job was claimed.

- IHG.0: Lyndon/Amitsur, rational Procesi, divided-power grading/internal multiplication, integral generic matrices, projective exterior descent and Azumaya splitting/norm descent.
- IHG.1: norm/kernel descent, algebraic-algebra idempotent/matrix-unit lifting, adapted split injection, all-characteristic reducibility, primitive-projective Ext, lattice entry bounds, completed CH Nakayama, characteristic-two symplectic descent, disconnected centralizers/continuity, building models, noetherian deformation and slices.
- IHG.2: truncation/K-projective comparisons, telescopes, ghost factorization, complete finite-algebra factors, unbounded ordinary repair and discriminant completion.
- IHG.3: imported Satake, group-scheme and Artin interfaces with the exact coefficient conventions.
- IHG.4: completed evaluation and uniform quotient/closed-embedding inputs. Bounds must be uniform in quotient level.
- IHG.5: integral boundary-product cokernel and lattice/cohomology interfaces. TC geometry remains an input.
- IHG.6: integral rational comodule API, invariant generators, exterior-bar normal forms, Koszul/tensor exactness and compact-image/adic topology; follow formal relations → complexes → obstruction killing → stabilized minors → weighted Fitting containment.

Every unresolved item has named consumers in the packet’s gaps or requests; those full statements specify exact acceptance conditions.

## Supplier and boundary requests

The 19 entries request SR.4 integral Satake; ClassFieldTheory layer 7 reciprocity; Chebotarev layer 10 density; ReductiveGroups layer 9 integral/GSp carriers; SemisimpleAlgebras layers 0/2/3/4 radical, Artin–Wedderburn, density and central-simple interfaces; RG2.2/2.3 buildings and integral models; VS2 analytic localization; PadicMeasuresIwasawaAlgebras L1 completed group algebra; ArithmeticGaloisDuality R02.1 continuous H¹ with adic coefficient modules; LP3 invariant coordinates, disconnected complete reducibility, free-orbit slices and integral rational good filtrations; DD.1 regular-sequence Koszul exactness and tensor/K-flat comparison. The exact existing DD.1/koszul-complex node is imported.

No other roadmap’s files or atlas edges were edited. Four boundary proposals preserve accepted RS-24 ownership:

1. Add Semisimple algebras, Part II for general-ring Azumaya splitting/norm interfaces, keeping upstream’s field roadmap intact.
2. RT-AREA-langlands/18: IHG.2 → CompletedCohomologyPartII:CC.8; CompletedCohomologyAndLocalGlobalCompatibility:R31.3 imports CC.8 and keeps its GL₂ specialization.
3. RT-AREA-langlands/25 and /26: AutomorphicGaloisRepresentations:R19.6 imports IHG.1/4; AutomorphicGaloisRepresentationsPartII:AG2.4 imports IHG.4. Separate TC.3’s factor-separation algebra substage from TC.2, with AG2.4 and TC.3 consuming it. IHG.5 has no TC.2 construction prerequisite. IHG.3 takes the classical rank-two polynomial as an input, avoiding a dependency back to R19.6.
4. LP3 supplies integral/disconnected interfaces in its existing direction. LP2:semisimple-characters and GS.5 consume IHG.1 reconstruction; PadicMeasures L6 consumes generic Fitting theory.

## Sources and corrections

The packet records 24 sources and 29 version/access records with exact URLs, SHA-256 hashes, dates and locators. Relevant passages were read this run; inherited Chenevier records keep their earlier provenance, with a separate v2 PDF reread record. The two upstream documents read in full were Chebotarev and RepresentationTheory/SemisimpleAlgebras.

Read source groups: Chenevier §§1–2, Roby and Emerson–Morel; Bellaïche–Chenevier, Wake–Wang Erickson, Caraiani–Newton §3.2, Paškūnas–Quast, BHKT §§3–4 and Quast reconstruction/deformation; ACC+ §§2.2–2.3, Boxer–Pilloni ordinary complexes, Bökstedt–Neeman, Calegari–Geraghty, Calegari–Geraghty–Harris and Scholze; BCGP25, CG20, Pilloni20, Genestier–Tilouine, CHT08, Gee–Geraghty and BIP23; DKSW §§2–5 and Buchsbaum’s exterior-bar construction.

DKSW’s September 2023 manuscript was collated against arXiv v2, 26 October 2023. Quast’s author copy is v1, 23 October 2023; affected passages were compared with v2, 31 March 2026, and January 2026 publisher HTML. The 16 source issues retain literal excerpts, corrections, reasons and prior-record status: Chenevier’s missing factorial, DKSW sign/variable/inertia steps and Lemma 4.18 quotient repair, finite-degree good filtrations, indexing/evaluation typos, Quast self-duality/compactness steps, unbounded ordinary hypotheses and multiplier ambiguity. No inverse-Borel-weight erratum is claimed.

Published LMS Chenevier and Quast’s publisher PDF were unavailable; the latter endpoint returned a challenge page, so only HTML passages are attributed to that version of record. Restricted De Concini–Procesi, Roby’s later multiplication reference, Procesi’s rational theorem, the public all-characteristic reducibility proof and precise Lyndon/invariant-generator/exterior-bar interfaces remain explicit leaves. No PDF, extracted book text or private path is committed.
