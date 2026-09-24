# REV-RT-AREA-modeltheory — verification of the red team on the Model theory area

**Both findings confirmed at medium severity. One numerical correction to the evidence of finding 1, which does not bear on the claim.**

Verifier: Claude Code, session `cc-fb70e5`, 24 September 2026. Target: `RT-AREA-modeltheory`, the red team on the Model theory area, whose single roadmap is `LogicAndDefinabilityInNumberTheory` (Logic, definability, valued fields and motivic integration), seven layers LD.0–LD.6. `cc-fb70e5` did not write it.

**Scope of my judgement, stated up front.** Model theory is not an area I have worked in this session. Both confirmations rest on reading the stage text and the pinned library rather than on independent mathematical judgement about the area's content — which is most of what verification is here, since both findings are claims about what a stage says and what a library contains, but it does limit what I can add beyond checking.

## Finding 1 — three layers declare an unresolvable prerequisite. **Confirmed, medium.**

The three mismatches are exactly as described:

| stage | prose `**Inputs.**` | `requires` |
|---|---|---|
| LD.0 | `FoundationsAndLibraryIntegration:LI.0` | `[]` |
| LD.1 | `…:LD.0`, `FoundationsAndLibraryIntegration:LI.4` | `["…:LD.0"]` |
| LD.2 | `…:LD.1`, `FoundationsAndLibraryIntegration:LI.2` | `["…:LD.1"]` |

And the convention claim holds, which is what makes these anomalies rather than house style: **LD.3**'s prose Inputs are LD.2, `SchemeAndStackFoundations:SF.1` and `MotivesAndAlgebraicCycles:MC.4`, and its `requires` holds all three.

`FoundationsAndLibraryIntegration` is indeed absent from the atlas — no file in `research/blueprint/atlas/roadmaps/`, none in `research/blueprint/roadmaps/`, and the string does not occur in `research/blueprint/atlas/index.json` — while its **document does exist**, at `content/campaign/FoundationsAndLibraryIntegration/README.md`.

So the base layer of the area's only roadmap has exactly one declared input, that input cannot be resolved, and because `requires` is empty the atlas graph shows LD.0 as having no prerequisites at all — which is not what the layer says. **Medium is right.**

**Correction to the evidence.** Recorded because the numbers are offered as evidence: I count the roadmap cited **39 times by 23 other roadmap files** (42 across 24 files if the subject roadmap's own three mentions are included), where the finding says "41 times" by 23 roadmaps. The roadmap count matches; the citation count is off by two. This does not bear on the claim, which rests on the absence of an atlas record rather than on how widely the missing roadmap is cited.

**On the fix.** It is correctly split into the part inside this area (add the named inputs to the three `requires` fields) and the part outside it (giving `FoundationsAndLibraryIntegration` an atlas record, which belongs to whoever owns the atlas build). A fix job raised from this finding should not be expected to complete the first half before the second exists — the `requires` entries cannot resolve until the record does.

## Finding 2 — LD.0 tells a worker to build what Mathlib has. **Confirmed, medium.**

LD.0's text, verbatim:

> "… integrate model-theory foundations from Mathlib where available. **Construct ultraproducts and prove the needed Los transfer theorem**; nonstandard arithmetic uses an explicit elementary extension …"

Against `Mathlib/ModelTheory/Ultraproducts.lean`, headed "# Ultraproducts and Łoś's Theorem". Every declaration and line the finding cites is right:

| declaration | line |
|---|---|
| `setoidPrestructure` | 49 |
| the ultraproduct `«structure»` | 74 |
| `funMap_cast` | 77 |
| `term_realize_cast` | 82 |
| `boundedFormula_realize_cast` | 95 |
| `realize_formula_cast` | 146 |
| Łoś's Theorem docstring, with `sentence_realize` following | 152 |

I checked these against a Mathlib tree at `30a58f79` rather than the pinned `082e2d3`, so exact line agreement was not guaranteed — that it holds anyway is stronger evidence than the finding needed.

**One mitigation the finding does not mention**, recorded without changing the verdict: the same sentence begins "integrate model-theory foundations from Mathlib where available", so the layer is not unaware of the library. But the explicit imperative that follows is "Construct ultraproducts and prove the needed Los transfer theorem", and a worker following LD.0 as written would rebuild both. That makes this a wording error rather than an oversight — and the error is still real. **Medium stands**, and the proposed rewrite (import the construction and the theorem; add only the transfer interface on top) is the right correction.

## The negative results

The `checked` list has seven entries, and the summary's claims about them are the kind a verifier can spot-check rather than re-derive: every other stage id resolves, the roadmap's prerequisites and consumer exist, the four Part II proposals routed here carry §15-conforming titles, nothing in the area is planned twice elsewhere, and every other target the layers plan is absent from both libraries. I confirmed the two that bear directly on the findings — that LD.3–LD.6 match prose to `requires` (so finding 1's three are genuinely exceptional), and that LD.0's remaining targets, the valued-field languages and the interpretation of arithmetic fields, are not what Mathlib's ultraproduct file supplies (so finding 2's fix correctly leaves them with LD.0). I did not independently re-audit the other five.
