# REV-RT-RS-06 — verification of the mixed-node migration finding

**Verdict: RT-RS-06/1 confirmed, medium severity.** Codex, session
`codex-5ebb6f`; issue #4394; 30 September 2026. I did none of RS-06
(Codex `codex-a71f92`), REV-RS-06 (Claude Code `cc-442dc5`) or RT-RS-06
(Codex `codex-rtOQ9t`).

The node contains three mathematical components, while its migration row names
only the early image-classification owner. The retained statement is not false
or deleted. The required correction is an explicit component migration that
preserves it and assigns its modularity and weight conclusions to their proper
construction phases.

## Evidence checked independently

I checked repository base `d600cfd3ce5b857c7a216966c678686f274dcfa8`, the
red-team result and the finding section of its report, the relevant RS-06
migration and gap passages, its accepted JSON contracts, the independent
REV-RS-06 report, and the complete retained mixed node and `gaps[4]` in
`data/decompositions/ClassicalSerreModularity.json`. The node and gap are
unchanged from RT-RS-06's inspected revision
`4a5b1f9c820216a76cb6362fdf3fcea98a10999e`.

The complete node ID is
`ClassicalSerreModularity:R27.1/dickson-and-the-dyadic-solvable-refinement`.
Its statement, hypotheses, proof steps, acceptance checks and source matches
include all three outputs below. Its current implementation status is
`unchecked`; preserving it does not certify implementation.

| Component | Independently checked source | Consequence for ownership |
| --- | --- | --- |
| Dickson classification and KW I Lemma 6.1 | KW I preprint pp. 10–11: finite irreducible projective images and the characteristic-two soluble-image refinement | The early `ArithmeticGaloisRepresentations:R01.4` image package is appropriate. |
| KW I Lemma 6.2(i) | KW I p. 11: an S-type representation with dihedral projective image is modular and occurs at its specified Serre weight and prime-to-p Artin conductor. Its characteristic-two proof separately invokes Serre's method and Wiese Lemma 2/Theorem 1. | This requires a residual modularity witness and a weight/level refinement, beyond image classification. |
| KW I Lemma 6.2(ii), detailed in DP Lemma 1.14 | KW I p. 11; DP v2 pp. 8–9: odd residual characteristic, normalized weight range, cyclotomic-restriction/bad-dihedral conditions, and distinct niveau-one and niveau-two calculations | This uses both the image result and the defined local weight recipe. It must have an explicit application owner/phase. |

I retrieved the public PDFs myself on 30 September 2026, read the cited
statements and proofs, and checked page images for KW I p. 11 and DP pp. 8–9.
The source files have the same SHA-256 values as the red team's evidence:

