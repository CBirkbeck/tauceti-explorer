# Independent review of the classical field-symbol blueprint

**Verdict: accepted as a completed planning pass.** Reviewer: Codex / GPT-6,
session `codex-6ghlte`, job `REV-K2SymbolsBrauer--T.2-symbols` (#9268),
2026-10-14. The input was written by a different session. The packet's
`review.checked` records a verdict and reason for every node.

The corrected packet plans sound field-specific proof inputs. Acceptance keeps
its three proof gaps and its exact ordinary-group supplier contract open; the
stage is **planned**, not closed. No implementation is claimed.

## Inventory and coverage

| Item | Reviewed result |
| --- | --- |
| Nodes | 15: 5 constructions, 9 theorems, 1 definition |
| Per-node verdicts | 11 corrected, 4 verified; none added or unverifiable |
| API items | 49, including 3 added fiber API items |
| Definition/construction checks | 27, including one replacement and one addition; each object has at least 3 |
| Planets | 6, within the stage limit |
| Pinned declarations | All 18 original citations confirmed; 1 existing declaration added |
| External supplier entries | 2: the precise ReductiveGroups contract and consumption of current RootSystems exports |
| Proof gaps | 3 retained, with precise resume requirements |
| Inherited identifiers | 19 public field-symbol/Milnor targets retained under their authoritative ids |

The native stage targets are covered as follows. The commutator symbol and
Steinberg relation retain the predecessor's `steinberg-symbol` and
`steinberg-identity` nodes. The tensor and graded Milnor objects retain
`milnor-k-theory`, with the new tensor realization and homogeneous component
bridge supplying their missing proof inputs. `matsumoto` consumes faithful
realization, zero-symbol splitting and stable separation for infinite fields;
its finite-field proof remains an explicit gap. The integral sign consequences
consume `field-calculus`. The additional finite, algebraically closed, real and
arithmetic computations retain their existing target identifiers. Thus the
completed pass satisfies the protocol's definition of planned coverage without
claiming that the remaining proofs are decomposed.

## Corrections made in place

1. **Source locations and source identity.** The field sign calculation is
   supported by the discussion following Weibel III.6.1 on printed p.48 and
   Definition III.7.1 on p.61. Exercise III.6.3, pp.58–59, concerns Laurent
   series; p.47 does not contain the claimed sign discussion. The torus factor
   set is in Matsumoto's formulas (2)–(3), pp.37–38, rather than pp.35–37.
   Matsumoto's comparison and Weibel's target statement now have separate
   `sourceId` entries in the root-word and stable-separation nodes. The
   normalizer-word input cites Theorem 6.3, pp.34–36, and the fiber inverse
   argument explicitly cites Lemma 6.7, pp.40–41.
2. **The existing tensor-power bridge.** Added the pinned
   `TensorAlgebra.equivDirectSum` to the baseline and homogeneous-component
   prerequisites. Its pure-product formulas identify the degree-n piece with
   the n-fold tensor power used in the divisibility argument. This bridge is
   imported rather than replanned. The homogeneous quotient uses only the
   underlying ungraded presentation; the full graded Milnor output is no
   longer a prerequisite of its own proof input.
3. **Scope and order of the extension proof.** Matsumoto §7 proves commutation
   and simple transitivity in rank one and rank two. Lemmas 6.9–6.10 transfer
   relations to the global permutation group by faithful subsystem
   restriction. Corrected the unrestricted commutation claim and stated this
   transfer, including its coset and length inputs. The ordinary matrix
   relations fix the projected coefficients; the source's lift calculations
   establish the stronger permutation equalities.
4. **Normalizer injection.** Expanded the graph-quotient argument of
   Theorem 6.3 and Lemma 6.6: the square subgroup maps to the torus lifts,
   with the type-A fourth-power relation respected because the relevant
   symbol is killed by two; its graph meets the torus copy trivially.
   Faithful realization now first induces the lifted-normalizer map into the
   permutation group and proves it injective before using its Bruhat cells.
5. **Fiber data and usable API.** The torus action is indexed by a lift
   `h~∈H~`, projecting to the ordinary torus element. Added point
   extensionality, the unique coefficient translation between two points of
   a fiber, and the simple-lift square/inverse identity. The new check uses
   `g=x_i(t)w_i(−1)`: its nonzero branch has second coordinate
   `h_i(t⁻¹)w_i`, whereas its zero branch has `w_i²=h_i(−1)`. It detects the
   wrong sign test or deletion of the nonzero branch.
6. **Discriminating tensor check.** Replaced the zero-homomorphism check,
   which any quotient would satisfy, by a real sign detector taking the
   all-minus-one symbol to 1 and complementary symbols to 0. A zero or
   exterior-square quotient fails it. The compact Lean example matches.
7. **Counterexample bound.** The tensor-quotient node's `Q/ℤ` counterexample
   now assumes p>1. Multiplication by p=1 is the identity, and ℤ is
   1-divisible.
8. **Supplier contracts.** Current ReductiveGroups Layer 7 states Bruhat
   decomposition and BN-pairs; it does not explicitly supply the requested
   unique SL_m monomial coordinate, branch/inversion/length transformation
   API or complete ordinary (R1)–(R3) presentation. The reader and request
   now say so. The request also specifies the ordinary type-A Weyl
   identification and the subgroup-orbit compatibility used by Lemma 6.9.
   The current Coxeter word and parabolic declarations are consumed through
   RootSystems Layer 3, with their hypotheses and specialization recorded.
9. **Suggested-file index.** Removed already-declared light definitions and
   theorems from the closing README-only list and indexed the added heavy
   fiber API and check there. No heavy carrier or missing-body data definition
   was introduced.

The packet's per-node verdicts identify these corrections precisely. The four
unchanged verified nodes are zero-symbol splitting, relation divisibility, the
real positive-entry subgroup and cyclic annihilation. The reader was updated
alongside every mathematical correction.

## Sources and convention finding

Every local node's cited locator was opened in the following public versions.
The packet preserves their hashes and printed pagination. No source passages
or source files are submitted.

- [Weibel, separate Chapter III author PDF](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.III.pdf):
  Exercises 5.8–5.9, p.46; III.6.1 and its consequences, pp.48–49; the real
  sign pairing, p.49; Lemma III.6.3, p.51; Proposition III.6.4.1, p.52;
  Definition III.7.1 and Examples III.7.2, pp.61–62; Exercise III.7.3, p.72.
  The unrelated Exercise III.6.3 was also checked before its exclusion.
- [Matsumoto, Ann. ENS 2 (1969), pp.1–62](https://www.numdam.org/article/ASENS_1969_4_2_1_1_0.pdf):
  ordinary presentation and infinite-field hypothesis, p.23; Lemmas 5.1–5.4,
  pp.23–26; Theorem 5.10 and Corollary 5.11, pp.30–31; normalizer words and
  Theorem 6.3, pp.33–36; torus formulas and Lemmas 6.5–6.7, pp.37–41;
  Lemmas 6.8–6.11, pp.41–43; the rank-two proof, §7, pp.44–47.

**Confirmed** `K2SymbolsBrauer/E-field-symbol-factor-order` at the rendered
Weibel author-copy p.46. With the packet's commutator convention, conjugating
h_ij(s) by h_ik(r) yields h_ij(rs)h_ij(r)⁻¹. Its commutator therefore has the
inverse factors in order r then s. Matsumoto Lemma 5.4(c), p.26, independently
agrees: the two relevant roots have Cartan pairing +1. Reversing those factors
gives the inverse symbol. Weibel's tame detector in Lemma III.6.3, p.51,
distinguishes the class of {t,2} from its inverse by the values 2 and 1/2.
The packet now includes the required independent `sourceIssues.review` verdict.
This finding remains confined to the identified author chapter; it makes no
claim about an unread edition or a previously published correction.

The algebraically closed degree bound n≥2 and the real bound n≥1 were checked.
The finite Milnor argument uses cyclic units and the complementary-entry
count, without using classical symbol generation. The arithmetic Bass–Tate
statements were checked in Weibel; their unread proof remains a gap.

## Baseline and ownership

Every original declaration's actual statement and surrounding hypotheses were
read at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` or Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. No original citation was removed or
renamed.

| Declarations | Confirmed provision |
| --- | --- |
| `TensorAlgebra`, `Additive`, `RingQuot` | Integral additive-unit tensor algebra and its ungraded ring quotient; no automatic Steinberg quotient grading |
| `PresentedGroup`, `commutatorElement` | Presentation quotient and the convention xyx⁻¹y⁻¹ |
| `TensorProduct.lift`, `Submodule.liftQ` | Bilinear descent followed by quotient descent with vanishing on the relation submodule |
| `TensorAlgebra.gradedAlgebra` | Existing tensor-algebra grading |
| **Added** `TensorAlgebra.equivDirectSum` | Existing algebra equivalence with the direct sum of finite tensor powers, with pure-product normalization |
| `isCyclic_of_injective_ringHom` | A finite group with an injective multiplicative map into a commutative integral domain is cyclic |
| `rTensor_exact` | Right tensoring preserves an exact pair when the second map is surjective; the name is in the root namespace |
| `TauCeti.transvectionUnit`, `transvectionUnit_add`, `commute_transvectionUnit` | Finite-index commutative-ring matrix lifts, addition and nonchaining commutation with all index inequalities |
| `TauCeti.commutatorElement_transvectionUnit`, `commutatorElement_transvectionUnit_reverse` | Forward coefficient rs and reverse coefficient −sr with three distinct indices |
| `Matrix.SpecialLinearGroup.diag2nUnit_decompose` | Six-transvection diagonal factorization over a commutative ring; its namespace is rooted at `Matrix`, despite its containing file's `TauCeti` namespace |
| `TauCeti.FactorSet`, `TauCeti.FactorSet.inl_range_le_center` | Normalized factor-set extension and central coefficient injection for a trivial action |

The reviewed library audit for this stage was read. Its only supplied diagonal
matrix identity is imported; the distinct quaternion/Brauer symbol does not
replace integral Milnor K₂. The predecessor's inherited target statements
and prerequisite contracts were read. HigherLocalFields HL.1 consumes
`K2SymbolsBrauer:T.2/milnor-k-theory`; no second Milnor construction is added.
The later graded Quillen comparison and residue layers remain separate owners.

Current upstream ReductiveGroups, GrothendieckEulerForms and
RepresentationTheory/RootSystems were read, and all current roadmaps and Tau
Ceti were searched for the field-symbol and graded quotient objects. Current
Tau Ceti already has `TauCeti.matsumoto`,
`CoxeterSystem.existsUnique_mem_parabolic_mul` and
`CoxeterSystem.length_mul_of_forall_not_isLeftDescent`. Their statements were
read. They supply ordinary reduced-word/coset arguments, not K₂ Matsumoto.
These exports are absent at f790474 and are therefore cited through their
upstream owner rather than added falsely to the pinned baseline. No upstream
roadmap or library file was changed, and no ownership move is required.

## Remaining work and validation

The three remaining proof gaps are unchanged in scope:

- **G-finite-classical:** read and decompose the primary finite-field Steinberg
  presentation and stable kernel proof, including the distinction from small
  unstable exceptional kernels.
- **G-Bass-Tate:** obtain an authorized primary arithmetic proof of the number
  field signature isomorphism and positive-characteristic global vanishing,
  both in degrees n≥3. The finite-tuple reduction to global subfields is
  specified but does not replace that proof.
- **G-stable-witness:** supply the predecessor's group-colimit finite-word
  equality criterion.

For integration, attach these proof inputs to the authoritative inherited
outputs. In particular, stable separation supplies generation and Matsumoto;
those outputs must not become prerequisites of its proof. The homogeneous
bridge supplies the graded Milnor API without a reverse dependency. The
maintainer should route the exact ordinary SL_m contract to ReductiveGroups
and ensure that packaging consumes the current RootSystems exports. These
are the remaining orchestrator questions; no source-supported local node is
left unverifiable.

Validation completed:

- `python3 scripts/check_blueprint.py research/blueprint/packets/K2SymbolsBrauer--T.2-symbols.json`:
  **0 errors, 0 warnings** after the review metadata and both supplier entries.
- `lean-check` on the suggested file at the pinned shared build: **exit 0**,
  **33 warnings**, all exactly “declaration uses `sorry`”; no other warnings or
  errors. Available memory exceeded the worker threshold before the run.
- Source-version validation, reader/API/check correspondence, dependency-cycle
  checks, minimum object checks, six-planet limit, submitted path scope and
  whitespace checks passed. The Lean file has 193 lines and no missing-body
  data definition. Heavy carriers remain mathematical targets in the reader.
