# Independent review of crystalline revision 2

**Verdict: needs_changes.** This is a completed independent review of
`BP-CrystallineCohomology--CR.5~2`, job `REV-CrystallineCohomology--CR.5~2`,
issue #7039, by Codex session `codex-I5hOH7`, dated 8 October 2026.
This session authored neither the original blueprint nor its revision.

The revision repairs the previous review's arbitrary comparison objects,
unrelated maps and inadequate geometric tests. Three interface problems remain:
R2, R4 and R5 below. These affect the mathematical content of proposed signatures;
successful elaboration with placeholder proofs cannot resolve them.
The source theorems themselves are not rejected.

The [packet](../packets/CrystallineCohomology--CR.5.json),
[reader](../readmes/CrystallineCohomology--CR.5.md) and
[suggested file](../suggested/CrystallineCohomology--CR.5.lean) were reviewed
together. The packet's current review object contains all individual verdicts;
the previous review object is preserved in `reviewHistory`.

## Inventory and standard applied

There are 88 stable nodes: 22 definitions, 33 constructions, 27 theorems and
six comparisons. The 55 definitions/constructions have 165 API items and
165 named tests, three of each per node. All nodes, hypotheses, proof sketches,
prerequisites, API statements, tests and corresponding suggested signatures were
read. There are 25 baseline declarations, 18 source versions, nine owner requests
and 19 planets. No nodes or planets were added, removed or renamed.

The individual verdicts are 74 verified, two corrected and 12 unverifiable.
Five unverifiable nodes retain existing source-proof gaps; seven concern the
new interface findings. Here verified means that the source-qualified planning
statement, direct inputs and intended API/test slice passed this review,
subject to the explicitly recorded prerequisites. It does not mean implemented,
proved in Lean or independent of the listed open suppliers.

This is a target-level pass. Its status remains complete in the sense of one
finished planning pass. CR.5:log-algebra, CR.5, CR.6 and CR.7 are all planned;
none is closed. Their remaining lists now include the new repairs. There are
seven explicit gaps after adding R2, R4 and R5 to the existing four.
The review does not demand lemma-level decomposition or completion of the
honestly declared supplier stages. The remaining false or insufficiently
qualified interfaces are the reason for needs_changes.

## Findings and corrections

### R1 — fine versus fs base change: corrected

Node `CR.5:log-algebra/chart-base-change` already distinguishes the fine and
fs mathematical categories in prose. Its suggested theorem instead assumed
only integral log schemes and asserted preservation of Kummerness by the same
integralized product used for all five other properties.

Kato §§2.7, 3.3 and 4.6, pp.199, 201 and 209 support the fine product and its
fine base-change claims. The fs tame/Kummer étale application is the one used
by Temkin §1.2.7, p.100 and Theorem 4.2.1, Step 10, p.123.
The suggested theorem now requires fine source, target and base. New auxiliary
signatures construct fsification of that product and its second projection.
`kummerEtale_fsBaseChange` requires fs objects and both Kummerness and log
étaleness, and refers to that fs projection. The unqualified Kummer conjunct
was removed from `logMorphisms_baseChange`.

These are supporting signatures for an existing node, not added roadmap nodes.
Packet notes and the reader card identify the two products explicitly.

### R2 — module-sheaf crystals, tensor evaluation and local nilpotence: unresolved

Affected nodes are `log-crystal`, `log-pd-stratification`,
`crystal-connection-equivalence`, `log-pd-de-rham` and `log-poincare` in CR.5.
The affine `log-connection` and coordinate `log-quasi-nilpotence` nodes are
separate clients and are not rejected merely because the general adapter fails.

Kato Definition 6.1 and Theorem 6.2, p.218, and Beilinson §1.7, pp.8–11 use
module sheaves and their pullbacks on the ambient étale sites. The packet
distinguishes unrestricted crystals from the additional quasi-coherent and
finite locally free properties. However, `LogCrystal.cartesian` represents
pullback by tensor extension of rings of sections on the affine crystalline
basis. Requiring those transitions for every arrow forces quasi-coherent
evaluations; it has not specified pullback for unrestricted module sheaves.
The ring/module PD diagonal and stratification clients likewise need an affine
hypothesis or actual sheaf pullbacks and descent.

`PDConnectionSheaf.connection` gives a connection with target
Γ(U,M) ⊗ Γ(U,Ω¹) for every small-étale object U, including nonaffine U.
The required target is Γ(U,M ⊗ Ω¹), with the tensor formed as a sheaf.
`logPDDeRham.coefficient_tensor` then asserts the corresponding section-tensor
isomorphism without an affine restriction. This is false in that scope.

A discriminating instance is U = P¹ over F_p, p ≥ 2, with trivial log,
the identity PD thickening and M = Frob*O(1) = O(p). This locally free module
has its canonical Cartier connection. Since Ω¹ = O(−2), Γ(U,Ω¹) = 0, whereas
Γ(U,M ⊗ Ω¹) = Γ(U,O(p−2)) is nonzero. Thus the proposed source tensor is zero
and the intended coefficient-form target is not. It cannot be repaired by
renaming the target module while retaining the asserted sheaf interpretation.

Kato Theorem 6.2, p.218 states quasi-nilpotence at stalks, and §6.3,
pp.218–219 supplies the coordinate Taylor/falling-factorial description.
`PDConnectionQuasiNilpotent` currently asks for one bound for a section on
each arbitrary étale U. On a possibly non-quasicompact object, stalkwise or
local bounds do not provide that uniform bound. Restricting to an affine
basis still requires justification of the precise module/finite-generation
scope and locality argument.

Required repair: implement sheaf pullbacks, sheaf coefficient tensors and local
quasi-nilpotence, or declare a mathematically justified affine/QC slice with
descent. If choosing the latter, restrict the crystal/connection equivalence
to matching QC categories, and retain a separate plan for the unrestricted
target. Reuse this adapter in PD de Rham and Poincaré, rather than introducing
incompatible coefficient objects. Kato Theorem 6.4, p.219 and Beilinson
Theorem 1.8, pp.11–12 remain the valid Poincaré targets.

