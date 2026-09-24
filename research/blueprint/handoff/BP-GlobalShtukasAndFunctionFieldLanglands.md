# Handoff — BP-GlobalShtukasAndFunctionFieldLanglands (issue #1010)

Agent: Claude Code, session `cc-7b31c4`. Branch `cc-7b31c4-bp-gs`.

## Deliverables

- `research/blueprint/packets/GlobalShtukasAndFunctionFieldLanglands.json` — 65 nodes
  (8 definitions, 10 constructions, 40 theorems, 2 lemmas, 5 applications), 135 API
  items, 72 unit tests, 42 planets, 29 baseline declarations, 8 gaps, 20 requests,
  4 structural proposals. `"part": null`, `"status": "partial"`.
- `research/blueprint/readmes/GlobalShtukasAndFunctionFieldLanglands.md` — 2765 lines,
  one section per layer with every node's statement, hypotheses, proof outline, API
  table, uses, unit tests, acceptance items, prerequisites and sources, then the
  request table, the gaps, the structural proposals and the acceptance tests.
- `research/blueprint/suggested/GlobalShtukasAndFunctionFieldLanglands.lean` — 1372
  lines of suggested signatures and `example` unit tests, everything `sorry`.
- This note.

## Checks run

- `python3 scripts/check_blueprint.py research/blueprint/packets/GlobalShtukasAndFunctionFieldLanglands.json --index $TAUCETI_BASELINE/declarations.tsv`
  → **0 errors, 0 warnings**, with the pinned declaration index in place, so all 29
  baseline references were resolved against it.
- `python3 research/blueprint/intake.py check-files` on the four changed paths → 0 problems.
- `python3 -m unittest discover -s tests` → OK.

**The Lean file was not compiled.** No Lean was run. The Mathlib build on this machine
is a shared cache that must not be rebuilt and this working tree has no elaborated
dependency modules. Every `implementationStatus` is `unchecked`.

## Sources, and exactly how much of each was read

Three sources, all downloaded in this session and hashed.

1. **V. Lafforgue, *Chtoucas pour les groupes réductifs et paramétrisation de
   Langlands globale***, arXiv:1209.5352v10, SHA-256 `b37715f9c428…`, 184 pages,
   French. **The introduction, pp. 2–31, was read in full.** It is a largely
   self-contained account of the whole construction and it carries its own numbering
   (Théorème 0.1, Définitions 0.2/0.4/0.6/0.7/0.11/0.12/0.14/0.15/0.20/0.26/0.29/0.34,
   Théorème 0.9, Propositions 0.16/0.17/0.23/0.25/0.28/0.36/0.37, Lemmes
   0.18/0.22/0.31/0.33, Remarques 0.3/0.5/0.8/0.10/0.13/0.19/0.21/0.27/0.30/0.35)
   together with pointers to the chapters where each is proved. **Chapters 1–14 were
   not read.**
2. **V. Lafforgue, *Shtukas for reductive groups and Langlands correspondence for
   function fields***, arXiv:1803.03791v1, SHA-256 `b51a2f005704…`, 31 pages, English,
   the ICM 2018 plenary lecture. **Read in full.** It supplies Drinfeld's lemma 1.1,
   the dual group and Definition 5.1, the Satake isomorphism, Proposition 7.4, the
   excursion operators with Theorem 8.4 and Remarks 8.1/8.3/8.5/8.6, and §9 on the
   local aspects.
3. **L. Lafforgue, *Chtoucas de Drinfeld et correspondance de Langlands***, IHES
   preprint M/00/70, SHA-256 `af732dac0d2d…`, 241 pages, French, published as Invent.
   Math. 147 (2002) 1–241. **Only the two-page introduction was read.** GS.6 is
   written from it. This is the largest reading gap in the packet and the GS.6
   coverage record says so in those words.

