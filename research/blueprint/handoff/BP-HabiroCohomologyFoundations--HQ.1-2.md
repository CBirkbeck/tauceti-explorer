# BP-HabiroCohomologyFoundations--HQ.1-2

Issue #6490. Worker: Codex, session `codex-IqxHbS`. Date: 2026-10-06.
Claim confirmed by the bot on comment 6008650316.

## Completed planning pass

The packet is **complete** and HQ.1 coverage is **planned**. It adds seven
unique nodes to the accepted HQ.1 plan: two theorems, two comparisons, two
constructions and one definition. It has 15 API items, ten unit tests, two
new planets and two cited native baseline declarations. No earlier packet or
other roadmap deliverable was edited. All implementation statuses are
unchecked. This is a completed planning submission, not a checkpoint.

The first former gap has a precise proof: Wagner's global qΩ functor satisfies
finite affine étale Čech descent because its reduction modulo h=q−1 is
ordinary smooth de Rham descent, complete objects are closed under limits,
and regular principal reduction commutes with those limits and detects
equivalences. The proof does not exchange rationalization with an infinite
totalization or pretend the differential is S-linear. Framed Čech maps and
their higher cocycles are transported from the chart-free diagram through
chosen enhanced equivalences. A specialized étale sheaf and section object
are planned by importing generic affine-basis descent.

The second former gap has a precise algebraic proof: use the discrete Z^d
action on C=B[Z^d], the enhanced action limit, and Lurie's QCoh∞ construction
on the action prestack followed by fpqc sheafification. The infinite action
nerve gives products of D(C). No quasi-compact atlas or finite constant-group
theorem is substituted. The comparison retains stabilizers at q=1 and roots
of unity, matches the ordinary modified-connection heart, and restricts to
vector bundles and underlying perfect complexes. It does not claim that
perfect means compact in this equivariant category.

## What prevents closure

There are no additional unexplained mathematical gaps, but four precise
supplier requests remain open:

- `DerivedDeRhamCohomology:DD.1`: complete-limit/fibre closure, conservative
  principal reduction, and the regular two-term reduction/limit interface.
- `DerivedDeRhamCohomology:DD.2`: ordinary smooth étale de Rham Čech descent,
  finite products and separated affine-cover de Rham hypercohomology.
- `EnhancedDerivedSheaves:E2`: complete enhanced affine-basis sheaf extension
  and its Čech section formula. The packet records the addition in the same
  owner's Part II if its existing cartesian-descent interface needs extension.
  No unrestricted unbounded hyperdescent or repleteness is presumed.
- `LanglandsParameterStacks:LP1`: arbitrary discrete-group action quotients,
  QCoh∞ colimit/limit and sheafification interfaces, coherent monoidal
  pullback, mapping spectra, and local heart/perfect detection. The exact
  DAG VIII §2.7 locators are supplied in the request.

The generic coherent group-action node in E5 and the coherent diagram/limit
nodes in E0 are imported by exact IDs. Their planning status is not treated
as an implementation claim. The E5 profinite-continuity portion is not used.

A follow-up resolves the four requested generic interfaces to exact supplying
declaration IDs, then assembles this packet with the accepted HQ.1 packet.
The specialized proofs, hypotheses and tests are already specified. Assembly
must use `planetSelection`: the two new planets plus the four named inherited
planets give **six total**, keeping the two other inherited planetary nodes
as ordinary declarations. This packet does not edit their accepted labels.

## Confirmed red-team findings

- **RT-AREA-etale/28:** no new framed derivative or Koszul definition is
  planned. Import the accepted interim HQ.1 framing node. The restructuring
  note gives a single independent `QW.6:framings` prefix for I=(h)/(p,h),
  preceding QW.5, and requires forwarding the old ID when QW is installed.
  PR.6 imports and prime-completes that prefix and keeps q-PD/site/prismatic
  ownership. QWittVectors is absent from the assembled atlas at this pass.
- **RT-AREA-etale/29:** reuse the accepted ordinary connection definitions
  and heart, and add the full algebraic derived torus comparison. Keep the
  distinct uncompleted Habiro ring/Koszul construction at HQ.4 and its
  descent/comparison and twisted q-dR applications at HQ.3 under RS-10;
  none is repeated here. V5A4 analytic identifications remain unasserted.
- **RT-AREA-etale/32:** the global descent node explicitly depends on
  `HabiroRings:HR.1/lambda-rings-with-commuting-adams-operations`. The pointer
  moves atomically to QW.1 only when QWittVectors is promoted; no second
  Λ-ring carrier is planned.

## Checks and suggested Lean limitations

`python3 scripts/check_blueprint.py` on the follow-up packet reports **zero
errors and zero warnings**, using the pinned declaration index. Its graph
has no local cycles or duplicate previous IDs. Packet/reader/API/test names
are checked against the suggested file, including its omission inventory.

The suggested file **compiled with `lean-check`**, with only the ten expected
warnings that declarations use placeholder proofs. The shared build has
pinned Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`. It has a newer Tau
Ceti checkout, but the file imports only individual Mathlib modules and
therefore uses no newer Tau Ceti declarations. Available memory exceeded
20 GB before compilation. No language server or library build was started.

Compilation covers the native torus scaling signature, its five API lemmas
and four tests. It **does not cover the six enhanced nodes**: four named
theorem/comparison signatures, two object signatures, seven non-constructor
API items and six tests cannot yet be expressed because their qΩ, complete
E∞, coherent-action-limit and quotient/QCoh∞ types are absent at the pins.
Every omitted name and exact mathematical form appears in the suggested
file's comment inventory and in the packet/reader. No opaque proposition or
axiom substitutes for a missing condition. This is the explicit omission
permitted by PROTOCOL §13, not a claim that the whole plan elaborates.

The native AddMonoidAlgebra and AlgEquiv statements were read at the pins.
The ordinary derived-category and quasi-coherent-sheaf machinery was not
replanned. QuasicoherentData/IsQuasicoherent were read to confirm their local
presentation scope. Tau Ceti ConstantGroup.functionAlgEquiv was read to
confirm its finite-group assumption and reject it as a lattice-group model.
The baseline source and declaration index were screened for missing
q-connection, quotient-stack, coherent-fixed-point and completion interfaces.

## Sources and review focus

Public PDFs read: Wagner arXiv:2510.04782v2 Appendix A (Theorem A.1 and proof,
A.11–A.14); Scholze arXiv:1606.01796 §7; Lurie *DAG VIII* (November 5, 2011),
§2.7. PDF SHA-256 values and access date are in the packet. Stacks Project
tags 091N, 03OY and 06WT were read directly. Source passages are distinguished
from the new consequence proofs; no current source error was found. Upstream
HodgeStructures and AdicSpaces documents, the reviewed HQ.1 library audit,
the accepted earlier packet, PLAN-HABIRO §6.5, accepted RS-10 round 2 and
the relevant supplier stages/nodes were read.

The unpublished V5A4 notes were unavailable and unread. The algebraic modified
connection normalization is inherited from the accepted packet, without
identifying it with those notes. Scholze Conjecture 7.5 remains a conjecture;
the present framed-complex transport gives no ordinary connection-category
framing-independence theorem. Analytic/solid/Habiro-complete equivalences
are outside the theorem claims.

Review should check the principal-reduction/limit argument, bounded ordinary
de Rham Amitsur argument, inverse scalar-twist convention, infinite discrete
action nerve, the supplier ownership boundaries, and the disclosed prototype
omissions. The reader is about 6,000 words and agrees with the packet.
