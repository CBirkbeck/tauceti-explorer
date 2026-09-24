# Handoff — BP-DiamondsAndVStacks (issue #712)

Agent: Claude Code, session `cc-7b31c4`. Branch `cc-7b31c4-bp-d0`.

## Deliverables

- `research/blueprint/packets/DiamondsAndVStacks.json` — 72 nodes (11 definitions,
  13 constructions, 39 theorems, 8 lemmas, 1 application), 188 API items, 96 unit
  tests, 39 planets, 98 baseline declarations, 8 gaps, 4 requests, 5 structural
  proposals. `"part": null`, `"status": "partial"`.
- `research/blueprint/readmes/DiamondsAndVStacks.md` — 3062 lines, one section per
  layer with every node's statement, hypotheses, proof outline, API table, uses,
  unit tests, acceptance items, prerequisites and sources, then the request table,
  the gaps, the structural proposals and the acceptance tests the stage texts name.
- `research/blueprint/suggested/DiamondsAndVStacks.lean` — 996 lines of suggested
  signatures and `example` unit tests, everything `sorry`.
- This note.

## Checks run

- `python3 scripts/check_blueprint.py research/blueprint/packets/DiamondsAndVStacks.json --index $TAUCETI_BASELINE/declarations.tsv`
  → **0 errors, 0 warnings**, with the pinned declaration index in place, so all 98
  baseline references were resolved against it and not merely checked for form.
- `python3 research/blueprint/intake.py check-files` on the four changed paths → 0 problems.
- `python3 -m unittest discover -s tests` → OK.

**The Lean file was not compiled.** No Lean was run for this job. The Mathlib build
on this machine is a shared cache that must not be rebuilt, and this working tree
has no elaborated dependency modules. Nothing in this packet is claimed to be
formalised and every `implementationStatus` is `unchecked`.

## What this job rested on

There was **no integrated decomposition**, **no draft** and **no reviewed library
audit** for this roadmap: `data/library-coverage.json` has no entry whose key starts
with `DiamondsAndVStacks`, which I checked by listing all 1316 keys of its `layers`
map rather than by probing seven strings. So the packet was written from the source
and from the pinned libraries directly.

The source is Scholze, *Étale cohomology of diamonds*, arXiv:1709.07343, SHA-256
`78ca42bba46f1d43c894b0dbfdfb41105efab4959ba5ba6e32e1e5cf7ef33efc`. It was
downloaded again in this session and the hash reproduces the copy already in the
scratch space byte for byte. Sections 2, 4, 7–13 and 15 were read in full with all
proofs; sections 1, 3, 5, 6, 14 and 16 were read for the statements this roadmap
imports or exports.

**A note on the extraction, because it changed what could be read.** The first pass
of the scratch PDF extractor associated font resources globally rather than per page,
so it applied a mathematics font's `ToUnicode` map to the text-italic font. Since
every theorem statement in the source is set in italics, every theorem came out as an
unreadable substitution cipher — `A⋗⅁pf:Y→X⋊℧⅁⪯̸⋉⋊ℶdpe∖℧ec≈⋊ℶd∼p⅁ce∼` for "A map
f : Y → X of affinoid perfectoid spaces". I rewrote the extractor to parse the
object streams and each page's own `/Resources /Font` dictionary
(`$SCRATCH/pdftext4.py`); after that the italic text decodes correctly and the
printed page numbers of the file coincide with the extraction page numbers. Every
excerpt in this packet comes from that second pass.

## The three findings that changed the plan

1. **Mathlib already has the absolute spectral-space theory.** `SpectralSpace` is
   ECD Definition 2.1 verbatim, `IsSpectralMap` is the absolute morphism condition,
   `WithConstructibleTopology` with `compactSpace_withConstructibleTopology` is the
   constructible topology with its quasicompactness, `Topology.IsConstructible`,
   `Topology.IsLocallyConstructible` and `IsRetrocompact` are there, `GeneralizingMap`
   and `StableUnderGeneralization` are there, and `PrimeSpectrum` carries a
   `SpectralSpace` instance, so ECD Theorem 2.2 (ii) ⇒ (i) is proved. D0 therefore
   plans only locally spectral spaces and the relative morphism condition, the
   *profiniteness* of the constructible topology, ECD 2.3–2.11, the pro-category
   (Mathlib has `Ind`, not `Pro`) and Hochster realization.
2. **Mathlib already has descent data, prestacks and stacks.**
   `Mathlib/CategoryTheory/Sites/Descent/` has `Pseudofunctor.DescentData`,
   `IsPrestack` with `sheafHom`, `IsStack`, `toDescentData` and
   `isEquivalence_toDescentData`. That is ECD Definition 9.1 together with the
   statement that a stack is one for which `F(X) → F(Y/X)` is an equivalence. D0
   plans only stackification, 2-fibre products and groupoid quotients, and a
   `restructure` entry proposes narrowing D0's text to match.
3. **`AlgebraicGeometry.Scheme.qcPrecoverage` is literally ECD's covering
   condition**, transported to schemes: "every affine open of the base can be covered
   by a finite union of images of quasi-compact opens of the components". The D2
   site nodes cite it as the model and as a unit test.

