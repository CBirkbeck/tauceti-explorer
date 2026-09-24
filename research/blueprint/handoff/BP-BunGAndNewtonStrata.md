# Handoff — BP-BunGAndNewtonStrata (issue #691)

Agent: Claude Code, session `cc-7b31c4`. Branch `cc-7b31c4-bp-bung`.

## Deliverables

- `research/blueprint/packets/BunGAndNewtonStrata.json` — 23 nodes
  (5 definitions, 2 constructions, 15 theorems, 1 lemma), **44 API items, 29 unit
  tests**, 22 planets, 24 baseline declarations, 6 gaps, 25 requests, 2
  structural proposals. `"part": null`, `"status": "partial"`.
- `research/blueprint/readmes/BunGAndNewtonStrata.md` — 1513 lines.
- `research/blueprint/suggested/BunGAndNewtonStrata.lean` — 434 lines.
- This note.

## Checks run

- `python3 scripts/check_blueprint.py research/blueprint/packets/BunGAndNewtonStrata.json --index $TAUCETI_BASELINE/declarations.tsv`
  → **0 errors, 0 warnings**.
- `python3 -m unittest discover -s tests` → 273 tests, OK.
- `python3 research/blueprint/intake.py check-files` on the four changed paths → 0 problems.

**The Lean file was not compiled.** No Lean was run; the Mathlib build here is a
shared cache that must not be rebuilt. Every `implementationStatus` is
`unchecked`.

## This packet is a first reading, not a refinement

**This roadmap has no integrated decomposition.** No file in
`data/decompositions/`, no draft in `research/expansion/drafts/`, no external
contribution in `research/expansion/external/*/`, no reviewed entry in
`data/library-coverage.json`. Every one of the 23 nodes was written from
Fargues–Scholze read directly in this session, from `Geometrization.pdf` whose
SHA-256 reproduces the recorded value byte for byte; the text was extracted by
inflating the PDF's object streams and reading its text operators, and every
printed page was read off the running heads.

Sections read: **I.4** (printed pp. 20–22); the whole of **Chapter III**, III.0
through III.5 (printed pp. 87–106); **IV.1.13–IV.1.23** (printed pp. 111–114); and
**V.3.2–V.3.7** (printed pp. 173–177). The itemised list is in the packet's source
record.

A reviewer of this packet is checking a first reading. Every locator is
unconfirmed by anyone else, which is not the usual situation in this family, and
it is the first gap the packet records.

## The defect I could not avoid

**The statement of Theorem IV.1.19 is damaged in the text extraction.** Printed
page 112 begins mid-formula and the statement is not recoverable. What I did read,
in full, is its *proof* on the same page — the Tannaka/Chevalley reduction of the
diagonal, the appeal to Lemma IV.1.20, the construction of the chart
`⊔_μ [G(E)\Gr_{G,≤μ}] → Bun_G ×_k Spd E`, the identification of its fibres with
the geometrically trivial open loci in modifications of locally constant type, and
the appeals to Proposition IV.1.18 and Remark IV.1.5 — together with the Chapter I
statement, Theorem I.4.1 (vii), which was read cleanly and which I quote for the
conclusion. This is recorded as a gap and in the node's own hypotheses. Nothing
else in the packet depends on the exact wording.

## What the pinned libraries supply

`data/library-coverage.json` has no reviewed audit entry, so the pinned index was
searched directly.

**The useful find is Tau Ceti's dynamic method.** `Cocharacter.parabolic`,
`Cocharacter.levi`, `Cocharacter.unipotent`, `Cocharacter.limitToLevi` and
`Cocharacter.leviGroupExtension`, in
`TauCeti/Algebra/AlgebraicGroup/Dynamic/`. Proposition III.5.2 — the algebraic
heart of BG3 — says a `Q`-filtration on the fibre functor gives smooth `H^{≥λ}`
with `H^{≥0}` a parabolic, `H^{>0}` its unipotent radical and vector-group graded
pieces; and its proof reduces, after splitting the filtration étale-locally, to
exactly that cocharacter construction. That is the second structural proposal.

