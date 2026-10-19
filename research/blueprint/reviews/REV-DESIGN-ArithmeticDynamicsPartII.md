# Independent review of ArithmeticDynamicsPartII

Accepted after corrections, at **target level**. This is a complete design pass with explicit open obligations, not an implementation or a closed proof packet.

Reviewer: Codex (GPT-6), session `codex-PwbPaJ`, 19 October 2026. Job: `REV-DESIGN-ArithmeticDynamicsPartII`, issue #3496. The design was written by a different session, `Codex-XhgHqw`.

The packet contains 51 nodes: 15 definitions, 3 constructions, 30 theorems and 3 comparisons. The independent audit verifies 23 and corrects 28; no node was added or removed. There are 69 API entries, 55 tests, 28 planets and 20 confirmed baseline declarations. All eight stages are planned; none is closed. Five gaps and five supplier requests remain explicit. Every definition and construction has at least three tests that distinguish plausible wrong definitions.

I read the roadmap and packet against the issue's routed obligations, the parent ArithmeticDynamics plan, the reviewed library audit, the actual CA.4/AN.5/FF.2 supplier statements and the WC.3 purity contract. The current upstream roadmap and Tau Ceti library were also searched, including the nine roadmaps newer than the atlas snapshot; no existing Markoff development was found. The upstream AlgebraicCodingTheory and DenseGraphLimits readers supplied the presentation standard. The scope preserves all 95 routed obligations exactly once: 48 finite-field items (including the existing CA.4 twist import) and 47 items assigned to two explicit split proposals. The latter are not represented as existing suppliers or as proof-read material.

The full per-node verdict and reason is in `review.checked` in the packet. Its direct prerequisites, source `match`, hypotheses and proof route were checked for every node. At this target level, the norm argument and the divisor-product argument belong inside their existing targets; splitting them into implementation lemmas would change the requested granularity.

## Corrections

The table records every node whose contents changed. Source-only corrections still receive the verdict `corrected`.

