# PKG-InductionRestrictionPartII — blocked checkpoint

Issue #7592. Worker: Codex (GPT-6), session `codex-imK0mZ`, 2026-10-10.
Claim confirmed in issue comment 6098918234. This continues the checkpoint in
#8434. **The package remains incomplete: two prerequisites have no assigned
supplier in its authoritative plan.** The signatures saved here are admitted
prototypes, not implementations or proofs of the roadmap.

## Saved progress

The README retains all 109 targets, 124 API names and 96 test names, in six
layers. This run added explanations of the native homology map, quotient,
twist, power-action and binary-column interfaces. It also replaced the
inaccessible Harvard lifting-paper URL with the public NSF author copy and
checked the relevant construction, comparison and action passages.

The suggested file now has 217 distinct named declarations and 76 anonymous
examples, up from 87 and 49 in #8434. The additions include:

- Integral homology maps using Mathlib's functor and the identity coefficient
  morphism; reduced-multiplier maps and their quotient, identity and composition
  rules; commuting-pair order laws; maps of lift commutators.
- A quotient of the chosen cover by the actual image of its relation subgroup,
  its descended projection, kernel isomorphism, centrality, stem property,
  lifted centralizers and conjugacy bijections. The oriented kernel map,
  surjectivity and stem assumptions remain explicit where required.
- Choice-dependent conjugacy-equivariant markings and local normalization;
  marked morphisms; the presentation's word-conjugation law and universal
  property; actual fiber-product coordinates; pullback splitting, marked
  comparison and the full central-kernel product/torsion statements. These
  allow arbitrary abelian target kernels, including infinite ones. The kernel's
  commutative-group instance keeps its inherited group operations.
- Coordinate permutations through `Finsupp.domCongr`; twists through the native
  bundled equivariant maps on a torsor; central power corrections and their
  choice/cocycle laws; set permutations of the actual fiber product and
  automorphisms of its projection kernel. Unit powers are never made a
  homomorphism on the nonabelian cover.
- Squares extracted from an actual `GroupExtension`, their independence in
  the existing elementary-two quotient, and the linear square-column map.
  Mathlib's `AddCommGroup.zmodModule` equips the existing abelianization with
  binary scalars. Added filtration/exhaustion laws, a generic two-adic power
  solvability criterion and a native finite polynomial weight enumerator.
- Split-projection surjectivity on integral second homology, and the
  centralizer commutator homomorphism with its generator-reduction theorem.
- Concrete dihedral/quaternion cover signatures and discriminating examples
  for commutators, quotient dependence, markings, coordinate permutations,
  twists, lift corrections and weight enumerators.

`autoImplicit` is disabled. There is one import block, namespace and standard
header. The original suggested file's commented omission ledger remains in
its original location; it was not copied into the package. No packet, legacy
reader, queue, other roadmap, or source passage was changed.

## Completion blocker

The accepted packet explicitly leaves these two general suppliers unassigned:

1. **Natural integral homological bridge.** The needed contract comprises the
   degree-two integral UCT for arbitrary abelian trivial-action kernels,
   including infinite ones; naturality of its extension class map; evaluation
   of the oriented commuting cycle as XYX⁻¹Y⁻¹; central-extension homological
   five-term transgression; finite positive-degree homology and group-order
   annihilation by transfer; coprime degree-two LHS with the incoming d₃; and
   the Ext¹-vanishing adapter for free abelian groups. Parent Layer 7 owns
   ordinary covers, not this general package. The plan expressly describes
   the continuation as an ownership question without an existing supplier edge.
2. **Conjugacy of complements over a cyclic coprime quotient.** For finite
   coprime H,C with C cyclic, every complement to H in H⋊C must be H-conjugate
   to the standard one. Mathlib's cited Schur–Zassenhaus result supplies
   existence alone. The published LWZB argument on PDF p.64 uses the additional
   conjugacy result to identify the inertia classes.

Neither supplier was found in current Tau Ceti or current upstream roadmaps.
The issue forbids packet edits and requires fidelity to the accepted plan.
Assigning a new supplier or silently enlarging the parent would exceed this
packaging job. An ownership question was raised during the run; no decision
was received before submission. Closure therefore prevents a complete
package, independently of the remaining signature work.

`metadata.toml` stays absent. Its eventual content is `topic = "math.GR"`.
The intake treats existence of all three package files as completion; metadata
must be added only when the full package meets section 20. The README's input
contracts describe required mathematics, not existing assigned suppliers.

The assigned ordinary-cover dependency and the finite certificate targets are
not themselves blockers merely because they lack implementations. Do not
require proof of all finite certificates before packaging. Their signatures
must still retain the actual cover and marked embedding data.

## Remaining signatures

Static presence checks are useful for resuming, but do **not** certify that
all mathematical clauses or tests have been faithfully typed:

| Layer | Named API present | Test labels present |
| --- | --- | --- |
| RS.1 | 29/29 | 21/21 |
| RS.2 | 29/29 | 21/21 |
| RS.3 | 21/28 | 19/24 |
| RS.4 | 21/22 | 15/18 |
| RS.5 | 0/4 | 0/3 |
| RS.6 | 0/12 | 0/9 |

- RS.3: `finite_level_action`, `degree_orbit_set`,
  `discrete_action_choice`, `bounded_degree_slice_preimage`,
  `power_fixed_degree_orbits`, `power_fixed_degree_weighted_sum`, and all three
  degree-orbit API lemmas remain. Missing tests are discrete-action tests 2–3
  and degree-orbit tests 1–3. The torsor prototype is general: retain the
  field-generator realization and its outward supplier boundary.