| Public source | Version and reading boundary | SHA-256 |
| --- | --- | --- |
| [Khare–Wintenberger, Serre's modularity conjecture I, author preprint](https://math.ucla.edu/~shekhar/papers/results.pdf) | pp. 10–11; also p. 2's S-type and weight conventions and the Wiese bibliography entry | `3c389dc33e09fe847f5d8189ffd8915b5c1a73424e64e4fed6769829883bad82` |
| [Dieulefait–Pacetti, A simplified proof of Serre's conjecture](https://arxiv.org/pdf/2108.07577v2) | arXiv:2108.07577v2, 3 May 2022; Definition 1.12 on p. 7, and Lemmas 1.13–1.14 with their proofs on pp. 8–9 | `0c6850dafda032f7a4008947c519b5aef8cc13762207bb67c36810170a8eebe6` |

DP's proof explicitly identifies its target with KW I Lemma 6.2(ii), explains
the earlier proof's missing details, first establishes the projective inertia
bound, then performs the weight calculations. Its conclusions are
`p = 2k - 1` in niveau one and `p = 2k - 3` in niveau two, matching the two
weights in the retained node. This is a weight application after image theory,
not another generic subgroup classification theorem.

## Why the finding survives the preservation rule

`research/blueprint/restructure/RS-06.md:312` correctly requires mixed nodes
to remain aggregation/source aliases with fine obligations at their named
owners. That protects the statement and incoming references. However, the
specific row at line 347 names only `ArithmeticGaloisRepresentations:R01.4`
and describes only generic finite image classification. The `gaps[4]`
migration at line 478 also names only R01.4 for the omitted details of the
weight proof. Neither row names the two nonclassification destinations.

I checked the actual destination contracts:

- R01.4, in `content/campaign/ArithmeticGaloisRepresentations/README.md:54`,
  owns residual images, restriction and oddness, including the definition of
  bad-dihedral representations. It does not construct a modularity witness.
- R17.5 and R17.6, in
  `content/campaign/GL2AutomorphicRepresentationsAndTransfer/README.md:148,158`,
  own automorphic induction/soluble Artin modularity and its characteristic-two
  residual counterpart. These are the modularity construction suppliers.
- R15.4, in
  `content/campaign/AlgebraicModularFormsAndSerreWeights/README.md:54`,
  owns the local recipe. Its accepted RS-06 contract explicitly separates that
  recipe from modular weight minimality.
- R20.3–R20.5, in
  `content/campaign/SerreWeightAndLevelOptimisation/README.md:44,54,64`,
  own scoped optimisation after a modularity witness, including the assigned
  Wiese input and characteristic-two exceptions.

The accepted RS-06 `layers[ClassicalSerreModularity:R27.1]` keeps an early
definition/image prefix and a later prescribed-lift application. Its listed
suppliers do not assign these modularity/weight components. Other layers'
general imports of R17 or R20 establish that the needed mathematics is planned
elsewhere, but do not supply the missing source-linked split for this node.
The defect therefore affects applying the migration; it is not a claim that
the current stage graph has a cycle. Medium severity is appropriate because
the statements survive and suitable owners already exist.

## Fix confirmed, with phase and source boundaries retained

Keep the stable node as an aggregation/source alias with every statement,
hypothesis, source match, acceptance check and review note. Name the three
component routes in the ledger and update the `gaps[4]` route:

1. Keep Dickson and Lemma 6.1 with the early R01.4 image package.
2. Route Lemma 6.2(i)'s modularity construction through
   `GL2AutomorphicRepresentationsAndTransfer:R17.5/R17.6`; identify separately
   its exact weight/level refinement through the applicable R20 contracts,
   including the assigned Wiese input. Do not infer the refined witness merely
   from soluble-image classification or from an unrestricted optimisation slogan.
3. Name the Lemma 6.2(ii)/DP 1.14 application after R01.4 and R15.4, preserving
   odd characteristic, S-type/bad-dihedral hypotheses, coefficient conventions
   and the normalized weight interval. Reserve a fine substage if needed;
   preserve the two source/proof versions and the existing acquisition gap.

Do not make early R01.4 depend on completed modularity. Keep RS-06's existing
distinction between conditional R20.5 and R27.4's late scalar dyadic completion;
the latter must not become an early optimisation prerequisite. The current
`gaps[4]` also records unread Ribet input: this verification of the migration
does not erase that source task. I did not independently read Wiese's theorem
or Ribet Proposition 2.2 and do not certify their full proof closure here.

## Validation and scope

Every finding in `RT-RS-06.result.json` has a verdict: one confirmed, none
rejected. `scripts/check_redteam.py` on the review JSON, intake file checks,
JSON parsing and `git diff --check` pass. Only the two issue-authorized review
files are added; the finding, proposal, decomposition and sources are unchanged.

No Lean compiled. No pinned-library theorem is asserted or needed to decide
this migration finding; Mathlib `082e2d3` and Tau Ceti `f790474` remain the
programme baseline. This review verifies the one finding and its correction,
not the red team's wider clean-result claims or the full proof closure of all
eight roadmaps.