| Node (prefix `ArithmeticDynamicsPartII:`) | Changed fields | Review result |
| --- | --- | --- |
| `MD.0/action-groups` | `sources` | Checked V versus Γ and coefficient-three versus coefficient-one conventions against CA.4; separated the Martin and BGS source locators. |
| `MD.0/components` | `sources` | Checked both directions of the walk/generated-subgroup equivalence using the pinned graph and action carriers; corrected Martin page references. |
| `MD.0/finite-regressions` | `sources` | Independently enumerated the coefficient-three graphs at 2 and 3 (4 and 8 vertices, both connected); the coefficient-one locus at 3 is empty. Corrected the source attribution to distinguish computation from a printed table. |
| `MD.1/penner-weights` | `sources` | Checked all zero-coordinate branches and the nonzero denominator hypotheses against equation (2.1); corrected the printed-page locator. |
| `MD.1/involution-balance` | `sources` | Checked the involution change of variables and division by 2 in the target field; corrected the proof locator to p. 625. |
| `MD.1/component-divisibility` | `sources` | Checked summation of the three balances and reduction of the natural cardinality modulo p; p>3 remains explicit. Corrected the theorem/proof locators. |
| `MD.2/slice-classification` | `sources` | Checked κ, the norm-one torsor, the t↦λt action and all a=0,±2 exceptions; separated BGS and Chen locators. |
| `MD.3/cage` | `sources`, `uses` | Checked the definition versus the later connectedness theorem and its tests; replaced the dangling use reference with the primitive-intersections node and corrected §3.2 to p. 11. |
| `MD.3/slice-incidence` | `sources` | Checked the geometric nonsquare condition required by the existing FF.2 quadratic-character theorem and the eventual, rather than explicit, range; corrected Proposition 6 pages. |
| `MD.3/primitive-intersections` | `statement`, `proofSteps`, `sources` | Corrected the cycle-point main term by dividing the primitive-eigenvalue pair count by two. Checked irreducibility, uniform genus/punctures and the exact sharp-curve supplier request; fixed the source locator. |
| `MD.3/middle-game` | `acceptance`, `sources` | Checked the increasing-order argument with the conservative CZ bound, both tori and exact AN.5 asymptotic exports; clarified that Q3 concerns only explicit constants and separated source locators. |
| `MD.3/opening-game` | `proofSteps`, `prerequisites`, `sources` | Made the cyclotomic reduction/norm argument explicit, with four checked Mathlib prerequisites; retained parabolic and trace-zero cases and corrected the source pages. |
| `MD.3/giant-orbit` | `prerequisites`, `sources` | Checked the opening/middle/endgame composition and subpower complement estimate; removed a redundant broad AN.5 dependency and corrected the proof locator. |
| `MD.4/root-orbit` | `sources` | Checked normality of V in Γ and symmetry of the integral root; the p=3 case uses coefficient three. Separated the Martin and BGS source locators. |
| `MD.4/eventual-connectivity` | `sources` | Checked that a nonempty complementary V-orbit would have at least p points, contradicting the giant complement; corrected the Martin theorem and argument pages. |
| `MD.4/graph-and-affine-approximation` | `sources` | Checked positive descent/root generation, the origin and both coefficient conventions against the actual CA.4 supplier; separated Chen and Martin source locators. |
| `MD.4/conjecture-register` | `sources` | Checked the separation of proved eventual results and the all-prime conjecture, including empty coefficient-one transitivity at 3; separated the two source locators. |
| `MD.5/reducing-functions` | `proofSteps`, `prerequisites`, `tests` | Replaced the invalid ratio-of-minima repair by terminal-quotient case splits, added the direct Nat.minFac prerequisite and a fourth regression test; checked product stability and monotonicity. |
| `MD.5/rank-bound` | `acceptance` | Confirmed that the source comparison is central, rejected allegation E7 and recorded the actual rank-index misprint as E16; clarified acceptance without altering the valid central statement. |
| `MD.5/effective-bound` | `sources` | Checked the exact primorial product against the conservative decimal threshold; corrected source locators and kept the numerical endpoint blocked on G3/G4 and the explicit-bound request. |
| `MD.6/trace-moduli` | `sources` | Checked trace equivalence, irreducibility and epimorphic-locus distinctions in Chen §5.2; corrected the theorem/proposition pages. The general moduli supplier remains G1. |
| `MD.6/trace-order` | `sources` | Checked noncentrality, eigenvalue order and the even-characteristic convention against Definition 5.1.4 and Proposition 5.1.5; corrected their pages. |
| `MD.6/valuation-congruences` | `sources` | Checked the two independent ℓ-adic congruences and the exclusion t=±2 against Theorem 5.5.9; corrected its printed page and the introductory theorem reference. |
| `MD.7/primitive-squarefree-locus` | `sources` | Checked that CRT requires every local point to be nonzero; separated MP and Chen locators and retained mixed-zero points as nonexamples. |
| `MD.7/meiri-puder-condition` | `sources` | Checked the radical 32√(p+1), square-root choice and the p≡1 mod4 alternative against MP Theorems 1.3–1.4; separated the Chen reference. |
| `MD.7/subdirect-independence` | `proofSteps` | Checked the p=7 alternative fixed-point argument and the later-prime socle construction; made the Q_q and distinct-commutator corrections in E18 explicit. Generic structure and the coincidence check remain G2. |
| `MD.7/sign-lifting` | `proofSteps`, `prerequisites` | Added the actual FF.2 character-bound prerequisite and Q5 link, and made the second-coordinate commutator correction E17 explicit; the auxiliary small-prime computation remains G5. |
| `MD.7/squarefree-transitivity` | `sources` | Checked assembly from primitive block actions, independence and sign lifting; separated MP and Chen source locators and retained the local transitivity/MP hypotheses. |

