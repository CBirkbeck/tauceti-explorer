# PKG-InductionRestrictionPartII — blocked checkpoint

Issue #7592. Worker: Codex (GPT-6), session `codex-KnSeiP`, 2026-10-10.
Claim comment 6100691647 was confirmed by bot comment 6100693311.
This continues checkpoint #8544 and earlier checkpoints #8434, #8480, #8500,
#8513 and #8530. The package remains incomplete. Its statements are admitted
prototypes, not completed formalizations.

## Progress in this run

Added 24 distinct named declarations and 22 anonymous examples, giving 459
distinct named declarations and 141 anonymous examples. Four more native
table-row signatures are present: `table_row_07`, `table_row_08`,
`table_row_28` and `table_row_29`. The README retains all 109 planned targets,
124 API names and 96 test labels and describes the new interfaces.

- The general nonabelian wreath model uses native factor swap on G×G,
  its actual projection kernel, and the outside order-two marking. The
  membership formula requires b=a⁻¹ as well as a nonidentity C₂ coordinate.
  Outside involutions form one conjugacy class. Generation of the whole
  wreath product requires perfectness; C₃ tests reject dropping it. The
  marking is a set, not an asserted anti-diagonal subgroup for nonabelian G.
- The symmetric models fix τ=(0 1), write σ=aτ^ε and embed σ as
  ((a,τaτ⁻¹),ε) in Aₙ≀C₂. The even part is obtained by right multiplication
  by τ. Both factor coordinates, the quotient coordinate, injectivity and
  marking preservation are specified. The one-class statement is restricted
  to S₄ and S₅; larger symmetric groups can have different odd involution
  cycle types. A test with noncommuting transpositions distinguishes right
  from left multiplication.
- Rows 07 and 28 require certificates on the actual S₄ and S₅ markings
  with trivial output. Row 29 uses the full A₅ wreath product and output C₂.
  Row 08 uses the inherited order-96 sum-kernel model and output C₂.
- `order96_cover_certificate` requires a cover on Fin 768, its projection
  and oriented reduction certificate, a kernel isomorphism with C₂³,
  the actual relation subgroup of order four and a quotient of order two.
  These are output obligations, not supplied certified computations. The
  README distinguishes the intermediate GAP evidence from the published
  C₂ table value.
- The standard suggested-file note now precedes the imports as an ordinary
  block comment. Module-doc syntax in that position rejects imports; the
  final form elaborates.

These additions close four signature omissions while preserving ST.3's
ownership of embedded arithmetic-type classification and ST.5's limits.
No ownership move was made. The two prerequisite blockers below were checked
afresh; an authorized amendment to the plan is still needed. The eight-hour
allowance was not exhausted and no permission question is pending.

### Current validation and source checks

Final `lean-check research/blueprint/packages/InductionRestrictionPartII/Suggested.lean`
exited **0**, with **530 warnings, all `declaration uses sorry`**, no errors
and no other warnings. Available memory before checking was 101 GB. Checks
ran sequentially through the shared wrapper; no language server, build,
update, cache fetch or compilation in the current read-only environment was
used. The wrapper records Tau Ceti f790474; Mathlib's commit was checked as
`082e2d37e8b0463410cdb532e111cd43d5a66174`.

The unchanged packet passed `python3 scripts/check_blueprint.py
research/blueprint/packets/InductionRestrictionPartII.json` with **0 errors,
0 warnings**. A static inventory found no missing planned target, API or
test name in the README. It is 125606 bytes, below the 200 KB cap.
`python3 research/blueprint/intake.py check-files` passed for the three
changed deliverables with **0 problems**; `git diff --check` passed.

An independent scratch calculation enumerated permutations with composition
p(q(i)), their sign parity and the displayed wreath multiplication. It
checked all 576 S₄ and 14400 S₅ product pairs for the embedding homomorphism,
injectivity, both even coordinates and the exact marking. The 6 S₄ and
10 S₅ marked elements each form one conjugacy class and generate their group.
It also enumerated the closure of the 60 pairs (a,a⁻¹,t) in the A₅ wreath
product: the closure has 7200 elements, its outside order-two set is exactly
those 60 points, and the projection kernel surjects onto the first A₅ factor.
These finite checks validate the carrier conventions; they do not certify
Schur covers or compute reduced multipliers.

