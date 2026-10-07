# BP-RefinedTraceMethods--RT.5 — handoff

Issue #984. Prepared by Codex, session codex-qH6hKS. This is a complete
target-level planning pass for **RefinedTraceMethods:RT.5** and
**RefinedTraceMethods:RT.6**, ready for independent review. Both stages are
**planned**, neither is **closed**, and every implementation status is
**unchecked**. No formalization is claimed.

## Deliverables and validation

- [Packet](../packets/RefinedTraceMethods--RT.5.json): 79 nodes — 41 theorems,
  11 comparisons, 8 definitions, 18 constructions and 1 application; 116 API
  items, 79 unit tests, 12 planets (six per stage), and 10 baseline declarations.
- [Reader](../readmes/RefinedTraceMethods--RT.5.md): definitions, exact
  hypotheses, proof steps, direct prerequisites, uses, APIs, tests, acceptance
  cases, supplier catalogue, coverage ledger and unresolved contracts.
- [Suggested Lean](../suggested/RefinedTraceMethods--RT.5.lean): arithmetic
  indexing, actual polynomial quotient and Laurent coefficient maps, and
  ordinary chain-map compatibility against actual Mathlib types. The 76 higher
  node contracts requiring unavailable coherent types are explicitly omitted
  from executable code and recorded under their packet names in comments,
  following PROTOCOL section 13. Their APIs and test names are retained there.

`python3 scripts/check_blueprint.py
research/blueprint/packets/RefinedTraceMethods--RT.5.json` reports **0 errors and
0 warnings**. Declaration, API and test names agree across the artifacts.
All source excerpts were checked against the pinned downloaded texts. An audit
following exact node prerequisites through existing packets and integrated
decompositions reached 447 nodes and found no cycles; requested stage interfaces
remain explicit terminals rather than being assumed implemented.

The suggested file **compiled with `lean-check`** at Mathlib
082e2d37e8b0463410cdb532e111cd43d5a66174, with only 24 expected `sorry`
warnings. Memory was checked before compilation and exceeded the required
20 GB available. Subsequent source corrections changed mathematical comments
only. The baseline statements were read at that Mathlib commit and Tau Ceti
f790474821cf4256814db967cb154e7af3d0c369. Existing ordinary derived categories
and horn-filler quasicategories were not credited as coherent spectral or
presentable stable infinity-categories.

## What the pass covers

RT.5 chains from strongly continuous dualizable categories, continuous Calkin
categories and concrete nonconnective K-theory to localizing motives, relative
nuclear resolutions, enriched duality and motive rigidity. It plans
rigidification, refined localizing functors, pro-algebra killing and
localization towers, then the separate rational ku and periodic KU computations.
The latter retain derived completion, odd Ext-duality, the high-powered Moore
tower and the finite-torsion q-Hodge comparison obligations.

RT.6 covers the assigned BMS2 descent, QRSP Hochschild/THH/TC computations,
coefficient maps, trace Nygaard complex, motivic filtrations and twists;
crystalline, prismatic, syntomic and AΩ comparisons; characteristic-p TC
sheaves, Segal statements and Adams operations; and relative THH over the
spherical polynomial ring. The packet's 47-item BMS ledger maps every item
assigned to this scope to a node. Items assigned to RT.1, RT.2 or downstream
GeneralAlgebraicKTheory Part II retain those owners. The Scholze almost-module
application, Bhatt–Mathew announced K-sheaf comparison, Habiro comparison
interface and AMMN filtered interface have explicit nodes and dependencies.

Generic cotangent complexes, animated rings, derived completion, divided powers,
prisms, syntomic complexes, geometric AΩ, K-theory and cyclotomic objects are
imported from their existing owners. Exact existing supplier nodes are used
where their statements suffice; insufficient or missing interfaces are
requests. Unreviewed supplier plans are not treated as library implementations.

## Confirmed findings handled

- **RT-AREA-ktheory-2/28:** RT.5 imports RT.4:q-Hodge and
  RT.4:Habiro-comparison, including Wagner Theorems 4.27 and 5.63 and the HQ.3
  filtration objects. Their extra finite-torsion and p=2 hypotheses remain
  precise open contracts. They are not reproved in RT.5.
- **RT-AREA-ktheory-2/29:** the H.6 request specifies Burklund's multiplicative
  Moore spectra and the compatible E₁/E₂ towers and uniqueness statements
  required by Meyer–Wagner. A cofiber alone does not meet this contract.
