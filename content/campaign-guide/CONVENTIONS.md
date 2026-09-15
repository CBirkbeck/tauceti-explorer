# Campaign-wide interface and completion conventions

## One owner, explicit consumers

A definition or theorem family has one canonical owner. Consumers import the exact
stage they need and prove their application hypotheses and comparison maps. A
reference to an entire roadmap is a navigation aid, not a requirement that all its
later stages be completed first. In particular, no late modularity or Langlands
application may be used to construct an earlier generic supplier.

Reuse existing Mathlib types and Tau Ceti designs before introducing a carrier.
Maintain comparisons with open-PR suppliers without pretending they are accepted.
If their API changes, adjust the comparison, not the underlying mathematical scope.
Avoid separate definitions of adeles, algebraic curves, Galois representations,
ordinary parts, exact categories, perfectoid spaces or the derived category in
different strands.

## Mathematical precision

Each target includes construction, functoriality, identity/composition, equivalence
invariance, applicable base change and the comparison maps used downstream. A
set-theoretic bijection is not a scheme/analytic isomorphism. An isomorphism of
abstract groups is not a comparison of products, transfers or regulator maps.
Finite-level torsion information is not an integral inverse-limit theorem without
the needed derived-limit argument.

Keep explicit: universe/smallness choices; ground fields and their characteristic;
coefficient rings and topology; p versus ell; rank; torsion primes; flatness,
properness, finiteness and cohomological bounds; algebraic versus analytic
constructions; left/right actions; normalized/unnormalized induction; arithmetic
versus geometric Frobenius; Tate twists and Hodge–Tate signs. These hypotheses may
be weakened by a proved general theorem, never by an implicit convention.

Integral statements are first-class targets. Passing to a field, killing torsion,
inverting 2, assuming semisimplicity or discarding a nilpotent ideal is not a
substitute unless the original theorem explicitly permits it. At bad primes and
small levels use the correct stack/coarse-space, wild/tame or exceptional-prime
formulation, including separate branches where necessary.

General theorems are stated at their proved level of generality. A construction
parameterized by a local–global compatibility hypothesis includes named owners
that prove that hypothesis in each intended application. An open conjecture is
labelled as such and is not a completion criterion. The ECD source's Questions
21.4 and 24.7 remain questions, not theorem obligations.

## Higher structures

[EnhancedDerivedSheaves](../campaign/EnhancedDerivedSheaves/README.md) owns shared
enhancements, coherent diagrams, presentability/Ind and animated-algebra interfaces.
[StableHomotopyKTheory](../campaign/StableHomotopyKTheory/README.md) owns spectra,
stable homotopy and K-theory-specific group completion/plus constructions. Existing
DGAInfinity, AlgebraicTopology and GrothendieckEulerForms own their stated
algebraic/category-theoretic inputs. StablePeriodicCurved is not a spectra supplier
or a claimed campaign dependency. A bare triangulated equivalence does not
silently imply enhanced Morita invariance.

Scheme étale topology/cohomology comes from the proposed PR196 suppliers.
Classical analytic étale cohomology, diamond étale cohomology and v-stack sheaf
categories have distinct owners, linked by proved comparison theorems. They are
not interchangeable sites with the same name.

## Lean prototype policy

Use upstream's capitalization `Suggested.lean`. Files are representative interface
seeds, not exhaustive declarations of every README target. `sorry` is permitted
in these planning artifacts and is counted as unproved work. Missing constructions
are described with explicit future domains, maps and hypotheses in comments until
the real carriers exist. Do not encode a desired conclusion in an unconstrained
`Prop`, axiom, or structure field and call that a theorem.

Use the namespace prefix `TauCetiRoadmap.Campaign` consistently. A new supplier
must update both its README contract and its seed boundary comments, even when
the advanced types do not yet exist in Mathlib.

Elaboration proves only that the uncommented declarations typecheck against the
recorded dependency pin. Future submissions must run the repository's own lint and
build checks, replace provisional names with agreed APIs and eliminate placeholders
as actual formalization is completed. File-level signature checks do not certify
proofs, scholarly source fidelity or the completeness of the dependency graph.

## Branch conventions

- [Diamonds conventions](DIAMONDS_CONVENTIONS.md) and
  [source contracts](DIAMONDS_SOURCE_CONTRACTS.md).
- K-theory/Iwasawa conventions and
  source-label/ownership audit.
- Shimura/Serre audit, with unchanged source
  identifiers R01–R35 and their canonical destinations.

An imported source label is branch-scoped: for example, R02 in the Serre pack and
R02 in the p-adic-L-function pack are not the same roadmap. Machine edges always
qualify a stage with its canonical area name.

## Editions and machine-stage discipline

`EDITION.json` identifies the active edition. Do not start an adversarial review
until it is frozen and its SHA-256 manifest has been written. Never rewrite a
review's pinned source tree in place; the round-01 editorial archive preserves
the former tree, and `review/adversarial/round-01/` remains immutable.

Internal stage IDs must resolve to a README stage heading or an explicit
`stage-EXACT_ID` anchor at the relevant construction. Range/union imports expand
into atomic stages. Exact historical aliases live in `STAGE_ALIASES.json`; they
are not extra constructions. Multiple prerequisite rows for one stage are
additive interface obligations, not competing definitions. The strict audit
checks every area's incoming/producer/internal coverage and stage-level SCCs;
area-level SCCs are reported as architectural coordination costs, not erased.
External `UPSTREAM:` endpoints remain separately reported contracts, not a claim
that those proposed upstream theorems are implemented.
