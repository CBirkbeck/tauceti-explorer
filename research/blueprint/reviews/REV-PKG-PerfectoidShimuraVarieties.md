# Package review: PerfectoidShimuraVarieties

**Verdict: accepted with the corrections below.** The package is ready for the maintainer's draft TauCetiRoadmap PR. This is acceptance of a detailed mathematical roadmap, including its explicit conditional targets, rather than certification that its seven identified proof inputs have been implemented.

Issue #9775; reviewer Codex; session `codex-vbEWJM`; date 2026-10-14. The reviewed package was written by `codex-z5jR8P` for #9774, incorporated at `195ebee3c`. The reviewer did not author that package or its preceding plan. The claim was confirmed in issue comment 6173924429. This report is the complete review handoff; no second job is taken.

## Scope, fidelity and fixes

I read WORKERS, PROTOCOL, PACKAGE_REVIEW, UPSTREAM_GUIDE and the expansion protocol. AdicSpaces and AlgebraicVectorBundles were read as the two full README/Suggested models. I read the package's complete README and Suggested file, following all 98 target subsections through their statements, hypotheses, proof sketches, suppliers, APIs and Checks. The Summary, ownership, conventions, supplier contracts, ordered layers, examples and references have the required mathematical form. Sources are paraphrased with numbered locators; the package is not a source transcription or a section-by-section digest.

The eight layers contain respectively 9, 2, 31, 10, 13, 7, 11 and 15 targets. A one-to-one subsection inventory against the accepted packet preserves all 98 targets, all 174 named API items and all 111 original named Checks in their corresponding sections. Every one of the 27 definition/construction targets has at least three discriminating Checks. The review adds one further Check, so the resulting package has 112. No packet, reader document, atlas file or input Suggested file was changed.

Corrections made in the package README:

- **Bruhat quotient domain (§6.13):** the quotient presentation now requires `0 ≤ n ≤ m`, as well as `K_p ⊆ 𝒢_{m−n,0}`, in the statement, proof and API. The normalizing lemma applies with nonnegative parameters `(m−n,n)`; a negative first depth is outside §6.12's level-group construction. The new `tubes_quotient_depth_domain` Check accepts `(0,0)` with `K_p ⊆ Iw` and rejects `(0,1)` at the domain boundary. This is a missing domain restriction, not a claim of a counterexample within the valid domain.
- **Bruhat API hypotheses (§6.13):** `eq_orbit` now explicitly restricts both depths to be nonnegative. `translates_finite` now includes `m,s ≥ 0`, profiniteness, and `K_p ⊆ 𝒢_{m,0}`, matching the full statement.
- **Supplier labels:** the geometric Grassmannian/compact-dual supplier is ShimuraData D3; D4 supplies datum classes, while D5 supplies the Hilbert examples. The introductory reductive-group references now use RG2.1/RG2.3, and the Siegel moduli example uses PELModuli M5. These agree with the existing stage records and the detailed interfaces already listed below the introduction.
- **Layer dependency summaries:** removed each layer's reference to itself. The actual numbered within-layer dependencies are retained. The independent prerequisite inventory has no forward local edges.
- **Pilloni–Stroh locator (§3.9):** deleted the unverified identification of the linked author version's Théorème 1.22 with another published/downstream theorem number. The statement is now identified solely by the version actually linked and read, PDF pp. 8–10. No unavailable published collation is represented as checked.

Suggested.lean and metadata.toml required no edits. The metadata remains `topic = "math.NT"`.

## Independent source checks

The random sample is reproducible: flatten the accepted packet's node source lists in node order, keeping `(node.id, source)` pairs, then use `random.Random(9775).sample(citations, 15)`. The passages and adjacent hypotheses/proof steps were read directly from the specified public versions. Page numbers below are printed pages unless expressly called PDF pages.