Review comments locate these declarations in Lean; an explicit gap and the
CR.5 remaining list record the repair. Suggested notes and reader cards agree.
The affected signatures remain visible as unresolved prototypes.

### R3 — bounded-below support nonfactorization: corrected

Node `CR.6/tube-proper-support` uses Disegni–Liu Definition B.1 and
Remark B.2, PDF p.113. Support is imposed on the tube before derived
specialization. The remark rules out the indicated general factorization
through a functor on bounded-below derived categories; it does not rule out
every arbitrary functor on an unrestricted unbounded category.

The `wrong_order` test formerly asserted the latter stronger statement.
`SpecialBoundedBelow` now uses vanishing homology below an integer bound.
The excluded candidate functor must preserve those objects. A candidate with
the displayed natural isomorphism would therefore restrict to the forbidden
bounded-below factorization. The packet test and reader card now state this
qualification. The actual exact support kernel and order of the two functors
are retained.

### R4 — admissible residue embedding geometry: unresolved

Node `CR.6/sato-residue-variant` follows the admissible embedding construction
in Disegni–Liu Appendix B.1 (admissible embeddings), PDF pp.114–115,
and B.2 (residue bridge), PDF p.118, together with Sato Definition 8.3,
Proposition 8.4 and Proposition 8.6, pp.211–213.
In degree zero the DL lift Z⁰ is flat and generically smooth over W[t],
smooth over W, and its t=0 fibre Y⁰ is a relative strict normal crossings
divisor over W. The log structure is exactly the one from that divisor.
The special fibre is formed using this W[t] structure and the prescribed
log point; higher embedding levels are built compatibly from degree zero.

`AdmissibleTubeEmbedding` records a flat finitely presented algebraic map,
an arbitrary SNC boundary, a log identification and a generic-fibre
smoothness predicate. It does not assert smoothness of the lift over W,
generic smoothness over W[t], the relative t=0 divisor condition, or equality
with that divisor log structure. Its mod-p special-fibre identification uses
an unrelated family adapter, rather than the actual displayed map. Smoothness
of a K-generic fibre is a different condition from this source setup.

Required repair: encode the specified degree-zero lift and its actual fibre
and divisor log, then the compatible higher embedding system. Connect the
residue construction and support comparison to that system. Ordinary
boundary carriers remain R09.7a-owned; analytic embedding machinery remains
the requested RD Part II input. This is not a request to duplicate either.
The WΛ complex with the q+1 weight quotient is correctly treated as a
coefficient complex/module, rather than an unsupported differential graded
algebra identification. The defect is the geometry needed for its bridge.

The packet and reader now record the gap and CR.6 remaining work, and the
Lean structure carries a review comment listing the absent conditions.

### R5 — geometric rational coefficients and sheaf filtrations: unresolved

Node `CR.7/filtered-frobenius-coefficients` is a geometric coefficient
interface. R06.2's actual stage provides filtered (φ,N) modules, their
period/admissibility framework and normalization conventions. It does not
construct crystals on each semistable model or their de Rham evaluation.
The former attribution was corrected in the packet, reader and Lean comments.

The geometric rational category belongs to CR.5/CR.7: compatible completed
finite locally free crystals followed by inversion of p, with geometric
Frobenius/model pullback and de Rham evaluation. `RationalCoefficientCrystal`
and its evaluation currently have only nominal types. They have no specified
adapter to those already-planned crystal objects. The filtration in
`ArithmeticCoefficientData` consists of global module submodules; its
`locallySplit` field requires global complements. That does not express a
locally split sheaf filtration on an arbitrary nonaffine generic fibre, nor
does the displayed global connection define sheafwise transversality there.

Required repair: specify the geometric category and adapters, the de Rham
sheaf, the locally split filtration and Griffiths transversality, and their
model pullback/Frobenius compatibility. An affine prototype must declare its
scope and the descent required for the full target. De Jong §§2.2.1–2.3.4,
pp.18–22, and Theorem 3.2.1, pp.32–34 support the compatible crystalline and
connection framework; they do not remove these missing adapters.

The Nφ = pφN relation, p^(−r) Frobenius twist and filtration shift remain
correct. R06.2 remains the single supplier of their period normalization.
The local ownership correction is complete; the adapter/filter repair is
recorded as a gap and CR.7 remaining work.

## Previous review reconciled

The revision was checked against the whole previous review, including its
individual notes. The following improvements are retained:

| Previous problem | Revision-2 result |
|---|---|
| Strictness, chart criterion, QC log smoothness, Cartier type | Actual pulled-back log sheaf, chart neighborhoods, fine models, canonical toric map and relative Frobenius replace unrelated predicates/maps. The prime-to-p/p-root distinction and non-fine examples exercise them. |
| Arbitrary crystalline-site/crystal category equivalences | Geometric forgetful/site and PD evaluation functors replace arbitrary categories. The unrestricted/QC and sheaf connection boundary still needs R2. |
| Arbitrary PD smoothness or unrelated derived comparison objects | Coordinate PD envelopes, geometric de Rham complexes and specified canonical comparisons are present. The base PD extension and J+I compatibility are retained. |
| Arbitrary inverse-limit function | A coherent finite-level tower and explicit generic DD.1 export are requested. The earlier source-proof/interface gap remains honest; a bare sequence is no longer the contract. |
| Arbitrary HK module finiteness, monodromy boundary and exponential maps | Actual proper cohomology, oriented absolute/relative de Rham boundary and unit-change comparison maps constrain the clients. HK Theorem 5.1, pp.262–263 fixes the plus log(u)N convention. The geometric Tate valuation still has its separate source gap. |
| Stein comparison on arbitrary topological modules | Actual semistable exhaustion geometry, completed unramified coefficients and requested strict Fréchet/ind-Fréchet tensor/limit inputs replace it. Arithmetic Galois transport is semilinear. |
| Arbitrary Messing and Gauss–Manin maps | Evaluation, Hodge maps, the filtered de Rham boundary, induced differential and geometric pullback are specified. R07.2's missing general crystalline functor is requested explicitly. |
| Tests detached from their named object | Envelope coordinates, connection curvature, geometric good reduction, Dieudonné evaluations/F,V, tensor/form comparisons and canonical Gauss–Manin maps now appear. The Tate matrix is explicitly a normalization test pending its geometric identification. R3 corrects the support test's scope. |
| Wrong source locators/title and ownership cycle | The corrected source register is retained. CR.3 supplies generic products, AI.0:integral supplies the tilt prefix, CR.0 owns common A_cris, and downstream R06.5 is not a supplier of CR.6. R5 further clarifies R06.2's role. |

