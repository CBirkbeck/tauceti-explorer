# Independent review: exotic monoidal structures and abstract automorphicity

**Accepted as a complete target-level planning pass, with three recorded gaps and seventeen supplier requests.** No layer is closed and no implementation is claimed. Codex, session `codex-ZONWQO`, reviewed the design independently for issue #3528 on 19 October 2026. The original design was by a different session, `codex-zDZPuM`.

## Scope and counts

The review covers the roadmap definition, packet, reader and suggested Lean file. The packet's `review.checked` records a verdict and mathematical note for every node.

| Item | Result |
|---|---:|
| Nodes before / after | 57 / 58 |
| Existing nodes verified without alteration | 43 |
| Existing nodes corrected | 14 |
| Nodes added | 1 |
| Unverifiable nodes | 0 |
| Definition / construction nodes | 13 / 21 |
| Definition/construction API items reported by validator | 142 |
| Unit tests | 103 |
| Planets | 54 |
| Baseline declarations confirmed / removed | 6 / 0 |
| Stages planned / closed | 12 / 0 |
| Explicit gaps before / after | 4 / 3 |
| Supplier requests | 17 |
| Source issues confirmed / rejected | 11 / 2 |
| Routed source items covered | 47 |

The three remaining gaps are **G2**, the presentable linear category tensor and self-duality infrastructure; **G3**, the normalized adelic spherical counit and reference transports; and **G4**, the spin-section and weighted inverse-transpose product calculations. Each has exact affected nodes. Their presence is consistent with `complete`: every stage target is represented and its prerequisite chain ends in an existing declaration, an external node, a precise requested stage, or a recorded gap. It is not a closure claim.

## Sources and principal corrections

