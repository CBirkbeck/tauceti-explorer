# Independent review of the second Langlands-area fix

**Job:** `REV-FIX-RT-AREA-langlands-2~2`, Refs #5143. **Reviewer:** Codex, session `codex-rtOQ9t`. **Date:** 2 October 2026. **Input:** FIX-RT-AREA-langlands-2~2, by Codex `codex-5ebb6f`, issue #5142, merged PR [#5282](https://github.com/CBirkbeck/tauceti-explorer/pull/5282). This reviewer did none of that fix. Review base: `696b4b81941ff318729671593226cea5a8630960`.

All three packets receive **`needs_changes`**. Several source corrections and ownership changes are right locally, but the missing supplier constructions and stage changes remain missing. In particular, the new early field/character supplier and weight-one descent supplier are gap descriptions rather than imports. The new GL2 definitions still lack the full suggested signatures, named APIs and tests required by PROTOCOL §13. An accepted verdict would allow the intake to promote a packet; this review does not use acceptance to mean only that its checkpoint accurately describes unfinished work.

I read all 40 claims in `RT-AREA-langlands-2.result.json`, all 40 qualified confirmations in `RT-AREA-langlands-2.review.json`, the entire `RT-AREA-langlands-2.fixes-2.md`, the changed/new packet nodes and relevant requests, the three complete suggested Lean files, and the reader passages affected by the owned fixes. The individual dispositions below distinguish an applied local correction, a partial correction, and an unresolved handoff. A handoff is not evidence that its mathematics has been repaired. No red-team finding is silently dropped or re-labelled rejected.

## Packet verdicts and the remaining corrections

| Packet | Verdict | What prevents acceptance |
| --- | --- | --- |
| ClassicalSerreModularity--R27.3 | needs_changes | /1's early component is not a live stage and the level-one ancestor still reaches the modern route; /8's new Artin endpoint lacks its early descent and number-field/lattice suppliers. The corresponding suggested signatures remain comments. |
| GL2ModularityLifting--R22.1 | needs_changes | /12's external lifting-order correction remains a handoff; /13 and /26 depend on an uncreated early field/character supplier; new full field/idele definitions and their APIs/tests are commented sketches. The prior independent needs_changes gaps remain material. |
| GlobalGaloisDeformations | needs_changes | /22's PA.3 export metadata does not repair the stage inputs. The determinant-comparison declaration still needs an early/late stage assignment. The reader's relative-tangent formula disagrees with the corrected packet by one. |

The CSM and GL2 pending objects are archived before replacement, alongside their earlier reviews. Global's separate accepted `independent-review-REV-FIX-RT-AREA-langlands-1~2` is preserved **verbatim** in reviewHistory. That review explicitly limited its acceptance to another fix's /21–/22 and explicitly did not accept the edits reviewed here. Its published ACC+/CG source work is inherited with that qualification; I have not re-certified those sources or altered the mathematical nodes it reviewed.

The concrete next actions are:

1. Create the early good-dihedral component, reassign the Definition 2.1/Lemma 6.3 material from the other CSM packet, remove `R26.6 → R27.1`, and repoint the modern-route consumers. Preserve the genuine `R26.6 → R27.3` initial-case input. Recompute ancestors after those changes.
2. Give the Artin number-field model, stable lattice, irreducible reductions and weight-one descent criteria explicit early owners and declarations. ML.1 may consume the finished R27.6 export; importing the whole later ML.1 endpoint in the reverse direction is not a repair.
3. Create/reserve the early soluble field/character supplier with the actual CHT contracts and KW local/parity refinements, then replace the gap with exact dependencies. Do not substitute R17.4's automorphic base change for field existence. Complete the new GL2 definitions, API signatures and packet-named tests against the suppliers' real types.
4. Complete /12's R24.4/RS-08 ownership handoff and /22's L7/L8/G8 arithmetic inputs to PA.3. Settle the two coarse back-edges discussed below. These require files outside this issue's allowlist.
5. In `research/blueprint/readmes/GlobalGaloisDeformations.md`, change the relative-tangent constant `#T` to `#T − 1`, keep T nonempty and the stated odd-characteristic/rank hypotheses, and retain the distinction between the adjoint and its dual in characteristic two. The packet and suggested comment already use the corrected constant. This reader is not writable in #5143, so I report the discrepancy rather than introducing an unauthorized reader edit or restoring the wrong packet formula.

