# Independent review: GC.5 all-degree character sheaves

**Verdict: accepted as a planning pass.** GC.5 remains **planned**, with
three explicit geometric gaps and one supplier integration request; it is
neither closed nor implemented. Reviewer: Codex, session `codex-xNXQdn`,
job `REV-FunctionFieldArithmeticPartII--GC.5`, 2026-10-17. This session did
not write the blueprint being reviewed.

The review covers the [packet](../packets/FunctionFieldArithmeticPartII--GC.5.json),
[reader](../readmes/FunctionFieldArithmeticPartII--GC.5.md) and
[suggested signatures](../suggested/FunctionFieldArithmeticPartII--GC.5.lean).

| Inventory | Reviewed result |
| --- | --- |
| New target nodes | 5: one definition, one construction, three theorems |
| New definition/construction API entries | 14: eight auxiliary-index entries and six signed-line entries |
| New definition/construction tests | 9: five auxiliary-index tests and four signed-line tests |
| Imported parent targets | 13, with all nine parent construction API entries and nine tests preserved |
| New planets | 1, Divisor tensor line; six total including the five parent planets |
| Baseline declarations | 8 confirmed; none removed or replaced |
| Nodes added or removed by review | 0 |
| Source findings | 4 independently confirmed; none newly alleged |
| Remaining supplier work | 3 gaps and 1 integration request, retained |

## Sources and mathematical checks