| README target | Independently read locator | Finding |
| --- | --- | --- |
| 3.3 | Scholze, torsion paper, §3.3, p. 1003 | Tate twists are suppressed after fixing the cyclotomic base; that convention is not an integral, unchosen trivialization. |
| 0.5 | Scholze–Weinstein, §2.4, Definition 2.4.1 and Proposition 2.4.5, pp. 19–21 | Tilde-limit topology and completed-ring density are additional content beyond an isomorphism of diamond limits. |
| 3.9 | Pilloni–Stroh author version, §1.8, Théorème 1.9 and Remarques 1.10–1.11, p. 5 | The odd-prime estimate is proved; the replacement bound 2 at p=2 is reported without its proof. The package keeps that input conditional. |
| 2.8 | Hansen–Johansson v2, §5.3 conventions, p. 35 | The section works over C; the earlier reflex-field result and perfectoid base change provide the stated bridge. |
| 1.8 | Scholze, Lemma 3.2.14, pp. 984–985 | The Frobenius diagram has the radius shift and relative characteristic-p base required in the README. |
| 2.4 | Scholze, Theorem 4.1.1(i),(ii) and proof, pp. 1018–1020 | The compactification in this proof is the Siegel-image construction, not automatically the genuine minimal compactification. |
| 4.7 | Hansen–Johansson v2, §5.3 conventions, p. 35 | The pre-abelian comparison respects the prescribed complex/reflex embedding and its base extension. |
| 3.10 | Birkbeck–Heuer–Williams v4, formula (3.2), Lemmas 3.17/3.19, Definition 3.18, Proposition 3.21 and Remark 3.23, pp. 12–14 | The quotient-line action gives the `cz+d` factor; the comparison with the complex convention does not invert this factor silently. |
| 4.3 | Hansen–Johansson v2, proof of Proposition 5.18, p. 36 | The printed connected-case identification is stronger than justified. The package uses its finite-map/integral comparison repair rather than that equality. |
| 1.5 | Scholze, Definition 2.3.8 and following discussion, pp. 966–967 | Goodness includes all exponents, is compatible with tilting, and has a genuine bounded-function consequence. |
| 5.9 | Birkbeck–Heuer–Williams v4, Lemmas 8.22–8.23, pp. 38–39 | Adjugate level changes, quotient polarization and extension of the rational action match the stated direction. |
| 2.3 | Caraiani–Scholze v1, Theorem 2.1.2 and footnote 8, pp. 11–12 | The Deligne-datum formulation requires the adaptation indicated in the package. |
| 0.6 | Milne, §5, passage to the limit and Theorem 5.28, p. 65 | The rational central subgroup is closed before forming the effective action. Footnote 44 cautions about the properness argument; the package separately requires ShimuraVarieties V0's effective-proper-action contract. |
| 3.5 | Caraiani–Scholze v1, paragraph after Lemma 2.3.7, p. 21 | The tensor-compatible period filtration factors through the Hodge-type flag, rather than merely selecting points of the Siegel flag. |
| 1.11 | Scholze, Theorem 3.2.15(ii) and proof, pp. 985–987 | The cartesian finite-level comparison uses a p-power degree. The package does not reproduce the missing p-power in the printed degree comparison. |

I also checked the locators controlling the author's flagged or conditional claims: Scholze Lemma 3.2.35, pp. 1001–1002, and the Theorem 3.3.18 chart proof, pp. 1014–1015; Hansen–Johansson Lemmas 5.9–5.10, pp. 31–32; Pilloni–Stroh Théorème 1.22/Remarques 1.23–1.26, PDF pp. 8–10, and Théorème A.11, p. 27; revised Boxer–Pilloni §§4.4.38–4.4.45, pp. 79–85, Proposition 4.6.19/Lemma 4.6.20, pp. 97–99, and Lemma 3.3.18, p. 42. The latter explicitly uses nonnegative integer depths; the roadmap's rational-depth extension has its own matrix-order/base-extension argument and is not attributed to a broader source statement.

The additional exact-contract references were read as well: Bhatt–Scholze, Prisms v4, Theorem 1.17(1), p. 9, Theorem 7.4/Remark 7.5, p. 56, and Theorem 10.11, p. 82; Lovering, Lemma 3.1.6, p. 1857, and §§4.6.1–4.6.6, pp. 1877–1881; Lan's author version, Theorem 2.2, p. 4, and §6/Proposition 6.1, pp. 18–20; Heuer v1, Theorem 3.17/Corollary 3.18, pp. 21–22. Faltings–Chai V, Theorem 2.5(4)–(6), pp. 152–153, was read from the maintainer-cleared volume in place; neither that file nor extracted passages were copied.

