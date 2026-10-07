# Independent review: Geometric Satake, GS3–GS4

**Verdict: needs_changes.** Job `REV-GeometricSatakeAndFusion--GS3`, issue #419; reviewer Codex, session `codex-8h1blQ`, 7 October 2026. This is a completed independent review of `BP-GeometricSatakeAndFusion--GS3`, not a checkpoint. I did not write that blueprint.

The packet and suggested signatures have been corrected within this issue's deliverables. The definitive reader is outside those deliverables and still asserts an unsupported essential-image equality. That contradiction prevents acceptance. Its ten explicit planning gaps and six `planned` coverage entries are honest and are not themselves grounds for rejection.

## Required reader correction

In `research/blueprint/readmes/GeometricSatakeAndFusion--GS3.md`, both the overview at line 327 and the perfect-extension statement at line 580 identify the essential image with the stable idempotent closure of the representation kernels. FS IX.2 p321 constructs the exact relative linear monoidal export using the free stable completion. It does **not** prove full faithfulness or that arbitrary target maps and retracts lift through that functor. The corrected packet asserts only containment in the stable idempotent closure.

This distinction is substantive. For example, base change `Perf(k) → Perf(k[t])` is exact and monoidal. The target cone of multiplication by `t` on the image of the unit belongs to the stable closure of that image, but its cohomology `k[t]/(t)` is not the base change of a perfect complex over the field. Thus the universal extension property alone cannot imply the claimed image equality.

Replace the two equality assertions by the corrected containment statement, or supply a separate fully justified image theorem with its necessary hypotheses. The former is sufficient for the scoped FS export. Also synchronize the reader's collision construction (lines 162–168), enlargement-map API (line 351), uniqueness API (line 597), canonical Frobenius descents in the trace examples, corrected locators, finite-type reductivity request (line 652), and the additional integral-point supplier gap. The reader overview at line 39 already warns correctly about Grassmannians versus quotient Hecke stacks; retain that warning. No reader file was edited by this review.

## Scope, counts and status

| Item | Reviewed result |
|---|---:|
| Nodes | 29: 3 definitions, 6 constructions, 20 theorems |
| Per-node verdicts | 14 verified, 15 corrected, 0 added, 0 unverifiable |
| API items | 47, including one added composition-coherence API |
| Unit tests | 27; three for each of the nine definitions/constructions |
| Planets | 16 |
| Exact-pin baseline declarations | 23, in 17 source modules |
| Stage requests | 16 |
| Named gaps | 10: the original nine plus integral-point supplier refinement |
| Scoped stages | 6 planned, 0 closed |
| Source findings | 7 confirmed: original E1 plus six explicitly identified reuses of existing FS errata |

No mathematical node, stage, owner, or target was added. All implementation statuses remain `unchecked`. Packet `status: complete` describes completion of the planning deliverable; it does not claim closure or formalization. The review object records this review and a verdict for every node.

## Primary-source verification

I independently obtained the five public texts, reproduced every recorded SHA-256, and read the cited statements with their proofs and surrounding hypotheses. The source edition matters: FS here is the 356-page author copy corresponding to arXiv v4; its printed/physical pages agree. The published Astérisque body was not read, and the source findings make no assertion about it.

