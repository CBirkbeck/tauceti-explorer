# BP-EllipticRegulators--ER.2

Agent: Codex. Session: codex-aLxXqA. Issue: #6483.
This is a complete target-level planning pass for EllipticRegulators:ER.2,
whose coverage is **planned**, not closed. All implementation statuses are
unchecked.

## Delivered

- Five new nodes: three comparisons, one construction and one theorem.
- Seven API items, five discrimination tests, two new planets and eight
  pinned baseline declarations.
- The five accepted ER.2 nodes in EllipticRegulators.json are cited by id and
  left unchanged. They supply the target, elliptic η pairing, Brunault symbol
  regulator, factor-two comparison and torsion-lift statement.
- The Schneider convention is explicitly matched: ch₂,₂=-c₂,₂; the higher
  Chern symbol is the negative unit cup, so the regulator is the positive cup.
  Its representative is iη. Brunault's wedge pairing gives r_D=2r_E.
- The oriented scalar is -2π a(γ₂) for ν=2πi a, and -∮γ₂η=2 Im r_E for
  ν=[iη]. Nekovář's pairing includes an additional 1/(2πi), so its evaluated
  scalar is toReal/(2π). This resolves the source normalization question at
  the mathematical planning level.

## Supplier work and the confirmed finding

There is one recorded gap: an acyclic early M.8 Deligne/Chern export. Two
requests specify the exact statements from MotivicEtaleKTheory:M.8 and
ComplexComparisonPartII:C5. P.5 is imported through its existing, finer nodes,
so no redundant request or construction is added.

RT-AREA-ktheory-2/7 is handled by keeping generic Deligne complexes,
hypercohomology, products and the universal regulator with early M.8, and the
general curve η/current/Steinberg/comparison with P.5. The new ER.2 work is the
elliptic target specialisation, orbit equivalence, dimension and rational
period coordinate; the accepted torsion statement is reused.

The packet records the required early-M.8→P.5, early-M.8→ER.2 and P.5→ER.2
structure. P.5→ER.2 is already represented by named-node prerequisites.
The early M.8 prefix has no suitable actual stage/node id in the current
atlas, packet or reservations, so its input is a precise supplier gap and
request rather than a fictitious id or an edge from all of late M.8.
The restructure proposal assigns the owner split, removes M.8's expectation
that ER supplies generic cohomology, and requires ER.4 trace to import M.8 norm
compatibility. Neither M.8 nor ER.4 is edited by this single-stage job.

To close ER.2, the supplier must expose the early generic Deligne/Chern
declarations independently of R.7, D.2 and Selmer/Iwasawa dependencies, then
replace the gap with their node ids. Instantiate the geometric comparison
and cohomological signatures using C5/ER.1 and P.5. The dimension and constants
must retain the conjugation, wedge order, orientation and Tate conventions
specified here.

## Validation and Lean boundary

The blueprint checker passes with zero errors and zero warnings, including
the existing declaration index. Cross-file checks confirm every new API/test
name, distinct node ids, one-stage scope and absence of private paths.
Whitespace and deliverable-scope checks pass.

The suggested file **compiled successfully with lean-check**, with only the
intended proof-placeholder warnings. It imports only Mathlib, at the requested
082e2d37e8b0463410cdb532e111cd43d5a66174 pin. Tau Ceti source declarations were
searched at f790474821cf4256814db967cb154e7af3d0c369; the shared build's Tau Ceti
checkout is newer, but no Tau Ceti module is imported by this file.

The compiled signatures are the actual period-coordinate orbit model, its
API and tests, dimension, imaginary projection, normalization computations
and torsion-killing step. Full geometric Deligne/K₂/current types are absent.
Their three comparison signatures and the geometric transport are identified
explicitly in comments; no arbitrary cohomology carrier or assumed comparison
field substitutes for them. Compilation proves these model signatures are
expressible, not that the regulator or its comparisons are implemented.

## Sources and provenance

Read Brunault's thesis, arXiv math/0602186v1, pp.19–20,26,63–70; Schneider's
published chapter, §§2–3 pp.7–13 and §4 pp.24–30; and Nekovář's public author
copy, §7 pp.21–24. The packet preserves URLs, hashes, access date and locators,
so the sources can be retrieved without the scratch directory. Page images
were checked for conjugation bars and Chern signs.

Nekovář's publisher version was not retrieved. Source issues E24–E26 are
confined to the hashed author copy: coefficient-line index, missing i in the
real darg expression, and the repeated variable in (7.5.1). The printed
conjugation bar is present; only the variable is wrong in that integrand.
No correction was found in the recorded searches. An independent reviewer
should verify those locators and, if obtainable, collate the publisher text.

The reviewed AUDIT-28 marks ER.2 not built. Searches at both library pins found
no Deligne-cohomology or K₂-symbol-regulator API; the nearby mixed-Hodge
Deligne splitting and Néron–Tate/unit regulators are different objects.
All ER.2 atlas edges and the link-map screen were read. Upstream density and
prototype conventions were checked against HodgeStructures and the completed
ContourIntegration documents.
