# Potential automorphy infrastructure: second package review

**Verdict: needs_changes.** Independent review by **Codex — codex-QiWdWR**,
2026-10-10, for issue #7940. This session authored neither package round.
This is a completed review, not a checkpoint.

The README preserves the accepted mathematics and the revision improves several
local signatures. I corrected the umbrella Mathlib import and a published-edition
source link. The principal finding of the first review remains: almost every
arithmetic theorem and more than half the definition targets lack Lean
signatures. Successful elaboration of the local cores does not discharge item 5
of the review issue or PROTOCOL sections 13 and 20.

| Required check | Result | Evidence |
| --- | --- | --- |
| 1. Upstream presentation and size | Pass | Introduction, ownership, conventions, source-linked targets, APIs, checks and dependencies; six layers in dependency order. README is 199,597 UTF-8 bytes, below 200,000. |
| 2. Fidelity and boundaries | Pass for the mathematical specification | All 123 accepted targets, 122 API names and 90 test names occur. Statements and embedded hypotheses are preserved. The additional auxiliary-field theorem supplies the field constructions already required by the plan. |
| 3. Own words and locators | Pass | Mathematical contracts are restated, rather than source passages or a sequential digest of a paper. Every accepted target retains section/theorem/page locators. The new auxiliary result has directly checked primary citations. |
| 4. No process in the roadmap | Pass | No packet paths, job identifiers, review histories, checkpoints or coverage statuses in README. |
| 5. Suggested Lean file | **Fail: absent signatures and arithmetic adapters** | Final `lean-check` exits 0: 97 `sorry` warnings, no errors, no other warnings. Only 13 of 29 definition target names and 1 of 94 theorem target names have declarations. |
| 6. Metadata | Pass | Exactly `topic = "math.NT"` and a newline. |

## Review method and mathematical comparison

I read the current worker instructions, binding protocols and upstream guide,
the complete claimed issue, the first review and verdict, the revision handoff,
the accepted packet, package, library audit and touching link maps. I compared
the upstream LocalGaloisGroups and RepresentationTheory/ClassicalGroups readers
for presentation and convention density, and read the relevant current supplier
signatures described below. Neither upstream repository was changed or built.

Each accepted target was matched to its README anchor, statement, hypotheses,
source, prerequisites and, for definitions, API and checks. After Markdown
escape normalization, 82 first-paragraph statements agree word for word; the
remaining 41 were compared individually. Their differences remove source-error
annotations, replace old stage or item references with the reordered layers,
clarify equivalent notation, or make implicit conditions explicit. In
particular, rank-zero weights are separated from the positive-rank dominance
test, and rank-two oddness uses characteristic-zero coefficients. Both are
faithful to the intended objects. The four edited API descriptions and the
edited selected-root check retain the corresponding mathematical conditions.

The seventeen Fontaine–Laffaille and fifteen ordinary good-level clauses remain
available in full. Their use by the Hida, deformation and patching targets is
retained. The global lifting statements keep their distinct prime bounds,
residual-image conditions, scalar element, labelled weights and unramifiedness
conclusions. They do not acquire a polarization assumption. Ordinary inertia
agreement on an open subgroup is distinguished from stronger good-level data.
The coefficient-dual convention keeps integral derived Hom and restricts the
ordinary degree-reflection formula to rational coefficients.

Relative Bruhat length still counts places of F⁺, while absolute length includes
local degrees. Left Levi cosets use inverse-increasing shuffles. Ordinary
characters retain both reversed weights and the cyclotomic factor, including
their chosen-uniformizer values. The Satake-image restriction and the separate
polynomial-law transfer requirement survive. Patching constructs and verifies
arithmetic data for the abstract support theorem; it does not infer integral
ring equality from support or assume the lifting conclusion. Rank-two residual
large image retains its prime-field subgroup conclusion and the separate
Artin-up-to-twist alternative.

The PA.5 transport prefix is now Layer 2, before its ordinary and lifting
consumers. The PA.3 conditional support interface is in Layer 4, before the
Layer 5 verification. This resolves the old reading order without changing
ownership. The Chebotarev edge CH-L15 into PA.4 still supplies only auxiliary
prime existence, with compatibility, arithmetic duality and tower bounds
required independently. I found no new conflicting link.

The added `auxiliary_cm_extension_prescriptions` has three distinct conclusions:
soluble local realization over a number field; cyclic degree-N realization
with split places and avoidance; and its CM specialization through the totally
real subfield. It does not assert that arbitrary local data give a CM extension.
These are supporting steps for the accepted field-construction targets, rather
than a new automorphy conclusion. The construction and its three checks are
supported by the primary sources below. Its Lean signature is also absent.

