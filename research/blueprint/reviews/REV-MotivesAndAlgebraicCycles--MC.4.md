# Independent review: MC.4 follow-up

Job `REV-MotivesAndAlgebraicCycles--MC.4`, issue #10801. Reviewer: Codex,
session `codex-x5YKQg`, 2026-10-19. The input was written by Claude Opus 5.5,
session `claude-nJ6DFS`, for #10830 and merged in [PR #11129](https://github.com/CBirkbeck/tauceti-explorer/pull/11129).
The reviewer did not write that input.

**Accepted after correction, with partial MC.4 coverage.** Every node now has an independent
verdict and a justified target statement. Four explicit gaps and seven precise supplier requests
remain. The acceptance is of the corrected plan, not a claim of mathematical implementation or
of closed prerequisite chains. No target was weakened to characteristic zero to make a Lean
statement possible.

The review is complete. The packet and its MC.4 coverage are both `partial`: the checker rejects
an under-budget `complete` packet with a partial stage. Its independent `review.status` is
`accepted`, which records completion of this review separately. This is not a checkpoint of
unfinished review work. No checker or intake code was changed.

## Inventory

| Item | Reviewed result |
| --- | --- |
| Nodes | 17: 11 theorem, 4 construction, 2 definition |
| Per-node verdicts | 5 verified, 12 corrected, 0 unverifiable |
| Nodes added or removed | 0; target-level granularity retained |
| Baseline declarations | 16 confirmed: original 10 plus 6 existing Tau Ceti imports |
| Planning API items | 58 |
| Definition/construction unit tests | 28; each of the 6 objects has at least 3 |
| Source records | 7 public primary sources, with versions and hashes |
| Source findings | E101–E107, all independently confirmed with qualified reach |
| Remaining gaps / requests | 4 / 7 |
| Proposed base-node rewires | 7; no base-packet file edited |
| Active planets added | 0; the unsplit base MC.4 already has its maximum 6 |

## Corrections and mathematical checks

1. **Transfers and products.** The initial smooth parameter gives universal integrality even
   after pullback to a singular correspondence support. The product defining a morphism out of
   the Day tensor has independent parameter bases `U,V`, and is natural for `alpha box beta`.
   Common-base multiplication is not separately transfer-linear. The new degree-two test
   distinguishes `2ab` from `4ab`. Proper pushforward, flat pullback and the duality embedding
   were checked in SV sections 3.3–3.7, FV 2.1 and 5.7–5.8, and MVW 16.1–16.3.
2. **Bivariant theory.** Checked dimension indices, degree `-i`, cdh pullback, first-variable
   descent, second-variable localization and the point evaluation. FV 5.5 and 5.11–5.14 require
   the stated resolution and cdh interfaces. General quasi-projective duality is a
   quasi-isomorphism evaluated at `Spec k`, not a presheaf quasi-isomorphism. The projective
   version is the presheaf statement. FV 8.2–8.3 supplies the stated duality, suspension,
   cosuspension and Gysin index shifts.
3. **Moving families.** FV 2.3, pp. 6–8, does not identify every Chow morphism with an effective
   relative cycle: its converse has a generic field-of-definition condition. R09.1's existing
   algebraically closed characteristic-zero parameters do not supply the general infinite-field
   family interface. FV's signed parameter-extension operation does not prove preservation of
   effective monoids. The proof plan now gives the positive finite pushforward and crossed
   constants of FL 3.8, pp. 25–26, and records the remaining realization/base-change checks as a
   precise request and gap. The infinite-field restriction remains; no finite-field disproof is
   asserted.
4. **Projective duality.** For `z_equi(Y,X,r)`, the parameter is `Y`. The proof must move against
   `X x {y}`, of dimension `dim X`, giving expected intersection dimension `r`. The former proof
   tested the other fibres, following the variable swap in the IAS proof of FV 7.1. E106 records
   that slip and its correction.
5. **Descent and Chow composition suppliers.** S.4's Brown–Gersten node is spectra-valued;
   the required complex version is stated precisely with MVW 19.10–19.11, p. 162. SF.5's
   Tor-intersection node assumes an algebraically closed field; it cannot directly prove the
   Chow functor over every infinite field. The replacement request specifies the general-field
   relative-pullback/Tor comparison of MVW 1A.13–1A.14, p. 11, including composition and products.
   Neither mismatch is hidden by a vague layer citation.
