# Independent review: numerical Picard groups and contraction descent

Job: `REV-DESIGN-AlgebraicModuliForArithmeticGeometryPartII`, issue #3490. Reviewer: Codex, session `codex-91DSZv`, 2026-10-19. The input design was written by a different worker.

**Verdict: accepted as a complete target-level planning pass, with explicit gaps G1–G7.** Every target is represented, every node has an independent verdict, and every cited baseline declaration was checked. None of the six layers is closed. Under PROTOCOL §0, a planned target's prerequisite chain may end in a recorded gap; `complete` denotes the finished pass. It does not certify the missing proof inputs or formalisation.

## Inventory and checks

| Layer | Nodes | Verified | Corrected | Added |
|---|---:|---:|---:|---:|
| NP.0 | 6 | 2 | 4 | 0 |
| NP.1 | 6 | 3 | 3 | 0 |
| NP.2 | 12 | 8 | 4 | 0 |
| NP.3 | 8 | 5 | 3 | 0 |
| NP.4 | 10 | 2 | 7 | 1 |
| NP.5 | 9 | 5 | 4 | 0 |
| Total | 51 | 25 | 25 | 1 |

The input had 50 nodes; the result has 11 definitions, 6 constructions and 34 theorems. The API grows from 102 to 103 items, named tests from 69 to 71, and planets from 27 to 28. All 17 definitions/constructions have at least three discriminating named tests. There are 12 baseline declarations, 18 supplier requests and 7 explicit gaps. All 51 node verdicts are in the packet's `review.checked`; all 11 source findings have independent verdicts.

Validation completed:

- `python3 scripts/check_blueprint.py research/blueprint/packets/AlgebraicModuliForArithmeticGeometryPartII.json`: **0 errors, 0 warnings**, six planned layers, no closed layer; prerequisite graph acyclic.
- `lean-check research/blueprint/suggested/AlgebraicModuliForArithmeticGeometryPartII.lean`: **exit 0**, exactly six warnings that declarations use `sorry`, no other warnings. The 282-line file has real data-definition bodies and no added theory development.
- `git diff --check`, JSON parsing, node/verdict coverage, API/test-name consistency with the reader, and source-finding verdict coverage passed.
- The elliptic example was checked by enumerating its equation over F₇: nine affine points and the point at infinity.

## Baseline and ownership

The pins remain Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. All twelve declaration statements were read at the pins, including the semilocal instance for `CommRing.Pic`. No declaration was removed. Three supply descriptions needed correction:

- `separableClosure.isGalois`, `Mathlib/FieldTheory/IsSepClosed.lean:323`, requires `[Normal F E]`; an arbitrary algebraic extension is insufficient. The contraction-descent proof now chooses a finite normal extension.
- `Module.finrank`, `Mathlib/LinearAlgebra/Dimension/Finrank.lean:62`, is the natural-number truncation of the cardinal rank and is zero at infinite rank. Finite-dimensionality must precede its interpretation as dimension.
- `AlgebraicGeometry.Scheme.Hom.finrank`, `Mathlib/AlgebraicGeometry/Morphisms/FlatRank.lean:87`, is pointwise rank, with the finite locally free specialisation used by the norm. It is not defined only for finite locally free morphisms.

The remaining checked entries are `AlgebraicGeometry.IsProper`, `CommRing.Pic`, `DistribMulAction`, `IsAlgClosure`, `IsSepClosure`, `SimpleGraph`, `irreducibleComponents`, `separableClosure.isPurelyInseparable`, and `TauCeti.AlgebraicGeometry.LineBundleClass`. Their existing hypotheses and monoid/group conventions are retained. In particular, the pinned `LineBundleClass` is only a commutative monoid.

