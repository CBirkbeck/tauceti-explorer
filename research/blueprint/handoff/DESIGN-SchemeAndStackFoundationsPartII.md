# DESIGN-SchemeAndStackFoundationsPartII — #3361

Completed by Codex, session `codex-jHDBds`, on 19 October 2026. This is a completed design pass for independent review, not a checkpoint or a claim of mathematical closure. No implementation is asserted.

The five deliverables are the roadmap definition, blueprint packet, reader document, suggested Lean file and this note, all named `SchemeAndStackFoundationsPartII` except this job-specific handoff.

## Scope and counts

The issue permits taking its first coherent direction and proposing separate owners for the independent directions. This pass plans general flat cohomology and Brauer comparison. It preserves the extraction spelling `SchemeAndStackFoundationsFlatCohomologyPartII` as a proposed alias of this roadmap.

There are **61 nodes: 7 definitions, 6 constructions, 46 theorems and 2 applications; 77 API items; 46 unit tests; 40 planets; 8 baseline declarations**. All thirteen definitions/constructions have uses, an API and at least three tests. All implementation statuses remain `unchecked`.

| Layer | Targets | Planets | Coverage |
| --- | ---: | ---: | --- |
| FC.0 Ind-flat maps and smooth resolutions | 4 | 4 | planned |
| FC.1 Twisted sheaves and Brauer comparison | 6 | 5 | planned |
| FC.2 Group-valued animated deformation theory | 4 | 2 | planned |
| FC.3 Animated sites, cohomology and supports | 14 | 6 | planned |
| FC.4 Dieudonné formula over perfect bases | 6 | 3 | planned |
| FC.5 Continuity along a prime | 6 | 3 | planned |
| FC.6 Derived excision | 5 | 4 | planned |
| FC.7 Faithfully flat hyperdescent | 2 | 2 | planned |
| FC.8 Complete animated continuity | 7 | 5 | planned |
| FC.9 Henselian invariance and algebraization | 5 | 4 | planned |
| FC.10 Adic descent with supports | 2 | 2 | planned |

Packet status is `complete`. No stage is closed: the twenty precise supplier requests remain, and FC.9 inherits the Popescu gap described below. Coverage records list the requests affecting each layer, including transitive dependencies.

## Every original route retained

The packet's `routeCoverage` accounts individually for **47 items**: all 45 items of the Česnavičius–Scholze flat-cohomology route and both Česnavičius 2019 items. Of these, 42 are planned here, 3 are assigned to precise supplier requests and 2 import the parent's Brauer definitions. The 61-node count also includes the definitions and key auxiliary theorems these targets require.

`routeDispositions` preserves the item identifiers and original brief pointers for **all eleven routes / 413 items**. The other nine routes / 366 items have the following proposed independent owners; the maintainer must apply the restructuring, without treating those items as planned here:

| Proposed owner | Original routes and item counts |
| --- | --- |
| SchemeAndStackFoundationsPartIIComplexSurfaceContractions | Bakker–Tsimerman 2016: 2 |
| SchemeAndStackFoundationsMixedCharacteristicBirationalGeometry | Guo–Reinecke 2024: 1; Hacon–Witaszek 2023: 103; Bhatt et al. 2023: 195 |
| SchemeAndStackFoundationsMixedCharacteristicPositivity | Hacon–Witaszek 2023: 6; Bhatt et al. 2023: 12 |
| SchemeAndStackFoundationsPartIIArithmeticPresentation | Bhatt et al. 2023: 1; Česnavičius 2021: 1 |
| MacaulayficationOfNoetherianSchemes | Česnavičius 2021: 45 |

Their complete original briefs remain authoritative, particularly their characteristic, dimension and excellence hypotheses. Same-owner routes should be combined before designing those continuations. Preserve the surface order SF.4 → SF.5 → surface contractions. No queue, labels, reserved IDs or other roadmap files were changed.

## Ownership and requests

Ordinary scheme Brauer groups, torsors, gerbes and ordinary cohomology remain in SchemeAndStackFoundations. Animation and cotangent calculus remain in EnhancedDerivedSheaves; Koszul theory and derived completion remain in DerivedDeRhamCohomology. Covariant crystalline Dieudonné classification is imported from PrismaticCohomologyPartII PD.6. Complete étale hyperdescent and perfectoid structural descent are imported from ArcTopologyAndDescent AT.11–AT.12. The perfectoid key formula and purity theorems remain in PurityForFlatCohomology, which consumes the present roadmap: there is no reverse dependency.

The packet and reader state each requested interface in full, with sources and consuming node IDs. These are requests recorded in the design, not new issues or edits to their owners:

- EnhancedDerivedSheaves E5:animation: `animation-composition`.
- EnhancedDerivedSheaves E5:cotangent-export: `general-square-zero`.
- SchemeAndStackFoundations SF.0: `syntomic-presentations`, `gabber-finite-free-etale`, `noetherian-completion-flat`.
- SchemeAndStackFoundations SF.1: `gerbe-module-descent`, `henselian-torsor-gerbe`, `classical-affine-group-adapter`, `flat-group-cotangent-amplitude`.
- SchemeAndStackFoundations SF.2: `finite-group-ext`, `char-p-etale-dimension`, `flat-cohomology-limits`, `ample-global-generation`.
- SchemeAndStackFoundations SF.4: `cauchy-algebraization`, `punctured-h2-injectivity`, `complete-torsor-effectivity`.
- SchemeKTheoryOperations S.2: `projective-rank-lemmas`.
- DerivedDeRhamCohomology DD.1: `adic-flat-module-limits`, `complete-module-hyperdescent`, `koszul-geometric-support`.

