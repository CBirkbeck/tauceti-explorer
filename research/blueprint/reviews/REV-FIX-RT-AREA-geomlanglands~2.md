# Independent review of the second geometrisation fix

Codex, session `codex-WkJRnK`, 17 October 2026; issue #5161;
`independent-review-REV-FIX-RT-AREA-geomlanglands~2`.
Input: atlas `37d735d33f813af3b7bf2043228bbc613955e77d`.
This session did none of the fixes under review.

## Verdict and submission blocker

| Authorized packet | Verdict | Boundary |
| --- | --- | --- |
| SchemeAndStackFoundations | **accepted** | The /15 and /27 excluded-owner handoffs are correct. This does not certify completion of SF.5 positivity/Keel/Stein or SF.1 effective descent. Scheme mathematics is unchanged. |
| MotivesAndAlgebraicCycles | **needs_changes** | /17 has the correct early abstract targets, conventions and recognition hypotheses. The source-to-pinned-Beck preservation bridge remains unresolved. |

The live issue names these two packets and matching Suggested files. Its queue
entry instead names nineteen packets and matching Suggested files.
`research/blueprint/issues.py`, `deliverables_complete`, requires this job's
reviewer and a verdict in **every** queue-listed packet. Seventeen are outside
the live issue's edit scope. WORKERS.md's instruction to edit only issue-named
files prevents supplying those markers without scope authorization. The two
reviews are finished; the complete queue submission is blocked by that mismatch.
This PR is a **checkpoint**, not a claim to have reviewed the seventeen excluded
packets. No scope extension was received before submission.

The preceding top-level reviews are copied unchanged into each packet's
`reviewHistory`: scheme's algebraic-geometry review by `codex-iBDlUc`, and motives'
iwasawa review by `codex-BIjxwP`, both dated 11 October. Earlier reviews, including
the 10 October geometrisation review, remain there. PR #8485 is another open,
unmerged checkpoint of this job; its changes are not assumed present or imported.

## Work and corrections in this session

Read all 39 original findings, their verified evidence and the second-round fix
report, including its rejected remedies and out-of-scope dispositions. The table
below reassesses those dispositions. A handoff verdict says the report routes the
required work correctly; it does not assert that an excluded consumer was fixed.

1. Replaced the finite-piece proof plan's generic Beck application by the pinned
   **conservative** variant,
   `CategoryTheory.Monad.monadicOfHasPreservesGSplitCoequalizersOfReflectsIsomorphisms`.
   It needs an adjunction, reflection of isomorphisms, and existence and preservation
   of functor-split coequalizers. Conservativity supplies reflection of isomorphisms;
   a separate coequalizer-reflection instance is unnecessary for this variant.
2. Added `relativePieceMonadicOfPreserves`, a real-bodied application over Mathlib's
   categories and adjunction. Preservation is an explicit hypothesis. It proves
   only the ordinary Beck step under sufficient hypotheses; it neither constructs
   the relative tensor/comodule comparison nor derives preservation from FS.
3. Removed the obsolete gap demanding development of heavy reconstruction carriers
   and typed API/test signatures in Suggested.lean. WORKERS.md and
   PACKAGE_REVIEW.md's binding 12 October shape rule puts targets over missing
   carriers in the roadmap prose. Updated the coverage and Suggested inventory
   accordingly. The separate mathematical preservation gap remains explicit.
4. Replaced the two top-level review objects with these bounded verdicts, preserving
   their predecessors exactly. No reader, consumer, live graph, queue, errata,
   upstream roadmap or library is changed.

The prior review's corrections to left modules/right dual comodules, matrix-unit
and graded-vector-space tests, the zero-hull non-example and recognition imports
are retained. They are input to this session, not new work claimed here.

## Finding-by-finding decisions

Numbers denote `RT-AREA-geomlanglands/<number>`. /3 and /35 follow the verifier's
rejection. /33–39 were outside the original fix enumeration.

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
| /17 | **Needs changes after local corrections.** The nine-node early reconstruction plan, neutrality/rigidity distinctions and recognition hypotheses are correct. The source-to-pinned-Beck preservation bridge remains open. Heavy missing carriers belong in prose under the current shape rule; their absence from Lean is not a separate defect. |
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

## Primary-source checks and mathematical boundary

These are selected-page reads of public sources, not full-paper extractions.
Statements in this review and the packet are paraphrases.