- **RT-AREA-ktheory-2/36:** PR.4 supplies independently constructed syntomic
  complexes; RT.6 compares TC graded pieces to them. The direction is
  PR.4 → RT.6. PR.3's independent prismatic/Nygaard recognition is used without
  assuming the TC comparison that this packet proves.

The additional AI.0, AI.4, DD.4 and L.5 inputs are named explicitly. AI.7 and
PR.7 remain consumers. For the AMMN interface, the early RT.6 filtration and
map contracts supply RT.3b's proof; the interface exports the resulting bridge
with that theorem imported. It does not use PR.7 to construct the bridge.

## What remains before closure

There are **8 recorded gaps** and **16 open requests**. Independent review is
the next step. A closure refinement must resolve the following exact work:

1. Supply coherent presentable stable, spectral, animated, complete filtered
   and enriched-category types, then replace the 76 omitted higher contracts
   with actual Lean signatures. The elementary coefficient presentation also
   needs its grading and spectral realization.
2. Read and expand Ramzi Construction 4.75 for general Q-indexed rigidification,
   including cardinal/universe choices and their independence.
3. Audit the relative enriched multiplicative motive localization, cardinal
   conventions and comparison with the concrete K-theory model. Expand its
   Day-convolution and Morita/exact localization proof.
4. Obtain the compatible multiplicative Moore tower and the chosen
   finite-torsion q-Hodge comparison, especially the p=2 extension and maps.
5. Prove the syntomic-to-étale change-of-site, finite-coefficient and rigidity
   steps in Bhatt–Mathew Example 1.6, which the paper announces without proof.
6. Verify the supplied Habiro cyclonic maps and periodic reconstruction.
   Bounded solid comparison alone does not settle KU. Meyer–Wagner's expected
   refined Habiro descent is excluded from the asserted theorem.
7. Complete the coherent exact-couple and derived-limit convergence interface.
   No unconditional ordinary strong convergence is claimed in unbounded cases.
8. Resolve the requested Ainf/AΩ and finite-field finite-Tate map interfaces
   needed by the RT.6 comparison proofs.

The 16 supplier requests are E5:presentability, GeneralAlgebraicKTheory K.6 and
K.4, StableHomotopyKTheory H.6, HabiroCohomologyFoundations HQ.3,
AInfCohomology AI.0 and AI.4, KTheoryFiniteLocalFields L.5,
PrismaticCohomology PR.4, and this roadmap's RT.1, RT.2, RT.3, RT.3b,
RT.4:topological, RT.4:q-Hodge and RT.4:Habiro-comparison. The packet records
each required statement and its exact consumers. Refine those contracts in
their owning roadmaps; do not duplicate them here.

## Sources and source issues

The packet's `sources` records public URLs, pinned editions, download SHA-256
fingerprints, access dates and sections read. The reader reproduces the source
register. The audited passages are from Meyer–Wagner v4 (2025), Efimov's
localizing motives v1 (2025), Efimov's continuous K-theory **v4 of 5 October
2026**, the published BMS2 DOI PDF (2019), Bhatt–Scholze v4 of 12 January
2022, Bhatt–Mathew v2 (2022), Wagner v1 (2025), Scholze v3 (2026), BGT v4
(2013), and AMMN v2 (2021). The continuous K-theory edition has renumbered
definitions and its extension theorem is cited as Theorem 8.10.

Seven source issues record corrected statements and edition checks. Several
BMS2 slips were already found by its extraction and are credited there. The
published DOI PDF downloaded here still prints O_C^flat in the restricted
product of Lemma 9.4, although the extraction's correction metadata says the
published edition corrected it to O_C; visual inspection confirmed this
edition discrepancy. The mathematics uses O_C and the other job is untouched.
Meyer–Wagner's introduction reverses the trace-class classifier factors;
Definition 2.1 and the contraction require the order used in this packet.
No mathematical theorem was silently strengthened to overcome these slips.

The general Ramzi rigidification proof and the announced Bhatt–Mathew
change-of-site proof remain unaudited as described above. The supplied Wagner
and Habiro comparisons must still be justified in the exact finite-torsion and
periodic cases. All evidence needed to resume is retained in the packet,
reader and suggested file; no scratch files are required.
