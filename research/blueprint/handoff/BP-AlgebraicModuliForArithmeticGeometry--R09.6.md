# BP-AlgebraicModuliForArithmeticGeometry--R09.6

Issue: #6338. Worker: Codex, session codex-4z8G3x. Date: 2026-10-09.

## Completed planning pass

The packet, reader and suggested file cover exactly R09.6. The packet is
complete at target level; the stage is planned, not closed. There are 21 nodes
(4 definitions, 3 constructions, 13 theorems and 1 application), 30 API items,
26 named tests, 6 planets, 13 verified baseline declarations, 8 supplier
requests and 3 explicit interface gaps. Every implementation status remains
unchecked. No implementation or completed proof is claimed.

The targets include framed deformation groupoids and infinitesimal stabilizers,
the relative tangent sequence, scheme/space completion comparisons, coherent
formal objects, complete-local effectivity, versality, formal atlas relations,
effective-versal algebraization and eight named parameter transports. The
arithmetic application is conditional on an actual moduli-groupoid equivalence
and its effectivity, Artin and rigidity hypotheses.

The reader gives exact hypotheses, declaration inventories, proof routes and
discriminating tests in original words. It is organized by targets rather than
by source sections. No source excerpts, private paths, PDFs or book text are
deliverables. No primary-source error was established, so sourceIssues is empty.

## Lean validation and precise omissions

The suggested file elaborated with lean-check at Mathlib
082e2d37e8b0463410cdb532e111cd43d5a66174 and Tau Ceti
f790474821cf4256814db967cb154e7af3d0c369. Its only warnings were the prescribed
proof placeholders. The checks validate signatures, not the mathematical
truth of proofs represented by placeholders.

Native prototypes cover the structured-arrow framed fibre, reduction kernel
of automorphism groups, coherent groupoid tower and its arrows, essential-image
effectivity, maximal-ideal completion of the actual scheme stalk and components
of an assumed Yoneda representation. They include 19 API signatures and 18
test examples. No geometric hypothesis is hidden in an artificial predicate.

The omission ledger names all 13 geometric theorem signatures and the arithmetic
application, the geometric FamilyVersalAt definition with 3 API items and 3
tests, and the geometric ParameterFormalExports construction with its 8 adapters
and 5 tests. Thus 11 API items and 8 tests are specified mathematically but are
not native Lean signatures. The generic fixed-fibre and tower constructions
still require assembly from the actual relative geometric suppliers.

## Ownership and the confirmed finding

RT-AREA-algebraicgeometry/2 is handled using the accepted RS-27 ordering:
SF.0 supplies G-rings, regular completion and Popescu; A0's approximation prefix
supplies finite-type permanence, polynomial approximation, finite-jet
formal-object approximation and common étale neighbourhoods. The prefix feeds
the A0 Artin criteria and R09.6 effective-versal algebraization. The older
suggestion of a reverse R09.6-to-A0 edge is superseded; introducing it would
undo that ownership. The two Kisin extraction routes are recorded in the
packet's target matrix and point to the common-étale-neighbourhood supplier.

The A0-extension-2 statements were checked against primary sources, but that
packet is not yet independently reviewed. They are imported plans, not accepted
proof implementations. R09.6 does not re-plan approximation or an Artin criterion.

Current TauCetiRoadmap main 094dd0a7ca814cab4f0dbb8c1778c567ea1cc0c2 was read
through AlgebraicVectorBundles and StableReduction README/Suggested files and
ModularCurves Layer 7D. Vector bundles do not claim the separate projective,
Grassmannian and flag constructions; those stay in R09.1. Existing elliptic
deformation and stable-reduction results remain imports. The reviewed R09.6
library audit and actual pinned tangent/dual-number declarations were checked;
the existing affine cotangent comparison is not planned again.

The older algebraic-moduli package's T551 needs tangent bijectivity before an
arbitrary smooth-chart completion can be called a hull. Vanishing infinitesimal
automorphisms alone does not remove excess chart parameters. The reader also
distinguishes infinitesimal kernels from residual stabilizers of BG, and Picard
space classes from Picard stack arrows. The older package was not edited.

## Remaining work and resume points

The three packet gaps name exact missing inputs. D0 must connect ordinary
relative fibre groupoids, coherent pullbacks and descent to the native carriers.
SF.1 must export pointed space charts, Isom spaces and relative geometric
comparisons. SF.4 Part II must supply groupoid-valued smooth/RS/completion and
presentation contracts while retaining its existing hull and formal-geometry
ownership. Start with those three supplier contracts before replacing the
omission ledger with geometric signatures.

R09.1 and R09.2 must instantiate the eight parameter adapters with their actual
representing natural isomorphisms and theorem-specific hypotheses. R09.4
supplies established algebraic-stack presentations; R09.5 supplies the precise
level rigidity theorem; SF.0 remains the sole Popescu/G-ring owner. These are
the eight requests. Arithmetic consumers must verify their own groupoid,
effectivity and rigidity contracts; no higher-tier roadmap is imported.

## Sources and checks

Primary reading: Stacks Artin axioms 98.3, 98.8–12 and 98.16–18; Formal
Deformation Theory 90.7–8, 90.11.11, 90.15, 90.18–20 and 90.25–26; Formal
Algebraic Spaces 87.33.1–3; Smoothing Ring Maps 16.13.1–2; More on Algebra
15.51.10; Artin (1969), Theorem 1.10 and Corollaries 2.5–2.6. Numbered page
locators, public URLs, access date and PDF hashes are in the packet. No target's
primary source is missing; the remaining gaps concern supplier interfaces and
application hypotheses. No private-library source was needed.

Validation: check_blueprint with the pinned declaration index reported no
errors or warnings; the native suggested file elaborated; all 77 declaration,
API and test names agree across the deliverables. The four deliverables are
checked by intake check-files and git diff --check before submission.
