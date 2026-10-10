# PKG-InductionRestrictionPartII — blocked checkpoint

Issue #7592. Worker: Codex (GPT-6), session `codex-Zo1X6j`, 2026-10-10.
Claim confirmed in issue comment 6099591939. This continues #8434 and #8480.
The package remains incomplete because two prerequisites in the accepted plan
have no assigned supplier. The saved Lean statements are admitted prototypes,
not implementations or proofs.

## Saved progress

This run adds 60 named declarations and six anonymous examples. The suggested
file now has 277 distinct named declarations and 82 anonymous examples.
The README retains all 109 targets, 124 API names and 96 test names in six
layers. Its additions explain the coordinate comparisons, finite-level
hypothesis, twisted degree projection and actual fixed-fiber carrier.

The new signatures include:

- The native action orbit quotient of the integer coordinate lattice, its
  projection/equality/slice API, and invariance under a change of torsor point.
  The two-class tests distinguish (1,4) from (2,3), while identifying (1,4)
  with (4,1). Explicit class and unit-group equivalences identify their
  permutation representation with the actual nonidentity classes of C₃.
- Fixed-coordinate vectors as integer functions on the native cyclic-action
  orbit quotient, with evaluation and the orbit-size-weighted total sum.
- Twisted degree slices as inverse images under a bundled equivariant map.
  The actual projection kernel has its power action, and its degree
  projection is bundled as an equivariant map to the coordinate lattice.
- Marked cover isomorphisms and genuine changes of marking. For a marking
  change by central factors a_d, the coordinate comparison multiplies the
  first coordinate by ∏ a_d^{m(d)}. `discrete_action_choice` intertwines the
  resulting actions. It does not assume that the two markings are equal.
- The |G|² cover exponent bound and action congruence for a general marked
  model with the explicit kernel-annihilation hypothesis. Specialization to
  the reduced multiplier still needs the homological supplier below.
- Actual pullback examples: the C₂ marked extension has trivial action;
  inversion on the S₃ transposition example fails multiplicativity on
  elements whose projections are two different transpositions.
- `marked_degree_fiber` and `fixed_degree_fiber` as subsets of the actual
  pullback. Nonempty degree fibers require the abelianization compatibility
  equation. The C₂ odd-class/zero-degree example remains empty despite a
  trivial square obstruction.
- Squares extracted from the actual extension, the inverse-sign fixed-fiber
  equation, and the finite fixed-point count with both compatibility and
  power-image membership in its conditional. A unit and its inverse have
  equal fixed subsets. Odd- and even-parity fibers have the stated torsion
  count, without any nonnegativity assumption on degrees.

RS.3 now has every target, API name and test label in the signature inventory.
RS.4's fixed-fiber and compatibility signatures are also present. The finite
bound remains conditional on its required mathematical input; name presence
is not closure or a semantic audit of all inherited statements.

## Completion blockers and scope

The authoritative packet expressly records:

1. **Natural integral homological bridge — supplier unassigned.** Required
   are the degree-two integral UCT for arbitrary abelian trivial-action
   kernels, including infinite kernels; naturality of its extension class
   map; evaluation of the oriented commuting cycle as XYX⁻¹Y⁻¹;
   central-extension homological five-term transgression; finite
   positive-degree integral homology and group-order annihilation; coprime
   degree-two LHS with its incoming d₃; and the Ext¹-vanishing adapter for
   free abelian groups. The parent Layer 7 is the ordinary-cover supplier,
   not the owner of this general bridge.
2. **Conjugacy of complements over a cyclic coprime quotient.** For finite
   coprime H,C with C cyclic, complements to H in H⋊C must be H-conjugate to
   the standard complement. The pinned Schur–Zassenhaus theorem gives
   existence alone. The published LWZB comparison on PDF p.64 needs
   conjugacy to identify the equal-order inertia classes.

No matching complete contract was found in current Tau Ceti or current
upstream roadmaps. The current library does contain useful *partial* input:
`TauCeti.groupHomology.transfer_comp_map_subtype_id`, in
`TauCeti/RepresentationTheory/Homological/GroupHomology/Transfer/Basic.lean`,
states that transfer followed by the inclusion map is the subgroup index
times the identity, in all degrees. Together with Mathlib's
`isZero_groupHomology_succ_of_subsingleton`, its trivial-subgroup case gives
an order-annihilation route. This transfer module is absent from the pinned
build. It is not an arbitrary-kernel UCT, finiteness theorem, homological
five-term sequence or coprime LHS theorem, so it does not resolve the bridge.
Do not re-plan that existing transfer construction when assigning the owner.

`TopCat.singularKroneckerEquiv` requires injective coefficients and concerns
singular cohomology. The current ProfiniteCohomology five-term interfaces
concern continuous cohomology. Neither meets this integral homological
contract. Current Frobenius-complement results impose additional hypotheses
and do not supply conjugacy for arbitrary cyclic coprime complements.

The issue permits only the three package files and this handoff, forbids
packet changes, and makes the accepted plan authoritative. A scope question
was raised during this run; no authorization to amend ownership was received.
Silently assigning a new supplier or enlarging the parent would violate that
scope. This checkpoint is submitted because of that dependency blocker,
independently of the remaining signature work or the run's time allowance.
No owner moves, packet edits or extra roadmap targets were made.

`metadata.toml` remains absent. Its eventual content is `topic = "math.GR"`.
The intake uses existence of all three package files to detect completion;
add metadata only when the entire package meets section 20. The README's
homological contracts are required mathematics, not assigned suppliers.
The ordinary-cover dependency already has an owner. Finite certificates are
future proof targets, not blockers merely because they are unproved.

## Remaining work and resumption

