# Independent review of the second geometrisation fix

Reviewer: Codex, session `codex-8zLSxs`; job #5161;
`independent-review-REV-FIX-RT-AREA-geomlanglands~2`, 10 October 2026.
Input: atlas main `9849e286b`, including `FIX-RT-AREA-geomlanglands~2`
by session `codex-rtOQ9t`. This reviewer did none of that fix.

## Verdict and scope

| Packet | Verdict | Reason |
| --- | --- | --- |
| SchemeAndStackFoundations | **accepted**, for this fix's handoff boundary | The original fix issue #5160 excluded this packet. Findings /15 and /27 were explicitly handed to their owners rather than claimed applied. The handoffs respect the verifier and existing ownership. SF.5 positivity/Keel/Stein and SF.1 effective descent/stack interfaces remain unfinished; this verdict does not certify them. |
| MotivesAndAlgebraicCycles | **needs_changes** | Finding /17 has the correct early supplier and source-level targets after the corrections below, but the bridge to the pinned Beck theorem remains open. The reconstruction carriers and most suggested signatures are also absent. The packet honestly records these gaps; compiling its existing declarations does not supply them. |

The complete red-team result, verifier and second-round fix report were read,
including /33–39. The review distinguishes an adequate excluded-owner handoff
from a mathematical correction actually present in an allowlisted packet.
It does not re-review all older nodes, pending iwasawa fixes, or upstream roadmaps.
Both immediately preceding packet review objects are preserved unchanged in
`reviewHistory`; they were the algebraic-geometry second-round reviews dated
2026-10-10.

Only the two packet review objects, the specified motives corrections, the motives
suggested file and this review's report/handoff change. The scheme suggested file
was checked unchanged. Readers, source-item routing, consumer packets, campaign
files, decompositions, links and the live stage graph are outside this issue's
edit scope.

## Corrections made

1. Fixed the relative finite-piece monad convention. Transporting through symmetry
   to `A_i ⊗ V` gives **left** `A_i`-modules and **right** dual-coalgebra comodules.
   Keeping `V ⊗ A_i` uses the opposite multiplication. Updated the statement,
   proof plan, API, acceptance criteria and suggested inventory together.
2. Strengthened the three finite-piece tests: regular left modules over a matrix
   algebra distinguish multiplication from its opposite; a finite-support graded
   fibre functor has no representer on the whole category, while bounded pieces
   may have one; evaluation of the transposed right coaction recovers the left
   action and unit. Exact faithfulness alone is not presented as failure of the
   entire relative theorem.
3. Added the missing upstream ReductiveGroups layer-1 prerequisite to finiteness
   recognition. Narrowed the existing request to its closed-immersion and
   coefficient-generation input. The neutral reconstruction instead imports the
   already pinned `TauCeti.fgPointRepresentationCategoryEquivalence` directly,
   after constructing the Hopf algebra.
4. Corrected the Mathlib near-miss namespace to
   `TannakaDuality.FiniteGroup.equiv`. It reconstructs representations of an
   already supplied finite group, not an arbitrary neutral fibre functor.
5. Added the `neutralHull_zero` non-example to the packet and a typed Lean example:
   over a field, the hull of the zero module cannot contain an object isomorphic
   to the one-dimensional module. This rejects replacing the hull by the entire
   ambient category. Reused `ModuleCat` and imported its existing biproducts
   instance, with a checked baseline credit.
6. Recorded the missing typed interfaces explicitly in a new gap and MC.6
   coverage. Replaced the packet review verdicts with the bounded verdicts above.
   The suggested-file header records this review's successful elaboration and
   distinguishes it from the historical unchecked input.

## Finding-by-finding decisions

Every number below denotes `RT-AREA-geomlanglands/<number>`. “Handoff accepted”
means the fix report specifies the correct work for an excluded owner; it does
not mean that owner has implemented it. /3 and /35 remain rejected as in the
verifier. /33–39 were not enumerated in the original fix issue.

