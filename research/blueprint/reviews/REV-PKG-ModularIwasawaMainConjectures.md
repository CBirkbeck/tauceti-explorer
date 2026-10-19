# Review: ModularIwasawaMainConjectures package

Completed fixing review of #10905 by Codex (OpenAI), session `codex-ufMbTp`, on 2026-10-19. The package was written by session `codex-u80FTH` in #10928; this reviewer did none of that package job. This is a completed review, not a checkpoint.

**Verdict: needs_changes.** The corrections below are applied. The representative Lean file elaborates, but the roadmap is not ready for a TauCetiRoadmap draft: its required universal zeta construction, arithmetic height/comparison, integral period comparisons, small-prime family construction and Eisenstein inputs do not yet have the requisite supplier closure. The higher-weight application also retains its unfixed ramification input. Precise resumption conditions appear below; no arithmetic theorem is claimed formalized.

## Scope and coverage

Read WORKERS, PROTOCOL (including prerequisite closure, ownership and packaging), the expansion protocol, UPSTREAM_GUIDE and PACKAGE_REVIEW. Read the accepted packet, reader, suggested file, review, package and handoff. Used the current EllipticCurves and ProfiniteCohomology roadmaps as shape models. Checked all 46 target sections, their 90 inherited API names, the 49 inherited tests, seven layer builds, supplier contracts, retained definitions and representative Lean declarations. The accepted packet and its sources were not edited.

The README remains the complete roadmap. The small Lean file intentionally does not introduce arithmetic carriers absent at the pins. The metadata remains `topic = "math.NT"`. No other roadmap, supplier, accepted packet, atlas file or upstream checkout was changed.

## Corrections applied

1. **Iwasawa suitability (§0.8).** Restored the direction and content of Fouquet–Wan Definition 3.12: a domain-valued specialization contains an O-valued point through a local map to O; both representations at that contained point must be relatively pure and its zeta morphism nonzero. Purity of the original specialization is a consequence, not the replacement condition. Added identity-map, zero-zeta and reversed-map controls.
2. **Tate isogenies (§5.5).** Replaced a one-direction description by the power relation between parameters, allowing either isogeny direction. Logarithm and valuation scale together, including for p-power degrees. Added the computed ratio 21/14=3/2 and its failed denominator-only scaling to README and Lean. The local parameter q=p has zero logarithm; global nonvanishing remains restricted to E/Q with the transcendence input.
3. **Ordinary control (§5.4).** Removed the citation to RankZeroOneBSD's later BSD.6 cyclotomic specialization. Added `ordinaryAugmentationControl` here as the ordinary elliptic specialization of SelmerIwasawaCohomology §3.11 and the local comparison of §0.2, with finite kernel/cokernel and the corank equality. Source: Skinner–Urban Theorem 3.6.11(b), p.46, via Greenberg [Gr99] Theorem 4.1. The multiplicative case retains its own inertia and exceptional-zero corrections. This avoids requiring the downstream BSD consequence to establish its own main-conjecture input.
4. **Exact branch statements (§§6.2–6.3).** Replaced introductory references by CGS Theorems A/C, Keller–Yin Theorem 3.0.10, BSTW Theorem 1.3 and Castella's corrected Theorem 1.1. Exposed CGS's local character exclusion and KY's larger range. For BSTW retained semistability, p>2, a_3=0 when p=3 and the ordinary-support condition on quadratic twists; removed an unsupported additional residual-image restriction on its base theorem. For Castella recorded the corrected multiplicative, local p-torsion, nonsplit-prime and ramification conditions, including the condition at 2, with its actual coefficient extension and local conditions. Added negative controls and the four direct references.
5. **Current Kato interfaces.** Replaced the old layer references by the current package: dual/twist dictionary §2.4; periods §3.2; rational and classical twist-one zeta maps §§5.1–5.4; scalar reciprocity §§6.1–6.2; non-torsion and divisibilities §§7.1–7.5; good-ordinary no-finite-submodule result §7.6. Geometric reciprocity §3.4 alone is not the scalar analytic comparison. Retained the different integral image and local-correction hypotheses.
6. **Universal versus classical zeta maps (§§0.6, 4.1).** The current Kato §5.4 constructs a classical twist-one map, not the deformation-ring map required by FW Theorem 3.6. Removed that false supplier attribution. Specified the required `universalDeformationZeta` extension, its classical-specialization square, general coefficient specialization and p=3 condition. The family consequence is explicitly conditional on this missing construction, with three discriminating compatibility/domain checks. It remains a supplier obligation, not a second construction of Euler systems here.
7. **Predicate and Selmer scope.** Separated finite-dimensional residual predicates from the integral rank-one quotient predicates: a residual dimension cannot exclude integral torsion. Corrected the supplier boundary to current Selmer §§3.18–3.21 for structure/Fitting and §4.21 for the Greenberg proposition, retaining the explicit dual-convention transport.