Resolve the two owners through a separately authorized amendment of the plan,
then bind the required contracts to supplying layers and check the tier order.
Preserve all source hypotheses and keep existing library constructions as
inputs. Do not take this checkpoint's conditional statements as discharging
the missing dependencies.

| Layer | Target names present | API names present | Test labels present |
| --- | --- | --- | --- |
| RS.1 | 14/14 | 29/29 | 21/21 |
| RS.2 | 16/16 | 29/29 | 21/21 |
| RS.3 | 11/11 | 28/28 | 24/24 |
| RS.4 | 16/19 | 22/22 | 16/18 |
| RS.5 | 1/11 | 0/4 | 0/3 |
| RS.6 | 2/38 | 0/12 | 0/9 |

These are static inventory counts, not mathematical certification. In
particular, some inherited tests cover only part of their reader contract.
Audit RS.1–RS.3 against every clause, not only the declaration names.

- RS.4: `affine_compatible_parities`, `surviving_parities` and
  `independent_classes` remain, together with square-map tests 2–3. Connect
  the existing generic rank count and two-adic survival criterion to the
  actual degree fibers and reduced multiplier. Require class representatives
  to represent their indexed inertia classes. Retain the signature translate,
  rather than treating every fiber as the identity-signature fiber.
- RS.5: only `split_homology_surjection` is present. Type primary support,
  unique coprime splitting, characteristic Hall preimage, compatible covers,
  inertia classes, abelianization, relation surjection, reduced kernel and
  correction/action comparison, including four compatible-cover API lemmas
  and three tests. Retain the possible incoming LHS differential.
- RS.6: centralizer commutator homomorphism and generator reduction are
  present. The reduction certificate, finite parity algorithm,
  odd-index-two reduction, order-96 marked type and reduced multiplier, and
  all 31 table-row certificates remain, with their 12 API lemmas and nine
  tests. Use executable finite group data and an independently certified
  ordinary cover. Preserve the order-96 sum-kernel condition and the actual
  embedding. ST.3 owns embedded arithmetic types; ST.5 owns limits.

The legacy suggested file retains its omission ledger in its original
location. It was not copied into the package. Arbitrary kernels, generation,
inverse marking discrepancy, permuted degrees and nonempty-fiber conditions
must survive all later adapters.

## Validation and library audit

The final command

```text
lean-check research/blueprint/packages/InductionRestrictionPartII/Suggested.lean
```

exited **0**, with **322 warnings, all `declaration uses sorry`**, no errors
and no other warnings. Available memory was 102 GB before the final check.
Checks ran sequentially through the shared wrapper. No language server,
build, update, cache fetch or compilation in the read-only current environment
was used. This validates the saved prototypes only.

The pinned build is Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. The inherited handoff recorded an
inspection of all 30 baseline declarations. This run checked the native orbit
relation/quotient, `Finsupp.domCongr`, `ZMod.unitOfCoprime`, `powMonoidHom`,
trivial-group positive homology and Schur–Zassenhaus statements at the pins.
The reviewed library-coverage audit has no direct entry for this Part II;
related projective-representation entries consume the parent's ordinary-cover
and factor-set interfaces.

Current Tau Ceti was read at
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`; current roadmap main at
`3c18d9fbfceed0dc5c1edb1070a3927152d19e28`. The upstream InductionRestriction
and SchurWeyl READMEs were read in full, and the current suggested files were
searched for the missing suppliers, including roadmaps newer than the atlas
snapshot. The current transfer and Kronecker statements were inspected.

The unchanged packet passed
`python3 scripts/check_blueprint.py research/blueprint/packets/InductionRestrictionPartII.json`
with **0 errors, 0 warnings**: 109 nodes, six planned stages, five gaps,
one request, zero closed stages. Every target, API name and test label is in
the README. This is input and inventory validation, not closure.

`python3 research/blueprint/intake.py check-files` passed for the three
changed deliverables with **0 problems**; `git diff --check` passed. Only the
README, suggested file and this handoff changed. Metadata remains absent.

## Sources

Fresh reading covered Wood's lifting-paper §4–4.1, author pp.6–8, equation
(4) and Remark 4.1, and Wood's Duke paper §4.1, printed pp.399–401,
Proposition 4.1, equation (6) and Remark 4.2. The coordinate correction,
compatibility check and inverse sign were checked there. The existing README
retains the earlier passage-specific source citations for other targets;
this run is not a new independent source audit of all 109 targets.

| Source | Public URL | SHA-256 |
| --- | --- | --- |
| Wood lifting (2021), 13-page author copy, read this run | https://par.nsf.gov/servlets/purl/10253245 | `b91c78e56701615e9ccb30ed71e3ede9888b49ee984ceb0d59ae959a2d32d4ea` |
| Wood, Duke (2019), read this run | https://par.nsf.gov/servlets/purl/10152050 | `154e700c1b634b9e9bde4334a19678d05ff98ca18efb6b07cb5b809f2da9c03d` |
| EVW, withdrawn v1 (2012), inherited source identity | https://arxiv.org/pdf/1212.0923v1 | `3cd5624f85450b06f4be8b37d08fb480dde8dc7c68f9a5bd7ffc57c15c04a4e4` |
| LWZB v2 (2022), inherited source identity | https://arxiv.org/pdf/1907.05002v2 | `7f1e85da49b23f80fc7abe9a68dbc5384ab216dfa5d55cd5e3223ba3268abed9` |
| LWZB published (2024), inherited source identity | https://par.nsf.gov/servlets/purl/10509628 | `64295273b34676cb6fd0f1de5fc643d1744e3359f94382ea77303903cdb6dc91` |

No restricted source was used. No source passage or source file was added to
the repository. Scratch sources and logs are removed after submission; this
note preserves the checks, source identities, blockers and resumption work.
