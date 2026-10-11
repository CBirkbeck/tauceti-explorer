# Independent review: accepted planning pass

Issue [#6301](https://github.com/CBirkbeck/tauceti-explorer/issues/6301), job
`REV-AnabelianGeometryAndNonabelianChabauty--NC.3`; Codex, session
`codex-3kESmR`, 2026-10-11. The author was Codex session `codex-9XMBCH`;
this reviewer did not write the input.

The corrected packet is accepted as a finished target-level planning pass.
Its status remains `complete`, NC.3 coverage remains `planned`, and its four
explicit gaps remain open. Acceptance does not close the stage or claim that
its prototypes are proved. Every implementation status remains `unchecked`.

| Item | Result |
| --- | --- |
| Nodes | 22: 8 verified, 14 corrected, 0 added, 0 unverifiable |
| Kinds | 1 definition, 4 constructions, 11 theorems, 5 comparisons, 1 application |
| Baseline declarations | 18 confirmed; 1 added citation, 1 description corrected, none removed |
| API / tests / planets | 35 / 19 / 6 |
| Requests / gaps | 8 / 4 |
| Source findings | 2 confirmed here; the parent's previously reviewed E1 remains inherited |
| Blueprint check | 0 errors, 0 warnings, using the pinned declaration index |
| Suggested Lean | `lean-check` exits 0; 68 warnings, all uses of `sorry` |

The packet's `review.checked` gives a verdict and reason for every node.
`independentReviewAudit` records the source, baseline, supplier and verification
methods and the complete correction list.

## Corrections and their consequences

1. `explicitFiniteQuotientColimit1` has type
   `IsColimit (explicitFiniteQuotientCocone1 G M)`. It is a universal-property
   certificate. The carrier is the cocone's apex, `AddCommGrpCat.of (H1 G M)`.
   Added the cocone definition to the baseline and the comparison's direct
   prerequisites. Reverse-inclusion transitions still go from the U-level
   to the V-level for V≤U. Compact/discrete hypotheses are retained.
2. Replaced the main Kim2009 source with the freely readable version of record.
   The local Selmer argument is section 4, published pp. 127–129, rather than
   section 3. The dimension calculation is on p. 129. All eight affected node
   locators and six downstream-use records now use the correct published
   sections/pages. Original v4 and revised v5 records remain for the version
   comparison. Corrected the Kim2005 title.
3. Specified locally free finite filtration pieces, matching piece ranks,
   locally split universally injective inclusions, and a compatible torsor
   coaction in the affine-torsor comparison. These requirements come from the
   actual filtered algebra construction, not from a point-space homeomorphism.
4. Retained the closed topological embedding required by the imported
   invariant-coset connecting construction. Its verification for each
   coefficient algebra is recorded in G2. The quotient remains the coset
   G-set of bH; normality is not imposed. Clarified [B^G:K]<∞ and added the
   polynomial/product final-topology obligations to G1.
5. Replaced the vague local closedness hypothesis with an explicit sufficient
   induction criterion: over the represented closed lower-condition base,
   universal neutralizations yield finite vector equations
   `ell(x)+b(y)=0` on every algebra. These give closed zero fibres by Yoneda.
   Constructing the neutralizations and verifying this criterion for the
   geometric tower remain G3. The revised unramified induction uses vector
   inertia restrictions and assumes no variety representing nonabelian
   inertia cohomology. An arbitrary morphism image is not used to prove
   crystalline closedness or an all-algebra image statement.
6. Removed the geometric fibre torsor conclusion from the dimension theorem's
   hypotheses. Its global action, invariant vanishing, local addition and
   difference calculation now hold on every coefficient algebra and after
   field extension. Choosing a geometric fibre point produces inverse natural
   maps with the vector Selmer functor; Yoneda identifies the schemes.
   Crystalline invariant lifting is required on `B_cris⊗R`, using `U_cr`
   over the absolutely unramified field. A de Rham point lift alone does not
   give this lift. The period-admissibility request now includes this precise
   all-algebra requirement and the dimension node as a consumer.
7. Added coefficient-family composition and actual mapped-cocycle tests.
   Strengthened the empty/universal Selmer tests so the equivalence's forward
   map must be the inclusion `x↦x.val`; arbitrary equicardinality is insufficient.
   Changed the suggested neutral-locus extensionality statement to the packet's
   iff. All 35 APIs and 19 tests have corresponding active signatures/examples
   or structural projections in the suggested file. Clarified that a trivial
   action identifies Z1 with continuous homomorphisms, while H1 still quotients
   them by constant conjugation.
8. Made the nonzero local cup example's existence argument explicit. Rational
   local duality and its Euler characteristic give
   `dim H1(G_k,Qp)=1+[k:Qp]>0`, since H0 has dimension one and H2 is dual to
   H0(Qp(1))=0. A nonzero class has a dual class with nonzero cup in
   H2(Qp(1))≃Qp. The rational duality supplier already plans this input; the
   separate request is for the continuous cup-convention comparison.
9. Refined G1–G3 and removed the now-completed independent review from the
   remaining-work list. G4 still lists fourteen omitted native geometric or
   inherited signatures. Elaborating the suggested file checks none of those
   omitted statements. No arbitrary `Prop` substitute or new node was added.

## Mathematical and source checks

Freshly read Kim2005 arXiv math/0409456v1, section 1, printed pp. 2–10; Kim2009
v4's cited ranges; the corresponding revised v5 ranges; and the published
Kim2009 introduction pp. 93–95, section 2 pp. 116–119 and section 4
pp. 127–129. URLs, editions, hashes and access date are in `sources` and
`sourceVersions`. The published p. 129 invariant notation was also inspected
in the page image. No restricted source was needed and no source passage was
copied into a deliverable.

The ordered positive defect is b(g)·g(b(h))·b(gh)⁻¹. Centrality and
associativity give the additive Z2 identity. Changing a lift by i(a) adds d1 a;
a continuous primitive of the negative defect corrects it to a cocycle.
Tau Ceti's B2 requires a continuous primitive. This is the inverse of Kim's
printed defect convention and preserves its zero obstruction locus; the sign
comparison is not an erratum. The actual compatible-pair and inflation squares
use unchanged cocycle values and the pinned explicit maps.

The parent named/embedded kernel equivalences transport the invariant action
and its stabilizers. The fibre is classified by its kernel H1 orbits;
translation sends d to d(g)c(g) and targets [c]. No unique kernel class or
ambient H1 injection is inferred. The inherited Kim2005 E1 product correction
is consistent with the central kernel: the factor is H0 of the vector quotient,
not H0 of the previous unipotent stage. Its existing independent attribution
is preserved.

Finite-level representability uses cochain scalar extension, finite vector
cohomology and graded H0 vanishing. The universal obstruction zero fibre may
be singular. A continuous universal primitive supplies the noncanonical
product with vector H1 on all algebras. The invariant-coset induction instead
has a vector H0 kernel and vector H1 obstruction. Selmer representability is a
finite fibre-product theorem for already represented closed local conditions,
including nilpotent coefficients. These are conditional mathematical targets;
G1–G3 retain the work needed to apply them to the geometric tower.

The Heisenberg section gives β(a(g),g·b(h)) in the positive convention. Its
discrete Z² sign check is nonzero because trivial-action d1 on an abelian group
is symmetric, while the coordinate cup takes different values on the two
ordered coordinate generators. The actual local Galois example is supplied
separately by rational duality. It has nonzero graded H0 and is therefore an
obstruction acceptance case, not an example of the H0-vanishing representability
theorem. NC.2 supplies the depth-one geometric Jacobian/path comparison;
rational Jacobian Kummer/local Selmer input is retained in the existing request.

Two newly recorded findings have independent verdicts in this packet:

- **E4:** superseded Kim2009 v4 section 4 p. 25 assumes a variety representing
  nonabelian inertia cohomology in its unramified argument. The correction is
  already in v5 and published section 4 p. 127. The packet uses that correction;
  this finding does not accuse the published argument of retaining the error.
  The v4 homomorphism description also needs the constant-conjugation quotient
  to agree with actual nonabelian H1.
- **E5:** published section 4 p. 129 uses `U_DR` for invariant `B_cr` points.
  Section 2 p. 119 defines their crystalline realization `U_cr` over K0 and
  gives its de Rham scalar extension. The corrected notation keeps the exact
  invariant-lifting hypothesis. The symbol persists in v5 p. 26. The scoped
  search of the arXiv history, publisher, author's publications and correction
  searches found no separate correction. This is a notation misprint, not a
  refutation of the intended dimension theorem.

## Baseline, closure and ownership

Read every referenced declaration at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. The eight unique cited modules were
byte-compared with the shared pinned build. The 18 baseline entries record
what their actual statements supply. No citation was removed and no near miss
was converted into a new node; the cocone citation is the sole addition.

Every direct parent NC.3 and NC.2 reference was resolved. Read the external
carrier-comparison, rational local duality/invariant, unramified and Bloch–Kato
nodes, and the D7, R06.1, R06.2 and L4 stage contracts. The eight requests
name actual missing interfaces rather than duplicate their suppliers. The
coverage audit realizes all NC.3 targets while retaining four exact gaps.
Target-level granularity is appropriate; splitting routine proof calculations
into further nodes would not repair the remaining geometric interfaces.

Read the reviewed `data/library-coverage.json` NC.3 inventory and current
read-only TauCetiRoadmap's JacobianChallenge, ProfiniteCohomology and
ReductiveGroups interfaces. Screened the nine post-snapshot roadmap additions
and current Tau Ceti for overlapping nonabelian, unipotent-cocycle or crystalline
Selmer constructions. Existing native unipotent objects and discrete explicit
cohomology are consumed. Generic compact/rational continuous duality stays in
ArithmeticGaloisDuality D7; vector local conditions stay in
SelmerIwasawaCohomology; filtered algebraic quotients/torsors stay in
ReductiveGroups. No new owner or duplicated layer was introduced. The six
planets identify central constructions and named results and are retained.

## Handoff to the orchestrator

There is no unresolved contradictory node requiring a send-back. Resolve
G1–G3, the eight requests and the fourteen signatures in G4 before closing
NC.3. The present review issue authorizes no change to the reader document.
Assembly must synchronize its older source metadata/locators, cocone wording,
filtered pieces, local vector-equation criterion, all-algebra fibre hypotheses
and test list with this accepted packet. The packet and suggested file record
that coordination requirement explicitly. No parent or NC.2 file was edited.