No former arbitrary zero-versus-nonzero comparison signature was found still
standing in its original form. The remaining findings concern the meaning and
scope of the newly introduced geometric interfaces.

## Sources and source issues

All 18 acquired public source versions were checked against their recorded
hashes. Reading focused on the node locators and their proof/hypothesis context,
not an assertion that every paper was read in full. The Beilinson §1.7 equivalence-theorem locator in node 45 was corrected
from pp.8–10 to p.11, where the theorem actually appears. The packet records the
actual sections consulted in `independentReviewReadSections` and retains the
exact public URLs in `sources` and `sourceVersions`. The claims below and
the node table give section, theorem and printed/PDF page locators in our own
words. No passages or source files are included in this submission.

The four source-issue records were independently rechecked and remain
confirmed, with the current review job named in each verdict:

| Issue | Independent check |
|---|---|
| E7051 | BO Appendix B2.1 and both pages of the official 21 August 2013 erratum require the corrected projective replacement argument. A derived equivalence does not provide a degreewise surjection onto an arbitrary original tower. Preserve the bounded-above/projective hypotheses. |
| E7052 | Qian v1 Theorem 3.2, PDF pp.14–18: the setup lacks properness while the proof's final finiteness/proper-base-change steps use it. The packet keeps properness. The separate potential-automorphy publication is not a corrected version of this theorem. |
| E7053 | BKV Remark 2.4(1), p.6: the difference expression allows q′=q, p=0 even for 0→N. The sum expression is the inverse condition in the quotient and rejects that nonvertical example. |
| E7054 | Kato p.222: the introduction's 6.11 and the final theorem heading's 6.12 label the same Künneth formula. Both labels were visually checked. No mathematical change follows. |

No new paper error is alleged. R1–R5 are blueprint/signature issues.
Existing proof gaps remain for the log-regularity proof cited through Thompson
Theorem 3.14, p.32; the complete logarithmic Abhyankar input used by Temkin
Step 10, p.123; the nonnoetherian formal-boundary approximation chain; the
geometric Tate monodromy coefficient; and the generic enhanced Rlim interface.
They are not silently filled by reading a theorem's statement or application.

## Pinned baseline, ownership and closure

Pins are Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. All 25 actual declaration
statements and surrounding hypotheses were read at those commits. No baseline
citation was removed, replaced or added in this review. Their checked fields
record the independent recheck. The source-wide absence searches in the
baseline audit are corroboration, not a substitute for reading these statements.

| Baseline declarations | What they supply and their boundary |
|---|---|
| `Scheme.smallEtaleTopology` | The ordinary small étale site, on which the planned log sheaves are built. |
| `Algebra.GrothendieckGroup`, `.lift`, `.of_injective` | Commutative-monoid groupification and its universal map; injection requires cancellation. |
| `DividedPowers` | Existing ideal PD operations; compatible base maps and envelopes remain CR.0 inputs. |
| `ExteriorAlgebra`, `.ι_sq_zero` | Exterior algebra and generator-square vanishing, including characteristic two. |
| `WittVector`, `.frobenius`, `.frobeniusEquiv`, `.teichmuller` | p-typical vectors, prime/characteristic-p Frobenius and perfect-ring equivalence. Teichmüller is multiplicative and is not additive. |
| `TauCeti.nilpotentExpUnit`, `IsNilpotent.exp` | Finite nilpotent exponentials in rational associative algebras; nilpotence supports the unit result. This is not an infinite analytic exponential. |
| `KaehlerDifferential`, `.D` | Ordinary commutative-algebra differentials and universal derivation; log relations are added here. |
| `ModuleCat`, `GrothendieckTopology` | Module category and site foundations. |
| `DerivedCategory` | Ordinary unbounded derived categories with the specified existence assumptions; no enhanced coherent tensor/limit API follows. |
| `PresheafOfModulesOfCommRing`, `ModuleCat.extendScalars` | Ring-presheaf modules and tensor scalar extension. They do not identify section tensors with sheaf tensors on nonaffine objects. |
| `HasLiftingProperty` | Categorical lifting squares, after actual geometric arrows/test classes are supplied; no local-to-global lifting implication. |
| `Ind`, `Ind.lim` | Ind-objects and the functor from a coherent small filtered diagram, via Yoneda colimit. No analytic Fréchet or completed-tensor property follows. |
| `DividedPowerAlgebra`, `.dp` | The existing quotient algebra and divided-power generators; its carrier alone does not assert the augmentation ideal's canonical PD structure. |

The current reviewed library-coverage data contains no CrystallineCohomology
stage entries. No positive coverage verdict is inferred from that absence.
The integrated decomposition covers CR.4; it supplies no replacement IDs in
this packet's scope. The current atlas still owns common PD/A_cris in CR.0.
RS-01 has an accepted earlier review but its latest review is pending; this
review follows the integrated structure, without applying a pending proposal.

Every external supplier reference was checked against the actual supplier
statement. CR.0–CR.4 supply ordinary PD/crystals/Poincaré/finiteness/products
and de Rham–Witt, with a log Witt/Sato extension distinguished explicitly.
EDS:E1 supplies enhanced categorical machinery; E2's bounded-below descent
keeps its uniform-bound scope. DD.1's completion localization does not supply
generic Rlim. AI.0:integral owns tilt/sharp/A_inf; AI.6 owns specialized AΩ
comparisons. Adic F0/R2/F1 and upstream adic objects are imported unchanged.
RD.4/RD.5's existing ordinary rigid results do not supply tube proper support
or strict Stein limits; their requested Part II builds on the adic foundations.
R07.2's standard Dieudonné modules over a perfect residue field do not supply
the general crystalline/Messing functor. R06.1 owns period coefficients and
unit-log/Galois interfaces; R06.2 owns filtered (φ,N) normalization.
R09.7a and LPV.5 retain their boundary/tame-cover ownership.

