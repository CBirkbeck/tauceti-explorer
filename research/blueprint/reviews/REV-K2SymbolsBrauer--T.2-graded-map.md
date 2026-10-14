# Independent review: the Milnor to Quillen graded comparison (K2SymbolsBrauer T.2:graded-map)

**Verdict: accepted, after corrections, as a completed planning pass.**
Reviewer: Claude (Claude Code), session `claude-nII9ug`, job
`REV-K2SymbolsBrauer--T.2-graded-map` (#9267), 14 October 2026. The packet
was written by Codex, session `codex-XACoi9` (#9309, PR #9543); this session
did none of it. The stage stays **planned**, not closed. Nothing is claimed
to be formalised.

Files reviewed and corrected in place:
`research/blueprint/packets/K2SymbolsBrauer--T.2-graded-map.json`,
`research/blueprint/readmes/K2SymbolsBrauer--T.2-graded-map.md` and
`research/blueprint/suggested/K2SymbolsBrauer--T.2-graded-map.lean`.

## Inventory

| Item | Before | After review |
| --- | --- | --- |
| Packet nodes | 1 comparison | 1 comparison (corrected) + 1 theorem (added) |
| Imported targets refined | 2 (graded map; degree three) | 2 (graded map corrected; degree three verified) |
| API items on the imported construction | 11 | 11 (2 restated) |
| Unit tests on the imported construction | 8 | 9 (1 added) |
| Baseline declarations | 12 | 12, all confirmed; none removed |
| Requests | 2 (K.7, H.3) | 3 (K.7 narrowed; H.3 replaced by accepted nodes; AlgebraicTopology stages 5 and 8 added) |
| Gaps | 4 | 2 |
| Source issues | 1 | 2 (1 confirmed, 1 added and confirmed) |
| Planets | 0 new (layer keeps "Milnor to Quillen graded map") | 1 new: "Steinberg symbols as K-theory products" |
| `check_blueprint.py` | 0 errors, 0 warnings | 0 errors, 0 warnings |
| `lean-check` | elaborates | elaborates; 6 `sorry` warnings only |

## Sources checked

Both sources were fetched into scratch space; their SHA-256 sums match the
packet (`a04f53c9…8845` for Weibel's combined author draft of 29 August 2013,
`e1b3377f…264e` for the NUMDAM scan of Loday 1976).

- **Weibel, *The K-book*.** III.5.10–5.10.1 (printed p.225), III.5.12–5.12.2
  (pp.227–228), III.6.1 and 6.1.1 (p.231), III.6.3 (p.234), III.7.1–7.2
  (p.245), IV.1.7–1.7.1 (pp.264–265), IV.1.8–1.10.1 (pp.265–266), Exercises
  IV.1.8, 1.9 and 1.12 (pp.274–275), VI.4.3.2 (p.482), VI.5.2.1 and 5.3
  (p.488). Every locator in the packet points where it says. The tame-symbol
  convention of III.6.3 is the inverse of T.3's, as the reader says; I
  checked that T.3/tame-symbol uses \(\partial\{u,t\}=\bar u\).
- **Loday 1976.** §2.1.1–2.1.12 (pp.331–336), Lemma 2.2.1 (p.336),
  Proposition 2.2.3 with its proof and the following Remark (pp.337–338),
  read on the rendered pages. The packet's description of the matrices
  \(D_a,D'_b\) and of the inverse commutator under Loday's connecting map is
  correct.
- **Weibel's errata.** The live errata link returns HTTP 404. A Wayback
  Machine copy dated 2014-12-02 (corrections to the AMS edition) was read; it
  has no entry for III.5.12 or IV.1.10.

## Baseline

All twelve citations were read at the pins. `TensorAlgebra`, `ι`, `lift`,
`lift_ι_apply` and `hom_ext` are in `Mathlib/LinearAlgebra/TensorAlgebra/Basic.lean`
at Mathlib 082e2d3, with the stated universal property. `RingQuot`,
`mkAlgHom`, `liftAlgHom`, `liftAlgHom_mkAlgHom_apply` and `liftAlgHom_unique`
are in `Mathlib/Algebra/RingQuot.lean`, and the relation is closed under
two-sided multiplication. `TauCeti.SplitK0.finrankEquiv` and
`finrankEquiv_of` are in
`TauCeti/CategoryTheory/GrothendieckGroup/FiniteDimensionalVectorSpace.lean`
with the stated division-ring and `Small.{v}` hypotheses; the file in the
pinned build is byte-identical to Tau Ceti f790474 on GitHub. No citation was
removed or changed.

## Corrections made in place

1. **The product of two unit classes is now a planned theorem.** The degree-two
   target and the Steinberg relation used before descent both rest on the
   value of the product on two unit classes. The packet sent the whole
   computation, sign included, to GeneralAlgebraicKTheory K.7, whose plan
   (K.7/products-from-biexact-functors and
   K.7/unit-multiplication-and-K0-tensor-comparison) contains no classical
   \(K_2\). Added `K2SymbolsBrauer:T.2/unit-loop-product-symbol`
   (`addedBy` this review): for units \(a,b\) of a commutative ring,
   \(\theta_1[a]\cdot\theta_1[b]=\theta_2(\{a,b\}^{\varepsilon})\). The proof
   sketch follows Loday's Proposition 2.2.3 (the product is the plus
   construction of the torus map of \(D_a,D'_b\)), Lemma 2.2.1 (its Hurewicz
   image is the image of the torus fundamental class) and the Schur-multiplier
   route his Remark mentions: naturality of Hopf's formula and the kernel
   identification of the universal central extension send the torus class to
   the commutator of Steinberg lifts, which is Weibel's \(\{a,b\}\) by
   III.5.10–5.10.1. The sign \(\varepsilon\) is defined once, on
   \(\mathbb Z^2\), from the orientation, commutator and Hopf conventions.
2. **The degree-two statement was inconsistent about \(\theta_2\).** It
   normalized \(\theta_2\) by the product formula, while its gap said
   \(\theta_2\) must not be chosen to force that formula. It now reads
   \(\Phi_2=\theta_2^\natural\circ m_F\), with
   \(\theta_2^\natural=\theta_2\circ(x\mapsto x^\varepsilon)\). This holds for
   T.1's comparison whichever sign the conventions give, and it is the
   normalization under which Weibel IV.1.10.1 holds literally. Its direct
   prerequisites now include the product theorem, `T.2/milnor-k-theory` and
   the degree-two presentation `T.2:symbols/field-proof/homogeneous-components`,
   which the generation-by-symbols step uses. Its source locators now point to
   Matsumoto's presentation (III.6.1) and the degree-two identification
   (III.7.1), not only to the product statement.
3. **Requests narrowed or replaced.** The K.7 request now asks only for the
   degree-\((1,1)\) comparison of K.7's biexact product with Loday's
   plus-construction product, through K.2:plus/plus-equals-Q and U.6. The
   H.3 request asked for things the accepted StableHomotopyKTheory packet
   already plans (`H.3/plus-universal-cover`, `H.3/plus-integral-homology`,
   `H.3/plus-construction-functoriality`, `H.3/plus-pi2-natural`), plus a
   compatibility with the classical \(K_2\) symbol that H.3 cannot own. It is
   replaced by citations of those nodes, and the symbol compatibility is now
   the product theorem. Added requests to Tau Ceti AlgebraicTopology stage 5
   (the torus fundamental class as a cross product, and the degree-one
   quotient to \(S^1\wedge S^1\)) and stage 8 (absolute Hurewicz), as the
   accepted StableHomotopyKTheory packet does.
4. **Stale gaps.** `G-graded-quotient` is removed: the accepted T.2:symbols
   packet plans the homogeneous quotient and its degree presentation
   (`homogeneous-components`). `G-Matsumoto` now names what remains after the
   accepted T.2:symbols plan of the infinite-field completeness proof
   (`stable-separation`): its gaps G-finite-classical and G-stable-witness.
   `G-cover-Hurewicz` is retired: while this review was running, the T.1
   follow-up packets were merged (#9547–#9549), and
   `T.1/chosen-k2-comparisons` plans exactly the cover/Hurewicz composite the
   gap asked for. `G-product-symbol` becomes `G-product-model`: only the K.7
   model comparison is open.
5. **Imported graded map.** The degree-two API item and the \(\mathbb Q(t)\)
   sign test now use \(\theta_2^\natural\). The Steinberg relation item cites
   the product theorem and notes that it does not depend on \(\varepsilon\).
   The grading cites the T.2:symbols degree presentation. Added the test
   `rational_degree_four_not_injective`: \(\{-1,-1,-1,-1\}\) is nonzero in
   \(K_4^M(\mathbb Q)\) (III.7.2(c)) but dies in \(K_4(\mathbb Q)\) (Exercise
   IV.1.12(d)). An interface claiming injectivity of \(\Phi\) in every degree
   fails it.
6. **Reader and Lean file.** The reader now matches the corrected packet: a
   new section on the product theorem, the sign, Loday's sign, and the K.7
   request; equation (2) with \(\theta_2^\natural\); a ninth check; and the
   updated dependencies and coverage. The suggested file's list of README-only
   targets names the new theorem. Its declarations are unchanged and still
   elaborate.

## Mathematical points verified without change

- The descent of the tensor-algebra map through `RingQuot.liftAlgHom` needs
  only \(\iota(a)\iota(1-a)=0\). That relation holds for either sign, so the
  orientation matters only for the degree-two equality.
- Graded commutativity forces \(2\,\iota(a)^2=0\) but not \(\iota(a)^2=0\).
  The reader is right not to impose it (\(\{-1,-1\}\neq0\) over \(\mathbb R\)).
- The \(\mathbb Q(t)\) residue test: with T.3's convention,
  \(\partial_0\{2,t\}=2\) and \(\partial_0\{t,2\}=1/2\).
- The degree-three check: \(K_3^M(\mathbb Q)=\mathbb Z/2\) and
  \(K_3(\mathbb Q)=\mathbb Z/48\), with injectivity owned by V.2 (Weibel
  VI.4.3.2, VI.5.2.1).
- The suggested Lean statements are true: the descent theorem (both
  existence and uniqueness, since `mkAlgHom` is surjective), extensionality,
  and the four examples.

## Red-team finding RT-AREA-ktheory-2/20

Handled correctly. `K3BlochGroups:V.2/milnor-to-quillen-degree-three` imports
this stage. `K3BlochGroups:V.2/minus-one-product-surjective` cites
`T.2/graded-map-degree-three`. The packet's link runs from T.2:graded-map to
V.2 only, and V.2 keeps the image, cokernel, exactness and injectivity. No
reverse edge was introduced. My added node depends on nothing in V.2.

## Source issues

- `K2SymbolsBrauer/E-tensor-product-rank`: **confirmed**. Printed p.227 gives
  rank \(m+n\) for \(R^m\otimes R^n\), in the introduction to III.5.12 and in
  the proof of III.5.12.1. The rank is \(mn\), and \(m=n=1\) contradicts the
  source's own remark that \(E=R\). Not in the archived errata list.
- `K2SymbolsBrauer/E-product-sign` (**added**, kind gap, affects nothing).
  Weibel IV.1.10–1.10.1 asserts that the degree-\((1,1)\) product equals the
  classical symbol. It fixes no sign for the identification of \(K_2\) with
  \(\pi_2BGL^+\) (IV.1.7.1). Loday 2.2.3, the result cited, proves agreement
  only up to sign: under its connecting-map identification the product is the
  inverse commutator. The statement is right for a suitable normalization,
  which the added theorem makes explicit.

## Library audit and duplication

The reviewed audit (AUDIT-29) records T.2:graded-map as not built, and its
only duplicate is V.2's degree-three map, which is resolved as above. A search
of the current Tau Ceti library and TauCetiRoadmap found no Milnor K-theory or
higher K-theory products. No packet plans Loday's product computation
(searched the K2SymbolsBrauer, GeneralAlgebraicKTheory, KTheoryLowDegrees and
StableHomotopyKTheory packets, including those merged today), so the added
node duplicates nothing.

## Questions for the orchestrator

1. **Two normalizations of the same comparison.** The T.1 follow-ups merged
   today fix the inherited target `T.1/k2-pi2` twice.
   `T.1/chosen-k2-comparisons` (K2SymbolsBrauer--T.1-2) uses the Hurewicz
   route \(\beta\); `T.1:plus/normalised-comparison` (K2SymbolsBrauer--T.1-plus)
   uses the homotopy-fibre connecting map \(\chi\). Loday's Proposition 2.2.3
   and the Remark after it show that these routes can differ by a sign. Their
   reviews (#9263–#9266 and the T.1:plus review), or the next assembly,
   should state the relation of \(\beta\) and \(\chi\) on the torus class.
   This packet defines \(\varepsilon\) relative to \(\beta\).
2. **K.7 request.** The comparison of the biexact (Q/Waldhausen) product with
   Loday's plus product in degree \((1,1)\) is not stated at the locators read
   here. K.7's owner (GeneralAlgebraicKTheory--K.6, review `needs_changes`)
   should plan it, with a source. `GeneralAlgebraicKTheory:K.2:plus/plus-equals-Q`
   is cited from a packet whose review is also `needs_changes`.
3. **Assembly.** The `importedTargets` refinements (API, tests, additional
   prerequisites) and the new prerequisite `T.2/unit-loop-product-symbol` of
   the graded map must be merged into the T.1 packet's `T.2/graded-map` node
   at the next assembly. The atlas renders only `nodes`.

## Summary

I accept the packet as a completed pass of T.2:graded-map, after
corrections. All sources, locators and the twelve baseline citations were
checked at the pins. The main correction is the new theorem
`T.2/unit-loop-product-symbol`. It plans Loday's product of two unit classes
here, with one explicit torus sign \(\varepsilon\), instead of sending it to
K.7, whose plan has no classical \(K_2\). The degree-two identification now
reads \(\Phi_2=\theta_2^\natural\circ m_F\), which removes a contradiction
about how \(\theta_2\) is normalized. The K.7 request is narrowed to the
degree-\((1,1)\) model comparison. The H.3 request is replaced by accepted H.3
nodes and AlgebraicTopology requests. The stale graded-quotient and
cover/Hurewicz gaps are retired, and the Matsumoto gap now names its residue.
I added a degree-four non-injectivity test and a sign finding against Weibel
IV.1.10, and confirmed the rank misprint in Weibel III.5.12. The reader and
the Lean comment agree with the packet. The Lean file elaborates with only
`sorry` warnings. Two items stay open: the K.7 model comparison, and the
residual T.2:symbols Matsumoto gaps.