| Finding | Decision and reason |
| --- | --- |
| /1 | **Handoff accepted.** GS2 must supply Satake closure and two-leg convolution before GS3 fusion. The report reverses the erroneous dependency and retains flatness/Tor qualifications for convolution and duality. |
| /2 | **Handoff accepted.** Uses the verifier's ET.6a ownership choice after HS2, with all levels, transitions and group/Weil actions, Drinfeld comparison or duality, and the general-field boundary in /22. A single unacted hyperspecial diamond is insufficient. |
| /3 | **Rejected remedy correctly omitted.** The verifier rejects creating another GIT owner; the accepted existing routes must be reused. |
| /4 | **Handoff accepted.** Early PY02 fixed-point reductivity and finite unipotent-class input precede LP1's dimension/flatness argument. They are separated from the integral Prasad–Yu criterion in /16 and from a circular late LP3 supplier. |
| /5 | **Handoff accepted.** LP2 supplies the enhanced stable-category excursion target and relations of FS VIII.3.7 and VIII.4.1–2. ES0 supplies the Bun application, continuity and formulas. The ordinary homotopy-category centre is not substituted. |
| /6 | **Handoff accepted.** Keeps only the verifier's primary choice: ES2 owns X.1.1–3, including X.1.2; ES3 owns X.3 and X.0.1–2; LP4 retains VIII.5.1 and imports the integral invariant colimit. The contrary alternative is not applied. |
| /7 | **Handoff accepted.** Adds the spectral-centre inputs to all named consumers, including ES2, and VS5/HS3 to ES4. The component-group hypothesis remains attached to its particular centre comparison. |
| /8 | **Handoff accepted with source obligation retained.** Early SR.3b admissibility/Schur work avoids a late ES dependency. The report correctly distinguishes uncountable algebraic closures of ℓ-adic fields from countable algebraic closures of finite fields; the latter cannot use that uncountability argument. |
| /9 | **Handoff accepted.** SR.1 owns the ordinary abelian Bernstein centre through Hecke corners; ES0 owns the enhanced centre and comparison. No unjustified derived prerequisite is imposed on the ordinary construction. |
| /10 | **Handoff accepted.** Early algebraic z-extension/induced-torus inputs precede BG/ET. ES6 retains the later geometric comparison, with the correct Kaletha source. These are different uses of the existing owners. |
| /11 | **Handoff accepted.** Kottwitz 10.4 supplies the quasi-split basic class; ES7 must still supply the full z-embedding, Bun fibre product and rational-point reduction. Basic-class classification alone does not provide that reduction. |
| /12 | **Handoff accepted.** Generic adeles, rational points and compactness come from FA/AA, with the missing AA.0 input added. ES7 retains the division-algebra-specific orders, trace and measure normalizations. |
| /13 | **Handoff accepted.** HS1 imports VS5's lisse ULA/BZ results rather than only torsion étale results. The ℓ≠p Hecke statement is not narrowed by later good-prime conditions. |
| /14 | **Handoff accepted.** Both bounded properness and its dependent closedness move to integral Witt geometry. Generic loop geometry remains separate, and no reductive integral model for every ramified group is assumed. |
| /15 | **Handoff accepted; mathematics pending.** SF.5 owns the positivity/Keel/Stein results and GS0 the Bhatt–Scholze application. The G817/G815 duplication and G819 routing are correctly assigned outside the fix's allowlist. SF.5 remains unplanned in this packet, so this is not acceptance of a completed theorem. |
| /16 | **Handoff accepted.** Reuses the accepted KPZ26 route to RG2.3. Preserves both residue-characteristic/group alternatives and the affine finite-type target of Prasad–Yu. GS4 performs its adjoint reduction; /4's different early result is not moved behind LP1. |
| /17 | **Needs changes after local corrections.** The nine-node early reconstruction plan, neutrality/rigidity distinctions and recognition hypotheses are correct. The relative preservation adapter and typed reconstruction interfaces below remain missing, so the common supplier is not yet closed. |
| /18 | **Handoff accepted.** L1/L3 supply perfection comparison, EDC.5 supplies perversity/recollement, and unsupported VS3 gates are removed from the torsion Chapter VI constructions. HS1's independent lisse input remains. |
| /19 | **Handoff accepted.** GS4 exports finite-projective Satake; HS1 owns its perfect-complex extension. The accepted common integral-representation Part II is imported for every ℓ≠p, rather than duplicating it or imposing VIII.5 good-prime restrictions. |
| /20 | **Handoff accepted.** Distinguishes SW's minuscule rigidification inputs from its nonemptiness proposition. Higher-dimensional compact-support Huber/diamond comparison remains an explicit HS3 supplier request. |
| /21 | **Handoff accepted.** Separates the geometric Demazure input from sheaf-theoretic ULA work and requests VII.4.3 from VS2 at stage level. No nonexistent reviewed node is invented. |
| /22 | **Handoff accepted with limitation explicit.** A rational-prime integral construction is not asserted to cover every local field. General-field Hecke fibres or an actual integral extension, including equal characteristic, remain required. |
| /23 | **Handoff accepted.** Unconditional coarse quotient/GIT belongs before excursion reconstruction; good-prime integral invariants belong to their later owner. Reuses existing accepted routes rather than /3's rejected new owner. |
| /24 | **Handoff accepted.** The already accepted ReductiveGroupsIntegralRepresentationsPartII is the common owner for LP3/PA1 inputs; no competing general integral-representation theory is planned. |
| /25 | **Handoff accepted.** LP2 owns general profinite/condensed semisimple parameter reconstruction, including disconnected targets. GS5 retains the local/global application and its relations. |
| /26 | **Handoff accepted.** LP1 builds integral cocycles once over Z[1/p] and supplies the ℓ-adic base change to SR.6. The route does not rely on an obsolete restructuring date claim. |
| /27 | **Handoff accepted; interface pending.** SF.1 supplies effective fpqc descent and the stack interface; LP1 supplies its application. The verifier's rejected derived-QCoh/Perf transfer is omitted. The installed D0 generic quotient-stack owner must be reused; effective descent is not yet provided by this packet. |
| /28 | **Handoff accepted.** Removes unsupported L1/L3–L6 gates on VS3 while retaining L0 and the actual L1→GS0/L3→GS1 comparisons. |
| /29 | **Handoff accepted.** Places lisse BZ/ULA and Verdier statements in VS5, separate from torsion duality; VS4 owns its stated left adjoint. Does not add lisse reflexivity, which FS does not claim. |
| /30 | **Handoff accepted.** Generic solid theory and the divisor-specific partial-properness inputs are separated; the whole VS1 layer is not made a gate for VS2. |
| /31 | **Handoff accepted.** VB2 owns arithmetic finite étale covers of the Fargues–Fontaine curve; VS1 imports its actual SW comparison. Product-fundamental-group and irrelevant class-field-theory prerequisites are not fabricated. |
| /32 | **Handoff accepted.** Both BG0 and BG1 are included in the early algebraic split consumed by IG0/ET5. Preserves the inverse-cocharacter convention and separates later analytic geometry. |
| /33 | **Outside enumeration; boundary accepted.** The known Badulescu–Roche Jacquet–Langlands/multiplicity route must be distinguished from unused LRS work by the owning job; no unrelated consumer edit is claimed here. |
| /34 | **Outside enumeration; boundary accepted.** The IX.5.1/IX.5.2 centre citation and ES7's ownership of IX.7.1 remain an excluded-consumer correction. |
| /35 | **Rejected remedy correctly omitted.** The ordinary centre cannot replace the enhanced stable-category target. |
| /36 | **Outside enumeration; boundary accepted.** Order-parametric elliptic-sheaf chains remain an owning DM7 obligation. The verifier does not authorize making the optional split Morita comparison a new mandatory theorem. |
| /37 | **Outside enumeration; boundary accepted.** Version-specific IX.6.2 misprints belong to the dedicated errata job; this review does not duplicate or edit those records. |
| /38 | **Outside enumeration; boundary accepted.** BG3's IV.1.23–24 inputs retain the smooth Artin-stack hypotheses; its excluded packet is not claimed fixed. |
| /39 | **Outside enumeration; boundary accepted.** The known unused Viehmann closure result does not justify adding another unnecessary target. |