## Required supplier closure and resumption conditions

These are unresolved mathematical or routing defects, rather than requests for stylistic work. Declaring a needed comparison as a hypothesis prevents a false unconditional claim, but does not supply its construction or proof for this package's advertised endpoint.

| Obligation | Exact consumers and current evidence | What closes it |
| --- | --- | --- |
| R1: universal deformation zeta map | §4.1 and arithmetic specialization in §4.2; family uses of §0.6. Current Kato §5.4 is only `V′ → H¹_Iw(V′(1))` for a classical eigenform. It contains no universal deformation-ring construction. | Extend the zeta-morphism owner's plan with FW Theorem 3.6, p.24: under Assumptions 2.1 and 3.5, the deformation-algebra-linear map on T_Σ, its square at every classical point, coefficient-specialization maps and the stated p=3 extension. Place that export before the family endpoint. Classical interpolation alone is insufficient. |
| R2: arithmetic height and Schneider comparison | §§5.6 and 5.8. Selmer §3.14 constructs a determinant/characteristic divisor; it does not compare Schneider's flat Néron-model cohomology or arithmetic heights. NE.7's Bockstein is also insufficient. | Assign the arithmetic cyclotomic height to its owner and supply the flat/Galois Selmer comparison with the degree-zero/degree-two, component-group and reduction factors; compare analytic κ-height to MTT height, including the nonunit logarithmic coordinate factor. Keep finiteness and height nondegeneracy as hypotheses. |
| R3: integral period units | Ordinary comparison §§0.4, 0.9, 1.5, 2.3; separately normalized Pollack comparison §§4.5 and 5.10. Current Kato §§3.2 and 7.5 provide an algebraic period dictionary and a good dual pair, not the required canonical O-unit ratio in every weight. LLZ's rational comparison does not prove the separate Néron normalization. | Supply the O-unit comparison with exact lattice, literal dual, sign, tame component, factorial/congruence and Euler factors. For Pollack supply the unit comparison in the elliptic Wach basis with Néron periods. Until then retain rational statements and the actual integral image quotient. |
| R4: multiplicative p=3 approximation | §1.6. The current PadicFamilies ordinary construction assumes p≥5; this does not provide the p=3 forms used by Skinner's p≥3 theorem. | Supply good-at-p Hida approximants and compatible principal-ideal congruences at p=3, with lattice and Selmer congruences and canonical-period units, as used in Skinner §3.1, pp.18–19. |
| R5: Eisenstein proof infrastructure | §6.2. Current RankZeroOneBSD explicitly leaves `ellipticUnitCharacterComparison` without a complete owner; Katz interpolation does not prove the characteristic-ideal theorem. | Assign and close Rubin's elliptic-unit/imaginary-quadratic IMC, Hida–Tilouine and the anticyclotomic Katz μ theorem in the exact character range, including trivial-character and integral lattice/period corrections. Then use the BSD owner's branch export. |
| R6: higher-weight ramification | §5.11, the eta-product at p=7. Its nonsquare Frobenius discriminant proves the recorded irreducibility test but does not prove ramification at 5. The accepted packet explicitly lacks the applicable weight-four level-lowering locator. | Fix and verify that precise ramification/level-lowering statement and its hypotheses, or retain the application as conditional. No theorem elsewhere depends on this example. |
| R7: supplier order | This roadmap and KatoEulerSystems, AutomorphicCongruences, RankZeroOneBSD, HeegnerPointEulerSystems and several regulator/analytic suppliers are outside the numbered Caraiani–Newton order. The current Kato review also records unclosed reciprocity and comparison exports. A named requested output is not a closed lower-tier export. | The maintainer must route these external owners/stages acyclically before upstream submission and ensure their required exports exist. Do not invent a tier or treat absence from the order as permission to cite upward. Use the current Kato and branch reviews when closing their contracts. |

