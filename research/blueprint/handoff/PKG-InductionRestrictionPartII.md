# PKG-InductionRestrictionPartII — blocked checkpoint

Issue #7592. Worker: Codex (GPT-6), session `codex-fvhsf5`, 2026-10-10.
Claim confirmed in issue comment 6099818256, responding to comment 6099817122.
This continues checkpoints #8434, #8480 and #8500. The saved statements are
admitted prototypes. This is an incomplete package, not a proof implementation.

## Progress in this run

Added 25 named declarations and three anonymous examples, giving 302 distinct
named declarations and 85 anonymous examples. The README retains all 109
planned targets, 124 API names and 96 test names in six layers, and is about
107 KB. Only the README, Suggested.lean and this handoff changed.

The previously missing RS.4 targets now have native signatures:

- `affine_compatible_parities` identifies degree compatibility with the
  translated kernel of the actual involution abelianization map, and
  identifies the actual square obstruction with the lift-square map on that
  translate. It requires valid class representatives.
- `surviving_parities` connects the translated joint kernel to nonemptiness
  of the actual fixed subset of the marked pullback, and gives its torsion
  cardinality. It retains generation by involutions, a finite central
  kernel, positive common exponent, odd q>1, coprimality, and the equality
  v₂(q−1)=t+1. Integer degrees may be negative.
- `independent_classes` uses independence of the actual abelianized class
  representatives. It states bijectivity of the parity map, uniqueness of
  the compatible parity, vanishing square obstruction, and nonempty actual
  fixed fibers with the torsion cardinality for every allowed q.

The adapters distinguish the identity signature from a marked element x∈c.
`signature_element`, `signature_lift`, `signature_parity` and
`signature_square` retain that choice explicitly; `degree_parity` is the
integer-coordinate reduction modulo two. `signature_joint_map` uses the
existing abelianization module and the extension's actual square columns.
It does not substitute an unrelated abstract binary matrix.

`actual_two_adic_survival` states the two-adic criterion on the actual fixed
fiber, with its abelianization compatibility conjunct. The rank count and
signature-equality statements count the translated kernels.
`signature_threshold_exact` identifies the actual obstruction threshold with
membership in one kernel and exclusion from its predecessor.
`signature_threshold_histogram` gives K_t−K_{t−1}, treating t=0 separately
with K_{−1}=0. No equality of weight enumerators follows from equality of
parity cardinalities.

Square-map tests now cover both zero maps, the actual S₃ transposition maps
with coordinate equivalences and trivial square-class space, and the failure
of independence for distinct classes with identical abelianized images. An
additional concrete S₆ example realizes that last condition with a
transposition and three disjoint transpositions. The ZMod 8 filtration test
now checks levels 0 and 1 as well as 2 and 3.

README additions explain these mathematical inputs and distinguish the
linear-algebra refinements derived here from Wood's numbered fixed-fiber
result. No new roadmap target, ownership move or packet edit was made.

## Two prerequisite ownership blockers

The authoritative accepted packet itself records these gaps:

1. **Natural integral homological bridge — supplier unassigned.** Required
   on native groupHomology/groupCohomology are the degree-two integral UCT
   for arbitrary abelian trivial-action kernels, including infinite ones;
   natural extension-class evaluation with oriented commuting cycle
   XYX⁻¹Y⁻¹; central-extension homological five-term transgression;
   finiteness and group-order annihilation of finite-group positive-degree
   integral homology; coprime degree-two LHS with the possible incoming d₃;
   and the Ext¹-vanishing adapter for free abelian groups. The parent
   InductionRestriction Layer 7 owns ordinary Schur covers, not this entire
   general bridge.
2. **Complement conjugacy over a cyclic coprime quotient.** For finite
   coprime H,C with C cyclic, every complement to H in H⋊C must be
   H-conjugate to the standard complement. The pinned Schur–Zassenhaus
   result proves existence alone. LWZB's proof of Theorem 10.4, published
   PDF p.64, uses conjugacy of equal-order lifts to compare inertia classes.

These are ownership and dependency gaps in the plan, not a complaint that
future theorem proofs have not been written. A package must cite supplying
layers, and this issue forbids changing its accepted packet. Assigning a
supplier silently or enlarging the parent's scope would not resolve the
plan. The checkpoint is submitted because of these blockers, not because
the eight-hour allowance was exhausted. No permission question is pending.