6. **Motivic Hom and Chow conventions.** Replaced `M(X)` by `C_*(X)` in the general singular
   source of the Hom comparison. Checked VDM 4.2.3–4.2.8, pp. 47–49, including the direction of
   positive-Ext vanishing. The covariant homological Chow functor and MC.1's contravariant
   convention agree after transpose and twist `(-m)[-2m]`. The projective-line endomorphism
   example is `R^2`, with `Z^2` the integral specialization.
7. **Perfect-field blow-up and Gysin statements.** Added the codimension-zero component case
   before the exceptional projective-bundle surjectivity argument. The positive-codimension
   smooth blow-up proof uses the corrected homotopy-invariant-sheaf result from M.5a rather
   than inheriting the defect in CTP 4.23/5.6. The former last step of the Gysin construction
   asserted its compatibility with Chow specialization without proving it. That bridge is
   now a gap. Purity for the constructed map also needs `alpha(A^c,0)` to be the canonical
   quotient isomorphism (MVW Exercise 15.14, p. 124); it does not follow merely from the
   existence of a blow-up splitting. The `+ord_x` normalization is part of that obligation.
8. **Coefficients on a curve.** The units–divisor–Picard exact sequence is integral. Termwise
   tensoring is justified for flat coefficients, while arbitrary coefficients retain derived
   motivic cohomology. A new acceptance check uses the possible
   `Tor_1(Pic(X),Z/n) = Pic(X)[n]` contribution to `H^{1,1}(X,Z/n)`.
9. **Tate motives.** Replaced the unsupported reduction from all positive powers to `n=1`
   by the fully reduced summand of `M(G_m^n)` and its weight-zero projector computation.
   The example excluding `R(-1)` from the effective Tate envelope requires `R` nonzero.
   Added the direct higher-Chow prerequisite and MVW 19.1, p. 159. A mixed Tate heart remains
   with PS.9; the definition here is triangulated.
10. **Variety scissor ring.** VDM p. 9 describes compact supports but does not define the
    scissor ring. Replaced that match by Bittner's definition before Theorem 3.1, p. 3,
    while explicitly recording her characteristic-zero/reduced conventions on p. 2.
    The packet gives its own elementary construction for every field and explains why
    nilpotents are killed. It does not import Bittner's characteristic-zero presentation.
    Replaced the false affine-space stratification argument by `A^n = (A^1)^n`, added a
    small-model convention and a nonreduced-point unit test.
11. **Motivic measure and existing K_0.** The generic triangulated Grothendieck group is
    already implemented at the pin. It is imported, together with its class map, triangle
    relation, shifts and universal property. Only the general exact-tensor ring enhancement
    is requested from GrothendieckEulerForms, Part II. Rational coefficient extension induces
    a map on K_0; it is not an identification with tensoring the group by Q. The elements
    `1-[Q(-i)]` are units after target localization. The ordinary-motive non-example now
    uses the denominator mapping to zero in a nonzero target, without presupposing an
    unproved inequality between Tate classes.
12. **Reader and suggested file.** Reconciled every correction, proof boundary, API, test,
    request and source finding in the reader. Removed the `TransfersData` axiomatization,
    invented motivic carriers and data definitions with unproved terms from the suggested
    file. Its two examples exercise actual pinned K_0 declarations. All 17 motivic targets
    remain fully specified in the reader because their required carriers are missing.

## Node-by-node record

