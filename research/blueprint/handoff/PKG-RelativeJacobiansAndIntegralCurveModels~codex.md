# Package handoff: RelativeJacobiansAndIntegralCurveModels

Issue: #11110. Agent: Codex. Session: codex-xcfnZg. Date: 2026-10-19.

## Result and remaining work

Complete package for independent review: README, representative Suggested.lean and math.NT metadata. The README covers all 28 input nodes, all six layers, their APIs and discriminating Checks, and the modular worked examples. Section 1.8 makes explicit two group-algebraic-space bridges required by the general quotient proof. There is no unfinished mathematical section or deferred source lookup. These are roadmap targets, not claims that the Picard, Néron, Greenberg or resolution constructions have been formalized.

The next action is independent package review. The existing input packet, reader and suggested file were read but deliberately not edited: this job permits only the three package files and this note. In particular the corrections below are in the package, not silently backported to those inputs. No new job was claimed.

## Inputs and library audit

Read WORKERS, PROTOCOL (including §§5, 13, 15 and 20), the expansion protocol, UPSTREAM_GUIDE and PACKAGE_REVIEW. Queried the packet's 28 nodes, 90 API items, 40 tests, 25 planets, 29 baseline declarations and 14 cross-roadmap requests; read the reader, previous suggested file, stage descriptions and design handoff. Read the approved exemplar's README and Lean openings and the full upstream JacobianChallenge and StableReduction roadmaps, including their Suggested.lean files.

The reviewed library-coverage audit was checked against declarations, rather than treating its old gaps as current facts. Read the statements at Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 and Tau Ceti f790474821cf4256814db967cb154e7af3d0c369 before using them. Also searched the current read-only roadmaps at 0d144d044dacebca17b654695b6f1ad58f159b27 and current Tau Ceti at a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039 by the mathematical objects: integral closures and normalization, curve models, cohomology and two-affine vanishing, rigidified bundles, Picard functors, degree-zero classes, group quotients, Néron components, torsion and surface resolution. The nine newer roadmaps and the four Completed roadmaps were included in the search. No build was run in either read-only checkout.

Important pin-level interfaces read include `TauCeti.Model` (with its quasi-separatedness field and marked generic isomorphism), `genericFiber`, `Scheme.Hom.normalizationDesc`, `cohomologyOn`, `cohomologyOnRes`, `mayerVietorisδ` and `mayerVietorisSequence_exact`. Current-library interfaces read include `RigidifiedLineBundle`, its class and pullback operations, `rigidifiedPicardFunctor`, `LineBundleClass.picZero`, `SchemeWeilDivisor.map_picZero` and `AlgebraicGeometry.Scheme.Modules.subsingleton_cohomology_of_two_le_of_isAffineOpen`. The abstract `NumericalType.Pic` and its weight/degree convention were checked separately from the geometric component theorem.

## Ownership, duplication removals and order

