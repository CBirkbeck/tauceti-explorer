# FIX-RT-LINK-tauceti_TauCetiRoadmap_NumberFieldArithmetic

Codex · `codex-5ebb6f` · issue #5032 · 2026-09-30 · complete repair.

Both confirmed findings are fixed. The map now has 64 links (18 explicit,
46 inferred), ten overlaps and the original 212 examined entries. Three
new inferred input links are added; the original 61 links and ten overlaps
retain their contents.

## /1 — Finite compositum input to restricted ramification

Added `NFA-FIX-RT-1`: NumberFieldArithmetic Layer 1 →
ArithmeticGaloisDuality R02.3. The evidence quotes NFA1.5's unramified
compositum law and R02.3's construction of `G_{F,S}`, with exact source
paths and line locators. Updated the ArithmeticGaloisDuality examined
entry from `none` to `links`.

The input is closure under finite composita of extensions unramified at
finite places outside S, applied prime by prime. The consumer retains
normal finite subextensions/conjugation, the union in a fixed algebraic
closure, the Krull topology, absolute-Galois quotient and continuous
cohomology, including its archimedean/p-adic place conventions. No
infinite Galois group is attributed to the number-field supplier. This
matches the finite/infinite boundary already present in the accepted
NFA1 → IntegralIwasawaTheory L1 link. Broader consumer conventions for S
must not be narrowed merely to the finite-set signature of an auxiliary
library lemma.

## /2 — Discriminant and wild different inputs to descent

Added `NFA-FIX-RT-2a` and `NFA-FIX-RT-2b`: NumberFieldArithmetic Layers 4
and 6 → FaltingsFinitenessAndIsogenyTheorems R28.1. Updated its examined
entry to `links`, citing the independently accepted integrated child
`R28.1/hermite-minkowski-finiteness-of-extensions-unramified-outside-S`
and its explicit restricted-ramification gap.

Layer 4 supplies relative/absolute discriminant assembly, including the
already implemented tower formula, rather than a new proof of that formula.
Layer 6 supplies the planned number-field different bounds with wild
ramification allowed inside S. Its imports use the local/global different
transport in NFA5.9, the separate natural-number valuation/multiplicity
bridge in NFA6.4, and residue-degree-weighted assembly in NFA5.10.

The uniform degree-and-S discriminant bound, application of bounded-
discriminant finiteness and counting subfields of a fixed algebraic
closure remain consumer/import obligations. The accepted gap is preserved;
no tame-only estimate replaces the wild bound. If a general owner later
supplies the completed restricted-ramification finiteness theorem, factor
these routes through that owner. The link reasons explicitly state these
limits. No new mathematical node or roadmap is needed for this input-routing
repair, and the integrated Faltings decomposition is not edited.

## Evidence and review boundary

Base revision: `76be6c69ad4983a46291121e301564ded720d44b`. Input-map SHA256:
`28eda9a75a209959ed2575f52d6da5c8ceaecf4396477ff19dd82fb5fde18647`.
Read both findings and their confirmed reasons, the named supplier and
consumer contracts, NFA5.9/5.10, the accepted Faltings child and complete
gap record, and the existing IntegralIwasawa link. Consulted the relevant
reviewed AUDIT-04 targets/duplicate records for NFA1/4/6.

Freshly read these declarations with their parameters at the prescribed
pins:

- [Tau Ceti `TauCeti.relDiscr_tower`](https://github.com/CBirkbeck/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RingTheory/DedekindDomain/Discriminant/Separable.lean#L50): a Dedekind-domain tower with finite torsion-free modules and separability of the **top** fraction-field extension.
- [Mathlib `NumberField.finite_of_discr_bdd`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/NumberField/Discriminant/Basic.lean#L496): finitely many bounded-discriminant number-field subextensions of a fixed characteristic-zero field. The discriminant bound is an input.
- [Tau Ceti `NumberField.isUnramifiedAway_of_intermediateField`](https://github.com/CBirkbeck/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/NumberField/UnramifiedTower.lean#L53): descent of unramifiedness outside a finite set in a tower; it is not the compositum theorem or infinite restricted-ramification construction.

Both shared source checkouts were verified at those full pinned hashes.
This is a routing repair, not a new audit of all focal layers or a rereading
of the full Faltings/Milne source proofs. The quoted endpoint documents are
public repository sources; all six quotes match their raw source locators.

The former independent acceptance is preserved under `reviewHistory`.
The current revision's review is pending: the new links need independent
acceptance before promotion. No independent verdict is claimed by this fixer.

## Validation

`check_links.py` reports zero errors and warnings. Intake `check-files`
on the two changed deliverables reports zero problems. JSON parsing, six
exact quote/locator checks, unique endpoint-pair checks, unchanged original
links/overlaps and unrelated examined notes, preserved review history, and
`git diff --check` pass.

The production assembler, run in memory, has 2,840 stages and 8,254 distinct
baseline edges, with none of the three new pairs present. A scratch-only
simulation of future independent acceptance/promotion has 8,257 edges:
exactly the three new pairs, all included in the consumer `requires` lists.
Both full graphs pass acyclicity including external proof endpoints (2,891
candidate endpoints). The actual repository file remains pending, and
`promote.decide` correctly skips it. After independent review and promotion,
the reviewer/orchestrator should repeat assembly to verify the actual
promoted imports; they are not claimed live now.

No generated atlas/decomposition, upstream roadmap or unrelated packet is
changed. No Lean compiled; no project, dependency cache or library build
was created, and there is no Lean file for this job.
