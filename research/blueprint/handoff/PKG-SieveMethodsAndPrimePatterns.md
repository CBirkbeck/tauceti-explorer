# PKG-SieveMethodsAndPrimePatterns

Completed package for issue #9195 by Codex (GPT-6), session `codex-DRerHK`,
14 October 2026. This is a completed packaging job, not a checkpoint or a
claim that the analytic theorems have been formalised. The next step is an
independent package review. No accepted packet, original reader, original
suggested file, library, upstream roadmap or atlas data was changed.

## Deliverables and preservation

The package README has the upstream form: Summary, ownership, conventions,
exact supplier contracts, six layers with mathematical statements, APIs,
Checks, examples and dependencies, downstream uses and references. It retains
all 224 accepted targets, all 251 API items, 170 definition/construction Checks
and the two additional lemma Checks. Each of the 40 definition/construction
targets retains at least three discriminating Checks. All 25 bibliography
entries and 68 source-sensitive corrections remain, expressed without source
passages or acquisition logs. The rational 42-coefficient Maynard certificate
and the full 105-entry admissible tuple are included.

The 724-line Suggested.lean has one import block and header, the roadmap
namespace, six matching layer headers, 29 real-bodied definitions or aliases,
33 milestone/end theorem signatures and 68 examples. Its finite arithmetic
function `incompleteLog` uses the actual divisor sum and proves its zero field
by simplification. It contains no admitted data definitions, constructions,
instances or chains of auxiliary lemmas. The 23 absent main definition or
construction targets, and further operations belonging to them, are named in
the closing comment. Their complete mathematical specifications remain in the
README; the Lean file is deliberately representative.

Metadata is `topic = "math.NT"`.

## Packaging corrections and dependency order

The accepted review's 31 target corrections are retained, including the strict
Maynard parameter range, zero-dimensional conventions, direct maximal
distribution requirement, exact rational certificates, positive-semidefinite
qualification, arbitrary numerators in the prime quadratic estimate, monic vs
irreducible finite-field counts, corrected Chen constants, the FIMR erratum
and the distinction between ordinary expansion and absolute affine mixing.

Two additional defects were found during packaging and corrected here without
editing the accepted packet:

- The discriminant-character periodicity API allowed `D=1`, but its zero
  convention gives χ₁(0)=0 and χ₁(1)=1. Periodicity modulo one is therefore
  false. Require `|D|>1`, together with `D≡0 or 1 mod 4`, for periodicity and
  the Dirichlet-character comparison. Both README and Lean include the
  excluded modulus-one witness. The arithmetic function itself is still
  defined at every integer D.
- The current public Kedlaya Chapter 14 has a Wirsing calculation in §14.1,
  equations (14.1.1)–(14.1.5), rather than a numbered Theorem 14.1. The general
  Selberg denominator locator now cites those equations and §14.2 (14.2.1).

The README also explicitly requires a nonempty tuple for the max/min prime-gap
consequence; its empty-tuple prime-count conclusion remains trivial. Two
opening native-sieve API names were checked and spelled as the pinned names
`BoundingSieve.siftedSum_le_mainSum_errSum_of_upperMoebius` and
`BoundingSieve.mainSum_lambdaSquared_eq_sum_mul_sum_sq`.

Nine targets were moved earlier, without changing their content or ownership,
to remove forward-layer prerequisites:

| Target | Accepted layer | Package layer |
| --- | --- | --- |
| SieveGram.gramRow_eq_zero_iff | 2 | 0 |
| SieveGram.norm_sum_smul_sq_le_gramRows | 2 | 0 |
| SieveGram.selberg_defect_le | 2 | 0 |
| SieveGram.selberg_weighted_inner | 2 | 0 |
| SieveGram.bombieri_of_gramRow_le | 2 | 0 |
| SieveGram.bombieri_selberg | 2 | 0 |
| SieveGram.bombieri_diagonal_offDiagonal | 2 | 0 |
| SieveQuadratic.discriminantCharacter | 2 | 0 |
| SieveBinary.binary_convex_largeSieve | 2 | 1 |

The remaining targets are ordered topologically within their layers. Internal
packet/stage identifiers are replaced by mathematical names and README layer
numbers. The 21 supplier requests have exact mathematical contracts in the
opening sections and local consumption sites. Stronger requested inputs are
not represented as consequences of an existing weaker supplier theorem.

## Current upstream duplication audit

Read the current upstream roadmap and Completed trees, including the nine
roadmaps newer than the atlas snapshot, and the current Tau Ceti library,
read-only. Current upstream main was
`0d144d044dacebca17b654695b6f1ad58f159b27`; current Tau Ceti was
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The changes since the review's
`070dc2b` were also screened; none added the sieve targets. EffectiveBounds
and ArithmeticDirichletSeries supplied the upstream README/Suggested models.
The library audit and ownership reconciliation in the accepted inputs were
read before packaging.

