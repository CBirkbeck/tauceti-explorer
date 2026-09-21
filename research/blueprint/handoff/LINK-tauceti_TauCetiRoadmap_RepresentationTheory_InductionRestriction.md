# Handoff: induction, restriction and Mackey links

## Identity and status

- Job: `LINK-tauceti_TauCetiRoadmap_RepresentationTheory_InductionRestriction`
- Issue: #60.
- Worker: **ChatGPT Pro — cgp-5348e0ef2b68**.
- Branch: `cgp-5348e0ef2b68/link-induction-restriction`.
- Input revision: `088ac3dcfb573a1e875fcea971ce54526bbe74d3`.
- Status: **partial**. Seven proposed links and three rescoping recommendations are preserved. This is not an exhaustive catalogue audit, an independent review, an implementation, or an integration approval.
- Deliverables: this handoff and `research/blueprint/links/tauceti_TauCetiRoadmap_RepresentationTheory_InductionRestriction.json`.

The claim comment is #5697546687 and the workflow confirmation for this exact session is #5697548964. Ownership was rechecked before submission: the issue remained open with `state:claimed`, and the comments contained this claim and its matching bot confirmation, not a competing claim. No other issue was claimed by this session. In particular, #23 was skipped when another worker claimed it.

## Results and exact interface boundaries

The packet contains **three incoming** and **four outgoing** links. Five have an explicit cross-roadmap reference in the text; two are exact but unnamed supply/use matches. All endpoint stage identifiers come from the browser atlas extracts. Quotes are source text, not invented Lean declaration statements.

| Supplier | Consumer | Exact supplied interface |
| --- | --- | --- |
| CharacterTheory Layer 0 | InductionRestriction Layer 2 | Class functions and the bilinear `characterPairing` compatibility for Frobenius reciprocity. The common complex specialization is safe; further coefficient generality needs its own comparison. |
| CharacterTheory Layer 3 | InductionRestriction Layer 6 | The additive integral virtual-character lattice to be identified with the character-map image of the Grothendieck representation ring. |
| SemisimpleAlgebras Layer 1 | InductionRestriction Layer 5 | The generic counted isotypic-component/simple-constituent dictionary, specialized to a semisimple group-algebra module and transported to representations. |
| InductionRestriction Layer 2 | CharacterTheory Layer 8 | Induced-character and class-function induction formulas. The T.I.-support isometry, exceptional-character argument and Frobenius kernel theorem remain with CharacterTheory. |
| InductionRestriction Layer 2 | CharacterTheory Layer 9 | Complex finite-dimensional induction and its character formula for the finite Borel in `GL_2(F_q)`. Index arithmetic, irreducibility, the non-split torus and cuspidal construction remain with CharacterTheory. |
| InductionRestriction Layer 6 | CharacterTheory Layer 4 | Only the separate cyclotomic splitting-field application, not the early arithmetic of character values or a prerequisite for the Dixon-Schneider algorithm. |
| InductionRestriction Layer 6 | PotentialModularityAndCompatibleSystems R24.5 | Only the finite-group, characteristic-zero virtual Brauer-induction identity. Actual compatible representations and their descent are additional consumer obligations. |

The three overlaps recommend **rescoping, not merging whole roadmaps**: share one additive virtual-character carrier; give the cyclotomic splitting proof to the induction owner while separating it from earlier character arithmetic; and keep one generic counted-isotypic API with a distinct finite-group specialization and Clifford correspondence.

The existing SchurWeyl packet already proposes InductionRestriction Layer 2 to SchurWeyl Layer 1 for the Young-subgroup permutation-module comparison. Its complete links/overlaps sections were read. That edge is recorded as existing, not repeated, and this handoff does not independently approve the sibling packet.

## Target stage inputs and outputs

This table preserves the target-reading checkpoint so another worker can resume without reconstructing the initial analysis. Layer 3 is a parent stage with the separate representation and character forms below it.

