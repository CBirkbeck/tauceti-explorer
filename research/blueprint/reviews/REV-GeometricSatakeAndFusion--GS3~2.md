# Independent review: Geometric Satake GS3/GS4, revision 2

**Accepted as a complete target-level planning pass.** All six stages are planned;
none is closed. Twelve supplier/carrier gaps remain explicit. Acceptance verifies
the plan and its boundaries, not completion of its mathematics or Lean implementation.

Job: `REV-GeometricSatakeAndFusion--GS3~2` · Issue: #7052 · Reviewer: Codex,
session `codex-5R9YRv` · Date: 2026-10-08.
This session wrote neither planning round nor the preceding review.

## Counts and scope

| Item | Result |
|---|---:|
| Nodes | 32: 3 definitions, 6 constructions, 22 theorems, 1 comparison |
| Per-node verdicts | 27 verified, 5 corrected, 0 added, 0 unverifiable |
| Baseline declarations | 23 confirmed; 0 added, removed or replaced |
| API items / unit tests | 47 / 27; all nine definitions/constructions have three tests |
| Planets | 16; at most six in any layer |
| Supplier requests / gaps | 21 / 12 |
| Source issues | 11 independently confirmed; 0 new findings added |
| Coverage | 6 planned, 0 closed; packet status complete |

Scope is GS3, GS3:fusion, GS4, GS4:classical-Satake-comparison,
GS4:integral-dual-group and GS4:rational-reductivity. The aggregate stages have
the corresponding target nodes and precise remaining lists. The node budget is
not exhausted; every in-scope target has a target-level route ending in an
import, a precise request or a named gap, as PROTOCOL §0 permits.

## Corrections and preceding review

The preceding review rejected the reader's equality between the perfect export's
essential image and its stable idempotent closure. The revision removes that
equality from both occurrences and retains only containment. FS IX.2 p321 supplies
the extension; it does not supply the extra image theorem. The reader also agrees
with the earlier corrections to collision-diagonal pullback and the Grassmannian
immersion, generator enlargement `X_W′→X_W`, forward dual-fibre transitions,
functor-level coherent restriction data for uniqueness, canonical Frobenius descent
in trace examples, and finite type/connectedness before rational reductivity.

This review makes the following further corrections in the permitted files.

1. IV.7.3 is a **Proposition**; VI.9.5 begins on p229; DM 2.22 is a
   **Corollary**; the generic root-datum argument begins on FS p237 and continues
   on p238. These four locators are synchronized in the reader.
2. The characteristic-two rank-one proof previously cited the rational convolution
   supplier as if it gave a modular Hom calculation. Replace that direct
   prerequisite by a precise GS2:correspondences request for the smooth iterated
   minuscule P¹ convolution, semismallness, proper-duality Hom identification,
   coefficient-independent top-cycle basis and one-leg comparison. Keep the
   existing rank-one gap; the repair is proposed, not completed.
3. For the tilting calculation, use the Steinberg-square description and explicitly
   request the Frobenius-kernel irreducibility and good-filtration contracts from
   LP3, instead of treating the unlocated injective-hull assertion as supplied.
   Add the public Doty–Henke source, its exact read locators and PDF hash.
4. E8 confirms the false subgroup lemma with its counterexample, without claiming
   that this independently proves the integral Satake theorem. E6 paraphrases the
   product diagram in our own words. Every source issue now carries this review's
   verdict and reason; all baseline entries record the independent exact-pin read.
5. Remove process history and the unsupported successful-elaboration inference
   from the reader. Its last paragraph records the direct import failure and the
   omitted geometric conditions. The suggested Lean signatures are unchanged;
   the rank-one comment now identifies the missing suppliers.

No mathematical node is added or removed. The rational Witt comparison and
equivalence added by the revision have the correct restricted base and transported
monoidal structure. Zhu's Gelfand construction and larger algebraically closed
base fields remain the precise Part II boundary, rather than being silently equated
with the fusion construction.

## Source check and characteristic-two repair

The primary PDFs were read at the packet's locators and their hashes independently
reproduced. All mathematical descriptions are in our own words.

