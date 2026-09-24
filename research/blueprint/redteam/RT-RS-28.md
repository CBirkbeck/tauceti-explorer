# Red team: RS-28 — Higher local fields, building on Class field theory

**Job** `RT-RS-28` (issue #1625) · **Date** 24 September 2026 · Claude Code, session `cc-7b31c4` ·
**Five findings: two high, two medium, one low.** I did not write RS-28 (Codex `codex-c83e7a`,
issue #856, PR #897) or review it (Codex `codex-a71f92`, issue #855, PR #949).

RS-28 makes `HigherLocalFieldsAndHigherClassFieldTheory` an extension of Tau Ceti's Class field
theory, titled *Class field theory, Part II: higher local fields and higher reciprocity*, keeps all
eight stage ids, narrows HL.0–HL.6 to what is genuinely new, keeps HL.7, and records 24 owner rows
and 59 links. Most of it is right, and the parts that are right are right for good reasons: the
headline addition is exactly the theorem the anchor excludes, and the two global branches really do
have different owners. The defects are all at one seam — what the proposal does to
`FunctionFieldArithmetic`, a roadmap outside its family — plus one duplication the reviewed audit
records and the proposal misses.

## What is right

The anchor supports the proposal's central claim. ClassFieldTheory Layer 8 says, of equal
characteristic, "no `p`-primary equal-characteristic claim is exported", "⚠ Injectivity is **not**
asserted in equal characteristic", and "Full equal-characteristic `p`-primary existence requires the
excluded Artin–Schreier–Witt theory and is not asserted here." That is precisely the gap RS-28 gives
to HL.3. Layer 12 says "Every target of this layer is for a **number field**; global class field
theory for function fields is outside this roadmap", which is what makes HL.6's separate import of
`FunctionFieldArithmetic:FA.4` for the curve branch a real handoff rather than duplication.

The supplier rows hold up when read against the suppliers. `K2SymbolsBrauer:T.2:symbols` really does
"Define Milnor K-theory as the tensor algebra of `Fˣ` modulo the homogeneous Steinberg ideal" in all
degrees, so HL.1 is right to import rather than rebuild it; `T.3:localization-comparison` really does
"Develop higher Milnor residues … construct transfer and prove the norm/residue formula"; `T.4`
really does prove Bass–Tate and its transitivity; `CR.4` owns de Rham–Witt with Frobenius,
Verschiebung and dlog. All 96 stage references in the file — layer ids, owners and their `formerly`
entries, both ends of every link, every `suppliedBy` — resolve in the atlas after `retirements.py`,
and none of them is a layer of a retired roadmap. The one retirement the proposal leans on is real:
`FoundationsAndLibraryIntegration` was retired on 2026-09-16 with the note that "A retired roadmap is
never a supplier", and `LocalFieldsRamification` is one of the roadmaps named in its `coveredBy`, so
replacing HL.0's documented input `LI.4` by LocalFieldsRamification Layer 0 is the right move.

The Part II title reproduces the parent's atlas title, *Class field theory*, exactly. No Tau Ceti
layer is touched. `check_restructure.py` passes, and applying the proposal through
`scripts/restructure.py` produces one extension, seven narrowings and 58 new links with nothing
skipped.

I also read Mathlib at the pin for HL.0's library claim. `Mathlib/RingTheory/LaurentSeries.lean:504`
has `instance valued : Valued K⸨X⸩ ℤᵐ⁰ := Valued.mk' ((PowerSeries.idealX K).valuation _)` and line
824 `instance instLaurentSeriesComplete : CompleteSpace K⸨X⸩`, so each step of `F_q((u))((t))` and of
`Q_p((t))` is available as a complete valued field and the two-step packaging HL.0 keeps is what is
missing. The claim is accurate.

## The five findings

### 1 (high) — RS-28's own links make a roadmap cycle

Four of the links import `FunctionFieldArithmetic` into the Part II (`FA.2 → HL.5`, `FA.2 → HL.6`,
`FA.4 → HL.6`, `FA.4 → HL.7`) and one exports the Part II back into it (`HL.3 → FA.4`). After the
proposal is applied, `atlas["edges"]` carries both

    {"source": "FunctionFieldArithmetic", "target": "HigherLocalFieldsAndHigherClassFieldTheory", "kind": "stage_supported", "stageCount": 4}
    {"source": "HigherLocalFieldsAndHigherClassFieldTheory", "target": "FunctionFieldArithmetic", "kind": "stage_supported", "stageCount": 1}

and each roadmap lists the other in **both** its `prerequisites` and its `consumers`. The guard in
`apply_restructurings` refuses a link only when the target already reaches the source through *stage*
links; at stage level `HL.3 → FA.4 → HL.6` is a perfectly good chain, so all five went through and
neither the review nor the earlier red team's acyclicity control saw anything. The control that does
see it is the roadmap graph: rebuild the atlas with every other accepted proposal but RS-28 removed,
and there is **no path at all** from `HigherLocalFieldsAndHigherClassFieldTheory` to
`FunctionFieldArithmetic`; the cycle is created by this proposal alone.

### 2 (high) — RS-28 restructures a roadmap that is not in its family

`research/blueprint/restructure/RS-28.json` gives members `['HigherLocalFieldsAndHigherClassFieldTheory']`
and anchors `['tauceti:TauCetiRoadmap/ClassFieldTheory']`. `FunctionFieldArithmetic` is in neither.
Yet owners rows 13–15 list `FunctionFieldArithmetic:FA.4` under `formerly` for finite local
reciprocity, the absolute local Artin map and the local existence/correspondence; row 16 moves
"Equal-characteristic p-primary local existence and resulting injectivity/completion of the existing
Artin map" from FA.4 to HL.3; and four new prerequisite edges are added into FA.4.

Nothing applies any of it. `scripts/restructure.py` reads `roadmaps`, `layers` and `links` and never
reads `owners`, and the proposal lists no layer entry for FA.4 — so FA.4 keeps its text, which still
reads "Specialize and prove the local reciprocity construction for F_{q^d}((t)); then construct the
global reciprocity map from ideles, show principal ideles act trivially, and identify every finite
abelian quotient by its norm subgroup."

Worse, the family that *does* contain `FunctionFieldArithmetic` has already decided the other way.
RS-04 carries the owners row

    {"target": "Full equal-characteristic p-primary local and global function-field reciprocity",
     "owner": "FunctionFieldArithmetic:FA.4", "formerly": []}

and gives as its reason for extending the roadmap "Add completed adelic analysis, **full p-primary
equal-characteristic reciprocity**, zeta/Chebotarev, …". The same mathematics is assigned to HL.3 by
RS-28 and back to FA.4 by RS-04, each with the other side unaware. The reviewed library audit agrees
with RS-04's side of the split: it records the FA.4 overlap against **HL.6** ("Global class field
theory for curves over finite fields is this layer's curve case") and records no FA.4 overlap against
HL.3 at all, whose duplicates are ClassFieldTheory Layers 6 and 8.

Findings 1 and 2 have one cause and one fix: drop row 16 and the reversed link, leave equal-
characteristic p-primary local existence with FA.4, and let HL.3 import it. That removes the cycle
and the second owner in one move. The alternative — HL.3 really owning it — requires the FA.4 side to
be settled by RS-04, and the two proposals reconciled before either is applied.

### 3 (medium) — the one duplication the audit records and the proposal misses

RS-28 works through the reviewed library audit carefully: every `duplicates` entry AUDIT-03 records
for HL.0–HL.7 is answered by an owners row, a supplier or a link — except one. For HL.2 the audit
records

    {"layer": "KTheoryFiniteLocalFields:L.5",
     "note": "Owns the logarithmic/DVR de Rham–Witt comparison for complete discrete valuation rings,
              overlapping with this layer's wild coefficients."}

and, from the other side, L.5's entry records the same overlap. L.5's own description is explicit:
"Import ordinary de Rham–Witt complexes … from CrystallineCohomology CR.4; **own the logarithmic/DVR
comparison** needed by the calculation here, with its ramification data and map-level comparison."
`KTheoryFiniteLocalFields:L.5` appears nowhere in RS-28 — not in `owners`, not in any `suppliedBy`,
not at either end of any of the 59 links — while HL.2 keeps "local Artin–Schreier–Witt/logarithmic
coefficient interfaces and wild pairings not supplied by the cited regimes", and L.5 is not among the
cited regimes. Two layers are left owning the same comparison, and it is the input underneath the new
p-primary existence at HL.3.

(The other unlisted pair the audit records, `MotivicEtaleKTheory:M.4` against HL.1, I judged a
supplier/consumer handoff rather than duplication and did not raise: M.4 identifies its diagonal with
field Milnor K-theory, which `T.2:symbols` constructs and to which RS-28 assigns ownership.)

### 4 (medium) — a theorem attributed to a layer that excludes it

HL.2's wild coefficients are built, in RS-28's words, "on CR.4 ordinary de Rham–Witt and **the M.5d
differential theorem**", and owners row 12 gives `MotivicEtaleKTheory:M.5d` the target "Prime-power
norm-residue and characteristic-p differential comparison". M.5d says the opposite in terms: "Prove
the compatible Bockstein induction for ℓ^r, filtered-colimit and inseparable/characteristic
reductions in their permitted ranges. **Keep the residue-characteristic Bloch–Gabber–Kato
differential theorem separate.**" M.5 says the same from above: "At the residue characteristic use
the **separate** Bloch–Gabber–Kato logarithmic differential statement where L requires it. This is
not an instance of the prime-to-characteristic theorem."

Searching every stage description and all of `content/` finds Bloch–Gabber–Kato in those two places
and nowhere else, so **no layer of the atlas owns it**. The half of M.5d that RS-28 can rely on — the
prime-power Bockstein induction and the characteristic reductions — is real; the differential theorem
is not, and the layer that owns the logarithmic/DVR comparison is L.5 (finding 3).

### 5 (low) — "the first roadmap prerequisite" is not something the atlas shows

RS-28.md tells a human reader "Put Class field theory first in its roadmap prerequisites", and the
result's reason says "The base is the first roadmap prerequisite". `refresh_roadmap_links` recomputes
prerequisites from the stage links and sorts them, so the built record begins with
`CrystallineCohomology` and has `tauceti:TauCetiRoadmap/ClassFieldTheory` seventh of eleven. The base
is carried instead by `extends` and a `declared` roadmap edge, both of which RS-28 sets correctly;
only the wording needs changing.

## What this red team did not do

I did not re-derive the mathematics of higher local class field theory from Kato or the *Invitation
to higher local fields* volume; I checked the proposal against the member document, the anchor, the
atlas, the reviewed library audit, the other restructuring proposals and the pinned libraries. I read
one declaration pair at the Mathlib pin (the Laurent-series `Valued` and `CompleteSpace` instances)
and no Tau Ceti declaration, since RS-28 makes no Tau Ceti library claim. I did not review RS-04,
whose own review is still open; finding 2 records the contradiction between the two proposals without
deciding which of them should give way, because that decision belongs to the family that owns
`FunctionFieldArithmetic`.

## Checks

    python3 scripts/check_redteam.py research/blueprint/redteam/RT-RS-28.result.json

Reports no errors. `status` is `complete`.
