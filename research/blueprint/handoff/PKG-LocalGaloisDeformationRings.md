# PKG-LocalGaloisDeformationRings

Issue: #7479. Agent: Codex, session `codex-OvUjK6`.

## Deliverables and scope

The package is complete as a presentation of the accepted plan and is ready for
`REV-PKG-LocalGaloisDeformationRings`. Its three files are:

- `research/blueprint/packages/LocalGaloisDeformationRings/README.md`;
- `research/blueprint/packages/LocalGaloisDeformationRings/Suggested.lean`;
- `research/blueprint/packages/LocalGaloisDeformationRings/metadata.toml`.

The README contains all 157 targets, all 247 API items and all 162 definition /
construction tests. Each target has a source locator and its prerequisites.
There are 157 numbered target anchors and 429 internal prerequisite links; all
links resolve. The file is 197,789 bytes, below the 200,000-byte limit. Metadata
is exactly `topic = "math.NT"` with a final newline.

The accepted packet, its reader and its suggested file were inputs and were not
edited. The packet's acceptance is `independent-review-REV-LocalGaloisDeformationRings~2`,
8 October 2026. Its scope has eight planned stages, 10 recorded gaps and 22
requests; none of its stages is closed. Packaging does not discharge those gaps
or assert that the mathematics has been formalised.

## Structure and ownership

WORKERS, both protocols and UPSTREAM_GUIDE were read. The full upstream
ReductiveGroups and Multiquadratic roadmaps supplied structural examples; the
RepresentationTheory roadmap was also read. The package is organized by local
mathematical dependencies rather than by source chapters.

| Package layer | Accepted-plan scope |
| --- | --- |
| 1 | R08.1, bounded-height lattices and their moduli, Fontaine–Laffaille conditions, ordinary weights, the general-group ordinary condition, character coefficients and ordinary flag construction |
| 2 | R08.2 |
| 3 | R08.3 and the semistable-ordinary quotient |
| 4 | R08.4 |
| 5 | R08.5 |
| 6 | The remaining L7 targets |
| 7 | The remaining L8 targets |
| 8 | R08.6 |

All prerequisites owned by this roadmap occur before their uses. Moving the
coefficient, lattice and flag prerequisites avoids treating the original stage
order as a dependency order. External prerequisites retain their roadmap and
layer addresses. Global representability, period predicates, finite-flat / FL /
Kisin categories, general moduli, group schemes, algebraization and patching
remain with their existing owners.

The README gives the required supplier interfaces in mathematical terms. In
particular the GL₃ theorem for shapes of length at most one and the uniform
prime assignment retain the weak minimal patching functor, globalization and
weight-elimination hypotheses. The local length-greater-than-one chart
calculation is distinguished from that global argument.

## Conventions and mathematical checks

The README reconciles the accepted sources' Hodge–Tate and reciprocity
conventions and retains the corrected small-rank equations. Points that deserve
particular attention in the package review are:

- `HT(ε)=+1` throughout the normalized statements. The model
  `ρ_{n,m,0}` has weights `0,−m,…,−(n−1)m` here; the source's positive list is
  labelled as its opposite convention, including in the API and worked test.
  Covariant Fontaine–Laffaille jumps, dual Tate modules, and the KW versus
  Caraiani–Newton ordinary flags retain their separate dictionaries.
- The accepted ordinary-weight hypothesis calls the upstream ClassFieldTheory
  Artin map geometric. Its actual Layer 7 specifies arithmetic reciprocity.
  The package explicitly uses the inverse of that map for the geometric
  ordinary-character formulas; it does not change the upstream roadmap.
- The GSp₄ Ihara result fixes the similitude: integral dimension 11 and generic
  dimension 10. Allowing the multiplier to vary adds one variable. The
  odd-prime and away-from-p hypotheses are explicit.
- Dotto's mod-p cycle comparison uses odd coefficient characteristic. Its
  even-rank application identifies the *reduced* special-fibre subschemes;
  equality of cycles does not prove either original fibre reduced. The cycle
  maps, geometric-component coefficient assumption and type-transfer supplier
  are stated.
- Kisin's normality / reducedness theorem concerns reduction modulo the
  coefficient uniformizer. The fibre over the closed deformation point is a
  different scheme and can be reducible. The exact naive=flat multiplicity
  conditions are retained.
- Ordinary flags require ordered graded characters, and determinant ordinarity
  includes every ordered-product identity as well as characteristic polynomials.
  The ordinary-flag and determinant comparisons retain their different degree
  bounds and their reduced / topological scope. The odd-prime restriction on
  the flag isomorphism and fibre regularity is explicit.
- Full inertia types retain monodromy; flat closures can contain points with
  dropped monodromy. The unique-component hypothesis is retained whenever
  component membership is used to compare full types.
- The GL₃ comparison uses a common framed gauge ring. It does not invent a map
  from the explicit chart ring to the type deformation ring. The shape rows,
  unit coefficients, identity-shape cubic relation, corrected prime generators
  and graph-distance formula are included.
- The level-raising node retains the even-parity nodal case and the different
  odd-parity smooth case. The characteristic-three correction in the GSp₄
  truncated exponential is retained.

Citations distinguish the reviewed manuscript, author-copy and journal
numberings. This job checked selected public source statements, including
Böckle–Iyengar–Paškūnas Lemma 5.3 and the BLGGT connection definitions. BLGGT's
locator was completed to §1.3 p. 21 and §1.4 p. 26 in arXiv v4. The package does
not claim a fresh line-by-line verification of all forty bibliographic inputs;
it uses the accepted mathematical plan and its version concordances. No
restricted book was needed, and no source passage is reproduced.