The primitive-coordinate count now counts cycle points rather than ordered pairs of a cycle parameter and an eigenvalue. In BGS16, equations (25)–(33), pp. 7–11, the two inverse primitive eigenvalues give the same coordinate trace. Dividing by two changes the main term to Lφ(p−1)/(2(p−1)); it does not change the eventual positivity argument.

The reducing-map product proof now handles quotient one before using least-prime-factor identities. For (A₁,B₁)=(1,1) and (A₂,B₂)=(3,5), the true ratio is 3/5 whereas the ratio of the separate minima is 1. Thus the original proposed inequality repair was also insufficient. The corrected case split discards a terminal denominator pair, bounds a terminal numerator pair directly, and uses the ordinary product/minimum identity only for numerator factors greater than one. A fourth packet test and a light Lean regression record this distinction.

The reader was synchronized with every changed node, all source verdicts, source-reading receipts, request Q5 and the four new baseline declarations. Its summary now describes the independent verdict, and the baseline table has continuous rows for correct rendering. The roadmap's source receipts and embedded reader were synchronized as well. G4 now correctly says that 48,066 is the number of enumerator outputs below the eventual cutoff, rather than the number of expensive checks (EFLMT24 Remark 4.6, p. 26). The exact central coefficient and decimal comparison do not certify that search.

## Baseline audit

Pinned Mathlib: `082e2d37e8b0463410cdb532e111cd43d5a66174`; pinned Tau Ceti: `f790474821cf4256814db967cb154e7af3d0c369`. Every declaration below was opened and its complete statement checked at the pin. None was removed or replaced. The final four were added as direct opening-game prerequisites; their finite/free/separable/Galois hypotheses hold in the cyclotomic number-field application. Existing generic graph, quotient, action and arithmetic carriers remain imports, not new roadmap constructions.

| Confirmed declaration | Pinned module and line |
| --- | --- |
| `mathlib:SimpleGraph` | `Mathlib/Combinatorics/SimpleGraph/Basic.lean:95` |
| `mathlib:SimpleGraph.Reachable` | `Mathlib/Combinatorics/SimpleGraph/Connectivity/Connected.lean:52` |
| `mathlib:SimpleGraph.ConnectedComponent` | `Mathlib/Combinatorics/SimpleGraph/Connectivity/Connected.lean:390` |
| `mathlib:Subgroup.closure` | `Mathlib/Algebra/Group/Subgroup/Lattice.lean:329` |
| `mathlib:MulAction.orbit` | `Mathlib/GroupTheory/GroupAction/Defs.lean:49` |
| `mathlib:Equiv.Perm` | `Mathlib/Logic/Equiv/Defs.lean:96` |
| `mathlib:ZMod` | `Mathlib/Data/ZMod/Defs.lean:142` |
| `mathlib:ZMod.natCast_eq_zero_iff` | `Mathlib/Data/ZMod/Basic.lean:519` |
| `mathlib:ZMod.chineseRemainder` | `Mathlib/Data/ZMod/Basic.lean:889` |
| `mathlib:orderOf` | `Mathlib/GroupTheory/OrderOfElement.lean:182` |
| `mathlib:Nat.divisors` | `Mathlib/NumberTheory/Divisors.lean:52` |
| `mathlib:Nat.totient` | `Mathlib/Data/Nat/Totient.lean:39` |
| `mathlib:Nat.factorization` | `Mathlib/Data/Nat/Factorization/Defs.lean:50` |
| `mathlib:Nat.minFac` | `Mathlib/Data/Nat/Prime/Defs.lean:218` |
| `mathlib:MulAction.IsBlock` | `Mathlib/GroupTheory/GroupAction/Blocks.lean:171` |
| `mathlib:MulAction.IsPreprimitive` | `Mathlib/GroupTheory/GroupAction/Primitive.lean:91` |
| `mathlib:RingOfIntegers.dvd_norm` | `Mathlib/NumberTheory/NumberField/Norm.lean:76` |
| `mathlib:Algebra.norm_eq_prod_embeddings` | `Mathlib/RingTheory/Norm/Transitivity.lean:268` |
| `mathlib:Algebra.norm_ne_zero_iff` | `Mathlib/RingTheory/Norm/Basic.lean:112` |
| `mathlib:IsCyclotomicExtension.finrank` | `Mathlib/NumberTheory/Cyclotomic/PrimitiveRoots.lean:180` |

