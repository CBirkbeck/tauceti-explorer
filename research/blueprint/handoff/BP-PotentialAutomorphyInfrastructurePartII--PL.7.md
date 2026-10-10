# PL.7 continuation handoff

Codex, session **codex-BlTjhl**, completed the target-level planning pass for
**#7840**, on 2026-10-10. The packet is **complete**; its sole coverage record,
**PotentialAutomorphyInfrastructurePartII:PL.7**, is **planned**, with explicit
proof boundaries and supplier contracts. This is a completed planning pass
submitted for independent review. No mathematical implementation or stage
closure is claimed.

The deliverables are the [packet](../packets/PotentialAutomorphyInfrastructurePartII--PL.7.json),
[reader](../readmes/PotentialAutomorphyInfrastructurePartII--PL.7.md), and
[suggested file](../suggested/PotentialAutomorphyInfrastructurePartII--PL.7.lean).
The parent packet, its reviewed source issues and its ten PL.7 target identifiers
are imported unchanged. No other roadmap, application or atlas data was edited.

## Completed work

- Twelve new target-level nodes: two definitions and ten key theorems.
- Twelve API items and nine definition tests: five for good CM extensions and
  four for potential pro-automorphy.
- Three new planets: Good extensions, Potential pro-automorphy, and Propagation
  of potential pro-automorphy. Together with the parent's three PL.7 planets,
  these give six landmarks in the assembled layer.
- Fifteen baseline declaration citations, checked in the pinned Lean sources.
- Five explicit gaps and four supplier requests. Seven source findings are
  inherited by identifier from the independently reviewed parent; this pass
  asserts no new source-issue record.

The definitions have native predicates and compatibility tests. The potential
pro-automorphy definition uses the actual restriction/Hecke diagram and extends
the Hecke kernel into the deformation ring. Finiteness means module finiteness,
including nilpotents. The source weak-primitivity statements are kept separate
from the parent's stronger semisimplified-induction condition. The reader gives
the full arithmetic hypotheses and a table identifying every omission from the
suggested theorem signatures.

The connectedness route uses the sufficient bound
**d₀,d_l > |R|n(n+1)+3**. The global field-choice argument also retains the
condition **d_l > n(n−1)/2+1**. The repaired final two-constituent dimension
estimate is **n[F⁺:ℚ] − |R|n(n+1) − 5**. These changes use the parent's source
findings E30, E32 and E33; they do not claim the printed borderline +2 bound.

## What remains for closure

1. **Weak primitivity in arbitrary rank.** Resolve the residual-induction
   bridge in Tho15 Proposition 5.3, p. 58, under the complete arithmetic
   hypotheses when n≥l and l∤n. Reduction of an induced representation supplies
   a semisimplified induction; weak primitivity alone does not exclude that
   representation-theoretic possibility. The parent's n<l comparison and
   strong-image-invariance targets are already imported. No arithmetic
   counterexample is claimed.
2. **Arbitrary-constituent patching.** Supply the localized completion/tangent
   comparison and equivariant patching argument for d>2 in ANT20 Theorem 4.1,
   p. 15, with the group μ₂^d/μ₂. Its owner is the parent's PL.6. Merely
   replacing the sign group or proving finiteness over invariants is
   insufficient.
3. **Rank-one blocks.** Fulfil the request to
   **GlobalGaloisDeformations:G7** for polarized ordinary character lifts and
   their finiteness through the arithmetic finite-index argument. The source
   reference to NT21 Theorem 5.2 has a standing n≥2 assumption and does not
   cover those blocks. The contract does not assume Leopoldt's conjecture.
4. **Nonscalar auxiliary place.** Fulfil all three requests: the full framed
   fixed-multiplier unramified lifting-ring comparison and formal smoothness
   in **LocalGaloisDeformationRings:R08.2**; the sufficiently small ordinary
   Hecke level, finiteness and classicality comparison in the parent's
   **PL.2**; and the modified generic-prime patching comparison in its
   **PL.6**. Retain H⁰(ad ρ̄(1))=0, including the Tate twist. The current scalar
   auxiliary-place statements do not supply this generality.
