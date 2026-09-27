# BP-LocallyAnalyticDistributions — explicit Riesz projector continuation

Codex — codex-7e92bd. Refs #641. Own-job follow-up to merged PR #3183,
under WORKERS. Claim5852701268 was confirmed by bot5852702029; the whole
issue was reread after that confirmation. No second claim was made.

**54 nodes**: 3 definitions,8 constructions,23 lemmas,14 theorems,6 comparisons.
**40 API entries**, **49 packet tests and typed examples**, **6 planets**,
**54 baseline declarations**, **8 gaps**, **5 requests**, **0 closed stages**.
The eleven definitions/constructions have36 API entries and35 tests.
All implementation statuses remain unchecked; there is no independent review.

## What changed

Nine L4 nodes isolate the actual Riesz projector algebra after Hasse calculus:
lower and normalized annihilation, the formula E=1-((1-au)c⁻¹z_h)^h,
idempotence, exact kernel/image, native topological splitting, regular inverse,
polynomial closure and commuting-operator stability. Thirteen executable
declarations and four typed examples extend the predecessor seed. The unit
c is the h-th Hasse value; all earlier values vanish. This unit hypothesis
cannot be replaced by nonzero. At h=0 the original resolvent identity supplies
an inverse on all M and the root projector is zero.

N=ker((1-au)^h) and F=image((1-au)^h) are the source's canonical summands.
The native projectionL and IsTopCompl APIs provide the continuous splitting.
On F the actual continuous inverse is c⁻¹z_h. The source's displayed positive-
order inverse agrees there. Neither finite generation nor rank follows merely
from these projector identities. The existing finite-projective determinant/
rank gap, all other gaps and five supplier requests remain.

All45 preceding statements and hypotheses,44 complete node objects,42 baseline
records,13 integrated reviewed IDs,19 links,6 planets and stage statuses are
preserved. Only the root parent's first proof steps and prerequisites are
refined. Generic idempotent theory is cited from Mathlib, not planned anew.
The AdicSpacesPartII complete-continuity signature stub and its generality
request remain unchanged. No substitute theorem-assuming structure is added.

## Evidence and checks

Read all five reviewed LAD audit entries, the owner and accepted RS-16 LAD
contracts, integrated Riesz statement/review and its Hasse/Fredholm dependencies,
the relevant source, native projection declarations, and touching link records.
Broader prior reads remain historical provenance. Both pinned library trees
were searched: native projection and idempotent theory is already supplied;
Tau Ceti's finite-length Fitting statement and real/complex closed-range Riesz
theory do not supply this Hasse-root decomposition over Banach algebras.

Fresh full source readings: Buzzard manuscript pp.23–24 and Serre printed
pp.80–81/PDF13–14. Their public PDFs match hashes:
Buzzard `0c54243868e2da8849452c4cc5a3d4e7b118cf17dd04487d4af137ab167ef57d`;
Serre `67a032c129ad2a36adeeadc4b4ccb3c0ab17c5a1ef8de83f7dda85f2115fe402`.
The first source identifies ker/image before the finite-projective argument;
the second supplies the signs, exponent and inverse. No new source finding.
The earlier Coleman/BGR reading boundaries remain unchanged.

The full suggested file compiles with Lean4.34.0-rc2: **0 errors,128 expected
placeholder warnings only**. All **1885 Mathlib sources** match the pin/cache.
Seed SHA256: `a58e316ed7dc208dfb680f6c0e7cf2e0a82234a2736e93da387f8a3b006a36d4`.
Source-audit SHA256: `3a8e95164341478483348a75e1ac9e6d2b0671ef2c1ba1e7b5dfc21b8e57466f`.
No actual Tau Ceti or planned supplier module is imported.

**13 complete scratch lemmas**, **0 errors,0 warnings,0 placeholders**,
with1129 source-audited Mathlib modules, prove the recurrence induction,
projector identities, kernel/image, algebraic and topological complement,
closedness and inverse formulas on native continuous linear maps.
Scratch SHA256: `f618fb235aa3681ff91bea1564cc1f56951148ad3cd5597fe2853d2cb1f186d1`.
**6,451,158 exact assertions** pass over28,624 two-by-two matrix-root systems
modulo2,3,4,5,8, plus six controls. The nonreduced moduli are explicit. A
three-by-three Jordan example rejects removing the h-th power; another
control rejects a nonunit Hasse coefficient. The finite computations are not
proofs of convergence, finite generation, projectivity or the full roadmap.

The publication guard detected a concurrent source/errata-register addition.
Read the full diff: ColemanIntegration/E25 records a Furusho puncture misprint.
It changes no LAD source or prerequisite. The two register snapshots and their
input hashes were refreshed; no independent review of that finding is claimed.

Unmodified-index blueprint: **0 errors,0 warnings**. Four-file intake: **0 problems**.
Preservation, reader/API/test parity and dependency checks pass. The graph has
110 internal prerequisite edges, is acyclic and ends at pinned declarations
or the explicit AdicSpacesPartII:R3 request. Source hashes match.
Fresh guard: all51 captured inputs and four predecessor outputs match
main `359ba836943d2f612d51bd29c2762a1bbeae7921`. The issue body and winning confirmation5852702029 are
unchanged; #641 is available and review #316 is unclaimed. Publication uses
Git Data REST; no git command, manual merge or independent review.

## Where to resume

Promote the resolvent adjugate coefficient estimate and finite-coordinate
truncation comparisons. Then complete the finite-projective determinant,
constant-rank and exact finite-slope arguments, without inferring polynomial
equality merely from its residue-field images. The root algebra and
continuous regular inverse now have distinct signatures.

Acquire and decompose BGR finite-module topology, inverse norm bounds and
completed tensors. Complete the (Pr) exercises and Coleman spectral-resultant
transport. Audit the inherited prototype assumptions as missing signatures
are filled. L0–L3 sources and L4's actual analytic/distribution families,
uniform character actions and specialization remain open. Preserve existing
PMIA suppliers, RS-16 boundaries, PadicFamilies consumers and six planets.