| Input direction | Supplier retained; additional content here |
| --- | --- |
| DVR models | Import `TauCeti.Model`; add Dedekind bases, keep the generic marking and compare the existing DVR model by a real conversion. |
| Relative normalization | Import Mathlib normalization and integral-closure localization; add the two-chart Dedekind curve model, finiteness hypotheses, cohomology and marking. |
| Higher coherent cohomology | Import acyclic-cover and current two-affine vanishing; retain the explicit ordered kernel/cokernel and integral-closure quotient, not a second vanishing theory. |
| Rigidified line bundles | Import their actual current carriers, tensor and pullback; add finite-flat rigidificators, their unit sequence, representability and universal-family comparisons. |
| Actual degree-zero classes | Import `picZero` and `map_picZero`; add Jacobian-valued, field-extension and Galois-natural comparisons. |
| Field and smooth-family Jacobians | Import JacobianChallenge and JacobianChallengePartII, including positive-genus representability, Abel maps and base change. Add genus zero and the section-rigidified arithmetic comparison. No second Jacobian or principal-polarization construction. |
| Cartier divisors and symmetric powers | Import JacobianChallenge Layer C; add the relative-Cartier open locus in Hilbert spaces on arbitrary fibres and the exact Abel-fibre statement. |
| General Picard/Artin/Brauer foundations | Import AlgebraicModuliForArithmeticGeometry and SchemeAndStackFoundations at the named layers. Keep the geometric-multiplicity-gcd criterion and arbitrary-fibre rigidified quotient proof here. |
| Scheme quotients and Lang | Import ReductiveGroupsPartII §§RG2.3.1 and RG2.3.7. Its group-scheme quotient is insufficient for a group algebraic space; §1.8 supplies that bridge and the separated smooth group-space scheme theorem. |
| Existing Néron theory | Import NeronModelsAndSemistableAbelianVarieties for definitions, mapping properties, uniqueness, étale base change, abelian-variety existence and global gluing. Its regular semistable case and §4.7 regular/algebraically-closed-residue/gcd-one case are ownership boundaries. The new content is arbitrary-normal-model P/E, the full stated Raynaud extension and normalized imperfect-residue/δ > 1 components. |
| Local regular models and singularities | Import StableReduction and the surface foundations. Add the global excellent-Dedekind normalization/resolution bridge, not another local resolution or stable-reduction theorem. |
| Good-reduction torsion | HeightsRationalPointsAndObstructions §1.18 already owns the number-field abelian-variety good-reduction theorem. Keep it as a compatibility boundary; §4.2 is for any separated commutative finite-type group over any DVR, and §4.3 includes bad fibres. No dependency on Heights is introduced. |
| Abstract numerical Picard group | Import `NumericalType.Pic`; add the geometric comparison only after matching its input lattice, relations and weights. Constant-field weights cannot simply be renamed geometric multiplicities. |
| Greenberg lifting | No suitable supplied Greenberg result was found in the Néron roadmap. Section 4.4 explicitly owns the finite-level construction and identity-point lifting needed in the δ > 1 proof. |
| Modular curves | Deligne–Rapoport models, fibre geometry, thicknesses and supersingular counts remain consumer inputs. The worked examples apply the general Picard/Néron results, including the normal all-level X₀(N) identity comparison away from 2 and 3; they do not re-plan modular models. |

The Caraiani–Newton order does not assign this new roadmap, or JacobianChallengePartII, a tier. Its named existing suppliers lie in earlier tiers: ReductiveGroupsPartII 1, SchemeAndStackFoundations 2, AlgebraicModuliForArithmeticGeometry 4, AbelianSchemes 6, Néron models 8, and FiniteFlatGroupsAndIntegralPadicHodgeTheory 10. Conservative upstream placement is after all those suppliers and JacobianChallengePartII. This is a placement constraint for the maintainer, not an invented tier or a modification of the order file. There is no upward Heights import or supplier-to-consumer cycle. The Néron roadmap keeps its independently owned special cases. The bridges and Greenberg machinery needed here are explicitly placed here rather than assumed to come from a higher consumer; no existing higher roadmap definition was moved without naming it.

## Mathematical corrections and generality

The input's word “index” was ambiguous. Here δ is the gcd of geometric multiplicities, not the closed-point index: an anisotropic real conic has δ = 1 but index 2. Realization under f_*O = O is stated on flat test schemes; arbitrary tests require universal global functions.

Total degree zero P = Pic^[0] is kept separate from the identity component Pic⁰. The former can be nonseparated and have vertical classes even for a blown-up rational model. Universal bundles live on represented rigidified functors; a Néron identity component is used only after the actual Picard comparison. The function corepresenter is finitely presented, not automatically locally free. The elliptic universal-bundle formula retains its base-line factor so that both axis rigidifications are correct.

The normalization universal properties have different directions: relative normalization maps to integral intermediate factorizations; a normal model with function field *identified with F over K(t)* maps to that normalization. A map from Spec F alone is insufficient for the latter claim. Finiteness needs a Nagata base or a finite separable extension; characteristic-zero fraction field alone does not imply excellence. A regular field curve over an imperfect field is not silently declared smooth.