5. **Dwork owner.** Replace the explicit family/cover/monodromy/local-property
   contract by stage identifiers in PotentialAutomorphyDworkMotivesPartII
   once that owner provides them. Its geometry is not reconstructed in PL.7.
6. **Borderline numerical statement.** The printed +2 connectedness bound
   needs a sharper mixed-characteristic intersection estimate. The current
   +3 route suffices for global lifting and finiteness because the auxiliary
   extension degree can be increased.

The exact contracts, consumers and acceptance criteria are in the packet and
reader. A follow-up should resume at these inputs, retaining the definitions,
parent node identifiers and distinction between source and strong primitivity.

## Baseline, ownership and sources

The pinned baseline is Mathlib
**082e2d37e8b0463410cdb532e111cd43d5a66174** and Tau Ceti
**f790474821cf4256814db967cb154e7af3d0c369**. The reviewed coverage audit has no
entry for this Part II or the original potential-automorphy roadmap.

Current TauCetiRoadmap was checked read-only at
**dea8191cc6047d6142a65872ebce6eeeb841a29b**, and current Tau Ceti at
**a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039**. All nine roadmaps newer than the
atlas snapshot were searched. None supplies these targets. The current
completed-group-algebra module carriers and module actions are existing work;
the G7 request concerns the arithmetic argument rather than that construction.
No ownership move or restructuring is proposed.

Multiquadratic and InductionRestriction upstream READMEs were read in full for
style and granularity. In particular, the latter's prime-to-characteristic
semisimplicity results do not resolve the general-rank residual-induction gap.

The source versions, access date, public URLs and PDF SHA-256 digests are in the
packet. The mathematical claims and proof sketches are written in our own
words, with theorem, section and page locators. Readings for this pass were:

- **ANT20**, arXiv:1912.11269v2: the main statement and the relevant dimension,
  unitary patching, good-extension, connectedness and finiteness arguments,
  especially §§3.3–6, pp. 10–20.
- **Tho15**, the Cambridge accepted manuscript dated 16 April 2014:
  Propositions 3.15 and 3.17, pp. 18–20; Lemma 3.21, p. 22; Lemma 4.16 and
  Proposition 4.17, pp. 43–45; the statements of Theorem 4.19 and Corollary
  4.20 and the corollary proof, pp. 47–48; Proposition 5.3 and its setup,
  pp. 57–58, including the page image confirming the residual notation;
  Corollary 5.7's statement and cotangent/Selmer identification, pp. 62–63;
  and §§6–7, pp. 63–70.
- **NT21**, arXiv:1912.11261v3: §5, pp. 66–75, including the character-sum,
  reducible-locus, generic-prime and prescribed-type statements and proofs.
- **Tho24**, arXiv:2212.03591v2: Theorem 7.5 and its proof, pp. 44–45.
- **NT26**, arXiv:2212.03595v2: Proposition 3.9 and its proof, pp. 20–21.

The full foundational Dwork geometry, unitary transfer, classicality and
general patching constructions remain imports from their owners. Their
complete source proofs were not reread as new targets in this continuation.
No private book was used, and no source PDF or extracted text is committed.

## Validation

The packet checker passes with **zero errors and zero warnings**, including
against a declaration index of the pinned Mathlib and Tau Ceti sources.
The four files pass the intake file checks and whitespace checks. The packet,
reader and suggested declarations were checked for matching node identifiers,
API names, test names and planet counts.

The complete suggested file **elaborated successfully** with `lean-check`,
using the shared pinned build. Its only Lean warnings concern proof
placeholders. Both definitions, all twelve API signatures, all nine test
examples and all ten theorem signatures were included. No language server or
library build was started. Elaboration validates the native interfaces; it
does not prove the targets, omitted arithmetic hypotheses or gap resolutions.
All packet implementation statuses remain **unchecked**.

All information needed to resume is recorded here or in the committed
deliverables. The disposable source downloads, index and logs need not be
retained after submission.