The extra imports expose the cyclotomic opening argument's norm step: lift eigenvalues at a prime above p, form a nonzero integral relation, force p to divide its integral norm, and bound every complex conjugate. The cyclotomic degree is φ(N), where N is bounded by the product of the three coordinate orders. No new norm theorem is planned.

## Source findings and reading limits

All 18 findings have an independent verdict: **17 confirmed, one rejected**. Three findings, E16–E18, were added. The full version receipts, URLs, hashes, locators, own-word descriptions and reasons remain in the packet and reader.

| Finding | Verdict | Independent assessment |
| --- | --- | --- |
| E1 | confirmed | Martin Theorem 1.4 (p. 624) needs the characteristic-three exception; its proof uses p>3. The coefficient-three graph at 3 has eight vertices. |
| E2 | confirmed | Chen Theorem 5.5.8(b), p. 417, overstates the full composite affine image. The mod-65 mixed-zero witnesses satisfy the equations and cannot come from a nonzero integral triple. |
| E3 | confirmed | Chen p. 417 miscounts the coefficient-three nonzero orbit at 3: it has eight points, not one. |
| E4 | confirmed | The EFLMT author-revision Lemma 2.1 application (pp. 4–5) does not justify its sharp constants from CZ13. Four punctures and degree-two maps give the conservative replacement. This is a proof gap, not a counterexample to the lemma or numerical theorem. |
| E5 | confirmed | The nonempty geometric connectedness assertion in Chen Theorem 5.5.7(b), pp. 415–416, requires the small-prime exclusions made explicit by §5.6, p. 417. |
| E6 | confirmed | The equality in EFLMT arXiv v1 Theorem 1.3, p. 2, was already replaced by an upper bound in the July author revision. |
| E7 | rejected | Theorem 3.21 is a central-rank comparison. The alleged all-ranks statement is not made; n=4,k=0 tests an unclaimed extension. E16 records the actual misprint. |
| E8 | confirmed | EFLMT p. 22, after (29), loses an eighth power and uses an insufficient constant in the displayed guard chain. The packet derives its own guard. |
| E9 | confirmed | EFLMT pp. 20–21 needs the sum of split and nonsplit subgroup contributions, with common divisors counted twice. |
| E10 | confirmed | BGS16 p. 14 has an invalid universal assertion about proper SL₂ subgroups, retained in BGS24 p. 20. An independently enumerated perfect subgroup of order 120 in SL₂(F₁₁) refutes it. The packet uses the CZ route instead. |
| E11 | confirmed | BGS16 Appendix Corollary 15, p. 20, and BGS24 Corollary 21, p. 29, allow inversion, which preserves every root-of-unity subgroup and contradicts the asserted uniform sublinear conclusion. |
| E12 | confirmed | BGS16 equation (63), p. 16, confuses inverse indices; p. 17 gives order two at trace zero instead of four. BGS24 equation (80), p. 22, retains index slips but its following paragraph fixes the order. |
| E13 | confirmed | MP18 Corollary 5.11 proof, p. 25, overlooks #Y*(7)=7 in its non-prime-power shortcut. The alternative fixed-point argument repairs this case. |
| E14 | confirmed | EFLMT product/minimum step needs a quotient-one case split, not the proposed ratio inequality. The corrected node and regression supply it. |
| E15 | confirmed | Chen Proposition 5.4.2 proof, p. 412, must normalize a Frobenius-stable eigenline before choosing its rational vector. |
| E16 | confirmed | EFLMT Theorem 3.21 proof, p. 19, has two missing divisions by two in the central-rank index; p. 20 confirms the intended index. |
| E17 | confirmed | MP18 Lemma 5.5 proof, p. 22, must use rotation 2 and a new h₂ for the second sign commutator; the p=13 calculation distinguishes the two actions. |
| E18 | confirmed | MP18 Lemma 5.13 proof, pp. 25–26, needs the later-prime Q_q action, distinct K₁/K₂ commutators and the final π_q projection. The surrounding types determine the repairs. |