These checks preserve the distinctions needed for the gaps below: integral-algebra perfectoidization versus semiperfectoid quotients; full principal-level boundary strata versus inertia of the full-to-Γ₁ map; smoothness at the actual cusp lattice; descent of an ample power versus the stronger unproved line-bundle descent; and cancellation versus individually trivial unipotent factors. Katz–Mazur 8.11.10 remains explicitly secondary through Heuer, not a claim of direct access to a chapter outside the cleared collection. This source audit is the independent sample plus these additional locators, not a fresh certification of every one of the packet's 206 citations or 45 errata dispositions.

## Prerequisites and current duplication audit

I read the 21 baseline declaration statements at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. In particular, `Limits.limit` assumes `HasLimit`; `Module.Grassmannian` is a module-quotient structure, not a scheme; `MulAction.toPermHom` is a left-action homomorphism; `frobenius` is scalar Frobenius; and the continuous quotient-section theorem requires a closed subgroup of a compact totally disconnected topological group. The package imports the missing geometric structures from their owners rather than inferring them from these carriers.

The target-level prerequisite inventory contains 318 distinct references. Each terminates in a baseline declaration, an earlier local target, or one of 57 existing external stage contracts. There are no forward local edges, upward-tier suppliers, FoundationsAndLibraryIntegration references or `UPSTREAM:` ids. The exact contract suffixes identify mathematical requirements, not necessarily already implemented Lean declarations. The stronger requirements beyond a supplier's present scope are spelled out as additional contracts and conditional inputs.

CaraianiNewton places this roadmap at Tier 17. Its supplier owners have tiers: ReductiveGroupsPartII 1; SchemeAndStackFoundations 2; AdicSpacesPartII, DiamondsAndVStacks and PerfectoidSpaces 3; AlgebraicModuliForArithmeticGeometry 4; ShimuraData 12; PELModuli, PerfectoidQuotients and ShimuraVarieties 13; HilbertModularVarietiesAndShimuraCurves 14; AutomorphicBundles and ShimuraCompactifications 15; HodgeTateAndCanonicalSubgroups 16. No ownership move is introduced by this review.

The duplication audit used current upstream `0d144d044dacebca17b654695b6f1ad58f159b27` and current Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, read-only. I compared every target family by its objects, structure fields, maps and hypotheses. Searches included symplectic similitudes and reduction blocks, effective profinite actions, tower limits, finite-free algebra traces, graph factors, homogeneous torsors, Weil-pairing coefficients, depth groups, root-ball tubes and parabolic double-coset intersections. I inspected matching declarations rather than accepting a name match. The older `data/library-coverage.json` index was consulted but does not replace this current-checkout audit.

| Current supplier or near match | Disposition of this package's targets |
| --- | --- |
| AdicSpaces; AnalyticToricGeometry; AlgebraicVectorBundles | General spectra/gluing, regular-cone geometry and vector-bundle operations are already deferrals in the ownership section. The Shimura tower, boundary, Hodge dictionary and specific period torsors add the stated specialization/comparison content. |
| Nine newer roadmaps: AlgebraicVectorBundles, DifferentialGeometry, IntegralLattices, LocalGaloisGroups, OperatorTheory, OrthogonalSpinGroups, PeripheralActions, ProfiniteArithmetic, RealAlgebraicGeometry | Their bundle, quadratic, profinite, manifold, real-algebraic and operator targets do not supply the arithmetic-geometry towers or the stated coefficient/depth identities. Generic profinite completion/automorphism material is deferred to ProfiniteArithmetic. |
| Completed, including ContourIntegration, EffectiveBounds, OrthogonalL2Bases, RestrictedProducts, IntegralLattices, UniversalCovers, HodgeStructures and Multiquadratic | Restricted products/rational diagonals and classical Hodge structures are foundations, not the infinite p-level moduli objects, p-adic period maps or completed traces here. No matching target to remove. |
| Tau Ceti `LinearAlgebra/SymplecticGroup` | Supplies symplectic matrix identities and block elements, not the multiplier-sensitive Γ₀/Γ₁ levels or their tower comparisons. |
| Tau Ceti `adjugateGL`, `adjugateGL_mul`, `adjugateGL_one` | Already imported by the package author; no duplicated generic adjugate target remains. The retained Hilbert action/pairing maps specialize this operator and track the geometric and target-generator directions. |
| Tau Ceti continuous profinite quotient sections | Already consumed; the Hilbert contracted product adds its specific pairing/moduli comparison, not a new generic section theorem. |
| Tau Ceti algebra-product norm/trace and normed operator trace modules | Different operators/domains from degree-normalized finite-free algebra trace and completed anticanonical-tower retractions. |
| Tau Ceti double-coset normalizer, map and identity modules; reductive-group Iwahori targets | Normalizer collapse/conjugation and rational Iwahori decomposition do not supply the retained conditional parabolic-intersection theorem, analytic depth tubes or nonsplit Levi-image target. |

