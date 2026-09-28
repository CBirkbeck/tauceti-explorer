# Handoff — BP-GeneralAlgebraicKTheory--K.6 (issue #738)

Agent: Claude Code, session `cc-7b31c4`. Branch `cc-7b31c4-bp-gak`.

## Deliverables

- `research/blueprint/packets/GeneralAlgebraicKTheory--K.6.json` — 22 nodes
  (5 definitions, 4 constructions, 10 theorems, 1 comparison, 2 lemmas), 55 API
  items, 36 unit tests, 8 planets (6 in K.6, 2 in K.7),
  5 gaps, 5 requests, 3 structural proposals, 19 baseline declarations.
  `"part": "K.6"`,
  `"status": "partial"`.
- `research/blueprint/readmes/GeneralAlgebraicKTheory--K.6.md` — 1378 lines.
- `research/blueprint/suggested/GeneralAlgebraicKTheory--K.6.lean` — 443 lines
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

## The sources

**Two.** The first is Weibel, *The K-book*, author-hosted combined draft of 29 August 2013,
SHA-256 `a04f53c9…b058845`. The file was already on disk from this session's
`K2SymbolsBrauer` job and was re-hashed; the hash reproduces the value recorded
by the packets of `K2SymbolsBrauer`, `Polylogarithms`, `MotivesAndAlgebraicCycles`
and `ArithmeticKTheory`, so this is the same file those four cite. Sections read
are listed in `sources[0].readSections`; the substantial ones are II.2.1, II.2.7,
II.7.4, II.9.1/9.5/9.6, III.1, III.3.6–3.7, III.4.1–4.4, IV.6.3.5/6.4/6.6,
IV.10.1–10.4 and V.8.

The second is **Schlichting, *Negative K-theory of derived categories*** (author
preprint, 16 June 2003), SHA-256 `f59620e3…`, downloaded and hashed in this
session. That hash reproduces the one recorded in
`data/decompositions/GeneralAlgebraicKTheory.json`, so this is the file that
decomposition's accepted independent review of 15 September 2026 checked. Read:
the introduction and §§1, 3, 4, 6, 7 complete with proofs; §2 and §§5, 8, 9, 11
in the parts listed in `sources[1].readSections`. **Not read:** §10, Appendix A,
and the proofs of 2.9, 9.1, 11.10, 11.15 and 11.17 — two of the five gaps.

The scan's text layer damages ligatures and accents. Every excerpt was repaired
character by character against the surrounding text without changing a word, and
the two places where the layer drops a clause carry square brackets.

## Built on the reviewed decomposition

`data/decompositions/GeneralAlgebraicKTheory.json` (review
`independent-review-REVIEW-EXT-01-EXT-15`, accepted 15 September 2026) has six
nodes for these two layers. **Four of its node identifiers are kept** —
`schlichting-set-up-and-negative-localization`,
`frobenius-pairs-flasque-envelope-and-suspension`,
`nonconnective-spectrum-and-derived-invariance` and
`agreement-and-vanishing-of-negative-K` — each split where declaration
granularity asked for it: `frobenius-pairs` and `schlichting-set-up` are now
their own definition nodes, and `additivity-and-colimits-for-negative-K` is a
fifth. Its two K.7 nodes are not kept as nodes: their content is one statement
per node across the seven K.7 nodes here, and every locator they carry is reused.
What this packet adds to the decomposition is the whole Bass-side development of
K.6, which the decomposition does not have, and API outlines with unit tests for
all nine definitions and constructions.

## What AUDIT-28 said and what the index confirmed

The audit records both layers as *not built*. Every claim it makes about the
libraries was checked against the pinned declaration index, and all of them hold:
`CategoryTheory.Idempotents.Karoubi`, `ModuleCat.matrixEquivalence`,
`IsMoritaEquivalent`, `IsMoritaEquivalent.matrix`,
`CategoryTheory.Limits.HasFilteredColimits`, `Polynomial`, `LaurentPolynomial`,
`TensorProduct`, `Matrix`, `RingHom`, and on the Tau Ceti side `TauCeti.ExactK0`,
`TauCeti.ExactK0.mapEquiv`, `TauCeti.SplitK0`, `TauCeti.SplitK0.of_mul_of`.

Two further pinned facts were found by searching the index directly, beyond what
the audit lists, and are cited rather than re-planned: **Tau Ceti has
`ExactStructure.IsFrobenius`**, with `injective_iff_projective` and
`split_isFrobenius`, so the Frobenius *condition* exists at the pin; and Mathlib
has `ObjectProperty.IsTriangulated` with `ObjectProperty.trW`, the triangulated
subcategory and the class of maps a Verdier quotient inverts.

