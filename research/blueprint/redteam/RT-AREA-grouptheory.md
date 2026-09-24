# RT-AREA-grouptheory

Red team against the **Group theory** area: the Tau Ceti roadmaps
`CFSGStatement` — *Stating the classification of finite simple groups*, 9 layers — and
`ProfiniteProPGroups` — *Profinite and pro-p groups*, 12 layers.

One finding, medium. The area is otherwise unusually well coordinated, and the two overlaps
that looked like duplication turn out to be settled in the sources themselves.

## Finding

**RT-AREA-grouptheory/1 — library-claim, medium.** `ProfiniteProPGroups` Layer 3 cites a
Mathlib declaration that does not exist at the pinned commit.

Its prerequisite line reads

> *Needs:* M `frattini`, M `IsPGroup.exists_maximal_subgroup_normal` and the finite Frattini
> lemmas; L3 `IsProP` API; L0 quotients.

where the roadmap's `M` prefix means Mathlib supplies it. `frattini` does, at
`Mathlib/GroupTheory/Frattini.lean:24`. `IsPGroup.exists_maximal_subgroup_normal` does not —
not under that name, and not under any other I could find. The declarations index has no such
name; the complete list of `IsPGroup.*` declarations contains nothing about maximal subgroups
or normality beyond the sup/inf lemmas; `Mathlib/GroupTheory/PGroup.lean` has no such
theorem; and Mathlib's entire Frattini API is six declarations — `frattini`,
`frattini_le_coatom`, `frattini_le_comap_frattini_of_surjective`, `frattini_characteristic`,
`frattini_nongenerating`, `frattini_nilpotent` — none of which is the normality statement.

The other **41** Mathlib names this roadmap cites with the `M` prefix all resolve at the pin,
so the convention is used correctly everywhere else: this is one wrong name, not a
misunderstanding.

The mathematics is in Mathlib, but only by composing three separately named results:

- `IsPGroup.isNilpotent` — `Mathlib/GroupTheory/Nilpotent.lean:1247`
- `Group.normalizerCondition_of_isNilpotent` — `Mathlib/GroupTheory/Nilpotent.lean:1201`
- `Subgroup.NormalizerCondition.normal_of_coatom` —
  `Mathlib/Algebra/Group/Subgroup/Order.lean:47`, docstring: "In a group that satisfies the
  normalizer condition, **every maximal subgroup is normal**"

so a builder following the line as written looks for one declaration and finds nothing. The
fix renames the prerequisite to that route; nothing about the layer's own targets changes.

## What held

**The two apparent duplications are explicit coordination**, in the sources, both ways.

`CFSGStatement` Layer 0 and `ReductiveGroups` Layer 9 both concern pinned
Chevalley–Demazure groups. Layer 0 says:

> **Consume, rather than duplicate**: … reductive algebraic groups, whose Layer 9 gives
> pinned Chevalley–Demazure group schemes over `ℤ`, base change, points, and root subgroups.

and Layer 9 says it "exists because a downstream consumer needs it …: the CFSG statement
roadmap".

`ProfiniteProPGroups` Layer 6 and `ProfiniteCohomology` Layer 11 both concern cohomological
dimension. Layer 6 opens:

> `cd_p G` is `ProfiniteCohomology.cd_p p G` … That declaration belongs to the Profinite
> Cohomology roadmap, and **this roadmap defines no second cohomological dimension**.

citing rather than restating the two reduction theorems and owning only the pro-`p`
dévissage. And the dependency is recorded machine-readably: the ProfiniteProPGroups link map
carries `ProfiniteCohomology layer-11 → ProfiniteProPGroups layer-6`, among eighteen links
from that roadmap into this one.

**No other concept is planned twice.** Swept across the atlas: supernatural numbers and free
pro-`p` groups occur in no other roadmap; the embedding-problem overlap with
`InverseGaloisAndArithmeticFundamentalGroups` IG.4 is already resolved by RS-29, whose owners
move the generic finite embedding problem and its weak solution to Layer 5; the Demushkin
mentions elsewhere are consumers, not plans.

**Coverage is complete.** All 21 layers have entries in `data/library-coverage.json` from
AUDIT-21 and AUDIT-22, both with accepted reviews.

**Two things that look like defects and are programme-wide conventions**, so not reported —
and worth stating with numbers, because they will look like findings to the next reader:

- Every layer's atlas `status` is `unknown`. Across the atlas, **all 656 upstream stages**
  are `unknown` and **all 1306 campaign stages** are `needs_source_decomposition`; the field
  records no build state anywhere.
- Every layer's `requires` is empty. Only **4 of 656** upstream stages populate `requires`,
  against **1289 of 1306** campaign stages; upstream roadmaps state prerequisites in the
  layer prose instead.

**The library matches the plans.** Demushkin groups and cohomological dimension have zero
declarations at the pin and are correctly planned; supernatural numbers, profinite
foundations, Sylow theory and the Frattini subgroup exist and are recorded built or partly
built by the two audits.

**The one routed paper conforms.** `PAPER-BRESCIANI-24` proposes
`ProfiniteProPGroupsPartIISplitCompletion` with the title "Profinite and pro-p groups, Part
II: exactness of completion for split extensions" — an exact prefix extension of the
parent's atlas title, with a free id.

**RS-16's owner assignment is accurate.** It gives "Completed Z_p group algebra of a
profinite group, compact actions and procyclic/dyadic coordinates" to Layer 9 prerequisites,
and that layer does define `completedGroupAlgebra p Γ := lim_U ℤ_p[Γ/U]` for a general
profinite `Γ`, with its compact topological-algebra package, treating both the procyclic and
the dyadic `C₂ × ℤ₂` shapes.

**The two stages keyed "Layer 9" are deliberate**, not a collision: the README carries
"### Layer 9 prerequisites: two owned inputs" and "### Layer 9: the classification of
Demushkin groups" as separate headings, the first saying its inputs are "built here, before
the classification".

## What I did not do

No Lean was compiled and nothing here is formalised. Declarations were read at the pinned
commits, in the source where the finding turned on what exists. I read the roadmaps for
coordination, coverage and prerequisites, not to re-derive the Demushkin classification or
the CFSG statement.