All nine requests are precise consumer contracts and remain necessary. No
second construction of their generic objects is added here. R5 corrects a
local geometric category attribution while keeping its legitimate R06.2
normalization request. No new dependency cycle was found.

RT-AREA-padic-2/14 is addressed at planning level by the Beilinson integral
quasi-coherent log branch: finite-level envelopes, site, PD smoothness,
Poincaré, uniquely p-divisible lift and A_cris log structure. The proposed
CR.5:qc-crystalline substage and AI.6 dependency preserve that remedy.
The formal-boundary proof gap and R2 adapter repair remain explicit. This
submission does not edit upstream roadmaps, their links, or integrated atlas data.

## API, tests, suggested file and planets

Every API item and all three tests per definition/construction were checked
for a useful operation or discriminating instance, including zero-image log
charts, cancellation/saturation, root torsion, coordinate PD derivatives,
curvature, Frobenius p-factors, unit change, Tate orientation, semilinear
Galois transport and filtration shifts. The outstanding gaps affect the
general interfaces even though their affine/local examples are meaningful.
A count of three tests alone is not used as mathematical acceptance evidence.

All 165 API names and 165 test markers are present in the suggested file.
Supplementary signatures remain supporting clients of existing nodes.
All implementations remain unchecked; placeholder proofs are explicit.
The Tau Ceti nilpotent-exponential wrapper was read at its pin; its underlying
Mathlib operation is used because that wrapper is unbuilt in the shared check
environment. No private Lake project or library rebuild was used.

The 19 planets occupy the four stages in counts 6/5/5/3. Their names are
central definitions, constructions or named theorems, below the protocol's
length bound. Source locator labels are not used as planet names. No planet
changes were needed.

## Validation and changes made

Validation results are recorded after the final edits: the packet checker
reports zero errors and zero warnings; the suggested file elaborates at the
pinned shared build with only placeholder-proof warnings; the source hashes,
stable-ID inventory, API/test markers and reader cards pass reconciliation;
`git diff --check` passes. Typechecking does not certify any source theorem.

Edits are confined to the three reviewed files, this report and the required
job handoff. Changes are R1/R3 signatures and test scope; R5 ownership notes;
R2/R4/R5 review comments, gaps and stage remaining lists; individual review
verdicts and source/baseline/source-issue rechecks; and reader reconciliation.
The node-45 Beilinson theorem locator was corrected to p.11.
Reader source labels now say locators, and stale text requesting a fresh review
has been replaced with this review's actual verdict. Prior author validation
in `revisionAudit` remains dated provenance, not a claim about this submission.

## Orchestrator follow-up

Queue a revision for the concrete repairs R2, R4 and R5. No maintainer decision
is needed before recording this completed needs_changes verdict. The next
worker should choose and justify the unrestricted-sheaf versus affine/QC
prototype boundary, while preserving the packet's full mathematical targets.
Keep existing source gaps and nine owner requests until their inputs are
actually supplied; do not close stages on successful placeholder elaboration.
The current proposed qc-crystalline substage and RD Part II remain proposals
for their normal integration process.

## Individual node verdicts

Node numbers follow the stable packet order. The full ID is retained in the
packet review object; suffixes below are relative to CrystallineCohomology.