## Sources and current suppliers

I compared all accepted source locators with the README. This review does not
re-adjudicate the accepted plan's 77 source findings. The following fresh source
checks cover the new target and the most consequential normalizations.

| Primary source | Locations and verification |
| --- | --- |
| [Clozel–Harris–Taylor, published paper](https://www.numdam.org/item/10.1007/s10240-008-0016-1.pdf) | Lemmas 4.1.1–4.1.2, p. 116, proof p. 117: finite local character extension and soluble Galois realization with exact completions and avoidance. |
| [BLGGT, published paper](https://annals.math.princeton.edu/wp-content/uploads/annals-v179-n2-p03-p.pdf) | Appendix A.2, Lemmas A.2.1–A.2.2 and Corollary A.2.3, pp. 600–601: local realization, degree-N cyclic splitting, and CM specialization. §2.1, pp. 537–538: normalized ordinary operators and independence of local uniformizer. |
| [Allen et al., published CM-field paper](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf) | Corollary 5.5.2, p. 1028: arithmetic ordinary characters and flag. Theorems 6.1.1–6.1.2 and Remark 6.1.3, pp. 1029–1030: lifting hypotheses, weight conventions and the distinction between the two unramifiedness conclusions. |

The auxiliary-field reference had published page numbers but linked to the
BLGGT preprint anchor. I changed it to the published-edition anchor. No source
passage was added, and no restricted-library book was used or copied.

The ten baseline declarations were read at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174`: categorical retract and its functor
map, derived category and localization functor, module support, matrix
characteristic polynomial, surjective Goursat lemma, permutation group,
finite block exchange and finite-field PSL₂ simplicity. They have the scopes
claimed by the plan. In particular, Goursat requires both projections to be
surjective, PSL₂ simplicity requires cardinality at least four, and module
support is defined through nontrivial localizations. No arithmetic carrier
follows from these declarations alone. Searches in Tau Ceti at
`f790474821cf4256814db967cb154e7af3d0c369` did not locate the named
Fontaine–Laffaille, ultrapatching, decomposed-genericity, CTG or compatible-system
carriers. This bounded name search is not an exhaustive absence proof.

Current TauCetiRoadmap main, commit
`dea8191cc6047d6142a65872ebce6eeeb841a29b`, confirms the changed ownership:

- SmoothRepresentationsOfLocalGroups SR.6.5 owns stable operators. Its
  `Suggested.lean` defines `StableOperator` and states `StableOperator.split`;
  its README also plans `StableOperator.invertiblePart` and `dual`. Those latter
  names are not supplied as signatures in that file. They must not be counted
  as implemented APIs or duplicated here.
- IntegralHeckeAndGaloisDeterminants §2.3 states
  `Theorems.factorial_powers` with complete local Noetherian coefficients and
  finite residue field, and `Theorems.ordinary_finite` for bounded finite
  cohomology over an Artinian local base. Its operator localization supplies
  the derived telescope. The package's remaining target is their application
  to the actual arithmetic level, diamonds and Hecke image.
- ReductiveGroupsPartII RG2.3 supplies `LevelSubgroups.integralGL`, `iwahori`
  and `proPIwahori`; integral invertibility and valuation hypotheses are part
  of those signatures. This package adds the two depths and adelic tower.
  General Bruhat theory stays in RG2.4; compact Siegel charts and indexed
  length comparisons remain arithmetic applications here.
- ClassicalGroups and LieHighestWeight supply characteristic-zero theory,
  rather than the integral dual-Weyl lattices required by the coefficient
  comparisons. LocalFieldsRamification Layer 4 supplies wild pro-p inertia
  and tame procyclic inertia for the finite local solvability argument.

The seven gaps and 36 supplier requests of the accepted plan remain concrete
mathematical requirements. This review does not invent exports for integral
highest-weight modules, classify arithmetic PGL₂ forms through Weil restriction
alone, or treat Geraghty's two transport lemmas as proved by the definition of
ordinarity.

## Remaining signature work

The revision handoff describes an instruction permitting representative-only
coverage. The current author issue, current review issue and checkout's
PROTOCOL do not contain that exception. Section 13 requires the definitions,
API items, examples and named theorems; section 20 applies that requirement to
the final package. The standard non-exhaustive header permits further library
development, but does not remove those specified signatures.

The audit removes Lean comments before counting declarations and distinguishes
target names from namespaces. Counts below are presence counts, not claims
that every present local core implements the full arithmetic target.

| Accepted stage | Definition targets | Definition names declared | Theorem targets | Theorem names declared |
| --- | ---: | ---: | ---: | ---: |
| PA.0 | 2 | 2 | 6 | 0 |
| PA.1 | 2 | 2 | 13 | 1 |
| PA.2 | 17 | 6 | 30 | 0 |
| PA.3 | 1 | 0 | 5 | 0 |
| PA.4 | 4 | 1 | 21 | 0 |
| PA.5 | 3 | 2 | 19 | 0 |
| Total | 29 | 13 | 94 | 1 |

The only declared theorem target is `shifted_partition_recovery`. All other 93
accepted theorem targets are absent, including both local–global comparisons,
both patching verifications and both global lifting theorems.

The following sixteen definition targets have no declaration:

`ArithmeticOrdinarySummand`, `LocalOrdinaryParts`,
`CompletedArithmeticCohomology`, `CompletedOrdinaryCohomology`,
`UnitaryOrdinaryTower`, `UnitaryCompletedBoundary`, `BruhatCellInduction`,
`BruhatUnipotentInvariants`, `DeterminantTorus`, `OrdinaryHidaComplex`,
`TaylorWilesSelectedIdeals`, `WeightIndependentHidaTwist`,
`OrdinaryTaylorWilesLevels`, `IotaOrdinary`, `OrdinarilyAutomorphic`,
`WeaklyAutomorphicPrimeTo`.

The `WeightIndependentHidaTwist` namespace contains the integer row `nu`, but
not the required derived tensor construction. A namespace is not a definition.
Removing the old generic ordinary-summand core avoids duplicating the supplier;
it leaves the arithmetic summand to be typed, rather than discharging it.

Of 122 API names, 45 are explicit declarations and the generated
`EquivariantRetract.toRetract` projection supplies one more: **46/122** names.
Of 90 named checks, **42/90** have labelled Lean examples. There are 49 examples
overall, including seven additional unlabelled arithmetic/numeric checks.
These generous counts still include partial cores. Concrete distinctions are:

- `CTGWeight` operates on a supplied weight table; it lacks the calculated
  algebraic-weight adapter and `no_cuspidal_levi_weight` comparison.
- `OrdinaryGaloisCharacters` constructs homomorphisms on unit/valuation
  coordinates. The new `unique_from_units_and_uniformizer` and
  `coordinate_uniformizer_change` are useful algebraic lemmas, but do not
  supply the packet's `unique` and `change_uniformizer` statements about
  continuous Galois characters and their arithmetic Hecke normalization.
- The Iwahori congruence subgroups and diamond quotient have local signatures;
  `transition` and `ordinaryOperator` on the adelic cohomology tower are absent.
- `LowestWeightCharacter` evaluates a character. Its integral coefficient
  `projection` and comparison with ordinary cohomology remain absent.
- `BruhatOrientationCharacter.formula` evaluates a nonzero Qₚ determinant
  character. The actual Lie-space determinant, algebraic/unramified splitting
  and torus-action twist have no arithmetic signatures.
- `TaylorWilesArithmeticLevels.trace_scalar` calculates a finite flag index.
  It does not type the cohomological pullback/trace and selected-root
  comparison. The `old_bad_place` check is absent; the extra numeric root
  normalization check does not replace the selected-ideal API.
- Rank-two Hodge multisets and determinant families are valid local cores;
  their compatible-system and automorphic-realization adapters remain work.

To resolve item 5, import the actual existing owner APIs, supply genuinely
missing carrier constructions in their assigned layers, and type the
arithmetic definitions and adapters above. Then state the target theorems,
remaining API items and discriminating examples with their named hypotheses,
coefficients, actions and shifts. Do not replace them with arbitrary
propositions, assume the requested conclusion, weaken them to numeric
identities, or duplicate a general supplier theory. If an unavailable condition
must be omitted in a prototype, record that limitation honestly; it does not
establish full agreement with the README target.

## Corrections and validation

I replaced `import Mathlib` with individual Mathlib module imports. This is the
only Lean change; no signature was weakened. The final check was run through
`lean-check`, with more than 20 GB memory available and one check at a time.
The wrapper selects the shared pinned build; its Mathlib checkout was confirmed
at the exact commit above. The file imports no Tau Ceti module, so this run
checks its Mathlib-only prototypes and does not exercise arithmetic Tau Ceti
interfaces. Final result: exit 0, 97 `sorry` warnings, zero other warnings,
zero errors.

`python3 scripts/check_blueprint.py
research/blueprint/packets/PotentialAutomorphyInfrastructure.json` reports zero
errors and zero warnings. Its 123 nodes, 29 definitions, 94 theorems, 122 API
items, 90 checks, seven gaps and 36 requests agree with the comparison above.
This validator result is not proof of mathematical closure or signature
completeness. The accepted packet and original reader/suggested files were not
edited. The package verdict is therefore `needs_changes`.
