# Independent review: HodgeStructuresPartII H.8

**Verdict: accepted.** The packet is a completed target-level plan of the real Noether–Lefschetz interfaces, with five recorded gaps and every declaration unchecked. It claims no formalisation. Reviewer: Claude, session `claude-0sqSw0`; job `REV-HodgeStructuresPartII--H.8`, issue [#7065](https://github.com/CBirkbeck/tauceti-explorer/issues/7065); 8 October 2026. The plan under review is another worker's job, `BP-HodgeStructuresPartII--H.8` (issue #6947, pull request #7357, Codex session `codex-0rtX9j`).

The [packet](../packets/HodgeStructuresPartII--H.8.json), the [reader](../readmes/HodgeStructuresPartII--H.8.md) and the [suggested file](../suggested/HodgeStructuresPartII--H.8.lean) now agree on 31 nodes (6 definitions, 21 theorems, 1 lemma, 3 applications), 32 API items, 26 unit tests, 6 planets, 25 baseline declarations, 11 requests, 5 gaps and 3 source issues. Of the 31 nodes, 11 were verified as written and 20 were corrected in place; none was added and no node id changed. No other packet cites an H.8 node id.

## What was wrong, and what was changed

1. **The vanishing application asked for too much.** `vanishing-real-green` required the class λ to lie in the vanishing summand. In Benoist's proof (2019, p.94) λ is the class of a curve on the double cover, and its push-forward to the base surface is not zero, so it does not lie there. The source applies the real criterion to the vanishing variation all the same; what makes this legitimate is that the vanishing component of λ is again real, of type (1,1) and twisted-invariant, and has the same derivative. The node now takes an ambient class and says so; `constant-symbol-zero` records the equality of the two symbols. The omission in the source is recorded as a new source issue, E-H8-3.
2. **The real Green theorem was stated more weakly than the source.** Benoist's Proposition 1.1 (2018) holds for every G-stable connected trivializing neighbourhood whose real locus is connected and contractible, not only for small ones, and its conclusion keeps the transported class in the twisted-invariant (1,1) part at the nearby real point. `real-green-open-cone` now states both, with hypotheses and proof steps rewritten to follow §1.2 of the source.
3. **A closure gap in the Voisin cone.** `voisin-infinitesimal-kernel` gives surjectivity of a coherent contraction; `green-evaluation-submersion` needs surjectivity of the period symbol. The step between them is the Griffiths formula, which `voisin-kernel-cone` did not list. It could not have: `griffiths-derivative` depended on the *real* variation. The formula is a complex statement, so its prerequisites are now the complex geometric variation (`H.2/geometric-pure`, `H.2/gauss-manin`), and the Voisin cone depends on it, with a proof step saying how.
4. **A request aimed at the wrong owner.** The request to `ComplexComparisonPartII:C1` asked it for the identification of H¹(Ω¹) with H^(1,1) and of H²(O) with H^(0,2). C1 plans coherent cohomology of analytic sheaves. The accepted H.2 packet says that this identification rests on the cohomological Hodge-decomposition engine, records it as its own gap (titled G9 there), and says that no atlas stage states it. The request now asks C1 only for what it plans; the identification is imported through `H.2/geometric-pure`, and G1 names the engine and the agreement of first Chern classes in Betti and Hodge cohomology. The push-forward identification of Voisin's Proposition 9 moved to G4, where the other unlocated Voisin inputs are.
5. **A prerequisite that was the converse of what is used.** `normal-boundary-factorization` cited `MotivesAndAlgebraicCycles:MC.7/tate-and-hodge-known-cases`, which is the Lefschetz (1,1) theorem. The factorization uses the class of a curve in Hodge cohomology, not the algebraicity of a (1,1)-class. The prerequisite is removed. The statement now names the connecting map ρ of the tangent–normal sequence: the source's map is ρ followed by contraction on normal sections, and the family form (through the characteristic map) is stated separately.
6. **A baseline theorem that is only the polarized case.** `orthogonal-constant-splitting` leaned on the Tau Ceti complement theorem, which needs a polarization; the cup product on H² of a surface is not one. The fibre step now rests on Mathlib's `LinearMap.BilinForm.isCompl_orthogonal_of_restrict_nondegenerate`, which needs only nondegeneracy on the summand. The pairing is now stated symmetric.
7. **A linear-algebra lemma placed above a global gap.** `vanishing-rank-criterion` listed `constant-symbol-zero` as a prerequisite, though it is pure dimension counting. It now cites the Mathlib lemma it uses and is provable at once.
8. **Locators.** The published Benoist 2018 paper is numbered §1.1 (the real action), §1.2 (Proposition 1.1), §1.3 (Proposition 1.2), §1.4 (Proposition 1.3); the packet placed Proposition 1.1 in §1.1 and Propositions 1.2–1.3 in §1.2. The Benoist 2018 locators of fourteen nodes were corrected. In Benoist 2019, Proposition 3.2 is in §3.3 and is proved on p.78, and the contraction is equation (5.2) on p.86 ((5.1) is unrelated). In the Voisin preprint, Lemma 2 and the real-class argument are on pp.4–5 and Proposition 8 on p.20.
9. **The real Lefschetz (1,1) request.** The planner had the statement only through Benoist's use of it. It is Benoist–Wittenberg, Proposition 2.8 (after Krasnov), read here in the arXiv version: on a smooth proper variety over ℝ, an equivariant class in H²_G(X(ℂ),ℤ(1)) whose ordinary image is of type (1,1) is the class of a line bundle, and in degree two the topological condition of their Definition 2.2 is empty. The paper catalogue already routes it to MC.7 (`PAPER-BENOIST-WITTENBERG-20/divisor-real-lefschetz`, `PAPER-BENOIST-19/90`); no MC.7 node states it yet. The request and G5 now say exactly this.
10. **Morse theory is partly in the library and has an upstream owner.** The plan treated all Morse theory as missing. Tau Ceti at the pin has `TauCeti/Analysis/Calculus/Morse`: nondegenerate critical points, the Morse index with its invariance under coordinate changes, and the theorem that almost every inner-product perturbation of a C² function is Morse. `affine-cw-bound` now cites four of these declarations and its proof steps use them (the squared distance from almost every point is handled chart by chart by the genericity theorem; the index is read in a chart). They were built for the Morse homology lane of the upstream Heegaard Floer roadmap, which is now a prerequisite for their manifold-level form, with a request. What neither the library nor any roadmap states is the handle-to-CW theorem for a proper Morse function (Milnor, Theorem 3.5) and the fixed-set theorem for a finite group of diffeomorphisms; the request to Geometric topology, G3 and the upstream note now state both precisely, with the proof route for the second.
11. **API and tests.** Added the two pure-tensor lemmas and the field `geometric_piece` to the API of `RealActionOnChart` (the first two were already in the suggested file), and `PositiveOpenCone.ofConvexCone`, the relation to the nearest Mathlib notion. Added two tests that a plausible wrong definition fails: `real_action_identity_real_point` (if σ_ℂ were required to *preserve* types, the identity would be a real structure on every variation; in fact it is one only in type (1,1)) and `cone_punctured_line` (a positive open cone that is not closed under addition, which a definition through `ConvexCone` would reject).
12. **Planets.** `transported-hodge-locus` is now a planet, "Noether–Lefschetz locus of a flat class": it is the layer's title object and both Benoist papers name it. It replaces "Normal-boundary factorization", a coinage that names an unnamed proposition. Three names were redrawn from the sources: "Real structure on a variation of Hodge structure", "Green's infinitesimal criterion over ℝ" (the title of §1 of Benoist 2018) and "Voisin's open cone in the push-forward kernel". There are six planets.
13. **Smaller corrections.** The surface in `voisin-product-surface` is connected, as in the source. The sign of the flat-class obstruction is this packet's graph computation, not a statement of Griffiths; the source match now says so. The upstream note uses the `roadmaps` field of PROTOCOL section 10. Effectivity is pinned to the native predicate `HodgeStructureOn.IsEffective`. Benoist 2019 normalises ℤ(1) as iℤ rather than 2πiℤ; the sign action is the same, and the packet says so.

## Sources

All five PDFs were downloaded again to scratch and their SHA-256 values equal those in the packet. A sixth source was added. Nothing from a source is copied into the repository.

| Source | What this review read |
| --- | --- |
| Benoist 2018, [author copy of the published text](https://www.math.ens.psl.eu/~benoist/articles/NLsquares.pdf) | §1.1–§1.4, pp.1050–1053, and §2.1, pp.1053–1054, in full: the real action, Propositions 1.1–1.3 with proofs, Remarks 1.4–1.7, Proposition 2.1 with its extension-class proof, Corollary 2.2. |
| Benoist 2019, [published PDF](https://www.numdam.org/item/10.1007/s10240-019-00108-7.pdf) | §1, pp.69–71; §2.1, p.72 (the Tate convention); §3.3, p.78 (Proposition 3.2); §5.1–5.2, pp.85–89 (Lemma 5.3, Proposition 5.4); §6.2, pp.93–95 (Proposition 6.6). |
| Voisin, [author preprint](https://webusers.imj-prg.fr/~claire.voisin/Articlesweb/inthodge.pdf) | §1, pp.3–6; the start of §2, pp.6–8; Proposition 4 and Corollaries 4–5, pp.12–14; the end of §2 and §3, pp.18–21. The estimates of §2 (Propositions 3, 5, 6, 7 and the appendix) were not rechecked line by line; they are gap G4. The published chapter could not be obtained. |
| Griffiths 1968, [scan](https://publications.ias.edu/sites/default/files/periodsofintegralII68.pdf) | II.1(a), pp.809–815: the Kodaira–Spencer class, Proposition (1.11), equations (1.15)–(1.19), Proposition (1.20), Theorem (1.23). |
| Milnor, Morse Theory, [scan](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/milnmors.pdf) | §7, pp.39–41, on the page images: Theorems 7.1 and 7.2 with the proof, Corollary 7.3 with its proof, the statement of Theorem 7.4; and Theorem 3.5, §3, p.20. |
| Benoist–Wittenberg, [arXiv:1801.00872](https://arxiv.org/abs/1801.00872) (latest version; Inventiones 222 (2020), 1–77), SHA-256 `9fb55d1d…f33f65f` | §2.2, Definition 2.2, and §2.3.1, Proposition 2.8, only. Added as source `BW20`. |

Each node's statement was compared with its source at the locator. The statements that are not in a source are marked as such in the packet: the sign of the flat-class obstruction, the openness of the good locus (it follows from the proof of Proposition 1.2), the finite-coefficient form of the density argument, the condition on a smaller parameter family in `normal-vanishing-surjectivity`, and the general form of `orthogonal-constant-splitting`. Each was rederived.

## Source issues

| Id | Verdict | Reason |
| --- | --- | --- |
| E-H8-1, Benoist 2019, equation (5.7), p.88 | confirmed | The third group is printed in degree zero; it is the target of the connecting map of (5.8) and the source of that of (5.9), so it is H¹(C,N_C/T). Already in the register as `PAPER-BENOIST-19/E12`. |
| E-H8-2, Voisin preprint, Corollary 4(ii), p.13 | confirmed | Both alternatives name the first projection; the proof and case (ii) of Corollary 5 show that (ii) is about the second. Scoped to the preprint. |
| E-H8-3, Benoist 2019, Proposition 6.6 proof, p.94 | confirmed (new, found by this review) | The real criterion is applied to the vanishing variation with the class of the curve, which is not a class of that variation. Its vanishing component is, and has the same derivative. A one-line omission; nothing in the result is affected. The arXiv versions and the author's page were not searched for a later correction, and the entry says so. |

The misprint "n = dl" in the proof of Theorem 1.5 (p.71) and the gap at the end of the proof of Proposition 6.6 are already in the register (`PAPER-BENOIST-19/E17`, `E21`) and are not repeated.

## Baseline

Every declaration was opened in the source tree at Mathlib `082e2d3` and Tau Ceti `f790474`.

| Declaration | Statement read, and fit |
| --- | --- |
| `tauceti:TauCeti.Hodge.HodgeStructureOn` | Structure: a decreasing filtration F, some step equal to everything, and F p complementary to the conjugate of F (n+1−p). Already tagged for extensionality. Fits. |
| `tauceti:TauCeti.Hodge.HodgeStructureOn.piece` | F p ⊓ conjF (n−p). Fits; the F¹ characterisation of a real class follows because the conjugation fixes it. |
| `tauceti:TauCeti.Hodge.HodgeStructureOn.conj_piece` | The conjugation maps piece p onto piece n−p. Fits `combined-type`. |
| `tauceti:TauCeti.Hodge.HodgeStructureOn.mem_piece_iff` | Membership in both filtration steps. Fits. |
| `tauceti:TauCeti.Hodge.Conjugation` | A conjugate-linear equivalence that is an involution. Fits. |
| `tauceti:TauCeti.Hodge.complexificationConjugation` | The conjugation of ℂ ⊗ V for a real vector space V (V explicit). Fits. |
| `tauceti:TauCeti.Hodge.complexificationConjugation_toEquiv_tmul` | z ⊗ v goes to conj z ⊗ v. Fits. |
| `tauceti:TauCeti.Hodge.RationalHodgeSubstructure.isCompl_WQ_orthogonal_WQ` | For a polarization P and a rational Hodge substructure W, W and its P-orthogonal are complementary. Only the polarized case: kept as the case the node must agree with, description corrected, and no longer the engine of the node. |
| `mathlib:LinearMap.ker`, `mathlib:LinearMap.mem_ker`, `mathlib:LinearMap.range_eq_top` | As described. Fit. |
| `mathlib:HasStrictFDerivAt.implicitToOpenPartialHomeomorphOfComplemented`, `…mem_implicitToOpenPartialHomeomorphOfComplemented_target` | Need a strict derivative with full range and closed complemented kernel; give a chart to F × ker whose target contains (f a, 0). Fit in finite-dimensional charts. |
| `mathlib:AnalyticOnNhd.eqOn_zero_of_preconnected_of_eventuallyEq_zero` | The several-variable identity principle on a preconnected set. Fits the density argument. |
| `mathlib:ZSpan.floor`, `mathlib:ZSpan.norm_fract_le` | Coordinatewise rounding into the integer span of a finite basis, and the bound of the remainder by the sum of the basis norms. Fit the coset argument. |
| **added** `tauceti:TauCeti.Hodge.HodgeStructureOn.IsEffective` | F 0 = ⊤. Pins "effective". |
| **added** `mathlib:LinearMap.BilinForm.isCompl_orthogonal_of_restrict_nondegenerate` | Reflexive form, nondegenerate restriction, finite dimension: the subspace and its orthogonal are complementary. The fibre engine of the splitting. |
| **added** `mathlib:HasStrictFDerivAt.map_nhds_eq_of_surj` | A surjective strict derivative between complete spaces maps neighbourhoods onto neighbourhoods; no complemented kernel. The open-image step of both Green theorems. |
| **added** `mathlib:Submodule.eq_of_le_of_finrank_le` | Containment and a dimension inequality give equality. The rank criterion. |
| **added** `mathlib:ConvexCone` | Closed under positive scaling and addition. The Mathlib notion the cones of this layer generalise. |
| **added** `tauceti:TauCeti.IsNondegenerateCriticalPoint` | C² at the point, vanishing differential, second derivative invertible into the dual. The nondegeneracy of `affine-cw-bound`, in charts. |
| **added** `tauceti:TauCeti.morseIndex`, `tauceti:TauCeti.morseIndex_comp` | The negative index of inertia of the Hessian form, and its invariance at a critical point under a C² change of coordinates with invertible derivative. |
| **added** `tauceti:TauCeti.ae_hasNondegenerateCriticalPointsOn_sub_inner` | On an open subset of a finite-dimensional inner product space, for a C² function f and almost every v, all critical points of f − ⟪v,·⟫ are nondegenerate. The local step for the squared-distance function. |

No citation was removed. Searches of both trees at the pins (file names, declaration index and text) for Kodaira–Spencer, Noether–Lefschetz, Lefschetz, Andreotti and Morse found no Kodaira–Spencer map, no Noether–Lefschetz locus, no weak Lefschetz theorem and no handle or CW statement for Morse functions; they found the Morse declarations above, and in Tau Ceti's algebraic topology only relative singular homology, with no cellular homology or duality. The reviewed audit (`data/library-coverage.json`) has no row for H.8 or for the four upstream layers cited, and shows the pure Hodge layers built and `ShimuraData:D3` and `ComplexComparisonPartII:C1` not built, as the packet says. Nothing the libraries contain is planned as a node.

## Suppliers

The statements of the cited nodes were read: `ShimuraData:D3/variation`, `H.2/geometric-pure`, `H.2/gauss-manin`, `H.3/period-symbol`, `H.3/derivative-connection`, `ComplexComparisonPartII:C5/repair-proper-de-rham-betti` and `MotivesAndAlgebraicCycles:MC.7/tate-and-hodge-known-cases` (its entry (H1) is the complex integral divisor theorem). They supply what the citing nodes use, after the changes of items 3–5 above. The stage descriptions of SF.2, SF.4, SF.5, R09.1, C1, D3 and MC.7 and the upstream texts of Geometric topology layer 1, Algebraic topology stages 4 and 6 and the Heegaard Floer Morse lane were read against the requests. The requests to SF.2, SF.4, SF.5 and R09.1 ask for coherent duality, deformation and linear-system statements that are in those layers' directions but are finer than their descriptions; they are kept as requests, with G2 and G4 recording that no exact supplier node exists.

## Every node

| Node | Verdict | Note |
| --- | --- | --- |
| `real-action` | corrected | Agrees with Benoist 2018 §1.1 and (1.3). Locator, effectivity, three API items and a fifth test. |
| `combined-type` | verified | From the field and native `conj_piece`. Locator corrected. |
| `twisted-invariants` | corrected | Invariance under the antilinear action is σv = −v. Locator; the two normalisations of ℤ(1). |
| `twist-sign` | verified | Recomputed. Locator corrected. |
| `geometric-real-variation` | corrected | Hypotheses as in §1.4. Locator; a garbled symbol; the Hodge-piece identification attributed to H.2. |
| `transported-hodge-locus` | corrected | Verified against native `piece`. Locator; now a planet. |
| `transported-locus-gluing` | verified | Elementary. Locator corrected. |
| `nl-obstruction-derivative` | corrected | Sign recomputed; the source match corrected. |
| `kodaira-spencer-contraction` | corrected | Agrees with (5.2) and (1.4). Locator. |
| `griffiths-derivative` | corrected | Now a complex statement with complex prerequisites (item 3). |
| `normal-boundary-factorization` | corrected | Statement names ρ; wrong prerequisite removed (item 5). |
| `normal-vanishing-surjectivity` | verified | Corollary 2.2; the condition for a smaller family is right. |
| `positive-open-cone` | corrected | Relation to `ConvexCone` and a separating test. |
| `green-evaluation-submersion` | corrected | Derivative computation checked; Voisin locator; Mathlib open-mapping statement. |
| `fixed-linear-surjectivity` | verified | Averaging. Locator corrected. |
| `real-green-open-cone` | corrected | Every admissible neighbourhood; the class stays twisted-invariant (item 2). |
| `good-real-locus` | verified | The set of Proposition 1.2. Locator corrected. |
| `real-good-locus-density` | corrected | Openness flagged as a consequence of the proof. Locators. |
| `orthogonal-constant-splitting` | corrected | Mathlib engine; symmetric pairing (item 6). |
| `constant-symbol-zero` | corrected | Records θ_λ = θ_(λ_K). |
| `vanishing-rank-criterion` | corrected | Prerequisites (item 7). |
| `vanishing-real-green` | corrected | Ambient class (item 1). |
| `full-lattice-coset-cone` | verified | Proof recomputed with the two Mathlib declarations. |
| `voisin-infinitesimal-kernel` | verified | Proposition 9, p.21, in Benoist's notation. Supporting estimates are G4. |
| `voisin-kernel-cone` | corrected | Depends on the Griffiths formula (item 3). |
| `voisin-product-surface` | corrected | Connected surface; H²·K_X recomputed. |
| `affine-cw-bound` | corrected | Milnor 7.2 and 3.5; Tau Ceti's Morse declarations cited; upstream Morse lane imported. |
| `affine-integral-vanishing` | verified | Locator corrected. |
| `ordinary-integral-lefschetz-h3` | verified | Milnor 7.3 with k = 3 and Poincaré duality. |
| `ordinary-integral-lefschetz-h2` | verified | Same vanishing; surjective only. |
| `transported-divisor-export` | corrected | Real Lefschetz (1,1) cited exactly (item 9). |

## Coverage, granularity, API and tests

The stage is `planned`, correctly: every target of the stage description and each of the ten catalogue items of the Benoist route has a node, and every prerequisite chain ends in the libraries, in a node or requested stage of another roadmap, or in one of G1–G5. It is not closed. At target level no proof was split. The three API items that other nodes use are nodes of their own (`combined-type`, `twist-sign`, `transported-locus-gluing`). Each of the six definitions has uses, an API that covers construction, characterisation, simp forms, functoriality, the relation to the library notion and examples, and at least four tests; each test was checked to be true, and between them they separate each definition from the tempting wrong ones (untwisted invariants, a type-preserving geometric action, convex cones, "some Hodge class exists").

## The suggested file

The file imports two Tau Ceti Hodge modules. The shared build at the pins has no compiled `TauCeti.Geometry`, so `lean-check` stops at the first import, as it did for the planner. Two checks were made instead, both with `lean-check` at the pinned Mathlib:

- the Mathlib-only part of the file (everything from the contraction section on), with the file's own Mathlib imports, elaborates with proof placeholders as its only warnings;
- the whole body, placed after a scratch prelude that restates the signatures of the Tau Ceti declarations it uses exactly as they stand at the pinned commit (`Conjugation`, `complexificationConjugation` and its pure-tensor lemma, `HodgeStructureOn`, `conjF`, `piece`, `mem_piece_iff`, `conj_piece`, `IsEffective`), elaborates with proof placeholders as its only warnings.

The second check found one error in the submitted file: the test `transported_F_one` applied a single Hodge structure as if it were a family. It is repaired. This part had never been elaborated. The file was also changed to add the items of item 11, to drop an unnecessary complemented-kernel hypothesis from the two analytic lemmas (they are Mathlib's open-mapping statement unpacked), to make the cone lemma return a cone containing the base value, and to record the fibre form of the orthogonal splitting against the Mathlib theorem. Every definition, API item and test of the packet appears in the file under the packet's name. The global theorems that cannot be typed before the suppliers exist stay in the ledger at the end of the file; none is replaced by a placeholder proposition. The file as it stands in the repository has not been elaborated as a whole.

## Checks run

- `python3 scripts/check_blueprint.py research/blueprint/packets/HodgeStructuresPartII--H.8.json --index <pinned declaration index>`: 0 errors, 0 warnings.
- Names: every suggested declaration, API item and test of the packet occurs in the suggested file and in the reader; every node and planet occurs in the reader.
- `lean-check`, as described above.

## Questions for the orchestrator

1. **The cohomological Hodge-decomposition engine has no owner.** H.2 records it as a gap and H.8 now depends on it by name (G1): the identification of the graded pieces of the de Rham filtration with H^q(Ω^p), and the agreement of first Chern classes in Betti and Hodge cohomology. Which roadmap plans it?
2. **Geometric topology, Part II.** The packet proposes it for two statements (the fixed set of a finite group of diffeomorphisms; the handle-to-CW theorem for a proper Morse function). The Morse statement could instead extend the upstream Heegaard Floer Morse lane. This is the maintainer's choice; the packet's `restructure` entry uses the action "extend", which PROTOCOL section 9 does not list but the checker accepts.
3. **MC.7 needs a node for the real Lefschetz (1,1) theorem.** Two catalogue items are routed there and H.8 requests it; the MC.7 packet has none.
4. **Voisin's published chapter** (Advanced Studies in Pure Mathematics 45) could not be obtained by the planner or by this review. Source issue E-H8-2 and all Voisin locators are against the author preprint and should be collated when the chapter is available.
5. **The shared Lean build has no compiled `TauCeti.Geometry`.** Suggested files that import the Hodge modules cannot be elaborated with `lean-check`; this review used a signature prelude in scratch, which is weaker than the real import.
