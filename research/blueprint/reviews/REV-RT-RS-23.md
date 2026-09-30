# REV-RT-RS-23

Codex, session `codex-5ebb6f`, 30 September 2026. Refs #5116.
Confirmed the single medium finding, `RT-RS-23/1`, against input commit
`59ee4d1986653ccfa1034a90f72961323a029c12`. This is verification under
PROTOCOL §17, not a new acceptance review of RS-23 under §8.

I did none of RS-23, REV-RS-23 or RT-RS-23. Their recorded sessions are
`astra-7c41e9`, `cc-39fac3` and `codex-rtOQ9t`, respectively. I independently
read the finding's cited records and recomputed the graph; the red team's
broader clean audit is not recertified here.

## Evidence and decision

The operative RS-23 JSON keeps R18.3's definite-quaternionic coefficient and
Hecke operations. Its nine owner records name no general automorphic-forms
supplier, and none of its fourteen links supplies that missing boundary.
The promoted `data/restructure/RS-23.result.json` agrees with the research
proposal on this record. The author report and independent review leave
R18.3 kept. The review's M5/M6 corrections address different contracts.

I read the full AutomorphicFormsOnReductiveGroups document, R18.1–R18.4 in
the Hilbert document, and the assembled AF.5/R18.3 descriptions and
prerequisites. AF.4 constructs algebraic coefficient systems and lattices;
AF.5 supplies the compact-at-infinity algebraic-form/finite-double-coset
dictionary. R18.3 independently asks for the definite-quaternionic
coefficient function space, integral coefficients, Hecke action and change
of level. This is an import boundary requiring explicit specialization,
not a reason to discard the arithmetic layer.

The R18.3 entries in both AUDIT-15 and the reviewed library coverage record
AF.5 as this generic supplier. I read the actual finding and verdict for
RT-AREA-automorphic-1/31 and the complete corresponding fixes subsection.
Its item 5 explicitly requests an RS-23 correction, still absent here.
The red team correctly credits that earlier finding rather than treating
the overlap as a new discovery.

These are public repository sources, read at the input commit:

- [RS-23 proposal](https://github.com/CBirkbeck/tauceti-explorer/blob/59ee4d1986653ccfa1034a90f72961323a029c12/research/blueprint/restructure/RS-23.result.json), its author report and REV-RS-23 review.
- [General automorphic-forms contract](https://github.com/CBirkbeck/tauceti-explorer/blob/59ee4d1986653ccfa1034a90f72961323a029c12/content/campaign/AutomorphicFormsOnReductiveGroups/README.md), especially AF.4–AF.5.
- [Quaternionic contract](https://github.com/CBirkbeck/tauceti-explorer/blob/59ee4d1986653ccfa1034a90f72961323a029c12/content/campaign/HilbertModularVarietiesAndShimuraCurves/README.md), R18.3.
- [Earlier fixes report](https://github.com/CBirkbeck/tauceti-explorer/blob/59ee4d1986653ccfa1034a90f72961323a029c12/research/blueprint/redteam/RT-AREA-automorphic-1.fixes.md), /31, including its stated source gap.

## Independent graph check

A fresh read-only `scripts.build.assemble(require_distances=False)` gives
2,907 stage records and 8,322 distinct edges; including prerequisite
endpoints gives 2,958 vertices. A topological sort visits every vertex.
All fourteen RS-23 links are already live. Breadth-first searches find
neither AF.5 → R18.3 nor R18.3 → AF.5. Adding AF.5 → R18.3 in memory
preserves acyclicity and the vertex count. The proposed
`AutomorphicFormsOnReductiveGroups:AF.5:algebraic-forms` is absent from the
assembled stages. Thus the earlier prose proposal has not supplied the
missing interface, and the current AF.5 edge is a viable structural option.

AF.5 currently also waits for the classical modular-curve dictionary.
An earlier prefix can avoid those unrelated prerequisites, but it must be
created, assigned its real coefficient/class-finiteness dependencies, and
promoted with its forwarding links before anyone claims to import it.
The graph check does not prove the underlying mathematical constructions.

## Repair boundaries and library check

The repair must name one general owner for the coefficient-function space,
its integral lattice assumptions, Hecke maps and level-change maps. R18.3
then checks the quaternionic instance and retains its class-set/stabilizer
calculations, Taylor–Wiles group-ring freeness and KW II dyadic twisting.
Neither a finite class set nor an invariant coefficient module alone proves
the required group-ring freeness. The general owner must state the central
and lattice conditions in its own source-grounded contract.

I also read AdelicAlgebraicGroups AA.3 and the full R17.3 global
Jacquet–Langlands contract. The latter owns transfer and its converse with
the local/archimedean hypotheses and ramification parity. The live graph
already has R17.3 → R18.3. Preserve R18.3's quaternionic comparison as an
application on these objects; do not duplicate the general transfer proof.

The earlier fixes report explicitly says Gross's *Algebraic modular forms*
was not read. A bounded public-source lookup did not obtain that article's
full text: the author's eprints page has no listed copy, and direct access
to that index returned HTTP 403 (the web reader could display its list).
I do not certify the report's detailed integral formula, claim to have read
Gross, or create a source erratum. That source-proof work belongs to the
general owner's decomposition. It does not prevent verifying the present
textual ownership omission.

The shared source trees were verified at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. I read the actual declarations
and surrounding hypotheses cited by the inherited R18.3 audit:

| Declaration | Actual scope checked |
| --- | --- |
| Mathlib `DoubleCoset.Quotient`, `GroupTheory/DoubleCoset.lean:79` | Quotient by the double-coset setoid in an abstract group; no adelic coefficient module. |
| Mathlib `IsDedekindDomain.FiniteAdeleRing`, `RingTheory/DedekindDomain/FiniteAdeleRing.lean:94` | Restricted product of completions of a Dedekind domain's fraction field; ring and topology do not construct algebraic modular forms. |
| Mathlib `ClassGroup.fintypeOfAdmissibleOfFinite`, `NumberTheory/ClassNumber/Finite.lean:353` | Class-group finiteness for an integral closure in a finite separable extension, with admissible absolute value and the surrounding Euclidean-domain assumptions; not quaternionic class-set finiteness. |
| Tau Ceti `HopfAlgebra.pointsFunctor`, `Algebra/AlgebraicGroup/PointsFunctor.lean:104` | Hopf-algebra points as a functor into abstract groups; no coefficient-function/Hecke interface is supplied by this declaration. |
| Tau Ceti `finite_doubleCosetQuotient`, `GroupTheory/DoubleCoset/Finite.lean:46` | Abstract double-coset finiteness assuming the right subgroup has finite index. A compact-open adelic subgroup is not thereby finite-index. |

These statements justify the primitive/supplier distinction used here; this
is not a fresh exhaustive library-absence audit. No Tau Ceti roadmap or
upstream-to-upstream link is fixed or reviewed.

## Validation

`check_restructure.py` passes on the unchanged accepted input.
`check_redteam.py` passes on the review JSON; intake `check-files` reports
zero problems for the two deliverables. The in-memory graph assertions and
`git diff --check` pass. No Lean file is required or compiled; no Lake
project, cache, build or language server was started. Only the assigned
review JSON and report change.

The RS-23 proposal SHA-256 remains
`412e0a564dc41e311e8913fe8591f7ca0c91393da200885a3c7b988f6342747d`,
matching the red team's input. The reviewed red-team result SHA-256 is
`3da6d43ed0f322d8f2bdd9128d88d81d550aa9988ba0ed910494cb87f4525f53`.
