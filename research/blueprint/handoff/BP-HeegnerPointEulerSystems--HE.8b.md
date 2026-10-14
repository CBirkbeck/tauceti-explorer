# BP-HeegnerPointEulerSystems--HE.8b

Issue #9418; Codex (GPT-6), session `codex-C0agAa`.
The bot confirmed this session's claim on 14 October 2026. This is a complete
target-level planning pass, not a checkpoint or an implementation claim.
The sole stage `HeegnerPointEulerSystems:HE.8b` is **planned**, not closed.

## Delivered

- [Packet](../packets/HeegnerPointEulerSystems--HE.8b.json): two new nodes,
  one theorem and one comparison; thirteen existing HE.8b nodes imported
  from the accepted HE.7s packet without duplication. All four audited stage
  targets and the inherited Eisenstein, BCGS and Castella–Sano applications
  are mapped in the reader.
- [Reader](../readmes/HeegnerPointEulerSystems--HE.8b.md): exact coefficient,
  lattice, local-condition, rational/integral and square-root conventions;
  endpoint hypotheses; the complete target-level proof route; acceptance
  checks and supplier contracts. It includes the fixed-K auxiliary-field
  construction rather than replacing the theorem's K by a newly chosen pair.
- [Suggested Lean](../suggested/HeegnerPointEulerSystems--HE.8b.lean): eight
  concrete algebra examples on existing carriers, 67 lines. All fifteen
  arithmetic targets/inputs remain README statements under the binding
  2026-10-12 WORKERS shape: their arithmetic carriers are absent at the pins.
  There are no new definitions, hence zero new definition API items or
  definition unit tests. The reader gives integration checks for imported
  objects instead of duplicating their definitions.

The packet cites seven checked Mathlib declarations. It adds one planet,
primitive Greenberg μ-vanishing; combined with the predecessor's five HE.8b
planets, the stage has six. Every implementation status remains unchecked.
Source issues E11 and E12 record two minor BCS cross-reference/ring-notation
findings, checked against both arXiv v2 and the publisher-form author copy;
neither changes an intended theorem.

## Assembly and ownership

The generated issue names HE.0 as predecessor. Its current scope ends at
HE.7; the actual thirteen HE.8b target IDs occur in HE.7s. No predecessor or
supplier file was edited. During assembly apply the packet's two
`dependencyRefinements` while preserving those IDs:

1. Add the new primitive μ and anticyclotomic specialization nodes to the
   inherited reverse-product-divisibility node's prerequisites.
2. Replace the Eisenstein adapter's coarse BSD.7a reference by the exact
   `RankZeroOneBSD:BSD.7a/cgs-anticyclotomic-main-conjecture` node.

BCS's two-variable formulation theorem belongs to AutomorphicCongruences
L5a, with locator 4.1.3/4.1.4, not 4.2.1. L5w owns Wan/Fujiwara. The
completed cyclotomic L5b equality is downstream. Early HE.8 nonvanishing
precedes the independent BSD.7a theorem; late conditional BCGS consequences
cannot supply that theorem's input. These roadmaps are outside the current
Caraiani–Newton tier list; no definition move between its tiers is proposed.
Current upstream ProfiniteArithmetic/JacobianChallenge and the nine
post-snapshot roadmaps were checked; their existing infrastructure is not
replanned.

RT-AREA-iwasawa-1/5 is handled by adopting the existing HE.7s/BSD.7 proposal
for **Elliptic units and the Iwasawa main conjectures for imaginary quadratic
fields**. Its Rubin/Hida–Tilouine/Hida exports supply BSD.7a's existing
character-comparison and equal-invariant nodes. There is also an independent
use before the irreducible HE.8b proof: CGS Lemma 2.4.4 uses Rubin and
Hida–Tilouine Theorem 0.3 to establish integrality of the actual Greenberg
function. Route that congruence-ideal input through L5a, together with the
CM-family augmentation-factor exclusion from its existing congruence owner.
This is distinct from Hsieh's toric μ theorem and Hida's Katz μ theorem.