| Node suffix | Verdict | Independent check |
| --- | --- | --- |
| `equidimensional-cycles-transfers` | corrected | Corrected universal-integrality hypotheses and independent-base tensor pairing; added a degree-two transfer test. |
| `bivariant-cycle-cohomology` | verified | Verified integral cdh grading, variance, point evaluation and naive definition against FV 4.2-4.5 and the M.5a request. |
| `equidimensional-cycle-localisation` | verified | Verified localization, Mayer-Vietoris and abstract blow-up triangles under resolution, using the requested cdh vanishing and flattening interfaces. |
| `bounded-family-moving-lemma` | corrected | Corrected Chow field-of-definition restriction and signed-positivity claim; planned the positive FL 3.8 route with an explicit family-realization gap. |
| `projective-duality-for-equidimensional-cycles` | corrected | Corrected the fibre labels and dimensions in projective duality; retained infinite fields and effective-family prerequisites. |
| `duality-for-equidimensional-cycles` | verified | Verified the quasi-projective/resolution induction and the fact that the general embedding is tested at Spec k, not claimed a presheaf quasi-isomorphism. |
| `naive-bivariant-comparison` | corrected | Corrected spectra/complex mismatch with a precise complex-valued Brown-Gersten request and direct MVW 19.11 locator. |
| `bivariant-duality` | verified | Verified FV 8.2 dimensions, first/second variables and infinite-field/resolution restrictions. |
| `bivariant-suspension-and-gysin` | verified | Verified all four FV 8.3 shifts, homotopy and Gysin indices; corrected-sheaf route retained. |
| `hom-into-motives-with-compact-support` | corrected | Corrected singular-scheme notation to C_*(X) and completed the locator for the internal-Hom proof; verified the signs and positive-Ext direction. |
| `chow-motives-functor` | corrected | Corrected general-field intersection supplier boundary and R^2 example; verified homological covariance and transpose/twist comparison with MC.1. |
| `smooth-blow-up-triangle` | corrected | Verified the perfect-field excision proof using corrected homotopy-invariant sheaves, and added the codimension-zero component case before using projective-bundle surjectivity. |
| `blow-up-formula-over-a-perfect-field` | corrected | Kept the perfect-field blow-up target but replaced an unsupported cycle-class identification by an explicit categorical compatibility gap. |
| `gysin-triangle-over-a-perfect-field` | corrected | Corrected integral versus arbitrary coefficients, Tor contribution and residue normalization; retained perfect-field target with an honest purity gap. |
| `tate-motives` | corrected | Corrected negative-weight proof for every n>0 and required nonzero R in the non-effectivity test; added direct higher-Chow prerequisite. |
| `grothendieck-ring-of-varieties` | corrected | Replaced a non-definition citation with the direct Bittner scissor-ring definition, explaining its characteristic-zero convention and the independent all-field construction; corrected affine-space computation and smallness. |
| `compactly-supported-motivic-measure` | corrected | Removed duplicate generic triangulated K_0 planning; imported pinned APIs, requested the ring extension from its owner, and corrected rational coefficient change and denominator units. |

## Pinned declarations and audit

All original ten declarations exist at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`:
`AlgebraicGeometry.AlgebraicCycle.map`, `CategoryTheory.Pretriangulated.Triangle`,
`CategoryTheory.Pretriangulated.exists_iso_binaryBiproduct_of_distTriang`,
`CategoryTheory.Idempotents.karoubiUniversal`,
`CategoryTheory.ObjectProperty.triangEnvelope`,
`CategoryTheory.ObjectProperty.triangEnvelope_le_iff`, `FreeAbelianGroup`,
`AlgebraicGeometry.Scheme.Over`, `IsLocalization.lift` and `Localization`.
Their actual pinned statements and surrounding hypotheses were read, not inferred from the
index. No original citation was removed. The provisions of `AlgebraicCycle.map`,
`FreeAbelianGroup` and `Localization` were narrowed to what they actually supply: raw weighted
cycles, the variety quotient's free group, and a monoid-localization carrier, respectively.
Karoubi extension needs an idempotent-complete target, and the envelope's universal property
needs a triangulated retract-closed property, as retained in the plan.

Six declarations in `TauCeti/CategoryTheory/GrothendieckGroup/Triangulated.lean` at Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369` were added as imports:

| Declaration | Pinned line | Boundary checked |
| --- | --- | --- |
| `TauCeti.TriangulatedK0` | 138 | Essentially small pretriangulated preadditive category, zero and additive integer shifts |
| `TauCeti.TriangulatedK0.of` | 146 | Object class in that group |
| `TauCeti.TriangulatedK0.of_distTriang` | 153 | Middle class equals sum of outer classes |
| `TauCeti.TriangulatedK0.of_eq_sub_of_distTriang` | 168 | Third class equals second minus first |
| `TauCeti.TriangulatedK0.of_shift` | 200 | All integer shifts with parity sign |
| `TauCeti.TriangulatedK0.liftEquiv` | 277 | Triangle-additive invariants into an additive commutative group |