| Source | Locations freshly read | Version receipt |
| --- | --- | --- |
| [Fargues–Scholze](https://arxiv.org/pdf/2102.13459v4) | VI.10.2 and proof, printed/PDF pp.232–234; VI.11 application, pp.235–237 | arXiv v4, 27 November 2024; accessed 17 October 2026; SHA-256 `1f8040751d3424f59ae56651d990d7b2d5030e6b7cae58bc2fc683358dfc2027` |
| [Deligne–Milne](https://www.jmilne.org/math/xnotes/tc.pdf) | 1.13, p.12; 2.11–2.16, pp.20–24; 2.20–2.23, pp.24–27; graded example 2.30, p.27 | Author text corrected 15 August 2012; accessed 17 October 2026; SHA-256 `48f8af5249081217fc4a806414a764d9d69d66eff9092ddd8e2cf0ea078579e8` |

FS VI.10.2 supplies the represented finite-piece adjunction, dual-coalgebra
assembly, multiplication from tensor products and antipode under rigidity. Its
printed split-coequalizer hypothesis names existence and reflection. The packet
acknowledges that the chosen pinned Beck application also needs preservation.
Changing to conservative Beck removes an unnecessary separate reflection adapter,
but does not establish preservation. The fix must give a precise source convention
or an argument deriving that instance, or retain the printed source target as an
unmet obligation alongside the stronger sufficient-hypothesis theorem. This is a
proof-plan interface gap, not a finding that FS is false.

For the finite-piece convention, symmetry gives the monad A_i tensor V and left
A_i-modules. Transposition gives right dual-coalgebra comodules. Matrix units in
M₂(k) distinguish the product from the opposite product. Finite-support graded
vector spaces have no single global representer for the forgetful functor, while
bounded pieces may have one; this does not refute relative reconstruction.

DM 2.12–2.13 use finite sums and subquotients, not tensor closure, to construct a
representer and its stabilizer algebra. The neutral theorem starts with an exact
faithful symmetric monoidal fibre functor, not with a representing Hopf algebra.
DM 2.14–2.16 construct the coalgebra and tensor endomorphisms; rigidity and 1.13
supply invertibility. DM 2.20 distinguishes a finite-sum/subquotient generator
(finite group) from a tensor generator involving a dual (finite-type group).
DM 2.22 needs characteristic zero and a nontrivial action; nonzero objects alone
do not suffice. DM 2.23 gives pro-reductivity in the arbitrary affine connected
case; the finite-type reductivity application imports the existing upstream
finite-type/smooth interface and ReductiveGroups layer 6. No semisimplicity or
positive-characteristic generalization has been added.

The proposed early abstract closure is still acyclic with no MC.5 ancestor.
Installing its stage split is the maintainer's normal PROTOCOL §9 handoff. GS4
imports only the suppliers whose hypotheses its Satake category satisfies.
The excluded reader still needs reconciliation by an authorized owner.

## Library and upstream checks

The new Beck declaration and the three split-coequalizer classes were read in
Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`,
`CategoryTheory/Monad/Monadicity.lean`, especially lines 249–290 and 362–374.
The latter proof obtains coequalizer reflection from conservativity and
preservation before applying ordinary Beck. `MonadicRightAdjoint` in
`Monad/Adjunction.lean`, lines 251–260, retains the adjunction and comparison
equivalence. The new definition reuses this data; it does not redevelop Beck.

At Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`, the statements of
`TauCeti.Tannaka.pointsFunctorIsoTensorAutFunctor` in
`Algebra/AlgebraicGroup/Representation/Tannaka/GroupFunctor.lean` and
`TauCeti.fgPointRepresentationCategoryEquivalence` in
`Algebra/AlgebraicGroup/Representation/Comodule/Equivalence.lean` start with a
commutative Hopf algebra. They remain imports after constructing that algebra;
they do not reconstruct it from an arbitrary neutral fibre functor.

Read the reviewed library audit's SF.1 and SF.5 entries; it has no motives entry.
Existing descent/topology and cycle fragments are not the missing general
scheme-stack or positivity interfaces. Checked current upstream main
`0d144d044dacebca17b654695b6f1ad58f159b27`, its ReductiveGroups and
RepresentationTheory roadmaps and nearby SemisimpleAlgebras conventions, and
current Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.
The existing known-group reconstruction remains an import; this review plans no
replacement for it. No upstream or library build was run.

## Validation

- Both packet validators: **0 errors, 0 warnings**, using the declaration index
  for pinned Mathlib/Tau Ceti. Scheme: 303 nodes, 253 API entries, 236 tests,
  191 baseline declarations, 16 explicit gaps. Motives: 182 nodes, 463 API entries,
  261 tests, 114 baseline declarations, 23 explicit gaps and 16 requests.
- Both full Suggested files checked sequentially using `lean-check` at Mathlib
  `082e2d3` and Tau Ceti `f790474`: exit 0; scheme 362 and motives 817
  declaration-uses-`sorry` warnings; no errors or other warnings. The added Beck
  application has a real body. These checks certify elaboration, not implementation.
- Preceding reviews are preserved exactly, all node IDs and source issues are
  unchanged, and neither edited packet contains excerpt keys. Scheme mathematics
  is unchanged. File-scope validation: 5 files, 0 problems. `git diff --check` passes.
- Suggested SHA-256: scheme `7d7dd0439924404df02f6ed8f1761e2751b060c04ff98710d7616deb9d4ce66e`;
  motives `4396ba69cb9aa964939a9181f9d19d7b7a7f0f38a29fb3f9b37dbfd509ba65d3`.


No standalone link map or restructuring result is under review. The packet's
embedded stage proposal is inspected above and checked by the packet validator;
there is no standalone input for check_links.py or check_restructure.py.

See [the handoff](../handoff/REV-FIX-RT-AREA-geomlanglands~2.md) for the exact scope
repair and remaining mathematical action. All information needed to resume is
in tracked files; no scratch source or log is required.
