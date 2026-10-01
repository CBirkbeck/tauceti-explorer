# RT-RS-33: red team of the accepted homotopy restructuring

Codex, session `codex-5ebb6f`; issue #5121. Inspected explorer commit
`fd2c558a5a7e1620290b141b35a63f0298a1700d`, on 30 September–1 October 2026.
This session did neither RS-33 nor REV-RS-33.

**Result: no additional defect in the accepted restructuring.** All twelve
stages remain. The seven narrowings preserve the checked targets and import
real supplier interfaces. The twenty-five ownership records and 174 proposed
links do not introduce a stage cycle or leave a checked consumer without its
input.

This result concerns the ownership proposal at the inspected commit. It does
not close the member's seven source gaps or certify a complete homotopy
blueprint. The two K.4 node-parent migrations remain required. RS-33 and
REV-RS-33 explicitly record them, and RT-AREA-ktheory-1/4 already confirms
the underlying inversion. They are existing work, not a new finding.

## Ownership attack

I read the complete member, AlgebraicTopology and UniversalCovers documents,
the complete GeneralAlgebraicKTheory and EnhancedDerivedSheaves documents,
the relevant GrothendieckEulerForms, low-degree K-theory, arithmetic-duality
and completed-cohomology supplier contracts, the family file, accepted result,
author report and independent review. I checked the member's 25 integrated
nodes, 28 links and seven gaps, and its reviewed AUDIT-30 coverage.

| Changed layer | Target that remains | Supplier boundary tested |
| --- | --- | --- |
| H.1 | BG, bar/singular comparison with local coefficients, natural transformations, categorical equivalences, CW realization and scoped product comparison | AT1/2/4/8 and UniversalCovers 2/4 supply ordinary topology. UniversalCovers explicitly does not construct BG for an arbitrary group. Existing nerve and realization carriers are reused. |
| H.2 | Path-space fibres and pullbacks, pointed-set end terms, Quillen A/B, quasi-fibrations and realization lemmas | AT5 supplies a Serre carrier, AT8 its scoped pair/Kan/cubical API, UniversalCovers 3 ordinary higher-homotopy maps. Neither the pair LES nor the Serre spectral sequence replaces the new fibre LES or quasi-fibration proof. |
| H.3 | Perfect-normal-subgroup plus construction, quotient fundamental group, pulled-back local-coefficient homology, acyclicity and qualified universality | AT1/2/3/4/5/8 and UniversalCovers 2 supply ordinary cell, covering, homology and Hurewicz inputs. The new plus comparison, obstruction argument and source gaps stay in H.3. |
| H.4 | Homotopy group completion, localization, cofinal stabilization, BGL-plus component comparison and coherence | GrothendieckEulerForms 2 supplies algebraic group completion, Z.1 projective complements, U.1 stable GL/perfectness, H.3 plus. Q-to-plus remains K.2:plus. Algebraic K0 is not itself the homotopy group-completion theorem. |
| H.5:spectra | Concrete spectra, model comparisons, integer-indexed homotopy groups, Eilenberg–Mac Lane spectra, truncations and generic smash | EDS E0 and E5:abstract supply abstract stable/monoidal interfaces. Their existence does not construct or verify the concrete model. The late EDS spectra comparison is not imported backwards. |
| H.5:S-delooping | Iterated-S connective spectrum assembly and indexing/naturality comparisons | Early K.4:construction supplies additivity and relative-S delooping. Generic smash comes from H.5:spectra; actual biexact K-products are K.7's application. |
| H.6 | Spectrum cofibres/Bocksteins, the actual p-power tower, homotopy limits, Milnor sequence, filtered-spectrum exact couples, convergence and fracture | R02.1 supplies module-level ML/lim1 criteria, AT4 the ordinary skeletal special case. D7 owns compact-cochain derived limits and CC.2 their arithmetic use. None replaces the general spectrum construction. |

H.5 remains an aggregation of its children. KU-existing, KU-homotopy,
KU-plus and KU-spectra remain readiness checkpoints. Negative-degree
spectrum tests, nonzero torsion/Bockstein and lim1 tests, local-coefficient
conditions, component restrictions and strictification obligations survive
in the retained contracts. The proposal does not infer a natural product
splitting or an unrestricted realization theorem from these imports.

## Consumers and order

I read all 23 immediate external consumer descriptions and prerequisites of
the seven narrowed stages in a fresh assembly of the inspected commit:

- ArithmeticKTheory N.3:finite-generation, N.5 and N.6; BorelRegulators R.3.
- GeneralAlgebraicKTheory K.1, K.2:plus, K.3, K.4, K.4:construction, K.5,
  K.7 and KU-waldhausen.
- HabiroNumberFields HB.1/HB.2 and HabiroRings HR.2.
- K2SymbolsBrauer T.1:plus and K3BlochGroups V.1/V.4.
- KTheoryFiniteLocalFields L.1, MotivicEtaleKTheory M.6a/M.6b, and
  RefinedTraceMethods RT.1/RT.4:topological.

The review-added eighteen forwarding links cover the later arithmetic,
Habiro and K3 consumers. The consumers still owe their own applications:
arithmetic finite generation, rational Hurewicz use in R.3, Q/plus comparison,
K-products, Adams-fibre calculations, motivic convergence and trace
comparisons are not transferred wholesale to H. In particular HR.2's
spectrum completion import does not replace its separate generic derived
ring/ideal completion.

The graph has **2907 stages, 8322 distinct edges and 2958 endpoint vertices**,
and is a DAG. I tested the proposed endpoints and supplier access to each
consumer, including paths which avoid the narrowed layer. AT3 has no such
bypass to H.4, but H.4 consumes H.3's retained plus comparison, rather than
requiring a separate direct excision construction. This is not a lost input.