## Source and baseline checks for /17

The review read the relevant public source pages directly, not just the fix's
citations. These were selected-page reads, not full-paper extractions. All results
here and in the packet are stated in the reviewer's own words.

| Public text | Locations read for this review | SHA-256; accessed |
| --- | --- | --- |
| [Fargues–Scholze, arXiv v4](https://arxiv.org/pdf/2102.13459v4), 27 November 2024 | Proposition VI.10.2 and proof, printed/PDF pp.232–234; VI.11's recognition application, pp.235–237 | `1f8040751d3424f59ae56651d990d7b2d5030e6b7cae58bc2fc683358dfc2027`; 2026-10-10 |
| [Deligne–Milne, corrected author text](https://www.jmilne.org/math/xnotes/tc.pdf), corrections 15 August 2012 | Proposition 1.13, p.12; Theorem 2.11, Lemmas 2.12–13 and Propositions 2.14–16, pp.20–24; Propositions 2.20–21, Corollary 2.22 and Proposition 2.23 with proofs, pp.24–27 | `48f8af5249081217fc4a806414a764d9d69d66eff9092ddd8e2cf0ea078579e8`; 2026-10-10 |

The relative nodes retain a rigid symmetric monoidal base, the action and
A-linear symmetric monoidal conservative functor, filtered full represented
pieces stable under the relevant action/coequalizers, and comodules with
underlying objects in A. The filtered assembly and multiplication targets match
VI.10.2, pp.233–234. A commutative bialgebra is obtained before an antipode;
rigidity of C is an additional hypothesis. The already recorded premature Hopf
label and letter slips, `PAPER-FARGUES-SCHOLZE-21/E108` and `/E46`, are reused.

For the finite-piece comparison, writing the monad on the left fixes the algebra
side. On regular left B-modules the transported product is B's product; for
B=M₂(k), E₁₂E₂₁=E₁₁, whereas the opposite gives E₂₂. Transposing the action
gives a right B-dual coaction whose evaluation at b returns b's left action.
These tests address an actual convention error in the input rather than merely
rephrasing its proposed comparison.

The neutral finite hull in DM Lemmas 2.12–13, pp.21–22, is finite sums and
subquotients, not tensor closure. Its stabilizer algebra and regular representing
object are necessary constructions; neutral representability does not follow
just by substituting vector spaces in the relative theorem. No semisimplicity
assumption is introduced. The coalgebra and scalar-algebra-natural tensor
endomorphism targets use DM 2.14–16, pp.22–24; rigidity and DM 1.13, p.12,
turn endomorphisms into automorphisms for Theorem 2.11.

DM 2.20, pp.24–25, distinguishes a finite-sum/subquotient generator for a finite
group from a tensor generator using X and its dual for a finite-type group.
DM 2.22, p.25, requires characteristic zero and a **nontrivial action**, not
merely a nonzero object. The α_p counterexample prevents an unqualified extension
to positive characteristic. DM 2.23, p.26, gives pro-reductivity for an arbitrary
connected affine group in characteristic zero. The finite-type reductivity
application additionally uses its finite-type/smooth interface and imports
upstream ReductiveGroups layer 6. FS p.236 uses the rational recognition route;
p.237's separate finite-subgroup argument is not a characteristic-p version of
DM 2.22.

The following baseline statements were read at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`, rather than inferred from their names:

| Existing supplier | Boundary checked |
| --- | --- |
| Mathlib `CategoryTheory.Monad.monadicOfHasPreservesReflectsGSplitCoequalizers`, `CategoryTheory/Monad/Monadicity.lean` | Requires an adjunction and existence, preservation **and** reflection of split coequalizers. It supplies ordinary Beck, not the relative tensor/comodule adapter. |
| Mathlib `CategoryTheory.Ind`, `CategoryTheory/Limits/Indization/Category.lean` | Ind-objects and a fully faithful embedding exist. A monoidal extension and internal-comodule comparison are not supplied by this definition. |
| Mathlib `CategoryTheory.BimonObj`, `CategoryTheory/Monoidal/Bimon_.lean` | Supplies compatibility laws, not reconstruction of an object from a fibre functor. |
| Mathlib `TannakaDuality.FiniteGroup.equiv`, `RepresentationTheory/Tannaka.lean` | Starts with a finite group and a commutative domain of scalars. |
| Mathlib `ringEquivEndForget₂`, `Algebra/Category/ModuleCat/Tannaka.lean` | Starts with a given ring; it does not construct a general neutral representing Hopf algebra. |
| Mathlib `Abelian`, `Linear`, `Functor.Faithful`, `RigidCategory`, `Equivalence`, `Bialgebra`, `ModuleCat` and its finite biproducts instance | Native categories, structures and instances are reused; the new test does not invent a replacement module category. |
| Tau Ceti `FGComoduleCat`, its rigid instance, `tensorAutFunctor` and `pointsFunctorIsoTensorAutFunctor` | The category uses right comodules. The group-functor comparison starts with a commutative Hopf algebra; the rigid instance runs from a Hopf algebra to rigidity, not conversely. |
| Tau Ceti `fgPointRepresentationCategoryEquivalence` | Existing finite representation/comodule dictionary over a commutative Hopf algebra; used only after constructing that algebra. |

The reviewed library audit has no MotivesAndAlgebraicCycles entry; no audit was
invented. Its SF.1/SF.5 records were read for the handoff boundary. The scheme
packet has concrete lower-stage material but no SF.5 nodes providing the requested
Keel/Stein mathematics or general effective-stack interface.

Current upstream main was also read at
`3c18d9fbfceed0dc5c1edb1070a3927152d19e28`: the ReductiveGroups roadmap and the
RepresentationTheory index and SemisimpleAlgebras roadmap, together with the
relevant newer roadmap/library searches. Current Tau Ceti was checked at
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. These do not already provide the
arbitrary-fibre-functor construction planned here. Known-Hopf reconstruction and
the upstream representation/reductivity suppliers remain imports. The reader
and current library check do not change the pinned baseline or certify all
upstream roadmaps.

## Remaining obligations for /17

The substantive source-to-library bridge remains open: FS VI.10.2 prints
existence and reflection of F-split coequalizers; the pinned Beck theorem also
requires preservation. The input acknowledges this and adds preservation to a
sufficient-hypothesis version. That stronger version does not discharge the
source's target. The next fix must construct the needed instance under a precise
source convention, or explicitly separate the stronger theorem and retain the
printed target as an unmet obligation. This is an interface gap, not a claim that
FS's result is false.

The five new construction nodes have 16 named API entries; only
`neutralFiniteHull` has a typed declaration. Fifteen API entries, four new theorem
signatures and the original 24 reconstruction/recognition test statements are
still planning comments. The added zero-hull non-example is typed, but does not
repair those omissions. The missing work includes the relative action and
representer adjunction, tensor monad comparison, monoidal Ind extension,
internal right comodules and filtered factorization, and the neutral fibre
functor, stabilizer algebra and filtered-coalgebra comparison. Supply real typed
carriers and signatures with placeholder proof bodies, rather than Prop-valued
surrogates or a representing Hopf algebra as an input.

The prospective early split is otherwise sound: the nine new nodes and existing
`rigid-bialgebra-is-hopf` form an acyclic same-packet closure with no MC.5 ancestor.
The late `tensor-automorphism-group` and `pro-algebraic-approximation` consumers
import the abstract suppliers. The four proposed abstract planets are not
installed; existing planets and the `restructure` proposal are unchanged in
this review. Maintainer installation under PROTOCOL §9 remains a normal handoff,
not an additional mathematical error. GS4 should import the selected relative
or neutral targets after its own hypotheses are checked, rather than a whole
late MC.6 stage. The excluded reader must later be reconciled with this review's
convention and test corrections by a job authorized to edit it.

## Validation

- `scripts/check_blueprint.py` on both packets: **0 errors, 0 warnings** at the
  pinned declaration index. Scheme: 303 nodes, 253 API entries, 236 tests, 191
  baseline declarations. Motives: 182 nodes, 451 API entries, 255 tests, 109
  baseline declarations. Its 23 gaps and 16 requests remain explicit.
- Full suggested-file elaboration with the shared pinned `lean-check` build,
  one file at a time: scheme exit 0, 362 declaration-uses-`sorry` warnings;
  final motives exit 0, 806 such warnings. Neither has errors or other warnings.
  These are signature checks, not implementation or coverage claims.
- Scheme suggested SHA-256:
  `7d7dd0439924404df02f6ed8f1761e2751b060c04ff98710d7616deb9d4ce66e`.
  Final motives suggested SHA-256:
  `6251d873dabe50917470c218184c89c80ffd19d9784b74694eb6358ab904839d`.
- Structural comparison preserves every old node identifier, all 47 motives
  source issues and all 10 scheme source issues, and the immediately preceding
  reviews exactly. Scheme mathematics is unchanged. No `excerpt` keys remain
  in either edited packet. The ten-node abstract closure is acyclic and has no
  MC.5 dependency.
- No link map or standalone restructuring result is under review, so
  `check_links.py` and `check_restructure.py` have no applicable input. The embedded
  packet proposal is checked by the packet checker and inspected above; it is
  not a standalone RS result. Submission-path validation and `git diff --check`
  also pass.

This is a completed independent review returning a precise revision list, not a
checkpoint of unfinished review work.
