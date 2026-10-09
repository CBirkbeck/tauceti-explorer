# Independent review of crystalline cohomology, revision 3

**Accepted as a complete target-level pass, with all four stages still planned and none closed.** Reviewed by Codex, session codex-t7UCYP, on 9 October 2026 for issue #7545. The revision under review is BP-CrystallineCohomology--CR.5~3 by Codex session codex-P0tL2J; this reviewer did not author any of its three planning rounds.

The packet’s current review contains an individual justification for every node: **85 verified, 3 corrected, 0 added, 0 unverifiable**. The entire preceding needs_changes review, including its 88 verdicts, is preserved unchanged in reviewHistory alongside the first review. These verdicts check the mathematical targets and their proposed interfaces. They do not certify placeholder proofs, requested supplier exports or the explicitly missing proof inputs.

| Inventory | Checked count |
| --- | ---: |
| Nodes | 88 |
| Definitions / constructions / theorems / comparisons | 22 / 33 / 27 / 6 |
| Definition/construction API declarations | 165 |
| Named discriminating tests | 167 |
| Pinned baseline declarations | 32 |
| Public source versions | 18 |
| Direct imported node / stage contracts | 13 / 14 |
| Planets | 19 |
| Planned / closed stages | 4 / 0 |
| Explicit proof gaps / owner requests | 4 / 9 |

The four stages have 27 log-algebra nodes, 24 CR.5 nodes, 27 CR.6 nodes and 10 CR.7 nodes. Every integrated stage target has a realizing node. At target granularity the proof routes are sufficiently specific, and their unsupplied inputs end in named owner interfaces or recorded gaps. There is no justification for changing this finished pass to partial merely because the stages are not closed.

## Method and source verification

I read WORKERS.md, both binding protocols, the upstream guide, the full revision-2 review and revision-3 handoff, and the AdicSpaces and HodgeStructures upstream reader documents. I checked every node’s statement, hypotheses, proof route, direct inputs, acceptance tests, uses, API and unit tests; read the entire suggested Lean file; and reconciled the reader with all packet statements, prerequisites, APIs and tests.

All 18 public source files were independently reacquired, and every recorded SHA-256 was reproduced. Each node’s locator was read in the actual source. The current packet records the URLs, hashes and this reviewer’s reading in independentReview3ReadSections, separately from the author’s narrower revision3ReadSections. Kato’s scan was read with OCR, with image checks for the ambiguous final theorem label. The Hyodo–Kato uniformizer formula and the Berthelot–Ogus theorem, direct-image corollary and original Appendix B2.1 were also checked as page images. No source files, excerpts or source-by-source summaries are submitted.

Important statement checks include Kato §§3.3–3.6 and 4.6–4.14, pp.201–214; its PD/crystal/connection theory in §§5–6, pp.215–222; Beilinson §§1.2–1.8, pp.3–12 and §§1.12, 1.17, pp.16–17, 25–26; Hyodo–Kato §§2–3, pp.223–246, §§4.19–4.20, pp.260–262 and §§5.1–5.5, pp.262–268; Disegni–Liu Appendix B, PDF pp.113–118; Sato Definition 8.3 and Propositions 8.4, 8.6, pp.211–213; de Jong §§2.2–2.3, pp.18–22 and §3.1/Proposition 3.2.1, pp.28–34; and Berthelot–Ogus Theorem 7.8/Corollary 7.11, pp.7.12–7.17, with the official Appendix B erratum.

