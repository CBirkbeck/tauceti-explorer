# Independent review of HabiroRings HR.6

Job `REV-HabiroRings--HR.6`, issue #6453. Reviewer: Codex, session
`codex-iPUxA1`. Date: 6 October 2026. This session did not write the plan.

**Verdict: accepted after corrections.** The packet is a complete target-level
planning pass; HR.6 remains planned. Acceptance does not establish the HB.7
supplier hypotheses, a nontrivial regulator class, or any Lean proof.

## Scope and counts

Reviewed the [packet](../packets/HabiroRings--HR.6.json),
[suggested file](../suggested/HabiroRings--HR.6.lean), and read-only
[reader document](../readmes/HabiroRings--HR.6.md). Checked the five retained
HR.6 contracts in the accepted parent packet against the current suppliers.
The AdicSpaces and HodgeStructures upstream roadmaps supplied the style and
generality standard; neither was changed.

| Item | Result |
| --- | --- |
| New nodes checked | 3: 1 construction, 1 theorem, 1 comparison |
| Per-node verdicts | 1 corrected, 2 verified |
| Retained parent targets checked | 5; degree-zero supplier reference corrected in its import disposition |
| Baseline declarations | 22 confirmed; 0 removed or replaced |
| Nodes added or removed | 0 |
| Construction API and tests | 6 API items, 4 discriminating tests |
| Planets | 2 on HR.6; no duplication of parent nodes |
| Remaining gaps and requests | 4 named gaps, 1 precise HB.7 API request |
| Source findings | No new sourceIssues; 4 inherited findings checked |

## Changes made

1. Corrected the title of arXiv:2410.23078v5 to *q-Witt vectors and q-Hodge
   complexes*. Recorded the PDF date, 7 October 2025, separately from the
   arXiv version date, 6 October 2025. The URL and matching hash are unchanged.
2. Tightened the order-one node's GSWZ locators: Definition 1.4 is on printed
   p.10, and the proof of Theorem 2 is on p.43. Replaced the short tensor
   excerpt with the source's multiplication-isomorphism wording.
3. Made the inherited corrected integral linear-jet contract
   `HabiroNumberFields/E24` explicit in the first-fibre hypothesis. The
   application requires HB.7's accepted corrected modules and effective
   descent, rather than merely the printed local definition.
4. Added `OrderOneFibre.naturality`, with its typed semilinear signature in
   the suggested file. If evaluation intertwines an actual map of fibres,
   their normalized trivializations intertwine it too. This follows directly
   from `map_eq_eval`; it does not supply arithmetic naturality. Updated the
   proof outline and suggested-file policy accordingly.
5. Corrected the retained degree-zero comparison's import disposition to use
   `HabiroCohomologyFoundations:HQ.4/derived-q-de-rham-witt-forms-of-smooth-algebras`
   for Corollary 3.31. The parent instead names `HQ.4/hodge-against-nygaard`,
   whose actual statement is the Nygaard pullback square used inside that
   comparison's proof. Read both declarations in the accepted HQ.1 packet;
   the comparison retains the source's shifts. The parent is outside this
   issue's writable deliverables.

Added the required per-node review object. No mathematics was moved between
owners, and no baseline result was replanned as a new general theory.

## Source verification

Fetched all four public PDFs and independently reproduced every SHA-256
stored in the packet. The mutable author-hosted copy is identified by its
14 January 2026 PDF date and full stored hash. Access date: 6 October 2026.