Current Tau Ceti and roadmap main were read at the same commits listed in
the preceding validation below. The InductionRestriction and
SemisimpleAlgebras upstream READMEs were read in full. AlgebraicTopology
Stage 6, item 1 and the relevant native Kronecker/transfer interfaces were
inspected. Pinned alternating-group and Schur–Zassenhaus declarations were
read. Current suggested files and library sources were searched for complete
suppliers of the two recorded gaps; none was found. The existing partial
suppliers listed below retain their boundaries. The reviewed library audit
was inspected; it has no direct Part II entry.

Fresh source reading covered Wood's introduction pp.378–379, §8.2 and
Table 2 p.419, the Appendix opening p.420, and LWZB's published proof of
Theorem 10.4, PDF p.64. Access date: 2026-10-10. Both downloaded files matched
the source hashes in the identity table below. The S₄/S₅ carrier maps are
explicit mathematical constructions for the selected types; ST.3 retains
their classification. No restricted source was used. This run did not
independently re-audit every inherited clause or all 30 baseline claims.

## Inherited progress from checkpoint #8544

Added 44 distinct named declarations and 22 anonymous examples, giving 435
distinct named declarations and 119 anonymous examples. The README retains
all 109 planned targets, 124 API names and 96 test labels in six layers. Only
the package README, Suggested.lean and this handoff changed.

RS.6 now has native signatures for the nineteen odd abelian rows of Wood's
Table 2: rows 01–06, 09–12, 14–15, 18–21 and 25–27. Their outputs are the
published reduced multiplier groups, with group structure retained:

- For an abelian A, `TableWreath A` is the native factor-swap semidirect
  product (A×A)⋊C₂. `table_antidiagonal A` fixes the actual embedded subgroup
  of elements ((a,a⁻¹),t). `table_embedding` is its subtype homomorphism;
  `table_projection` is the native right projection restricted to it.
- `table_coordinates` fixes the first-factor coordinate and C₂ coordinate,
  with the inversion multiplication formula. `table_kernel_first` is the
  first-coordinate homomorphism on the actual projection kernel, not an
  arbitrary isomorphism. Surjectivity, cardinality, generation and one-class
  marking retain their stated hypotheses, including oddness where needed.
- `table_outside` requires both nontrivial C₂ projection and order two.
  The tests distinguish anti-diagonal from diagonal, factor swap from
  ambient inversion, kernel from outside points, and the even-order
  generation failure. Each added map has concrete discrimination checks.
- `abelian_table_dihedral` fixes the cyclic carrier using Mathlib's actual
  `DihedralGroup n`, including its pointwise rotation and reflection API.
  Mathlib's reflection convention sends the left coordinate i outside the
  kernel to sr(−i). Tests at residues 0, 1 and 2 check that sign.
- `table_row_certificate` asks for a finite cover on Fin m, its group law,
  projection and oriented reduction certificate, and the computed kernel
  quotient and reduced multiplier isomorphisms. The quotient isomorphisms
  agree on every integral homology class. No input assumes the table value.
  Three tests use the trivial group, unmarked C₂², and the outside marking
  of the embedded inversion model of C₃.

The actual finite covers and their proofs remain targets. The construction
fixes the ambient abelian embeddings; ST.3 still owns their identification as
arithmetic types. No upstream target or ownership boundary was replanned.

## Inherited interfaces from checkpoint #8530

Checkpoint #8530 added 89 named declarations and 12 anonymous examples. Its
RS.5–RS.6 interfaces are retained:

RS.5 has signatures for all 11 targets, its four required APIs and three
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

RS.6 has signatures for all seven non-table targets, its 12 APIs and nine
unit tests. Before this run, all 31 row-specific signatures were absent:

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
| RS.6 | 30/38 | 12/12 | 9/9 |

This is a static name/signature inventory, not semantic certification or
stage closure. All 109 target names, 124 API names and 96 test labels remain
in the README. Resume with the separately authorized ownership amendment,
then the row-specific native interfaces and a semantic audit:

1. Assign the two contracts above without duplicating existing upstream
   targets. Supply the native integral adapter contracts and the cyclic
   complement-conjugacy theorem with tier-compatible owners. This package
   issue does not authorize editing its source-of-truth packet.
