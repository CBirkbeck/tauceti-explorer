# RT-RS-22 — independent restructuring attack

Codex, session `codex-a71f92`; 2026-09-30. Refs #4412.

## Outcome

Complete for this restructuring audit: **no actionable finding**. This session
neither wrote RS-22 (Codex `codex-c83e7a`) nor reviewed it (Claude Code
`cc-442dc5`). No accepted work is changed.

All eight global stages and five local Hecke stages remain. The empty
`owners` list is appropriate: the decision does not transfer a target between
members. The title clarification identifies the Fargues–Fontaine curve without
identifying it with the global function-field curve, even in equal
characteristic. The actual application preserves every stage ID, description
and pre-existing edge.

Audit base: `41a10fab7633fe914c47c89b90c2cfe7056d418e`.
Target blob: `48043033f542345201945e0b39b2240fd3b6e51a`.
Review blob: `404e0bafd9a830bfd0267863a3517e596a7f1f9e`.
Integrated HS decomposition blob: `21dc6b84cd93b807b5f1ad2aeaa97f2826f6bc7d`.
A refresh through `4c3ef31c6f7a8471b16963d682d3e16c754cc801` found no changes
to the inspected target/family/review, atlas, library coverage, applied
restructurings, link packets, integrated HS decomposition or campaign/upstream
documents.

## Four overlap attacks

The eight directed family leads represent four pairs. I checked the complete
member documents and each of their stage descriptions, not just the lead labels.

| Pair | Attempted replacement | Why it fails |
| --- | --- | --- |
| GS.1 / HS0 | One Hecke construction supplies both | The global curve's Beilinson–Drinfeld geometry and the relative Fargues–Fontaine geometry have different bases and bundle categories. Classical geometric Satake also remains GS.1 work. |
| GS.2 / HS0 | A Hecke correspondence is the global shtuka | GS.2 adds the specified Frobenius identification, partial Frobenius and HN/central-lattice truncation data. HS0 retains its own meromorphic-modification correspondence. |
| GS.2 / HS2 | Framed local fibres replace global shtuka moduli | The moduli, levels and group actions differ. Uniformization and nearby-cycle comparison are extra maps, retained in GS.7. |
| GS.4 / HS1 | One Drinfeld theorem gives both actions | Global partial-Frobenius descent and divisor/local-Weil descent have different carriers and coefficient conditions. HS1 imports VS1 but must construct the actual action. |