The current upstream checkout, commit `0d144d044dacebca17b654695b6f1ad58f159b27`, and current Tau Ceti, commit `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, were inspected separately. JacobianChallenge and StableReduction READMEs and suggested files were read, together with the relevant AlgebraicVectorBundles contracts and actual current library statements. The reviewed library-coverage audit was also checked. As a result:

- Curve degree is imported from StableReduction J-A2/JacobianChallenge A and `SF.3/vector-bundle-degree`. NP.0 owns its numerical pairing and compatibility, rather than another degree construction. Current Euler-degree declarations and their proper integral/DVR/H¹ restrictions are recorded explicitly.
- General relative Spec belongs to AlgebraicVectorBundles L1A–L1B. NP.2 applies the existing `SF.4/stein-factorization` contract to the finite constants algebra and units sheaf. No second relative-Spec construction is planned.
- The Zariski matrix inequalities already occur in `Matrix/NegSemidef.lean`, with numerical-type consequences in `NumericalType/IntersectionForm.lean`. Two duplicate theorem declarations were removed from the suggested file; the geometric application and a matrix computation remain.

## Corrections by layer

NP.0: corrected the Das–Waldron index formula to the quotient `[L:k]/[K(E):K(C)]` (Lemma 4.1, pp. 12–13). Added the direct prerequisites used by the geometric/closed-fibre characterisations. The closed-point proof uses DVR domination (Stacks 00PH) without assuming finite residue extension. The blow-up counterexample now uses a point on P¹ over a DVR, whose exceptional divisor really is a curve; a point blow-up of P² over a DVR has an exceptional surface.

NP.1: the numerical rank argument is conditional on the exact all-dimensional étale finiteness input G1. The former relative proof used Kleiman 6.3(g) beyond its irreducibility hypothesis: on two disjoint projective lines, O(1) and O(−1) cancel in every total Euler polynomial. The componentwise reduction is G2. Removed the false claim that bigness is generally non-numerical and the unsupported Fujita invocation. The projective nef-and-big criterion is imported from SF.5 and Keel Definition–Lemma 0.0, printed p. 254; its arbitrary proper extension is G3.

NP.2: arbitrary proper Picard representability matches Kleiman 4.18.3, pp. 34–35, but does not follow from a componentwise use of projective representability. Its nonflat-descent proof input and the relative finite-type comparison remain G4. The finite-algebra Brauer proof uses exact finite pushforward on the small étale site, not a blanket fppf exactness assertion. Smoothness of the units Weil restriction permits the étale/fppf comparison (Kleiman Remark 2.11, p. 21); the nilpotent filtration and semilocal Picard instance complete the stated reduction.

NP.3: removed an unread Debarre citation; checked the graph-image rigidity proof directly. Removed the assertion that fibrewise global generation alone implies relative generation without a base-change hypothesis. Contraction descent now first handles the purely inseparable step, uses projectivity descent (Stacks 0BDG), and then takes the Galois tensor product. Averaging over the original extension before the inseparable descent did not produce the claimed intermediate-field point.

NP.4: component maps require the image closure to be a target component. Vertex bijectivity alone does not reflect adjacency for arbitrary morphisms: normalising two meeting lines gives a counterexample. The field-base-change reflection argument is now separate. Replaced the invalid fibrewise intersection scaling by base change of the entire ambient Cartier divisors, and added a characteristic-p multiplicity check. Restricted the geometric exceptional-negativity application to smooth source and geometrically normal target.

Added `NP.4/negative-curve-descent`, marked with this review job's `addedBy`. The tangent space at a negative integral curve is H⁰(O_C(C)) = 0. The locally finitely presented Hilbert algebraic space is therefore étale there, giving a finite separable field of definition. Under constant Num, distinct conjugates would have negative mutual intersection, so the curve descends to k. This replaces both the incomplete fibre-component proof and the inherited q-versus-q² label repair. A reducible geometric fibre has negative components; their descent forces its image point to be closed with residue field k, including when the original geometric point was allowed to lie over a nonclosed point. Labels then follow from full Cartier pullback. Label preservation for a single component is vacuous. The precise proper-Hilbert/tangent supplier extension is G5, not an assertion about the parent's existing projective Hilbert contract.

NP.5: weakened the elliptic counterexample to failure of **exact** lifting; it cannot show failure of every positive power, since finite-field degree-zero classes are torsion. HW23 already uses numerical lifts at the disputed passages. The nef-and-big converse example is now a smooth family of blow-ups at three disjoint sections becoming collinear, so both fibres remain integral. Its proof only uses the projective big criterion. Made the unproved high-dimensional vertical negativity step explicit as G6. Restricted AHK rank to the source's complex projective setting; the relative positive-characteristic extension is G7. Corrected the one-exceptional-divisor rank-drop condition and used projective examples, including the quadric threefold cone with a small projective resolution.

The reader was regenerated from the corrected targets, dependencies, APIs, tests, source findings and gap descriptions. It preserves the mathematical detail and uses the new numbering 4.7 for negative-curve descent. Active unread SGA 6, Lazarsfeld and Debarre citations were removed; no passages from them are reproduced or claimed read.

## Sources and source findings

Public versions and hashes are in the packet. The substantive readings include Schröer §§1–2, pp. 4–9; Kleiman 4.17–4.18.5, pp. 33–35, §6, pp. 52–60, and the stated comparison locators; BMP Lemmas 2.47–2.54, pp. 25–28, §§9.15–9.16, pp. 103–107, and the indicated numerical/descent locators; HW23 pp. 29–34 and its AHK use on p. 12; CT20 Lemma 2.17 through p. 18; Witaszek Propositions 5.3 and 6.6 with Corollary 6.7; Das–Waldron Lemmas 3.6 and 4.1; AHK Lemma 1.6, pp. 3–4; Lipman §§13–14, printed pp. 222–224; and Keel's numerical criteria. EGA IV₃ 8.8.2 and 8.10.5 were read from the maintainer-cleared copy. No book file or extracted passage was copied. Stacks statements were opened at their tags, including the added 0BDG, 0CZX and 0CZV.

E1–E8 are confirmed, with corrections to the proposed repairs of E7–E8. **E9 is rejected**: HW23 arXiv v2 pp. 33–34 already uses numerical equivalence. Its inherited extraction allegation must not be propagated. Two additional misprints are confirmed: E10 reverses the Leray edge arrow in Schröer Lemma 1.4, p. 8; E11 gives the wrong number of hyperplane cuts in AHK Lemma 1.6, p. 4. Total: ten confirmed findings and one rejected finding. All descriptions are paraphrases.

## Decisions for the orchestrator

1. Assign follow-up ownership for G1–G4 and G6–G7. In particular, G1 needs all-dimensional finite-coefficient étale finiteness, not merely a curve theorem or proper base change; G4 needs an accessible proof of nonflat Picard descent.
2. Extend parent R09.2 for G5 with the proper Hilbert algebraic space (Stacks 99.9.4, 0CZX) and tangent formula (99.7.10, 0CZV). Its projective-only contract is insufficient.
3. Register current AlgebraicVectorBundles layers in the atlas. The packet records their existing contract without inventing a baseline declaration or atlas stage ID.
4. Send the rejected HW23 finding and invalid inherited fibre-label scaling repair to their extraction owners. This review changes none of those owners' files.
5. Resolve the retained stable-surface split and seven MMP-item routing proposals before packaging the consumers. The review makes no new roadmap or queue changes.