Confirmed absent at both pins and therefore not cited: any spectrum, homotopy
colimit or connective cover; Karoubi's flasque rings; the Eilenberg swindle;
contracted functors; the negative K-groups; the Nil groups; the enough-objects
data of a Frobenius category, its stable category and the Verdier quotient as a
triangulated category; Frobenius pairs; the K-theory of a Waldhausen category;
and **the first K-group**, which is missing from both trees, so every degree-one
statement in this packet is stated against a group that does not yet exist.

## The naming collision, which is the one thing to fix before writing code

Both pinned trees use `IsFlasque` for the **sheaf-theoretic** predicate. K.6
needs **Karoubi's flasque rings**, an unrelated notion. The packet uses
`IsFlasqueRing`, records the collision in the node's statement, in its unit
tests, in the readme and in a structural note, because a formalisation that
reused the name would produce statements that read as true and mean something
else. This is filed as `note-naming-collision`.

## K.6 is decomposed along both of its routes, and they are proved to agree

K.6's text asks for the nonconnective extension via a **flasque enlargement, a
suspension and an idempotent completion**. Both routes are here.

*The algebraic route* (eight nodes, K-book): flasque rings and the swindle,
contracted functors, the negative groups, the Fundamental Theorem with Nil terms,
the four axioms, Mayer–Vietoris, the Bass delooping (`LE`, the desuspension, the
`(-1)`-connective cover, the homotopy colimit), and the vanishing theorem.

*The homotopical route* (seven nodes, Schlichting): Frobenius pairs and their
derived categories; the **countable envelope**, which is flasque in exactly
Karoubi's sense with the swindle in functorial form (Lemma 4.2), the enlargement
`F`, the c-compact generation identifying the idempotent completion of the
derived category with the c-compact part of the enlargement, the suspension `S`,
and Theorem 4.8, which verifies the three axioms of the set-up; the set-up itself
and the groups it defines; localisation in non-positive degrees with `IK₋₁` as
the obstruction to idempotent completeness of Verdier quotients; additivity and
filtered colimits; the `IK`-spectrum with its homotopy groups in all three
ranges; and the agreement theorem.

*They agree.* Schlichting's Theorem 7.1 identifies the second route's groups with
Bass's, Pedersen's, Karoubi's, Pedersen–Weibel's and Thomason's. So the stage
text's **independence of the enlargement** is met twice over: by the
model-independence of the Bass construction, and by that agreement theorem. Its
§9.5 then *deduces* Bass's vanishing theorem for a regular ring, which is a
second, independent proof of what the last K-book node states.

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

1. **Schlichting §10 and Appendix A were not read** (K.6). Appendix A is where
   the non-functorial factorisation replaces Waldhausen's cylinder functor and
   the approximation and fibration theorems are proved; the spectrum node states
   that hypothesis and its role but does not decompose its proof.
2. **The proofs of 11.10, 11.15 and 11.17 were not read** (K.6) — the
   spectrum-level localisation, derived invariance and cofinality. Their
   statements are quoted; the proof of 11.7, which computes the homotopy groups,
   was read.
3. **The spectrum-level product is deferred by the source** (K.7). The K-book
   gives the definition, the map out of the Q-construction and the ring-spectrum
   hypotheses, but refers to Waldhausen §1.5 for the construction of the pairing.
4. **No counterexample was read** for the failure of naked triangulated
   invariance (K.7). The positive hypothesis now has two sources; the negative
   half is argued, not sourced. Read Schlichting's *A note on K-theory and
   triangulated categories* (Invent. Math. 150, 2002).
5. **The proof of the Fundamental Theorem was not read**, only its statement
   (V.8.1–8.3 and the section opening). Read V.8 in full with III.3.6.

## Structural proposal worth acting on

**Split K.6.** Its text asks both for Bass's groups with the Fundamental Theorem
— pure algebra, formalisable against the pins today — and for the nonconnective
spectrum, which needs spectra, homotopy colimits and connective covers, none of
which exists in either library. As one layer it cannot be closed until the
homotopy theory arrives, and a reader cannot see that the algebraic half is
independently available. The eight nodes divide five to three along that line.

## Where to resume

The packet is complete against the sources read, and both routes the stage text
names are decomposed. The next real work is source reading in the order of the
gap list: Schlichting's Appendix A first, because the `IK`-spectrum node rests on
it and it is eight pages; then pp. 22–24 for the three deferred proofs; then V.8
in full, which upgrades the Fundamental Theorem node from statement to proof.