**Removals in this review: none.** The author's prior removal of generic `dualMatrix` and its laws is correctly represented by the actual adjugate import. No local build commands were run in the current upstream or library checkouts.

## Adversarial mathematics pass

The table covers every target subsection, including its defining convention, API and identity claims. Within each row I checked the actual hypotheses against degenerate and nearby wrong definitions. A hypothetical constant tower or arbitrary torsor is a negative control, not a substitute for the specified Shimura object.

| Targets checked | Instances/calculations | Result or change |
| --- | --- | --- |
| 0.1 | g=1, p=2, m=0; g=2 diagonal `(I,−I)` at odd p; fixed upper unipotent in every Γ₁ | Genus-one quotient indices are p−1 and p; depth zero uses the zero residue ring and gives the full integral group. Determinant 1 does not imply multiplier 1 in genus two; Γ₁ is not cofinal. |
| 0.2–0.5 | Trivial local group; deeper versus larger level; two translations g,h; diamond limit versus completed-ring density | Projection direction and `T_(gh)=T_h∘T_g` agree. Representability of a diamond is separated from the extra tilde-limit conditions. |
| 0.6–0.9 | Torus/central arithmetic kernel; nontrivial finite component quotient; rigidified versus coarse moduli | Neatness does not remove the closed central kernel or make an infinite fixed-pairing fibre open. Neutral stabilizers and rigidifications are retained. |
| 0.general.1–0.general.2 | General pure datum outside Hodge type; cusp lattice changed at deeper level; ray `(2,−1)(2,−1)ᵀ` | No general toroidal perfectoidness is inferred from the diamond limit; fan smoothness is evaluated in the actual lattice. |
| 1.1–1.4 | g=1 versus higher genus; ε=0 versus positive ε; codimension-one boundary and zero ideal | Integral/Hasse domains use actual models and the stated Hartogs hypotheses; a genus-one cusp is not a codimension-two Hartogs application. |
| 1.5–1.7 | Empty boundary, finite normal cover, ramified cover, all goodness exponents | Goodness and bounded extension retain normality/étaleness/codimension restrictions; an arbitrary finite cover is not substituted. |
| 1.8–1.12 | Relative Frobenius in characteristic p; p=2; endpoints of ε; genus-one degree | Radius changes and p-power degree are consistent; division by a degree is confined to characteristic zero. |
| 1.13–1.18 | Strict diagonal Iwahori versus Γ₁ upper unipotents; finite trace K and K×K; characteristic-p degree p; trivial algebra | Normalized trace sends scalar a to a since the trace is d·a and d≠0. The zero algebra and characteristic-p 0/0 are excluded from the finite Lean retraction. Completed plus-ring control is a separate target. |
| 1.19–1.22 | ε=0 ordinary splitting; general ε in g≥2; g=1 q-root cusps; interior étaleness versus boundary ramification | The higher-genus full-to-Γ₁ inertia proof remains an explicit prerequisite. Almost purity alone is not used to identify a boundary plus ring. |
| 1.23–1.25 | Rational versus nonrational flags; split ordinary p-divisible group; finite translates | The flag is the correct Hodge–Tate kernel/dual-Lie filtration, and compactness supplies a finite covering argument. |
| 1.26–1.28 | p=2; genus-one two charts; g=2 coordinate subsets containing both members of one symplectic pair; multiplier with nontrivial unit part | The source chart claim is restricted to Lagrangian coordinate subsets. Cyclotomic-base equivariance is semilinear; no all-coordinate proof or linear action is inferred. |
| 1.29–1.31 | Fixed cone at changed lattice; modified versus unmodified formal limit; unit q-root rotation | Toroidal and cusp comparisons retain their extra hypotheses; no unmodified-limit identification is asserted. |
| 2.1–2.2 | Identity Siegel embedding; normalization of nonnormal image; closure with its induced ideal | Image compactification uses its scheme/analytic structure. Finiteness of the minimal extension is an explicit additional contract, not inferred from a set image. |
| 2.3–2.5 | Deligne versus torsion-paper setup; full tame level; finite quotient with boundary | Open/image tower arguments remain distinct from genuine minimal representability. |
| 2.6–2.10 | Arbitrary non-product levels; extension C'/C; constant positive-dimensional tower | Genuine minimal representability does not imply a tilde-limit ring-density statement; integral-algebra perfectoidization and embedding independence are supplied explicitly. |
| 3.1–3.4 | Lower versus upper parabolic; row `(1,z)`; diagonal `(a,d)`; genus-two nonsymmetric graph; factor zero | The transformed row is `(a+zc)(1,(b+zd)/(a+zc))`; inverse requires unit determinant. The dual frame contributes multiplier inverse, and symmetry is essential. |
| 3.5–3.8 | Tensor filtration versus arbitrary flag point; tame Hecke; boundary extension | Specific Hodge-type factorization/torsor comparison is the delta over the imported generic homogeneous geometry. Genuine minimal and image-map extensions remain distinct. |
| 3.9–3.13 | p=2; ample power versus k=1 descent; radius zero over a normed p-adic extension; ramified Hilbert coefficients | No p=2 estimate is promoted to a proved input. Distance zero recovers embedded ℤ_p, not all integral elements of K; the unramified integral splitting restriction is retained. |
| 4.1–4.2 | Closed neutral fibre in profinite components; nontrivial finite quotient | Property P and ConnectedPropertyP quantify over the actual levels and are not arbitrary representative spaces. |
| 4.3–4.7 | Rational image proper in adjoint group; finite central kernel; pre-abelian data without an abelian lift; reflex embedding | The finite-map repair replaces an unjustified equality. Pre-abelian representability supplies no unsupported period map. |
| 5.1–5.3 | F=ℚ, modular cusps, unit q-root rotations and anticanonical radius | The modular specialization agrees with the tower and period conventions. |
| 5.4–5.5 | Fixed pairing versus its unit orbit; [F:ℚ]>1; full adelic deck group versus finite component group | Geometric, intermediate and arithmetic Hilbert towers and their rigidifications are distinct; open PEL tilde-limits are not deduced from genuine minimal diamond limits. |
| 5.6–5.8 | Adjunction reverses multiplication; p=2 units and polarization signs; totally real unit torsion | Level action is left action over right translation by the dual; polarization generator changes use the inverse. The full profinite deck kernel is not replaced by one finite-stage group. |
| 5.9–5.11 | Diagonal `(2,3)` dual `(3,2)`; pairing coefficient 6; target generator multiplied by 2; scalar p | Matrix pairing scales by determinant, coefficient becomes 3 after generator change, and scalar p changes polarization by p². Ramified integral splitting is not silently used. |
| 6.1–6.3 | Finite Kummer chart versus completed fs/adic overlap; boundary density; effective central kernel | Completed universal openness is explicitly required. A finite-level openness theorem or an interior dense set does not establish it. |
| 6.4–6.6 | Auxiliary reflex norm; Gᶜ central characters; H₁=H₃=1, H₂=G_m with differing torsor sections | Smooth-surjectivity/group-fibre-product hypotheses prevent an empty torsor fibre product. Derived central isogeny alone is too narrow. |
| 6.7–6.8 | Connected components of a tilde-limit; stabilized finite deck quotient; pre-abelian versus abelian type | Finite invariant affinoid covers and fixed-tame stabilization are required; period-map descent is confined to the abelian-type construction. |
| 6.9–6.11 | Ramified toroidal quotient; inertia on torsor fibres; twisted de Rham versus untreated Hodge–Tate lattice | Boundary inertia-triviality is an explicit descent input, and the integral lattices are not identified without their comparison/twist. |
| 6.12–6.13 | GL₂ at m=n=1, strict lower depth p²; rational depths after ramified extension; m=n=0; m=0,n=1 | Root radii and strict inequalities agree. Added the nonnegative quotient domain and its rejection Check; API hypotheses now match the statement. |
| 6.14–6.15 | m=n with GL₂ special levels; t=1, u and u⁻¹; P=1, H=Ubar=G, t≠1; nonsplit Res GL₂ and B×GL₂ | Unipotents may cancel without vanishing separately. `t∈P` and both H factorizations are explicit in the valid group lemma. The nonsplit example refutes an auxiliary factorization, not the desired Levi-image equality. |