I corrected Thompson’s source metadata. The downloaded file has the arXiv identifier math/0305441v2 dated 4 March 2005, whereas the active ledger called it a 2003 author version. Its URL is now pinned to [version 2](https://arxiv.org/pdf/math/0305441v2), separately fetched and confirmed to have the unchanged recorded hash. Definition 1.6, p.7 and Theorem 3.14, p.32 are the locators actually read. The cited Kato Toric singularities proof remains an explicit gap.

## Revision-2 repairs

**R1, fine/fs base change:** verified. The fine integralized log product and the fs Kummer étale base-change projection are separately typed. Kummerness alone is not used to claim the corresponding theorem for an integralized product. Kato §§2.7, 3.3, 4.6, pp.199, 201, 209 and Temkin §1.2.7, p.100/Step 10, p.123 support this scope.

**R2, crystals and coefficient connections:** verified. Unrestricted crystals use native ambient module-sheaf pullbacks. The cartesian arrow is adjoint to the actual restricted sheaf map. PD diagonal stratifications use those sheaf pullbacks, and connections land in sections of the sheaf tensor. Quasi-nilpotence is quantified over individual geometric stalks and section germs, with ordinary Taylor powers and logarithmic falling factorials distinguished. The crystal evaluation, connection, coefficient de Rham complex and Poincaré comparison share the same data. The P1/F_p regression test detects the false tensor-of-sections formula: O(p)⊗Ω¹=O(p−2) has p−1 global sections while Γ(Ω¹)=0. Kato Theorem 6.2, p.218 and Beilinson §1.7, pp.8–11 give the full sheaf equivalence; affine coordinate clients retain their qualification.

**R3, tube support:** verified. Support remains the exact kernel on the quasi-étale analytic tube before specialization. The nonfactorization test excludes a special-fibre functor that preserves bounded-below objects, matching Disegni–Liu Definition B.1/Remark B.2/Lemma B.3, PDF pp.113–114. It does not overstate the source’s conclusion for arbitrary unbounded functors.

**R4, residue embedding geometry:** verified. The actual degree-zero lift over W[t] is smooth over W, flat over W[t] and smooth over its generic point. Its actual t=0 fibre is a relative SNC closed Cartier divisor, the log is its divisor log, and the actual base log fibre recovers the given special-fibre embedding. Grosse-Klönne §§5.1–5.2, PDF pp.26–27 supplies the induced higher embedding system. The ordinary/logarithmic cokernels, analytic realization and support use that same system. The q+1 shift, ordered residue signs and Witt-module scope agree with Sato pp.211–213 and Disegni–Liu Appendix B. Required general boundary and analytic realization exports are precisely requested from R09.7a/RD.4.

**R5, geometric filtered coefficients:** verified. Compatible finite locally free crystals on successive PD levels form the completed geometric category; inversion of p is explicit on Hom. Model and Frobenius transport use actual level pullbacks. An algebraic generic-fibre realization requires coherently specified algebraization data, rather than asserting that arbitrary nonproper formal data algebraize. Native submodule sheaves carry locally split filtrations and Griffiths transversality. The Euler-sequence test detects the false global-complement condition. R06.2 supplies normalization conventions, not the geometric crystal category. De Jong pp.18–22 supports the completed crystal/evaluation scope; his Proposition 3.2.1, pp.32–34 is correctly named and does not become a general algebraization theorem.

## Corrections made in this review

1. **Log charts, node 9.** The old named non-sharp-chart example only asserted that −1 is a nonidentity integer unit. It never constructed LogChart. I added the actual unit chart ℤˣ→ℤ and changed the example to test both a nonidentity chart unit and trivial characteristic. The packet and reader now describe precisely this object.
2. **Quasi-coherent log PD envelopes, node 37.** The packet correctly described the rational log-point identity, but the Lean example still asserted noncompletion of an unrelated, unspecified PD-polynomial ring. I removed that helper and replaced the example with the actual qcLogPDEnvelope of the ℚ≥0 log-point identity over ZMod p with zero PD ideal. It also tests that the source is not fine. This is in Beilinson §1.3’s p-nilpotent scope, and makes no uncompleted mixed-characteristic envelope assertion.
3. **Stein cofinal exhaustion, node 76.** The constructor claimed strict containment of successive pieces while allowing a merely nondecreasing index map, which may repeat a piece. It now requires StrictMono, and the packet/reader test specifies a strictly increasing cofinal subsequence. The underlying continuous limit, model and topology are unchanged.
4. **Thompson metadata.** Pinned the actual 2005 version 2 and corrected the edition label; the mathematical statements, locators and hash are unchanged.
5. **Review provenance.** Added this reviewer’s 88 checked rows, source and baseline reading records, fresh verdicts for the four source issues, this report and the handoff. The revision-2 review object is preserved exactly. The reader now records the current acceptance and its limits.

No node was added or removed. No primary declaration, API name, test name, node ID, planet, gap, owner request or coverage record was removed or changed. The three tests and their explanatory scope are the only node content changed.

## Baseline and ownership

All 32 baseline citations exist at Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 or Tau Ceti f790474821cf4256814db967cb154e7af3d0c369. I read each statement with its surrounding universe, algebraic and categorical hypotheses, then checked its use. **No baseline citation was removed or replaced.** The following is the checked inventory; the packet retains each exact module and its provided input.

| Pinned declaration | Confirmed input |
| --- | --- |
| `mathlib:AlgebraicGeometry.Scheme.smallEtaleTopology` | Grothendieck topology on the category of schemes étale over X. |
| `mathlib:Algebra.GrothendieckGroup` | Universal group of a commutative monoid as localization at the full submonoid. |
| `mathlib:Algebra.GrothendieckGroup.lift` | Equivalence between monoid homomorphisms to a commutative group and homomorphisms out of its groupification. |
| `mathlib:Algebra.GrothendieckGroup.of_injective` | Cancellation implies injectivity of the canonical map to the groupification. |
| `mathlib:DividedPowers` | Structure of divided powers on an ideal in a commutative semiring, with operations and all PD identities. |
| `mathlib:ExteriorAlgebra` | Exterior algebra of a module, implemented using the zero-form Clifford algebra. |
| `mathlib:ExteriorAlgebra.ι_sq_zero` | Every degree-one exterior generator squares to zero, including in characteristic two. |
| `mathlib:WittVector` | The p-typical Witt vector carrier with its coefficient family. |
| `mathlib:WittVector.frobenius` | The Witt vector Frobenius ring homomorphism; the characteristic-p coefficient formula is supplied in the same module. The prime and characteristic-p hypotheses must be retained for the stated coefficient formulas. |
| `mathlib:WittVector.frobeniusEquiv` | Witt Frobenius is a ring equivalence when the coefficient ring is perfect of characteristic p. This uses the prime, CharP and PerfectRing instances. |
| `mathlib:WittVector.teichmuller` | Multiplicative Teichmüller map R→W_p(R); it is not an additive ring map. |
| `tauceti:TauCeti.nilpotentExpUnit` | For a nilpotent element of an associative rational algebra, its finite exponential is a unit with inverse the exponential of its negative. |
| `mathlib:KaehlerDifferential` | Ordinary Kähler differential module for a commutative algebra, as the cotangent of the multiplication ideal. |
| `mathlib:KaehlerDifferential.D` | Universal ordinary algebra derivation into the existing Kähler differential module. |
| `mathlib:ModuleCat` | Existing category of modules over a ring with linear morphisms. |
| `mathlib:CategoryTheory.GrothendieckTopology` | Covering sieves with maximality, pullback stability and transitivity. |
| `mathlib:DerivedCategory` | Localization of cochain complexes of an abelian category at quasi-isomorphisms, under HasDerivedCategory. This is the ordinary unbounded derived category under HasDerivedCategory, not by itself the enhanced tensor/limit supplier. |
| `mathlib:PresheafOfModulesOfCommRing` | Existing category of module presheaves on a commutative ring presheaf, with coherent restriction maps. |
| `mathlib:ModuleCat.extendScalars` | The scalar-extension functor M↦S⊗_R M for a commutative-ring homomorphism. |
| `mathlib:CategoryTheory.HasLiftingProperty` | Every commutative square against the two specified arrows has a lift. |
| `mathlib:IsNilpotent.exp` | Finite factorial exponential of a nilpotent element in a ring with rational scalar action; its finite-sum formula is already proved. |
| `mathlib:CategoryTheory.Ind` | Existing category of filtered ind-objects, with fully faithful Yoneda embedding. |
| `mathlib:CategoryTheory.Ind.lim` | Functor from small filtered diagrams in C to their ind-colimit in Ind C. The input indexing category is filtered; this does not construct the analytic Fréchet coefficient category. |
| `mathlib:DividedPowerAlgebra` | Existing quotient algebra Γ_R(M) by the divided-power generator relations; no canonical augmentation PD structure is asserted here. |
| `mathlib:DividedPowerAlgebra.dp` | Degree-indexed class of the polynomial generator in the existing Γ_R(M). |
| `mathlib:SheafOfModules` | Existing category of module sheaves over a ring sheaf on a small site, with sheaf condition on the underlying additive presheaf. |
| `mathlib:SheafOfModules.pullback` | Pullback on module sheaves for a continuous ringed-site morphism, as the left adjoint to pushforward. Retain the right-adjoint existence hypothesis; the same module proves its sheafification construction under the stated site hypotheses. |
| `mathlib:PresheafOfModules.sheafification` | Associated module-sheaf functor for a locally bijective structure-ring map, under HasWeakSheafify and WEqualsLocallyBijective; the identity ring map is the tensor-sheaf client used here. |
| `mathlib:ModuleCat.restrictScalars` | Restriction of scalars along a ring homomorphism; used to transport actual section modules across the canonical structure-ring isomorphism and to the PD base. |
| `mathlib:SheafOfModules.Submodule` | Submodule of a module presheaf with a local membership condition, with the associated module sheaf, inclusion and complete lattice. It is not merely a submodule of global sections. |
| `mathlib:AlgebraicGeometry.«Proj»` | Scheme Proj of an N-graded commutative ring; used with two polynomial variables for the nonaffine projective-line tests. |
| `mathlib:MvPolynomial.gradedAlgebra` | The homogeneous-degree decomposition gives the polynomial ring its graded algebra structure. It is not a global instance; instantiate it locally for Proj. |

Source-wide searches at both pins found no geometric log scheme/log crystalline, Hyodo–Kato or crystalline Dieudonné/Gauss–Manin implementation. The existing WittVector.Isocrystal class and one-dimensional classification were read as a near match: they supply neither the geometric crystal evaluation nor the monodromy comparison. Unrelated Cartan–Dieudonné and topological results are not counted as these constructions. The reviewed library coverage has no CrystallineCohomology stage entries; that absence is not itself an accepted audit verdict. The integrated CR.4 decomposition does not replace any node in this scope.

Current integrated RS-01 ownership retains common PD/A_cris at CR.0. Its latest proposal has a pending review, so it is not applied by this job. The exact 13 imported node contracts and 14 imported stage contracts were checked. General sheaves/enhancements belong to EDS; common integral period data belongs to AI.0:integral/CR.0; formal and dagger carriers belong to AdicSpaces Part II; boundary geometry belongs to R09.7a; the tame cover lemma belongs to LPV.5; analytic tube/support/strict topology belongs to RD Part II; crystalline Dieudonné/Messing belongs to R07.2; and filtered (φ,N) conventions belong to R06.2. No supplier or upstream roadmap is edited.

The DD.1 derived completion reflector is explicitly a near miss for a generic enhanced countable Rlim. Ordinary RD.4 overconvergent cohomology is likewise a near miss for the requested log convergent tube/support construction; algebraic RD.5 finiteness does not supply strict Fréchet/ind-Fréchet limits. Existing R07.2 standard Witt modules fix the examples but do not supply its full crystalline functor. All nine requests retain their exact statements and consuming nodes.

The 88-node local prerequisite graph is acyclic. Following the current supplier node and stage contracts reaches 431 owner nodes/stages without a cycle. Every direct prerequisite resolves; downstream supplier gaps or reserved interfaces are retained at their owners. In particular, R06.5 is a downstream consumer, and the non-fine integral prefix does not depend on its later rational period comparison.

## Source issues, red-team finding and limits

All four source issues are freshly **confirmed**, with by set to REV-CrystallineCohomology--CR.5~3:

- **E7051:** BO Appendix B2.1, printed p.B.3/PDF p.238, and the official two-page 2013 erratum require the corrected derived-category replacement. A surjective map to the originally given tower needs transition surjectivity; bounded-above/projective hypotheses remain.
- **E7052:** Qian v1 Theorem 3.2, PDF pp.14–18, omits properness from the displayed setup while invoking finite coherent cohomology in its limit argument. The actual geometric application is proper and the packet retains that hypothesis. The finding remains scoped to this preprint version.
- **E7053:** BKV v2 Remark 2.4(1), PDF p.6, needs q+q′ in the image for a group quotient. Its printed difference equation also holds for 0→ℕ, so is not a group-cokernel criterion.
- **E7054:** Kato p.222 labels the final Künneth theorem 6.12 after an introductory reference to 6.11. This is a locator inconsistency only.

RT-AREA-padic-2/14 was checked against its actual finding and the current integrated AI.6/CR.5 scope. The packet has the required integral quasi-coherent log prefix: non-fine smooth models, compatible finite-level PD envelopes/thickenings/sites, PD Poincaré/descent, derived completion, unique p-divisible log lifting and the A_cris chart. Generic ownership is here; AI.6 consumes it. The proposed qc-crystalline substage and its AI.6 edge remain proposals for the maintainer, not atlas changes by this review. The formal-boundary proof gap is still explicit.

The four proof gaps remain: the full log Abhyankar/log-regularity proof input; the oriented geometric Tate-curve residue computation; the complete non-fine O_C formal-boundary/period-chart chain; and the generic DD.1 enhanced Rlim interface. Nodes 20, 21, 27, 49, 51 and 67 are verified as honestly scoped targets with those recorded missing inputs. Their proofs are not certified as complete. The requested analytic, Dieudonné, cohomology-base-change and other owner interfaces likewise remain construction tasks. These limits are reflected in all four planned coverage records and their precise remaining lists.

Planets are key objects and named results, with 6/5/5/3 across the four stages, within the per-stage bound. Every one of the 55 definitions/constructions has three APIs and at least three discriminating tests; the two additional nonaffine tests distinguish sheaf tensoring and locally split filtrations. No proof is split into lemma nodes at this target level.

## Validation and handoff to the orchestrator

- `python3 scripts/check_blueprint.py research/blueprint/packets/CrystallineCohomology--CR.5.json`: **0 errors, 0 warnings**, with the inventory above.
- `lean-check research/blueprint/suggested/CrystallineCohomology--CR.5.lean`: initial and final checks both exited **0**; final diagnostics are only declaration-uses-sorry warnings. The existing shared build is at the pinned Mathlib. The Tau Ceti exponential wrapper is not built there, so its verified underlying Mathlib operation is used. No library build/update/cache command or language server was run.
- Namespace-aware inventory: all **88 primary declarations**, **165 APIs** and **167 named test markers** occur; every packet test marker occurs exactly once. Packet/reader statements, hypotheses, proof routes, prerequisites, acceptance text, APIs and tests agree.
- Preservation: exact prior review/history, all node IDs/planets, four gaps, nine requests and four coverage records are unchanged.
- Source versions: all **18 hashes** reproduced; the explicitly pinned Thompson v2 URL independently gives the same hash.
- Submission: intake check-files reports **five files, zero problems**; the exact issue allowlist, JSON validity, private-path/excerpt absence and git diff --check passed.

No unresolved contradiction or further author revision is requested. The orchestrator should continue the existing owner/follow-up jobs for the open inputs, consider the proposed qc-crystalline/AI.6 and RD Part II scopes, and keep all four stages planned until those proofs and exports are supplied. This is a completed review submission, not a checkpoint. It changes only the issue’s packet, reader, suggested file, this report and its own handoff.
