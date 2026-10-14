# Independent review of torsion cohomology infrastructure

**Verdict: needs_changes.** The packet’s clear mathematical errors have been corrected. Its 38 nodes now have individual verified or corrected verdicts. The remaining blocker is agreement with `research/blueprint/readmes/TorsionCohomologyInfrastructure.md`: that document still contains false statements corrected here, and issue #498 does not authorize editing it. Accepting the packet would promote that contradictory reader alongside it. Reconcile the reader as specified below, then review that reconciliation before acceptance. This is a finished review, not a checkpoint or a request to implement the supplier roadmaps.

Reviewer: Codex, session `codex-DnNNA5`, 2026-10-14. The blueprint author was session `codex-bMkPh3` (PR #9689); this reviewer wrote none of its input work. Claim: [issue #498, bot confirmation](https://github.com/CBirkbeck/tauceti-explorer/issues/498#issuecomment-6167281121).

## Inventory and planning status

| Item | Reviewed result |
| --- | --- |
| Nodes | 38: 2 definitions, 7 constructions, 24 theorems, 1 comparison, 4 applications |
| Node verdicts | 17 verified, 21 corrected; no unverifiable or newly added node |
| Definition/construction API | 37 items, increased from 27 |
| Definition/construction checks | 27, three for each of the nine objects; 9 computations, 9 non-examples, 5 degenerate cases, 4 compatibility checks |
| Planets | 23, all key definitions/constructions/theorems; at most six per stage |
| Baseline declarations | 11 confirmed, none removed |
| Source routing | All 53 assigned Scholze extraction items accounted for, including 75, 118, 122 and 126 |
| Supplier requests/adapters | 17, increased from 15; exact residual-kernel request and existing-upstream infinite-product adapter added |
| Source findings | 18: 17 confirmed, 1 rejected; two added findings |
| Coverage | Five stages planned, zero closed; packet remains a complete target-level pass |

“Planned” is appropriate: every stage target is represented, but the formal/primitive/boundary and determinant supplier extensions remain explicit implementation obligations. No stage is advertised as having a closed proof chain or as formalized. The empty `gaps` list does not erase these requests. No proof was split into a chain of auxiliary nodes merely to enlarge the packet.

## Mathematical corrections

### Local geometry and comparison

The proof of Scholze’s Lemma 2.1.1 (published pp.953–954) contains no localization product with the alleged erroneous index set. The original E1 is rejected. Moreover, on an already localized intersection those extra ratios are units, so the old empty-localization test could not distinguish its alleged error. Its replacement checks the identity restriction and explains this distinction. The actual reference slip on p.954 is recorded as E17: agreement of the reduced sections uses the overlap bound in condition (ii), with the frame from (i).

The integral-ideal construction retains the largest bounded intersection lattice, rather than any lattice with the same generic fibre. Its source locator now includes the end of Lemma 2.1.2’s proof on p.955. The trace input is **Corollary** 3.2.23, pp.994–995, not a theorem at pp.995–997. Lemma 4.3.3’s ordinary ideal-colimit proof extends through p.1028, and Corollary 4.2.2’s vanishing proof through p.1024.

The corrected closed-perfectoid pair and strongly-closed theorem are now cited at their exact Q4 nodes. A request remains only for the almost boundary reduction sequence on their plus-ring kernel, with the required torsion-freeness, naturality and sheaf transport. This does not re-plan the existing quotient theorem. Bhatt–Scholze, *Prisms*, Theorem 7.4/Remark 7.5, pp.55–56, and Scholze, *Étale cohomology of diamonds*, Definition 5.7(ii)/Theorem 5.8, pp.24–25, were checked for E2.

The old period-lattice check incorrectly treated a nonisotropic coordinate plane as proof that its Plücker chart was empty. For genus two, the isotropic plane spanned by `(1,0,0,1)` and `(0,1,1,0)` has both `p₁₃=p₁₂=1`. Thus `Fl₁₃` is nonempty. Its reduction cell has `p³−p` points, whereas an admissible Lagrangian graph cell has `p³`. One obtains the first count by writing its two basis vectors as `(1,a,0,b),(0,c,1,d)` and imposing `bc−ad=1`. An integral symplectic coordinate change would preserve these counts. This proves the chart-orbit problem without the false emptiness argument; use the admissible `2^g` chart cover for the affinoid-perfectoid transport. Direct enumeration at `p=3,5` gives `(27,24)` and `(125,120)` respectively.

The new `constructionOrder` puts `TC.2/boundary-ideal-colimit` immediately after TC.0, before `TC.1/classical-section-approximation`, which consumes it. Later TC.2 comparison/continuity may then consume TC.1. Stable node/stage IDs are retained; the stage labels alone are not a sequential construction order.

### Auxiliary characters and Laurent algebra

The cyclotomic continuation now uses the **cyclotomic Z_ℓ-extension** of F, rather than all ℓ-power roots of unity. It allows ramification at `S_ℓ=S∪{v|ℓ}` during construction and restores S only by two-prime descent. The finite extension contains F and is Galois over F⁺. The residual image is retained: the entire resulting Galois quotient is not asserted to be pro-p.

The cited IHG field-only nilpotent-kernel lemma cannot factor a determinant over a finite Artinian local coefficient ring. The new IHG.1 request gives Chenevier’s continuous residual-kernel factorization precisely: Lemma 3.8, §3.1, p.43 of arXiv:0809.0415v2. After passing to a finite coefficient/group quotient, the faithful Cayley–Hamilton algebra has nilpotent radical and the residual kernel maps to the finite p-group `1+Rad(B)`. Apply this on each local coefficient factor before the profinite passage. Tau Ceti’s existing group homomorphism factorization is reused; it does not replace this determinant argument.

A Laurent polynomial coefficient ring is generally not compact. Its law is therefore descended **algebraically** through the subring containing the characteristic coefficients, using IHG.0’s coefficient-subring theorem and Amitsur’s formula (Chenevier Corollary 1.14, p.14). Character-evaluation quotients supply the ambient product law; finite coefficient extension, the common sum errors, coefficient-ideal contraction and subsequent descent to the original Hecke image are explicit. Compact gluing is reserved for profinite coefficient rings.

The symplectic rank-`2n+1` law retains `(1−X)` at weight zero. No division of a determinant law by this polynomial is presumed. Its rank-n weight −1 determinant is selected later by the weighted extraction theorem.

The separation theorem retains its unit hypotheses. A new diagnostic over `Z/9` takes `u=2`, `P=1+3X`, `Q=1`, `P′=1`, `Q′=1+3X`. The two ordinary products agree, both twisted products are `1+6X`, and `P≠P′`, although `1−u²=6≠0`. This catches replacement of invertibility by mere nonvanishing.

### Ordinary, integral and local Hecke outputs

Finite torsion assembly now uses `B_i=im(H^i→H^i_∂)` and the exact sequence `0→H!^i→H^i→B_i→0`. The faithful action image on B_i is a quotient of the full boundary action image. Consequently `A→A!×A_B` is well defined and has square-zero kernel: a kernel operator sends the middle module into H! and kills H!. The former map to the action ring of *all* boundary cohomology was unjustified by the annihilator containment. Boundary determinant base change and the filtered-module error bound are now stated before gluing.

Kernel containment alone does not produce a surjection from the closed simultaneous action ring B onto the integral Hecke image. The revised proof first uses UCT’s injections `H/p^m→H^i(M/p^m)` to extend compatible continuous actions to `H=lim H/p^m`. The finite Z_p-module image inside `End(H)` is compact and closed, and density then gives surjectivity.

Independently chosen finite-exponent error ideals need not form an inverse system. Set `J=B∩∏I_m`. The existing current-upstream IHG Layer 5 theorem detects the common nilpotence exponent in an arbitrary jointly injective family. The older atlas node states only a finite family; the new adapter request explicitly imports the stronger existing theorem without re-planning it. B/J is compact Hausdorff and embeds in the product of finite quotients, so compact determinant gluing applies through their common characteristic coefficients. Push this law and J to the integral image. There is no assumed canonical map between individual finite action rings.

Absolute irreducibility reconstructs the local representation over **Â/Î**, where `Î^N=0`, not over Â. It supplies no lift through the error ideal. A torsion eigensystem need not occur in the integral action image; a local integral completion requires that support hypothesis, while a torsion-only system uses the closed simultaneous torsion ring. The local coefficient map, coefficient-field identification, fixed residual basis and strict-conjugacy uniqueness are explicit.

## Sources and source-issue verdicts

The packet records URLs, read dates and SHA256s of the exact versions read: Scholze’s [published Annals paper](https://annals.math.princeton.edu/wp-content/uploads/annals-v182-n3-p03-p.pdf), the [Caraiani–Le Hung author PDF](https://www.ma.imperial.ac.uk/~acaraian/papers/complexconjugation.pdf), and [Chenevier v2](https://arxiv.org/pdf/0809.0415v2). The cited Scholze statements and proof steps were read at their printed pages; CLH §3, pp.6–9, and the two added Chenevier inputs were read directly. All source matches now identify the actual input, specialization or deduction rather than repeating a generic sentence. All retained corrections are stated in original wording.

| Findings | Independent result |
| --- | --- |
| E1 | Rejected localization allegation; preserve its history but do not use it as an erratum |
| E2 | Confirmed later closed-quotient/plus-ring correction |
| E3 | Confirmed chart-orbit issue, with the nonempty-chart witness and corrected reach |
| E4–E5 | Confirmed minimum-codimension choice and `l₀=0,q₀=d`, p.1024 |
| E6 | Confirmed segment endpoint `(ℓ_i−1)/2` and GL rank `n_i`, p.1033 |
| E7 | Confirmed discrete-series range for the first weight, p.1038 |
| E8 | Confirmed positive top sign in both unitary displays, pp.1042–1043 |
| E9–E10 | Confirmed stabilized auxiliary ideal and common sum-ideal quotient |
| E11–E13 | Confirmed first-order indexing, expansion in T and reversed noncommutative inverse order |
| E14 | Confirmed local representation/coefficient symbol, p.1060 |
| E15–E16 | Confirmed UCT kernel direction and products in simultaneous actions |
| E17, added | Confirmed reference to overlap condition (ii), p.954; intended result unaffected |
| E18, added | Confirmed neat-level counterexample to the author-version exterior-power identification in CLH Remark 3.1, p.8 |

For E18 take `GL₃/Q`, the upper unipotent group, principal level 3 and `p=5`. The neat nilmanifold lattice has coordinates in `3Z`, with commutator subgroup in its central `9Z`. Its abelianization is `Z²⊕Z/3`, so its H¹ over F₅ has dimension two; the asserted exterior first power of the rank-three unipotent adjoint space has dimension three. Actual nilmanifold cochains and Hecke/Levi actions remain the ALS supplier contract. An exterior-power replacement requires an additional comparison with appropriate hypotheses. This does not negate the geometric boundary stratification or Leray spectral sequence.

This E18 finding is scoped to the hashed author PDF. The Cambridge record and a direct publisher-PDF endpoint returned HTML/access material, rather than the journal PDF. The author records, arXiv version history and journal corrigendum search yielded no correction. No journal-text collation is claimed. The other newly recorded finding E17 was already known as PAPER-SCHOLZE-15/E13; it replaces the incorrect E1 allegation rather than being presented as a new discovery.

## Baseline and ownership

Every baseline declaration was opened at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` or Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369` and its hypotheses/conventions checked. All eleven remain valid:

| Declaration | What it actually supplies |
| --- | --- |
| `PolynomialLaw` | Natural maps on tensor base changes; homogeneity/multiplicativity still belong to IHG |
| `Polynomial.coeff_mul` | Antidiagonal product coefficient sum |
| `Polynomial.compRingHom` | Polynomial composition as a ring homomorphism |
| `Polynomial.eval₂RingHom` | Evaluation after coefficient change |
| `Polynomial.mul_comp` | Multiplication preserved by composition |
| `Polynomial.reverse` | Degree-dependent coefficient reflection, not automatic constant-one normalization |
| `Matrix.charpolyRev` | `det(1−XM)` on the existing matrix carrier |
| `Matrix.reverse_charpoly` | Reversal of the monic characteristic equals charpolyRev |
| `Matrix.charpoly_map` | Characteristic polynomial commutes with coefficient homomorphisms |
| `TauCeti.maximalProPQuotient.lift` | Continuous homomorphism into a compact, totally disconnected pro-p group factors through its quotient; it is not determinant deformation factorization |
| `TauCeti.AlgebraicGeometry.Scheme.Modules.cohomologyδ` | Connecting map for a short exact sequence of scheme modules, with degree increment one; it does not supply formal/perfectoid site carriers |

The reviewed library audit has no TC stage record; nearby ALS records are overlap evidence, not a substitute audit. Current read-only Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` and roadmap main `0d144d044dacebca17b654695b6f1ad58f159b27` were inspected. The current IHG and AdicSpaces reader documents supplied nearby density/ownership checks. The nine newer roadmaps and four Completed roadmaps were screened for competing targets; existing bundles, pro-p quotients, polynomial laws and interpolation remain imports. No upstream repository was edited and no Lake command ran there.

Every directly cited concrete supplier statement and every stage request was checked. The own-node graph has 58 edges, with no cycle; the announced construction order respects each. Recursive traversal through the concrete supplier-node graph reaches 2,966 nodes and finds no cycle. This traversal does not certify proofs of those supplier nodes; stage/library references remain planning boundaries. The six early TC.3 algebra nodes have no reachable TC.2/AG2 dependency.

The five assigned red-team findings are addressed in both the packet’s scope and the reader’s existing conventions: TC owns Scholze 4.2 comparison, CC supplies its carrier; AG2.3/AG2.7 supply regular constituents beyond restricted AG2.2; unconditional CM retains the imaginary-quadratic and rational-S conditions and ET.7a unitary-similitude input; TC.3 early algebra avoids AG2/interpolation duplication; singular proper constructible primitive comparison comes from the early P8 input, with reduction/trace naturality requested separately and no logarithmic theorem inferred. The reader discrepancies found here are additional to those five already incorporated fixes.

## Required reader reconciliation before acceptance

The orchestrator should authorize and route edits to `research/blueprint/readmes/TorsionCohomologyInfrastructure.md`. This review changes only the issue’s three deliverables and its own handoff. Apply the following from the corrected packet, preserving its exact hypotheses, maps and proof distinctions:

1. Put the early ideal-colimit target before TC.1 approximation in the build instructions; retain the independent early TC.3 algebra substage.
2. At TC.0 section-model transport, replace the empty-localization test and the E1 acceptance explanation. Record rejected E1 and actual E17. Add the fixed-glue universal property.
3. At TC.0 integral-ideal and boundary-support targets, add the maximal-lattice characterization, exact Q4 node imports and reduced-sequence extension request. Repair the trace/ideal-colimit/vanishing locators listed above.
4. At TC.1 period lattices, replace the false empty `Fl₁₃` example by the explicit isotropic witness and chart-count distinction. Add frame-change and refinement-composition compatibility; make the lost-digit example explicit.
5. Synchronize the new initial-topology criterion, factor-swap API, rank-one unit-character wording, formal-unit naturality/uniqueness, normalized reciprocal relation and character-cup retraction. Keep three discriminatory checks per object. Add the `Z/9` nonunit separation diagnostic.
6. At TC.3 cyclotomic continuation, replace the roots-of-unity tower by the Z_ℓ-extension and S_ℓ; replace the field-only kernel prerequisite by the exact IHG.1 residual-kernel request and Chenevier source.
7. At TC.3 Laurent realization, replace compact gluing by coefficient-subring descent; retain `(1−X)` at weight zero until rank-n extraction; state coefficient extension and ideal contraction.
8. At TC.4 boundary induction, retain actual nilmanifold complexes and explain the author-version E18 obstruction to an unconditional exterior formula.
9. At finite torsion assembly, use B_i and its faithful action image A_B, not all boundary cohomology. Include the exact two-step filtration and resulting square-zero bound.
10. At integral transport, supply the continuous action extension and closed-image surjectivity argument; use `J=B∩∏I_m` and the existing arbitrary-family bound. Remove the assertion that compact gluing produces compatible individual I_m.
11. At residual/local specialization, replace the full integral local codomain by Â/Î, retain nilpotence, and require the chosen eigensystem to occur in the integral image before localizing it. Torsion-only systems use the simultaneous torsion ring.
12. Synchronize the request count/contracts, node-specific source matches, corrected locators and all 18 independent source verdicts. Correct the fictitious “Corollary 5.4.5 proof” locator to Corollary 5.4.2/Remark 5.4.5. Keep version-qualified source metadata and no verbatim source passages.

There is no request to edit other supplier packets or current upstream roadmaps in this review. After this reconciliation, acceptance concerns consistency of the planned targets, not completion of their listed supplier implementations.

## Validation

`lean-check research/blueprint/suggested/TorsionCohomologyInfrastructure.lean` exited zero at the pinned shared build. The file is 122 lines and has one light real-bodied definition; its 13 warnings all concern proof placeholders. The two added statements are factor-swap compatibility and the `Z/9` diagnostic. Heavy geometry and determinant laws stay in the reader targets; the suggested file develops neither substitute carriers nor auxiliary theory. Elaboration verifies statement types, not their mathematical proofs.

`python3 scripts/check_blueprint.py research/blueprint/packets/TorsionCohomologyInfrastructure.json --json` reports zero errors and zero warnings. No declaration index was supplied to this checker, so its baseline-name validation is supplemented by the pinned source inspection recorded above. The suggested-data and submission-path checks are recorded in the handoff after final validation.