- [GSWZ, The Habiro ring of a number field, v2](https://arxiv.org/pdf/2412.04241v2):
  Definitions 1.1 and 1.4, equation (13), Theorem 2 and Proposition 1.5(f),
  printed pp.6–11; the local integrality and main-theorem proofs in §§3.2–3.3,
  pp.39–45; and the knot computations in §§4.5–4.6, pp.54–57.
- [Wagner, q-Hodge complexes over the Habiro ring, v2](https://arxiv.org/pdf/2510.04782v2):
  paragraph 1.4, p.4; Corollary 2.13 and its proof, p.19; Theorem 3.11,
  Example 3.12 and Corollary 3.13, pp.25–27; and Corollary 3.31, p.40.
- [Wagner, q-Witt vectors and q-Hodge complexes, v5](https://arxiv.org/pdf/2410.23078v5):
  title/date and §3.4, Proposition 3.31, Lemma 3.32 and their proofs, pp.50–52,
  with Corollary 3.33. Étale scalar extension is along the q-Witt ring map.
- [Wagner, author copy dated 14 January 2026](https://ferdinand-wagner.github.io/papers/q-Habiro.pdf):
  paragraph 1.4 and Theorem 3.11 through Corollary 3.13, pp.4 and 25–27.

Verified all six node citations, including their excerpts. GSWZ Proposition
1.5(f) supplies integral constants when the order is prime to Δ, hence at
order one. Theorem 2 asserts the tensor isomorphism, but its printed proof
only discusses multiplicative local/gluing conditions; HB.7's stronger
effective-descent and bijectivity contracts therefore remain hypotheses.
Wagner's introductory completion-triviality assertion motivates the new
Nakayama argument rather than proving it. Corollary 2.13 is printed for the
discriminant localization; the accepted HR.5 comparison explicitly supplies
the larger common localization used here. Neither source is represented as
proving the supported field scalar equivalence.

Inherited `HabiroRings/E6` is confirmed in both Wagner copies: the reduction
argument uses the quotient filtration in Theorem 3.11(b), whereas the source
cites (a). HB findings E23, E24 and E26 remain with their owner: effective
global tensor descent is not established by multiplicativity alone, the
integral linear term is needed for the Dwork argument, and the abelian global
generator assertion is not proved by the local calculation. The present proof
does not use that generator assertion. No duplicate finding was added.

## Baseline at the pinned commits

Read each cited declaration and its ambient variables in its exact Mathlib
module at `082e2d37e8b0463410cdb532e111cd43d5a66174`. All 22 provide the
claimed input with the same or weaker hypotheses.

| Declaration | Verified input and conventions |
| --- | --- |
| `Module.Invertible` | Bijective canonical dual contraction; finite/projective, dual, tensor and ordinary scalar-extension instances. No free-module hypothesis. |
| `Module.Invertible.bijective_of_surjective` | Surjective linear map between invertible modules is bijective over a commutative semiring. |
| `Module.Invertible.free_iff_linearEquiv` | For an invertible module, freeness is equivalent to a linear equivalence with the base ring. |
| `CommRing.Pic.mk` | Class of an actual invertible module; the group is written multiplicatively. |
| `CommRing.Pic.mk_eq_one_iff` | Trivial class iff an equivalence with the ring exists. |
| `CommRing.Pic.mk_eq_mk_iff` | Equality of classes iff an actual module equivalence exists. |
| `CommRing.Pic.mapRingHom` | Ordinary tensor scalar extension along the ring homomorphism and its induced algebra structure. |
| `CommRing.Pic.mapRingHom_comp_mapRingHom` | Composition of these maps agrees with the composite ring map. |
| `CommRing.Pic.mapRingHom_id` | Identity ring map gives the identity Picard map. |
| `TensorProduct.AlgebraTensorModule.cancelBaseChange` | Iterated tensor cancellation with the stated algebra/scalar-tower structures. |
| `TensorProduct.AlgebraTensorModule.distribBaseChange` | Ordinary base change distributes over module tensor products. |
| `TensorProduct.lid` | Tensor unit equivalence, sending a pure tensor to scalar multiplication. |
| `PowerSeries.constantCoeff` | Ring map from power series to coefficients, with constant-series section. |
| `PowerSeries.constantCoeff_surj` | Surjectivity via that section. |
| `PowerSeries.X_dvd_iff` | Divisibility by X iff constant coefficient is zero, identifying the principal kernel. |
| `PowerSeries.isUnit_iff_constantCoeff` | A series is a unit iff its constant coefficient is a unit. |
| `Ideal.mem_jacobson_iff` | For every multiplier y an inverse witness z satisfies zyx+z−1 in the ideal; apply to X using 1+yX. |
| `Submodule.mkQ_surjective` | Lift an element of an ordinary module quotient. |
| `LinearMap.toSpanSingleton` | Linear map from the ring sending a scalar to its multiple of a fixed vector. |
| `LinearMap.surjective_of_surjective_comp_mkQ` | Finite target and ideal contained in the Jacobson radical suffice for lifting surjectivity; no locality or noetherianity. |
| `TensorProduct.quotTensorEquivQuotSMul` | Base-ring-linear equivalence between quotient scalar extension and the module quotient by the ideal action. |
| `RingHom.quotientKerEquivOfSurjective` | Ring equivalence from the quotient by the kernel to the target of a surjective ring map. |

Also searched tracked Tau Ceti Lean sources at
`f790474821cf4256814db967cb154e7af3d0c369` for Habiro, q-Hodge and q-Witt
terms. No matching carriers were found. The accepted AUDIT-17 entry for
HR.6 likewise records the four stage targets as absent and the ordinary
invertible/Picard theory as existing. This packet uses that theory, and leaves
K₃, actual indexed lines and enhanced coefficient carriers with their owners.

## Closure, API and ownership

The first-fibre proof uses a finite sum inverse certificate from HB.7, not a
global basis: evaluating the sum gives a preimage of 1. Scalar multiplication
makes evaluation surjective; base-change invertibility and the existing
bijectivity theorem then give the unique normalized equivalence. The four
tests check tensor-unit evaluation, a negative normalization, the inverse
generator, and exclusion of the zero evaluator. The sixth API item states
exactly the semilinear compatibility used by the scalar-square consumer.

For the completion theorem, quotient tensor/base-change identifies P/XP with
the first fibre. Lift its generator. Every 1+yX is a unit, so (X) lies in the
Jacobson radical. Nakayama makes the generator map surjective, and
invertibility makes it bijective. This is valid for a general commutative
coefficient ring. A full basis is noncanonical even after its constant is
fixed: the additional suggested examples check 1+X and X over the integers.

The supported scalar square imports HB.7's actual field pullback and scalar
equivalence, with a common Δ divisible by both 6 times the absolute
discriminants. Transport through HR.5's Taylor-compatible ring comparisons
gives the actual module equivalence; Picard functoriality supplies its class
square. Tensors are over H, with no constant-family R-algebra structure on H.
The suggested four-ring square proves only the formal Picard implication.

All five retained targets have the appropriate supplier boundaries:

- The étale degree-zero comparison uses the empty framing, multiplicative
  adic filtration, HQ.3 descent, the corrected HQ.4 forms comparison and
  étale base change, and HR.4's complete principal deformation universality.
  Its enhanced prerequisites stay conditional; ordinary formal étaleness
  alone does not replace them.
- Complete derived scalar extension uses HR.2's reflective complete-module
  and monoidal interfaces. Completion is inert on perfect coefficients;
  the ordinary Picard comparison does not identify shifted derived lines
  with ordinary modules.
- Transported regulators use actual HB.7 lines and its conditional tensor
  character, rather than constructing another K₃ theory.
- The ring-kernel witness imports HC.4–5: Taylor injectivity over the
  integers and nonzero disconnected-factor idempotents after inverting a
  prime. It does not detect a regulator class.
- Completion of the regulator is refined by the new first-fibre/Nakayama
  nodes, with an actual nontrivial pre-completion Picard witness still missing.

Read the exact HB.7 follow-up statements, HR.5 ring comparison, HR.4
universality, and accepted HQ.1/HQ.3 supplier nodes. The HQ coordinate/étale
and scheme-cohomology prerequisites do not return to HR.6, so no new cycle is
introduced. HQ owns cohomology, HB.7 owns indexed modules, and HR.6 owns
coefficient comparisons. The not-yet-installed RS-10 stage migration is not
assumed. Two central planets fit the six-per-layer limit. Target-level
granularity is appropriate; the new naturality equality needs no separate
non-routine lemma node.

The remaining obligations are `G-global-descent`,
`G-arithmetic-naturality`, `G-nonzero-regulator`, and
`G-signatures-and-enhanced-inputs`. The single HB.7 request specifies the
canonical order-one torsor, integral semilinear evaluation, multiplication,
and supported naturality. Neither nonzero K₃, local regulator values,
numerical knot comparisons nor ring noninjectivity proves the missing
nontrivial Picard class. These honest limits are compatible with a planned
stage and a completed review pass.

## Checks and assembly notes

`python3 scripts/check_blueprint.py research/blueprint/packets/HabiroRings--HR.6.json`
passes with **0 errors and 0 warnings**. `lean-check` elaborated the updated
suggested file at the exact Mathlib pin with **15 intentional proof-hole
warnings and no errors or other warnings**. It imports Mathlib only;
verification of the Tau Ceti pin used historical source reads. The suggested
file claims no implementation, and its missing actual/enhanced signatures
remain explicitly listed. `git diff --check` passes.

For the orchestrator: when assembling these accepted parts, carry the
corrected HQ.4 supplier into the parent's degree-zero comparison and include
the sixth fibre API item in the reader's table/count. Those files are outside
this review's deliverables. No mathematical decision or unavailable source
blocks acceptance; the four recorded gaps remain the next owners' work.
