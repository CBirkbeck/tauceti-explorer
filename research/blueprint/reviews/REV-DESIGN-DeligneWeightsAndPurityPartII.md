# Independent review: DeligneWeightsAndPurityPartII

Accepted as a complete target-level planning pass on 2026-10-14. All 30 nodes are justified: 16 verified and 14 corrected. Two proof/access gaps remain explicit; acceptance does not certify that the prerequisite graph is gap-free or that the targets are formalised. This follows the review issue’s rule allowing acceptance with honestly recorded gaps.

Reviewer: Codex (GPT-6), session `codex-6pI7AI`, job `REV-DESIGN-DeligneWeightsAndPurityPartII`, issue #4592. This session did none of DESIGN-DeligneWeightsAndPurityPartII, which was written by a different agent/session.

## Counts and scope

| Item | Final count |
|---|---:|
| Nodes | 30 |
| Definitions / constructions / theorems / applications | 3 / 5 / 20 / 2 |
| API items / discriminating tests | 74 / 34 |
| Baseline declarations | 14, all independently confirmed |
| Added / removed nodes | 0 / 0 |
| Gaps / requests | 2 / 9 |
| Source issues | 3, all confirmed |
| Planets | 15: WM.0 3, WM.1 2, WM.2 3, WM.3 3, WM.4 4 |

WM.2 remains closed. WM.0, WM.1, WM.3 and WM.4 remain planned, with precise remaining interfaces or proof inputs. The five layers cover the conjecture/purity apparatus, the equal-characteristic theorem, Kummer-tower transfer, neighbourhoods and the toric complete-intersection proof. They do not claim a general mixed-characteristic theorem. All eight definition/construction targets have at least four tests; the local datum now has five. No layer exceeds six planets, and the target-level granularity is appropriate.

## Sources read and source issues