## Suggested Lean file and inherited limitations

The file has one header and one block of individual Mathlib imports, consistent
namespaces, proof placeholders and concrete arithmetic / matrix checks. Its
complete final inventory records every target, API name, test name, full
statement, hypothesis, supplier and locator; the original truncated inventory
has been replaced. There are 103 typed examples, 85 theorem forms, 60 definitions
and six structures in the code portion. These counts are **not** counts of fully
expressed target theorems: several signatures are coordinate or algebraic
consequences, and supplier-dependent statements remain in the inventory, as the
accepted plan's Suggested-file gap already records.

Prototype corrections and distinctions:

- `HodgeMultiplicityProfile` keeps graded multiplicities, not labelled jumps
  and filtrations. The earlier profile cannot serve as a full Hodge type.
  Consequently the under-specified period-quotient signatures have been left in
  the full inventory instead of asserting them for that profile.
- `OpenKernelInertiaData` keeps the inertia representation and its open kernel.
  A full Galois type also requires compatibility with a Weil extension.
- `RamificationSets` keeps only the two finite sets; it is not the full
  polarized rigidity predicate `IsRigidFor`.
- Full flags carry a free-module rank witness and direct-summand conditions.
  A bare `finrank` condition over arbitrary coefficient rings does not supply
  that witness. The tensor-base-change API now has identity, composition and
  incidence compatibility signatures.
- A tame matrix relation alone is insufficient to construct an arbitrary
  continuous representation: the complete coefficient topology and pro-p
  inertia condition are also needed. The incomplete constructor is omitted;
  its full interface remains in the inventory. Equality on dense generators
  now explicitly assumes continuity.
- A universal ordinary coefficient ring requires the completed group algebra
  and the selected minimal-prime intersection. The under-specified coefficient
  carrier signatures were omitted in favor of their complete inventory.
- The special-fibre-domain implication explicitly assumes adic completeness;
  it is not used as a replacement for Kisin's component comparison.
- The symplectic similitude predicate requires a unit multiplier. Determinant
  equations have a coefficient-map lemma, and the common-component relation
  has an injective-coefficient-extension lemma.

The `Lift`, `LiftingRing` and coefficient adapters retain the supplier ownership
stated in the header and inventory. They are suggested carrier forms; the
coefficient category, residue-field identification, continuity and finiteness
hypotheses in the inventory are part of the eventual full signatures. A
coordinate statement must not be promoted as the full theorem merely because
Lean elaborates it. In particular the package neither claims 247 fully typed API
lemmas nor claims that the 10 gaps are closed. Missing mathematical conditions
are not represented by unspecified `Prop` fields or `def _ : Prop := sorry`.

## Baseline and validation

The reviewed library audit was consulted. There is no direct LocalGalois layer
entry in `data/library-coverage.json`; the relevant R03.1/R03.2 algebra entries
were read. Existing power-series evaluation, adic completeness and residue-field
infrastructure are reused rather than planned again. The baseline declarations
cited in the reader were inspected at Mathlib `082e2d3` and Tau Ceti `f790474`.
Tau Ceti's additive `H2` does not by itself supply the missing coefficient-linear,
natural-topology continuous-cohomology comparison.

Open Mathlib PRs were searched. PR
[37940](https://github.com/leanprover-community/mathlib4/pull/37940) develops the
local-extension and Artinian base categories relevant to the supplier's
coefficient categories; it is not in the pinned baseline. This should be
considered when replacing the supplier adapter. The Lean Zulip search did not
provide a readable direct thread; no absence claim rests on that search.

Checks run:

- `python3 scripts/check_blueprint.py research/blueprint/packets/LocalGaloisDeformationRings.json`:
  **0 errors, 0 warnings**; 157 nodes, 247 API items, 162 tests, 43 planets,
  eight planned stages, 10 gaps and 22 requests.
- `lean-check research/blueprint/packages/LocalGaloisDeformationRings/Suggested.lean`:
  **exit 0, no errors, 120 warnings, all `declaration uses sorry`**. The checked
  code includes the corrected full-flag rank witness and similitude predicate.
  Only the BLGGT citation in a comment changed after this final elaboration.
- The shared build's Mathlib commit is exactly
  `082e2d37e8b0463410cdb532e111cd43d5a66174`. Its Tau Ceti checkout is ahead of
  the stipulated Tau Ceti pin, but this file imports **no TauCeti modules**.
  Thus elaboration uses precisely the pinned Mathlib interface and does not
  depend on any later Tau Ceti declarations. No library build or update ran.
- Memory exceeded 20 GB before each serial Lean check; no language server or
  background check remains. Scratch stayed below 1 GB.
- Programmatic checks confirm the README size, 157 target/source sections,
  prerequisite order, all internal links, all API/test names in the inventory,
  one import block and valid TOML. Private-path and placeholder scans passed.

## Remaining work and resumption

No package deliverable remains unfinished. Independent review should compare the
numbered targets and prototype distinctions above against the accepted plan and
repeat `lean-check`.

The ten inherited gaps remain the accepted plan's work: local models, BT generic
reducedness, natural-topology cohomology, integral reductive-group/Lie theory,
endpoint classification, division-algebra type transfer, relative Borels,
completion of the suggested signatures, family admissibility and GL₃ weak
patching. Their precise requests and per-stage refinements are in the unchanged
packet. The package supplies their mathematical interfaces without implying
that existing supplier stages have already proved them.

No scratch artifact is required to resume: the package, this note and the
unchanged accepted inputs contain the necessary information.