The parent's coherent Zariski support definition does not supply animated fppf supports. Its fixed-site filtered-colimit theorem does not supply varying-base continuity. Its proper Serre-vanishing target does not supply global generation on a nonproper scheme with an ample line bundle. These distinctions explain the additional definition and requests.

The **single recorded gap, G1**, is inherited from `SchemeAndStackFoundations:SF.0/popescu-desingularization`: its field-case proof dependency remains open in that supplier. General henselian invariance and its algebraization consequences cannot be closed until that input is completed. The Laurent application inherits the same dependency through topological algebraization.

## Proof and source boundaries

The plan orders classical neighborhood excision before prime continuity, then general excision. The low-degree henselian H² argument uses affine Gabber and smooth torsor lifting independently of general henselian invariance. It then supplies restricted complete continuity, followed by complete descent, general complete continuity and only then general henselian invariance. These orders avoid circular proofs.

The final Witt support argument uses the **geometric dual Koszul localization model**. For a finite tuple, each dual Koszul complex on an ordinary Witt ring lies in a fixed nonnegative cohomological interval. This permits the filtered-colimit/totalization exchange; perfect Koszul base change and complete module descent finish the comparison. No ordinary-power-quotient model or unproved weak-proregularity assumption is substituted. The reader and the `koszul-geometric-support` request give the formula and bounds.

Ten source issues are recorded in authored words. Six concern CS24 notation/labels/degree bounds in §5; three concern Lieblich's auxiliary rank and K-theory proof arguments; one concerns the power-torsion citation in the CS24 support proof, for which the plan supplies the Koszul repair. In particular, quasi-compactness gives finite rank strata, not finitely many connected components; nilpotence alone does not imply the sharp claimed integer annihilator; and dimension arguments need a positive rank margin and a valid finite exponent. No theorem statement is declared false on those grounds. The independent review should check these corrections and the Koszul proof carefully.

Sources actually read, editions and SHA-256 hashes are recorded in the packet:

- CS24, arXiv:1912.10932v3: §§1.4, 2.2, 2.3.3, 4.1, all of §5 and §7.2; printed pp.8–9,18–21,24–25,36–39,46–81,90–91.
- Bégueri 1980, §§2.1–2.2, pp.23–27.
- De Jong, *A result of Gabber*, all nine pages. Its proof takes affine Gabber as input; the affine case here instead uses Lieblich's twisted-sheaf patching argument.
- Lieblich, arXiv:math/0511244v4, §§3.1.1–3.1.2, Lemmas 3.1.3.5–3.1.3.6 and §3.1.4, pp.6–8,10–14.
- Bouthier–Česnavičius, arXiv:1908.07480v4, §§2.1.1–2.1.8,2.1.12–2.1.15,2.3, pp.5–8,11–13,29–31.
- Yekutieli, arXiv:1606.01832v3, Theorems 1.8,4.3,5.9, pp.5–6,14,16–17. Its numbering differs from the published version cited in CS24.
- Stacks 0952, 0954 and §47.10, including the distinction between geometric supports and derived power torsion.
- Česnavičius, *Purity for the Brauer group*, arXiv:1711.06456v4, §1.5 p.3 and Lemma 3.1 p.6: read in place in the maintainer-cleared library. No file or passage was copied.

Illusie VII, SGA4 X, Gabber–Ramero's completeness argument, and the primary classification references were not independently read. Their exact required interfaces are assigned to the existing suppliers above, or imported from the inspected Dieudonné owner. No stronger direct-source verification is claimed.

Current TauCetiRoadmap main `0d144d044dacebca17b654695b6f1ad58f159b27`, current Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` and its Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` were inspected read-only. AlgebraicVectorBundles and JacobianChallenge readers and relevant suggested signatures were checked. The gerbe adapter must reuse AlgebraicVectorBundles L0A–L0C. The ample Brauer arithmetic avoidance input is the existing PotentialModularityAndCompatibleSystems R23.1 incomplete Skolem-data theorem. No target moves upward from a higher supplier were needed.

## Validation and resumption

The standard `python3 scripts/check_blueprint.py research/blueprint/packets/SchemeAndStackFoundationsPartII.json --json` passes with **zero errors and zero warnings against the unmodified shared pinned declaration index**. Additional mechanical checks verified all original route item sets, reader/packet agreement for every target, API, test and proof step, every direct stage dependency, and an acyclic reachable exact-node graph of 1,445 nodes. All changed files are permitted deliverables; whitespace and intake checks were run.

The shared approximate index drops the outer namespace on native `TauCeti.FiniteLocallyFreeCommAffineGroupSchemeCat.cartierDual`. Source inspection and the Lean example confirm that full name. The baseline cites the correctly indexed `TauCeti.FiniteLocallyFreeCommAffineGroupSchemeCat.cartierDualBaseChangeNatIso`, read at the pin in BaseChange.lean lines 177–196: this is the actual native base-change interface consumed by the Bégueri API. The index was not changed, and validation requires no custom index. `baselineIndexCorrections` records this discovery.

`lean-check research/blueprint/suggested/SchemeAndStackFoundationsPartII.lean` **succeeded** at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Memory was checked first. Its only diagnostics were eight declaration warnings for the permitted proof holes. The compact suggested file has one light real-bodied definition, three theorem signatures and five examples over native carriers; it introduces no surrogate animated or gerbe objects and no data definitions with missing bodies.

Resume with independent review of these five deliverables. Review the source corrections, the affine-to-ample Brauer argument, the deformation truncations and the final Koszul comparison in particular. Discharge the twenty supplier contracts and inherited Popescu gap before certifying closure. Apply the alias and five-owner restructuring separately. Nothing depends on retained scratch files.