Applied RS-33 metadata records the extension and seven narrowings, 151 added
edges, and the documented skipped UPSTREAM sentinel. Proper-stage links are
live; the sentinel already occurs in the inherited H.1 prerequisites and is
not a stage. The exact Part II title and AlgebraicTopology base are applied.
No anchor stage depends on this campaign member. No Tau Ceti document or
stage is changed by the proposal. I have not reviewed or repaired mathematics
internal to Tau Ceti's own roadmaps.

## Known K.4 migration: verified, still unapplied

Both integrated GeneralAlgebraicKTheory nodes still have parent K.4 at the
inspected commit:

| Stable node ID suffix | Required parent |
| --- | --- |
| K.4/waldhausen-additivity-theorem | GeneralAlgebraicKTheory:K.4:construction |
| K.4/relative-S-construction-fibration-and-delooping | GeneralAlgebraicKTheory:K.4:construction |

The relative-S node supplies
`H.5:S-delooping/iterated-S-construction-omega-spectrum`, while the stage
graph puts H.5:S-delooping before late K.4. Projecting the eleven links
incident to these two nodes onto their present parents, and adding them to
the stage graph, exposes K.4 → H.5:S-delooping → K.4. Reassigning just those
parents to K.4:construction makes this local projection plus the stage graph
acyclic, while preserving node IDs, statements and links. This does not
assert that the literal stage graph is cyclic or that every leaf-level
graph in the atlas has been checked.

The mathematical direction is real. Waldhausen's printed p.330 says
“the additivity theorem is needed to prove this” about the loop equivalences.
Proposition 1.5.3 on p.342 uses Proposition 1.5.5, whose proof on p.343
uses additivity. I read these passages and the relative-S/path construction
directly in the public source, and visually checked the displayed proposition.

This is already the confirmed **RT-AREA-ktheory-1/4**. The inspected
REV-FIX-RT-AREA-ktheory-1 report marks the remaining stage-parent work as
partial. RS-33's H.5:S-delooping reason and REV-RS-33 integration note 1 name
the exact migration. The accepted proposal does not omit it, and this
red-team result does not generate another copy of that fix.

The maintainer or authorized owning blueprint job must apply the migration.
The restructuring applicator updates extension/narrowing metadata and stage
links, not decomposition node parents. Narrative instructions and
`proposedParentStageId` metadata are not an applied parent change. This issue
authorizes only the two red-team files, not an edit to the owning decomposition.

## Source and library evidence boundaries

Public sources retrieved/read on 30 September–1 October 2026:

| Source | Passage actually read | SHA-256 of retrieved PDF |
| --- | --- | --- |
| [Quillen, Higher algebraic K-theory I](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/Quillen-Higher-I.pdf) | Section 1, LNM pp.89–99; PDF pp.5–15, including Theorems A/B and proofs | `5d2db42d3fec06156da4e6f6d5a85fb9a04358df59141d3abe74a57b815bae04` |
| [Weibel, author K-book IV](https://www.math.rutgers.edu/~weibel/Kbook/Kbook.IV.pdf) | PDF pp.38–45 and 67–71: S-inverse-S, localization, BGL-plus/cofinality, S-construction and infinite-loop structure | `9f1c1b8cccfe19d547c27dd04c61f198fd7a0cddd0018a0b84442b00fa575248` |
| [Hatcher, Algebraic Topology](https://pi.math.cornell.edu/~hatcher/AT/AT.pdf) | Printed pp.373–374; PDF pp.382–383: cell-attachment plus and perfect subgroups | `bebb3032bf9021b956da3bd070eb6c67dc662cf849be9cdf6679f677560e5618` |
| [Waldhausen, Algebraic K-theory of spaces](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/kspaces.pdf) | Printed p.330 and pp.341–344; PDF pp.13 and 24–27: iterated-S loop structure, path/relative-S fibration, additivity and biexact pairing | `2f452696998132a438fe7596deb681fefcf829829b4604ca1029083e4dcb1c6e` |

These are selected passages, not a claim to have read all four works.
Quillen's imported Dold–Lashof/Milnor lemmas, general proper-realization
criteria, plus obstruction/universality and convergence/fracture sources
remain outside this source reading. The seven explicit member gaps survive.
The realization/fibration handoff in RT-AREA-ktheory-1/15 also remains:
a levelwise equivalence theorem and the ordinary Serre spectral sequence
do not discharge it.

I verified the actual library HEADs and read these positive interfaces:

- [Mathlib nerve, nerveMap and nerveFunctor](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicTopology/SimplicialSet/Nerve.lean).
- [Mathlib TopCat.toSSet, SSet.toTop and sSetTopAdj](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicTopology/SingularSet.lean),
  including the whole file and its universe/adjunction construction.
- [Tau Ceti local systems, constants, pullback, transport, monodromy and basepoint change](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/AlgebraicTopology/LocalCoefficient.lean).

The module-valued fundamental-groupoid functor and pullback API do not supply
twisted singular chains or the bar comparison. Nerve and realization
adjunction carriers do not prove the required product or homotopy comparison.
Inherited AUDIT-30 absence results are accepted coverage, not fresh exhaustive
absence claims by this session.

## Validation

- `python3 scripts/check_restructure.py research/blueprint/restructure/RS-33.result.json`: passes.
- `python3 scripts/check_redteam.py research/blueprint/redteam/RT-RS-33.result.json`: passes.
- Intake file validation of the two deliverables: no problems.
- Whitespace validation and the stage DAG, forwarding and parent-projection
  checks described above pass within their stated scope.

No Lean file is a deliverable. No Lean was run and no formalization is claimed.
