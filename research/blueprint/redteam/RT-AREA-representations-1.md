# RT-AREA-representations-1

Red team against part 1 of the **Representation theory** area: `ReductiveGroupsPartII`,
`SmoothRepresentationsOfLocalGroups`, and the Tau Ceti roadmaps `ReductiveGroups`,
`RepresentationTheory`, `RepresentationTheory/ClassicalGroups` and
`RepresentationTheory/RootSystems` — 41 stages — with the eleven roadmaps of the other two
parts read for what is planned twice across them.

Three findings. The area is otherwise in good order: the prerequisite graph is sound, the
boundaries with SchurWeyl and LieHighestWeight are pinned in the sources, and the one
substantial internal overlap is already resolved by an accepted restructuring proposal.

## Findings

### 1. ClassicalGroups names the wrong owner for the Weyl formulas — error, medium

ClassicalGroups Layer 5 says its dimension theorem is

> the specialization of the abstract Weyl dimension formula `∏_{α > 0} ⟨λ + ρ, α⟩ / ⟨ρ, α⟩`
> from [`../RootSystems`](../RootSystems/README.md)

and Layer 4 says

> The general Weyl character formula for `SLₙ`, `Spₙ`, `SOₙ` follows from
> [`../RootSystems`](../RootSystems/README.md)'s Weyl-group sum over the appropriate root
> system.

Both formulas are written with ρ. RootSystems' **Scope boundary** paragraph says:

> This roadmap stops at the root system, its Weyl group, chambers, and the classification.
> The weight and root lattices, the coweight and coroot lattices, the fundamental weights,
> dominant integral weights, and `ρ` — **the lattice apparatus that the Weyl character and
> dimension formulas run on** — are **not** built here; they belong to
> [the highest-weight roadmap](../LieHighestWeight/README.md)

So ClassicalGroups points at a supplier for precisely the input that supplier disclaims,
and names the formulas that RootSystems' own sentence singles out. LieHighestWeight is the
owner in fact as well as by assignment: its Layer 6 is "the Weyl character, dimension, and
Kostant formulas".

