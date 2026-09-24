# Handoff — BP-GeneralAlgebraicKTheory--K.6 (issue #738)

Agent: Claude Code, session `cc-7b31c4`. Branch `cc-7b31c4-bp-gak`.

## Deliverables

- `research/blueprint/packets/GeneralAlgebraicKTheory--K.6.json` — 15 nodes
  (3 definitions, 3 constructions, 6 theorems, 1 comparison, 2 lemmas), 37 API
  items, 24 unit tests, 5 planets, 15 baseline declarations, 4 gaps, 5 requests,
  3 structural proposals. `"part": "K.6"`, `"status": "partial"`.
- `research/blueprint/readmes/GeneralAlgebraicKTheory--K.6.md` — 947 lines.
- `research/blueprint/suggested/GeneralAlgebraicKTheory--K.6.lean` — 297 lines
  of suggested signatures, every proof `sorry`.
- This note.

Both layers in scope are `source_decomposed` with an empty `remaining`.

## Checks run

- `python3 scripts/check_blueprint.py research/blueprint/packets/GeneralAlgebraicKTheory--K.6.json --index $TAUCETI_BASELINE/declarations.tsv`
  → **0 errors, 0 warnings**, with the pinned declaration index in place, so all
  15 baseline references were resolved against it rather than checked for form.
- `python3 research/blueprint/intake.py check-files` on the four changed paths.
- `python3 -m unittest discover -s tests`.

**No Lean was compiled.** The Mathlib build on this machine is a shared cache
that must not be rebuilt and this tree has no elaborated dependency modules.
Every `implementationStatus` is `unchecked`.

## The source

One book: Weibel, *The K-book*, author-hosted combined draft of 29 August 2013,
SHA-256 `a04f53c9…b058845`. The file was already on disk from this session's
`K2SymbolsBrauer` job and was re-hashed; the hash reproduces the value recorded
by the packets of `K2SymbolsBrauer`, `Polylogarithms`, `MotivesAndAlgebraicCycles`
and `ArithmeticKTheory`, so this is the same file those four cite. Sections read
are listed in `sources[0].readSections`; the substantial ones are II.2.1, II.2.7,
II.7.4, II.9.1/9.5/9.6, III.1, III.3.6–3.7, III.4.1–4.4, IV.10.1–10.4 and V.8.

## What AUDIT-28 said and what the index confirmed

The audit records both layers as *not built*. Every claim it makes about the
libraries was checked against the pinned declaration index, and all of them hold:
`CategoryTheory.Idempotents.Karoubi`, `ModuleCat.matrixEquivalence`,
`IsMoritaEquivalent`, `IsMoritaEquivalent.matrix`,
`CategoryTheory.Limits.HasFilteredColimits`, `Polynomial`, `LaurentPolynomial`,
`TensorProduct`, `Matrix`, `RingHom`, and on the Tau Ceti side `TauCeti.ExactK0`,
`TauCeti.ExactK0.mapEquiv`, `TauCeti.SplitK0`, `TauCeti.SplitK0.of_mul_of`.

Confirmed absent at both pins and therefore not cited: any spectrum, homotopy
colimit or connective cover; Karoubi's flasque rings; the Eilenberg swindle;
contracted functors; the negative K-groups; the Nil groups; the K-theory of a
Waldhausen category; and **the first K-group**, which is missing from both trees,
so every degree-one statement in this packet is stated against a group that does
not yet exist.

## The naming collision, which is the one thing to fix before writing code

Both pinned trees use `IsFlasque` for the **sheaf-theoretic** predicate. K.6
needs **Karoubi's flasque rings**, an unrelated notion. The packet uses
`IsFlasqueRing`, records the collision in the node's statement, in its unit
tests, in the readme and in a structural note, because a formalisation that
reused the name would produce statements that read as true and mean something
else. This is filed as `note-naming-collision`.

## Where this packet departs from the stage text, and why

K.6's text asks for the nonconnective extension via a **flasque enlargement, a
suspension and an idempotent completion** — the Pedersen–Weibel/Thomason route.
The K-book gives the **Bass delooping** instead: the functor `LE`, its
desuspension, the identification of connective K-theory with the
`(-1)`-connective cover, and the homotopy colimit. That is what is decomposed
here, in full. The `axioms-for-negative-k-theory` node (III.4.4) is the interface
through which the other route would be compared with this one, and gap 1 names
exactly what to read to decompose it: Pedersen–Weibel (LNM 1126) and
Thomason–Trobaugh §6. Nothing is asserted about the flasque route beyond the
comparison mechanism.

## The two traps, both carried as explicit non-examples

1. **K.6.** The connective model has zero homotopy in negative degrees for *every*
   ring. That absence carries no information, and vanishing for a *singular* ring
   may not be inferred from it. `vanishing-for-regular-noetherian-rings` states
   the theorem for regular noetherian rings and states the forbidden inference as
   a non-example; the Lean file has `not_vanishing_from_connective`.
2. **K.7.** Derived Morita invariance needs an **enhancement**. K-theory is built
   from a category with cofibrations *and weak equivalences* (II.9.1.1–9.1.2); the
   homotopy category forgets the weak equivalences and its mapping cones are not
   functorial. `derived-morita-and-enhancements` is a `comparison` node that
   states the correct hypothesis and carries the failure of the naked triangulated
   form as a non-example, keeping the degree-zero part, for which Tau Ceti's
   pinned `TauCeti.ExactK0.mapEquiv` is cited.

Two further deliberate choices. The **coherence homotopies of the product** —
associativity, unit, symmetry — are listed as API items and described as
transported from the tensor product's own coherence, not as consequences; and the
**three compatibilities** (relative groups, localisation boundaries, transfers)
are a separate node because none of them follows from bilinearity.

## The two duplications AUDIT-28 records

Neither is an overlap to remove. `SchemeKTheoryOperations:S.5` owns the
Fundamental Theorem *for schemes* and `S.6` the external products *for schemes*;
the source itself states the ring form (V.8.2, II.7.4.1) and the scheme form
(V.8.3) separately. The ring forms are proved here, the scheme forms imported by
name as prerequisites and filed as requests. The structural note asks that the
stage texts of K.6 and S.5 each say so in a sentence.

## Gaps, in the order they block

1. **The flasque-enlargement construction has no source here** (K.6). Read
   Pedersen–Weibel and Thomason–Trobaugh §6.
2. **The spectrum-level product is deferred by the source** (K.7). II.9.5.2
   states the pairing and refers to Waldhausen §1.5 for the construction; only
   the degree-zero pairing (II.7.4) is decomposed from a proof.
3. **No source was read for the enhanced form of derived Morita invariance**
   (K.7). Read Toën on dg-categories and Schlichting's note for the failure, and
   add the counterexample as its own non-example node.
4. **The proof of the Fundamental Theorem was not read**, only its statement
   (V.8.1–8.3 and the section opening). Read V.8 in full with III.3.6.

## Structural proposal worth acting on

**Split K.6.** Its text asks both for Bass's groups with the Fundamental Theorem
— pure algebra, formalisable against the pins today — and for the nonconnective
spectrum, which needs spectra, homotopy colimits and connective covers, none of
which exists in either library. As one layer it cannot be closed until the
homotopy theory arrives, and a reader cannot see that the algebraic half is
independently available. The eight nodes divide five to three along that line.

## Where to resume

The packet is complete against the source read. The next real work is source
reading in the order of the gap list: Pedersen–Weibel first, since it is what the
stage text actually asks for and the packet currently answers with a different
construction plus a comparison mechanism; then V.8 in full, which upgrades the
Fundamental Theorem node from statement to proof.