**A note on the extraction, because it changed what could be read.** The scratch PDF
reader had two defects. First, it associated font resources globally rather than per
page, so a mathematics font's `ToUnicode` map was applied to the text-italic font;
since every theorem statement in these papers is set in italics, every theorem decoded
as a substitution cipher. Second, the `fi`/`ff`/`fl`/`ffi`/`ffl` ligatures of the
Computer Modern text fonts carry no `ToUnicode` entry and were silently dropped, so
"field" came out as "eld" and "coefficients" as "coecients" — a failure that is easy
to miss, because the text still looks like text. Both were repaired in
`$SCRATCH/pdftext4.py` (per-page `/Resources /Font` parsing, and a ligature fallback
for the codes `0x0B–0x0F` and `0x1B–0x1F` when a font's cmap has no entry). Every
excerpt in this packet comes from the repaired extraction.

## What this job rested on

**The reviewed audit AUDIT-20 was read first**, and it covers all eight layers. Its
verdict for every one is **not built**; of the thirty-eight targets it lists,
thirty-seven are *absent* and one — descent data for nonsplit groups — is *partial*.
Reading the pinned declaration index confirms it. What the libraries do have is cited
and never re-planned: `Module.Grassmannian` (finite-dimensional), `RootPairing` and
`RootPairing.flip`, `CategoryTheory.GaloisCategory`, `Pseudofunctor.DescentData`/
`IsStack`/`toDescentData`, `AlgebraicGeometry.Scheme.ellAdicSheaf` and
`Scheme.ProEt.topology`, `NumberField.AdeleRing` (a *number* field), and Tau Ceti's
`CartierDivisor` and `ReductiveCommHopfAlgCat` (group schemes over a *field*).

**RS-22 is accepted and keeps all eight layers**, giving in each case the reason the
overlapping layer elsewhere is not a substitute. The audit records seven duplications
and the packet follows RS-22 exactly.

**The GS.5 duplication resolved itself.** `ExcursionOperatorsAndSpectralAction--ES0.json`
and `--ES5.json`, which I wrote earlier in this programme, each already carry a
`requests` entry whose supplier is `GlobalShtukasAndFunctionFieldLanglands:GS.5` and
whose text says the audit records the two as duplicates and PROTOCOL.md §15 requires
the shared construction to be planned once. This packet plans it. The excursion
operators over a function field are now planned in exactly one place, and the two
roadmaps point at each other correctly.

## What remains

No layer is closed. The eight gaps, in rough order of how much they block:

1. **Only the introduction of L. Lafforgue's paper was read.** Every GS.6 node states
   a result and describes a method without a proof read from the source. Next source
   action: chapters I and II for the compactification and the boundary, then the trace
   chapters, then the preparatory book on the Arthur–Selberg computation and on
   iterated shtukas.
2. **Only the introduction of V. Lafforgue's paper was read.** The proofs a
   continuation must read, in order: propositions 6.2, 8.27, 8.34, 8.23, 9.7, 11.7 and
   chapter 12.
3. **Geometric Satake is used as a black box.** Theorem 0.9 is attributed to Lusztig,
   Drinfeld, Ginzburg and Mirković–Vilonen; those references were not followed.
4. **The Genestier–Lafforgue local construction was not read**; §9 of the survey
   describes it in about a page and the joint paper was not obtained.
5. **Nearby cycles over general bases have no source here**; Orgogozo's finiteness
   theorem is the piece the comparison actually uses.
6. **The Blasius–Lapid examples are cited and not verified**, although they are the
   reason excursion operators with more than two legs are necessary.
7. **`H_{I,W}` is not known to be finite dimensional** — the source says so explicitly
   and arranges its argument so as not to need it, and this packet follows suit.
8. **Whether the excursion algebra `B` is reduced is unknown.** Not a reading gap but a
   gap in the mathematics; it is why the decomposition is into *generalized*
   eigenspaces and why the conjectural decomposition of GS.3 is recorded as a
   conjecture.

## Structural proposals

1. Record in AUDIT-20's duplicate notes that GS.5 owns the global excursion operators
   and ES0/ES5 the local ones, now that both packets exist and request each other.
2. Add a sentence to GS.1's stage text saying that the Satake category, its fibre
   functor and the dual group are imported from `GeometricSatakeAndFusion`, and that
   what GS.1 owns is the statement over powers of the global curve.
3. Split GS.6 into `GS.6:statement` and `GS.6:proof`: the statement is what every other
   roadmap imports and can be used at once, while the proof is the machinery of a
   241-page paper nobody has read the body of.
4. Six of the seven suppliers the issue names have no packet, so every dependency on
   them is a request against a stage id; a `kind:link` job should convert them when
   those packets land. The requests name precisely what is wanted so the conversion is
   mechanical.

## Where to resume

The packet is complete against what was read. The next real work is source reading, in
the order of the gap list: the body of L. Lafforgue first, because GS.6 is the layer
with the weakest support and is the one other roadmaps import as a black box; then
chapters 6 to 12 of V. Lafforgue, which turn the introduction's sketches into proofs;
then the Genestier–Lafforgue paper, which GS.7 needs.