The 27 definition/construction Check counts are: 0.1:5; 0.2:4; 0.3:3; 0.4:4; 0.5:4; 0.8:4; 0.9:4; 0.general.1:3; 0.general.2:4; 1.1:5; 1.5:4; 1.13:4; 1.16:4; 1.23:4; 1.27:4; 1.30:4; 2.1:4; 2.2:4; 3.1:5; 3.4:7; 4.1:4; 5.4:4; 5.6:4; 5.9:3; 6.4:3; 6.12:5; 6.13:5 after the added Check. These tests distinguish computed values, valid examples, wrong coefficient/action choices, degenerate cases or constructions that lack the required topology. §6.5 is a lemma about torsor fibre products, not a definition missing its tests.

## Lean shape and signature audit

The file has 486 lines, 17 light real-bodied definitions, 16 theorems and 33 examples. Subgroup/homomorphism law fields are proof obligations; none supplies admitted data. There are no artificial perfectoid/moduli carriers, construction chains or `True` targets. The closing comment identifies the geometric definitions/APIs that are retained solely in the README. Generic algebra is explicitly scoped as the finite-level/matrix portion of the geometric target.

All sixteen theorem signatures were matched independently:

| Lean signature(s) | README | Hypotheses and scope checked |
| --- | --- | --- |
| `GSp.similitude_spec` | 0.1 | Finite nonempty index; unit multiplier; commutative ring; the sign of J does not change the predicate. |
| `GSp.levelGamma_cofinal` | 0.1 | Open subgroup of the integral group, prime p; conclusion is a containment witness. |
| `GSp.gsp_genusOne`, `GSp.levelGamma_genusOne` | 0.1 | Rank two; specified integral inclusion/index dictionary; arbitrary natural depth, including zero. |
| `GSp.similitude_levelGamma0` | 1.2 | Exact reduction-kernel image, with all units at depth zero. |
| `SiegelTorsion.FiniteLevel.normalizedTrace_algebraMap` | 1.16 | Nontrivial finite free algebra over a characteristic-zero field; does not claim completed-tower trace continuity. |
| `SiegelTorsion.strictIwahori_le` | 1.13 | Diagonal reduction and multiplier one; containment in Γ₀(p), not equality with Γ₁(p). |
| `HodgeTate.MatrixChart.siegelGraphChart_act` | 3.4 | Matrix row identity over a commutative ring with a unit determinant factor. |
| `HodgeTate.MatrixChart.det_factor_isUnit` | 3.4 | Integral A,C,Z over ℤ_p, A determinant a unit, C zero mod p; not an arbitrary DVR statement. |
| `HodgeTate.MatrixChart.hodgeFrame_transform` | 3.4 | Quotient frame composition with the same unit condition; does not erase the separate dual-frame multiplier. |
| `HodgeTate.MatrixChart.graphDistanceDomain_zero` | 3.13 | Normed ℚ_p extension and compact embedded ℤ_p; empty matrix indices are harmless. |
| `HodgeTate.MatrixChart.siegelGraphChart_stable` | 3.13 | Nonempty finite index, ultrametric normed extension, strict-Iwahori blocks, `0<r≤1` and symmetric distance domain. |
| `HilbertTower.Coefficients.levelAction_mul` | 5.6 | Rank-two GL action through actual Tau Ceti adjugate; anti-multiplication gives the specified left-action order. |
| `HilbertTower.Coefficients.pairingCoefficient_level` | 5.9 | Matrix coefficient scales by determinant; geometric interpretation remains in the README. |
| `HilbertTower.Coefficients.pairingCoefficient_changeGenerator` | 5.9 | Generator change is by a unit, making its inverse legitimate. |
| `AnalyticLevelGroup.doubleCoset_inf_parabolic` | 6.15 | `P∩Ubar=1`, `t∈P`, conjugation condition and both factorization orders; no unsupported nonsplit factorization assumption. |