A separately authorized planning change should identify the owners, native
contracts and tier-compatible imports before this package is declared
complete. Do not keep reassigning this package on the assumption that its
accepted review removed those gaps: that review explicitly left six planned
stages, five gaps, one request and zero closed stages.

## Existing partial suppliers: preserve these boundaries

The current library and upstream roadmaps were checked afresh. No complete
contract supplying either recorded gap was found. Existing partial inputs
must be imported rather than planned again:

- `TauCeti.groupHomology.transfer_comp_map_subtype_id`, in
  `TauCeti/RepresentationTheory/Homological/GroupHomology/Transfer/Basic.lean`,
  states that transfer followed by subgroup inclusion is the index times
  the identity. The trivial-subgroup case together with Mathlib's
  `isZero_groupHomology_succ_of_subsingleton` gives an order-annihilation
  route. The transfer module is absent from the pinned build. It supplies
  neither arbitrary-kernel UCT nor the entire integral bridge.
- AlgebraicTopology **Stage 6, item 1** already plans the natural
  arbitrary-coefficient singular-cohomology UCT over a PID/hereditary ring.
  Its suggested file does not give a native group-cohomology adapter for
  the required extension-class evaluation or five-term transgression.
  **Stage 5** plans topological transfer and Cartan–Leray machinery; its
  suggested group-homology carrier serves that topological interface.
  Ownership resolution must reuse these targets where applicable rather
  than invent a competing general UCT or topological spectral sequence.
- `TopCat.singularKroneckerEquiv` and the chain-level Kronecker interface
  require injective coefficients; they do not supply the arbitrary-kernel
  exact sequence. Current ProfiniteCohomology five-term results concern
  continuous cohomology, not the integral homological contract here.
- Current Frobenius-complement results impose extra hypotheses and do not
  give arbitrary cyclic coprime complement conjugacy.
- Parent InductionRestriction Layer 7 remains the ordinary-cover supplier,
  with integral H₂-kernel identification and orientation. Its projective
  H²(G,kˣ) interface cannot stand in for that integral kernel.

The reviewed library audit has no direct Part II entry. Its
GL2AutomorphicRepresentationsAndTransfer:R17.5 and
MetaplecticAutomorphicForms:MP.1 entries explicitly consume the parent's
projective-representation/factor-set interface. Those targets remain imports.

## Remaining work and where to resume

`metadata.toml` remains absent: intake uses the three package files to detect
completion. Its eventual content is `topic = "math.GR"`; add it only when the
whole package meets section 20.

| Layer | Target names present | API names present | Test labels present |
| --- | --- | --- | --- |
| RS.1 | 14/14 | 29/29 | 21/21 |
| RS.2 | 16/16 | 29/29 | 21/21 |
| RS.3 | 11/11 | 28/28 | 24/24 |
| RS.4 | 19/19 | 22/22 | 18/18 |
| RS.5 | 1/11 | 0/4 | 0/3 |
| RS.6 | 2/38 | 0/12 | 0/9 |

This is static signature inventory, not semantic certification or stage
closure. Retain the earlier instruction to audit every inherited clause in
RS.1–RS.3. The new RS.4 statements use an arbitrary finite central marked
model and specialize to the reduced multiplier after RS.2 supplies that
model; they do not establish the missing integral supplier.

After the ownership amendment, bind the required contracts to their owners
and continue:

- RS.5: only `split_homology_surjection` is present. Add primary support,
  unique coprime splitting, characteristic Hall preimage, compatible
  covers, inertia classes, abelianization, relation surjection, reduced
  kernel and correction/action comparison, including four compatible-cover
  API lemmas and three tests. Preserve the possible incoming LHS
  differential and the exact coprimality hypotheses.
- RS.6: centralizer commutator homomorphism and generator reduction are
  present. Add reduction certificates, the finite parity algorithm,
  odd-index-two reduction, the order-96 marked type and reduced multiplier,
  and all 31 table-row certificates, with their 12 API lemmas and nine
  tests. Use executable finite group data and independently certified
  ordinary covers. Preserve the order-96 sum-kernel condition and actual
  embedding. ST.3 owns embedded arithmetic types; ST.5 owns limits.