- RS.4: the actual `fixed_fiber_equation`, `all_fixed_fibers`,
  `odd_parity_fiber`, `even_parity_fiber`, `affine_compatible_parities`,
  `surviving_parities`, and `independent_classes` remain. Add
  `square_obstruction_compatibility`, square-obstruction test 3 and square-map
  tests 2–3. The saved generic square product and two-adic equation are useful
  algebraic interfaces; they still need adapters to compatible degrees,
  the actual fixed-point fibers and the reduced multiplier. A formal square
  product cannot make an incompatible degree fiber nonempty.
- RS.5: only `split_homology_surjection` is present. Type the primary-support,
  unique coprime splitting, characteristic Hall preimage, compatible covers,
  inertia classes, abelianization, relation surjection, reduced kernel and
  correction/action comparison targets, with the four compatible-cover API
  lemmas and three tests.
- RS.6: the centralizer homomorphism and generator-reduction theorem are
  present. The reduction certificate, finite parity algorithm, odd-index-two
  reduction, order-96 marked type and multiplier, and all 31 table-row
  certificates remain, with their 12 API lemmas and nine tests. Use executable
  finite group data and an independently certified cover; keep ST.3 ownership
  of embedded types and ST.5 ownership of limits. Do not replace a marked
  embedding by an abstract group name.

Resume by resolving the two owners through a suitably scoped plan amendment,
then bind the homological contracts to those supplying layers and check tier
order. Audit the saved RS.1–RS.2 signatures against every clause of the
README, not just their names. Continue the remaining inventory above using
the unchanged packet and original omission ledger. Keep generation hypotheses,
arbitrary kernels, the inverse marking discrepancy, coordinate permutation,
nonempty-fiber conditions, incoming LHS differential and the order-96 sum
condition. No ownership moves or extra targets were added in this checkpoint.

## Validation

The final command

```text
lean-check research/blueprint/packages/InductionRestrictionPartII/Suggested.lean
```

exited **0**, with **266 warnings, all `declaration uses sorry`**, no errors
and no other warnings. Available memory was 100 GB before the final run. Only
one check ran at a time, through the supplied shared wrapper. No language
server, build, update, cache fetch or compilation in the current read-only
roadmap environment was used. This validates only the saved prototypes.

The pinned build uses Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. All 30 baseline declaration
statements were inspected; their 18 source modules match those pins. The
reviewed library-coverage audit has no direct entry for this Part II; its
related projective-representation audits consume the parent's ordinary-cover
layer and existing cohomology interfaces.

Current Tau Ceti was checked at
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`; current roadmap main at
`3c18d9fbfceed0dc5c1edb1070a3927152d19e28`, including the newer roadmaps
absent from the atlas snapshot. The full upstream InductionRestriction and
SchurWeyl READMEs were read. The current roadmap suggested files were searched
for the missing suppliers. Profinite cohomological five-term results and
injective-coefficient topological UCT do not meet the required contracts.

The unchanged packet passed
`python3 scripts/check_blueprint.py research/blueprint/packets/InductionRestrictionPartII.json`
with **0 errors, 0 warnings**: 109 nodes, six planned stages, five gaps, one
request, zero closed stages. This is validation of the input, not closure.
Static README checks found every target, API name and test name.

`python3 research/blueprint/intake.py check-files` passed for the three changed
deliverables with 0 problems; `git diff --check` passed. Only the README,
suggested file and this handoff are changed; metadata is absent.

## Sources and reproducibility

Fresh public-source checks covered Wood's lifting construction and comparison
(§2, pp.2–4), twists and finite-level action (§4, pp.6–8, equation (4), Remark
4.1); Wood's fixed-fiber equation and parity dependence (§4.1, pp.399–401,
Proposition 4.1, equations (5)–(6), Remark 4.2); EVW §§7.2–7.5, pp.32–37,
and §8.1.6–7 for the action distinction; and published LWZB Lemma 12.10,
PDF pp.62–63, with the subsequent comparison on p.64. This is not a new
independent source review of all 109 targets.

| Source | Public URL | SHA-256 |
| --- | --- | --- |
| Wood lifting (2021), 13-page author copy | https://par.nsf.gov/servlets/purl/10253245 | `b91c78e56701615e9ccb30ed71e3ede9888b49ee984ceb0d59ae959a2d32d4ea` |
| Wood, Duke (2019) | https://par.nsf.gov/servlets/purl/10152050 | `154e700c1b634b9e9bde4334a19678d05ff98ca18efb6b07cb5b809f2da9c03d` |
| EVW, withdrawn v1 (2012) | https://arxiv.org/pdf/1212.0923v1 | `3cd5624f85450b06f4be8b37d08fb480dde8dc7c68f9a5bd7ffc57c15c04a4e4` |
| LWZB v2 (2022) | https://arxiv.org/pdf/1907.05002v2 | `7f1e85da49b23f80fc7abe9a68dbc5384ab216dfa5d55cd5e3223ba3268abed9` |
| LWZB published (2024) | https://par.nsf.gov/servlets/purl/10509628 | `64295273b34676cb6fd0f1de5fc643d1744e3359f94382ea77303903cdb6dc91` |

No restricted source was used. No source passages or files were added to the
repository. Scratch PDFs and logs are removed after submission; the commands,
results, pins, source identities and remaining work above support resumption.