Two inherited caveats do **not** demand broader work: the canonical/Gross-period alternative has no consumer in the selected FW route, and the signed theorem already restricts the FW application to η=1 with LLZ's index restriction. No general canonical/Gross comparison or all-tame-component theorem is required to validate that restricted route.

The local ordinary-control target moved down from the BSD citation is recorded in correction 3 so that downstream plans can point to this roadmap's §5.4. No external owner file was changed. The universal-zeta mismatch is additional to the accepted packet's nine explicit obligations and must be preserved in any subsequent assembly.

## Source verification

The reproducible random sample used seed **10905** and 15 target/locator records from the accepted packet. Opened the public documents and checked the printed locators and their mathematical use, rather than relying on search snippets. Public PDF bytes for the existing sources matched the packet's recorded hashes. Page numbers below refer to the versions in the package bibliography.

| Sample | Locator checked | Result |
| --- | --- | --- |
| 1 | FW Theorem 3.6 and remark, p.24; Conjecture 3.30, p.36 | Universal morphism and regular-base conjecture present. Classical Kato supplier attribution repaired separately. |
| 2 | Colmez Theorems 0.20, p.258, and 0.8, p.255 | Curve/form and rational analytic comparisons present; these do not establish every integral period unit. |
| 3 | SU Theorems 3.5.6 and 3.6.4, pp.41–43 | Relevant divisibility/equality route present; source range retained. |
| 4 | Rodrigues Jacinto–Williams Remark 2.3, p.7 | Ordinary BSD/trivial-zero context present; not a construction of the missing height comparison. |
| 5 | FW Definitions 3.8–3.9 and 3.12, Proposition 3.10, Lemma 3.11, pp.25–26 | Corrected the contained pure point, dual purity and nonzero-zeta requirements. Definition 3.12 begins on printed p.25. |
| 6 | Skinner 2020 §1, pp.1–2 | Converse context present; arbitrary-conductor assertion remains source-reported context, not a proof from narrower hypotheses. |
| 7 | FW Propositions 3.22–3.23, p.33 | Zeta-line specialization with its hypotheses present. |
| 8 | SU Theorem 3.6.4 and proof, pp.43–44; Theorem 1, p.2 | Ordinary endpoint, auxiliary prime and weight restrictions present. |
| 9 | LLZ assumption (E), p.43 | Actual free rank-one quotient hypothesis present; numerical residual rank is insufficient. |
| 10 | Skinner 2016 §1, p.1 | Canonical-period ordinary function and source conventions present. Read §2.4 as well for the period exponent. |
| 11 | SU Lemma 3.2.17 and Proposition 3.2.18, pp.26–27 | Local structure and large-set localization statement present; retained ramification-set condition. |
| 12 | FW Theorem 5.1, p.68 | Pointwise endpoint and local alternatives present; no arbitrary tame twist extension inferred. |
| 13 | BCS Remark 1.1.3(i), p.2; Theorem 1.2.2(b), p.3 | Large-image and integral anticyclotomic inputs present; distinct cyclotomic endpoint retains its own hypothesis. |
| 14 | Colmez note 14, p.256 | Height caveat present; does not discharge the Schneider supplier comparison. |
| 15 | FW Conjecture 1.5, p.6 | Cohomological equality and its normalization present. |

The author marks no other numerical locator as “unverified.” Audited all nine explicit obligations nonetheless. Read Schneider's actual scan at printed pp.342 and 370–371: Theorem 2′ and Theorems 6–7 are identifiable and retain their flat-cohomology and height normalizations. The unverified weight-four ramification application remains R6; it has not been converted to a sourced theorem. Read FW's purity/specialization statements, Kato 16.2, p.269, the LLZ signed/image statements, Skinner's local conditions and period convention, and the four direct branch sources needed for the fixes.