The separate Wüthrich integral-Kato obligation remains in Kato L4, using
IntegralIwasawaTheory L4 Ferrero–Washington and BSD.7a's existing
distinguished-lattice adapter. It repairs the cyclotomic Eisenstein return;
it is not an extra premise of early CGS Theorem C. The unit owner also feeds
HE.7s's Rubin/Iwasawa CM alternative, without imposing it on the reviewed
direct Nekovář HE.7 route. These are proposals and requests, with no new
reserved roadmap IDs.

## What remains precisely

The three packet gaps are supplier obligations, not unfinished target
enumeration:

- **G1:** certify the JSW imprimitive restriction/Fitting argument for the
  exact BCS local conditions and hypothesis range, prove matching primitive
  Euler-factor sequences, and extend characteristic ideals to completed
  unramified coefficients. Generic control and finite-flat base change alone
  do not prove these contracts.
- **G2:** discharge GZ.9's existing integral period-unit gap; certify the
  precise primitive Hsieh μ input, L5a comparisons/factorization, L5w
  period/Fujiwara/control prerequisites, and augmentation-inclusive weak
  residual/integral-surjective Euler-system bounds.
- **G3:** supply the independent elliptic-unit proof contracts both for
  L5a's analytic integrality and for the Eisenstein character invariants.

The eight requests name: R1 AutomorphicCongruences L5a; R2
AutomorphicPadicLFunctions L3h; R3 SelmerIwasawaCohomology L3; R4
PadicMeasuresIwasawaAlgebras L4; R5 GZ.9's existing square-root comparison;
R6 EulerSystemsAndKolyvaginSystems ES.8; R7 RankZeroOneBSD BSD.7a; R8
KatoEulerSystems L4. Their exact contracts and consumers are in the packet.
Resume by completing those owners, then independently verify and assemble
the preserved fifteen-node target graph. An integral individual equality
under mere residual irreducibility, a general p=3 extension, or an inert-p
main conjecture is not an output of this pass.

## Sources and verification

Read BCS arXiv:2405.00270v2 main text pp.1–11 and collated the relevant
proofs against the IMRN publisher-form copy pp.9–13; BCGS
arXiv:2312.09301v2 Theorems A/B, §1.2 and their applications; BCK Theorem
5.2 pp.1646–1647; CGS arXiv:2303.04373v2 Theorem C, §§2.4 and 6.5;
CGLS Theorems 1.2.2 and 2.2.2–2.2.3 and §4.2; JSW arXiv:1512.06894v1
§§3.1 and 3.4; Castella–Sano arXiv:2601.14504v1 Theorem C and §§3.2,3.4.
The packet records URLs, versions, reading boundaries, access date and PDF
hashes. All repository prose is original; no source passages or PDF assets
are included.

Rubin 1991/1994, Hida–Tilouine 1994, Hida 2010, BDP22 and Wüthrich's full
proofs were not independently acquired/decomposed in this job. Their proof
contracts stay with the requested owners. Wan/Fujiwara is imported through
the inspected L5w fine nodes and retains their recorded prerequisites.

Validation on 14 October 2026:

- `python3 scripts/check_blueprint.py research/blueprint/packets/HeegnerPointEulerSystems--HE.8b.json`:
  zero errors and zero warnings.
- `lean-check research/blueprint/suggested/HeegnerPointEulerSystems--HE.8b.lean`:
  exit 0 at the pinned shared build; exactly eight expected admission
  warnings and no other warnings. Memory was checked before compilation.
- Reachable fine-node dependency traversal from the thirteen imports and
  two new nodes, including the proposed dependency refinements: 3,743
  reachable nodes, no cycle, and no completed cyclotomic L5b/CGS Theorem A
  input. Stage references and requests were terminal contracts; this is not
  a claim that every supplier's internal proof is closed.
- Intake `check-files` accepted all four deliverables with zero problems;
  the staged diff passed `git diff --cached --check`.

All information needed to resume is in these four deliverables; scratch
sources and working notes need not be retained.