Also cited: `TauCeti.ReductiveAffineGroupSchemeCat` and `AffineGroupSchemeCat`;
`mathlib:WittVector` and `WittVector.Isocrystal`, the latter being the `GL_n` case
of a `G`-isocrystal for `E = Q_p`; `RootPairing` for `ρ`, the dominant rational
cocharacters and the dominance order; `CoxeterSystem` and
`TauCeti.TitsSystem.bruhatCell` for the Cartan decomposition used in
Lemma III.3.2; `Specializes` and `SpectralSpace` for the semicontinuity and
spatiality statements; `TotallyDisconnectedSpace`, since almost every proof in
Chapter III reduces to a strictly totally disconnected base; and
`TauCeti.IsSmoothDiscrete`, which marks the boundary with `VS4`.

**Absent at both pins:** any perfectoid space, diamond, v-stack or Banach–Colmez
space, and any `π_1` of a reductive group in the Borovoi–Kottwitz sense.

## What remains

No layer is closed. Six gaps, of which the three that matter most:

1. **Kottwitz's classification is quoted everywhere and proved nowhere in
   anything read.** Injectivity of `(κ,ν)`, the bijection on basic classes, the
   Levi description of non-basic classes, representability of `G_b`, its
   inner-Levi description, and the identification of `G_b × Ĕ` with the
   centraliser of the slope homomorphism, are all quoted from Kottwitz and
   Rapoport–Zink. They are load-bearing: the semistable locus is open *because*
   basic classes are minimal and biject with `π_1(G)_Γ`, the components are
   counted *by* that bijection, and the basic strata are classifying stacks
   *because* `G_b × Ĕ → G × Ĕ` is an isomorphism for basic `b`. The roadmap's own
   text makes these proof obligations of BG0–BG1.
2. **Scholze–Weinstein §§22.4–22.6 have not been read by anyone in this family**,
   and Theorem III.2.3's upper semicontinuity is quoted from
   [SW20, Corollary 22.5.1]. §19.5 and §19.1 *were* read, for the
   `RelativeFarguesFontaine--RF4` packet of this session.
3. **The two proofs of local constancy of `κ` are not independent.** The first
   reduces by a z-extension and Lemma III.2.10, and the source then writes *"It
   remains to prove Lemma III.2.10. This will be done in the next section, using
   Beauville–Laszlo uniformization."* So it runs through §III.3, which uses
   III.2.4, which uses III.2.3. The second, through `B^ab(G) = π_1(G)`, is
   genuinely independent, and the packet's prerequisite graph follows it.

## Structural proposals

1. **This roadmap should get a source decomposition of its own.** Every other
   member of the Fargues–Scholze family has an independently reviewed one; this is
   a supplier of `GeometricSatakeAndFusion`,
   `VStackSheavesAndLisseCategories`, `HeckeStacksAndLocalShtukas` and
   `ExcursionOperatorsAndSpectralAction`, so a reviewed decomposition here would be
   checked by more consumers than most. The concrete missing piece is
   Scholze–Weinstein §§22.4–22.6.
2. **BG3 should say that the algebraic half of Proposition III.5.2 is already
   pinned** — see the dynamic method above.

## Signs the packet is careful about

All four are in the unit tests, and each is easy to lose: the functor
`Isoc_E → Bun(X_S)` **reverses** slopes; `G̃_b` has dimension `+⟨2ρ,ν_b⟩` while
the stratum has `ℓ`-dimension `−⟨2ρ,ν_b⟩`; the filtration of `G̃_b` uses
**positive** Banach–Colmez spaces and the chart `q_b` the **opposite** parabolic
and **negative** ones; and `|Gr_G| → |Bun_G| → π_1(G)` is the **opposite** of the
natural map.

## Where to resume

The packet covers the roadmap's primary source route in full. The next real work
is the two unread bodies: Scholze–Weinstein §§22.4–22.6, and Kottwitz's own papers
with Rapoport–Zink for the classification and the σ-centraliser. Both are cited by
name in the source and neither is in the reference library as read. After that,
the proofs of Propositions III.5.1, III.5.3, V.3.5, V.3.6 and Theorem V.3.7, which
this packet read only in their openings.