| Source | Public text and reviewed sections |
|---|---|
| Fargues–Scholze | [Author copy](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf): IV.7 pp164–166; VI introduction pp187–190; VI.6.5–8 pp214–215; VI.7 including standard/costandard, split-fibre exactness and CT; full VI.8–12 pp224–242; IX.2 p321; IX.6–7 pp330–335. Hash begins `9ab9efbd0df2`. |
| Zhu | [Publisher PDF](https://annals.math.princeton.edu/wp-content/uploads/annals-v185-n2-p02-p.pdf): §2.1 pp429–433 and §2.2 pp434–436, rational IC semisimplicity, convolution/semismallness and weight/classical formulas. Printed page = physical +402. Hash begins `5d50b415048f`. |
| Gross | [Author preprint](https://people.math.harvard.edu/~gross/preprints/sat.pdf): §§2–4 pp3–9 and §8 pp15–16. Haar normalization, modulus, triangular/minuscule transform and normalization choices were checked separately. Hash begins `9bd0077b2057`. |
| Prasad–Yu | [Author preprint](https://math.stanford.edu/~conrad/papers/qrg.pdf): introduction pp1–3, Corollary 1.3 and §5.3–5.4 pp11–12. The author numbering differs from the published Corollary 5.2 cited by FS. Hash begins `138d931a21fa`. |
| Deligne–Milne | [2012 revised notes](https://www.math.columbia.edu/~dejong/tannakian/Deligne-Milne-Tannakian-Categories.pdf): pp24–27, Proposition 2.20, Corollary 2.22 and Proposition 2.23. Hash begins `48f8af524908`. |

All 36 node citations were checked against their locators, including the short excerpts. A text check also finds every excerpt after normalizing PDF whitespace and Unicode. It supplements, rather than replaces, reading the statements.

Corrected locators: finite-set maps belong to VI.9 pp226–227 (footnote p227), with fusion coherence in VI.9.4 pp228–229; VI.9.2 is p226; IV.7.3 is pp165–166; Zhu Lemma 2.1 is p430 and Proposition 2.2 is p432; FS VI.11.4 is p238; the canonical pinning/descent argument ends on p239; VI.12.1 occupies pp239–241. The reconstruction excerpt now quotes the actual colimit sentence. Gross's old “irrationalities” excerpt was outside its stated §3 locator; it now uses the square-root wording there and separately locates §8. Gross §4 metadata now correctly identifies Kazhdan–Lusztig polynomials, not the unramified-parameter section.

## Exact-pin baseline audit

Read the actual declaration statements at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Existing worktrees supplied git objects; no repository copy, build or dependency download was made. All 23 references exist at their specified modules. The following describes the checked scope; full module paths remain in `baseline.declarations`.

| Declaration | Exact scope checked |
|---|---|
| `TauCeti.Tannaka.tensorAutFunctor` | Given a bialgebra semiring H over a commutative ring R; tensor automorphisms of scalar extension on finitely generated comodules. H need not be commutative. |
| `TauCeti.Tannaka.pointsFunctorIsoTensorAutFunctor` | Field base and a given commutative Hopf algebra; points versus tensor automorphisms. |
| `TauCeti.Tannaka.reconstructedPoint` | Field k, given commutative Hopf algebra H and commutative k-algebra A; automorphism maps to `WithConv (H →ₐ[k] A)`. |
| `HopfAlgebra` | Bialgebra plus antipode, both convolution inverse identities; commutativity is additional. |
| `Bialgebra` | Compatible algebra and coalgebra structures, not automatic structure on an arbitrary colimit. |
| `TauCeti.AffineGroupSchemeCat` | Affine group objects over the spectrum of a commutative ring. |
| `TauCeti.ReductiveAffineGroupSchemeCat` | Finite-type reductive group schemes over a field, not an integral reductive model. |
| `RootPairing` | Perfect pairing, roots/coroots and reflections; no integral pinned group construction. |
| `CategoryTheory.BraidedCategory` | Natural braiding with both hexagons. |
| `CategoryTheory.SymmetricCategory` | Braiding with double braiding equal to identity. |
| `CategoryTheory.Functor.Braided` | Monoidal functor with braid compatibility. |
| `CategoryTheory.MonoidalCategory` | Tensor/unit, associators/unitors, pentagon and triangle. |
| `CategoryTheory.Functor.Monoidal` | Compatible lax/oplax structures with inverse constraints. |
| `CategoryTheory.LeftRigidCategory` | Chosen left duals of every object. |
| `CategoryTheory.Adjunction` | Unit/counit and triangle identities. |
| `Representation` | Monoid map into linear endomorphisms; no continuous Weil action or finite-projectivity condition. |
| `Module.Projective` | Lifting/splitting property for surjective linear maps. |
| `Module.Flat` | Tensor injectivity for finitely generated submodules and equivalent injective-map criterion. |
| `Monad.HasCoequalizerOfIsSplitPair` | Coequalizers exist for F-split parallel pairs. |
| `Monad.PreservesColimitOfIsSplitPair` | F preserves their coequalizers. |
| `Monad.ReflectsColimitOfIsSplitPair` | F reflects their coequalizers; distinct from preservation. |
| `Limits.HasColimit` | Existence of a colimit cocone; chosen colimit gives only an underlying object. |
| `TauCeti.reductiveAffineGroupSchemeProperty` | Reductive coordinate-Hopf predicate transported to finite-type affine group schemes over a field. |

Two descriptions were sharpened: `tensorAutFunctor` has the more general bialgebra hypothesis, and `reconstructedPoint` requires commutative H and explicitly returns the convolution-wrapped algebra map. Neither constructs the unknown Satake Hopf algebra. No baseline name or module needed replacement.

I read the six scoped entries of the reviewed library audit (AUDIT-21 and library coverage) and the upstream `ReductiveGroups` and `RootSystems` roadmaps. Their abstract/algebraic ingredients remain imports. The packet adds no duplicate Hopf reconstruction, root-pairing class, integral dual-group construction, classical transform or general trace formula.

## Per-node audit

Every statement, hypothesis list, proof step, prerequisite, acceptance item and source match was checked. The suffixes below identify the nodes; the packet's review object retains full IDs.

| Node | Verdict and check |
|---|---|
| `disjoint-leg-locus` | verified: Checked the blockwise condition, internal collisions, arbitrary base change and factorization; numerical prototype is faithful. |
| `disjoint-leg-factorization-and-full-faithfulness` | verified: Checked both full-faithfulness assertions and partial-diagonal codimension argument; VS1 purity adapter remains explicitly requested. |
| `support-parity` | verified: Checked dominance-evenness and the minus sign exactly for two odd components, including its use by trace normalization. |
| `fusion-product-and-sign-rule` | verified: Checked actual proper convolution extension, closure-before-fusion supplier and ordinary target symmetry after parity correction. |
| `finite-set-functoriality-and-constant-terms` | corrected: Corrected the arbitrary-map construction to diagonal pullback and the closed Grassmannian immersion, its source pages and the actual block sum; added expressible composition coherence. |
| `drinfeld-fibre-realization` | corrected: Corrected VI.9.2 to p226; checked IV.7.3 locally constant perfect scope, finite projectivity and the local Weil owner. |
| `symmetric-constant-term` | verified: Checked deg_P shift and symmetric fusion compatibility; normalized Tate/parameter adapter stays an honest gap. |
| `fusion-verdier-duality` | verified: Checked sw*D as internal dual, fibre-dual comparison and the two symmetric involutions using existing GS2 rigidity. |
| `tannakian-left-adjoint` | corrected: Corrected the generator enlargement direction X_W′→X_W and forward dual-fibre transition; checked bounded rather than unbounded adjunction. |
| `relative-tannaka-hypotheses` | corrected: Checked the MC.6 finite-piece conditions and the separate preservation obligation; replaced the broken hyphenated excerpt. |
| `geometric-coordinate-hopf-algebra` | corrected: Checked the dual-fibre coalgebra colimit and MC.6 ownership; corrected the literal excerpt and recorded the existing bialgebra/antipode source slips. |
| `multileg-and-coefficient-reconstruction` | verified: Checked disjoint tensor/coefficient reconstruction and reduction limits; the coefficient/coequalizer adapter remains explicit. |
| `rational-semisimplicity` | corrected: Corrected Zhu pages to include Proposition 2.2 p432; checked geometric rational IC semisimplicity, without arithmetic or integral semisimplicity. |
| `generic-fibre-reductivity` | corrected: Checked finite tensor generation then connectedness then reductivity; corrected the upstream request to its actual finite-type characteristic-zero scope. |
| `torus-and-rank-one-identification` | corrected: Checked torus, PGL₂/SL₂ and diagonalizable component-grading calculations, both rank-one lemmas and corrected source slips. |
| `generic-root-datum` | verified: Checked highest-weight bounds and rank-one Levi comparisons identify the full generic root datum rather than only the torus. |
| `integral-recovery-and-adjoint-reduction` | corrected: Corrected VI.11.4 to p238; checked full Prasad–Yu hypotheses and adjoint reduction at ℓ=2; exposed integral-point supplier refinement. |
| `dual-group-identification` | corrected: Corrected canonical pinning/descent proof pages to pp238–239; checked independence of initial split pinning and Weil equivariance. |
| `normalized-satake-equivalence` | verified: Checked normalized tensor equivalence on finite-projective continuous representations, choice of square root and Frobenius/Tate convention gap. |
| `levi-naturality` | verified: Checked shifted CT and the IX.7.1 positive-power parameter convention; retains the explicit action-convention refinement. |
| `adjoint-isomorphism-naturality` | verified: Checked the exact adjoint-isomorphism condition and corresponding dual map; no unsupported arbitrary group-map naturality. |
| `product-naturality` | corrected: Checked exterior product on pure tensors and general categorical product compatibility; recorded existing IX.6.2 diagram slips. |
| `weil-restriction-naturality` | verified: Checked chosen-embedding inflation/induction and divisor diagram; no strong monoidality of finite-index induction is asserted. |
| `chevalley-involution` | corrected: Corrected source range and Lean adjoint-conjugation signature so no lift of rho(-1) to G is assumed; checked rank-one root-line sign. |
| `enhanced-perfect-satake-extension` | corrected: Corrected unsupported essential-image equality to containment and functor-level restriction for uniqueness. Reader lines 327 and 580 still contradict the corrected packet and must change before acceptance. |
| `normalized-frobenius-function` | corrected: Corrected Gross excerpt/locator, integer half twists and canonical descent in explicit examples; a scaled descent changes the trace. |
| `trace-convolution` | verified: Checked proper finite-model trace/Künneth with vol(K)=1; ordinary trace-model supplier remains requested, not supplied by coherent trace. |
| `trace-constant-term` | verified: Checked δ_B^(1/2)=q^(-rho,lambda), CT shift and geometric Frobenius; nonsplit source adapter remains explicitly unestablished. |
| `classical-satake-comparison` | corrected: Checked split canonical IC character and minuscule scaling; clarified canonical descent, and kept nonsplit comparison as a gap. |

## Closure and ownership

I read the exact imported node statements and compared every use with their hypotheses. The early GS loop/Hecke, Schubert bounds, perversity, hyperbolic localization, integral-family comparison, Satake fibre, convolution diagram and closure/dualizability nodes match their applications. The collision node now explicitly imports the existing loop/Hecke carrier. RF2's exact divisor nodes and VS1's ULA criterion are used with boundedness, eligible torsion coefficients and compactifiable finite-dimensional correspondence hypotheses. The E5 stable, exact, idempotent, symmetric-monoidal, Ind and presentability nodes provide language, not missing geometric theorems.

The four MC.6 relative nodes genuinely construct the unknown coalgebra, multiplication and antipode from the stated relative hypotheses. They are imported before the known-Hopf comparison. The two MC.6 recognition nodes give finite type and connectedness; finite type and connectedness precede use of upstream characteristic-zero reductivity. The request no longer attributes an arbitrary infinite pro-group theorem to that finite-type upstream stage. Highest-weight bounds should similarly be exposed from the existing reductive-group representation theory through RG2.5, not replanned.

All sixteen stage requests were checked against current stage text. A request is not evidence that its stronger contract is already available:

- VS1 still needs the finer IV.7.3 perfect-local-system and partial-diagonal adapter. Upstream ClassFieldTheory owns W_E for the stated nonarchimedean E; no accidental restriction to mixed characteristic is imported. Tate stalk action versus IX.7.1 parameter action remains a named convention gap.
- RG2.3's existing parahoric/congruence scope does not supply general Prasad–Yu. The requested theorem retains the residue-characteristic-two alternative excluding normal SO_(2n+1) subgroups. GS reduces through G_ad, whose dual derived group is simply connected, instead of deleting ℓ=2. RG2.0/RG2.4 also need the precise completed-unramified integral-point/lattice and rank-one-generation contracts; this is the additional tenth gap.
- EDC.7 provides the rational geometric decomposition input. It does not prove integral or arithmetic Weil semisimplicity; Zhu/FS supply the particular parity and Schubert calculation in the outlined GS application.
- LP3's existing prime-to-ℓ solvable Donkin statements and LP4's parameter-stack statements with fundamental-group exclusions do not supply the all-prime relative classifying-stack theorem. The exact all-ℓ≠p requests remain in place, including primes dividing |Q| or dual fundamental-group torsion.
- VS3 and S6 need the specified enhanced/general-coefficient relative-duality adapter. S6's bounded constructible torsion scope alone is insufficient for arbitrary-ring enhanced biduality.
- SF.2 owns integration of the existing ordinary constructible Frobenius trace/model theorem. Its currently named coherent trace node is not that theorem. The geometric/perfection-to-finite-model adapter remains a gap. SR.4 owns the already constructed classical transform; the comparison is downstream and does not supply it. Gross/Zhu establish the split normalization, with nonsplit geometric descent explicitly unestablished here.
- RG2.0a supplies group-scheme Weil restriction, while IX.6.3 supplies the chosen-embedding procedure. Induction is not silently treated as a strong monoidal functor; its conjugate-leg and half-root comparison remains a gap.

The proof order is consistent: GS2 closure/rigidity → GS3 fusion → relative reconstruction → rational recognition/root comparison → integral recovery/canonical pinning → normalized equivalence/naturality → enhanced export and classical comparison. Generic root identification uses rank-one comparisons already proved before integral recovery, not the final dual identification. The classical bridge is never a prerequisite of either integral reconstruction or the independent SR.4 theorem. The scoped dependency graph has no internal cycle. All six targets have matching nodes and coverage entries; unresolved suppliers prevent `closed`, as recorded.

## API, tests, signatures and planets

Reviewed all APIs against their uses and all nine definition/construction test families against plausible wrong implementations. The three disjoint-locus cases distinguish blockwise from pairwise disjointness. Parity cases detect a missing odd/odd sign; fusion tests also require ordinary fibre symmetry. Collision tests distinguish the two 3→2→1 orders, permutations and empty fibres. The new API exposes composition associativity. The block-sum signature now uses the actual maps rather than an unrelated parameter.

Bounded-generator tests distinguish representers from dual coordinate coalgebras. Enlargement now points `X_W′ → X_W`, hence its dual fibre map points forward in the colimit system. Hopf tests distinguish the group-like torus comultiplication and antipode. Normalized-equivalence tests cover unit, torus and odd minuscule PGL₂ with its half twist. Perfect-export tests cover unit, shifts and ℓ=2 with dual fundamental-group torsion; the uniqueness signature now takes an isomorphism of the **restriction functor**, with full exact/linear/monoidal structure still explicitly omitted pending enhanced carriers. Object values alone cannot suffice. The Chevalley signature now uses the adjoint element's conjugation action, avoiding an unjustified lift to the group.

Trace examples now require canonical constant-sheaf/IC Frobenius descent. An arbitrary scaled descent scales the trace; its leading coefficient need not be one. Half-twist functoriality accepts an integer, including negative twists. The minuscule dimension itself remains nonnegative. Normalization checks use geometric Frobenius, q^(-1) on L(1), vol(K)=vol(N(O_E))=1 and δ_B(λ(π))^(1/2)=q^(-⟨ρ,λ⟩).

All 47 API names and 27 named tests occur in the suggested file; the named theorem nodes also have prototypes. The numerical loci/parity/trace formulas have expressible signatures. Imported geometric/continuous/enhanced carriers and their missing conditions remain explicitly omitted, with no fake proposition-valued certificate or implementation claim. Several geometric examples display only the expressible comparison; for example, the three-leg example does not elaborate the enhanced fusion pentagon, and the coalgebra example does not formalize the coordinate identification. The carrier gap identifies these limitations. Ordinary composition coherence is now displayed explicitly. This is a signature plan, not evidence of a theorem for arbitrary category parameters.

All sixteen planets match definition/construction or central named-theorem nodes at their declared layers. The names describe mathematical outputs, with no source-number planets or duplicate ownership. The GS4 enhanced-kernel planet is the single local export owner; HS1 consumes it for the global action.

## Source issues and handed red-team findings

The original source issue `GeometricSatakeAndFusion/E1` is confirmed in the author copy: a torsion component-grading character group defines a diagonalizable group, not generally a torus. For PGL₂ it is μ₂. The packet already uses the corrected diagonalizable formulation. I independently searched the existing source-issue list, the author page and web errata references; no duplicate/correction of this particular slip was found. No claim is made about the unread published body.

Six further entries reuse, rather than rediscover, `PAPER-FARGUES-SCHOLZE-21/E46`, `/E108`, `/E48`, `/E49`, `/E66`, `/E67`: H/A in the antipode argument; premature Hopf versus bialgebra before rigidity; the x/n slip; reversed parabolic containment; and the two IX.6.2 product indices. Each was checked at its page, tagged with the existing finding in `known`, and given this review's confirmation. The Hopf proof now explicitly applies the corrected bialgebra-then-antipode wording.

All four handed `RT-AREA-geomlanglands` findings and their independent verdicts were reread:

| Finding | Outcome here |
|---|---|
| 1: closure before fusion | Confirmed; GS imports the early independent two-leg closure/duality theorem. The packet retains the restructuring proposal rather than proving closure using later fusion. |
| 16: full Prasad–Yu, including ℓ=2 | Confirmed; exact RG2.3 request and GS adjoint reduction retain the needed scope. Existing narrower supplier material is not passed off as sufficient. |
| 17: shared early relative Tannaka | Confirmed; precise MC.6 imports handle reconstruction. The early-versus-period-stage separation remains an upstream scheduling proposal, not a second GS reconstruction theorem. |
| 19: single perfect-export owner | Confirmed; GS4 owns the local extension and HS1 imports it. All-prime LP3/LP4 scope is requested honestly. This audit additionally removes the unsupported image equality from the packet and requires the corresponding reader correction. |

## Validation and remaining work

`python3 scripts/check_blueprint.py research/blueprint/packets/GeometricSatakeAndFusion--GS3.json`: **0 errors, 0 warnings** after correction. Packet `sourceIssues` and `sourceVersions` also pass the validators used by `check_errata.py`. API/test name agreement and internal prerequisite acyclicity pass. `git diff --check` passes.

`lean-check research/blueprint/suggested/GeometricSatakeAndFusion--GS3.lean` was attempted with 107 GB available. It stops immediately at import line 26 because the compiled `TauCeti.Algebra.AlgebraicGroup.Representation.Tannaka.GroupFunctor` object is absent from the shared build. **The file was not successfully compiled or elaborated.** The shared Mathlib pin matches; this does not provide a complete compiled Tau Ceti baseline. No build, update, cache download, language server or substitute Lean project was started.

A revision worker should synchronize the reader with the corrected packet, particularly the two essential-image sentences, and retain the planned coverage and honest supplier gaps. Elaborate the suggested file when the existing compiled baseline becomes available. No new mathematical nodes are needed for this review's corrections. The only unresolved acceptance question is whether the author intended an additional image theorem; the current cited source supplies none, and removing that equality suffices. The detailed ten mathematical refinements remain the packet's explicit planning gaps.
