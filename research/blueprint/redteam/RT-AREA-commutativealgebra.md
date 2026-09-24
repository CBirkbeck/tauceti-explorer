# RT-AREA-commutativealgebra

Red team against the **Commutative algebra** area: `DeformationAndDerivedPatchingAlgebra`
(*Commutative algebra for deformation theory and patching*, 9 stages),
`HabiroCyclotomicCompletions` (6) and `HabiroRings` (8).

**No finding.** What follows is what was attacked, including two structures that look like
defects and are measured and explained rather than reported.

## Structure

**Prerequisites all resolve.** Every `requires` entry of the area's 23 stages points at a
real stage, with one exception that is house practice: `HC.1` requires
`UPSTREAM:Polynomial-cyclotomic-completion-algebra`, and `UPSTREAM:` sentinels appear in the
`requires` of **76 stages across 29 roadmaps**. For context I measured the whole atlas: it
has **zero** unresolved non-sentinel `requires` anywhere. The roadmap-level prerequisites and
consumers all resolve too, including HabiroRings's eight prerequisites and the nine consumers
of the deformation roadmap.

**No restructuring conflict.** Six proposals name the area — RS-05, RS-08, RS-10, RS-16,
RS-18, RS-33 — which is the kind of density where two might narrow the same layer in
different directions, a conflict no single proposal's own review would catch. Twenty layers
and roadmaps are acted on and **every one by exactly one proposal**: RS-08 narrows P7, R03.1
and R03.3 and keeps the roadmap; RS-10 keeps or narrows all of HC.1–HC.6 and HR.1–HR.7.

**The routed papers name real stages.** 24 source routes reach the area carrying 48 stage
references between them; all 48 resolve. The deformation roadmap alone is a source for 21
extractions, among them Calegari–Geraghty, Iyengar–Khare–Manning, Le–Le Hung–Levin and four
Boxer–Calegari–Gee–Pilloni papers.

## Two things that look like defects

**HR.5 and HR.5-number-field-comparison carry byte-identical descriptions.** Their titles
differ ("The relative Habiro ring and its Taylor presentation" versus "Number-field
comparison") and so do their `requires`, so the sub-stage appears to have no text of its own
— a worker sent to build the comparison would read the parent's section.

It is not a defect of this roadmap. The README places
`<a id="stage-HR.5-number-field-comparison"></a>` *inside* the `## HR.5` section, and this is
the atlas extraction's universal handling of such an anchor: across the atlas **119 of 1962
stages share a description with a sibling**, in HabiroCohomologyFoundations,
EtaleDualityAndPerverseSheaves, K2SymbolsBrauer, MotivicEtaleKTheory, StableHomotopyKTheory,
GeneralAlgebraicKTheory and others.

**DeformationAndDerivedPatchingAlgebra mixes two id families**, R03.1–R03.6 and P7–P9, which
looked like a merge artefact. It is not: the roadmap's own README carries `## R03.1` through
`## R03.6` and then `## P7`, `## P8`, `## P9` as separate sections. The keys P7–P9 are also
used by PadicHodgeTheory and PerfectoidSpaces, but stage ids are roadmap-qualified, so
`DeformationAndDerivedPatchingAlgebra:P7` and `PerfectoidSpaces:P7` are different stages.

## Duplication

Swept the three roadmaps against each other and against the whole six-roadmap Habiro family
— `AnalyticHabiroStack`, `HabiroCohomologyFoundations`, `HabiroCyclotomicCompletions`,
`HabiroNahmSeries`, `HabiroNumberFields`, `HabiroRings` — by term overlap across all 55
stages in scope. Twelve candidate pairs cross the threshold, and **every one** is between
HabiroNumberFields and HabiroNahmSeries, neither of which is in this area; all twelve share
the readiness-checkpoint boilerplate rather than any mathematics. Nothing in this area is
planned twice.

## The libraries

Everything the three roadmaps plan is genuinely absent at the pin: Habiro rings, cyclotomic
completions, Schlessinger's criterion, deformation functors, complete-intersection criteria,
patching and Taylor–Wiles systems all return zero declarations. Perfect complexes, which P7
builds on, do exist — consistent with P7 being a derived-coefficient-change layer rather than
a construction of perfect complexes.

## One omission probe, and why it is not a finding

WORKERS.md lists the Koszul complex among the notions the libraries lack, and §15 requires
such a notion to be planned once, in the roadmap that owns it. It **is** planned — by
`IntegralHeckeAndGaloisDeterminants:IHG.6`, "Build Koszul/Buchsbaum–Rim complexes, their
grade/regularity hypotheses, exactness". This area never mentions it.

I did not report that as a gap. R03.3 plans its depth theory directly — "regular sequences,
depth, Cohen–Macaulay rings/modules, projective dimension, Auslander–Buchsbaum and the exact
complete-intersection criteria used in patching" — and that does not require the Koszul
complex. Inventing a dependency the roadmap does not state would not be a finding.

## What I did not do

No Lean was compiled and nothing here is formalised. I read the three roadmaps for
structure, coordination, prerequisites and coverage, and the wider Habiro family at the
depth needed to test duplication. I did not re-derive the patching mathematics, and I did
not audit the 21 extractions that use the deformation roadmap as a source beyond checking
that their routes name stages that exist.