The Néron comparison retains the full smooth-test mapping property and all stated residue-field/quasi-section alternatives. A pointed regular model supplies the smooth quasi-section even over imperfect residue fields. Rational singularities are tested through this specific Picard pullback and its Leray/Lie argument; a Lie isomorphism is not presented as a general isomorphism criterion for arbitrary group morphisms. Abstract global Néron gluing is supplied, while compatibility with the Picard-computed models is new here.

For components, α_ij = (C_i.C_j)/e_i acts on columns, β(a) = Σ d_i e_i a_i, and ρ_i = deg_i/e_i. The nonsymmetric normalized matrix must not be transposed. Correcting a class requires αc = ρ(L) and L' = L ⊗ O(−Σc_iC_i). Its identity value exists only for a zero component class under Pic⁰ ≅ N⁰. The δ > 1 proof includes Greenberg lifting and stabilization of kernel images before the inverse limit. Mixed-characteristic finite levels are not treated as k-algebras.

Henselian smooth lifting is onto N_k(k); lifting every rational component additionally needs the relevant torsors to have points. Finite residue fields supply this through Lang. Torsion injectivity uses the full special fibre and the strict e < p−1 threshold. Bad-reduction comparison is étale/unramified; arbitrary ramified base change requires its actual new Néron model. Good-reduction abelian schemes have the stronger base-change interface.

## Coverage and adversarial pass

Each row records the whole subsection, including its defining convention, API statements and hypotheses; the text and Checks were revised together. Inapplicable analytic tests (noncompactness, a cardinality q = 1) do not occur in this scheme-theoretic package. F₂ and p = 2 are tested explicitly. Rank zero/one, zero modules, unit ideals and n = 0/1/2 are tested where their carriers occur. No denominator e_i is zero: it is a positive geometric multiplicity. Empty minors have value one.

