# PKG-InductionRestrictionPartII — blocked checkpoint

Issue #7592. Worker: Codex (GPT-6), session `codex-9fCLs4`, 2026-10-10.
Claim confirmed in issue comment 6100050974, responding to comment 6100049783.
This continues checkpoints #8434, #8480, #8500 and #8513. The saved statements
are admitted prototypes. The package remains incomplete.

## Progress in this run

Added 89 named declarations and 12 anonymous examples, giving 391 distinct
named declarations and 97 anonymous examples. The README retains all 109
planned targets, 124 API names and 96 test labels in six layers, and explains
the added native interfaces. Only the README, Suggested.lean and this handoff
changed. The packet, legacy suggested file and reader document are unchanged.

RS.5 now has signatures for all 11 targets, its four required APIs and three
unit tests. The additions retain the native semidirect product and action:

- Primary components use `AddCommGroup.primaryComponent` with the possibly
  composite parameters |H| and |Γ|. The product equivalence reconstructs a
  class as the sum of its components. Finiteness and coprimality are explicit.
- Central coprime splitting uses `GroupExtension.Splitting`, with existence,
  uniqueness and the actual product map (a,h)↦inl(a)s(h). The Hall-preimage
  statement retains the normal ambient subgroup, a surjective projection,
  coprime kernel and quotient cardinalities, characteristicity and normality.
- `compatible_cover_diagram` records an actual normal subgroup D, quotient
  S/D, lower projection, centrality, stem condition and integral kernel
  isomorphism. Upper and lower class maps are required to be extension-class
  evaluation maps. The projection and kernel squares use native quotient
  maps. Boundary tests construct diagrams with D=bottom or D=top; the
  inversion-on-C₃ test specifies the C₂ image in the quotient.
- The admissible generating set is exactly h⁻¹γ(h); inertia excludes 1 and
  imposes equality of the element's order with its projection's order. Class
  and lattice maps retain those elements. The abelianization theorem only
  needs the admissible generating condition. The equal-order conjugacy lemma
  displays the missing cyclic-complement contract explicitly.
- Relation surjectivity uses the section and the actual marked subsets.
  The reduced-kernel quotient map is a surjection from the H-primary part,
  sending each class to its reduced class. Actual reduced-cover maps satisfy
  projection and kernel squares.
- Power correction compatibility retains kernel, cover and base maps, both
  extension squares, compatible markings and a positive common exponent.
  The induced marked-fiber-product homomorphism intertwines the discrete
  actions. It does not infer coprimality with an arbitrary q−1.

RS.6 now has signatures for all seven non-table targets, its 12 APIs and nine
unit tests. The 31 row-specific signatures are still absent:

- `reduction_certificate` has native finite group enumerations, central and
  stem proofs, an oriented integral kernel isomorphism, actual class
  representatives and finite generating sets of their centralizers. Its
  relation subgroup is the closure of their lift commutators in kerπ. The
  quotient equivalence specifies its value on every homology class. Tests
  use the trivial cover, D₈→C₂², and rejection of C₄→C₂ by the stem condition.
- `certificate_marked_model` uses the certified reduced quotient, preserving
  chosen representative lifts. `finite_parity_algorithm` enumerates the
  logical finite parity set from its actual abelianization and square maps.
  APIs specify obstruction, cosets, rank counts, exact-threshold histograms
  and weight coefficients. The S₃, trivial-kernel and C₈ algebraic-fixture
  tests retain the distinctions in the README. This is a noncomputable
  specification; decidable table implementations are not claimed to exist.
- Odd-index-two reduction uses native `Representation.Coinvariants` for the
  conjugation-induced integral homology representation, and identifies the
  inclusion edge map. Its proof route explicitly accounts for the incoming
  d₃ before concluding oddness and vanishing involution relations.
- The order-96 fixture uses native A₄, the kernel of the sum of its two C₃
  quotient values, the actual swap action and an injective homomorphism into
  the wreath product. Its outside involution subset uses the actual C₂
  projection. Tests distinguish sum from difference. The reduced-multiplier
  C₂ theorem is admitted; no explicit order-96 cover has been certified.

These additions are suggested signatures, not proof implementations. The
README distinguishes the parity refinements derived from Wood's fixed-fiber
argument from the paper's numbered statements. No ownership move was made.

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
| RS.5 | 11/11 | 4/4 | 3/3 |
| RS.6 | 7/38 | 12/12 | 9/9 |

This is a static name/signature inventory, not semantic certification or
stage closure. All 109 target names, 124 API names and 96 test labels remain
in the README. Resume with the separately authorized ownership amendment,
then the row-specific native interfaces and a semantic audit:

1. Assign the two contracts above without duplicating existing upstream
   targets. Supply the native integral adapter contracts and the cyclic
   complement-conjugacy theorem with tier-compatible owners. This package
   issue does not authorize editing its source-of-truth packet.