Additional direct sources and byte hashes:

| Source | Verified statement | SHA-256 |
| --- | --- | --- |
| [CGS, arXiv:2303.04373v2](https://arxiv.org/pdf/2303.04373v2) | Theorem A, p.2; Theorem C, p.3 | `5046d7571ed3a1b13baa56b2c94186d9c9488d76181062f4ba82b8ab5158af90` |
| [Keller–Yin, arXiv:2402.12781v2](https://arxiv.org/pdf/2402.12781v2) | Theorem 3.0.10, p.41 | `bb64820b49aa1eb2574c912c0d03067f904e52b9bf71f441fda78bb6dba9c90a` |
| [BSTW, arXiv:2409.01350v2](https://arxiv.org/pdf/2409.01350v2) | Theorem 1.3, p.3; convention (1.7), p.6 | `18e05982cdb2ac57cd7fcdc4791e5db8bff2945755653a5b76dd94377ed11ecf` |
| [Castella, corrected erratum](https://web.math.ucsb.edu/~castella/Birch-erratum.pdf) | Corrected Theorem 1.1, p.1 | `c04dff16c27bc3ca4f4e235e366fcd4c95a43cfb9215f75a2584dfeb7114edcf` |

All repository statements are in our own words. No source passage or source-by-section summary has been added. No restricted library file was copied or used as an uncleared substitute.

## Library, ownership and duplication audit

Pins read: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Read the reviewed library-coverage audit and the actual pinned definitions used in Lean, including subgroup restriction of `Representation.invariants`, finite dimension, quotient by the range of an endomorphism, `Matrix.toLin'`, `PowerSeries`, `Associated` and the DVR assumptions. `ContRepresentation` alone does not ensure continuity in the group variable; the README supplies it explicitly.

Current read-only trees checked: TauCetiRoadmap `0d144d044dacebca17b654695b6f1ad58f159b27`; Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Checked targets by mathematical object and hypotheses against all nine newer roadmaps (including the nested OperatorTheory files), Completed ContourIntegration, EffectiveBounds, OrthogonalL2Bases and RestrictedProducts, and the current library. Quadratic integral lattices are not stable Galois lattices; determinant bundles are not perfect Iwasawa-complex determinants; analytic operator results involving Kato are not modular Euler-system results. The local Galois, cyclotomic and Kummer constructions are already boundary imports. No kept modular main-conjecture target duplicates a current upstream target, so there are no further removals to list.

Read current completed-group-algebra bodies and signatures: `TauCeti.completedGroupAlgebra`, `.proj`, `.of`, `.map`, `.map_of`, `.powerSeriesCoordinate`, `.powerSeriesCoordinate_X`, `.powerSeriesCoordinate_one_add_X` and `.monoidAlgebraProdEquiv` in the Basic, Map, PowerSeries and Prod modules. The coordinate equivalence is over ℤ_p with the stated pro-p/generator hypotheses. The README correctly imports it without promoting it to arbitrary O. The existing formal Tate curve is reused; point uniformization and the residual inertia comparison remain separate arithmetic supplier contracts.

Checked current Selmer, Kato, PadicFamilies and RankZeroOneBSD packages and the AutomorphicCongruences/Heegner owner documents. Current Kato is now an eight-layer build, which motivated correction 5. Its classical twist-one morphism and geometric reciprocity cannot replace universal-family or scalar-regulator constructions. No `FoundationsAndLibraryIntegration` or `UPSTREAM:` stage ids remain in the package. Caraiani–Newton has no tier for this roadmap; R7 records the resulting routing obligation rather than silently declaring its suppliers lower.

## Definition API and signature checks

Every definition/construction section was checked for at least three discriminating examples, against a plausible wrong definition, rather than counting restatements of its name.

| Sections | Positive, degenerate and negative controls |
| --- | --- |
| 0.1–0.2 | Correct ordinary and supersingular domains; chosen versus arbitrary integral lattices; α=1 versus α≠1; scalar versus contragredient dual; torsion not part of a definition. |
| 0.4–0.7 | m=0,1 and conductor normalization; rescaled period; Λ/(ϖ) versus Λ/(X); zero module; primitive versus imprimitive zeta line; nonzero zeta and torsion requirements. |
| 0.10–0.11 | Zero/full Coleman kernels, Tate annihilator, global injection; I=(X), L=X² gives quotient characteristic (X), not (X²). |
| 1.1 | Each residual and integral predicate has at least three controls. Independent diagonal characters, trivial inertia, I=D, ω=1, exceptional pair reversal; standard unipotent, identity and upper-right-ϖ quotient. |
| 3.2–3.3 | Good ordinary Euler square, nonsplit single factor, split zero; correct Néron period and Tate lattice; rational equality does not imply integral equality. |
| 5.5–5.6 | Both isogeny directions; q=p local zero; positive valuation; rank-zero torsion regulator; zero regulator; real versus p-adic height; full Sha versus its p-primary part. |
| Required universal zeta extension, 4.1 | Classical compatibility, absence of a global linear map despite point data, and p=3 scope. The construction remains R1. |

The six real-bodied Lean definitions and four named theorem signatures were checked individually:

| Signature | Match to README |
| --- | --- |
| `IsRamifiedAt` | Existence of an inertia element acting nontrivially; q∥N remains a separate arithmetic condition. |
| `FWAuxiliaryCondition` | Finite-dimensional invariants of inertia have dimension one and decomposition invariants dimension zero; no condition accidentally omitted. |
| `DistinctCharacters` | Inequality of the two filtration characters, not an assertion that the representation is irreducible. |
| `LocalExclusion` | Rejects both orders of {χ,χω}; at ω=1 becomes distinctness. |
| `HasRankOneCoinvariants` | Actual O-linear equivalence of the quotient with O; not rational dimension one. |
| `HasRankOneImage` | A witness in the specified subgroup with that integral quotient. |
| `FWAuxiliaryCondition.isRamifiedAt` | Requires ambient dimension two; trivial inertia would fix all two dimensions. |
| `localExclusion_one_iff` | General group/field formulation matches the elementary character identity. |
| `hasRankOneCoinvariants_of_unipotent` | Actual square-zero u−1 and a nonzero residual image over a DVR; neither a residual lift nor an upper-right-ϖ matrix suffices. |
| `associated_of_eq_away_of_mu_eq` | Nonzero power series, association away from ϖ and equality of all uniformizer divisibility levels. Algebraic core works over any DVR; the arithmetic Weierstrass application retains complete mixed-characteristic coefficients. |

The closing Lean comment names arithmetic definitions unavailable at the pins, including the required universal zeta construction. There are no sorry-bodied data definitions, heavy surrogate carriers, auxiliary theory chains or `True` placeholders. General DVR algebra examples include equal characteristic; the arithmetic coefficient field is still a finite extension of Q_p. Arithmetic p=2 is excluded throughout.

## Adversarial mathematics pass

Each row covers the section's statements, named API, defining choices and Checks. Sign, inversion and coordinate witnesses also appear as Lean examples wherever expressible at the pins; arithmetic existence is never inferred from those scalar tests.

| Section | Instances and computation | Result or correction |
| --- | --- | --- |
| Conventions | Scalar 2 and inverse 4 over F₇; m=0,1; two-term lengths (2,0), (0,2); X versus inverse X | Scalar dual and representation dual differ; inverse-determinant divisors are +2 and −2; coordinate sign is a unit but log κ(γ) is not. Retained explicit witnesses. |
| 0.1 | Good ordinary 11a1/7; supersingular 14a1/5; p-isogenous lattices | Domain and determinant twist fixed; a rational Galois isomorphism alone does not identify integral lattices. |
| 0.2 | α≠1 versus α=1; zero module; tame character inversion | Split multiplicative correction is L/O; strict and inertia conditions cannot be interchanged there. |
| 0.3 | X=0; X=Λ/(ϖ,X); local torsion at 11 for 11a1/7 | No-finite-submodule and Fitting claims retain structure hypotheses; arbitrary torsion is insufficient. Corrected supplier sections. |
| 0.4 | m=0,1; conductor exponent n; period times ϖ | Correct complex period exponent and inverse Euler argument; unit normalization remains a hypothesis when needed. |
| 0.5 | Λ/(ϖ), Λ/(X), zero module and unit ideal | Integral and rational conjectures differ; localization is not L[[X]]. |
| 0.6 | Differential a in degrees 1,2; z=ae; equal and unequal lengths | Inverse determinant gives char H² minus char H¹/z. Retained Betti line and nonzero denominator; removed false universal supplier attribution. |
| 0.7 | Vanishing zeta, rank-zero H¹, tame components | Such data do not give a rational trivialization. Actual conjecture requires the specified rank/nonzero hypotheses. |
| 0.8 | Identity contained point; zero zeta; reversed local ring map | Corrected suitability to both pure representations at the contained point and its nonzero zeta morphism. |
| 0.9 | Period ratio ϖ; residual unipotent with nonunipotent lift | Rational comparison does not become integral; retained actual lattice/image and unit-period requirements. |
| 0.10 | Coleman kernel 0 or full; orthogonal complement; basis change | Retained correct dual, integral domain, Tate pairing and hypotheses for the global injection. |
| 0.11 | I=(X), zeta image X² | char(I/ΛX²)=(X); replacing it by (X²) is wrong. |
| 0.12 | i=1 at every η; i=2 at η=1; missing (E) | Restricted LLZ equivalence and integral range retained. |
| 1.1 | I trivial; I=D; independent diagonal characters; ω=1; O/ϖ torsion | Residual conditions have the right examples and failures. Corrected the claim that all predicates were residual. |
| 1.2 | [[1,1],[0,1]], identity, [[1,ϖ],[0,1]], [[1,1],[ϖ,1+ϖ]] | Quotients respectively O, O², O⊕O/ϖ and O/ϖ. Last matrix has determinant one but det(g−1)=−ϖ: actual unipotence essential. |
| 1.3 | 11a1/7; p=3; weight outside k≡2 mod p−1 | SU range and auxiliary prime retained; FW's stronger decomposition condition not substituted. |
| 1.4 | 14a1/13; 11a1/7; arbitrary even weight | FW auxiliary condition separates nonsplit and split weight-two examples; reverse bound keeps its own GU(3,1) route. |
| 1.5 | Kato/canonical scalar unit versus ϖ | Integral transport conditional on the former; algebraicity alone does not close R3. |
| 1.6 | Split/nonsplit at p; p=3 versus p≥5 | Inertia condition and ideal congruences retained; p=3 family remains R4. |
| 2.1 | Even half-weight twists; E_dual=2 | Primitive zeta is half the Σ-zeta in this witness, with matching local determinant. |
| 2.2 | Ordinary/nonordinary; twisted Steinberg split extension; η≠1 | Actual local residual exclusions and nonsplit ramified extension retained; endpoint restricted to its component. |
| 2.3 | Ordinary period unit; signed missing (E); nontrivial η | Consequences use the intersection of source hypotheses and no automatic twist argument. |
| 3.1 | Optimal curve; nonunit Manin factor; p-isogeny | Inverse-image Tate lattice retained; periods and indices transported explicitly. |
| 3.2 | Good ordinary, split and nonsplit multiplicative | Euler square versus single factor retained; α=1 zero handled separately. |
| 3.3 | 11a1/7; ideals differing by ϖ | Tate-lattice/Néron-normalized equality integral only with its stated inputs. |
| 3.4 | CM/non-CM; p=3; irreducible ordinary p>3 | No extraneous non-CM hypothesis on BCS rational theorem; p=3 outside this endpoint. |
| 3.5 | Genuine cyclotomic-kernel witness; irreducibility alone | Only former discharges integral BCS hypothesis. |
| 3.6 | Residual GL₂ image at p≥5; p=3 | Closed commutator and rank-two lifting used in their range; higher-dimensional LSTX Theorem 1 is not the rank-two source. |
| 4.1 | Regular base versus singular Hecke ring; classical maps alone; p=3 | Regular-subring endpoint retained. Specified missing universal map and made dependence conditional (R1). |
| 4.2 | Non-flat coefficient change; nonzero nonunit Euler factor; H⁰/Tor | Derived specialization, all-lifts suitability and local corrections retained; termwise characteristic-ideal specialization rejected. |
| 4.3 | η=1 versus η≠1; missing (E) | FW yields only the stated component; nontrivial η needs independent KMC. |
| 4.4 | I=(X), L=X²; lower-triangular basis change on (1,0) | Actual quotient retained; inverse change sends (1,0) to (1,−1), so individual kernels can change. |
| 4.5 | a_p=0 versus p=3, a_p=±3; rational period scalar | Correct minus/plus index dictionary; separate Néron-normalized integral equality still requires R3. |
| 5.1 | Large Σ and arbitrary Σ; ℓ=11, scalar Γ value 2 | Euler factor 21/22 versus wrong 9/11 fixes the inverse argument. Arbitrary sets compare through a large common set. |
| 5.2 | ϖ=uϖ′^e; e=1 versus ramified extension | Faithful flat descent retained; μ scales by e, λ does not. |
| 5.3 | f=ϖ,g=1; equal μ; zero series excluded | Rational association alone insufficient; equal uniformizer divisibility removes discrepancy over any DVR. |
| 5.4 | Finite versus positive-corank Selmer; α=1 versus good ordinary | Added local ordinary control target and removed upward BSD dependency. Nonzero good-ordinary Euler square valid; multiplicative source needs its own correction. |
| 5.5 | q and q^p; reverse isogeny; local q=p | Added two-direction power relation, 21/14=3/2 control and local zero counterexample. ord(q)>0 supplies denominator. |
| 5.6 | Rank zero with 5-torsion; zero height; full versus primary Sha | Regulator includes torsion⁻² once. Exact and up-to-unit propositions remain separate, including zero regulator. |
| 5.7 | 11a1/11; nonsplit reduction; L(E,1)=0 excluded | Split simple zero has derivative ℒ/5; nonzero global ℒ used only in its valid range. |
| 5.8 | r=0,1; degenerate height; anomalous prime; opposite coordinate | No unconditional BSD deduction; retains R2, height nondegeneracy and nonunit logarithm. Reduction factor matches Euler square up to a unit. |
| 5.9 | Trivial tame projection; whole real cyclotomic extension | Only modular critical instance asserted; other tame components are not silently included. |
| 5.10 | 11a1/7; 14a1/5,13; p=3 ordinary; analytic Sha input | Arithmetic discriminant tests consistent; supersingular example only in signed range. No analytic Sha value promoted to an arithmetic proof. |
| 5.11 | Eta-product at p=7 and p=13 | Irreducibility witness retained; finite p=13 congruences diagnostic only; ramification remains conditional R6. |
| 6.1 | Rank-one Heegner versus torsion BDP form; rational/integral coefficient extension | Owner's ranks, square, involution and local cokernels retained; no multiplicative substitution. |
| 6.2 | 11a1/5 with rational torsion; CGS character exclusion | Correct direct endpoints and KY's larger range; integral comparison imported from its owner with R5 still open. |
| 6.3 | Semistable 14a1/5; p=3, a_3=±3; bad twist support; multiplicative q and local p-torsion | Exposed BSTW's exact range and twist support, and Castella's corrected hypotheses. No added residual-image restriction on BSTW base theorem. |

## Validation and handoff

- `lean-check` on the final Suggested.lean: exit 0, 24 warnings, all `declaration uses sorry`; no errors or other warnings. The file has 324 lines, six real-bodied definitions, four named theorem signatures and 39 examples. The new Tate scaling example is proved by `norm_num`.
- `python3 scripts/check_blueprint.py research/blueprint/packets/ModularIwasawaMainConjectures.json`: 0 errors and 0 warnings; 46 nodes, 90 API entries, 49 tests. The packet is unchanged; all 90 API names remain in the package README.
- `python3 research/blueprint/intake.py check-files` on all five permitted deliverable paths: 0 problems. `git diff --check`: clean.

Resume with R1–R7, especially the concrete universal-versus-classical mismatch and the named owner exports, without repeating the completed source sample or reverting the local fixes. The full closure obligations and the control ownership move are recorded here because the package-review edit scope excludes other roadmaps and separate handoff files. The review's `needs_changes` verdict is final for this submission; it is not a claim that these conditional statements are false, nor that elaboration proves arithmetic truth.