Fresh source check: [V. Lafforgue v10, Lemma 8.2 and Remarks 8.3–8.4](https://arxiv.org/pdf/1209.5352v10),
printed pp. 107–108, concerns constructible lisse integral coefficient sheaves
with commuting partial Frobenius and finite-type continuous product-fundamental-
group representations, with specified diagonal and external-product behavior.
I read its statement and inverse-functor discussion, not the full subsequent
proof.

[Fargues–Scholze IV.7](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf),
printed pp. 164–166, uses a local Weil group. Pullback is fully faithful; the
equivalence is for locally constant perfect objects with the section's
prime-to-residue-characteristic torsion coefficients, not arbitrary sheaves.
The proof and its essential-image restriction were read. I also checked
IX.2.1–4, IX.3.1 and its proof/admissibility discussion, and IX.5.1 with proof:
the retained solid/continuous/pro-p qualifications and downstream uniform-wild
owner match those bounded source checks. This does not certify unread imports.

Both PDFs were acquired on 2026-09-30; their hashes exactly match the target's
record:

| Source | SHA-256 |
| --- | --- |
| FS author PDF, 356 pages | `9ab9efbd0df251bfa3b610d1d1d88a8dfb1bdf7c397bd04f4c277280d98ae905` |
| Vincent Lafforgue v10, 184 pages | `b37715f9c42862b7560d8b71da07924376e3cbbbe862ef9e89a57d8c91a64295` |

## Target conservation

Each JSON `stageChecks` entry records the full boundary assessment.

| Stage | Retained obligations tested |
| --- | --- |
| GS.0 | Global Bun_G, levels, HN/deformation geometry, finite-type bounded opens, torsor-class adelic comparison and nonsplit descent. |
| GS.1 | Classical curve Grassmannians/Hecke stacks, convolution/fusion, rational Satake and normalization; no replacement by a trace-to-spherical-function comparison. |
| GS.2 | Frobenius modifications, levels/bounds, partial Frobenius, HN truncations, central lattices and qualified representability/local models; DM.7 stays optional. |
| GS.3 | Stack-specific IC and compact-support/colimit construction, correspondences, Hecke-finite/cuspidal sector and automorphic identification; EDC.5 is only a scheme supplier. |
| GS.4 | Classical Drinfeld descent, justified Hecke-finite application, global action, specialization independence and coalescence. |
| GS.5 | Global excursions and semisimple parameters, generalized eigenspaces, nonsplit projection and unramified compatibility; no full inverse correspondence. |
| GS.6 | Independent full GL_n route, compactification/boundary/rank induction/trace, both directions and exact determinant/central-character and local-factor conditions. |
| GS.7 | Actual global-to-local maps and source-gated ramified comparison; specialized local realization does not supply general-G compatibility or monodromy. |
| HS0 | Fargues–Fontaine bundles and off-divisor meromorphic modification, bounds, descent, chains and collisions, qualified global/relative geometry. |
| HS1 | Actual normalized kernels and functors, continuous Weil action, coefficient change and preservation; completed Satake and solid/lisse inputs remain. |
| HS2 | General framed fibres, both group actions, levels, bounded representability, reflex descent, justified limits and classical comparison obligations. |
| HS3 | Ordered coefficient/level limits, commuting actions, fibre comparison, qualified compactness/admissibility, duality and level change. |
| HS4 | Dual-leg triangles, finite-set coherence and geometric comparison diagrams; parameter identities and uniform-wild theorem stay downstream. |

The added links are not declarations that these proofs already exist. I read the
supplier/consumer contracts for all 13 link pairs. The JSON records a separate
semantic assessment for each.

Additional adversarial checks:

- LP2's finite-wild local parameter reconstruction does not automatically prove
  GS.5's global Galois theorem.
- Satake GS4:classical-Satake-comparison is a downstream trace/function
  comparison, not classical geometric Satake on the global curve.
- ClassFieldTheory Layer 9 supplies the local Weil carrier and topology for
  nonarchimedean fields, but only a mixed-characteristic reciprocity
  isomorphism. The new link to HS1 needs the former, not an excluded
  equal-characteristic reciprocity statement.
- FA.6 supplies the correctly fixed-level/central-character cusp space, not the
  shtuka-sector identification. FA.4 supplies one normalized rank-one
  reciprocity input to both independent global routes.
- ES7's D-elliptic realization remains a specialized local endpoint. Its
  automorphic supplier retains the selected transfer-image/globalization scope
  and corrected dual-isotypic conditions; nothing in RS-22 upgrades it to the
  entire GL_n or general-group global correspondence.
- DM.7 is a specialized elliptic-sheaf realization, not an input to defining
  general global shtukas.

## Existing partial decomposition and pinned carriers

I inspected the integrated HS packet's thirteen node statements, hypotheses,
outlines and acceptance obligations, thirteen internal links, five partial
coverage entries, five gaps and accepted review. It remains partial. In
particular, the `HS4/uniform-wild-subgroup` node's old parent conflicts with
the current ownership, which the proposal explicitly identifies and does not
perpetuate. The parameter-level content in the old group-diagram node likewise
does not authorize moving ES6/7's conclusions into HS4.

The unclosed source/implementation work in VII.4–VII.5, Berkeley 23–24,
level changes, coefficient comparison and explicit dual-leg coherence remains
recorded. A restructuring can preserve those obligations without claiming a
finished blueprint. This audit does not edit or certify that packet.

I read all thirteen reviewed member library-coverage records. At Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174`, I directly checked:

- `CategoryTheory.ExactPairing`, its ordinary monoidal-category context,
  evaluation/coevaluation and both triangle equations,
  `Mathlib/CategoryTheory/Monoidal/Rigid/Basic.lean:68–115`;
- `Condensed.freeForgetAdjunction`, with its ring/universe context,
  `Mathlib/Condensed/Module.lean:32–57`.

These abstract constructions are not geometric kernels, an enhanced coherent
Hecke action or Drinfeld descent. Other implementation-status statements are
attributed to the reviewed audits, not a fresh exhaustive absence search.
The Tau Ceti baseline remains
`f790474821cf4256814db967cb154e7af3d0c369`.

## Graph, application and consumer checks

All eleven native external member edges remain, reaching seven distinct
consumers: ES0, ES1:finite-ramification, ES6:functoriality,
ES7:parabolic, ES7:GLn-comparison, ES7:equal-characteristic and ET.6a.
I read all seven contracts. No global member has an existing external consumer
in the checked native graph; internal global/HS dependencies also remain.

| Mechanical test | Result |
| --- | --- |
| Target `check_restructure.check` | no errors |
| Member coverage | 13 of 13 stages, all keep |
| Link pairs | 13 unique, non-self, resolved |
| Native new versus existing | 9 new, 4 already present |
| Native edges + requires + RS-22 | 3,517 edges, no RS-22 return path |
| Plus 25 accepted link maps | 4,124 edges, no RS-22 return path |
| Plus 27 applied restructurings | 7,007 edges, no RS-22 return path |
| Application after other accepted proposals | 9 links added, none skipped |
| Application in isolation | all stage IDs/descriptions/existing edges preserved |
| Retitle | applied exactly; no upstream stage changed |

The author's eight-new/five-existing count used its combined input graph.
The review distinguishes the native nine/four count; I reproduced the latter.
The operative 13-pair JSON is unchanged. This accounting difference does not
alter a dependency or justify a new finding.

Reproduction: read all inputs at the audit commit using `git show`. Form the
native `stageEdges` union with in-registry `requires` edges, then add the
proposal. For each proposal edge `u → v`, search from `v` for `u`.
Repeat after adding links from accepted `research/blueprint/links/*.json`,
then from `data/restructure/*.result.json`. Run the actual
`restructure.apply_restructurings` with the other proposals followed by RS-22,
and separately RS-22 alone for stage/description/edge conservation.
The result is no cycle involving an RS-22 edge in these unions, not a global
acyclicity claim about unrelated components.

## Limits and follow-up

The known HS3 late-realization returns still require theorem-level separation:
ET.6a and ES7 export classical realizations while their general local inputs
come earlier. Adding the converse whole-stage edge would hide that distinction.
RS-22 retains the comparison as work rather than asserting it has been proved.

ET.2b's matching ordinary global bundle/Grassmannian geometry should be reused
when its blueprint is decomposed; the Hitchin, affine-Springer, Picard and support
machinery remains additional. The accepted proposal already records that
cross-family boundary. None of these observations shows an RS-22 target lost,
an incorrect substitution, or a cycle introduced by its links.

No full classical Satake, global/local Langlands, stack-IC or general-G ramified
proof audit is claimed. No Lean file is required or compiled, and no new
formalization is asserted. Submit only this report and the result JSON; run the
red-team and submission-file checks before publication.