## Sources actually checked

Downloads used ordinary certificate validation and reproduce the fix's hashes. I read the indicated selected pages and their proofs; this is not a new whole-paper reading or a comparison with a separately obtained Inventiones publisher copy. Page images were additionally inspected for KW I p.17, KW II p.75 and DP p.6, where bars, exponents and simultaneous local alternatives matter.

| Public source | Version and passages read in this review | SHA-256 |
| --- | --- | --- |
| [Khare–Wintenberger I](https://www.math.ucla.edu/~shekhar/papers/results.pdf) | 23-page author PDF, pp.17–21: Lemma 8.2 and proof/rationality correction, Hypothesis (H), Theorems 9.1 and 10.1, Corollary 10.2 and the weight-one discussion. | `3c389dc33e09fe847f5d8189ffd8915b5c1a73424e64e4fed6769829883bad82` |
| [Khare–Wintenberger II](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf) | 98-page author-final PDF, pp.37,40–46,63–78,81,89–92: standing hypotheses, finite-image lemma and presentation proofs, freeness/twists, Definition 7.9, Lemma 7.10, all of §8, deformation/Hecke twist compatibility, Theorem 9.7 and §10.2 assembly. Printed and physical numbering agree in this copy. | `53f45f8be3b3c7de19f42417920d34a809e908412826490ebed90f07c8e86ed4` |
| [Dieulefait–Pacetti](https://arxiv.org/pdf/2108.07577v2) | arXiv v2, 17 pages, pp.6,9–11: Theorem 1.9 and attribution, Lemmas 1.14–1.15, Pasos 1–2 and Lemma 2.1. Other source-issue verdicts remain inherited. | `0c6850dafda032f7a4008947c519b5aef8cc13762207bb67c36810170a8eebe6` |
| [Clozel–Harris–Taylor](https://www.numdam.org/item/10.1007/s10240-008-0016-1.pdf) | Published IHÉS 108 (2008), pp.116–117: Lemmas 4.1.1–4.1.2 and proofs. These are the precise missing character-extension and soluble prescribed-completion contracts, not a complete CHT extraction. | `9d3b7079440d8cd3167812bb11c25ae4b51ada973b2e98f0928624254a60156c` |

For out-of-scope findings I checked the verifier's qualified evidence and the fix's handoff against the original target; I did not freshly read every Carayol, Chenevier, Savitt, Skinner–Wiles, Washington, BLGG or routed-paper proof. Their confirmations remain the verifier's conclusions, not new independent source adjudications here. This limit does not turn an unresolved handoff into an accepted fix.

The CHT character extension uses congruence subgroups of global units and local/global reciprocity. It does not automatically preserve a requested p-power order: the p-primary projection and its local effect must be supplied. Its field construction proceeds through cyclic towers. Local finite Galois groups of number-field completions are soluble via wild inertia, tame inertia and the unramified quotient; that observation supports the source application but is not an implementation of its global construction. KW's even-degree, split/unramified-at-p, avoidance and residual-image conditions need the additional refinements specified in the gap.

The KW §8 match is substantive. The character is **supposed given** after Lemma 8.1, not produced by that lemma. Kinds (i) and (ii) overlap at residual weight two; the norm powers are integer powers. Theorem 8.2's additional weight-p+1 branch at residual weight two is retained and identified as unused later. Theorem 8.4 preserves the simultaneous p-adic cases, the restricted type-(B) condition, the boundary residual-weight requirement in type (A), the dyadic weight-four branch and its split-at-p exceptions. α and β are witness predicates and now precede minimal-level data; neither predicate asserts a modularity theorem. The exact source checks support this local repair, while the missing field and automorphic supplier signatures prevent closure.

## Pinned baseline, APIs and tests

I read the statements and surrounding hypotheses for all 25 baseline records (nine GL2 and sixteen Global) at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`, plus GL2's named completeness/Henselian instance. The shared declaration index was used only for the checker, not as a substitute for those statements. CSM claims no baseline declaration. The reviewed library-coverage/AUDIT-31 material was read; pending audits are not described as reviewed evidence.

| Declarations checked at the pin | What they supply and what they do not |
| --- | --- |
| IsReduced; Module.Free; MonoidAlgebra | Ring/module predicates and group algebras. They do not construct quaternionic automorphic modules or prove their freeness. Module.Free occurs in both packets. |
| Polynomial.Splits | A splitting predicate. It is not Hensel lifting. |
| HenselianRing; IsAdicComplete.henselianRing | Monic simple-root lifting modulo an ideal with its Jacobson condition; I-adic completeness supplies the instance. The Hecke algebra's completeness and the distinct residual root/unit derivative remain application hypotheses. |
| Group.IsSolvable; isSolvable_of_ker_le_range; isSolvable_of_isSolvable_injective | Derived-series solvability and extension/subgroup closure under the exact homomorphism hypotheses. They do not prove Dickson's classification, Borel solvability or the Galois field-prescription theorem. |
| ZMod.neg_one_ne_one | Requires `Fact (2 < n)`. It cannot distinguish oddness at p=2. |
| Algebra.FormallySmooth | Commutative R-algebras: projective Kähler differentials and vanishing first cotangent homology. This is not arithmetic representability of a deformation problem. |
| ContinuousMonoidHom | A monoid homomorphism and continuous map between topological monoids. It does not supply the Galois/idele comparison. |
| IsAdicComplete; IsArtinianRing; IsLocalRing | Completeness/separation, Artinianity and locality. They are ingredients, not coefficient categories or universal deformation rings. |
| IsPGroup | Each element has p-power order. No finite-image classification follows from this predicate alone. |
| Matrix.GeneralLinearGroup; .det; .map; MonoidHom.ker | Units of finite square matrices, determinant to units over a commutative ring, induced map along a ring homomorphism, and subgroup kernel. The coefficient and residual ring hypotheses still need the deformation supplier. |
| MvPowerSeries; ProfiniteGrp | Power-series carrier indexed by finitely supported multi-indices; a profinite space with a compatible group structure. Neither is a presentation theorem for Galois deformations. |
| TauCeti.ContCohomology.B1, Z1, H1 | B1 is the **algebraic** range of d0. Z1 intersects continuous cochains with the cocycle kernel. H1 is Z1/B1 under the continuous distributive action hypotheses that give B1≤Z1; it is a bare additive quotient, with DiscreteH1 used for the intended discrete comparison. These definitions do not identify deformation tangent spaces or compute arithmetic Selmer groups. |

The B1 wording was corrected in the Global baseline record. Its old description called B1 continuous coboundaries without the continuous-action qualification, although continuity is not part of that definition. Every Global baseline record now records this statement-level reading; no additional implemented arithmetic is claimed.

Every newly added definition has the required JSON API/test counts, and the integer exponent tests can discriminate natural subtraction from integer subtraction. Nevertheless, `AllowableBaseChange`, the actual determinant-character predicates, α/β and the automorphic constructions remain proposed code inside comments, with undeclared supplier carriers. Their packet-named tests are not all typed Lean examples against those definitions. A test of 2×2=4 checks degree arithmetic, not existence or composition of actual allowable fields. Likewise an exponent equality does not construct a global idele character with the required determinant. I have left the honest supplier omissions visible instead of inserting arbitrary Prop fields, placeholder axioms or `def _ : Prop := sorry`.

No existing compiled build at both pinned commits was available. I did not start a Lean server, create a Lake project, fetch a cache, build either library or compile these suggested files. Their historical active fragments and prior compilation claims have not been re-certified. Their headers now point to this needs_changes review, and every implementationStatus remains unchecked.

## Graph and ownership checks

Applying the accepted restructurings and the available promoted link maps to the base snapshot retains the direct `R26.6 → R27.1` edge and `R27.1 → R33.2`. In the separate declaration graph built with the checker’s integrated-node precedence and sorted blueprint fallbacks, then overriding all 167 revised nodes with these packets, no dependency cycle is reachable from any of the 167 nodes in these three packets. The registry contains 12891 nodes and 882 concrete nodes are reached. This checks declarations and their explicit prerequisites; opaque stage references and gaps are not thereby discharged.

Whole-stage projection is a different check. `R04.1/determinant-comparison` imports the specific `R04.2/carayol-trace-theorem`; projecting it gives `R04.2 → R04.1` against the forward edge. Similarly `R32.2/application-requirements` imports `R33.3/dp-dyadic-transition-and-the-order-three-type`, while the assembled stage graph has `R32.2 → R32.3 → R32.4 → R32.5 → R32.6 → R33.2 → R33.3`. These are inherited coarse ownership obstructions, not counterexamples to the mathematical theorems. The fix reports them honestly, but reporting them does not perform the layer split needed for promotion.

The actual suppliers were checked against the accepted ownership descriptions: R01.4 retains finite-image facts; R18.3 retains quaternionic freeness and dyadic twisting, through R18.6's exports; R19.5 supplies coefficient-prime compatibility; R24.3 owns the general prescribed lifts; PA.3 applies arithmetic local/global ring data while P9 keeps abstract algebraic hypotheses. I did not change or review the internal work of a Tau Ceti roadmap. The sharpened Chebotarev supplier request consumes the existing Layer 10 contract only.

## Every confirmed finding

The identifiers in the headings are the original finding IDs. **Applied locally** certifies the allowed packet correction, not every external stage or ownership edit mentioned by the finding. **Partial** means a real local repair was made but a required part remains missing. **Unresolved handoff** means this fix made no authorized mathematical correction at that target. The latter findings must resume in their own writable files.

### RT-AREA-langlands-2/1 — partial

The revised Lemma 8.2 correctly uses prime-field coefficients, p≡1 mod4, the finite-image classification and odd residual representation, without the late R15.6/Dickson package. The proof's abelian-intersection compatibility agrees with KW I pp.17–18. I sharpened the existing Chebotarev request to the named density theorem, its positive-density conjugacy-class input and finite-removal consequence. The packet checker treats every tauceti-prefixed prerequisite as a library declaration; it cannot encode this upstream roadmap stage in that list without a false baseline claim. The real stage remains named in the supplier request and proof step, and no implemented Chebotarev theorem is invented. However, its parent is still the unsplit R27.1 and the assembled `R26.6 → R27.1 → R33.2` path survives. The proposed component and reassignment of Definition 2.1/Lemma 6.3 are not completed. Keep this high-severity stage repair open.

### RT-AREA-langlands-2/2 — unresolved handoff

The AGR Taylor construction/irreducibility and unrestricted even-degree compatibility nodes are outside these packets. Adding R19.2/R19.5 imports to GL2 does not create the missing Taylor 1989/1995 supplier results or remove Carayol's finite discrete-series hypothesis. Resume the exact AGR source nodes and their consumers; retain the verifier's qualification about the unread sources. No unconditional supplier is certified here.

### RT-AREA-langlands-2/3 — unresolved handoff

R23.3's potential residual modularity input list and the claim that lifting occurs only after the residual step are unchanged by this job. The new R22.1 Theorem 8.2 node makes an explicit potential supplier available, but it does not add R19.2, the auxiliary lifting, Hida or weight-part inputs to R23.3. The owner must amend R23.3 and its application table and check their exact source hypotheses and ordering.

### RT-AREA-langlands-2/4 — unresolved handoff

The R17.4→R19.2 base-change dependency and the extraordinary dyadic/non-normal cubic compatibility input were not repaired in the writable packets. A mention of automorphic base change in GL2 §8 is a different application and does not supply Carayol's missing dependency. Resume AGR/GL2 transfer with the cyclic, non-normal cubic and Weil-restriction comparisons kept distinct.

### RT-AREA-langlands-2/5 — unresolved handoff

The Deligne special-fibre node is outside the deliverables. The verified two-component Frobenius/Verschiebung correction and the p.157 sourceIssue still need their AGR edit; this review does not certify the existing erroneous universal one-subgroup statement. Distinguish ordinary and supersingular fibres and test the actual two-term correspondence at the owner.

### RT-AREA-langlands-2/6 — unresolved handoff

Chenevier's Theorem 2.22(i), split residual determinant and finite-field Brauer input were not added to their reconstruction owner here. The existing algebraically closed residue-field gap is not closed by a new GL2 witness statement. Resume the AGR/IHG ownership decision and replace the overly restrictive Theorem B application with the qualified henselian-local theorem, retaining any separate continuity problem.

### RT-AREA-langlands-2/7 — unresolved handoff

Savitt's residual-weight/ordinarity results and the Breuil–Mézard input belong to the R07/R24 suppliers and the other CSM part. No writable node in this fix supplies them. Keeping an unread-source gap is honest but is not the requested construction. Resume their exact tame types, weights and descent-data hypotheses at R07.5, then update the applications without duplicating the local theorem.

### RT-AREA-langlands-2/8 — partial

The new R27.6 Artin export has the correct odd, irreducible, finite-image complex scope and weight-one conclusion of KW I Corollary 10.2(ii). I replaced the incomplete excerpt with that conclusion. The regular-system endpoint remains in CSM, while the general irregular compatible-system endpoint stays with ML.1. The finite-image number-field/lattice bridge and early Gross/Coleman–Voloch/Khare descent contracts are still gaps, and ML.1's registry narrowing/imports have not been applied. The new export is a useful specification, not a closed proof plan.

### RT-AREA-langlands-2/9 — unresolved handoff

The weight-two special-fibre Eichler–Shimura owner and the R14.6→R19.1 application were not changed. The reviewed audit flags this distinction: R19.1 must consume the Jacobian relation and retain only its higher-weight coefficient extension. Nothing in the new Artin export settles that earlier duplicated construction. Resume the AGR/modular-curves application boundary.

### RT-AREA-langlands-2/10 — unresolved handoff

The generic compatible-system carrier and eigenspace purity remain outside these three packet corrections. The required R24.5:operations/R34.6 inputs and R19.3 narrowing must be applied at their owners. Referring to compatible systems in CSM does not make those generic operations or purity results an AGR-owned construction. This review does not re-certify a pending restructuring as accepted.

### RT-AREA-langlands-2/11 — unresolved handoff

The shared consecutive-prime estimate, explicit Chebyshev bound and finite check reside in the other CSM part/R26.3–R27.2. This fix's Lemma 8.2 correction concerns a different prime selection argument. Resume the single-owner estimate and its consumer link; do not count the unchanged duplicated prime-estimate plans as repaired.

### RT-AREA-langlands-2/12 — partial

KW II Theorem 9.7 and pp.89–92 verify the local repair: R22.5/R22.6 use the prescribed §8 witness and R=T, without Theorem 10.1 finiteness or Theorem 6.1 potential modularity. The node prerequisites now include Theorem 8.4. However, the full KW I Theorem 4.1 assembly is still described as occurring at R24.4, whose source stage still follows R24.3, and the RS-08 external keeps remain a handoff. Reading §10.2 supports removing that artificial placement; the local sentence change alone does not perform it.

### RT-AREA-langlands-2/13 — partial

The eight new §7.6/§8 nodes cover allowable base change, determinant kinds/adjustment, Lemma 8.1, Theorems 8.2/8.4, Lemma 8.3 and the level-raising induction. Their cases and source locators match the selected full proofs. α/β have early R22.1 parents and no self-dependency on their prescribed-witness conclusion. I corrected β's copied α excerpt. The early field/character construction and the full supplier-typed APIs remain missing, so §8 coverage is materially improved but still not closed. The distinct Kisin/Gee prescribed-type contracts must remain open.

### RT-AREA-langlands-2/14 — unresolved handoff

The general Kisin coefficient-prime compatibility supplier belongs to AGR R19.5 with R08.3's family theorem and Taylor interpolation. GL2 requests it but does not construct it, and this job cannot add the owner node or atlas link. Resume that unrestricted theorem, retaining residual irreducibility and source type conditions. Saito under Carayol's parity/discrete-series scope is not automatically a replacement.

### RT-AREA-langlands-2/15 — applied locally

Global's existing R01.4 prerequisite is retained and its request now specifies the actual finite subfield, dyadic nonsolvable image, invariant spaces, adjoint submodule list and H¹ vanishing of KW II Lemma 4.3. I checked the lemma and proof at pp.40–41 with the standing hypotheses on p.37. The global dual-Selmer conclusion remains R02.6's; no finite-group classification is duplicated at R04.5. The arithmetic supplier proof is still requested, and any missing owner-stage direction remains an external handoff.

### RT-AREA-langlands-2/16 — unresolved handoff

The local Tate-duality/Euler-characteristic dependency into R08.1 and its descendants is outside these packet edits. Global's R02 inputs cannot substitute for a missing local deformation-ring supplier dependency. Resume the R08 application link to the existing ClassFieldTheory Layer 5 contract and the named dimension/smoothness uses. No internal Tau Ceti work is replanned or reviewed here.

### RT-AREA-langlands-2/17 — unresolved handoff

The Berger–Li–Zhu local criterion still needs its upstream single-owner placement and correction of the R21.5/R08.5 order. This fix did not modify R06.4, R08.5 or the accepted owner records. Resume the local theorem before both consumers and coordinate /31's φ,Γ inputs; importing a downstream R21.5 result into R08.5 without that reassignment would retain the cycle problem.

### RT-AREA-langlands-2/18 — unresolved handoff

The duplicate potentially semistable deformation-ring construction in R08.3/L7 was not changed. The required rank-general Kisin construction, determinant variants and L7 narrowing belong to the local-ring owner. Global's G8 variable-determinant data and GL2's rank-two applications do not settle this rank-general overlap. Keep the owner handoff explicit rather than claiming the old split is sufficient.

### RT-AREA-langlands-2/19 — applied locally

R22.2 now imports R18.3's quaternionic freeness/twisting results through R18.6 and keeps Galois-dependent control and compatibility with deformation twists. KW II pp.63–68 and p.81 support this separation: isotropy quotients and the correct ∆ action matter for freeness, while identifying roots/actions uses the attached Galois representation. The formula f↦fχ(Nm) is not reproved as a second automorphic construction. The external owner-record reconciliation remains a handoff; the retained typed API and granularity gaps are not closed.

### RT-AREA-langlands-2/20 — applied locally

The revised CSM R27.5 node imports R22.6/hypothesis-h, including the Breuil–Kisin step, and keeps Theorem 9.1's source-specific weight-four/even-conductor argument. KW I pp.18–19 justify that boundary. No second derivation of (H) is introduced here. The RS-06 keeps/owner entry must still be reconciled externally with RS-08; this local acceptance does not accept conflicting global ownership records.

### RT-AREA-langlands-2/21 — unresolved handoff

The modern-route reducible reduction at an already ramified coefficient prime still needs the R32.6/R24.6 owner correction in the stage documents. The review does not promote almost-strict compatibility to a Weil–Deligne statement at that prime. Keep R24.6's reduction/specialization operations and import the source-scoped de Rham transfer only from the owner selected by the maintainer.

### RT-AREA-langlands-2/22 — partial

All three G8 nodes now identify PA.3 as the arithmetic consumer, while P9 retains abstract hypotheses. That is the right local export boundary and preserves full-adjoint, determinant and rank conventions. It does not add L7/L8/G8 to PA.3's stage inputs or narrow the L7 consumer text. PA.3 still has only P9 and PA.0 in the base description. The required three stage links and the corresponding local consumer correction remain outside this issue's allowlist.

### RT-AREA-langlands-2/23 — unresolved handoff

The R23.2/H6 moduli duplication and obsolete R10 reference were not repaired in these files. Resume R23.2 as the auxiliary-prime/local-open application of H6's actual twisted moduli, keeping geometric irreducibility and real/local points at H6. A GL2 field-selection gap does not narrow this moduli construction or remove the stale owner.

### RT-AREA-langlands-2/24 — unresolved handoff

R23.5's duplicated automorphic base change/descent statement still requires narrowing and the R17.6 application link. GL2's revised gap correctly distinguishes constructing a field from applying automorphic base change, but that does not rewrite R23.5. Resume its splitting/disjointness/local-completion control while importing the actual R17.4/R17.6 automorphic results.

### RT-AREA-langlands-2/25 — unresolved handoff

R23.1's Moret–Bailly statement has not been broadened to the split, unramified and algebraic-local-open alternatives. CHT's soluble prescribed-completion theorem is a separate result, not that missing generality. Resume the HSBT/BLGHT source form over an arbitrary smooth geometrically connected variety, with its Galois-invariant local opens and linear disjointness, before accepting the routed Qian/CG/Kisin applications.

### RT-AREA-langlands-2/26 — partial

The GL2 gap now names CHT Lemmas 4.1.1–4.1.2 and the additional KW local/parity requirements accurately. I read those proofs; no claim that R17.4 already constructs such fields remains in the new early plan. However, the proposed R23.1:soluble-extensions component is neither live nor reserved. It has no actual supplier nodes or typed field/character interfaces. The whole later R23.1 import would give the wrong order. Keep this as a missing construction until its early owner exists and its dependencies are supplied.

### RT-AREA-langlands-2/27 — unresolved handoff

The Chebotarev/Frobenius-generator input to R23.1 and its descendants was not added. My Chebotarev contract correction is confined to the CSM request for Lemma 8.2 and cannot stand in for this different consumer. Resume the finite-avoidance generator lemma and the R23.1 application edge to the existing density contract; no upstream Chebotarev construction is planned again.

### RT-AREA-langlands-2/28 — unresolved handoff

The totally real base-field version needed by the BCGP route has not been added to R23.3/R23.2/H6. The new §8 theorem is conditional on α/β over a given F and does not prove Snowden's potential residual modularity theorem over arbitrary totally real F. Resume that exact source theorem, local types and restriction-of-scalars input at its owners.

### RT-AREA-langlands-2/29 — unresolved handoff

The CG finiteness route beyond KW's permitted local deformation rings is unchanged. Nothing in the R22.1 witness repair proves the required ordinary/unrestricted higher-rank finiteness statement. Resume either the Thorne/ordinary generalization with its hypotheses and suppliers or mark that routed application unplanned. The existing GL2 KW-specific R24.1 label is not sufficient evidence.

### RT-AREA-langlands-2/30 — unresolved handoff

Skinner/Blasius–Rogawski coefficient-prime compatibility and strict Brauer-induced systems were not added to AGR/R24.5/R24.6. The existing almost-strict source variant is kept honestly. Removing its qualification without supplying the unrestricted local–global theorem would be wrong. Resume the stronger theorem and distinguish it from the historical KW form.

### RT-AREA-langlands-2/31 — unresolved handoff

The Wach/φ,Γ-module inputs for the BLZ criterion remain an owner dependency problem outside these packets. Coordinate the PG.6 supplier with /17's early R06.4 local-owner placement rather than adding an isolated downstream edge that leaves the old ownership conflict. This review did not independently reconstruct the BLZ family proof.

### RT-AREA-langlands-2/32 — unresolved handoff

Washington's bounded p-primary class-group theorem in an ℓ-adic cyclotomic tower, p≠ℓ, has not been planned at IntegralIwasawaTheory L4 or linked to R21.5. It is distinct from Ferrero–Washington μ=0. Resume that exact source statement and the Skinner–Wiles application; no result in the present fix substitutes for it.

### RT-AREA-langlands-2/33 — unresolved handoff

The R17.4 solvable totally real descent input to R21.5 remains outside the fix. The current GL2 application of R17.4 is not a dependency repair for the ordinary supplier. Resume the ordinary stage link and its source-scoped use of Gérardin–Labesse descent, checking that the chosen ownership amendments remain acyclic.

### RT-AREA-langlands-2/34 — unresolved handoff

The BLGG13 ordinary modular-lift theorem needed by the BCGP route has not been added. Hida families and ordinary R=T do not themselves construct such a prescribed lift. Resume a later ordinary node with its determinant, inertia and cyclotomic irreducibility hypotheses; preserve its potential-modularity ordering so it cannot feed an earlier application of itself.

### RT-AREA-langlands-2/35 — unresolved handoff

AutomorphicCongruences L5w still needs its deformation and ordinary R=T inputs and an application-only scope for the Fujiwara/BCS/Wan instances. This job cannot add those supplier stage links. Neither the new GL2 witness nor Global's G8 exports is the missing minimal Hilbert deformation/Hecke comparison theorem. Resume the named application and nonordinary alternatives at their owners.

### RT-AREA-langlands-2/36 — unresolved handoff

The Annals killing-ramification locator in R26.1/R24.3 lies outside the writable packets. The original handoff correctly distinguishes the published §6.2/Theorem 6.2 from old preprint numbering and the low-weight base cases. I have not silently described an unchanged stage citation as corrected; resume those version-specific references and the separate Böckle-appendix attribution.

### RT-AREA-langlands-2/37 — applied locally

The revised Global source dictionary matches the author-final pages: Lemma 4.4 gives generators, Lemma 4.6 gives relations inside the dimension argument, Proposition 4.5 gives the lower bound, and Corollary 4.7 additionally requires finiteness to obtain a characteristic-zero point. The ESI Lemma 4.5 locator is retained only as an explicitly older-version relation bound. R03.4 owns the algebraic point argument and R24.2 its arithmetic application. The RS-08 locator amendment remains external; this correction does not fix the reader's separate #T discrepancy.

### RT-AREA-langlands-2/38 — unresolved handoff

R21.6's duplicated classical Hida-family clause was not deleted or narrowed. PadicFamilies L0/L1 remains the owner/supplier of that family, while an ordinary roadmap may export its comparison of arithmetic specializations. Resume the stage wording; no consumer or construction here justifies retaining a second p-adic L-function family plan.

### RT-AREA-langlands-2/39 — applied locally

The stable R33.2 insertion node is now only Paso 2, with R24.3 retained as the general prescribed-lift supplier and Paso 1 as an explicit input of the weight-two system. DP pp.6,10–11 show why a split coefficient prime, residual weight two, the Lemma 1.15 congruences and the specified inertial type are necessary. It no longer asserts all four cases of Theorem 1.9 or confuses finite projective dihedral image with the full decomposition-group image. The general Gee/Snowden lift-existence proof remains the supplier's work.

### RT-AREA-langlands-2/40 — unresolved handoff; correct target identified

The fix's handoff row names PAPER-QIAN-23, but the finding actually targets **`PAPER-LE-LEHUNG-LEVIN-ETAL-20.result.json`, item `PAPER-LE-LEHUNG-LEVIN-ETAL-20/cited-base-change`**. Resume that item, not an unrelated Qian item. Its GL_n/unitary base-change and Galois-side solvable automorphy descent cannot be supplied by R24.5's two-dimensional compatible systems. Use the qualified ET.7a/PA.5 route only after matching the exact output, or record it missing. The paper route is outside this issue's deliverables and remains unchanged.

## Corrections made in the allowed files

1. CSM’s existing Chebotarev request now specifies the named Layer 10 density theorem and its finite-removal/splitting consequences. The checker’s tauceti-prefix collision prevents listing a roadmap stage as a normal prerequisite without falsely claiming an implemented baseline declaration; the precise request and proof step retain that real supplier. No stage or library implementation is invented.
2. CSM's new Artin node now has a source excerpt including Corollary 10.2(ii)'s weight-one conclusion, instead of only the beginning of a hypothesis.
3. GL2's β source excerpt and match identify β's conductor/weight conditions rather than copying the preceding α excerpt. The witness predicates themselves are unchanged.
4. Global's B1 baseline description distinguishes the algebraic range from continuity under the action hypotheses. Its baseline records document the new pinned statement-level reads.
5. The current review objects are replaced by this review, with prior objects preserved. The suggested-file revision headers record needs_changes; no placeholder high-level API was invented.

I did not edit the fix report, readers, other packets, source graph, owner records, proposals, link maps, paper routes, campaign files, data or upstream Tau Ceti files. The /40 routing correction is documented here because its handoff row is outside the allowlist. Existing node IDs, source-issue payloads/verdicts, baseline references, packet partial statuses and unchecked implementation statuses are preserved.

## Validation

The final checks passed:

- `check_blueprint.py` with the unchanged pinned declaration index: all three packets, zero errors and zero warnings (33, 68 and 66 nodes).
- `check_errata.versions_checked`: no errors for any packet. All 19 source-issue payloads and existing verdicts are unchanged.
- Exact coverage of all 40 unique finding IDs: five applied locally, six partial, and 29 unresolved handoffs. These are fix dispositions, not new red-team truth verdicts.
- Existing node IDs, partial packet statuses and unchecked implementation statuses preserved; earlier review objects retained verbatim, including the separate Global acceptance.
- Authoritative concrete dependency graph: 882 nodes reachable from the 167 revised nodes, zero cycles. The stage obstructions are separately reported above.
- Intake file check: seven files, zero problems; exact issue deliverable allowlist and no private filesystem paths. `git diff --check` passes.

The initial attempt to put the upstream Chebotarev stage in the ordinary prerequisite list triggered the checker's tauceti-prefix/baseline collision. It was replaced by the precise existing supplier request rather than a false baseline declaration; the final check passes. There are no link maps or restructuring proposals among this issue's deliverables, so their checkers are not applicable. Lean compilation is not claimed for the reason above. The remaining work is specified per finding; this is a completed independent review with needs_changes verdicts, not a claim that all 40 fixes were implemented.