| Source | Edition and locators used |
|---|---|
| [Fargues–Scholze](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf) | 356-page author copy matching arXiv v4; Remark I.2.14 p17; IV.7 pp164–166; VI introduction pp187–190; VI.6.5–VI.7.13 pp214–224; VI.8–VI.12 pp224–242; IX.2 p321; IX.6–IX.7 pp330–335 |
| [Zhu](https://annals.math.princeton.edu/wp-content/uploads/annals-v185-n2-p02-p.pdf) | Annals 185 (2017), printed pp403–492; §0.2 pp407–409; §0.5 pp411–412; §2.1 pp429–433; §2.2 pp433–436; statements in §§2.3–2.4 pp440–444; §2.5 pp454–455 |
| [Gross](https://people.math.harvard.edu/~gross/preprints/sat.pdf) | Author preprint; §§2–4 pp3–9; §8 pp15–16 |
| [Prasad–Yu](https://math.stanford.edu/~conrad/papers/qrg.pdf) | Author preprint, Corollary 1.3 p2 and §5.4 p12; numbering differs from published Corollary 5.2 cited by FS |
| [Deligne–Milne](https://www.math.columbia.edu/~dejong/tannakian/Deligne-Milne-Tannakian-Categories.pdf) | 2012 notes; Proposition 2.20, Corollary 2.22, Proposition 2.23, pp24–27 |
| [Doty–Henke](https://arxiv.org/pdf/math/0205186) | arXiv:math/0205186v1; Lemmas 1.1 and 1.4 pp3–4; §5 Steinberg-square calculation p18 |

E8 is substantive. Over an algebraically closed field of characteristic two,
`N(T)=T⋊C₂` is proper in SL₂. Nonzero T-weights form two-element orbits `{n,−n}`,
giving one simple of highest weight n for every n>0. A weight-zero simple factors
through C₂ and is trivial in characteristic two. Thus highest weights 0,1,2,…
occur once each, exactly as the lemma requires. DM Corollary 2.22 assumes
characteristic zero and cannot justify the printed connectedness step.

The proposed replacement has a sound representation-theoretic route with explicit
supplier obligations. Put `n=6·2^a−2`. The tilting factorization gives
`T(n)=A⊗T(4)^[a]`, where `A=T(2^(a+1)−2)=St_a⊗St_a` for a≥1.
Self-duality and simplicity of St_a on the Frobenius kernel G_a give
`A^G_a=End_G_a(St_a)=k`, with trivial conjugation action. For a=0 use A=k.
Therefore invariants under the Frobenius preimage of N(T) reduce to
`T(4)^N(T)`. Its zero-weight space has dimension two and an involution has a
nonzero fixed vector in characteristic two. Its good filtration has sections
∇(4), ∇(2), so its SL₂-invariants vanish. T(n) is the highest-weight summand
of the tilting tensor power V^⊗n, which would consequently have too many
invariants. LP3 must supply the kernel and good-filtration facts at this scope.

To contradict those extra invariants geometrically, GS2 must identify
`Hom(1,B₁^⋆n)` with top Borel–Moore homology of the base-point convolution
fibre. A smooth n-dimensional source and the semismall bound dim≤n/2 permit
proper duality to give the degree-n group, up to Tate twist. A free top-cycle
basis would make its dimension independent of coefficients. Zhu Proposition 2.3
and Remark 2.4 p432 give the dimension bound and rational multiplicity; they
do not prove the required modular Hom adapter. This is precisely the retained
rank-one gap, and it propagates to integral recovery. Rational generic-root and
Witt equivalence targets do not use it.

| Source issue | Independent result |
|---|---|
| E1, FS p237 | Confirmed: torsion character groups require a diagonalizable group, not necessarily a torus |
| E2, FS p234 | Confirmed: antipode belongs to H, not base category A; reuse PAPER-FARGUES-SCHOLZE-21/E46 |
| E3, FS p234 | Confirmed: bialgebra before rigidity supplies the antipode; reuse /E108 |
| E4, FS p237 | Confirmed: the division variable is x; reuse /E48 |
| E5, FS p237 | Confirmed: minimal-Levi parabolic contains B; reuse /E49 |
| E6, FS p331 | Confirmed: second product factor belongs to G₂; reuse /E66 |
| E7, FS p331 | Confirmed: the two sheaves live over their respective Bun factors; reuse /E67 |
| E8, FS p237 | Confirmed: N(T) is a characteristic-two counterexample; proposed repair remains a gap |
| E9, Zhu pp407–408,429 | Confirmed: geometric equivalence needs the algebraically closed base; reuse PAPER-ZHU-17/E35 |
| E10, Zhu p412 | Confirmed: coweight dominance uses coroots; reuse /E2 |
| E11, Zhu p436 | Confirmed: the opposite filtration needs supports in closures; reuse /E51 |

The FS findings are scoped to the author/arXiv copy; no finding is attributed to
the unread Astérisque body. E8 confirmation does not assert that the integral
theorem is false or that its replacement proof is finished.

## Exact-pin baseline and library audit

All declarations and their surrounding variables were read from the existing
source trees at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and
Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. None was checked merely
by name. The packet lists the exact module for every row below.

| Declaration | Confirmed scope |
|---|---|
| `TauCeti.Tannaka.tensorAutFunctor` | Given bialgebra over a commutative ring; finite comodules, not unknown-H reconstruction |
| `TauCeti.Tannaka.pointsFunctorIsoTensorAutFunctor` | Field and given commutative Hopf algebra; comparison of points with tensor automorphisms |
| `TauCeti.Tannaka.reconstructedPoint` | Field, given commutative Hopf algebra and commutative coefficient algebra; an algebra-valued point |
| `HopfAlgebra` | Antipode with both convolution inverse identities; commutativity remains extra |
| `Bialgebra` | Compatible algebra and coalgebra; does not identify the representing object with its dual |
| `TauCeti.AffineGroupSchemeCat` | Affine group objects over Spec of a commutative ring |
| `TauCeti.ReductiveAffineGroupSchemeCat` | Finite-type reductive groups over a field; not an integral Z_ℓ definition |
| `RootPairing` | Perfect root/coroot pairing and reflections; not an integral pinned group construction |
| `CategoryTheory.BraidedCategory` | Natural braiding and both hexagons |
| `CategoryTheory.SymmetricCategory` | Braiding with double braiding identity |
| `CategoryTheory.Functor.Braided` | Compatibility of a monoidal functor with specified braidings |
| `CategoryTheory.MonoidalCategory` | Tensor, unit, associator, unitors and their coherence |
| `CategoryTheory.Functor.Monoidal` | Inverse lax/oplax tensor and unit constraints |
| `CategoryTheory.LeftRigidCategory` | Chosen left duals; Satake geometric evaluation/coevaluation is separately imported |
| `CategoryTheory.Adjunction` | Unit/counit and triangle identities |
| `Representation` | Monoid homomorphism to linear endomorphisms; no continuity or finite projectivity |
| `Module.Projective` | Splitting/lifting property for modules |
| `Module.Flat` | Tensor injectivity property; applicable to the coordinate-module lift |
| `CategoryTheory.Monad.HasCoequalizerOfIsSplitPair` | Existence for every F-split pair |
| `CategoryTheory.Monad.PreservesColimitOfIsSplitPair` | Preservation of F-split coequalizers, a separate obligation |
| `CategoryTheory.Monad.ReflectsColimitOfIsSplitPair` | Reflection of F-split coequalizers |
| `CategoryTheory.Limits.HasColimit` | Existence of a colimit object only; Hopf structure needs the reconstruction argument |
| `TauCeti.reductiveAffineGroupSchemeProperty` | Finite-type field-valued reductive coordinate property |

The reviewed `data/library-coverage.json` records no implemented fusion,
integral reconstruction/identification or geometric/classical bridge at these
six layers. Its partial categorical and known-Hopf capabilities are imported,
not replanned. The distinction between known-Hopf comparison and relative
reconstruction is retained. The upstream ReductiveGroups and
RepresentationTheory/RootSystems documents were read in full; the local Weil
contract in ClassFieldTheory Layer 9 was read with its topology and field scope.

## Closure, suppliers and boundaries

Read all thirty retained exact external-node statements and the current fourteen
proposed-stage contracts, plus the five upstream layer imports. The in-scope
graph is acyclic. The stronger requests are obligations, not claims that a
current supplier already meets them.

Early GS imports supply loop/Hecke carriers, proper Schubert bounds, relative
perversity, ULA, hyperbolic localization, one-leg comparison, split-kernel/cokernel
behaviour, convolution closure and rigidity. Closure precedes fusion. RF2
supplies the actual divisor product/completion geometry; VS1's criterion is used
on bounded eligible correspondence charts. The E5 nodes supply stable,
idempotent, monoidal, Ind and presentability language, not geometric comparisons.

The four MC.6 relative nodes supply finite-piece representers, dual coalgebra
assembly, multiplication and rigidity-dependent antipode. Their exact hypotheses
are tested by the Satake nodes, with the coefficient/coequalizer adapter still
open. Neutral MC.6 reconstruction and the recognition nodes supply the rational
Witt/finite-type/connectedness steps. Upstream characteristic-zero reductivity
is applied only after finite type and connectedness. The rational coefficient
localization is used on bounded Witt scheme models, not asserted on arbitrary
v-stacks. EDC.7's rational geometric decomposition input does not imply integral
or arithmetic semisimplicity.

The requests preserve full general Prasad–Yu scope in RG2.3, including residue
characteristic two and the SO_(2n+1) exception. GS uses adjoint reduction, whose
dual derived group is simply connected. RG2.0/RG2.4 still need the completed
unramified integral-point/lattice and rank-one-generation refinements. LP3/LP4's
currently restricted Donkin/parameter-stack statements do not establish the
all-prime ordinary classifying-stack base-change and free stable completion
needed here. VS3/S6 still need the enhanced coefficient-duality adapter.

SR.4 owns the classical transform before this comparison. SF.2 must expose the
existing ordinary finite-model constructible Frobenius trace theorem with
proper pushforward and Künneth, not replace it by coherent trace. Split
normalization matches Gross and Zhu; nonsplit geometric descent remains its
named gap. RG2.0a owns affine Weil restriction; the chosen-embedding local
tensor/half-root comparison remains requested. HS1 imports the unique GS4 local
perfect-kernel export for its global action.

| Handed finding | Checked resolution |
|---|---|
| RT-AREA-geomlanglands/1 | Independent GS2 closure/duality → GS3 fusion; retains the reverse-edge restructuring proposal |
| /16 | General PY scope, explicit ℓ=2 adjoint reduction, exact RG2.3 request; rank-one gap propagated |
| /17 | Shared early MC.6 relative reconstruction imports, with separation from later period applications |
| /19 | One local perfect-export owner in GS4, consumed by HS1; all-prime LP requests and image containment retained |

All four findings and their independent verifier records were checked. No atlas,
upstream roadmap, supplier packet or promotion file is edited by this review.

## Per-node record

The packet has a separate verdict for every node. The following table uses the
unique final component of each node id.

| Node | Verdict | Evidence and boundary |
|---|---|---|
| `disjoint-leg-locus` | verified | FS VI.9.3 pp226–228: the locus forbids collisions between distinct blocks and permits them inside a block; all three disjointness tests distinguish those conditions. |
| `disjoint-leg-factorization-and-full-faithfulness` | verified | FS VI.9.3: checked block factorization and both full-faithfulness assertions; the partial-diagonal purity refinement remains the explicit VS1 request. |
| `support-parity` | verified | FS VI.9.3–VI.9.4 pp227–229: dominance changes dimension by an even integer and the correction is negative exactly for two odd support components. |
| `fusion-product-and-sign-rule` | verified | FS VI.9.4 pp228–229: proper convolution supplies the extension, GS2 closure/rigidity precedes fusion, and parity correction gives ordinary fibre symmetry. |
| `finite-set-functoriality-and-constant-terms` | verified | FS VI.9.4 pp228–229: retained diagonal pullback followed by the Grassmannian closed immersion; checked empty fibres, composition and permutations, including the repaired block-sum signature. |
| `drinfeld-fibre-realization` | corrected | Corrected IV.7.3 from Theorem to Proposition. Read pp164–166 and VI.9.2 p226: scope is locally constant perfect complexes, then degree-zero finite-projective continuous Weil representations. |
| `symmetric-constant-term` | verified | FS VI.9.4 and Zhu Proposition 2.36 p455: the degree shift, tensor compatibility and Levi transitivity agree; the Tate/parameter convention is still a named adapter. |
| `fusion-verdier-duality` | corrected | Corrected the VI.9.5 locator to pp229–230. Checked reversal, Verdier duality and sw*D as the internal dual against the earlier VI.8 rigidity input. |
| `tannakian-left-adjoint` | verified | FS VI.10.1 pp230–231: bounded left adjunction and coherent generator enlargement have X_W′→X_W and forward maps on dual fibres; the representer itself is not the coordinate coalgebra. |
| `relative-tannaka-hypotheses` | verified | FS VI.10.2 pp231–234 and exact MC.6 finite-piece contract: conservative linear symmetric functor, relative rigid source and F-split coequalizers; coefficient and preservation verification remains a gap. |
| `geometric-coordinate-hopf-algebra` | verified | FS VI.10.2 pp233–234: checked dual-fibre coalgebra colimit, monoidal multiplication and rigidity-dependent antipode in the exact MC.6 imports; pinned known-Hopf APIs do not perform this construction. |
| `multileg-and-coefficient-reconstruction` | verified | FS VI.10.3 pp234–235: disjoint-leg reconstruction is a tensor product and coefficient changes/adic limits require the recorded finite-piece adapter; no unbounded adjoint is substituted. |
| `rational-semisimplicity` | verified | FS VI.7.5 p219 and VI.11.1 p236; Zhu §2.1 pp429–432: semisimplicity is rational and geometric via the Witt special fibre, without integral or arithmetic Weil semisimplicity. |
| `generic-fibre-reductivity` | corrected | Corrected DM 2.22 to Corollary. Read DM pp24–27 and FS p236: tensor generation gives finite type, nonzero nμ excludes finite tensor hulls, then characteristic-zero semisimplicity gives reductivity. |
| `witt-rational-tannakian-category` | verified | FS Remark I.2.14 p17 and VI.7 p219; Zhu §2 opening p429 and §2.5 p454: the rational Witt category is neutral Tannakian over k=F̄_p with fusion-transported symmetry; its group is the geometric generic fibre. |
| `torus-and-rank-one-identification` | verified | FS VI.11.1 pp236–237: torus algebra, generic PGL₂ standard representation and diagonalizable component refinement agree. This generic comparison does not use the separate integral rank-one node. |
| `rank-one-integral-identification` | corrected | Added the precise GS2:correspondences modular Hom/top-cycle request; replaced an unsupported injective-hull shortcut by the Steinberg-square derivation supported by DH pp3–4,18 and an explicit LP3 kernel contract. The geometric repair remains a gap; E8 confirms only the false source lemma. |
| `generic-root-datum` | corrected | Expanded the FS locator to pp237–238. Minimal-Levi root/coroot maps and highest-weight convex-hull bounds identify the complete generic dual root datum and root-line twist. |
| `integral-recovery-and-adjoint-reduction` | verified | FS VI.11.1 and VI.11.4 p238; PY Corollary 1.3 p2, proof §5.4 p12: full DVR closed-immersion scope and characteristic-two exclusion are retained. Integral-point/lattice and rank-one repair gaps are explicit. |
| `dual-group-identification` | verified | FS VI.11.1 pp235,238–239: checked intrinsic grading/filtration, splitting-independent root-line pinning and Weil descent; integral recovery remains conditional on its upstream named gaps. |
| `witt-rational-satake-equivalence` | verified | Zhu Theorem 0.3 pp407–408 and §2.5 pp454–455; FS p219 and pp236–238: IC_μ maps to V_μ with the fusion-transported H* structure over F̄_p. No integral rank-one or own-Gelfand-constraint dependency is inserted. |
| `normalized-satake-equivalence` | verified | FS VI.0.2 p190 and VI.11.1 p235: finite-projective continuous (Ĝ⋊W_E)^I representations after choosing sqrt(q), with finite-set coherence and the declared Frobenius convention adapter. |
| `levi-naturality` | verified | FS VI.9.4 p229 and IX.7.1 pp334–335: normalized shifted constant terms agree with dual-Levi restriction; the positive-power parameter convention is not silently equated with stalk action. |
| `adjoint-isomorphism-naturality` | verified | FS VI.12 discussion p241 and IX.6.1 pp330–331: adjoint-isomorphism functoriality has the exact hypothesis and dual-map direction, without arbitrary-group-map naturality. |
| `product-naturality` | verified | FS IX.6.2 pp331–332: pure exterior products and categorical product compatibility agree; checked both reused diagram/index errata E6–E7. |
| `weil-restriction-naturality` | verified | FS IX.6.3 p332: chosen conjugate embeddings, pullback/inflation and induction are used with the divisor comparison; induction is not asserted strong monoidal and the local tensor adapter remains open. |
| `chevalley-involution` | verified | FS VI.12.1 pp240–241: sw* gives the pinned Chevalley involution conjugated by the adjoint ρ̂(−1); the signature uses adjoint conjugation without assuming a lift. |
| `enhanced-perfect-satake-extension` | verified | FS IX.2 p321: exact linear monoidal extension from finite-projective representations and relative Perf(BG) base change; the image is only contained in the stable idempotent closure. Uniqueness requires a coherent restriction-functor isomorphism; all-prime LP3/LP4 scope remains requested. |
| `normalized-frobenius-function` | verified | Gross §§2–4 pp3–9, §8 pp15–16; Zhu equations (2.2.7)–(2.2.10) p436: checked vol(K)=1, geometric Frobenius, integer half twists and canonical constant/IC descent in the examples. |
| `trace-convolution` | verified | Finite-model proper pushforward and Künneth give convolution traces; SF.2 must expose the ordinary constructible Frobenius theorem and perfection adapter, distinct from coherent trace. |
| `trace-constant-term` | verified | Gross §3 pp6–8 and Zhu p436: δ_B^(1/2)=q^(−〈ρ,λ〉), degree-shift sign and geometric Frobenius agree; nonsplit descent is the stated comparison gap. |
| `classical-satake-comparison` | verified | Zhu p436 and Gross §4 pp8–9: canonical split IC traces give Weyl characters and the minuscule sign/half-root scaling. This is downstream of SR.4, with nonsplit and finite-model obligations recorded. |

## API, tests, suggested file and planets

All forty-seven APIs fit their constructors, extensionality, functoriality,
universal properties and downstream uses. The twenty-seven tests distinguish
blockwise disjointness, parity signs, collision composition/permutations/empty
fibres, representer-versus-dual orientation, torus Hopf structure, normalized
half twists, perfect extension at torsion primes, and canonical Frobenius traces.
Every definition/construction has three tests. All API declarations and named
example comments match the suggested file. All sixteen planets describe key
mathematical outputs and have unique in-scope owners.

The numerical tuple/parity/trace prototypes have expressible signatures; the
geometric ones explicitly omit their imported diamond, ULA, continuous Weil
and enhanced-category conditions. Examples using skeletal arbitrary category
parameters do not prove the corresponding geometric theorem. The carrier gap
records that limitation, and no arbitrary proposition certificate replaces it.

## Validation and next work

- `python3 scripts/check_blueprint.py research/blueprint/packets/GeometricSatakeAndFusion--GS3.json`:
  **0 errors, 0 warnings**, with the counts above.
- The source-issue and source-version validators used by `check_errata.py`:
  **0 errors**. All six public PDF hashes match the packet.
- Independent internal-cycle, per-node-review coverage, API/test-name and
  reader/packet statement/proof/source/request/gap checks: **passed**.
- `python3 research/blueprint/intake.py check-files` on all five deliverables:
  **passed**. `git diff --check`: **passed**.
- `lean-check research/blueprint/suggested/GeometricSatakeAndFusion--GS3.lean`
  was attempted with 111 GB available. It stops at the missing compiled
  `TauCeti.Algebra.AlgebraicGroup.Representation.Tannaka.GroupFunctor` import.
  **Lean did not compile.** The existing sources have the exact pins, but the
  required Tau Ceti object file is absent. No build, cache download, update,
  language server or substitute project was started. Only comments changed
  after this attempt, so the failure still applies.

There is no outstanding revision request or acceptance question for this review.
The orchestrator should retain the packet's twelve refinement gaps and three
restructuring proposals. In particular, route the modular minuscule-convolution
contract to the GS2 correspondence owner and the precise tilting/kernel inputs
to LP3. The rank-one repair cannot be called complete until those contracts are
established. Elaborate the suggested file when the existing compiled baseline
becomes available. The handoff note records these boundaries for continuation;
this session takes no second job.