No accepted target was removed as a new duplicate. The package imports native
weighted-sieve carriers and their existing upper/diagonal identities;
IntegralLattices Layers 0/3 for half-norms and local classification;
GlobalNumberFields Layers 3/3C/11 for generators, units and orders;
ArithmeticDirichletSeries Layers 1/2/5 for ideal norm fibres, convolution and
prime-power removal; ClassFieldTheory Layer 14 for reciprocity; and Chebotarev
Layer 13 for natural principal-prime normalization. The conic target is only
the count-preserving rank-two adapter. These theories are not reconstructed.

The current library's two-vector Gram determinant is not the finite row-sum
Selberg/Bombieri inequality. Its elementary divisor bound is not the required
uniform τ/φ moment. Fixed-modulus prime asymptotics do not provide maximal
Bombieri–Vinogradov over growing moduli. Algebraic spin-group results are
unrelated to ideal spin symbols. AA.4's density of G(F) does not give strong
approximation for a fixed finitely generated subgroup. Those distinctions are
kept in the scope and supplier contracts.

## Source checks and boundaries

The accepted review supplies the full source audit. Packaging independently
checked more than fifteen locators in public primary texts: Maynard's
published pp.383–390 and 409–412 (admissibility, Propositions 4.1–4.3,
factorial/G formulas and variational witnesses); Kedlaya Chapters 12, 14–18
(Brun, Wirsing, sharp/additive and character large sieves, the fixed-cutoff
statement and the arbitrary-function/maximal proof distinction); Heath-Brown
math/0209360v1 §§1–3; and Khayutin Proposition 9.25–9.26 and Appendix B.3/B.4/B.8.
The public Skorobogatov–Sofos pp.674–675 definitions distinguish local
admissibility from irreducibility. KM arXiv1809.09597v1 Theorems 1–2, §2.3 and
Corollary 2.2 were read for the unit average, ψ dependence and q∤k condition;
the FIMR published 2015 erratum pp.924–925 confirms the reduced-conductor
progression argument. None of these passages is reproduced in the repository.

No claim is made that packaging newly verified all 25 sources or the inherited
large regression suites. The public Heath-Brown 1995 publisher endpoint was
unavailable to this run; its accepted-review verification is retained. Chen's
finite constants were recomputed from the recorded formulas, not presented as
a new reading of the scanned proof. Halberstam–Richert Lemmas 5.3–5.4, Richert
(1969) Theorem A, the referenced KM (2018) Proposition 3.6 and DFI Lemma 9 remain
precisely scoped accessible-proof requirements. No uncleared book was used.

In particular, the ordinary-density R₂ step in Khayutin equation (47), p.233,
does not follow from the corrected-density premise: Q=x₀² has ρ_Q(p²)=p³.
The binary sieve theorem is explicitly a construction objective requiring a
valid replacement at its stated hypotheses, and its congruence consequences
retain that requirement. It is absent from Lean. Maximal Vaughan covering,
squarefull spin exceptions and actual affine absolute mixing similarly remain
explicit proof obligations, not silently discharged by a nearby theorem.

## Validation

- `lean-check` on the final package Suggested.lean: exit 0, no errors,
  exactly 101 expected `declaration uses sorry` warnings and no other warnings.
  Shared pinned Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
  `f790474821cf4256814db967cb154e7af3d0c369`; only Mathlib is imported because
  the representative signatures use its carriers. This validates elaboration,
  not mathematical proofs.
- Scratch-only pinned `#check` file for all 206 baseline declarations: exit 0;
  actual signatures inspected. No names catalogue was added to Suggested.lean.
- `python3 scripts/check_blueprint.py` on the unchanged accepted packet:
  zero errors and warnings, 224 targets, six planned stages. Its 29 gaps and
  21 requests are implementation obligations, not missing package files.
- Inventory: all targets, APIs and Checks present; every definition/construction
  has at least three Checks; no local prerequisite points to a later layer.
  No private paths, forbidden upstream/bookkeeping identifiers or process
  vocabulary remain in the README.
- Exact rational computations: M₅ has I=29509/1222452000 and ratio
  1417255/708216>2; all 42 M₁₀₅ coefficients reproduce the recorded I, ΣJ and
  ratio>4. The symmetric fibre-kernel polynomial has value 1/128 at (1/4,1/4),
  I₂=1/3150 and both fibre integrals zero. The tuple has 105 distinct entries,
  diameter 600 and avoids all 27 prime obstructions up to 105 (larger primes
  are automatic). Chen's 200-term rational log intervals give upper envelope
  <0.49255, −0.0164727<V<−0.0164725 and final lower envelope>2.6408.
- Finite negative controls: zero survives only at prime product one; the
  divisor-one remainder persists; endpoint prime counts and π/φ discrepancy
  agree; ordinary x² prime-square counts are p³; the ramified conic has three
  roots modulo three and none modulo nine; split/inert conic counts agree;
  values {2,3} fail simultaneous primitivity modulo six. All passed.
- Four-file intake check and `git diff --check`: passed before submission.

## Remaining implementation obligations

Every accepted gap remains in its layer's analytic or native-interface
requirements. They concern proofs and constructions for eventual library
contributors. The independent package reviewer should start with the two
new corrections above, supplier near misses, the exact witness computations
and the representative Lean signatures. No package work is left for a
continuation worker.