2. Add `table_row_01` through `table_row_31` with actual finite marked groups,
   ambient embeddings, covers, centralizer generators, relation subgroups
   and quotient identifications. Do not replace a row by a group of the
   asserted order or by an unnamed proposition. ST.3 owns the embedded
   arithmetic-type inputs; ST.5 owns the limits.
3. The order-96 C₂ result needs a cover witness. Certify the reported C₂³
   kernel and order-four relation subgroup, their orientation and the
   specified outside involutions. GAP values are evidence, not certification.
4. Complete the finite-table implementation adapters for the logical parity
   specification, retaining the actual reduced marked model and ambient
   embedding. The transport API currently specifies base/cover isomorphisms,
   projection and c; it does not itself encode ST.3's ambient wreath embedding.
5. Audit every inherited RS.1–RS.4 clause against the source statements and
   every new clause against its intended contract. The new signatures were
   checked for their stated hypotheses and carriers; this run is not a fresh
   independent semantic audit of the entire inherited package. The early
   arbitrary-kernel UCT adapter remains an explicitly missing supplier.
6. Elaborate the final complete package and add metadata only after all
   section-20 requirements are met.

Finite table certificates are planned proof targets, not a new ownership
block simply because their proofs are unwritten. Preserve arbitrary kernels,
generation, inverse marking discrepancy, permuted integer degrees and
nonempty-fiber conditions throughout the remaining adapters. The legacy
suggested file's omission ledger remains at its original location.

## Validation

The final command

```text
lean-check research/blueprint/packages/InductionRestrictionPartII/Suggested.lean
```

Exited **0**, with **425 warnings, all `declaration uses sorry`**, no errors
and no other warnings. Available memory was 100 GB before the final checks.

Checks ran sequentially through the shared wrapper; no language server,
build, update, cache fetch or compilation in the current read-only
environment was used. This validates elaboration of admitted prototypes.

The build pins remain Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`
and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Relevant pinned
Schur–Zassenhaus, semidirect-product, group-extension, primary-component and
coinvariant statements were inspected. Earlier checkpoints recorded the 30
baseline references; this run does not claim to re-audit all of them.

Current Tau Ceti was read at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`
and current roadmap main at `3c18d9fbfceed0dc5c1edb1070a3927152d19e28`.
The upstream InductionRestriction and SchurWeyl READMEs were read in full;
current suggested files, including newer roadmaps absent from the atlas
snapshot, were searched for the missing suppliers. AlgebraicTopology's
relevant Stage 5–6 passages and interfaces were inspected.

The unchanged packet passed
`python3 scripts/check_blueprint.py research/blueprint/packets/InductionRestrictionPartII.json`
with **0 errors, 0 warnings**: 109 nodes, 124 API items, 96 tests, six planned
stages, five gaps, one request and zero closed stages. The README is below
200 KB. All planned target, API and test names are retained there.

`python3 research/blueprint/intake.py check-files` passed for the three changed
deliverables with **0 problems**; `git diff --check` passed. No packet,
metadata, library, other job file or upstream checkout changed.

## Source reading and identities

Fresh reading covered Wood, *Nonabelian Cohen–Lenstra moments*, Duke 168(3)
(2019), §4.1, Proposition 4.1, equations (5)–(6) and Remark 4.2, printed
pp.400–401; §8.2, Table 2, p.419; and the Appendix opening p.420. LWZB,
*A predicted distribution for Galois groups of maximal unramified extensions*,
Inventiones 237 (2024), Lemma 12.10 and its proof were read on published PDF
pp.62–63, followed by the proof of Theorem 10.4 on PDF p.64. EVW withdrawn
v1 Example 9.3.2 was read on PDF p.57 for the odd-index-two edge map.
The other inherited source citations were not re-audited in full.

| Source | Public URL | SHA-256 |
| --- | --- | --- |
| Wood, Duke (2019), read this run | https://par.nsf.gov/servlets/purl/10152050 | `154e700c1b634b9e9bde4334a19678d05ff98ca18efb6b07cb5b809f2da9c03d` |
| LWZB published (2024), read this run | https://par.nsf.gov/servlets/purl/10509628 | `64295273b34676cb6fd0f1de5fc643d1744e3359f94382ea77303903cdb6dc91` |
| Wood lifting (2021), inherited 13-page author copy | https://par.nsf.gov/servlets/purl/10253245 | `b91c78e56701615e9ccb30ed71e3ede9888b49ee984ceb0d59ae959a2d32d4ea` |
| EVW, withdrawn v1 (2012), read this run | https://arxiv.org/pdf/1212.0923v1 | `3cd5624f85450b06f4be8b37d08fb480dde8dc7c68f9a5bd7ffc57c15c04a4e4` |
| LWZB v2 (2022), inherited source identity | https://arxiv.org/pdf/1907.05002v2 | `7f1e85da49b23f80fc7abe9a68dbc5384ab216dfa5d55cd5e3223ba3268abed9` |

No restricted source was used. No source passage or source file was added to
the repository. Scratch sources and logs are removed after submission; this
note preserves the result, checks, source identities and resumption work.
