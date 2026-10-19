# DESIGN-TwistedAutomorphicDescents

Completed design pass for issue #3399, by Codex, session `codex-xxzA26`, 2026-10-19. Branch `codex-xxzA26-twisted-automorphic-descents`. The bot confirmed the claim before work began. This is the one job taken in this run. This submission is a complete planning pass for independent review, rather than a checkpoint or a claim of formalization.

## Deliverables and status

The five deliverables are the new roadmap JSON, blueprint packet, full reader, compact suggested Lean file and this handoff. All 60 items routed by PAPER-JIANG-ZHANG-20 to this roadmap have explicit target mappings in `routedCoverage` and the reader ledger.

There are 49 targets: 12 definitions, 5 constructions, 28 theorems and 4 comparisons. The 17 definitions/constructions have 54 API items, 51 discriminating unit checks and use-derived API explanations. There are 37 planets, with at most six per layer. Six actual pinned baseline declarations are cited. Every node is `implementationStatus: unchecked`.

All eight layers have coverage status `planned`, and the packet status is `complete`. None is `closed`: there are eleven precise proof/source contracts and eleven requests to registered supplier stages. The coverage records propagate contracts along the actual own-node dependencies.

| Layer | Targets | Planets | Coverage |
| --- | ---: | ---: | --- |
| TAD.0 Rational Bessel coordinates | 6 | 3 | planned |
| TAD.1 Fourier modules and first occurrence | 5 | 4 | planned |
| TAD.2 The unfolded global integral | 6 | 4 | planned |
| TAD.3 Local factors and nonvanishing | 6 | 5 | planned |
| TAD.4 Residues and reciprocal periods | 7 | 5 | planned |
| TAD.5 The critical twisted descent | 9 | 6 | planned |
| TAD.6 Fourier support and period existence | 5 | 5 | planned |
| TAD.7 Recovery of cuspidal modules | 5 | 5 | planned |

The reader states each target, all standing and specific hypotheses, proof routes, exact dependencies, source locators, acceptance checks, API, uses and unit checks. It is organized by the construction and its interfaces rather than as a source summary. The 91-line suggested file has two light real-bodied definitions over existing carriers, nine theorem signatures and six checked arithmetic examples. Heavy analytic, packet and orbit carriers remain reader targets, as WORKERS.md requires; there are no proxy structures or admitted data definitions.

## Mathematical decisions

- Actual form dimension, half-dimension label, Witt index and standard-dual dimension are distinct. The Bessel partition is `[2ell+1,1^(d−2ell−1)]`; its flag and rational orbit are additional data. Index zero is restriction to the chosen smaller subgroup, without identifying that subgroup with the full zero-nilpotent stabilizer.
- The stabilizer Witt-index criterion uses representation of `y_κ` by the anisotropic kernel. The prescribed ambient constructor must recover the actual inclusion of W in V, not just a group with the right dimension. It records the even-SO normalizer twist and its involution.
- A Fourier image retains its automorphic realization and rational orbit. First occurrence is the largest nonzero index. Cuspidal Hilbert closure is formed only in a verified L² carrier. The split SO₂ central-character issue is G11, not an automatic consequence of vanishing constant terms.
- The global zeta integral is bilinear; the Generic Summand period is Hermitian. The reader gives both scalar conjugation identities. A bilinear pairing against π detects π∨. Conjugate self-duality does not imply ordinary self-duality. G1 tracks the full unitary diagram: actual root factor, inverse character, dual parameters, inducing datum and descent output. A single replacement of a bar is insufficient.
- The self-pair pole condition is explicit in the analytic reciprocity statement. In that bilinear convention it uses τ=BC(π)∨; the orthogonal standard parameter is self-dual. The printed unitary same-parameter conclusion remains conditional on the full comparison. Orthogonal and unitary conclusions are not silently equated.
- The leading residue is an order-r Laurent coefficient in one variable. Nonzero residue and nonzero critical module are separate assertions. The finite bad-place product retains its global scalar; regularity of a product is not assigned to every factor.
- AS.2 already owns the normalized-intertwiner theorem. The exact Shahidi factor has both epsilon factors multiplying in the numerator. G6 audits its all-place scope and classification backedge rather than introducing a second TAD proof node.
- The nongeneric residual parameter is distinct from a generic Arthur parameter. Generic classification does not suffice for its inner-form packet membership. Cuspidality of the constructed minimal-support residue is separated from the stronger assertion for every residual packet member.
- Critical Jacquet calculations include split and inert unitary places. An inert-only calculation cannot identify the almost-everywhere transfer over E. The corrected orthogonal index and missing final unitary character are retained.
- Weak Fourier support is existential over actual cuspidal packet members, distinct from a universal upper-support bound. The anisotropic SO₂ case has smaller form dimension 2 and ambient dimension 4n+2. Period existence is over a coherent packet and does not select the split inner form automatically.
- Concrete recovery has one copy of each distinct outer conjugate. The regular even-unitary case retains an actual U₁ character and ambient dimension 2N+1. The odd-unitary subregular partition and Bessel partition differ; their collapse/genericity comparison remains an explicit input.

## Sources and baseline audit