I read Martin's published four-page article, the relevant published Chen and CZ pages, BGS16's 24-page preprint, the EFLMT 29 July 2024 author revision and MP18's relevant action/independence arguments. BGS24 was collated at the corresponding locations. The EFLMT publisher text was inaccessible, so its findings are expressly about the dated author copy; the corrected v1 inequality is version-specific. Author/publication pages, version histories and correction searches yielded no separate correction for the remaining claims. This is not a claim that none exists.

Chen's general moduli proofs before §5 remain unread supplier material under G1. The external primitive-group proof cited by MP18 remains G2; the uncleared Dixon–Mortimer book was not read. The underlying low-order-point proof requested by Q4 was not read. The 47 integral/bifurcation split obligations were checked as a routing ledger, not primary-proof reviewed. These limits are compatible with accepting the explicit target-level design and do not justify marking any affected proof source-decomposed or closed.

## Coverage, ownership and orchestrator follow-up

Each MD.0–MD.7 stage target has a node, with the imported CA.4 ownership preserved. All stages remain planned and all implementation statuses remain unchecked. There are no closed-stage claims to certify. The five gaps and five requests describe actual outstanding mathematical or certificate obligations, rather than fictitious prerequisite IDs.

- Assign an owner for G1's nonabelian-level/Fricke dictionary, including actual representation-image and centralizer factors.
- Assign an authorized generic permutation-group supplier for G2, and certify its finite coincidence check. Ordinary CRT and Mathlib's primitive-action predicate do not supply the socle theorems.
- Close G3/G4 before claiming the numerical connectivity theorem: prove the explicit cage range and sharp local bound, or recompute and certify with repaired constants. The source's large reduced-integer run was not reproduced here.
- Deliver G5's auxiliary product and small-prime certificates before treating sign lifting as source-decomposed.
- Route Q1/Q4 to the character-sum owner, Q2 to the sharp curve-purity owner and Q3 to the explicit analytic-number-theory owner. Q5 uses the existing character-bound statement; only its geometric checks belong here.
- Decide the two proposed splits, ArithmeticDynamicsIntegralOrbits and ArithmeticDynamicsPartIIBifurcation, using the exact inherited routing ledger. Neither name is an existing prerequisite.

These are follow-up obligations, not requests to reject a sound finite-field design pass.

## Validation

- `python3 scripts/check_blueprint.py research/blueprint/packets/ArithmeticDynamicsPartII.json`: passed, zero errors and zero warnings.
- `lean-check research/blueprint/suggested/ArithmeticDynamicsPartII.lean`: elaborated in the shared build at the pinned Mathlib commit; only 20 expected `sorry` warnings. This checks the suggested signatures, not theorems or certificate soundness.
- Independent exact finite calculations gave coefficient-three connected graph sizes 4, 8, 40, 28 and 208 at 2,3,5,7,13. The coefficient-one graph at 3 is empty, and its coefficient twist agrees away from 3. Weight identities were checked at 5,7,13; rotation-cycle counts were 8,5,26.
- Exact checks reproduced both mod-65 mixed-zero equations, the n=12 maximal-divisor examples, 30,276 valid reducing-product quotient cases, the primorial product with Ω=187 and central coefficient 3013671869689423302959704266406116383317724743440, and its conservative decimal comparison. These are review checks, not a large connectivity certificate.
- Exact matrix multiplication verified that the displayed two generators in SL₂(F₁₁) generate a proper group of order 120 whose derived group also has order 120.
- Review-record completeness, source-verdict completeness, reader/node synchronization, JSON validity and `git diff --check` were checked before submission.