| # | Node | Verdict | Evidence and qualification |
|---|---|---|---|
| 1 | `CR.5:log-algebra/prelog-ring` | verified | Kato §1.1, pp.192–193: the carrier permits zero images; the commuting ring/monoid maps and zero-chart, trivial-chart and unit-only tests distinguish a prelog ring from a unit chart. |
| 2 | `CR.5:log-algebra/log-structure` | verified | Kato §1.2, p.193: the actual small étale site, monoid sheaf and inverse-image-of-units isomorphism are present. The rank-zero and standard log point tests distinguish trivial logs from zero-image charts. |
| 3 | `CR.5:log-algebra/associated-log` | verified | Kato §1.3, pp.193–194: the pushout along units and its adjunction are appropriate. Tests include both an already logarithmic input and a zero-image generator. |
| 4 | `CR.5:log-algebra/log-pullback` | verified | Kato §1.4, p.194: inverse-image logification, identity/composition and chart pullback use the scheme map; chart restriction is not ordinary tensoring of log sections. |
| 5 | `CR.5:log-algebra/characteristic-monoid` | verified | Kato §1.4, p.194 and §2.4(3), p.197: sharp quotient and group quotient by the image of units are separated. The forward integral comparison does not claim its false converse. |
| 6 | `CR.5:log-algebra/integral-monoid` | verified | Kato §§2.2–2.4, p.197: cancellation and injection into the existing groupification agree, including the noncancellative test. |
| 7 | `CR.5:log-algebra/fine-monoid` | verified | Kato §§2.1–2.4, p.197: finite generation together with integrality is explicit. The rational nonnegative chart is a useful non-fine example. |
| 8 | `CR.5:log-algebra/saturated-monoid` | verified | Thompson Definition 1.6, p.7: saturation is tested in the groupification; the numerical monoid example detects holes. Saturation is not substituted for the invertible-torsion chart condition. |
| 9 | `CR.5:log-algebra/log-chart` | verified | Kato Definition 2.9 and Lemma 2.10, pp.199–200: a global chart is distinguished from étale-local chart existence, and the criterion later localizes both schemes. |
| 10 | `CR.5:log-algebra/strict-morphism` | verified | Kato §1.4, p.194 and Proposition 3.8, p.203: strictness is the actual inverse-image log isomorphism. Identity, composition and agreement with ordinary smoothness form the expected API. |
| 11 | `CR.5:log-algebra/exact-morphism` | verified | Kato Definition 4.6, p.209: the groupification square defines exactness. Strict and diagonal/root-chart examples test the condition rather than identifying it with injectivity. |
| 12 | `CR.5:log-algebra/integral-morphism` | verified | Kato Proposition 4.1 and Definition 4.3, pp.207–209: the chart equation criterion for integral monoid maps is retained; the scalar-algebra and base-change API is source-qualified. |
| 13 | `CR.5:log-algebra/kummer-morphism` | verified | Kummer injections and powers landing in the image are separate from log étaleness. The prime-to-p and p-root tests preserve the missing invertibility distinction; Temkin §1.2.7, p.100 supplies the tame chart use. |
| 14 | `CR.5:log-algebra/integral-log-fiber-product` | verified | Kato Proposition 2.7, p.199: integralization follows the ordinary log product and fsification can change the scheme. The universal-property client is for integral test objects; the strict underlying-product specialization is legitimate. |
| 15 | `CR.5:log-algebra/log-smooth` | verified | Kato §3.3, p.201: lifting is étale-local, and finite presentation is explicit. The square-zero formulation supplies the fine finite-presentation slice used by the chart criterion. |
| 16 | `CR.5:log-algebra/log-smooth-chart-criterion` | verified | Kato Theorem 3.5 and Remark 3.6, p.202: source/base neighborhoods, kernel/torsion invertibility and the canonical toric map are typed. The ordinary smooth toric map is justified by Remark 3.6; the étale variant keeps its stronger group condition. |
| 17 | `CR.5:log-algebra/chart-base-change` | corrected | R1: narrowed the prototype to fine log schemes and separated the fs Kummer étale projection from the integralized product. Kato §§2.7, 3.3, 4.6, pp.199, 201, 209 justify the fine scope; Temkin §1.2.7, p.100 and Step 10, p.123 use the fs Kummer étale case. No theorem for Kummerness alone on this integral product is asserted. |
| 18 | `CR.5:log-algebra/divisorial-log` | verified | Nizioł Proposition 2.6, pp.4–5 and Temkin §1.2.7, p.100 support the divisorial sheaf and SNC application. The ordinary regular/SNC geometry stays with R09.7a; the cusp example prevents an arbitrary-boundary fineness claim. |
| 19 | `CR.5:log-algebra/log-regularity` | verified | Nizioł Definition 2.2 and Lemmas 2.3–2.4, pp.2–3 give the fs local regular-quotient/dimension condition and the étale/Zariski reconciliation. The prototype is limited to the noetherian setting. |
| 20 | `CR.5:log-algebra/log-smooth-over-log-regular` | unverifiable | Thompson Theorem 3.14, p.32 states the target and cites Kato Toric singularities Theorem 8.2. The completed-local proof is still explicitly unread in the existing gap; the theorem is not counted as source-decomposed or closed. |
| 21 | `CR.5:log-algebra/log-abhyankar` | unverifiable | Temkin Theorem 4.2.1, Step 10, p.123 uses this tame extension, but does not supply its complete proof. The packet correctly requests the LPV.5 input and retains the fs descent/proof gap. |
| 22 | `CR.5:log-algebra/qc-log-scheme` | verified | Beilinson §1.1, pp.2–3 distinguishes integral quasi-coherent logs from fine logs; BKV §2.1, pp.5–6 uses that category. The rational-characteristic example enforces the distinction. |
| 23 | `CR.5:log-algebra/qc-log-smooth` | verified | BKV Definition 2.1, p.6: the local fine source and base models with integral base-change identification are explicit. This is the source definition for the non-fine branch, not an assertion of arbitrary non-fine formal smoothness. |
| 24 | `CR.5:log-algebra/fine-model-descent` | verified | BKV Proposition 2.2 and proof, p.6: finite presentations descend along filtered fine charts and a common model handles a morphism. The prototype specifies local neighborhoods and a compatible map, not only an existence label. |
| 25 | `CR.5:log-algebra/vertical-log` | verified | BKV Definition 2.3/Remark 2.4, p.6: the quotient is a group. The corrected sum criterion q+q'=phi(p) passes the 0→N negative example; E7053 is confirmed. |
| 26 | `CR.5:log-algebra/valuation-log` | verified | BKV Lemma 2.6/Notation 2.5, p.7: sharp identifies valuation quotients and yields the tilt chart. Integral tilt/sharp/A_inf constructions are imported from AI.0:integral; this node only adds the log chart. |
| 27 | `CR.5:log-algebra/formal-semistable-log` | unverifiable | BKV Definitions 2.7–2.8, p.7 and Koshikawa Example A.1(2)–(3), p.50 support the finite-model semistable statement. The full nonnoetherian divisorial identification proof chain remains an existing gap; arbitrary O_C models are not admitted. |
| 28 | `CR.5/log-differentials` | verified | Kato §§1.7–1.9, pp.195–196 give the universal log derivation and the ordinary-plus-groupification quotient. Affine signatures retain the dlog compatibility and base-chart relations. |
| 29 | `CR.5/log-de-rham` | verified | Kato §1.9, p.196: the exterior complex uses the canonical derivation, differential and wedge. The characteristic-two exterior-square test correctly relies on the existing ExteriorAlgebra API. |
| 30 | `CR.5/semistable-log-forms` | verified | CK §5.10, pp.36–37 gives the semistable dlog sum relation and dual derivations; Kato §1.9 supplies the ordinary algebraic analogue. The finite chart tests preserve the rank reduction and p-factor under Frobenius. |
| 31 | `CR.5/semistable-residues` | verified | Kato §1.9, p.196 and Sato Proposition 8.4, pp.211–212 justify the absolute ordered residue construction. The packet separates the relative sum relation from absolute residues, where the diagonal log direction survives. |
| 32 | `CR.5/log-reduction-completion` | verified | Koshikawa Example A.1, p.50 and CK §§5.9–5.11, pp.36–37 give the finite semistable reduction/completion slice. The suggested reduction tower/cone is tied to that presentation; it does not claim arbitrary completion commutes with forms. |
| 33 | `CR.5/cartier-type` | verified | Kato Definition 4.8, p.210 and HK §2.12, pp.231–232: integrality and exact relative Frobenius define Cartier type. The ramified prime-to-p example correctly shows that log smoothness alone is insufficient. |
| 34 | `CR.5/log-cartier-isomorphism` | verified | Kato Theorem 4.12 and §§4.13–4.14, pp.212–214: the characteristic-p fine Cartier-type hypotheses and inverse Cartier generators match the target and tests. |
| 35 | `CR.5/log-exactification` | verified | Kato Proposition 4.10, pp.210–211 supplies local exactification of a fine log closed immersion. Source neighborhoods, unchanged source log and log-étale ambient maps are specified; common refinement is not a global uniqueness assertion. |
| 36 | `CR.5/log-pd-envelope` | verified | Kato §§5.3–5.8, pp.215–217: the universal PD extension may change the source in general; the source-PD-extension case fixes it. The prototype extends both ambient/source data and never infers compatibility from J alone. |
| 37 | `CR.5/qc-log-pd-envelope` | verified | Beilinson §1.3, pp.4–6 proves envelopes in the integral quasi-coherent p-nilpotent setting. CK footnote 11, p.45 confirms the missing uncompleted mixed-characteristic envelope is not imported as a theorem. |
| 38 | `CR.5/log-pd-thickening` | verified | Beilinson §§1.2–1.3, pp.3–6: the exact closed thickening and compatible PD structure on J+I O_T are explicit. Uniform nilpotence of J is not demanded; the common base extension is retained. |
| 39 | `CR.5/log-pd-smooth` | verified | Beilinson §1.4, pp.6–7: global lifting for affine sources, coordinate envelopes and retracts match PD smoothness. The locality-caveat test does not infer PD smoothness from an arbitrary étale cover. |
| 40 | `CR.5/log-crystalline-site` | verified | Kato §§5.2, 5.9, pp.215–217 and Beilinson §1.5, pp.6–7 give the affine-basis crystalline site, ambient étale covers and structure sheaf. The proposed ordinary-site comparison uses the geometric forgetful functor, with trivial base and source logs. |
| 41 | `CR.5/log-crystal` | unverifiable | R2a: the packet states all module-sheaf crystals (Kato Definition 6.1, p.218; Beilinson §1.7, p.11), whereas LogCrystal.cartesian uses tensor extension of global sections on the affine basis. This forces quasi-coherent evaluations and has not implemented unrestricted sheaf pullback. Label a QC slice or provide the full sheaf category, and match the target of node 45. |
| 42 | `CR.5/log-pd-stratification` | unverifiable | R2a: the identity/cocycle equations follow the PD diagonal, but pdDiagonalDiagram and LogPDStratification use global rings/modules for unrestricted T. Kato Proposition 6.5 and §§6.6–6.7, pp.219–220 and Beilinson §1.7, pp.8–11 require sheaf pullbacks, or an explicit affine/QC slice with descent. The missing slice declaration is now called out. |
| 43 | `CR.5/log-connection` | verified | Kato §6.2, p.218: the affine/prelog connection client has the Leibniz rule, canonical coefficient differential, curvature and horizontal maps. Its two-variable d+x dy example has nonzero dx∧dy curvature. The defective general sheaf adapter is node 45, not this affine definition. |
| 44 | `CR.5/log-quasi-nilpotence` | verified | Kato §6.3, pp.218–219: falling factorials for logarithmic operators and ordinary Taylor operators are retained for all multiindices. Integrability is required for coordinate independence, and the formal version uses complete modules and actual reductions. Its global-section formulation is only the stated coordinate client; R2b separately affects the sheaf predicate at node 45. |
| 45 | `CR.5/crystal-connection-equivalence` | unverifiable | R2b: PDConnectionSheaf uses Gamma(M) tensor Gamma(Omega) on every small-étale object, including nonaffine ones; PDConnectionQuasiNilpotent asks for a uniform bound on arbitrary U. Kato Theorem 6.2, p.218 and Beilinson §1.7, p.11 use sheaf tensors and stalkwise quasi-nilpotence. The P1/F_p Cartier-connection counterexample in the report rules out the present general interface. The Beilinson theorem locator was also corrected to p.11. |
| 46 | `CR.5/log-pd-de-rham` | unverifiable | R2b: logPDDeRham.coefficient_tensor asserts a section-tensor isomorphism for every U. On P1/F_p, M=Frob*O(1)=O(p) gives Gamma(Omega1)=0 but Gamma(M tensor Omega1)=Gamma(O(p-2)) nonzero. The PD derivative and filtration are correct (Beilinson §1.7, p.8), but coefficient terms require the same sheaf/affine repair as node 45. |
| 47 | `CR.5/log-poincare` | unverifiable | The mathematical Poincaré target is Kato Theorem 6.4, p.219 and Beilinson Theorem 1.8, pp.11–12, but the proposed comparison evaluates the unresolved PDConnectionSheaf/crystal adapter. Repair R2 before treating this prototype as the source comparison; its source theorem is not in doubt. |
| 48 | `CR.5/embedding-descent` | verified | HK §§2.17–2.23, pp.235–241 and Beilinson §1.6, pp.7–8 give embedding descent. The prototype uses actual augmented simplicial log schemes, strict étale matching maps and PD embeddings. EDS:E2 supplies bounded-below descent with its uniform bound; no unbounded/replete descent is claimed. It remains dependent on R2 for coefficient applications. |
| 49 | `CR.5/p-adic-log-crystalline` | verified | Beilinson §1.12, pp.16–17: a coherent finite-level tower and enhanced Rlim precede p-adic comparison. The DD.1 generic-Rlim request is still open and accurately distinguishes completion from arbitrary limits. The point and lim-one tests now use fixed towers rather than arbitrary functions. |
| 50 | `CR.5/unique-p-divisible-lift` | verified | Beilinson §1.17 lemma/proof, pp.25–26: integral quasi-coherent characteristic-p source, uniquely p-divisible sharp quotient and compatible p-nilpotent PD thickening are included. The uniqueness assertion is about lifts over the actual thickening. |
| 51 | `CR.5/a-cris-log` | unverifiable | CK §5.2, pp.32–33 and Beilinson §1.17 give the actual finite-level A_cris log lift. Common CR.0/AI.0 ownership is correct; the existing gap still withholds the complete non-fine formal-boundary/chart proof chain. |
| 52 | `CR.6/log-witt-base` | verified | HK §3.1, p.242: the Witt log generator maps to zero, not p. Existing Witt vectors and the CR.4 finite quotients/(p)-PD structure are imported; the two charts are tested separately. |
| 53 | `CR.6/integral-hk` | verified | HK §§3.1–3.2, pp.242–243 and Beilinson §1.12, pp.16–17: integralHK is the coherent p-adic crystalline construction on an actual fine smooth integral Cartier-type HKSpace, with a compatible embedding-model client. |
| 54 | `CR.6/rational-hk` | verified | HK §3.2, p.243: rationalization is the actual scalar functor to W(k)[1/p], with torsion disappearance and point tests. It is no longer quantified over an arbitrary replacement functor. |
| 55 | `CR.6/hk-frobenius` | verified | HK §§2.23–2.24, pp.241–242 and CK §5.10, p.37: actual Frobenius pullback induces the operator, Witt semilinearity is explicit and a logarithmic q-form receives p^q. |
| 56 | `CR.6/hk-monodromy` | verified | HK §§3.1–3.6, pp.242–246: the right-wedge dlog(t) triangle, canonical boundary and cohomology identifications are specified. Refinement compatibility uses geometric maps; the earlier arbitrary boundary/isomorphism claims are removed. |
| 57 | `CR.6/n-phi-relation` | verified | HK §§3.4–3.6, pp.244–246: N phi=p phi N is stated for the geometric Frobenius and monodromy, rather than recovered from an assumed HKModule relation. The coefficient/twist clients use that established normalization. |
| 58 | `CR.6/hk-finiteness` | verified | HK Theorem 3.2, pp.242–243 retains properness, fine smooth integral Cartier-type source and perfect residue field. Finiteness and Frobenius isogeny refer to the actual HKSpace, not arbitrary infinite-dimensional modules. |
| 59 | `CR.6/hk-nilpotence` | verified | HK Theorem 3.2, p.243: the abstract proof slice assumes finite dimension, bijective semilinear Frobenius and a valuation-preserving coefficient automorphism with 0<\|p\|<1. These justify the characteristic-polynomial deduction; no infinite-dimensional implication is used. |
| 60 | `CR.6/log-de-rham-witt-model` | verified | HK §§4.19–4.20, pp.260–262 identifies the actual log de Rham–Witt model. The current CR.4 ordinary BLM packet is a near miss; the log/absolute Witt extension is explicitly imported and requested, not silently supplied by ordinary Witt vectors. |
| 61 | `CR.6/unit-logarithm` | verified | HK §5.5, pp.265–266: the normalized complete-DVR unit logarithm and Teichmüller section are actual arithmetic-frame inputs. The principal-unit series and torsion tests distinguish it from an arbitrary characteristic-zero homomorphism. |
| 62 | `CR.6/hk-comparison-map` | verified | HK §§5.1–5.5, pp.262–266: the map is indexed by the semistable model, coefficient scalar extension and uniformizer. Pullback, generic-log identification and point/good-reduction tests concern those constructed objects. |
| 63 | `CR.6/hk-comparison` | verified | HK Theorem 5.1 and Lemma 5.2, pp.262–264: proper fine semistable/Cartier-type hypotheses constrain the actual comparison. Neither arbitrary derived targets nor a bare family of linear isomorphisms appears. |
| 64 | `CR.6/uniformizer-change` | verified | HK §5.5, pp.265–266: with the fixed right-wedge convention the formula uses exp(log(u)N). It is stated for the geometric comparison and monodromy; the finite factorial exponential reuses the pinned library. |
| 65 | `CR.6/hk-products` | verified | Kato final Künneth theorem headed 6.12, p.222 and BKV Remark 3.12, p.18: actual products/cup maps and operator/comparison compatibility are present. CR.3 supplies ordinary Künneth; this node adds its logarithmic adaptation. The source's qcqs theorem permits this proper specialization. |
| 66 | `CR.6/hk-good-reduction` | verified | HK §§3.1–3.3, pp.242–244 and §5.5, pp.265–266: the smooth good-reduction specialization identifies ordinary crystalline cohomology and makes the boundary zero. The generic comparison then becomes uniformizer-independent; it is not merely exp(a·0)=1. |
| 67 | `CR.6/hk-tate-curve` | unverifiable | HK §1.4–1.5, pp.225–226 supplies the valuation/boundary normalization, but the packet retains the missing geometric Tate-curve residue calculation for v_K(q). The improved geometric prototype and rank-two test do not close that source gap; R06.5 is correctly downstream. |
| 68 | `CR.6/qian-family-model` | verified | Qian Theorem 3.2 and proof, PDF pp.14–18: the actual one-parameter family and completed log de Rham model now include the properness invoked in the proof. E7052 is confirmed specifically for v1, without attributing this defect to the separate published potential-automorphy article. |
| 69 | `CR.6/convergent-log-complex` | verified | DL Appendix B.1, PDF pp.113–115: relative and absolute tube-form complexes are distinct named constructions and refinement uses actual common embeddings. The convergent series test distinguishes tube functions from dagger functions. RD.4 Part II remains an explicit supplier request. |
| 70 | `CR.6/tube-proper-support` | corrected | R3: DL Definition B.1/Remark B.2/Lemma B.3, PDF pp.113–114 place the support kernel on the analytic tube before specialization and use D+. The negative test now additionally requires a proposed special-fibre functor to preserve bounded-below objects; it no longer claims the source excludes every unbounded functor. |
| 71 | `CR.6/convergent-monodromy-triangle` | verified | DL triangles (B.1)–(B.2), PDF pp.115–116: the actual supported relative/absolute objects, right-wedge map and boundary give the triangle. Frobenius compatibility uses these maps, rather than a pre-assumed abstract relation. |
| 72 | `CR.6/convergent-witt-comparison` | verified | DL equation (B.5), PDF p.117: the strict-semistable rational convergent/log-Witt comparison is the specified map. It is correctly not called Lemma B.5, which is a different support result. CR.4/RD.4 exports remain explicit prerequisites. |
| 73 | `CR.6/sato-residue-variant` | unverifiable | R4: Sato Definition 8.3/Propositions 8.4 and 8.6, pp.211–213 and DL B.1–B.2, PDF pp.114–115, 118 give the q+1 residue quotient and module structure. AdmissibleTubeEmbedding omits smooth-over-W, generic smoothness over W[t], relative SNC t=0 fibre and its divisor log. Its K-generic map and unrelated mod-p family identification do not express the source setup. |
| 74 | `CR.6/proper-log-rigid-hk` | verified | Grosse-Klönne Theorem 3.4 and §3.11, pp.16–19 and BKV Remark 3.4(2), p.16 give the proper semistable rigid/crystalline comparison. The prototype indexes the actual special fibre and keeps properness rather than claiming equality of unrelated analytic theories. |
| 75 | `CR.6/ramified-hk-base-change` | verified | BKV Remarks 3.4–3.5/Definition 3.6, p.16: coefficient/base-field maps, ramification index and actual comparison are explicit. Dividing raw monodromy by d matches the source; Frobenius compatibility is separately stated. |
| 76 | `CR.6/stein-hk` | verified | Curves §§3.1.1–3.1.3, pp.13–18 and Appendix A, pp.60–61: an actual admissible semistable Stein exhaustion indexes the coherent cohomology tower. SteinHKData has complete metrizable Hausdorff topology generated by countably many nonarchimedean seminorms. Strict/projective-limit exports are explicitly requested from RD.5. |
| 77 | `CR.6/stein-hk-comparison` | verified | Curves Proposition 3.12, p.18/Appendix A, pp.60–61 and CDN §0.6.1, pp.10–11: completed scalar extension and strict comparison act on the model's own cohomology objects. The algebraic finite-dimensional pieces are not substituted for the Stein topology. |
| 78 | `CR.6/tower-hk` | verified | CDN §0.3, pp.6–7: completed unramified coefficients and the ind-Fréchet tower are retained. Ind.lim is reused at the pin; transitions and continuous geometric actions are specified before indization. Arithmetic transport has a coefficient twist and the Galois cocycle/joint-continuity export remains in the RD.5 request. |
| 79 | `CR.7/finite-projective-coefficients` | verified | de Jong §§2.2.2–2.2.4, pp.19–21: finite locally free/QC evaluations on the affine crystalline basis correspond to finite projective modules. The tensor and dual APIs now specify actual evaluations; the general connection adapter still depends on R2, which is not counted as resolved by these finite-projective tests. |
| 80 | `CR.7/filtered-frobenius-coefficients` | unverifiable | R5: corrected the false R06.2 geometric-crystal attribution to local CR.5/CR.7 ownership. The adapter from completed finite locally free crystals is still unspecified; global sections/global complements in ArithmeticCoefficientData do not implement the source locally split sheaf filtration on arbitrary nonaffine models. The relation/twist formulas are correct, but do not repair those interfaces. |
| 81 | `CR.7/dieudonne-evaluation` | verified | de Jong Definitions 2.3.1–2.3.4, pp.21–22 and actual R07.2 standard-module nodes: the contravariant functor and geometric evaluation are indexed by the p-divisible group. Both F and V for the constant/multiplicative examples are now tested. The broader R07 crystalline functor is explicitly requested. |
| 82 | `CR.7/dieudonne-variance-twist` | verified | de Jong §2.3, pp.21–22 and the R07.2 standard modules fix contravariance and the multiplicative K0(-1) convention. Actual Cartier-dual evaluation, linear dual and twist are identified; the prototype no longer returns an unspecified package. |
| 83 | `CR.7/messing-filtration-interface` | verified | de Jong §3.1 and Theorem 3.2.1, pp.28–34 documents the nilpotent-PD lifted Hodge filtration used by Grothendieck–Messing. The supplied lift determines its evaluation/filtration; the exact R07.2 packet does not yet supply the full theorem, so the request remains essential. No canonical lift is inferred from the special fibre. |
| 84 | `CR.7/relative-crystalline-direct-image` | verified | BO Corollary 7.11, pp.7.16–7.17: the proper smooth geometric family and actual coefficient evaluation give a derived crystal. Its coherent base-change arrow is specified; individual locally free cohomology is not inferred from perfectness. |
| 85 | `CR.7/relative-base-change` | verified | BO Theorem 7.8, pp.7.12–7.15: the typed square keeps qc base, smooth qcqs family, actual fibre product, sub-PD base fibres and flat QC coefficients. The official Appendix B2.1 correction is retained (E7051); arbitrary surjective replacements of non-surjective towers are not used. |
| 86 | `CR.7/gauss-manin` | verified | BO Corollary 7.11 and Gauss–Manin paragraph, pp.7.16–7.17: actual base-form boundary, PD-smooth evaluation, finite projectivity and cohomology base-change are explicit. Identity tests compute d and constant-family tests carry the projectivity needed for the tensor description. These are affine evaluation clients. |
| 87 | `CR.7/gauss-manin-horizontality` | verified | BO §§7.8, 7.11, pp.7.12–7.17: horizontal base change uses the canonical cohomology map for a compatible PD-object morphism and the pulled-back connection, rather than an arbitrary linear equivalence. |
| 88 | `CR.7/pd-coefficient-compatibility` | verified | Kato §§5.7–5.8, 6.3–6.4, pp.216–219 and Beilinson §1.7, pp.8–11: the actual PD derivation and PD morphism compatibility are stated. Finite-projective affine evaluation identifies the differentiated diagonal stratification with its connection; the identities are no longer assumed as conclusions' premises. |