Read the complete mathematical text, both appendices and relevant bibliography of Jiang–Zhang, *Annals of Mathematics* 191 (2020), 739–827, from the official published PDF. SHA-256 `c016d9729f7f0cdca451e14a62015bd85cde861a9e07d3135e8feff071d0b15f`. Delicate block formulas and pairing conventions were also checked on rendered page images. All locators use printed journal pages. The packet records the actual source version, date, reading scope and twelve own-word source-issue records. They preserve or refine prior atlas findings without assigning an independent review verdict. Publisher/arXiv metadata and correction searches located no published correction.

The extraction and confirmed independent review/red-team findings were leads, not primary proof sources. The maintainer’s library index was checked. The uncleared GRS, Arthur, ABV, Borel–Wallach and Shahidi books were not read from another copy. Original Mœglin, Jiang–Liu–Xu–Zhang and Jiang–Liu–Savin proofs were not read; their exact missing comparisons are named below. The unpublished Jiang–Soudry–Zhang reference is not represented as an accessible proof. No source file, passage or extracted book text enters the deliverables.

Pinned Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369` and Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` declarations were read at the actual pins: `Nat.Partition`, quadratic Witt decomposition, special orthogonal subgroup, Witt extension, determinant of reflection and Witt cancellation. All six resolve in the pinned declaration index. These built results are imports, not new targets.

Current upstream TauCetiRoadmap main `0d144d044dacebca17b654695b6f1ad58f159b27` and current Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` were audited read-only. ReductiveGroups and RepresentationTheory/ClassicalGroups readers were read in full; relevant suggested declarations, OrthogonalSpinGroups and Completed/RestrictedProducts were inspected. The nine additions beyond the atlas snapshot and current library were checked for overlap. Shared classical groups, reflections, local/adelic structure and restricted-product carriers are existing work. No current upstream stage identifier absent from the snapshot was fabricated as a library declaration.

GGP owns relevant pairs, models, periods and local GGP; AS owns Eisenstein and intertwiner theory; AL owns general factors; ML owns classification; AF owns general Fourier/constant-term theory; SR owns local representation categories. ML.5 is a transfer registry, not a proof of the concrete GRS construction. The own-node graph is acyclic. The potential external AS.2→ML.4→AS.6→AS.2 cycle must be resolved by separating classification/analytic exports; no global GGP conclusion is imported to prove itself here. This new roadmap is outside the numbered Caraiani–Newton tiers; no upward citation or ownership move between those tiers was added.

## Remaining closure contracts

1. **G1:** full unitary pairing, root-factor, contragredient and output dictionary, including U₁ and split U₃ tests.
2. **G2:** inner-form/unitary tower cuspidality proof, with every proper constant term and boundary case.
3. **G3:** complete relative Bruhat indexing, type-D branches and open-cell inner-datum comparison.
4. **G4:** unrestricted local continuation and full spherical calculation assigned to the unpublished reference.
5. **G5:** typed Appendix-A block multiplication, its cross term, prescribed-vector nonvanishing and archimedean/split-GL smooth argument.
6. **G6:** all-place normalized-intertwiner theorem from AS.2 with its nonzero-composition proof and acyclic classification route.
7. **G7:** nongeneric inner-form residual classification and all-member cuspidal supports, beyond the one constructed residue.
8. **G8:** complete higher and critical twisted Jacquet calculations, including split unitary places and corrected weights.
9. **G9:** permitted original GRS and anisotropic SO₂ support witnesses, plus regular-descent normalization and even-unitary U₁ comparison.
10. **G10:** original subregular orbit raising, split SO₃ and unitary collapse/U₂ genericity, and the classical dominance argument.
11. **G11:** compatible central-character/discrete-spectrum carrier for the actual Fourier image, especially split SO₂.

The eleven supplier requests cover GN.2; LieHighestWeightPartII N0 and N2; AF.3; SR.2, SR.3 and SR.4; AL.3 and AL.4; ML.4; and AS.2. Their exact outputs and consumers are in the packet and reader. Four rescope proposals place general rational-orbit/dominance, Fourier/root-exchange, Asai/type-factor and generic-unitary-bound extensions in the existing directions, with each base roadmap first in its extension’s prerequisite list. The orbit extension is Part III because its base is already Part II. These proposals do not edit another job’s files.

## Verification and review handoff

- `python3 scripts/check_blueprint.py research/blueprint/packets/TwistedAutomorphicDescents.json`: zero errors, zero warnings, using the machine’s pinned declaration index.
- `lean-check research/blueprint/suggested/TwistedAutomorphicDescents.lean`: exit 0 at the shared pinned build, only nine expected proof-admission warnings. Six concrete examples elaborate. Available memory was 86 GB before compiling; no build, update, cache or language-server command was run.
- The route ledger, stage/reader/packet consistency, all definition API/tests, own-node dependency graph, planet limits and five-file intake are checked before submission. The PR records the final intake and whitespace results.

Independent review should assess all eight planned layers, especially the unitary convention chain, the spectral central-character condition, all-member residual scope, external classification scheduling and split/inert local calculations. Discharge or refine the exact contracts above before calling the plan proof-closed. The transient generator, source PDF, worklist and scratch logs are deleted after PR submission; every durable decision and remaining obligation is in these five deliverables. No second job is taken.
