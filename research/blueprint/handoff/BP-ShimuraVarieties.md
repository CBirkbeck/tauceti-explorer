# BP-ShimuraVarieties — complete target-level plan

Issue [#9432](https://github.com/CBirkbeck/tauceti-explorer/issues/9432). Agent: Codex (GPT-6), session `codex-eoD9Yw`. Branch: `codex-eoD9Yw-shimura-varieties`. The bot confirmed the claim in comment 6150279659 before work began. This run handles this one job and claims no second issue.

This submission finishes the full-roadmap planning pass, not its implementation or independent review. It is not a checkpoint. The packet is `complete`: all ten stages are planned, none is closed. Every declaration has `implementationStatus: unchecked`. Precise supplier and source-proof refinements remain explicit under the target-level stopping rule.

## Deliverables and inventory

Only the four authorized deliverables change:

- [Full packet](../packets/ShimuraVarieties.json), `part: null`: 100 nodes — 77 theorems, 7 definitions, 6 constructions, 8 comparisons and 2 applications. It includes 80 API items, 48 discriminating unit tests, 51 planets, 15 pinned declaration citations, 20 gaps, 39 requests and five ownership/ordering proposals.
- [Reader](../readmes/ShimuraVarieties.md): all targets, hypotheses, proof routes, source locators, API statements, tests, acceptance checks and remaining interfaces. The conditional V8 foundations are placed after V4 before the existence arguments use them.
- [Suggested Lean](../suggested/ShimuraVarieties.lean): 584 lines, complying with the binding 2026-10-12 shape. It uses light real-bodied definitions over existing carriers, two readily statable end signatures and six examples. The omission manifest names every target, API and mathematical test specified in the reader.
- This handoff records the changes, validation, provenance, limits and exact ownership actions.

| Stage | Targets | Planets | Coverage |
| --- | --- | --- | --- |
| ShimuraVarieties:V0 | 6 | 5 | planned |
| ShimuraVarieties:V1 | 7 | 6 | planned |
| ShimuraVarieties:V2 | 12 | 6 | planned |
| ShimuraVarieties:V3 | 7 | 5 | planned |
| ShimuraVarieties:V4 | 9 | 6 | planned |
| ShimuraVarieties:V5 | 12 | 6 | planned |
| ShimuraVarieties:V6 | 7 | 5 | planned |
| ShimuraVarieties:V7 | 14 | 5 | planned |
| ShimuraVarieties:V8 | 24 | 6 | planned |
| ShimuraVarieties:V8.general | 2 | 1 | planned |

## Accepted inputs and node identifiers

The accepted V0-part packet contributes 69 targets; the accepted V8-part contributes 26. The exact input packet paths, independent review identifiers and original node inventories are recorded in `inputProvenance`. The newest inherited V0 review is `independent-review-REV-FIX-RT-AREA-algebraicgeometry~2`; V8 is `independent-review-REV-ShimuraVarieties--V8~2`. Their acceptance is provenance for the inputs, not an acceptance or review of this combined revision. No live review object has been manufactured.

The validator loads the immutable split packets and rejects a full packet that repeats their node ids. This issue permits no part-packet or checker edits. Accordingly, the full packet uses `/plan/` identifiers for the 95 inherited targets, preserving the proposed Lean declaration names and carrying `originNodeId`/`originPacket` on each. The 95-entry `nodeIdMigration` explicitly maps every original part id to its full-packet target. Internal prerequisites, requests, gap incidence and coverage now use those full-packet ids. Promotion and packaging must transport external node references through this mapping; do not silently abandon the old references. The packet passes the unmodified checker. The split packets, reserved ids, atlas and queue have no edits.

The 25 inherited source findings keep their exact independently attributed verdicts: 24 confirmed and one rejected. They are numbered globally as `ShimuraVarieties/E1` through `E25`, with their original part-qualified identities retained in `originFindingId`. Source editions and historical reading dates are retained as provenance; they are not claims that this worker reread every source page.

## Added and reconciled mathematics

Five missing interfaces now have target nodes:

1. `ShimuraVarieties:V1/level-index`: the actual compact-open poset category, with arrows K → L for K ⊂ L, intersection refinements, cofilteredness, conjugation and its composition order. Six API items and four tests fix its direction and scope.
2. `ShimuraVarieties:V4/plan/reflex-norm-functoriality`: for f:T₀ → T and μ=fμ₀, E⊂E₀ and f r₀ = r Nm(E₀/E), on full ideles, with geometric Artin norm/restriction compatibility. This promotes the formerly API-only result needed by special-pair and component maps.
3. `ShimuraVarieties:V2/minimal-datum-extension`: complex BB functoriality for datum/translation maps, with finite level extensions and no unsupported finiteness assertion for general maps. Precise Pink locators are 3.4 pp.42–43, 6.2 pp.94–95 and 9.25 p.159; arithmetic 12.3(b) is the consequence, not an existence input.
4. `ShimuraVarieties:V2/codim-one-analytic-extension`: PGL₂,ℚ boundary classification, the broader quotient datum, lifted product partial extension and effective finite-quotient case, from Pink 2.9 pp.32–33, 8.2 pp.132–133 and 12.10 pp.200–201.
5. `ShimuraVarieties:V2/log-canonical-sections`: the smooth partial open, smooth boundary divisor, logarithmic canonical line, finite-dimensional sections and sufficiently divisible projective embedding used by Pink 12.12. Its separating system is BB 10.11, distinct from unrestricted full-ring finite generation under 10.14. Minimal descent uses the projective space of the dual section space.

The existing accepted V2 boundary predicate is carried forward in full: continuous, stratum-holomorphic limits in adapted rational unbounded realizations, the canonical Jacobian transition and the ambient-induced boundary factor. Genus-two restriction keeps weight 3n, not intrinsic genus-one canonical weight 2n. E₄ and the cusp pole of j distinguish admissible from cusp forms and from mere interior holomorphy. These are planned definitions; damaged OCR convergence estimates remain a proof refinement.

The new independent source for the BKT route is Klingler–Ullmo–Yafaev, *The hyperbolic Ax-Lindemann-Weierstrass conjecture*, Theorem 1.9 pp.336–337 and Theorem 4.1/Lemma 4.2 pp.343–346. Its proof uses semialgebraic (x,y,t) cusp coordinates, restricted analytic bounded real oscillation, R_exp for the imaginary exponential and relatively compact exponential images in complex toroidal charts. This certifies the intended comparison route without invoking Borel algebraicity. The exact general o-minimal/chart, polarized-period-map and definable-Chow supplier interfaces remain recorded, including the BKT erratum's fixed-maximal-compact and Cartan conditions.

AGHMP §3.1 is covered in V4 by the generic finite étale model and the scheme/stack comparison. Integral maximal-level models and CM Hodge lattices remain at their separate owners. Non-neat isotropy is retained; the coarse finite étale model does not substitute for the quotient stack.

The principal arithmetic and exceptional safeguards from the accepted inputs remain: effective central kernels; neat targets for finite étaleness; inverse arithmetic Artin convention; product CM algebras and semistable square-zero inertia; scalar-extended Hom injectivity; connected adjoint S-maps; the full connected adelic/Galois extension; the corrected H¹(k,Z(G)) centre statement; and the unresolved marked-torus central adjustment. There is no general Langlands-conjugation axiom.

## Current upstream imports and ownership moves

Current TauCetiRoadmap main was read at `0d144d044dacebca17b654695b6f1ad58f159b27`, together with the current Tau Ceti source tree. No builds or writes occurred there. The newer DifferentialGeometry, AlgebraicVectorBundles and RealAlgebraicGeometry contracts were checked for the missing analytic/o-minimal inputs: smooth manifolds and algebraic bundles do not supply analytic spaces with nilpotents; the real-algebraic roadmap expressly excludes general o-minimal structures.

- **AdelicAlgebraicGroups**: import §3.4 pairwise compact-open level commensurability, §§4.1–4.5 approximation, integral almost-all-prime lifts and finite-adelic abelianization, and §5.2 integral determinant representatives. Retain only the faithful-integral/effective-image, positive rational component-image, local-openness and effective-covering refinements. The obsolete principal-representative gap is removed. Its K₁ fixes the second column; our row-basis dictionary fixes the first generator. Transport by basis swap rather than equating those conventions. `upstreamInterfaces` records the actual current contract next to the atlas dependency key; these are not fake pinned-library declarations.
- **ReductiveGroups Part II**: import its already planned RG2.0a Weil restriction, norm tori and Deligne torus. The global centre-cohomology, density/norm and exceptional marked-comparison extensions remain explicit; its existing local/integral scope does not imply them.
- **ModularCurves**: import full ordered bases for N≥3, fine Γ₁ for N≥4, all-level coarse Γ₀ and finite continuous Galois-set descent. Its Layer 10 prime diamond quotient does not supply full/composite compactification; R13.4a/b remains the independent modular compactification supplier.
- **Move down from ShimuraCompactifications C1**: the tier-13 V2 codimension-one complex auxiliary interface is now owned here, and ShimuraCompactifications C1 must import it. Remove the former higher-tier C1 prerequisite. The complex cusp-chart input for KUY is requested below V3 at ComplexComparisonPartII C4; arithmetic toroidal construction stays at ShimuraCompactifications. No atlas or supplier file was changed in this issue.
- **V4 logical foundation lane**: the conditional V8 disjoint-field, translation-descent and model-uniqueness targets precede V6 existence. Preserve their parent-stage ownership, use exact-node edges and place them adjacent to V4 at packaging. The abelian-type application has no V7 prerequisite.
- **Pink broader auxiliary data**: V8 arithmetic codimension-one/minimal statements explicitly require canonical models of both D/SL₂ and G ×(PGL₂) GL₂, including domains noninjective over Hom(S,G_R). The two-point torus example is constructed, but preservation of the full existence class remains a refinement in both lanes. Strict general pure-datum existence alone does not discharge it.

## The two assigned analytic-foundation findings

**RT-AREA-algebraicgeometry/3** is handled by an explicit unapplied proposal for `ComplexComparisonPartII:CA.0`, before C0. It owns analytic spaces locally (V(I),O_U/I), allowing nilpotents, morphisms, open/closed subspaces, gluing, fibre products and SGA 1 XII 1.1 analytification with product/immersion, étale and smooth comparisons. Encode CA.0 → C0,V1,V2,ShimuraCompactifications:C2,PELModuli:M3,ModularCurvesPartII:R12.3, and put those consumers on the PR196 external record. The requested C0 repair node is not a built carrier. Supplier/atlas edits are outside this four-file scope.

**RT-AREA-algebraicgeometry/28** uses the same planned owner for compatible holomorphic atlas transport on TopCat.GlueData, finite-gluing topology/proper maps and holomorphic bundles. Alternatively track PR279 Milestones 5–7 as actual open-PR stage suppliers. Encode M5/M6 or CA.0 → AnalyticToricGeometry Layer 3, M7 or CA.0 → C0 and the direct V1 edge; update the PR279 consumer list and `declared_by_areas` to include AnalyticToricGeometry. Retired LI.2/LI.4 supply none of this. This remains unapplied because the issue authorizes no external-record or supplier edits.

## Remaining proof interfaces

The packet and reader give each gap's exact statement and consuming target ids. The remaining inventory is:

1. **Analytic carrier with nilpotents: RT-AREA-algebraicgeometry/3**. Add first layer CA.0 to ComplexComparisonPartII before C0: complex analytic spaces as locally C-ringed spaces locally (V(I),O_U/I), U open in Cⁿ and I locally finitely generated holomorphic ideal, including nilpotents; morphisms, open/closed subspaces, open gluing and fibre products; analytification representing Hom from analytic locally C-ringed spaces to finite-type C-schemes (SGA 1 XII 1.1), compatible with products/immersions and étale/smooth comparison.

2. **Holomorphic manifold gluing: RT-AREA-algebraicgeometry/28**. The same new CA.0 must own compatible complex-atlas transport on TopCat.GlueData with holomorphic transitions, open holomorphic inclusions, finite-gluing topology/proper maps and holomorphic vector bundles (PR279 Milestones 5–7).

3. **Arithmetic and effective-level supplier extensions**. AA §3.4 and Reduction.levelArithmetic_commensurable_pair already plan commensurability for arbitrary compact-open levels and representatives.

4. **Baily–Borel proof and carrier interfaces**. The primary §§3.5–3.7, 4.8–4.11 and 8.2–8.9 now specify rational normalizers, Satake neighborhoods and the all-type analytic boundary predicate.

5. **Borel multivariable extension proof source**. SVI 3.15 cites Borel/Kwack rather than proving the metric big-Picard argument.

6. **Independent definable comparison and graph suppliers**. The independent comparison source is now KUY Theorems 1.9/4.1 and Lemma 4.2 (pp.336–337,343–346), with the exact exp/compact-chart proof recorded in V3.

7. **Full CM spreading and specialization inputs**. Certify the finite moduli/rigidity proof that every full product-CM complex abelian variety with finitely specified tensors/level descends to a number field.

8. **Connected canonical symmetry and coherence**. Read and specify Deligne 1979 §§2.7.10–2.7.13 completely: the adelic/Galois extension acting on the connected Qbar model, its group law, congruence completions, special reciprocity and reconstruction of finite components.

9. **Serre/Taniyama extension common owner**. MS1982c pp.229–230 and 242–243 and MS1982d p.281 were inspected, including the actual contracted product.

10. **Kazhdan exceptional uniformization proof**. Milne 1983 Theorem 3.2 is a key theorem with proof references, not a full proof.

11. **S-arithmetic and central-cohomology supplier extension**. ALS.0 does not yet expose Milne §§3.5–3.7: recovery of a Q-group from irreducible S-arithmetic lattices at total rank≥2, local finite-prime identifications and superrigidity.

12. **A₁ comparison and completion density**. Canonical-model existence for A₁ is not itself its marked conjugation comparison.

13. **General quasi-projective finite quotient API**. ModularCurves Layer 0D already plans finite-continuous-Galois-set descent.

14. **Suggested signatures requiring absent mathematical carriers**. At the pins no concrete pure Shimura datum, nilpotent analytic-space category, automorphic boundary ring, connected canonical Galois extension or actual canonical reciprocity predicate is available.

15. **Positive rational abelianization and local openness**. Current AA §4.5 already plans abelianization-integral-lifts (Lang plus smooth Hensel outside finitely many primes), finite-adelic abelianization and class-set abelianization, with §4.1 Kneser/Hasse inputs.

16. **CM norm-kernel inputs**. Milne 2007c Lemma 3.6 uses Chevalley’s theorem that the finite-idelic topology on a finite-index torsion-free subgroup of O_E× is its full profinite topology.

17. **Connected adjoint datum convention and carrier**. The connected carrier is a G^ad(R)^+-class of S→G^ad_R even for simply connected G.

18. **Exceptional central adjustment and rank-one perfection**. Milne 1983 §3.10, p.252, attributes absence of noncentral normal subgroups to Platonov–Rapinchuk 1979 and applies it to a reductive Hα containing the full maximal torus.

19. **Arithmetic reductive supplier ownership**. The read upstream ReductiveGroups Layer 7 gives structural root/tori/parabolic theory, not rational real density, arithmetic images under algebraic maps, all-place torus norm obstructions or restriction-of-scalars classification with Hermitian real hypotheses.

20. **Abelian auxiliary class for Pink 12.10**. In the abelian-type lane, Pink 12.10 needs canonical models of (G,X)/SL2,Q and of (G̃,X̃) for G̃ = G ×_{PGL2} GL2, including data in Pink's sense whose X maps non-injectively to Hom(S,G_R) (for GL2 itself, the two-point datum (G_m,{±1}) of zero-dimensional-shimura-variety).

The 39 precise request entries are in the packet's `requests` and the reader's supplier-contract section. Their supplier groups are:

| Supplier owner | Requests |
| --- | --- |
| AbelianSchemesAndArithmeticModuli | 5 |
| AdelicAlgebraicGroups | 2 |
| AlgebraicModuliForArithmeticGeometry | 4 |
| ArithmeticLocallySymmetricSpaces | 1 |
| ComplexComparisonPartII | 3 |
| InverseGaloisAndArithmeticFundamentalGroups | 1 |
| ModularCurvesPartII | 8 |
| PELModuli | 4 |
| ReductiveGroupsPartII | 1 |
| SchemeAndStackFoundations | 1 |
| tauceti | 9 |

The requests preserve the actual schemes, base fields, groups, positivity, neatness and special-pair hypotheses; they do not stand for universal results about arbitrary schemes. CM norm-kernel inputs are proposed as ClassFieldTheory Part II CFT.N, and Serre/Taniyama as CM Part II CM.S, with no CM.2/CM.4 → V5 cycle. General finite quotients import SF.1/finite-group-quotient and request only the invariant ample-power/quasi-projectivity extension.

## Validation and Lean limits

- `python3 scripts/check_blueprint.py research/blueprint/packets/ShimuraVarieties.json`: **zero errors and zero warnings**, using the pinned declaration index and unmodified checker. Every source has valid locator/match data; all 13 definitions/constructions have APIs and at least three tests. All stage planet budgets pass.
- `lean-check research/blueprint/suggested/ShimuraVarieties.lean`: **successful elaboration**, exit 0, exactly eight warnings that theorem/example declarations use proof placeholders. Available memory exceeded 20 GB before compilation. No language server, library build, cache fetch or background compile was started.
- `python3 scripts/check_sorry_data.py research/blueprint/suggested/ShimuraVarieties.lean`: passes. Action laws and homomorphism laws in data definitions have real proof bodies. There are no construction chains or unproved data.
- Local declaration DAG: zero cycles; no internal broad stage prerequisites remain. A traversal from the abelian-type application reaches no V7 target. This is a scoped local graph check, not certification of every unrelated atlas graph.
- Reader agreement: all 100 exact statements, hypotheses, proof steps and acceptance items, all 80 API statements and all 48 tests match the packet. Every target/API/test name appears in the Lean omission manifest. All 95 migration targets and all explicit reader anchor links resolve. Proposed target names are unique.
- Own-words/no-excerpt check, authorized-path screen and `git diff --check`: pass. No PDFs, source extracts, private paths or scratch dependencies are in the deliverables.

Elaboration checks only the genuine native orbit carrier and inversion of a supplied abelian-target reciprocity map. It does not certify analytic topology, literal number-field reciprocity, canonical predicates, CM/general existence or minimal compactifications. Their full targets are in the reader because their mathematical carriers are absent at the pins. The previous schematic scheme-only signatures and unproved data/construction chains are removed in accordance with the binding 2026-10-12 shape. This is a signature limitation, not a claim of advanced Lean coverage.

## Reading record and source limits

Fresh targeted reading on 2026-10-13 covered Milne SVI's arithmetic, analytic, CM and canonical-model route; Pink 2.9,3.4,6.2,8.2,9.25,12.3,12.10,12.12; KUY 1.9/4.1/4.2 and their independent proof; BKT §4.6 and its erratum; AGHMP §3.1 and the integral-scope boundary; the CM and continuous-descent proof contracts; and annotated Milne 1983 page images pp.250,252,259,261–262. Inherited broader source-reading claims remain attributed to the accepted inputs.

The Baily–Borel primary OCR was read only where legible. Signs and estimates lost by extraction are not certified. A legible primary proof of the convergence/local analytic estimates, the original multivariable Borel metric proof, complete Deligne connected Galois coherence, exceptional Kazhdan uniformization and the central adjustment still require the recorded refinements. A survey citation does not resolve these. No inaccessible or uncleared book copy was used.

Source URLs, versions, relevant hashes, exact locators and missing inputs are retained in the packet/reader. Scratch PDFs, extracted texts, scripts and compile logs are removed after the PR opens; no next worker needs that scratch directory. The committed Lean receipt can be identified by its SHA-256:

`45daf7476bf3c699176d9d64f11083f82005aa0966a96a36154166fcf59ab9fb`.

## Next action

Independent review should assess the five added interfaces, current-upstream imports and node migration, source-locator corrections and full reader/compact Lean agreement. The planning pass is complete. Proof refinement must preserve the explicit analytic, CM, connected-symmetry and exceptional hypotheses; the package must apply the lower-tier ownership moves, transport external node links, and supply broader auxiliary canonical models before claiming the corresponding arithmetic minimal theorem. No stage is mathematically closed or implemented by this submission.
