# PKG-InductionRestrictionPartII — blocked checkpoint

Refs [#7592](https://github.com/CBirkbeck/tauceti-explorer/issues/7592).
Codex (GPT-6), session `codex-nGenCY`, 11 October 2026.
Branch: `codex-nGenCY-induction-restriction-package`.
The bot [confirmed this session's claim](https://github.com/CBirkbeck/tauceti-explorer/issues/7592#issuecomment-6106655659),
identifying claim comment 6106654588. No manager-priority issue was available
in the open `swarm`, `state:available` inventory, and there was no available
plan or package review. This job was selected at the fallback package priority.
Only one job was claimed.

Base atlas commit: `94ef4d10337ec4e58f86ed4804996b862b039b10`.

## Outcome and changes

**Blocked checkpoint; the roadmap package is unfinished.** Two executable
unit-test signatures and their README descriptions now exercise
`marking_correction` directly:

- `marking_correction_test_2` takes P=A=E=Multiplicative(C₃), with φ, inl
  and ψ the identity homomorphisms. The actual correction evaluated at the
  additive generator is the multiplicative identity; the wrong-sign product
  is the additive class 2.
- `marking_correction_test_3` takes the same homomorphisms and any nonidentity
  k. The actual correction gives 1, while k² differs from that value.

Previously these examples asserted only arithmetic in C₃, without applying
`marking_correction`. Such statements would survive an incorrect definition
using φ·ψ instead of φ·ψ⁻¹. The revised examples implement the accepted
packet's existing sign tests; no target or supplier has been added.

An independent scratch check implemented the displayed correction formula
for commutative total groups as the product of φ with the inverse of
inl∘ψ. It proved the exact revised examples, and separately proved that the
wrong-sign product at the additive generator is not the identity. That check
returned **zero errors, zero warnings and no admissions**. Its mathematical
receipt is k·k⁻¹=1, while every nonidentity k in C₃ has k²≠1. Scratch is
removed after submission; this receipt and the package signatures are enough
to reconstruct the check. The package remains a roadmap prototype, with its
proofs admitted; the scratch check does not implement its general API.

Read Wood, *An algebraic lifting invariant of Ellenberg, Venkatesh, and
Westerland*, §2, Theorem 2.5, author PDF p.4. The discrepancy convention
φ(mark)=mark·k and the homomorphism ψ(mark)=k require inverse correction.
This is the sign correction already in the accepted plan, tested here on
actual values of the proposed constructor. Public author copy:
https://people.math.harvard.edu/~mmwood/Publications/lifting.pdf?download=1.
Accessed 2026-10-11; SHA-256
`9628210e96313805ceac89594c64e2eceb3aaebf044f617cee4d7f25ee7ef673`.
No passage of that source enters the repository.

## Why completion is blocked

The accepted packet retains the gap **Natural integral homological bridge —
supplier unassigned** and a restructuring proposal that requires an ownership
decision before adding any supplier edge. Its fifth gap separately requires
an owner for cyclic coprime complement conjugacy. Acceptance is a completed
planning pass, not closure of these prerequisites.

The issue permits edits only to the three package files and this handoff,
and expressly says to change no packet. PROTOCOL §§3, 15 and 20 require
actual supplying layers, preserve ownership, and require the package to agree
with its accepted plan. Local admitted signatures cannot resolve an ownership
decision that the plan expressly leaves unassigned. The manager was asked
for the assigned layer IDs or permission to reconcile the plan and package;
no assignment or authorization was received before this checkpoint.

The required amendment must assign these contracts once:

| Contract | Required scope |
| --- | --- |
| Native integral UCT | Arbitrary groups and abelian coefficients; evaluation on native cycles; natural Ext injection; both variances; free-abelianization injectivity; infinite-group tests. |
| Central-extension homological sequence | Exact H₂(E,ℤ)→H₂(G,ℤ)→A→Eᵃᵇ→Gᵃᵇ→0; specified extension maps; section independence; XYX⁻¹Y⁻¹ orientation. |
| Finite integral homology | Finiteness and group-order annihilation in positive degrees, retaining the H₀ counterexample. |
| Coprime degree-two edge | Native inclusion and projection kernel; multiplier coinvariant action; section; incoming d₃ verification. |
| Cyclic complement conjugacy | Finite coprime H,C with C cyclic and H possibly nonabelian; uniform H-conjugation of actual complements. |

Ordinary Schur covers stay in the parent InductionRestriction Layer 7.
The amendment must reconcile the packet, roadmap definition, reader, suggested
interfaces and consumer edges. These files were not edited here.

## Supplier and baseline checks

The supplied read-only TauCetiRoadmap checkout is
`070dc2becd74419e76303ede84b465ed4a69461f`; current Tau Ceti is
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Read the InductionRestriction
and SemisimpleAlgebras READMEs, the relevant AlgebraicTopology UCT target,
ProfiniteCohomology's cohomological five-term sequence and spectral-sequence
exclusion, and the reviewed R17.5/MP.1 library-audit entries. The parent
separates H²(G,kˣ) from integral H₂(G,ℤ); the cohomological five-term sequence
does not supply the required homological transgression or coprime edge.

Read current `TauCeti.ChainComplex.kronecker`, its representative formula,
naturality and `kronecker_bijective`. The last assumes injective
coefficients and cannot supply the arbitrary-coefficient UCT. Read current
`TauCeti.homCokernelEquivExt`, its pushout representative formula and
coefficient naturality: these improve the generic Ext prerequisite but do
not assign or implement the native group-bar comparisons. At the Mathlib
pin, the public Schur–Zassenhaus results are complement existence, not the
needed cyclic complement conjugacy. No Lake command ran in either read-only
tree. The cleared source index was read; no restricted source was copied.

## Validation and next action

- `python3 scripts/check_blueprint.py research/blueprint/packets/InductionRestrictionPartII.json`:
  **0 errors, 0 warnings**; 109 nodes, 124 API items, 96 tests, 30 planets,
  30 baseline declarations, five gaps, one request and six planned stages.
- `lean-check research/blueprint/packages/InductionRestrictionPartII/Suggested.lean`:
  **0 errors; 696 warnings, all declaration uses `sorry`; 0 other warnings**.
  Memory preflight: 97 GiB available. The shared wrapper designates Tau Ceti
  f790474 and reports Mathlib 082e2d37e8. No compiler is left running.
- The separate admission-free sign/mutation check passed after importing
  Mathlib's finite type-tag instances. It ran sequentially after the package
  check, with 99 GiB available.
- `git diff --check` passes. README size: 171,706 bytes, below the 200 KB
  limit. The test labels and accepted statements are preserved. Changes are
  confined to the README, Suggested.lean and this handoff.
- Accepted packet SHA-256 remains
  `85af7815c4223c6b160f957e001598afb66ae1aaa84ddbea6995008ed72519c5`.
  The reader and author suggested file are unchanged.
- Metadata remains absent: creating it would make the intake's existence
  check classify this blocked package as complete.

Resume after the ownership amendment. Retain all 109 targets, 31 finite row
certificates, 38 RS.6 targets and ten accepted source findings. Complete the
mathematical audit, replace contracts by assigned supplying layers, maintain
the target/API/test correspondence, run `lean-check`, and then add
`topic = "math.GR"` metadata.

The predecessor's full supplier analysis, native boundary proof, direct
free-abelianization UCT proof, finite-model receipts and earlier continuation
links remain in the
[immutable predecessor handoff](https://github.com/CBirkbeck/tauceti-explorer/blob/94ef4d10337ec4e58f86ed4804996b862b039b10/research/blueprint/handoff/PKG-InductionRestrictionPartII.md).
Its free-abelianization proof uses two projective-quotient retractions and
requires no general Ext injection or arbitrary-rank subgroup-freeness.
Keep that refinement and the direct commutator-order boundary proof when
reconciling the amended plan. No finite cover certificate is claimed proved
by this checkpoint.