Finite table certificates are planned proof targets, not another ownership
block merely because they are unproved. For the order-96 type, the reported
C₂³ cover kernel and order-four reduction subgroup must be certified before
concluding C₂. GAP values are evidence, not certified theorems.

The original legacy suggested file's omission ledger remains in its original
location; it was not copied into the package. Arbitrary kernels, generation,
inverse marking discrepancy, permuted degrees and nonempty-fiber conditions
must survive the remaining adapters.

## Validation

The final command

```text
lean-check research/blueprint/packages/InductionRestrictionPartII/Suggested.lean
```

exited **0**, with **343 warnings, all `declaration uses sorry`**, no errors
and no other warnings. Available memory was 100 GB before the final check.
Checks ran sequentially through the shared wrapper; no language server,
build, update, cache fetch or compilation in the current read-only
environment was used. This validates elaboration of admitted prototypes.

The build pins remain Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`
and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Earlier checkpoints
recorded inspection of the 30 baseline declarations. This run uses existing
package carriers and inspected the relevant current supplier statements;
it does not claim a new independent audit of all 109 targets or all baseline
references.

Current Tau Ceti was read at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`
and current roadmap main at `3c18d9fbfceed0dc5c1edb1070a3927152d19e28`.
The upstream InductionRestriction and SchurWeyl READMEs were read in full;
current suggested files, including newer roadmaps absent from the atlas
snapshot, were searched for the missing suppliers. AlgebraicTopology's
relevant Stage 5–6 README passages and suggested interfaces were inspected.

The unchanged packet passed
`python3 scripts/check_blueprint.py research/blueprint/packets/InductionRestrictionPartII.json`
with **0 errors, 0 warnings**: 109 nodes, 124 API items, 96 tests, six planned
stages, five gaps, one request and zero closed stages. Every planned target,
API name and test label remains in the README. Its size is below 200 KB.

`python3 research/blueprint/intake.py check-files` passed for the three changed
deliverables with **0 problems**; `git diff --check` passed. No packet,
metadata, library, other job file or upstream checkout changed.

## Source reading and identities

Fresh reading covered Wood, *Nonabelian Cohen–Lenstra moments*, Duke 168(3)
(2019), §4.1, Proposition 4.1, equations (5)–(6), Remark 4.2, printed
pp.399–401, and LWZB, *A predicted distribution for Galois groups of maximal
unramified extensions*, Inventiones 237 (2024), Lemma 12.10 and its proof,
published PDF pp.62–63, followed by the proof of Theorem 10.4 on PDF p.64.
The former supplies the fixed-fiber equation used in the RS.4 refinements;
the latter confirms the two missing contracts. The existing citations for
other targets are inherited, not re-audited here.

| Source | Public URL | SHA-256 |
| --- | --- | --- |
| Wood, Duke (2019), read this run | https://par.nsf.gov/servlets/purl/10152050 | `154e700c1b634b9e9bde4334a19678d05ff98ca18efb6b07cb5b809f2da9c03d` |
| LWZB published (2024), read this run | https://par.nsf.gov/servlets/purl/10509628 | `64295273b34676cb6fd0f1de5fc643d1744e3359f94382ea77303903cdb6dc91` |
| Wood lifting (2021), inherited 13-page author copy | https://par.nsf.gov/servlets/purl/10253245 | `b91c78e56701615e9ccb30ed71e3ede9888b49ee984ceb0d59ae959a2d32d4ea` |
| EVW, withdrawn v1 (2012), inherited source identity | https://arxiv.org/pdf/1212.0923v1 | `3cd5624f85450b06f4be8b37d08fb480dde8dc7c68f9a5bd7ffc57c15c04a4e4` |
| LWZB v2 (2022), inherited source identity | https://arxiv.org/pdf/1907.05002v2 | `7f1e85da49b23f80fc7abe9a68dbc5384ab216dfa5d55cd5e3223ba3268abed9` |

No restricted source was used. No source passage or source file was added to
the repository. Scratch sources and logs are removed after submission; this
note preserves the result, checks, source identities and resumption work.