| Input node / README | Instances and statements checked | Result / correction |
| --- | --- | --- |
| dedekind-model / §0.1 | Field base, P¹_Z, A¹_Z, Z[x]/(2x), DVR conversion | Flatness excludes torsion; properness is separate; generic marking preserved. |
| proper-model-points / §0.2 | [1:p], 1/2 on A¹, xy = π, xy = π² with section (π,π) | Properness needed for extension and regularity for the smooth locus; field case handled directly. |
| normalised-projective-line / §0.3 | F = K(t), t versus πt, t = u², splitting constants after extension | Fixed factorization directions and required the full function-field identification; no fraction field of a split tensor product. |
| normalised-model-properties / §0.4 | Field/DVR, inseparable extension, nontrivial constants, nonexcellent bases | Distinguished regular from smooth; retained exact finiteness alternatives and integral closure of constants. |
| two-chart-cech / §0.5 | Zero module, U = X or empty, U = V, O(n) for n = −2,−1,0,1,2 | Kernel needs no affine hypotheses; cokernel needs quasi-coherence/affines; differential is first restriction minus second. |
| normalised-model-cohomology / §0.6 | P¹, generic genus, torsion T = R/π^m, unit annihilator/zero torsion | H¹ chart denominator is an additive sum; fibre jump is rank plus dim T/πT; H⁰ base-change defect is Tor₁(H¹,k). |
| fibre-multiplicities / §1.1 | Double component, reducible fibre, imperfect field, real conic, disconnected tests | δ_i = d_i e_i; total degree and partial degrees separated; δ is not point index. |
| index-representability / §1.2 | Rank one/two, coprime ranks, nonflat tests, conic obstruction | Finite-flat norm and Bezout argument kept; weak global-functions hypothesis only licenses flat tests. |
| rigidificator / §1.3 | One/two points on P¹, disconnected curve with point on one component, jumping functions | Universal injection detects failure; Q_X may not be locally free; unit quotient has the stated direction. |
| rigidified-picard-representability / §1.4 | P¹ with n = 1,2 or general n ≥ 1, empty rigidifier, torsion cohomology, surfaces | Kernel is (G_m)^(n−1); n = 0 is rejected; formal smoothness alone does not represent the unrigidified sheaf. |
| universal-rigidified-bundle / §1.5 | P¹ degree d, genus zero, elliptic axes, pointless conic, base twists | L^e = L ⊗ f*(e*L)^−1; elliptic q*N term restores both trivial axes. |
| relative-cartier-divisors / §1.6 | Empty divisor, smooth point, node subscheme, nonreduced fibre | Finite-flat length alone does not imply Cartier; compare only the open Cartier locus. |
| abel-map / §1.7 | Degrees 0,1,g; P¹ and elliptic curves; reducible fibre | P(Q_L) uses quotient convention and Q_L = (f_*L)^dual when locally free; translated divisor need not lie in Pic⁰ on a reducible fibre. |
| Additional bridges / §1.8 | H = 1, H = G, G_m/μ_n in characteristic dividing n, field/trait, constant Z | Quotients are first algebraic spaces; scheme theorem uses the group law and separatedness; lft version does not assert finite type. |
| pointed-smooth-curve / §2.1 | Genus zero/one, nontrivial P¹-bundle, disconnected base | Positive-genus supplier used at its range; genus-zero trivial Jacobian does not trivialize the curve bundle. |
| jacobian-rigidified-representability / §2.2 | P¹, elliptic scheme, dual-number test, changed base point | Functor-level comparison with rigidification, not just a geometric-points bijection. |
| jacobian-points-divisor-classes / §2.3 | L = K, separable closure, conic without a point, principal class | Actual Picard comparison and sheaf points distinguished; pointed field-extension comparison is natural/Galois equivariant. An invariant representative is obtained by actual line-bundle descent before taking a divisor. |
| good-reduction-specialisation / §2.4 | P¹, elliptic curve, colliding sections, principal divisors | Restriction respects actual classes; arbitrary point reduction need not be injective. |
| degree-zero-quotient / §3.1 | Smooth family, blown-up P¹, full Pic instead of degree zero, nonrepresentable Pic | All three proof cases retained; quotient is lft before a finite-type proof; E uses flat tests. |
| raynaud-representability / §3.2 | Pointed regular model, gcd one with mixed multiplicities, double component, singular section | gcd criterion retained; singular section alone does not supply a smooth quasi-section. |
| raynaud-neron-model / §3.3 | Good reduction, I_n, imperfect pointed trait, P¹ smooth-test counterexample | Full mapping property and finite type both explicit; intersection estimates precede component interpretation. |
| rational-singularities-criterion / §3.4 | Identity resolution, xy = π^n, nonzero R¹π_*O, étale isogeny | Specific Picard pullback/Leray argument required; arbitrary Lie isomorphism is insufficient. |
| global-neron-jacobian / §3.5 | Field, no bad points, two bad primes, pointed imperfect residues | Dense good open and finite bad set used; full components preserved under gluing. |
| reduction-homomorphism / §4.1 | G_m, constant groups, nonhenselian base, nontrivial component torsor | Separatedness gives generic injectivity; henselian lifting and component lifting distinguished. |
| torsion-specialisation / §4.2 | Trivial group, equal characteristic 0/p, μ_p at e = p−1, −1 over Z₂ | Finite flat cyclic closure justified inside general G; strict ramification threshold retained. |
| global-torsion-injection / §4.3 | Good/bad fibres, finite F₂, product with component count | Full N_s replaces identity fibre in the bound; finite-group divisibility is for the allowed torsion subgroup. |
| component-multidegree / §4.4 | One component, blow-up matrix, I₂, c = (−1,0), e = (1,2), δ > 1, Greenberg n = 1 | Pinned row normalization/column action and negative correction sign; no realizability claim for formal numerical data; completed lifting argument includes stabilization. |
| regular-model-existence / §5.1 | P¹, field base, singular plane closure, nonreduced/reducible fibre | Excellent surface resolution and marking required; regularity does not imply good reduction. |
| specialisation-package / §5.2 | Genus zero/one, I₂, blow-up, imperfect residues, p = 2, ramified extension | No perfection added in pointed case; component and corrected identity formulas have their separate domains. |
| Worked modular examples | X₀(11) at 2,3,11; two P¹ components with m = 1,2 nodes; composite level | Explicit point counts and split I₅ check; thickness retained; all-N normal-model identity comparison restricted away from 2,3. |

