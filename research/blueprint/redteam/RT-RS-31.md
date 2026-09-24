# RT-RS-31 — red team of restructuring proposal RS-31 (Reductive groups)

**Result: one finding, low severity. Three of the four attacks came back clean, and the proposal is substantively right throughout.**

Red team: Claude Code, session `cc-fb70e5`, 24 September 2026. Target: `RS-31`, the restructuring proposal for `ReductiveGroupsPartII` (8 layers, 37 links, 7 owner reassignments), accepted by `REV-RS-31` on 21 September. `cc-fb70e5` wrote neither the proposal nor its review.

## Attack 1 — do all endpoints resolve? **Yes.**

All **37 links** resolve at both ends, and all **7 owner** stages plus every stage named in a `formerly` list resolve. I indexed 2040 stage ids from both `research/blueprint/atlas/roadmaps/` and `research/blueprint/roadmaps/`, in both the bare and the fully qualified form — the two indexing traps that cost me time on the adic-spaces link map.

## Attack 2 — the §15 title rule. **Conforms, and the proposal is fixing a real defect.**

The anchor `tauceti:TauCetiRoadmap/ReductiveGroups` is titled **"Reductive algebraic groups"**. RS-31 proposes **"Reductive algebraic groups, Part II: local structure and arithmetic models"** — the anchor's title reproduced exactly, with `, Part II` appended before the subtitle, which is what PROTOCOL §15 requires. Its declared `extends` is the anchor.

Worth stating plainly, because it is the proposal's own justification made good: the atlas record for `ReductiveGroupsPartII` is **currently** titled "Reductive groups, Part II: local structure and arith…", which does *not* reproduce the anchor's title. RS-31's `reason` says "Use the exact anchor title and put the anchor first among prerequisites", and it does.

*(A false alarm of my own, recorded so it is not repeated: my first check compared the text before the colon against the anchor title directly and reported a failure. The rule is anchor title **plus `, Part II`**, so the test has to strip that suffix.)*

## Attack 3 — duplication. Clean.

Screening every roadmap in both directories whose title or summary mentions parahoric, Bruhat–Tits, building, Iwahori, affine Weyl, valued root or apartment vocabulary: the only substantive hit is `ReductiveGroupsPartII` itself. The others — `OptimalTransport`, `GeometricTopology`, `DenseGraphLimits`, `GeneralAlgebraicKTheory` — match only on the ordinary word "building". So the apartment-gluing and building axioms of RG2.2, and the connected Bruhat–Tits `O_E`-model of RG2.3, are **not owned anywhere else** in the atlas.

The one duplication the family does contain was found before me: the literal Deligne-torus construction shared between `ShimuraData:D1` and `RG2.0a`. RS-31 narrows D1 and assigns the construction to RG2.0a, and the independent review records having "Corrected the missed Deligne-torus duplication with ShimuraData D1 and preserved its Hodge work and D2 handoff". The owners table carries that assignment; I confirmed it.

## Attack 4 — are the layer actions consistent with the owners table? **One finding.**

Four layers are marked `narrow` and each loses one or two targets to another owner — RG2.1 and RG2.4 to anchor Layer 7, RG2.5 to Layers 7 and 9, `ShimuraData:D1` to RG2.0a. Coherent.

But **two layers marked `keep` also appear in a `formerly` list**: RG2.0 and RG2.3. Reading them shows they are correctly `keep`, which is what makes this a finding about encoding rather than about scope:

- **RG2.0** (`keep`): "Retain all point-topology constructions… **Use** the upstream functor-of-points/group-scheme dictionary and specialize the pinned GeneralLinear points equivalence for the GL_n acceptance test; the new topology/comparison **is not supplied** by that algebraic equivalence."
- **RG2.3** (`keep`): "Retain construction of the connected smooth affine Bruhat–Tits `O_E`-model… **Use** anchor group-scheme, quotient, unipotent-radical and reductivity notions: **a supplied predicate is not a construction or proof** of reductivity of this particular quotient."

Neither layer ever claimed the notion the owners table assigns elsewhere. So `formerly` is carrying two different relations in one table.

## The finding

**RT-RS-31/1 — `other`, low severity.** The `formerly` field means "this content moved out of that layer, which is therefore narrowed" for four entries (RG2.1, RG2.4, RG2.5, D1), and "that layer *uses* this notion, which lives here" for two (RG2.0, RG2.3). A consumer computing what each layer lost from `owners[].formerly` would conclude that RG2.0 and RG2.3 are narrowed — contradicting their own `action: keep` — and would carry away content those layers retain.

The two cases *are* distinguishable in the data, but not by `formerly`: the genuinely narrowed layers also carry `suppliedBy` and `keeps` fields (RG2.1 has `suppliedBy: ["…ReductiveGroups#layer-7-structure-theory"]`), while RG2.0 and RG2.3 carry neither. And both owner targets already say so in prose — "…dictionary **used before** local topologization", "Reductivity over a field…, **used on** a special-fiber quotient".

**Fix.** Distinguish the two relations, leaving every layer action and owner assignment as it stands: either use `usedBy` in place of `formerly` on the RG2.0 and RG2.3 entries, or add a `relation` field taking `moved-from` and `used-by`. The intent is already recoverable from the target strings; the fix is to put it where a consumer can read it.

## What this red team did not do

I did not re-derive the mathematics of any layer, and I did not verify the 37 links' `reason` texts against the source stages' own descriptions — the adic-spaces red team showed that quote-level provenance is worth checking, but `RS-31.result.json` records reasons rather than quoted evidence, so there is nothing to check a quote against. Duplication was screened at roadmap granularity by vocabulary, not stage by stage across the whole atlas.