2. Add the eight remaining row signatures: `table_row_13`, `table_row_16`,
   `table_row_17`, `table_row_22`, `table_row_23`, `table_row_24`,
   `table_row_30` and `table_row_31`. Use actual finite marked groups,
   ambient embeddings, covers, centralizer generators, relation subgroups
   and quotient identifications. Row 08 now has a native certificate
   signature and a cover-order/kernel/relation contract. Do not
   replace a row by a group of the asserted order or by an unnamed proposition. ST.3 owns the embedded
   arithmetic-type inputs; ST.5 owns the limits.
3. The order-96 C₂ result needs a cover witness. Certify the reported C₂³
   kernel and order-four relation subgroup, their orientation and the
   specified outside involutions. GAP values are evidence, not certification.
4. Complete the finite-table implementation adapters for the logical parity
   specification, retaining the actual reduced marked model and ambient
   embedding. The transport API currently specifies base/cover isomorphisms,
   projection and c; it does not itself encode ST.3's ambient wreath embedding.
5. Audit every inherited RS.1–RS.4 clause against the source statements and
   every new clause against its intended contract. The added table signatures
   were checked for their stated hypotheses and carriers; this run is not a fresh
   independent semantic audit of the entire inherited package. The early
   arbitrary-kernel UCT adapter remains an explicitly missing supplier.
6. Elaborate the final complete package and add metadata only after all
   section-20 requirements are met.

Finite table certificates are planned proof targets, not a new ownership
block simply because their proofs are unwritten. Preserve arbitrary kernels,
generation, inverse marking discrepancy, permuted integer degrees and
nonempty-fiber conditions throughout the remaining adapters. The legacy
suggested file's omission ledger remains at its original location.

## Validation in checkpoint #8544

The final command

```text
lean-check research/blueprint/packages/InductionRestrictionPartII/Suggested.lean
```

Exited **0**, with **483 warnings, all `declaration uses sorry`**, no errors
and no other warnings. Available memory was 98 GB before the final check.

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

## Source reading in checkpoint #8544 and version identities

Fresh reading in this run covered Wood, *Nonabelian Cohen–Lenstra moments*,
Duke 168(3) (2019), the introduction on printed pp.378–379, §8.2, Table 2,
p.419, and the Appendix opening p.420. The published table was also inspected
visually to resolve PDF text extraction. LWZB, *A predicted distribution for
Galois groups of maximal unramified extensions*, Inventiones 237 (2024),
the proof of Theorem 10.4 on published PDF p.64 was read afresh: it uses
conjugacy of splittings over the cyclic subgroup generated by an inertia
element, not just existence of a complement.

Inherited source reading from #8530 covered Wood §4.1, Proposition 4.1,
equations (5)–(6) and Remark 4.2, printed pp.400–401; LWZB Lemma 12.10 on
published PDF pp.62–63; and EVW withdrawn v1 Example 9.3.2 on PDF p.57.
Those passages and the other inherited citations were not re-audited in full
in this run. The following identities preserve the version ledger:

| Source | Public URL | SHA-256 |
| --- | --- | --- |
| Wood, Duke (2019), read this run | https://par.nsf.gov/servlets/purl/10152050 | `154e700c1b634b9e9bde4334a19678d05ff98ca18efb6b07cb5b809f2da9c03d` |
| LWZB published (2024), read this run | https://par.nsf.gov/servlets/purl/10509628 | `64295273b34676cb6fd0f1de5fc643d1744e3359f94382ea77303903cdb6dc91` |
| Wood lifting (2021), inherited 13-page author copy | https://par.nsf.gov/servlets/purl/10253245 | `b91c78e56701615e9ccb30ed71e3ede9888b49ee984ceb0d59ae959a2d32d4ea` |
| EVW, withdrawn v1 (2012), inherited identity | https://arxiv.org/pdf/1212.0923v1 | `3cd5624f85450b06f4be8b37d08fb480dde8dc7c68f9a5bd7ffc57c15c04a4e4` |
| LWZB v2 (2022), inherited source identity | https://arxiv.org/pdf/1907.05002v2 | `7f1e85da49b23f80fc7abe9a68dbc5384ab216dfa5d55cd5e3223ba3268abed9` |

No restricted source was used. No source passage or source file was added to
the repository. Scratch sources and logs are removed after submission; this
note preserves the result, checks, source identities and resumption work.