Tau Ceti's `TauCeti/AlgebraicGeometry/AdicSpace/` has 381 declarations — the
valuation spectrum, its patch topology with quasicompactness and the closed
embedding into a product of copies of `Bool`, pro-constructibility of the loci
`|f| ≤ 1`, `spectralSpace_spa_of_pairOfDefinition`,
`spectralSpace_cont_of_pairOfDefinition`, the rational-subset theory and the
analytic locus. This is exactly the anchor RS-05 names as D0's supplier, and it is
cited, not re-planned.

## RS-05 and the layer boundaries

RS-05 (accepted 23 September 2026) keeps D1–D6 and narrows D0; this packet follows
it. Two boundary facts are worth repeating because neither is visible from the D
stage texts alone:

- **ECD 7.8–7.11 and 4.2–4.4 belong to `PerfectoidSpaces:P6`**, whose own stage text
  claims the affinoid pro-étale calculus, the pro-category equivalence 7.10, the
  stability assertions 7.11, the Zariski-closed-immersion statement 7.9 and the
  κ-small perfectoid spaces. D1's text enumerates "7.1–7.7 and 7.12–7.23" and is
  silent about them. They are requested here. Putting them in D2, which is the other
  natural guess, would make a cycle, since D2 requires D1.
- **ECD 15.3 belongs to `AdicEtaleGeometry:A4`** by that stage's own text, and
  Huber's étale and finite étale sites belong to `AdicEtaleGeometry:A2`. Both are
  requested; D6 states Lemma 15.6 against those definitions.

`PerfectoidSpaces:P4` is requested for ECD §5.

## What remains

No layer is closed. The eight gaps, in rough order of how much they block:

1. **SGA 4 Exposé VI was not read.** ECD recalls Définitions 1.1, 1.7, 1.13 and 2.3
   and Corollaires 1.17, 2.6, 2.8 on pp. 40–41, so the statements are available and
   quoted; the proofs of the corollaries, which say qcqs conditions may be checked
   after pullback to a generating subcategory, are not. Next source action: SGA 4,
   Tome 2, Exposé VI, §§1–2.
2. **One step of the proof of ECD Theorem 8.7 is not proved in the source.** The
   almost identification of `S⁺/ϖ ⊗_{R⁺/ϖ} S⁺/ϖ` with `T⁺/ϖ` carries a reference
   marker rather than an argument. This is the completed-integral equalizer step the
   roadmap text names, and it is the only step of the v-descent proof not read in
   full.
3. **Two ECD proofs are left to the reader**: Proposition 8.3 (the perfectoid sheaf
   categories are algebraic) and Proposition 11.19 (the locally spatial analogue of
   11.18). Both statements are planned with the verification written out as proof
   steps; nothing was read.
4. **Hochster realization has no proof in ECD.** Next source action: Hochster,
   *Prime ideal structure in commutative rings*, Trans. AMS 142 (1969), Theorem 6.
5. **Huber's étale and finite étale sites were not read**, so the right-hand sides of
   the equivalences of Lemma 15.6 are taken on trust from ECD's reference.
6. **Stacks Project tag 0APA**, cited inside the proof of ECD Lemma 2.7, was not
   read; the proof recorded in that node reconstructs the step from Lemmas 2.3 and
   2.4 and should be checked against the tag.
7. **The formal-scheme input of ECD Lemma 9.5** (`Spf O⁺(V)` flat and topologically
   of finite type over `Spf C⁺`, and the refinement of a finitely presented
   faithfully flat cover of a strictly henselian local ring by a finite one) is not
   planned anywhere; `AdicEtaleGeometry:A2` is asked for formal schemes and is the
   likely owner.
8. **ECD's proof of Lemma 15.6 is compressed**; the étale half is obtained by
   combining the description of `|Y^♢|` with the local structure of étale maps, and
   the node writes that combination out, which is more than the source does.

## Structural proposals

1. `DiamondsAndVStacks:D0`'s only `requires` entry in `data/atlas.json` is the marker
   `UPSTREAM:ECD:BASE`, which is not a stage id and can appear neither as a node
   prerequisite nor as a request supplier, so D0 has no supplier edge in the atlas at
   all. RS-05 already records the intended supplier in `suppliedBy`; the proposal is
   to put it into `requires`.
2. Add one sentence to D1's and D2's stage texts saying that the pro-étale morphism
   calculus is imported from P6.
3. Split D0 into four sub-layers (spectral, sites, size, stacks): its text asks for
   four independent developments with four different consumer sets.
4. Narrow D0's stack paragraph, because the pinned Mathlib now has descent data,
   prestacks and stacks.
5. Split D5, which carries ECD 11.17–11.31, 12.12–12.21 and all of §13 and is the
   largest single load in the roadmap, into spatial / criterion / representability.

## Where to resume

The packet is complete against the source for the sections in scope. The next real
work is source reading, in the order of the gap list: SGA 4 VI first, because three
D0 nodes quote it and nothing else in the atlas will supply it; then the one missing
step in the proof of Theorem 8.7, which is the only hole in an otherwise fully read
v-descent argument; then Huber, which D6 and `AdicEtaleGeometry:A2` both need.
