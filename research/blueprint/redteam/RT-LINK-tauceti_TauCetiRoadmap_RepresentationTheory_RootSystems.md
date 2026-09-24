# RT-LINK-tauceti_TauCetiRoadmap_RepresentationTheory_RootSystems

Red team against the accepted link map for the Tau Ceti roadmap **Root systems, Weyl
groups, and the Cartan–Killing classification**: 19 outgoing links, 7 overlaps, 217
roadmaps examined.

**No finding.** The job for a link map is to check each link's evidence on both sides and
to look for links the map missed. Both halves were attacked, the second by independent
sweeps rather than by trusting the map's own screening. What follows is what was looked at.

## Each link's evidence, on both sides

Every link carries two evidence records, each with a `sourcePath`, a `quote` and a
`startLine`/`endLine`. All **38** were checked mechanically against the files: every quote
appears **verbatim** in its cited document, and every quote appears **within the exact line
range cited** — no failures, and no off-by-one tolerance needed anywhere.

**Whether `explicit` is earned.** Of the 11 links marked `explicit`, ten have an evidence
quote that names the other roadmap or a declaration shared by both sides:
`DynkinType.IsLongSimpleRoot` for the CFSG index glue (whose consumer quote reads "which
simple roots are long is `DynkinType.IsLongSimpleRoot` upstream");
`DynkinType.simplyConnectedRootDatum` for the ambient-group carrier (whose consumer quote
ends "(root systems Layer 6)"); `DynkinType.cartanMatrix` for the graph-twisted Steinberg
maps.

The eleventh — the chamber link from Layer 4 to ClassicalGroups Layer 3 — is the only one
whose two quotes state the same mathematics without sharing a name: `dominantChamber b =
{x : M | ∀ i ∈ b.support, 0 ≤ P.coroot' i x}` on one side, `DominantWeight n`, the weakly
decreasing `λ : Fin n → ℤ`, on the other. I considered reporting the confidence label and
did not: both texts state the dependency, and the link's own reason is precise about its
limits — it "supplies the cone definition and its real root-space geometry only", and
warns that the consumer "must not apply a real ordered-field theorem direct[ly]".

## Links the map missed

**Coverage arithmetic first.** The `examined` array holds 217 roadmap records and the links
reach seven more; the atlas index lists 211 roadmaps, and every one is examined or linked.
Seven examined ids are no longer in the index — the map records 212 roadmaps at the
revision it read — so it screened more than exists now, not less.

**An independent vocabulary sweep.** Every stage of every roadmap was searched for root
system, root datum, `RootPairing`, `RootDatum`, Weyl group, Dynkin, Cartan matrix,
Cartan–Killing, simple roots, positive roots, coroot and Coxeter. Every roadmap with three
or more mentions is linked or overlapped — CFSGStatement, QuiverRepresentations,
LieHighestWeight, LieGroups, ReductiveGroups, ClassicalGroups, GrothendieckEulerForms,
IntegralLattices — with one exception, ZigzagPreprojective, which is deliberate and
documented: its examined record says the matching link and overlap "are already recorded in
the live Zigzag packet and are omitted here to avoid duplication", and `alreadyRecorded`
carries that packet with its one link and one overlap stage.

**A second sweep, for dependencies that avoid the vocabulary.** ADE classifications, du Val
and simple singularities, del Pezzo lattices, Iwahori–Hecke algebras, crystal bases,
Kac–Moody and affine root systems, Tits buildings, nilpotent orbits and Springer theory,
Bruhat decompositions, Macdonald polynomials, flag varieties. Du Val singularities, del
Pezzo surfaces, crystal bases, nilpotent orbits and Macdonald polynomials appear nowhere in
the atlas at all. The Hecke-algebra, Bruhat and flag-variety hits are automorphic and
Shimura roadmaps using them as established tools, not as root-system consumers.

That left one real candidate, **ReductiveGroupsPartII**, whose RG2.1 builds affine root
systems and apartments and RG2.2 builds buildings — and which the map examined with the
result `none`. Its note reads: "RG2.1 explicitly keeps absolute roots with ReductiveGroups
and includes multipliable relative roots; buildings, parahorics and integral duality remain
PartII, not RootSystems." Checked in the source: RG2.1's description ends with the sentence
"Absolute roots remain supplied by ReductiveGroups." The note is exact.

I also chased RG2.5, "Construct a pinned split dual group over ℤ **from the dual root
datum**", as a possible missed edge. It is not one: RootSystems takes root-datum duality
from Mathlib, its Layer 6 saying "The adjoint form is `RootPairing.flip` of the dual type's
datum, not a second pinned definition", so the dual datum reaches RG2.5 through
ReductiveGroups and the library rather than from this roadmap.

**The sharpest objective test.** Which documents in the atlas cite RootSystems by name or
by document path at all? Exactly three — CFSGStatement, ReductiveGroups and
SpinRepresentations — and all three are linked. Nothing cites this roadmap without being
connected to it.

## The map's own claims

Its `inputGraph` states "no recorded stage edge incident to RootSystems at the audited
snapshot". Still true of the current atlas: counting both `stageEdges` records and stage
`requires` entries across every roadmap extract gives **zero** edges incident to any
RootSystems stage, so the map is not silently contradicted by edges recorded since.

The seven overlaps were read in full. Each names the stages on both sides, gives a detail
and recommends `rescope` or `keep`, and each is a real observation rather than a
restatement of a link. Two deserve recording as work the map *did*, not missed:

- **Overlap 2** finds that ClassicalGroups names a GL_n root datum from RootSystems
  although GL_n's central-character lattice is outside RootSystems' stated scope.
- **Overlap 4** finds a hypothesis mismatch — the consumer allows nonreduced restricted
  root systems while the supplier assumes reducedness — and declines to assert an
  unconditional chamber edge on that basis.

## What I did not do

No Lean was compiled and nothing here is formalised; a link map is a claim about which
stages depend on which, and its evidence is document text. I verified that each quote is
real, is where it is said to be, and supports the edge drawn from it, and I searched the
atlas independently for edges that should exist. I did not re-derive the root-system
mathematics of either side.