I read the published author-hosted copy of Yun–Zhang,
[*Shtukas and the Taylor expansion of L-functions (II)*](https://math.mit.edu/~zyun/GZW_ramified_published.pdf),
Annals of Mathematics 189 (2019), 393–526: Appendix A.1–A.2.2,
printed pp. 514–523, and §6.2.1, printed pp. 496–497. The PDF's SHA-256 is
`700e0b09f2320912b75f5a16968c5aa3f96a0ad74e3ca375aacedec7e85d296c`.
I also inspected the page images of pp. 522–523. The packet now records
this independent reading and the precise published version. No restricted
source was needed. The following are checks of the planned targets, not a
summary of the paper.

- **Auxiliary index.** Appendix A.2.2 and Lemma A.10, pp. 521–522, need
  an effective away divisor crossing a lower bound. The native definition
  uses precisely this condition and residue-degree weights. Its
  nonemptiness theorem assumes a function field and an explicit away place;
  sufficiently large multiples of that place work without a degree-one
  point. Effectivity and nonnegative degree make the sum a common
  enlargement. The zero, forbidden-support, negative-coefficient and
  degree-two tests distinguish these conditions. For the last test,
  `-5 + 4*2 = 3` reaches the bound while `-5 + 3*2 = 1` does not.
- **Signed divisor line.** The integral-divisor tensor line used in A.2.2,
  end of p. 521 and p. 522 before (A.7), extends the coherent effective
  tensor comparison of Lemma A.8, p. 520. At a closed point one uses all
  conjugate stalks with Frobenius permutation descent. Negative coefficients
  require duals. Two presentations `A-C=A'-C'` are compared using
  `A+C'=A'+C` and the imported associativity, symmetry and unit maps;
  these also give the comparison cocycle. All six API entries and four
  tests are sound. In particular, the order-three example detects a lost
  inverse that a quadratic example would miss.
- **Normalized universal property.** The canonical choices and comparison
  cocycle in A.2.2, pp. 521–522, justify this additional API. If
  `q_D : Q_D ≅ P_d`, a compatible family of maps to `M` yields
  `f = f_D₀ ∘ q_D₀⁻¹` for any one admissible `D₀`. The cocycle makes this
  independent of the chosen presentation and proves the claimed bijection.
  The target correctly retains normalization maps in its uniqueness claim;
  a bare rank-one sheaf can still have scalar automorphisms. This argument
  assumes the imported sheaves and their comparisons; it does not establish
  effective lisse descent.
- **Signed character translation.** A.2.2, pp. 521–522, and Proposition
  A.11, pp. 522–523, supply the effective identification and character
  structure. Evaluation at an inverse divisor point identifies its value
  with the dual line. Restricting multiplication along the divisor point
  gives the signed translation map. Restricting associativity and the unit
  identities proves composition and inverse compatibility. The target's
  indices are correct: from degree `-1`, translation by a negative
  degree-two point pulls back the degree `-3` sheaf. Agreement with the
  effective comparison uses the same common high-degree normalization.
- **Whole-space addition pullback.** The root section maps of A.1.4–A.1.5,
  p. 517, commute with forgetting to the root Picard stack. Pulling
  Proposition A.11's multiplication through that square, with the inverse
  image/external-tensor comparison, gives the stated addition map and its
  coherence. Its effective restriction is Lemma A.8's comparison.
  Section 6.2.1, p. 497, uses inverse image on the whole section space;
  zero-global-section stalks remain rank one. The target correctly uses
  `d,e≥0` section spaces and distinguishes the effective empty divisor
  with section 1 from a zero global section. These checks would fail for
  extension by zero from the effective open.

The odd-characteristic, finite-field, smooth/projective/geometrically
connected curve, reduced ramification, prime-to-characteristic coefficient,
unshifted-sheaf and high-degree-bound hypotheses agree with the source.
The input is an arbitrary rank-one local system on the root curve; only
branch inertia is constrained to order dividing two. Geometric Frobenius is
now explicit, agreeing with the parent convention.

## Baseline, dependencies and ownership

At Tau Ceti commit `f790474821cf4256814db967cb154e7af3d0c369`, I read the
statements of all eight cited declarations:

| Module | Declarations and what they supply |
| --- | --- |
| `TauCeti/FieldTheory/FunctionField/Divisor/Basic.lean` | `TauCeti.Divisor`; `TauCeti.Divisor.degree`, `degree_zero`, `degree_add`, `degree_nonneg`, `degree_ofPoint`, `exists_le_degree_add_nsmul_ofPoint` |
| `TauCeti/AlgebraicGeometry/WeilDivisor/Basic.lean` | `TauCeti.AlgebraicGeometry.WeilDivisor.ofPoint` |

These provide the existing Finsupp divisor carrier, coefficientwise order,
residue-degree-weighted additive degree, singleton divisor and unbounded
natural-multiple growth. The growth theorem's `IsFunctionField` hypothesis
is retained. The light definition needs only the stated fields and algebra.
There are no direct Mathlib declaration citations to replace; Mathlib's pin
is `082e2d37e8b0463410cdb532e111cd43d5a66174`. No existing divisor API is
replanned as a new node.

I checked the reviewed FunctionFieldArithmetic FA.0/FA.1 library audit,
read the direct parent suppliers for root Picard objects, root addition and
Abel–Jacobi, symmetric multiplication and coherence, high-degree descent,
and every imported GC.5 target. A comparison of the thirteen imports
against the parent packet confirmed exact equality of their statements,
API lists and tests. The new targets refine that contract rather than
replace it. The cocycle, arbitrary-degree multiplication and character
coherence prerequisites are sufficient for the derived targets, subject to
the recorded geometric supplier leaves.

I read the ordinary supplier statements
`SchemeAndStackFoundations:SF.3/picard-stack-curve`,
`picard-scheme-without-point` and `universal-section-stack`. They provide
ordinary curve/Picard geometry, including the torsor formulation without a
rational point. `GC5-CURVE-COMPARISON` correctly asks for integration with
the upstream closed-point/place dictionary and the parent root objects;
it does not claim that an ordinary Picard target supplies lisse descent.

I checked current upstream read-only at roadmap commit
`0d144d044dacebca17b654695b6f1ad58f159b27` and library commit
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The JacobianChallenge and
AlgebraicVectorBundles readers were read in full, with representative
suggested interfaces; AlgebraicCurves Layer 12A–12E was checked, especially
12A/12D. I searched the current library and the suggested files of all nine
post-snapshot roadmap directories, including OperatorTheory's subdirectories,
for lisse/local-system/root-Picard/character-sheaf interfaces. No actual
root-Picard lisse carrier was located. AlgebraicVectorBundles' coherent
`Scheme.Modules` tensor and dual targets retain their existing owner and
cannot stand in for the coefficient category needed here.

The retained gaps are precise: `GC5-DESCENT` needs effective nonproper
high-degree Abel–Jacobi descent and full faithfulness with the actual tame
stack charts; `GC5-LISSE-OPS` needs actual lisse tensor/dual/inverse-image
operations and coherence; `GC5-LEAN-CARRIERS` needs the geometric types
before typed end signatures can be written. Connected fibres alone do not
discharge descent. These leaves justify retaining **planned** rather than
**closed**, and do not contradict acceptance of a complete planning pass.

## Corrections and source findings

Every review change is listed here:

1. Replaced the nonexistent `A.2.3` in the packet's source-reading record
   and reader with `A.2.2`; pp. 514–523 remain correct. Appendix A.3 starts
   on p. 523. The applicable multiplication result is Proposition A.11.
2. Made geometric Frobenius explicit in the four geometric new-node
   hypothesis lists and the reader's common conventions.
3. Normalized three new test kinds from `computed-value` to `computation`.
4. Repaired the reader's malformed degree-two negative-line formula to
   display the dual of the tensor of both conjugate fibres.
5. Added independent reading receipts for the three source entries and all
   eight pinned baseline declarations, a published `sourceVersions` entry,
   and independent confirmations on all four `sourceIssues`.
6. Added the packet's accepted review object with a verdict for each of its
   five nodes, and updated the reader's review status. The suggested Lean
   file is unchanged: its real-bodied definition and omission ledger
   already satisfy the prescribed shape.

The four inherited source findings were independently confirmed at their
published locators: `EGC5-3`, Lemma A.8 proof, p. 520 (global character
codomain versus branch inertia); `EGC5-4`, Proposition A.11 proof, p. 523
(product Abel–Jacobi checking map); `EGC5-6`, Lemma A.10 proof, p. 522
(suppressed effectiveness qualification on the auxiliary choice); and
`EGC5-7`, Proposition A.11 proof before (A.8)–(A.9), p. 523 (three missing
Picard decorations). Each is harmless for the corrected mathematics, with
its reason recorded individually in the packet. Historical searches for
published corrections remain attributed to the parent review; this review
does not claim a new finding or an exhaustive absence of later corrections.
All source descriptions are in our own words.

## Validation and handoff

- `python3 scripts/check_blueprint.py research/blueprint/packets/FunctionFieldArithmeticPartII--GC.5.json`:
  zero errors and zero warnings.
- `lean-check research/blueprint/suggested/FunctionFieldArithmeticPartII--GC.5.lean`:
  exit 0 at the pinned shared build; thirteen expected `declaration uses
  sorry` warnings and no other warnings or errors. Available memory was
  above 20 GB before elaboration. The file contains one real-bodied
  definition, eight theorem statements and five examples. This verifies
  the native fragment's signatures, not the omitted geometric targets.
- `python3 scripts/check_sorry_data.py research/blueprint/suggested/FunctionFieldArithmeticPartII--GC.5.lean`:
  passed; no admitted data definitions.
- Submission file checks and `git diff --check`: passed.

No further mathematical correction is requested from this part's author.
For assembly, retain all thirteen parent targets, their APIs/tests, the new
signed-line planet and all named supplier leaves. The parent packet's
`choice-comparison` and `choice-cocycle` source locators also mention the
nonexistent `A.2.3`; assembly should cite A.2.2, pp. 521–523, with Proposition
A.11 for the multiplication coherence argument. Those parent files are
outside this review's edit scope. The remaining work is supplier discharge
and later geometric elaboration, not another pass on the native index.