Read the published [Scholze article](https://pmihes.centre-mersenne.org/item/10.1007/s10240-012-0042-x.pdf): §1, Theorems 1.1, 1.3 and 1.15/Conjecture 1.14, pp. 245–251; §3, Theorem 3.7, p. 267 and its proof, p. 283; §8, Definition/Proposition 8.4 through Corollary 8.8, pp. 304–307; and §9, Proposition 9.1 through Lemma 9.9, including the entire proof of Theorem 9.6, pp. 307–311. Read [Ito v1](https://arxiv.org/pdf/2008.07794v1), §§1.1–1.2, pp. 1–3, and §§4.1–4.3, pp. 19–22. The packet records hashes and access dates. Source wording has been paraphrased, with theorem and page locators.

E1 is the unbound tame-character argument in Proposition 9.1 (p. 307); E2 is the unquantified weight integer in Lemma 9.5 (p. 309). Both are confirmed. E3 is confirmed as an omitted choice in the argument on pp. 309 and 311: the alteration must be chosen geometrically connected so that both top-degree spaces are one-dimensional. An arbitrary integral alteration may have several geometric components. The finite-extension form of the alteration supplier provides the repair, without changing the final theorem. Each entry now has this review’s explicit verdict and reason.

The original Huber 1998 and Lütkebohmert 1993 papers were not read. Their claims are verified only in the forms stated by Ito, and the existing access gap remains. This review does not assert an independent reading of those originals or of the books cited by suppliers.

## Corrections in the deliverables

- Enforced profiniteness in the suggested signatures, added a topology counterexample, and made the rescaling-isomorphism direction explicit.
- Corrected the scalar from the restricted standard datum to the extension datum to e⁻¹ in WM.0/standard-local-datum and finite-extension-invariance.
- Scoped the Tate-twist API to the standard datum, or an explicitly supplied character.
- Explained the extension from the rational missing point in Scholze Theorem 9.4 to a closed point.
- Checked Frobenius on O_K/p in the Kummer-tower proof, as required by the supplier definition, rather than only on O_K/ϖ.
- Corrected the p-power roots-of-unity non-example: failure of surjectivity on torsion, with ε of infinite order.
- Fixed the tube locator to Ito §4.2, monotonicity name, and a model-dependence test with a concrete separating radius.
- Removed the unsupported simultaneous radius and nonproper fibre-vanishing claim from local constancy.
- Narrowed Huber’s target to the constant coefficients used here; replaced unsupported reductions by an exact proof gap while retaining the verified end theorem.
- Stated multiplicativity for the full graded cohomology ring, rather than a single H^i.
- Added the module-cohomology/Ext bridge to the cup-product prerequisites and clarified the Sheaf.H baseline boundary.
- Replaced the arithmetic-genus non-example by a smooth elliptic double cover of ℙ¹; added exact suppliers for the degree-positive API.
- Handled dimension zero separately and supplied proper pushforward plus the nef/big numerical criterion in Lemma 9.9.
- Narrowed the roadmap’s tilting-match scope to the packet hypotheses and made the neighbourhood proof boundary explicit.

- Imported LocalFieldsRamification Layer 1’s existing multiplicative Teichmüller section directly for the O_K/p argument. This adds an import request, not a new target or a demand for upstream work.
- Corrected five reader proof passages that described pending supplier requests as already supplied. All 30 reader target statements, hypotheses, proof steps, APIs and tests now agree with the packet.
- Added explicit independent source-issue dispositions and a verdict for every node. The roadmap’s order, parent, area and final theorem remain appropriate.

## Baseline and suppliers

Read every declaration’s actual body/signature in the Mathlib tree at `082e2d37e8b0463410cdb532e111cd43d5a66174`; the Tau Ceti pin stays `f790474821cf4256814db967cb154e7af3d0c369`. No baseline was removed or replaced. Two `provides` contracts were narrowed: `mapOfAlgebra` needs compatible chosen closure algebras/scalar towers and is only a continuous map; `Sheaf.H` is abelian-group cohomology, not by itself the Ext-in-ring-modules comparison.

- `mathlib:Field.absoluteGaloisGroup` — The absolute Galois group Gal(K̄/K) of a field, with its Krull topology.
- `mathlib:Field.absoluteGaloisGroup.mapOfAlgebra` — A continuous restriction homomorphism G_L → G_K after choosing compatible algebra structures on the algebraic closures and the required scalar tower. It does not alone establish an embedding or an isomorphism of Galois groups.
- `mathlib:ContinuousMonoidHom` — Continuous monoid homomorphisms between topological monoids.
- `mathlib:Subgroup.Normal` — Normality of a subgroup.
- `mathlib:Padic` — The field ℚ_ℓ of ℓ-adic numbers.
- `mathlib:PadicInt` — The ring ℤ_ℓ of ℓ-adic integers.
- `mathlib:IsNilpotent.exp` — The exponential of an element of a ℚ-algebra, as the finite sum up to the nilpotency class; meaningful for nilpotent elements.
- `mathlib:Representation` — A representation of a monoid G on a module V over k, as a monoid hom G →* (V →ₗ[k] V).
- `mathlib:Module.End.HasEigenvalue` — μ is an eigenvalue of an endomorphism f when the eigenspace is nonzero.
- `mathlib:LinearMap.IsPerfPair` — A bilinear map M × N → R is a perfect pairing: both induced maps to duals are bijective.
- `mathlib:CategoryTheory.Abelian.Ext.comp` — Yoneda composition Ext^a(X, Y) × Ext^b(Y, Z) → Ext^{a+b}(X, Z).
- `mathlib:CategoryTheory.Abelian.Ext.mapExactFunctor` — The map Ext^n(X, Y) → Ext^n(F X, F Y) induced by an exact functor F between abelian categories.
- `mathlib:CategoryTheory.Abelian.Ext.mapExactFunctor_comp` — (α.comp β h).mapExactFunctor F = (α.mapExactFunctor F).comp (β.mapExactFunctor F) h: exact functors preserve Yoneda composition.
- `mathlib:CategoryTheory.Sheaf.H` — Cohomology of an abelian-group-valued sheaf, defined as Ext from the constant sheaf ℤ. For a ring Λ, identification with Ext in sheaves of Λ-modules also needs the module/abelian-cohomology comparison supplied by ClassicalAdicEtaleCohomology H0.

Read the actual nodes supplying Weil numbers and powers, local weights, proper-smooth purity, the monodromy operator and filtration, perfectoid-field/finite-extension equivalences, toric approximation and topoi, generic fibres, adic comparison, derived cohomology and discs, spreading out, geometric components, alterations, Chow pushforward, Chern projection, degree, ample/nef/big positivity, Chern/cycle classes and rational Poincaré duality. Their hypotheses match the consumers. In particular, the node named `SF.5/projective-positivity` now defines semiampleness; it does not itself supply positive top intersection. The correct inputs are `SF.5/nef-big`, `SF.5/big-line` and `SF.5/nef-big-numerical`, together with ample restriction and proper pushforward. The numerical supplier retains its own recorded asymptotic-proof gap; this consumer imports its target instead of replanning it.

The nine requests comprise five existing upstream imports (LocalFieldsRamification Layers 0, 1, 2, 4 and AnalyticToricGeometry Layer 0) and four outstanding interfaces: the DWP.5 purity predicate, SF.2 Galois/base-change facts, NT.3 field/automorphism naturality and H5 comparison naturality. Each has a precise statement and named consumers. No missing supplier interface is silently replaced by the general mixed-characteristic conjecture.

The reviewed library audit was checked. Also checked current TauCetiRoadmap main `0d144d044dacebca17b654695b6f1ad58f159b27` and the current Tau Ceti library, including the newer LocalGaloisGroups and ProfiniteArithmetic contracts and the other seven newer roadmap scopes/signatures. The local-field inertia, arithmetic Frobenius, tame quotient, Teichmüller and toric substrate are already supplied and remain imports. No existing weight–monodromy datum, ℓ-adic N/purity package or toric weight–monodromy theorem was found in those newer roadmaps. Generic linear algebra already present in Mathlib is cited, and the cup-product prototype uses its existing Ext theorem directly. No read-only upstream checkout was changed or built.

## Honest closure boundary

The neighbourhood end theorem is supported by Ito Theorem 4.5(2), p. 21. Its original proof route is not fully reconstructed here. A second gap now names the exact missing inputs: blow-up descent and finite-cover gluing; bounded derived amplitude and one Kummer trivialisation/radius for the derived direct image; stabilisation of disc cohomology for those sheaves including their extension at the origin; and the limit of étale topoi/coefficient descent needed for pseudo-adic continuity. Ordinary proper base change does not preserve blow-up cohomology by itself, nonproper stalks are not automatically fibre cohomology, and an intersection of point sets is not a proof of the requisite topos limit. These corrections remove the unsupported assertions while preserving the sourced end target.

## Node-by-node decisions

| Target | Verdict | Evidence or correction |
|---|---|---|
| `WM.0/local-monodromy-datum` | corrected | Profinite hypotheses restored in Lean; compactness excludes the discrete model with an open zero tame image. Rescaling directions are explicit. |
| `WM.0/standard-local-datum` | corrected | Read the current LocalFieldsRamification tame/inertia/Frobenius contracts. Corrected the restricted-to-standard isomorphism scalar from e to e⁻¹. |
| `WM.0/restricted-local-datum` | verified | Open quotient image is fℤ̂; compact nonzero tame image is a nonzero ℤ_ℓ lattice. Checked transitivity, Q^f and four tests. |
| `WM.0/weight-monodromy-purity` | corrected | Logarithm uniqueness, geometric Frobenius sign, finite inertia on graded pieces and finite-power independence verified. Tate twisting now names the required character. |
| `WM.0/detection-on-subgroups` | verified | Grothendieck supplies the original N; the restricted nonzero tame image gives the same N. The finite-inertia power argument detects weights, including the p-power tower. |
| `WM.0/transport-along-isomorphisms` | verified | For t′∘α = c t the pulled-back operator is cN′, so rescaling preserves the filtration and purity. IsIso inverse and composite constants agree with Lean. |
| `WM.0/direct-summands` | verified | Monodromy and its filtration respect stable direct sums. The Tate-curve kernel example correctly distinguishes a subrepresentation from a direct summand. |
| `WM.0/weight-monodromy-conjecture` | verified | Proper cohomology defines a finite-dimensional continuous representation using the precise SF.2 request. Checked projective space, point, good reduction and semisimplification tests. |
| `WM.0/finite-extension-invariance` | corrected | Restriction and detection prove both directions. Corrected the datum isomorphism scalar to e⁻¹. |
| `WM.0/good-reduction-case` | verified | Smooth proper base change gives trivial inertia and N = 0; DWP.7 supplies proper-smooth finite-field purity. Reader now calls SF.2 an outstanding request. |
| `WM.1/deligne-curve-theorem` | corrected | DWP.5 and purity for every embedding give Weil q_x-weights. Added the constant-extension reduction from Scholze’s rational point to a closed point. |
| `WM.1/function-field-varieties` | verified | Verified spreading out, smooth-proper identification and the local completion comparison. No mixed-characteristic conjecture is assumed. |
| `WM.2/kummer-perfectoid-field` | corrected | Added the actual Frobenius O_K/p check and imported existing Teichmüller representatives. Tilt and density match Scholze §9 and the P1 contract. |
| `WM.2/galois-group-identification` | verified | The continuous baseline restriction map is only a map; isomorphisms come from the stated henselian-completion, tilting and completed-perfection suppliers. |
| `WM.2/residue-fields-and-roots-of-unity` | corrected | Sharp is equivariant and bijective on prime-to-p torsion. Corrected the p-power non-example: ε has infinite order, and mixed-characteristic p-torsion fails surjectivity. |
| `WM.2/monodromy-data-match` | verified | Checked inertia, geometric Frobenius, residue cardinality and t_k = v(t)t_k″. The declared isomorphism constant is correctly v(t)⁻¹. |
| `WM.2/tilting-transfer` | verified | A stable direct summand is pure; transport along β and detection on the two restricted data gives purity over the original local field. |
| `WM.3/tubular-neighbourhoods` | corrected | Ito Proposition 4.1 and Lemma 4.3 are in §4.2. Corrected the monotonicity name and gave a valid separating radius in the model-dependence test. |
| `WM.3/oc-quasi-constructibility` | corrected | Verified Ito’s degreewise local-constancy statement. Removed the unsupported common radius and nonproper fibre-cohomology argument; recorded derived boundedness as a gap. |
| `WM.3/lutkebohmert-riemann-existence` | verified | Verified the Kummer-trivialisation form recalled by Ito §1.2. The original 1993 theorem remains explicitly unread, rather than silently treated as checked. |
| `WM.3/huber-neighbourhood-theorem` | corrected | Verified the constant-coefficient end theorem in Ito Theorem 4.5(2). Narrowed coefficients to the case needed; isolated the unestablished descent, boundedness, calculation and continuity inputs. |
| `WM.3/galois-stable-neighbourhood` | corrected | One radius for ℤ/ℓ extends to all ℓ-power coefficients by the long exact sequences. Multiplicativity is now stated for the graded cohomology ring. |
| `WM.3/cup-products-under-pullback` | corrected | The Yoneda-product identity is the pinned Ext.mapExactFunctor_comp. Added the H0 module/abelian comparison; Sheaf.H alone is the ℤ-coefficient version. |
| `WM.4/tilted-approximation` | corrected | Alteration after finite extension gives geometric connectedness and the needed dimension. Replaced the arithmetic-genus non-example by an elliptic double cover; supplied the numerical degree API inputs. |
| `WM.4/comparison-map` | verified | Each arrow has the correct direction and coefficient compatibility. Galois equivariance uses precisely the two outstanding naturality requests, which the reader now labels as requests. |
| `WM.4/top-degree-isomorphism` | corrected | Added the d = 0 unit argument and the exact proper-push, nef, big and numerical positivity suppliers. Rational coefficients and geometric connectedness are essential. |
| `WM.4/duality-splitting` | verified | The perfect-pairing identity forces injectivity; the annihilator has the complementary dimension and is stable under the pairing’s one-dimensional character. |
| `WM.4/direct-summand-of-tilted-cohomology` | verified | Rational Poincaré duality and the top-degree isomorphism give a Galois-stable complementary subspace; no cohomology isomorphism in other degrees is claimed. |
| `WM.4/weight-monodromy-toric-complete-intersections` | verified | Checked the entire Scholze Theorem 9.6 route: neighbourhood, approximation, comparison, splitting, equal-characteristic weights and datum transfer. |
| `WM.4/projective-complete-intersections` | verified | Projective spaces and their products have the imported complete regular projective fans; the closed smooth geometrically connected intersections satisfy Theorem 9.6. |

## Suggested Lean and checks

The suggested file has 379 lines, light definitions on available carriers, representative end signatures and four examples. It defines no sorry-backed data and constructs no unavailable cohomological geometry. Compactness, Hausdorffness and total disconnectedness now accompany the local datum and all transported groups; the restriction signature requires a compact subgroup. The README’s additional quotient identification remains an explicit prototype limitation, with the restriction theorem taking its actual Frobenius/subgroup hypotheses directly. The discrete-group counterexample explains why dropping compactness made the old monodromy-uniqueness signature false.

`lean-check` elaborated the revised file in the shared pinned Mathlib environment with exit code 0 and 24 warnings, all “declaration uses sorry”. It proves no sorry-backed theorem. The Yoneda-product adapter is a closed application of `Ext.mapExactFunctor_comp`. Memory was checked before compilation; no Lean language server or build/update/cache command was used.

`python3 scripts/check_blueprint.py research/blueprint/packets/DeligneWeightsAndPurityPartII.json` reports 0 errors and 0 warnings. `scripts/check_sorry_data.py` passes; reader correspondence checks cover all 30 target statements, hypotheses, proof steps, APIs and tests. Deliverable-path/JSON/private-path checks and `git diff --check` pass. Only this review’s six authorised deliverables/handoff are changed; the current queue explicitly includes the reader document despite the older issue’s shorter list.

## Maintainer decisions

The two existing rescope proposals remain decisions for the maintainer: whether WM.3’s general neighbourhood theory belongs in a ClassicalAdicEtaleCohomology continuation, and whether this second continuation beside WeightsInEtaleCohomology should retain “Part II” in its title. Neither is needed to understand or accept the corrected mathematics. Formalisation should resume at the two recorded gaps and the four outstanding supplier interfaces; this review job is finished.