The shared pinned `lean-check` run exited 0. It emitted exactly 49 warnings, all `declaration uses sorry`, with no errors or other Lean warnings. The mathematical pass above is independent of that elaboration result. No Lean edits followed this successful run.

## Explicit proof inputs retained

No unfixable packaging defect remains. The following implementation prerequisites continue to be explicit, with their consuming conclusions conditional and their owners identified:

1. **Integral-algebra perfectoidization:** the Bhatt–Scholze universal construction must supply the exact integral-extension/finite-tower interfaces used for genuine minimal and adjoint/pre-abelian representability. PerfectoidQuotients' semiperfectoid quotient theory alone does not do this; the additional construction is coordinated with PerfectoidSpaces P8. Open and image towers have their own proofs.
2. **General-ε full-to-Γ₁ boundary inertia:** ShimuraCompactifications C5 must prove the required lower-genus strata comparison, inertia constancy and ordinary density for §1.22. Full principal-level strata, ε=0 and genus-one cusp calculations do not finish that proof.
3. **Completed log-chart openness:** §6.1 requires universal openness after completion, inverse limit and diamond base change, including the fs/adic fibre-product comparison. This tower statement belongs here, with general log-site foundations in T6; it is separate from the effective kernel and joint v-cover.
4. **Auxiliary data and coefficient Levi fibre products:** ShimuraData D4 needs Lovering's reflex norm/cocharacter maps and the explicit Gᶜ central-character calculation. Smooth torsor fibre-product descent does not establish the input group identities by itself.
5. **Boundary torsor descent:** AutomorphicBundles B3.general with ShimuraCompactifications C3.general must show inertia acts trivially on the pushed-out canonical Levi fibres before the ramified toroidal quotient can produce the claimed torsor in §6.9.
6. **p=2 truncated integral estimate:** §3.9's modified models use the reported bound 2 and its resulting exponent `n₀−2g`; this remains an input to T5, independently of all-prime perfectoid representability.
7. **Nonsplit local Hecke Levi image:** §6.15 still needs a Galois-compatible proof of the actual image equality, or sufficient additional hypotheses with the remaining case separately planned. The valid cancellation lemma cannot replace the failed nonsplit H factorization. No counterexample to the image equality itself is claimed.

The stronger k=1 descent in Pilloni–Stroh Remarque 1.23 is not promised as an established theorem: §3.9 instead states the sourced ample-power result sufficient for its consumers. There is no new claim of solved errata or completed stages; all eight stages remain planned.

## Validation and next action

Successful checks: pinned `lean-check` as above; `scripts/check_blueprint.py` on the unchanged accepted packet (0 errors, 0 warnings); `scripts/check_sorry_data.py` on the package Lean file; `research/blueprint/intake.py check-files` on the three changed deliverables (0 problems); and `git diff --check`. The name inventory found no lost API or original Check. The review changes only the package README, its new review.json, and this report.

Next action: the maintainer can port the accepted package as a draft TauCetiRoadmap PR, retaining its conditional proof inputs. No checkpoint or unfinished review task is left for another worker.