The reviewed `data/library-coverage.json` has no direct MC.4 entry. Its M.4, M.5a,
SF.5 and PS.9 entries were checked for the relevant missing motives/cycle objects and the
partial raw-cycle pushforward. The current read-only Tau Ceti tree was checked alongside the
pins. Current GrothendieckEulerForms and AlgebraicVectorBundles roadmaps were read for the
existing categorical and bundle boundaries. Current split/exact tensor K_0 is not the
triangulated tensor-ring API being requested.

## Source findings

Each original finding was checked at its locator and given a `review` verdict; two findings
were added. E101, E106 and E107 concern the exact IAS preprint read. The published FV chapter
was not collated, so these are not findings about an established defect in that version.

| Finding | Verdict | Correct scope |
| --- | --- | --- |
| E101 | confirmed | Missing finite-field route in the IAS proof, not a disproof of its target theorem |
| E102 | confirmed | Smooth deformation columns use VDM 3.5.2, not 4.1.3 |
| E103 | confirmed | Omitted categorical Gysin normalization/comparison; retained as a gap |
| E104 | confirmed | Omitted composition/tensor check; general-field supplier request made precise |
| E105 | confirmed | CTP 4.23 proof defect confirmed by MVW 22.10 and its following remark, pp. 185–186 |
| E106 | confirmed, added | X/Y fibre labels in the proof of FV 7.1 |
| E107 | confirmed, added | Signed extension does not establish effective-monoid preservation |

The six original source hashes were rechecked against the fetched public PDFs. The CTP archive
link was corrected to an archive PDF endpoint. Bittner's public arXiv version adds the direct
scissor-ring definition. The packet and reader record all seven URLs, versions and hashes.
No source excerpts or section-by-section source summaries were added.

## Scope, planets and handed-on red-team findings

The input actually covers MC.4 only, despite the older issue text mentioning MC.4–MC.7.
The separate follow-ups #10831–#10833 own MC.5–MC.7. The seven proposed base-node rewires
were corrected to preserve the new gaps, field restrictions and coefficient conventions;
no base-packet or downstream file was changed.

The base layer already has six planets, all central definitions or named theorems. Adding
more active planets here would exceed the unsplit layer's cap. The existing four-group
restructuring proposal remains a proposal; its names include bivariant cycle cohomology,
Friedlander–Voevodsky duality, Tate motives, Chow motives in DM and the motivic measure.
Applying the subdivision and reconciling the superseded Gysin node require the base fix.

Read RT-AREA-iwasawa-3/8 and RT-AREA-geomlanglands/17 and their confirmed reviews. The first
places the integration-symbol algebra's Tate localization in PS.2 and asks MC.5 to export
localized Nori data; MC.4's categorical Tate stabilization and variety Lefschetz class do not
supply that algebra. The base MC.5 nodes explicitly distinguish the localized diagram and
category. The second requires an early abstract relative/neutral reconstruction supplier and
recognition results; base MC.6 now has relative finite-piece, coalgebra, bialgebra and rigid
antipode nodes, plus neutral reconstruction and field-qualified recognition statements.
This part claims neither that its Tate category is a heart nor that field-valued reconstruction
supplies integral Satake. Assembly must retain those boundaries.

## Follow-up routing for the orchestrator

- Apply the seven base-packet rewires in a separate fix, retaining the recorded gaps.
- Route the R09.1 family-realization, S.4 complex-descent and SF.5 general-field composition
  requests to their owners. Keep the perfect-field Gysin normalization as an MC.4 obligation.
- Route the general triangulated tensor-ring enhancement to GrothendieckEulerForms, Part II;
  the existing pinned group and additive API are already sufficient imports.
- Keep finite-field moving descent open. Collate the IAS proof findings against the published
  chapter before any publication-level errata claim.

## Validation

- Packet checker against the pinned declaration index: **0 errors, 0 warnings**.
- `lean-check` on the suggested file at the recorded pins: **passed, no warnings**.
  Available memory exceeded the required 20 GB; no build or cache command was run.
- Submission file checks and `git diff --check`: **passed**.
- Only the three reviewed files, this report and this job's handoff are changed.