I read the public versions listed in the packet, at all node locators, including the proofs used by the plan. Their downloaded PDF hashes agree with the recorded hashes. The sources are [Dor23](https://doi.org/10.1017/fmp.2023.18), [Dor21 v1](https://arxiv.org/abs/2102.11820v1), [GH11 v1](https://arxiv.org/abs/1108.0351v1) and [Dor20Z v1](https://arxiv.org/abs/2012.03068v1). The paper metadata, arXiv records and title/author correction searches disclosed no linked correction. The repository contains mathematical paraphrases and locators, without source passages.

1. **Singular-stratum Tor: G1 discharged, E11 rejected.** In Dor23 Lemma 2.20, pp. 16–17, the zero stratum is Q=S(F×). Each outer action factors through determinant. The hypotheses imply V_SL₂=Ṽ_SL₂=0. In the two-group spectral sequence, Tor⁰(V,Q)=0 kills E²_0,0 and E²_1,0. The residual outer SL₂ also acts trivially on Tor¹(V,Q): it acts by the identity on Q, and derived tensor is functorial. Therefore balancing with Ṽ kills E²_0,1. This is the missing explanation, not a missing flatness assumption. The node now gives the whole argument; G1 is removed from the gaps and coverage lists. The SR.0 request still supplies the actual smooth spectral sequence and its residual action.

2. **Whittaker-unit centre made a theorem.** The firm-module definition previously contained underlineEnd(Iunit)=Z as though it followed from the definition. The added `EX.3/whittaker-centre` isolates the key calculation used in Dor23 Claim 3.32, p. 29, with the finite-support convention of Remark 3.29, p. 27. For f∈End(Iunit), conjugating f⊛idX by the left unitor gives a central natural transformation. Unit symmetry shows that evaluating it back at Iunit returns f. Central balance from Lemma 2.17, pp. 14–15, proves injectivity of evaluation. This proof uses the preceding weak tensor data and needs no associator. Blockwise restriction distinguishes the product of centres from the finite-support direct sum. Enhanced Whittaker adjunction now cites this theorem directly; the API item and item-023 routing are moved with it.

3. **Weyl lifting repaired, E13 added.** Dor21 Lemma C.4.9 and Remark C.4.10, pp. 51–52, select a prime in an arbitrary ray class. Principal ideles and compact unit level preserve degree, whereas primes have positive degree. The plan's earlier reference to degree compatibility did not fix degree-zero, negative-degree, or small-positive-degree classes.

   At a fixed ray level, conjugate normalized Weyl symmetry by |a/d|^(1/2). Write D(u,v)=[u]⊗[v] and S(u,v)=D(u,v)+D(v,u) in the resulting coset convolution algebra. The periodization image of separate-local invariants is a subalgebra containing all diagonals D(z,z) and symmetric generators whose ratio has a prime representative. For z of sufficiently large positive degree, the three classes z, uz/v and uz²/v have prime representatives. Then

   S(uz,v)S(1,z)=D(z,z)S(u,v)+S(uz²,v).

   Multiplication by D(z⁻¹,z⁻¹) recovers S(u,v). This handles every original degree; diagonals require division by 2 over ℂ. The proof records Haar normalization and finite rational stabilizers. Its exact added inputs are FA.4/ray-class-and-generalized-picard and FA.4/global-abelian-existence; the already cited degree-sensitive FA.5 Chebotarev input gives the uniform large-degree bound over the finite degree-zero classes. Component decomposition uses this repair, and finite-length restriction now lists Weyl lifting directly.

4. **Other proof and locator corrections.** Degeneracy uses left Hom/Ext orthogonality, as in Dor23 Definitions 3.22–3.23, p. 25. Generic idempotent algebras now directly cite the Kirillov spectral theorem they use. Source locators now include Remark 2.22, p. 17, for middle generation; Remark 3.17, p. 23, for the trace formula; Construction 4.15, p. 45, for the Poincaré formula; and Remark 4.30, p. 49, for the abstract automorphic factorization criterion.

5. **Unit tests strengthened.** Two weak-symmetry tests now use an arbitrary nonzero scalar rescaling of the vector-space unitor and check the functor's unit comparison explicitly. The determinant-ideal test now uses a compact nonnegative quotient function with nonzero fibre integral; pulling back a determinant function can fail compact quotient support. Its third test specifies a noncuspidal element with nonzero constant term. The number of tests is unchanged, and every definition/construction retains at least three. The reader's layer Checks also test the Tor residual action and the repaired degree cases.

All twelve original source reports were independently adjudicated in `sourceIssues.review`. E1 is a missing ambient cube on **p. 14**, rather than the reported repeated-letter error on p. 13. E5 is the adjective attached to St inside the extension sentence; its quotient is Steinberg and its subrepresentation is trivial. E3's locator is the pairing following Construction 4.15. E6's alleged heading typo is absent from the version of record and is rejected. E11 is rejected by the Tor argument above. E2–E4 and E7–E10/E12 are confirmed with precise reasons; E7/E12 are proof debts, not counterexamples to the source theorems. E8 also has a concrete noncompact-character-kernel check using t⁻ⁿ, n≥2, for the residue character on F_q((t)).

## Baseline, suppliers and ownership

I read all six cited declarations, with surrounding assumptions, in the source files at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`. None needs replacement:

- `Matrix.det_fin_two` and `Matrix.trace` provide the stated polynomial and finite-diagonal calculations.
- `Rep.coinvariantsTensor` provides algebraic diagonal coinvariants only; smooth residual actions and smooth Tor remain supplier inputs.
- `CategoryTheory.SymmetricCategory` presupposes a braided monoidal category and its associator. It does not construct the exotic associator.
- `CategoryTheory.CommMon` and `CategoryTheory.Mod` provide algebra/module-object carriers after the monoidal category and its action exist.

The recorded Tau Ceti pin remains `f790474821cf4256814db967cb154e7af3d0c369`. I also checked the supplied read-only current roadmaps at `0d144d044dacebca17b654695b6f1ad58f159b27` and current Tau Ceti at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. I read AlgebraicVectorBundles and the completed RestrictedProducts reader documents, checked their relevant suggested signatures, and checked current smooth-representation ownership. The nine roadmap additions named by WORKERS were searched in their actual Suggested files, including OperatorTheory's eight parts. General vector bundles, topological restricted products, smooth categories, Hecke modules, induction and Bernstein theory remain with their current owners. Unrelated D₄ triality in the library is not the GL₂ kernel here.

There is no audit entry for this new EX roadmap, nor an SR entry in `data/library-coverage.json`. I read the relevant existing AL, GL₂, MP and FA audit entries and checked their overlap warnings against current ownership. No audited existing declaration has been turned into a duplicate generic target. All external node contracts and seventeen residual stage requests were checked for field scope, coefficients and normalization. In particular, ordinary Satake does not supply the twisted spherical centre, and number-field metaplectic stages do not supply the global function-field extension. The two exact FA.4 imports add no redundant stage request. The Part II routes remain explicit rather than inventing unassigned stage ids.

The roadmap stage descriptions, reader, routing table and Lean subset count agree with the corrected packet. The only Lean edit is the target-count comment; adding heavy smooth carriers would violate the required signature-only shape.

## Validation and durable handoff

- `python3 scripts/check_blueprint.py research/blueprint/packets/ExoticMonoidalStructuresAndAbstractAutomorphicity.json`: **0 errors, 0 warnings**.
- `lean-check research/blueprint/suggested/ExoticMonoidalStructuresAndAbstractAutomorphicity.lean`: **exit 0**, nine proof-placeholder warnings and no other warnings or errors, at the pinned Mathlib. Available memory was 81 GiB before compilation. No language server or library build was started.
- Reader consistency checks: all 58 statements, all API names and tests, all internal anchors, every stage statement, every node review verdict and every source-issue verdict agree.
- `git diff --check` and the intake file checks passed. Only the five issue deliverables are changed.

This report is the durable handoff within the issue's permitted paths. No review work remains. Follow-up work is the three named gaps and the seventeen precise supplier requests; resume from those entries rather than reinstating G1. The orchestrator must assign the generic G2 infrastructure once, and replace the function-field metaplectic and parahoric-centre request destinations when those Part II stage ids are assigned. The source proofs must retain the large-degree repair for Weyl lifting and its FA.4 prerequisites. No edits were made to upstream roadmaps or their library, and no second job was claimed.