Nothing else records this. Of the restructuring proposals touching the area — RS-05,
RS-17, RS-21, RS-24, RS-31 — none names ClassicalGroups or RootSystems. The accepted
RootSystems link map catches the same *species* of error elsewhere (its overlap 2:
"ClassicalGroups currently names a GL_n root datum from RootSystems even though that
provider is not in RootSystems' stated scope") and records the ρ boundary in overlap 1, but
neither overlap names ClassicalGroups Layer 4 or Layer 5.

The fix is two sentence edits in ClassicalGroups — cite LieHighestWeight, which that
roadmap already cites ten times, for the abstract formulas, and keep RootSystems cited for
the positive system the sums and products are indexed by. RootSystems' scope boundary is
right as written and should not be widened to absorb ρ.

### 2. Two Part II candidates for RootSystems in one direction — duplicate, medium

Five extractions route items to `RootSystemsPartIIDominanceAndDemazure` — PAPER-HE-18
(21 items), PAPER-HE-21 (28), PAPER-KISIN-PAPPAS-ZHOU-26 (22),
PAPER-LE-LEHUNG-LEVIN-ETAL-23 (26), PAPER-ZHU-17 (1) — each saying it reuses an existing
candidate ("Reuse the existing candidate identifier and shared supplier; this is an
additional source, not a second roadmap"). PAPER-KISIN-ZHOU-25 routes a further 8 items to
a **separate** id, `RootSystemsDominancePartII`, and the string
`RootSystemsPartIIDominanceAndDemazure` does not occur anywhere in its record. No
`coalescence` block in any of the six links the two.

The duplication is known — but in one record only. PAPER-KISIN-PAPPAS-ZHOU-26 writes:

> The Kisin–Zhou candidate RootSystemsDominancePartII overlaps this earlier direction:
> consolidate its dominant-coroot/Stembridge lane into this candidate at design intake,
> retaining both papers' stable item ids and the additional Frobenius-orbit proof
> obligation. **Do not build two dominance orders.**

with `ownershipReconciliation` reading "Retain RootSystemsPartIIDominanceAndDemazure from
HE21; consolidate the later KZ25 RootSystemsDominancePartII overlap at design intake."

That instruction travels with KPZ26's record and nowhere else. A design job generated from
PAPER-KISIN-ZHOU-25's own route would read a record with no cross-reference and no
coalescence entry — and would build the second dominance order KPZ26 says not to build.
The fix is to re-point KZ25's route at the shared id, keep its 8 item ids as KPZ26 asks,
and record the identification on both sides so it survives whichever record a design job
starts from.

### 3. Two Part II titles are not prefix extensions — error, low

Section 15 requires the title `"<existing roadmap>, Part II: <what it adds>"`. The parent's
atlas title is "Root systems, Weyl groups, and the Cartan-Killing classification", and
HE-18, HE-21, KPZ26 and ZHU-17 all use it exactly. Two do not:

- PAPER-LE-LEHUNG-LEVIN-ETAL-23 routes to *the same id* as those four under the title
  "Root systems, Part II: dominance, affine orders and admissible pairs" — so one candidate
  roadmap carries two different names.
- PAPER-KISIN-ZHOU-25 titles its candidate "Root systems, Part II: integral dominance
  steps".

Both drop "Weyl groups, and the Cartan-Killing classification". The fix is mechanical, and
for the first the title should simply be made identical to the four that already agree.

## What held

**The prerequisite graph.** Every `requires` entry of the area's 41 stages resolves to a
real atlas stage, none dangling, and the whole atlas requires-graph — 1962 stages, 3382
edges — is acyclic, so nothing in the area sits in a cycle.

**`RepresentationTheory` having zero stages** looked like a gap and is not one: its document
says "this page is the index and the map of how they fit together". It is the family index,
and it correctly records the six consumers that depend on the family.

**Nothing is planned twice across the parts.** A term-overlap comparison of all 142 stages
of the seventeen roadmaps raised one candidate pair, between AdoIwasawa's PBW layer and
LieHighestWeight's enveloping-algebra layer — both in *other* parts, and sharing vocabulary
rather than a target.

**The boundaries that usually duplicate are pinned in the sources.** ClassicalGroups
Layer 2: "`../SchurWeyl` owns the group algebra ℂ[Sₐ], the **Young symmetrizer** `c_λ`, and
**Schur-Weyl duality**; this roadmap owns the `GLₙ`-equivariant image `Sᵘ V`". Layer 4: the
Schur polynomials are "**owned by `../SchurWeyl`**, which already builds them; this roadmap
**consumes** them and does not re-define them, avoiding a second incompatible foundation".

**The one real internal overlap is already resolved.** ReductiveGroups Layer 7 lists "the
relative root system for non-split groups" and "Bruhat decomposition and BN-pairs / Tits
systems" among its targets, while RG2.1 builds relative roots and RG2.4 proves Cartan and
Iwahori–Bruhat decompositions. RS-31 fixes exactly this: its owners move "Underlying
algebraic relative root system and relative Weyl group" and "Abstract Bruhat decomposition
and BN-pair/Tits-system theory" to anchor Layer 7, and narrow RG2.1 and RG2.4 to import
them. Not reported.

**The modulus character is not a gap.** SR.2 uses "a specified square root of the modulus
character" and SR.6 uses `delta_P`, with no layer visibly constructing either — but at the
pin Mathlib has `Mathlib/MeasureTheory/Group/ModularCharacter.lean`, with
`modularCharacterFun` and `modularCharacter : G →* ℝ≥0`, plus `haarScalarFactor` and the
`Haar/MulEquivHaarChar` and `Haar/DistribChar` files.

**Three further candidate omissions turned out to be planned or library-covered.**
Moy–Prasad filtrations appear nowhere in the atlas by name but are exactly RG2.1's "root
subgroups and filtrations indexed by their actual valuation sets". The Iwahori–Hecke
algebra is SR.1's construction at `U` the Iwahori, since SR.1 "identif[ies] `e_U` corners
with `U`-biinvariant Hecke algebras". The invariant measure behind SR.1's convolution is
deliberately handled by A-valued volumes on open cosets and index denominators, not by
real-valued Haar measure.

**ReductiveGroups Layer 8's thinness is declared, not accidental.** At 397 characters it
covers the isomorphism and existence theorems, the Dynkin classification of semisimple
groups, central isogenies and Chevalley existence — but it is titled "long horizon" and
flags relative theory over a base and pseudo-reductive groups as "far-future
generalizations".

**Nine Part II candidates for ReductiveGroups are not duplication.** They run in nine
distinct directions: monodromy models, Grothendieck–Serre, arithmetic models, coadjoint
invariant theory, semiglobal flags, stabilizers and Levis, integral representations,
modular representations of finite reductive groups, and sigma-dual homomorphisms. Only
RootSystems' two candidates collide, which is finding 2.

## What I did not do

No Lean was compiled and nothing here is formalised. Declarations were read at the pinned
commits where a claim turned on one — the modular-character files above. I read the
eleven other-part roadmaps at the depth the job asks for, layer titles and descriptions,
not in the depth their own red teams will; a duplication lying entirely between two of
those roadmaps is theirs to report, and the one candidate pair I saw is noted above rather
than claimed.
