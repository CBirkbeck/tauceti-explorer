# Potential automorphy infrastructure package

Completed by Codex — codex-qhZ7N4 on 2026-10-08, for issue #7480.

## Done

The package joins the accepted plan into six ordered layers, PA.0–PA.5. Its
README contains all 123 targets (94 theorems and 29 definition/constructions),
all 122 API items and all 90 tests. The 198,532-byte document groups the targets
by mathematical construction, states their hypotheses and conventions, names
their supplier layers, and supplies theorem/section/page locators. Its supplier
interface section retains the accepted proof boundaries rather than replacing
missing arithmetic objects by unspecified propositions. The metadata is
`topic = "math.NT"`.

Suggested.lean has one header and import block, consistent declaration names,
the accepted typed local cores, and the full arithmetic contracts. The README
and those contracts consistently retain the geometric reciprocity and Hodge
conventions, the dual degree shift, the distinction between relative and
absolute Bruhat length, Satake-image scope, variable global determinant, and
the prime-field conclusion in the rank-two large-image theorem. The independent
PA.5 transport prefix precedes its uses in PA.2 and PA.4; the PA.3 support
criterion is conditional on the arithmetic pair verified in PA.4.

No packet, reader, supplier roadmap or atlas data was changed. ReductiveGroups
and Multiquadratic were read in full as the two upstream roadmap examples.
The reviewed library audit and the cited baseline Mathlib declarations were
checked at the pinned revision. The public ACC, Qian, BCGNT, BCGP, BLGGT,
Chenevier and Khare–Thorne passages needed for the principal interfaces and
normalizations were checked directly. No source passage is reproduced.

## Validation

- `python3 scripts/check_blueprint.py research/blueprint/packets/PotentialAutomorphyInfrastructure.json`
  passes: zero errors and zero warnings. It reports six planned layers,
  123 nodes, 90 tests, 34 planets, seven gaps and 36 upstream requests.
- `lean-check research/blueprint/packages/PotentialAutomorphyInfrastructure/Suggested.lean`
  completed successfully twice. The final check reports 92 declaration-uses-
  `sorry` warnings, no errors and no other warnings. The final subsequent
  changes only clarify the README's uniformizer notation and definition/API
  construction order and remove duplicate bibliography punctuation.
- A completeness check verifies every target anchor and declaration name,
  every API/test name, and every API/test mathematical statement against the
  accepted input. The README has six ordered layers and no programme-process
  or private-path references.

The elaboration uses the shared build's pinned Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174`. Suggested.lean imports only Mathlib;
no Tau Ceti declaration is imported. The shared Tau Ceti checkout differs from
the requested `f790474821cf4256814db967cb154e7af3d0c369`, so this check does not
establish compatibility of future arithmetic imports at that Tau Ceti pin.
In particular, successful elaboration applies to the typed local cores and
examples, not the arithmetic contracts recorded as comments. No theorem is
claimed as implemented or proved.

## What remains and where to resume

The package deliverables are complete; the next step is their independent
package review. Start with the README's conventions, construction order and
supplier-interface section, then compare Suggested.lean's typed prototypes
with its arithmetic contract comments. The latter preserve the accepted
limitations permitted by PROTOCOL section 13; they are not elaborated global
signatures.

The seven inherited boundaries remain visible:

1. Integral highest-weight modules, lattice splittings and lowest-weight
   projections require ReductiveGroupsIntegralRepresentationsPartII; no
   unrelated existing layer is assigned to them.
2. Arithmetic carriers and adapters require their named suppliers. R24.5 must
   reconcile all-member Hodge metadata with weakened compatibility, and export
   the integral-lattice, reduction and Weil–Deligne operations used here.
3. Geraghty's primary twisted-Steinberg eigenvalue and nonsplit ordinary soluble
   transport statements (Lemmas 5.2 and 5.7) remain source leaves. The accessible
   ordinary definition and split-local argument do not establish both leaves.
4. Henniart/Serre rank-one classification and Larsen–Pink/Larsen monodromy
   inputs need the extremely weak, arbitrary-number-field versions from R24.5.
5. Uniform arithmetic free diamond-cell models, common minimal-rank bounds and
   compatible derived reconstruction must be proved before applying patching;
   they are not inferred for arbitrary good non-neat quotients.
6. Ordinary determinant transfer needs the polynomial-law/kernel argument over
   the larger GLₙ Hecke algebra. The unitary map onto its Satake image alone
   does not give Proposition 5.4.18's identities there.
7. Classification of unramified forms of products of PGL₂ needs the arithmetic
   reductive-group forms interface. ReductiveGroupsPartII:RG2.0a supplies Weil
   restriction, not that classification.

These are inherited mathematical implementation and source obligations, not
unfinished packaging tasks. Their exact exports and consumers are in the
README. No scratch artifact is needed to resume review.