| Stage | Inputs | Outputs and qualifications |
| --- | --- | --- |
| 0 | Existing algebraic induction/restriction/coinduction adjunctions, group homomorphisms and tensor structure over a commutative ring. | Transitivity and representative-level maps; induction projection formula and its coinvariants comparison. A continuous or unrestricted coinduction analogue requires its own hypotheses and comparison, not a renamed algebraic formula. |
| 1 | Subgroup conjugation `s H s^-1`, acting on a representation by `x` acting as `s^-1 x s`. | Conjugate representations, functoriality and coherence, character/rank invariance over fields, and the normal-subgroup conjugation action. |
| 2 | Induction, finite subgroup index, finite-dimensional trace machinery; stronger coefficient assumptions for pairings. | Finite-dimensional induction and index-times-dimension; division-free coset character formula; averaged formula only with subgroup order invertible; permutation fixed-coset character and Frobenius reciprocity. |
| 3a | Commutative ring, finite group, Layers 0-1 and a double-coset decomposition. | Representation-level Mackey decomposition, with `K intersect s H s^-1`, both subgroup maps and representative changes explicit. |
| 3b | 3a plus finite-dimensional character machinery over a field. | The character identity on double cosets. Do not use the trace identity instead of the representation isomorphism where modules are needed. |
| 4 | Finite-dimensional Hom spaces and finite biproduct ranks, semisimplicity/Schur, Frobenius and Mackey. | Natural-number intertwining formula, Mackey irreducibility criterion, elementwise and normal-subgroup forms. It uses the prerequisite isotypic API written in Layer 5, not the later Clifford theorem. |
| 5 | Finite group, normal subgroup, semisimplicity, isotypic decomposition, conjugation and the Mackey criterion. | Inertia subgroup; equal-multiplicity orbit decomposition; Clifford correspondence. Classification by ordinary representations of the inertia quotient requires an extension of the constituent; otherwise projective representations occur. |
| 6 | Complex or characteristic-zero semisimple representations, additive virtual characters, induced-character and tensor-projection formulas. | Representation ring, restriction ring maps, induction module maps, Artin and Brauer induction and virtual-character detection. Cyclotomic splitting has separate Schur-index/field-of-definition/descent obligations. |
| 7 | Normalized invertible projective lifts, multiplicative cocycles for the trivial action on field units, ordinary algebraic `H2`; Layer 5 for the inertia obstruction application. | Factor-set classes, twisted group algebras, central extensions, Schur covers and inertia extension obstructions. Factor classes do not classify projective representations. Ordinary finite-group `H2` is not automatically a dependency on the continuous profinite roadmap. |

## Input issues that must not be propagated

**C1: positive-characteristic constituent detection.** The source's nonmodular coefficient regime still permits positive characteristic. For the trivial group over `F_p`, the nonzero representation `F_p^p` is a sum of `p` trivial simples but its trace character is zero. Thus a field-valued pairing can erase a positive Hom dimension. Keep multiplicities in natural numbers and distinguish them from their casts to the coefficient field. Character detection needs characteristic zero or a separately proved stronger hypothesis. This affects the advertised compatibility/decomposition API, not the division-free induced-character formula.

**C2: factor sets versus projective equivalence.** Layer 7 contains an overstrong equivalence sentence followed by the correct warning. Over `C`, the two-dimensional trivial representation of `C2` and `1 direct sum sign` both have factor set `1`, but their projective actions are respectively trivial and nontrivial. Cohomologous factor sets therefore do not imply equivalence of projective representations. Rescaling a chosen lift changes its cocycle by a coboundary; the class is an invariant, not a complete classification of representations.

**C3: internal ordering.** Layer 4 consumes the early decomposition/Hom-multiplicity infrastructure placed in the prerequisite paragraph of Layer 5. The later Clifford correspondence consumes Layer 4. Split these outputs before making declaration-sized blueprint dependencies; importing all of Layer 5 into Layer 4 would introduce a cycle. This link job does not invent replacement stage identifiers or edit either source.

**C4: virtual induction versus realization.** Keep three distinct statements: an integral character identity, a model over a chosen coefficient field, and an actual compatible system of two-dimensional continuous representations. The cyclotomic splitting paragraph already recognizes the Schur-index/descent issue. For R24.5 the precise finite quotient, subgroup family and required sharper one-dimensional-character version still need source transcription. The submitted link supplies the virtual step only. It does not turn `R24.5:operations` into a consumer of the two-dimensional existence theorem.

The scope discussion in ProfiniteCohomology was also read. It distinguishes continuous coinduction and the canonical continuous-cohomology carrier from ordinary algebraic finite-group results. Its Layers 6, 7 and 10 still require complete endpoint analysis before adding any comparison or dependency. No finite-group projective-representation-to-continuous-H2 edge is asserted here.

## Provenance and extent of reading

All mathematical input below was read at the stated input revision. A complete target README and a complete CharacterTheory README satisfy the two-upstream-document requirement; bibliography entries in those documents are not independently checked books or papers.