For Lean specifically, reviewed the surrounding `variable` blocks and all actual hypotheses. `DedekindModel.existsUnique_section` is the affine-Dedekind specialization of the general scheme-base README result. The degree-zero kernel statement is for every module; the H¹ statement is for a quasi-coherent module on two affine opens with affine intersection and targets their union. Both statements specify the canonical maps, not merely existence of unrelated isomorphisms. Scalar/base-change refinements remain named README targets. Four proved examples pin preservation of the generic marking/properness and the two signs of the ordered differential. Heavy-carrier boundaries remain prose targets; no unrelated matrix or finite-field exercise was added to Lean just to inflate test counts.

## Sources read

Read the maintainer-cleared 1990 BLR copy directly, with printed-page locators and no extraction saved to disk. Relevant pages read include 13–20, 47–48, 60–61, 113–115, 164–167, 186–190, 199–215, 222–243, 251–258, 259–277 and 286–288. The README gives theorem/proposition/lemma numbers at each use. In particular the general quotient's three cases, regular-model theorem, rational-singularity proof, Greenberg lifting proof and component normalization were read in the source, not inferred from a later summary. No cleared source or passage was copied into the repository or scratch.

Checked Stacks pages 035H, 035I, 0BAK, 032L, 035S, 0C45, 0B5X, 0D2S, 0B45, 0BGP, 01X8, 01XB, 01XD, 0AUW and 0BY1 against their statements. These supply normalization, finiteness, ample-degree, Čech, flatness and resolution locators. An unrelated generically-finite page encountered in searching was not cited.

Read James Parson's publicly hosted *Moduli of elliptic curves*, §§8.1–8.3, pp. 14–16, for the X₀(11) modular identification and cusp class. Directly computed the equation change, invariants, four multiples, F₂/F₃ point counts and the split node at 11. The p. 15 phrase assigning the nonidentity cuspidal specialization to 5 is a typo for 11; the same paragraph's discriminant and following sentence, and the direct computation, settle it. This is noted in the package's worked example, not turned into a separate errata job. A second public lecture PDF with unusable text was not used. No public PDF was saved locally, so there is no downloaded-source checksum to record.

All source statements in the deliverables are in our own words. There is no source passage or section-by-section synopsis. No untrusted source, comment or PR text was followed as an instruction; no suspicious request to execute code, access a credential or change unrelated files was encountered.

## Validation

- `python3 scripts/check_blueprint.py research/blueprint/packets/RelativeJacobiansAndIntegralCurveModels.json`: 0 errors, 0 warnings. This validates the unchanged input packet, not the truth of the new roadmap.
- `lean-check research/blueprint/packages/RelativeJacobiansAndIntegralCurveModels/Suggested.lean`: exit status 0 at the pinned shared build; only the three theorem `sorry` warnings, at lines 83, 117 and 126. The final subsequent change only expands the closing comment. No sorry'd data, axioms, admitted examples, synthetic replacement carriers or developed theory. Memory was above the required 20 GB before checking; no language server or Lake build/update/cache operation was started.
- The package has all six `## Layer` sections, numbered prose subsections, a Checks list with at least three tests per subsection and Examples/Dependencies per layer. Suggested.lean is under 160 lines, far below the 5,000-line cap. README is approximately 128 KB, within 50–200 KB.
- `python3 research/blueprint/intake.py check-files` on the four deliverables: 4 files, 0 problems. Final allowlist and whitespace checks are also recorded in the submitting PR. Only this issue's four deliverables are submitted.

No checkpoint is required. Nothing needs resuming before independent review.