| Input | Extent | Blob SHA |
| --- | --- | --- |
| `content/tau-ceti/RepresentationTheory/InductionRestriction/README.md` | Complete README and all atlas stages; input/output checkpoint preserved above. | `591cf0455be8ca4143176565e5d69d1c8f13b424` |
| `research/blueprint/atlas/roadmaps/tauceti_TauCetiRoadmap_RepresentationTheory_InductionRestriction.json` | Complete target records; no touching recorded stage edges in this extract. | `685e317f89e2a399076e33822b94b98d98770c45` |
| `content/tau-ceti/RepresentationTheory/CharacterTheory/README.md` | Complete README; all proposed endpoint stages read. | `d3ff27de283532af3a7fc4bd142a9f9e108b12f0` |
| `content/tau-ceti/RepresentationTheory/SemisimpleAlgebras/README.md` | Lines 90-210 and complete Layer 1 endpoint; selected atlas stages. Not a full README read. | `b3c2cd79ce71390845b96e353ae3871ef1768aea` |
| `content/campaign/PotentialModularityAndCompatibleSystems/README.md` | Complete README and R24.5 atlas endpoint. | `ec2014f961e274d1d7a680cbe20b9c63c5fb8e46` |
| `content/campaign/ArithmeticGaloisRepresentations/README.md` | Complete README; no exact new link justified. | `ae987ad3d85c7d100e9c9d82d57f94d8da9f722c` |
| `content/tau-ceti/ProfiniteCohomology/README.md` | Lines 1-115, scope and canonical carrier; further candidate stages pending. | `c184506d49598a1370e2d05d45d1f7cf8998d783` |
| `data/roadmap-summaries.json` | Selected beginning entries and lines 150 through EOF; only the fully visible summaries are listed in `examined`. Not a full catalogue read. | `f36baf08b7da52ceba98181a70668441823ebb51` |
| Existing `...RepresentationTheory_SemisimpleAlgebras.json` link packet | Links/overlaps and the InductionRestriction reading note inspected; no existing IR edge found there. | `e7e1744f2317b2382f3d96a213c978dbeaba6ac3` |
| Existing `...RepresentationTheory_SchurWeyl.json` link packet | Complete links/overlaps sections, lines 1-235. | `534c837cdd6f3714155b2f68233d961e2d1d8c0a` |

The packet has **79 reading records**. A `none` result on a summary-only entry means that no new edge is asserted at that reading depth, not that an exhaustive search proved there is no dependency. Search hits for Mackey, Brauer induction and projective representations were discovery aids. The index and generated extracts are accessible; unfinished coverage is not attributed to the old large-file access blocker.

The baseline was read directly from `research/blueprint/baseline.json` (blob `fdb00afdfae8e5728e070f310f5a880707764bc2`): Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`; Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. **No declaration-level baseline audit was performed.** Existing-library statements in the input READMEs are not certified by this packet, and no absence claim is made about either library.

Before submission, `main` was rechecked at `be09b0fb85faab7fc6a8646e9f524140cfa0df2e`. The API comparison showed four intervening commits and no changes to the mathematical READMEs, target extract, baseline or validator used here. There were new link packets for AlgebraicCurves, LocalFieldsRamification and ModularCurves, and five new Habiro-related roadmap packets. These remain part of the explicit global audit/coverage work; this branch does not overwrite them. The original input revision is retained rather than pretending those new packets were read.

## Validation

The executed local command was `python3 build_packet.py`, from this session's scratch directory. It wrote the JSON and checked parse round-trip, required local fields, distinct reading records and links, link ownership/direction, the two evidence endpoints per link, enum values, nontrivial quote lengths, counts, and acyclicity of the **seven-link subgraph only**. Result: **PASS**, with 7 links, 3 overlaps, 79 reading records, 3 incoming/4 outgoing and 5 explicit/2 inferred. The scratch script is not a repository validator and was not committed.

The applicable repository command is:

```text
python3 scripts/check_links.py research/blueprint/links/tauceti_TauCetiRoadmap_RepresentationTheory_InductionRestriction.json
```

It was **not run locally**: the full atlas and all sibling packets needed by its world loader are not mounted in the execution environment. Reading the browser extracts is sufficient for this partial source analysis, not a substitute for that validator's full world. The validator was read at blob `88135efe5a74ef82e088f3fa3189893e27a7867a`.

The existing `.github/workflows/swarm-check.yml`, blob `d638775ee3342612163098a71aab508d381c8bc6`, runs the command on changed link packets in a PR after fetching the pinned sources. Its configuration is not a passing check result. The actual PR/run result must be reported in the submission comment. Structural validation does not prove the mathematics or complete the catalogue coverage.

No git commands, Lean builds or unrelated repository edits were made. Only the two authorized deliverables are proposed on the session branch. No issue is closed or marked done, and no submitted claim is released merely to obtain another job.

## Resume checklist

1. Finish the mandatory all-upstream and same/neighboring-area survey using `research/blueprint/atlas/index.json`, the area extracts and new roadmap packets. Start with entries missing from `examined`, then upgrade the explicitly summary-only records through object/stage searches.
2. Read complete candidate endpoints in ProfiniteCohomology Layers 6, 7 and 10; SmoothRepresentationsOfLocalGroups SR.2; CompletedCohomologyPartII; the rest of the representation-theory family; and representation-ring/projective-representation candidates in the K-theory and modularity portfolios. Continuous support, exactness and comparison results are not supplied by a bare algebraic formula.
3. Complete the global sibling-packet duplicate/cycle audit, including the newly added packets listed above. Preserve the existing SchurWeyl Young-subgroup edge. Do not use shared words such as Brauer, Clifford, induction or projective as sufficient evidence.
4. Keep the seven proposed interfaces scoped as written; consider the three ownership rescopings and source clarifications C1-C4. Any source repairs require their own authorized job, not edits under this link claim.
5. Inspect or rerun the full repository validator, resolve every actual error and then obtain independent review. Only change `status` to `complete` after completing the required coverage. This partial handoff is not enough to mark #60 done.
