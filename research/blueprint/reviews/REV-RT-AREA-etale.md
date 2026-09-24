# REV-RT-AREA-etale

Complete independent verification of all 40 findings in RT-AREA-etale for issue #1516.
Verifier: **Codex — codex-hjdg0j**, 2026-09-24. The red-team author was
Claude Code — cc-38267a; this verifier did not produce RT-AREA-etale.

**37 confirmed; 3 rejected (10, 24, 36).** The confirmed findings comprise
6 high, 27 medium and 4 low records. A confirmation authorizes only the corrected
scope in its reason, not every assertion or proposed edit in the original finding.
The JSON is the machine-readable decision record; each reason is reproduced below.

## Baseline and method

Repository baseline: `eeb25aee3a81546e066d158c99c6f2bf91d66c88`.
Read the result/report, relevant roadmap and decomposition contracts, reviewed
coverage entries, restructuring decisions and paper items/routes/reviews. Read
primary sources at the indicated locators rather than relying on the attacker's
quotations. Public source URLs and precisely recorded PDF pages appear below.
This is verification of the forty findings, not a new complete audit of every
paper or proof in the area.

Checked pinned Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`
and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`.
The six source files inspected were checked against their pinned Git blob hashes.
Fresh full-tree searches covered weights/equidistribution/Lang–Weil, stack and
perfect-space coefficient foundations, Artin–Schreier sheaves/Fourier transforms,
alterations, duality, nearby cycles, pro-étale derived comparisons and Habiro terms.
Searches are supporting negative evidence, not proof that no conceivable
implementation exists. Existing sites, generic sheaf cohomology, linear algebra,
Witt algebra and ordinary derived-category infrastructure must be reused.

Read-only assembly of the snapshot gives 2608 stages and 7361 stage-edge records.
Reachability includes both explicit edges and stage prerequisites, with integrated
fine decomposition nodes. The coarse edges DWP.0→RD.6, L3→EDC.6 and SF.2→L1
have no reverse paths at this baseline; testing their union introduces no cycle.
The fine L3→EDC.6 supplier links already exist. New suffixes/Part IIs require
fresh graph validation when the fixes choose their final boundaries.

The queue's accepted_routes function requires an overall **accept** verdict.
Abe25 and Yang–Zhao25 are **revise** despite individually accepted routes.
Their shared-id overwrite is a reproducible latent generator defect, not a
currently active prompt loss. ST17, HW16, BN23 and Jannsen16 also remain revise;
this review does not promote their routes.

## Corrections the fixer must retain

- Preserve the three rejected boundaries: R34.4 is an intentional imported
  pencil adapter; E4 supplies the generic reconstruction used by L0; HQ.5
  supplies the cohomology functor that HR.6 identifies in degree zero.
- Stack operations need separate boundedness hypotheses. Huber valuation
  constructibility is not the general ULA equivalence. Algebraic henselian
  rigidity is not automatically the same as the analytic pro-special comparison.
- Reuse the pinned Serre-class localization, but retain the Ind/perverse
  instantiation and universe obligations. A new interface is not grounds for
  rebuilding the existing quotient machinery.
- Implement the accepted Habiro ownership partition with the needed removals
  and promotions. HQ.2 owns the twisted q-de Rham branch; q-Witt exports,
  framed q-differences, q-Habiro-Hodge and completed q-Hodge remain distinct.
- Complete missing source/proof obligations before declaring new theorem nodes
  closed. This review does not prove Lang–Weil/Ekedahl, the proposed algebraic
  Picard–Lefschetz prefix, analytic Habiro smoothness, or scheme-level Habiro
  perfectness merely by naming their expected proof ingredients.

## Pinned positive checks

- [IsSerreClass](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Abelian/SerreClass/Basic.lean#L47).
- [isoModSerre and its two-out-of-three instance at 161](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Abelian/SerreClass/MorphismProperty.lean#L66).
- [map_eq_zero_iff; abelian/exactness/isIso_map_iff at 417–444](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Abelian/SerreClass/Localization.lean#L141).
- [scheme pro-étale site, not the left-completed derived comparison](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/Sites/Proetale.lean#L52).
- [big and small étale topologies](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/Sites/Etale.lean#L40).
- [generic Sheaf.H, not a stack six-operation package](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Sites/SheafCohomology/Basic.lean#L59).

## Finding-by-finding decisions

### RT-AREA-etale/1 — confirmed (high)

Schiffmann v2 Proposition 4.8 and Appendix B (pp.35–36) prove density of occurring Frobenius tuples, not purity of an individual tuple. The accepted route 3 incorrectly assigns this to DWP.0's spectral bookkeeping. Weil II 3.5.1–3.5.3 (pp.210–211) and Katz–Sarnak 10.1.16/10.2.2 (pp.299/301) supply distinct equidistribution and maximal-monodromy inputs absent from the described DWP/LPV stages and the pinned search. Add these downstream of the actual Weil II estimates and monodromy suppliers, extending the existing LPV Part II direction; retain DWP.0 for weights. Preserve arithmetic/geometric monodromy and component/coset hypotheses: the Katz–Sarnak statements concern explicit hyperelliptic/Artin–Schreier families and need a moduli-family passage. Also do not copy Appendix B's ordinary (-1) Tate twist as a weight-zero normalization: its displayed normalized eigenvalues are q^{-n/2} times the weight-one eigenvalues and need an explicit chosen unramified scalar normalization. Correct its [D1] bibliography to Weil II. No assertion that the newly added proof dependencies are already closed.

### RT-AREA-etale/2 — confirmed (high)

Both CS19 route 3 and CS24 route 4 have overall accepted reviews. The former adds absolute-purity-input and generic supported cohomology to SF.2; the latter owns absolute purity in EDC's Part II. ILO XVI Definition 2.3.1 and Theorem 3.1.1 (v1 pp.233,242), and CS24 3.1.3–3.1.4 (v3 pp.30–31), verify the shared prime-to-characteristic regular-pair theorem and its local specialization. Give the general theorem one EDC Part II owner, importing the early scheme site/six-operation prefix; the SF.2 Brauer suffix imports the theorem. Supported cohomology imports EDC.0. Do not introduce a coarse SF.2↔PartII cycle or confuse this theorem with smooth-pair purity. LI-LIU-21's unreviewed item is a future routing correction, not an accepted route.

### RT-AREA-etale/3 — confirmed (high)

EDC's README explicitly restricts its principal geometry to separated finite-type schemes over a field. Lafforgue v10 §4.2 p.65 constructs Rf_! of an intersection complex on a finite-type DM shtuka stack using LMB/LO; GS.1/GS.3 and ET.2b really need that additional scope. YZ17/35 and YZ19/120 are missing items routed into scheme EDC.8, not existing stack theorems. RS-22 explicitly leaves stack descent in GS.3, while no common coefficient supplier closes it for the other consumers. Plan a shared stack extension importing the scheme theory, stack geometry and abstract descent. Crucial correction: LO II pp.1–2 uses D_c, D_c^+ and D_c^- and explicitly needs unbounded complexes for Artin-stack pushforward. Do not promise preservation of D_c^b by all six operations on arbitrary Artin stacks, or an unrestricted stack decomposition/trace theorem. State the finite-type, stabilizer, representability, coefficient and support hypotheses separately; the proper smooth separated DM correspondence case is the immediate YZ consumer. Keep shtuka truncations and colimit/Hecke-finiteness as application work.

### RT-AREA-etale/4 — confirmed (high)

The L5 decomposition explicitly stops its reading before de Jong 5.11–5.13. I read 2.24 (p.62), 4.17 (p.71) and 5.13 (p.80): pointed stable-curve moduli, projective finite scheme covers carrying a curve, and the closure construction are actual inputs. Yuan route 10 is accepted but specifies unpointed g>1 moduli; Landesman–Litt route 5 independently adds pointed moduli to R09.4. Extend StableReductionPartII to the stable pointed range 2g−2+n>0 with the finite-cover/compactification theorem, importing generic stack/coarse-space machinery and the upstream DVR stable-reduction theorem. Retarget the shared pointed-moduli content and add the specific supplier to the scheme-alteration prefix of L5. This is a missing source/hypothesis closure, not a claim that upstream StableReduction proves stack properness.

### RT-AREA-etale/5 — confirmed (high)

ECD Proposition27.2, pp.163–164, applies Huber3.8.1 in characteristic p after reduction to affine m-space for arbitrary finite m. Huber p.228 explicitly sends that proof to Berkovich §7.5 and requires compact-support comparison5.7.2 and duality7.5.3. Berkovich7.5.2, printed p.147, uses relative smooth pure-dimension-d duality after shrinking until compact-support cohomology is locally constant. H3 explicitly restricts its duality construction to curves. Zavyalov’s accepted route5 adds all-dimensional absolute duality/traces and the Huber–Berkovich interfaces, but does not state this general relative theorem. Add the relative smooth suffix and import it into H5; keep the curve prefix available early. State the actual Huber7.5.1–3 scope: separated, taut, smooth analytic pseudo-adic morphisms of pure dimension d, quasi-separated target, and torsion order prime to the relevant residue characteristics. The source is not an unrestricted duality theorem for arbitrary smooth analytic maps or residue-characteristic torsion.

### RT-AREA-etale/6 — confirmed (high)

The live HQ.5/trace texts do not implement the accepted PLAN-HABIRO §6.5 split. Wagner q-Hodge v2 Theorem 4.22, pp.62–66, requires a lift of R∞=(R⊗A A∞)^∧p, with the stated p-torsion-free quasi-lci and relative semiperfect hypotheses; its proof explicitly uses ku Theorem 4.17. That theorem, p.45, includes p=2 through Theorems 4.14/4.16, pp.43–45, whereas live RT.4:q-Hodge only states the 2-inverted E₂ theorem. Add the separately scoped E₁ input to RT and import it into HQ.5-trace, retaining the stronger original theorem separately. For (a), MW v4 Lemma 3.16, pp.38–40, constructs the divided-power lifts; 3.17 is its auxiliary torsion-freeness lemma. Correct the locator in the plan as well as the live stage. This is partly an unapplied accepted ownership decision: the accepted plan already assigns the MW lemma to HQ.5, so it is not literally without a planned owner. Record the version-specific numbering discrepancy without claiming a new mathematical error.

### RT-AREA-etale/7 — confirmed (medium)

The accepted Browning–Sawin route supplies only a fixed-variety extension-field Lang–Weil asymptotic to FF.2; the rejected HW16/BN23 routes do not currently supply a usable plan. HW16 v4 p.44 explicitly needs uniform good-model rational points and Ekedahl Lemma 1.2 to realize the permissible geometric Galois elements after the specified splitting of constants. WC.5's smooth-projective contract cannot replace these. Extend the existing FF.2 owner to uniform quasi-projective estimates with bounded embedding/boundary data and the geometric Chebotarev application, importing FA.5's constant-field conventions. BN23/87 then imports the fixed-variety specialization; HW16 needs the genuinely stronger model-uniform theorem. Original Lang–Weil/Ekedahl proofs remain explicit source-closure tasks of that extension: this verification reads the consumer proof and does not certify a complete proof of those external estimates. Do not demand every arithmetic conjugacy class at an arbitrary residue degree.

### RT-AREA-etale/8 — confirmed (medium)

Read all seven cited extraction items and their available reviews. RS-17's canonical owners differ from their stored planned/source fields: curve RH belongs to DWP.1; divisor-series rationality to FA.5 with WC.1 comparison; finite-field Chebotarev to FA.5 with DWP.3's ell-adic passage; proper-smooth/sheaf-coefficient purity to DWP.7 (DWP.6 for the curve intermediate). Update these supplier fields while preserving application adapters. In particular SKINNER-20/71 must retain AutomorphicGaloisRepresentations:R19.1 for Eichler–Shimura: replacing its whole planned list by DWP.1 would lose a required supplier. ST17 has overall revise, so its individually accepted routes are not currently active queue inputs; CARO-PASTEN and LI-LIU-21 have no accepted review at this baseline. Correct the records without describing all of them as accepted jobs.

### RT-AREA-etale/9 — confirmed (medium)

RD.6 explicitly redefines algebraic/iota weights; DWP.0 owns exactly those coefficient-independent predicates. The assembled graph has no DWP.0→RD.6 path. Import DWP.0's generic predicates and spectral algebra, retaining RD.6's isocrystal pointwise purity, Fourier transform, trace formula and p-adic weight estimates. Add the dependency after an acyclicity check. The reviewed DWP.0 coverage and fresh pinned searches distinguish absent Weil-weight structures from existing linear algebra; no replacement definition is justified by a change from ell-adic to p-adic coefficients.

### RT-AREA-etale/10 — rejected (medium)

RS-17 deliberately retains R34.4 as a supplier-indexed arithmetic pencil adapter, with LPV.3–5 owning the geometric theorems. Its current stage already says to import them. No current outgoing edge does not show that this adapter replans those theorems or justify deleting an accepted layer. RS-17 also explicitly preserves the independent R34.1–4 prefixes and says the Part II label imposes no full Weil II prerequisite on the Faltings/semistable lanes; R34.3's LPV-only prefix is therefore a recorded design decision, not an overlooked exception. Improve eventual consumer links if needed, but the proposed deletion is not supported.

### RT-AREA-etale/11 — confirmed (medium)

The accepted absolute-purity brief uses the cycle-class map but supplies no general-base regular-immersion construction; YZ25 T16 separately requests ILO XVI 2.3.1. Reading that definition (v1 pp.233–234) and XVI 3.1.1 (p.242) separates the class for a regular immersion from its being an isomorphism when both schemes are regular. EDC.3's smooth-pair-over-a-field construction does not cover this scope. Give the general class one early owner, with general-base exceptional pullback as a prerequisite, and import it into RelativeTraces and the purity proof. YZ25's overall verdict is revise: this is a shared-owner conflict in a proposed extension, not two currently active accepted routes. Do not infer purity in a singular ambient scheme, or create a class→six-operations→purity cycle.

### RT-AREA-etale/12 — confirmed (medium)

LS25 v5 pp.21–22, Lemmas 3.8–3.9, explicitly use the conormal characteristic cycle of a smooth hypersurface and Krämer's clean-cycle/Gauss-map criteria in characteristic zero. The accepted convolution brief imports perverse sheaves but gives no characteristic-cycle foundation. The proposed YZ25 route 5 is characteristic p>0, and its reference to preserving the ST17 characteristic-zero brief is unsupported because that route was rejected. Moreover YZ25 has overall revise, so even its individually accepted characteristic-p route is not active. Provide a sourced characteristic-zero microlocal foundation, with comparison to the chosen complex/étale coefficient realization, and import its conormal/index/Gauss-map interfaces into the convolution application. Keep Krämer's application-specific convolution criteria there if appropriate; do not assume positive-characteristic Saito theory supplies the characteristic-zero branch.

### RT-AREA-etale/13 — confirmed (medium)

At the pinned Mathlib commit, ObjectProperty.IsSerreClass (Basic.lean:47) and isoModSerre (MorphismProperty.lean:66) supply the exact kernel/cokernel criterion of Yun–Zhang Definition 3.32, published p.445. Its two-out-of-three instance is at line161. SerreClassLocalization.map_eq_zero_iff (Localization.lean:141) supplies the image criterion, while abelian, preservesFiniteLimits, preservesFiniteColimits and isIso_map_iff (417–444) provide the quotient and its exactness/invertibility interface. The existing calculus of fractions supplies the localization, with additive structure and the standard universal property. Thus route9 must import this machinery rather than plan it again. Items63/64/176 remain partial, not completely library-built: instantiate the Serre class for the essential image of an essentially small finite-length abelian category in Ind(C), handle universes/skeletons, and prove the constructible-perverse hypotheses. The paper itself uses mc-maps and actions (pp.445,448), not a named quotient construction; preserve that distinction and the extraction supplement. Do not compress the remaining geometric/universe obligations into an unsupported claim that only one trivial lemma remains.

### RT-AREA-etale/14 — confirmed (medium)

BS20 v3 p.8 and FSY22 v5 p.4 use the same rank-one additive-character local system; YZ25 v4 Theorem 6.3 and §6.4 pp.45–46 build the local Fourier kernels from it. The extraction records assign its construction to FF.2, the proposed GeneralBasesFourier extension, and the Kloosterman roadmap independently. Give the finite-etale-torsor/isotypic construction one shared owner (FF.2's accepted route is available), covering F_p and F_q via trace and scalar pullback, finite coefficients containing the character and their characteristic-zero realizations. Keep Kloosterman direct images and local nearby-cycle kernels as consumers; link the global Fourier transform to the local transform with a precisely normalized comparison. Abe/YZ overall reviews are revise, so these are proposed duplicates to resolve before their design activates, not three already-active blueprints. No pinned sheaf-theoretic Artin–Schreier construction was found; elementary Artin–Schreier field/quadratic-polynomial results do not provide it.

### RT-AREA-etale/15 — confirmed (medium)

Confirm the missing shared-foundation boundary, especially the direct overlap between Abe Lemma 1.4 (pp.4–5 in the public arXiv text) and L2's expressly owned general-scheme continuity/derived-coefficient work. Import or extend L2 for Hom continuity and the 2-colimit D_c^b equivalence with the actual coherent-scheme/affine-transition/Noetherian-coefficient hypotheses. Narrow the second claim: Huber 4.2.4–4.2.5 (p.243) gives valuation-base RPsi base change and degreewise constructibility. It does not itself prove Abe's construction over an arbitrary absolutely integrally closed coherent base (Theorem 1.5, p.6) or the Hansen–Scholze ULA equivalence/perfect-constructibility package used by YZ §6.4. Import H1's matching valuation specializations with comparison maps and retain the genuinely broader ULA/oriented-topos/modification theorem as an extension. Do not re-mark A14/A07 as fully supplied by H1. Both proposed briefs remain inactive under overall revise.

### RT-AREA-etale/16 — confirmed (medium)

Zhu's A.3.1–A.3.3 (arXiv v3 pp.54–55) really transports coefficients/operations through finite-type models to separated pfp perfect algebraic spaces; §2.2, equation (2.2.10), p.24 applies Braden's theorem to a model. These are outside the stated EDC scheme scope, and equivariant categories add another boundary. Route 7 is overall accepted but its scope extension needs explicit Part II layers under protocol §16, not a blanket source assignment to EDC.0–7. Reuse GS0:Witt-geometry's perfect-space carrier and L2's invariance, share finite-level equivariant descent with the stack extension, and retain in-scope model results as imports. Hyperbolic localization must carry its G_m-monodromic hypothesis. Preserve the extraction's existing A.3 normalization/connected-kernel proof gates; the wrong source-route kind does not authorize silently correcting or claiming those proofs.

### RT-AREA-etale/17 — confirmed (medium)

The assembled graph lacks the coarse L3→EDC.6 dependency; neither direction is reachable, so adding it is acyclic. EDC.6 explicitly consumes the characteristic-p comparison and its decomposition review records the unresolved integration request. Qualification: the finer supplier links are already present: L3/full-faithfulness-27-2→EDC.6/scheme-adic-diamond-operation-comparisons-index and the corresponding27.4 node link. Thus this is coarse graph/record consistency, not mathematics with no identified proof supplier. Add the stage dependency and close only that integration gap. L4/H5 are already available through existing stage paths; do not duplicate their proofs.

### RT-AREA-etale/18 — confirmed (medium)

The LPV.2 contract calls complex comparison optional but requires an algebraic proof valid in the stated characteristic range. Its own decomposition records the unclosed transcendental input. I independently read SGA7 II XV 3.3.3–3.3.6 and proof (A)–(C), pp.191–193: the argument explicitly invokes XIV 2.1, XIV 3.2.11 and a cup/trace compatibility, then transfers the local model to mixed characteristic. Illusie 2021 §6.1 p.103 confirms that the later algebraic proof uses Rapoport–Zink; the author's erratum to Illusie 2002 corrects |i|>−1 to |i|>1 at p.251. Select and source-close an actual route: either make the comparison/topological calculation required, or add Illusie's algebraic route with its early local semistable input. Do not connect the whole downstream LPV.7 back to LPV.2. The detailed two-component prefix proposed by the attacker still requires reading/closing the 2002 proof, not merely citing the survey.

### RT-AREA-etale/19 — confirmed (medium)

The generator has a real collision: make_queue.py:719–724 stores one prompt per job id, while832–842 appends each route and852–860 assigns the same DESIGN path again. Registry order puts Yang–Zhao after Abe; simulating the relevant assignment leaves only the extending brief, omitting Abe’s explicit Lu–Zheng2.16/2.26 and local-Fourier contracts. Merge the briefs/items/provenance for each shared id before producing one design job, with conflicts surfaced rather than silently overwritten. Qualification: currently both overall reviews are revise. accepted_routes:389–400 returns no routes unless the overall verdict is accept, despite their individual accept entries. Therefore there is no currently active design-prompt overwrite from these papers; this is a reproducible latent defect to repair before acceptance. HKW/049 itself says to import Abe’s generic prefix if accepted. Keep that import conditional until a valid accepted owner exists; do not prematurely mark a proposed continuation as an active supplier.

### RT-AREA-etale/20 — confirmed (medium)

Confirmed only for the overlapping proper GAGA comparison, with a substantial correction to the proposed fix. Huber3.2.11, printed p.181, covers a noetherian henselian pair and a proper scheme over Spec(A) minus V(I); BM Corollary6.18, p.52, includes that case and explicitly refers to Huber3.2.10. H1:henselian should supply the matching classical case and ArcTopologyAndDescent should import/compare it, retaining its separately justified extensions and descent applications. However, BM1.18(1), CMM/113 and CS24/029 are the different algebraic rigidity theorem RΓ(A,F)≃RΓ(A/I,F) for henselian pairs. Huber3.2.9 compares a pro-special analytic subset with its henselization; RS-05’s owner entry does not state the full algebraic rigidity theorem. Do not relabel all three as already planned at H1 from this evidence. Keep the general Gabber theorem at Arc (or explicitly extend and source a single common foundational owner), distinguishing its hypotheses from BM’s restricted new proof. The nonnoetherian/strongly-noetherian variants require their own precise comparison, not an automatic transfer from the noetherian example.

### RT-AREA-etale/21 — confirmed (medium)

L5 expressly proves de Jong 4.1/5.8/6.5, SF.4 still retains source-scoped alterations after accepted RS-25, and RD.5 invokes alteration/descent with neither as supplier. L5 also bundles H1/H5-dependent local analytic calculations with scheme geometry. Split out one scheme-alteration prefix carrying tasks 1–3 and exact excellence/finite-type/base-extension hypotheses, with pointed stable-moduli input from finding 4; retain descent and local comparisons as consumers. SF.4 and RD.5 import the corresponding geometric theorem and keep their own applications. A0-extension's normalization and other generic geometry must be imported only to the extent needed, with no new duplicate blowup/compactification theory. This is an ownership correction; the final newly designed prefix and its exact dependency graph need validation in the fix, rather than assuming every suggested edge is already a valid stage.

### RT-AREA-etale/22 — confirmed (medium)

Read ILO X introduction p.135, Theorem 2.1/Lemma 2.2 p.149 and Theorem 2.4 p.152. The first theorem is over a field; the second gives a regular alteration over an excellent regular one-dimensional base and additional boundary/local-model data. JANNSEN-16's same-theorem reason is inaccurate (its overall review is revise). The accepted Dittmann–Pop brief already says arbitrary de Jong alterations do not suffice and names the log-modification proof as remaining supplier work: this is an unclosed proof programme, not an assertion that de Jong proves odd degree. Make both scopes explicit under one Part II; add the log-regular/log-smooth modification and Gabber–Vidal or Temkin proof branch actually used. Preserve both prime-to-ell degree conditions, no blanket separability, and the projectivity/composition step for the projective DVR consumer. Import L5's ordinary geometric infrastructure without pretending it supplies equivariance or prime-to-degree control.

### RT-AREA-etale/23 — confirmed (medium)

L1’s source category in ECD §27, p.163, uses the left-completed étale derived category inside the pro-étale one. BS1309.1198v2 Proposition5.3.2, p.38, supplies this identification;5.2.6, p.37, is only its bounded-below predecessor. SF.2 names scheme pro-étale comparisons but has no path to L1 or L3 in the assembled graph. The pinned Mathlib AlgebraicGeometry/Sites/Proetale.lean52–160 constructs the sites/topologies and comparison infrastructure, not repleteness or this derived equivalence; the targeted library search found no substitute. Add an SF.2 supplier request/edge to L1, and name the repleteness and left-completion outputs precisely. Preserve the distinction from unbounded D(X_et), which is not in general left complete; propagate the imported theorem through L1 to L3 rather than build a second site.

### RT-AREA-etale/24 — rejected (medium)

The alleged double ownership is already explicitly separated in the current texts. E4 reexports DD.1’s generic completion and owns the sheaf/compatible-coefficient reconstruction, completed operations and regular-sequence devissage; its final sentence assigns the étale application and six-operation construction to L0. L0 begins using E4, defines the étale subcategory, and applies the reconstruction to it; E4 already supplies L0 in the graph. ECD26.2–26.3, p.162, likewise distinguishes the generic BS3.5.7 equivalence from its restriction and eligible étale operations. The older L0 node cites BS3.5.7 as an import and records unread proof inputs; a source-read gap there is not evidence that a second generic owner is intended. Preserve the E4→L0 handoff and attach generic lemma-level requests to E4 when expanding the blueprint; the proposed narrowing largely repeats the existing boundary.

### RT-AREA-etale/25 — confirmed (medium)

The accepted Zavyalov route assigns coherent f^! to draft AS.1; the accepted BCGP route assigns Hartshorne/Pilloni coherent duality and finite/lci trace interfaces to A0-extension. AS.1 itself includes proper-smooth Grothendieck–Serre duality alongside derived/solid formalism. Zavyalov v3 §2.2 pp.11–13 genuinely extends the classical theory to separated finitely presented morphisms over qcqs universally coherent bases, using preservation of coherent complexes and finitely presented compactifications. Consolidate the classical scheme duality core, reasonably at A0-extension, and explicitly add that extension before rerouting its consumers. Preserve AS.1's derived/solid realization and comparison rather than deleting its distinct formalism. Do not move all Zavyalov items 12–30 mechanically: compactification, reflexivity and other general prerequisites retain their appropriate existing owners, with import links. This is overlap plus a scope extension, not equality of the noetherian and universally coherent theorems.

### RT-AREA-etale/26 — confirmed (medium)

The accepted CS19 route14 explicitly requests the perfectoid-limit extension through P5/H0/L2, but P5 has no path to H1:henselian. Theorem4.10’s proof, pp.10–11, uses noetherian stagewise Huber3.2.9, scheme continuity, and étale-site descent to the perfectoid limit. Put this in a later suffix supplied by H1:henselian and the precise P5 limit theorem, without imposing perfectoid inputs on every early henselian comparison. Further scope correction: current P5 constructs limits of affinoid perfectoid pairs, whereas CS19 footnote3 allows noetherian Tate stages with perfectoid completed limit. That extension must be an explicit target/request at the limit owner; merely adding a P5 edge does not prove it. Retain the henselization at finite stages and the actual normalized plus rings.

### RT-AREA-etale/27 — confirmed (medium)

The live HQ.4/HR.4 contracts and the draft QW.1–QW.7 repeat the q-Witt construction, operators, and derived comparison, while CR.4 still names HQ.4. PLAN-HABIRO §6.5 and its accepted review already decide the desired ownership; RS-10 remains needs_changes and these changes have not reached the assembled atlas. Fix the implementation lag, not the accepted decision. Promote the suppliers before or atomically with narrowing their consumers, preserve source-specific distinction between ordinary restriction maps and q-V/FV systems, and apply the required edge removals through a maintainer-supported mechanism. A §15 links-only proposal cannot remove HQ.4→HQ.3; adding the reverse link alone is cyclic. Recheck the complete forwarded graph after splitting stages.

### RT-AREA-etale/28 — confirmed (medium)

QW.6 explicitly constructs the framing automorphisms, q-derivatives, twisted Leibniz rule and Koszul complex, and its boundary says PR.6 builds the p-completed instances independently. PR.6 indeed owns their framed polynomial computation. Share that foundational calculation once, retaining the q-crystalline site, envelopes and prismatic comparison in PR.6. The two scopes are not interchangeable: ordinary smooth framed algebras and p-completely smooth framed algebras require a completed étale-lifting/base-change comparison. The reusable prefix must be independent of QW.5 and must state flatness/completeness hypotheses needed to divide γᵢ−1 by (q−1)Tᵢ. Do not require PR.6 to import the whole current QW.6, including its later q-Witt comparison. HQ.1 then imports the appropriate instance as required by PLAN-HABIRO.

### RT-AREA-etale/29 — confirmed (medium)

The live HQ stages lack the module-with-q-connection target that draft HS.1 explicitly imports and the framed Habiro complex that the accepted plan assigns to HQ.4. Wagner v2 Example 3.12, pp.25–26, constructs γᵢ on H_(S/A[x]) and the Koszul complex of (γᵢ−1)/xᵢ; on a torus one can equivalently use γᵢ−1 after the corresponding basis change. Corollary 3.54, pp.51–52, supplies the graded/Bockstein comparison. Add these targets by implementing the accepted plan. Correct the proposed fix: twisted q-de Rham constructions 3.14–3.20, 3.22 and 3.29 belong to HQ.2 under the accepted partition, not HQ.3. Scholze 1606.01796 §7, pp.15–16, supports Definition 7.3 for q-connections but labels coordinate independence Conjecture 7.5; it does not prove all modified-connection/quotient-stack assertions. Supply the precise semilinear automorphism/descent construction for that equivalence and retain any missing proof as a gap.

### RT-AREA-etale/30 — confirmed (medium)

HQ.6 has no analytic supplier in the assembled atlas, although PLAN-HABIRO §6.5 already names draft AnalyticHabiroStack HS.3. Its dependency still consists of HQ.5 and its generic wording does not identify the required draft suppliers. Name SolidAnalyticRings, AnalyticStacks and RingStacksAndTransmutation, record the unresolved import until HS.3 is promoted, then link the actual supplied base-change functor. Aoki 2603.01877v1 Theorem 1.7, p.4, gives a realization functor, not the algebraic–analytic identification. Wagner thesis §1.45 (printed p.20, PDF p.24) still treats the compatibility as future work. Keep HQ.6 a precisely stated comparison problem, as its current text already intends; do not introduce a theorem claiming equivalence.

### RT-AREA-etale/31 — confirmed (medium)

Theorem 3.11(a)–(b), Wagner v2 p.25, distinguishes q-Hdg from q-Habiro-Hdg (the distinction was also checked in the rendered formula). Part (a) recovers the former by (q−1)-completion of the latter; part (b) gives the uncompleted q-Witt graded pieces for the Habiro object. HQ.3 defines only the completed colimit and then assigns those uncompleted pieces to it. Construct the Habiro object via 3.42–3.45 and state (b) there, keeping the completed comparison with completed graded pieces separately and with its filtration/completion justification. This is not a notation-only correction.

### RT-AREA-etale/32 — confirmed (medium)

The assembled graph has no HR.1 path to HQ.1 or HQ.2. HQ.1 assumes a perfectly covered Λ-ring, while HR.1 is the live owner of that coefficient structure and HQ introductory prose explicitly names its early imports. Add HR.1→HQ.1 (no reverse path), retaining HQ.1→HQ.2. When QW.1 is promoted and owns general Λ-rings, replace the generic coefficient request with its precise export rather than leaving a second owner.

### RT-AREA-etale/33 — confirmed (medium)

HQ.7 includes the spherical-lift trace instance but the assembled graph has no HQ.5-trace→HQ.7 path and HQ.5-trace has no outgoing edges. Add that input (there is no reverse path). The accepted PLAN-HABIRO §6.5 already specifies this repair, along with replacing HQ.6 by the algebraic HQ.4/HQ.5/HQ.5-trace prerequisites; coordinate implementation with those decisions rather than regarding the missing edge as a new ownership choice.

### RT-AREA-etale/34 — confirmed (medium)

The direct DD.6→HQ.2 link imposes log-crystalline geometry on an ordinary derived-de-Rham consumer, and HQ.2 wrongly attributes generic complete filtered modules to EnhancedDerivedSheaves rather than DD.1. Correct those two points and request maintainer removal of the obsolete log edge. Qualification: DD.2 and DD.1 are not absent ancestors. The assembled graph already has DD.2→HQ.1→HQ.2 and DD.1→AI.1→HQ.2. Direct DD.1/DD.2 links may document the actual imports, but should not be presented as repairing an unavailable ordinary-de-Rham theorem.

### RT-AREA-etale/35 — confirmed (medium)

Confirmed as an insufficiently expanded roadmap proof obligation, not evidence that the published conclusions are false. Wagner v2 §1.16 p.8 states the scheme construction and smooth-proper perfectness; the cited body develops algebra-level filtrations, while thesis §1.45(c) only summarizes the sheaf construction. HQ.5 should give separate descent and perfectness targets with the exact base/dimension/localization hypotheses, source status, and explicit imported lemmas. The suggested proof is not complete: Appendix B.2–B.4 detect completion and vanishing; they do not alone establish compactness/perfectness over the completed coefficient ring. A perfection criterion, uniform amplitude and finite-presentation argument, and compatibility of RΓ with the relevant completed base changes must be supplied or recorded as gaps. Do not declare a new source error merely from the absence of a numbered body theorem.

### RT-AREA-etale/36 — rejected (medium)

The claimed second ownership is not established by the audit flag. Read together, HQ.5 explicitly says HR.6 owns the degree-zero comparison with HR.5/HB.6, and HR.6 explicitly distinguishes its coefficient-ring identification from HQ’s cohomology functor and filtered comparisons. These are a construction followed by a comparison with an independently built ring. REV-RS-10 also expressly accepts HQ.5/HR.6 as a handoff rather than a duplicate. The isolated imperative about the completion comparison is ambiguous and can be made clearer when separating the HQ.5-trace anchor (finding 40), but it does not warrant moving every q−1 comparison out of HQ.5. Preserve the generic functorial comparison in HQ and its finite-étale degree-zero realization in HR.6.

### RT-AREA-etale/37 — confirmed (low)

WC.2's only decomposition node proves the proper-smooth Lefschetz trace formula and explicitly admits it does not derive the functional equation. The stage's actual target is reciprocity with χ=Σ(-1)^i b_i and Δ=Π det(F|H^i)^{(-1)^i}; its source operation belongs to EDC.8. Retain it there or as an import and add the missing WC.2 derivation from the graded Poincare pairing/EDC.8 determinant relation and WC.1 rationality. Keep Δ²=q^{dχ}, descent of the multiplier to Q, and parity/sign justification; do not replace Δ by an unexplained fractional rational power.

### RT-AREA-etale/38 — confirmed (low)

The literal DWP.4→DWP.5 edge and Dependencies line are present, but the named DWP.5 proof inputs do not require the completed higher-dimensional Weil I induction. I checked Weil II 1.8.1–1.8.5 (pp.175–176) and 2.2.8–2.2.10 (pp.195–196): trace/rationality, tensor and dual arguments, local monodromy and the analytic positivity package provide the local and strict initial bounds. RS-17's DWP.5 supplier list likewise omits DWP.4. Remove this blanket prerequisite, retaining the explicitly required DWP.0/DWP.2, sheaf L-function/duality/monodromy and upstream positivity inputs. The introductory phrase about Cartesian powers alone would not prove this dependency claim.

### RT-AREA-etale/39 — confirmed (low)

The route metadata contains nonexistent galaxy cohomology, and the Microlocal title drops the parent’s cycle-classes wording. Correct those fields, coordinating shared ids. However, arithmeticgeometry and algebraicgeometry are valid galaxy ids in data/galaxies.json, not schema errors; do not mass-rewrite them merely because these are Part IIs. etale is the natural choice for the EDC/LPV sheaf-theory extensions; preserve a deliberately justified geometry classification for the same-field local-curve continuation. RS-17 narrows LPV.7 to navigation and gives the early semistable export to its child. SemistablePotentialMaps should import that prefix plus an explicitly supplied higher-dimensional strict-normal-crossing weight-spectral-sequence extension, not pretend the curve theorem alone proves its arbitrary-relative-dimension inputs. Abe/Yang–Zhao route changes remain proposals while their overall reviews say revise.

### RT-AREA-etale/40 — confirmed (low)

Both live atlas descriptions are identical, including the trace anchor and the finite-étale export paragraph. The README places the export under that anchor, but the graph sends HQ.5 to HR.6 and gives HQ.5-trace no consumers. Separate the source blocks and extraction boundaries so the general existence and coefficient export are attributed to HQ.5 and the trace theorem to HQ.5-trace; preserve the exact two theorem scopes and the explicit HR.6 ownership. This also implements the accepted plan review §8.4.2.

## Public sources and reading limits

All accessed 2026-09-24. The numbers in the following table are **physical PDF
pages, starting at 1**, not publication pagination. The decision paragraphs give
statement numbers and printed pages where needed. The ledger records selected
pages read, never a claim to have read each entire source. SHA-256 identifies
the downloaded/supplied bytes; the SGA sources were read through the supplied
OCR passages below. The q-Hodge formula on PDF page 25 was also checked visually.

| Source | PDF pages read | SHA-256 |
| --- | --- | --- |
| [qHodge](https://arxiv.org/pdf/2510.04782v2) | 8, 25, 26, 51, 62, 63, 65, 66, 77, 78 | `591d0bdf2c48d12f91d6c9a4beec32978bc1e9a9448b04ef0efdc4a84315373b` |
| [ku](https://arxiv.org/pdf/2510.06057v1) | 42, 43, 44, 45 | `fe9d7d71478eb546f89784f2eabdb15ec4f1e5ff8870c6c84909896c1543ea7d` |
| [MW](https://arxiv.org/pdf/2410.23115v4) | 38, 39, 40 | `4479788e04da71cfb76596b4375b6b1e4c9bcd940ad92e1ab7c8ededba446dd4` |
| [thesis](https://ferdinand-wagner.github.io/papers/q-Thesis.pdf) | 24 | `d074047f202ee7e64298801b15327a9a634b6f7b6e4bcd5be7b2fda959ad876c` |
| [ScholzeQ](https://arxiv.org/pdf/1606.01796) | 15, 16 | `ce060b41e28fef16c011d3d3455c53a8bdc11cd8c98dc4dc6c2be178e1567273` |
| [Aoki](https://arxiv.org/pdf/2603.01877v1) | 4 | `a178c823fb035bf82ff1e9ac8293f1d702249b27e60c5e1f3e9365b9218b7bfc` |
| [YunZhang19](https://math.mit.edu/~zyun/GZW_ramified_published.pdf) | 54, 57 | `700e0b09f2320912b75f5a16968c5aa3f96a0ad74e3ca375aacedec7e85d296c` |
| [qWitt](https://arxiv.org/pdf/2410.23078v5) | 57 | `c1c7426f374a9f56d5ad6fb743f6cfc95e74ba9c35a96babd7ae5101a9dded01` |
| [BSproet](https://arxiv.org/pdf/1309.1198v2) | 25, 37, 38, 39 | `ae0960a28f0f25300211569cd350def057d6c0f781f635694182868e766d3c84` |
| [ECD](https://arxiv.org/pdf/1709.07343) | 162, 163, 164 | `78ca42bba46f1d43c894b0dbfdfb41105efab4959ba5ba6e32e1e5cf7ef33efc` |
| [Huber](https://doi.org/10.1007/978-3-663-09991-8) | 190, 191, 238, 253, 399, 400 | `8e470878aea6938f582548eb72a568416d186b4289829f98802d33c5430a5b43` |
| [Berkovich](https://www.wisdom.weizmann.ac.il/~vova/IHES_1993_78_etale.pdf) | 142, 144 | `beaa3630015b5bd8eda365b0e420f57e4ce2daa04a71a8e28dc3bd92b0f8d759` |
| [BM](https://arxiv.org/pdf/1807.04725v4) | 6, 7, 52 | `4cdf5593067a425ca0aebc969d34efa4ef296cde613c3d9a6c671db65b9b6620` |
| [CS19](https://arxiv.org/pdf/1711.06456) | 10, 11 | `a62a12bbe26595aec89d31d24d46774a1ee3eff73c08da0febf5a2b472118709` |
| [Schiffmann](https://arxiv.org/pdf/1406.3839v2) | 35, 36 | `7e5cbf6e3bb9caf4c48959493987c4543c2244cccdf17fa0fa426593a8639bb2` |
| [WeilII](https://www.numdam.org/item/PMIHES_1980__52__137_0.pdf) | 4, 39, 40, 41, 60, 61, 63, 64, 75, 76 | `b06eea61bf9cb2b596c162f5befcf85d1be69828910a6107c8aa3a99c4afcc71` |
| [KatzSarnak](https://web.math.princeton.edu/~nmk/RMFEM.pdf) | 308, 310 | `39beb011e5fab2737bb131611f054221108128fbebbb7f62ba2de9a56f755dd5` |
| [deJong](https://www.numdam.org/item/10.1007/BF02698644.pdf) | 13, 22, 31 | `9e4e7dab2525e9a0fb0820752434c5a168914873b6118f5a967fcccae257ffb7` |
| [ILO](https://arxiv.org/pdf/1207.3648v1) | 141, 155, 158, 234, 239, 240, 248 | `18a6193d6b71ff5ac91eae4443e1c8a54ab8f27f2173fda200d4bec547e3644a` |
| [CS24](https://arxiv.org/pdf/1912.10932v3) | 30, 31 | `2f9d3ee868c244a7ddd6579a5dafed10a7ac9eb8b2ffe840db9f2bc115cd6ed4` |
| [HW16](https://arxiv.org/pdf/1409.0993v4) | 44 | `3338fb5359996b5824e3f67638e3b848f6a5d8a821cda8e10a6577f349517369` |
| [LS25](https://arxiv.org/pdf/2004.09046v5) | 21, 22 | `5e5f829e2841637de38852bde0d5f0a0b80183e6f9d23b60250cc2be1ee21d97` |
| [Illusie21](https://afst.centre-mersenne.org/item/10.5802/afst.1667.pdf) | 22 | `e5669fedbc97b874fc7b2ec2230ad8722ff69c0e77dc9aee8bca5f0aaa19d219` |
| [IllusieErr](https://www.imo.universite-paris-saclay.fr/~luc.illusie/ErrPL.pdf) | 1 | `3aa532eb93b8acf3d8c2e49d7d68144fb274042d2a5310780bedc1b03dd34120` |
| [Zhu17](https://arxiv.org/pdf/1407.8519v3) | 24, 54, 55 | `2c23e397d21e84812daec2c637e2a763eec54ef0d784748eb74e3b2093de1e5b` |
| [Abe25](https://arxiv.org/pdf/2405.19601) | 4, 5, 6 | `56d897a77e1a3ef0455c861d0f5bd5b499f47ea9420fd5fcca0594e794c020a6` |
| [YZ25](https://arxiv.org/pdf/2209.11086v4) | 45, 46 | `e3da9817bc372ce4b72e475ed790ba3e4346de83ccda9751fe37bd02c0e1eb2e` |
| [Zavyalov25](https://arxiv.org/pdf/2111.01830v3) | 11, 12, 13 | `a984d973782649972a835b302e20ec91fc9c1abc5e5b43c7eccc5934b9c2c951` |
| [Lafforgue18](https://arxiv.org/pdf/1209.5352v10) | 65 | `b37715f9c42862b7560d8b71da07924376e3cbbbe862ef9e89a57d8c91a64295` |
| [FSY22](https://arxiv.org/pdf/1810.06454v5) | 4 | `835580aa6314798e2866c248d6f7179379698d61a7baae0136806d4755b1f20a` |
| [BS20](https://arxiv.org/pdf/1711.10451v3) | 8 | `4518f88842e2bc19d2b2e0634f1df54c96d36164331e88fc30ef892f3c879072` |
| [LOII](https://www.cmls.polytechnique.fr/perso/laszlo/articleweb/article-IIfin.pdf) | 1, 2 | `db6df53fc7fe41b08a51b06417d946d30ae09719ad9c7dae8633dd3339302e71` |
| [SGA4half](https://publications.ias.edu/sites/default/files/Number32.pdf) | [Cycle] §3.1–3.8, printed pp.150–152; OCR lines 11660–11830 | `fb2939521f4c0ea0cdd55a90bec2e618e32fb433c78b194e705c6d989f4e42a6` |
| [SGA7II](https://publications.ias.edu/sites/default/files/Number12.pdf) | XV §3.3.3–3.3.6 and proof (A)–(C), printed pp.191–193; OCR lines 12470–12705 | `fa679debfc8ada3232d7e752a1837fc6ce474488e20a44d7641cf296876e1297` |

Huber is the published 1996 book, a supplied reference copy identified by its
[public DOI](https://doi.org/10.1007/978-3-663-09991-8); no open publisher PDF
was found. Abe's public arXiv text was used at the numbered statements, not
claimed to be a word-for-word collation of the subscription publication.
The original Lang–Weil/Ekedahl proofs and Illusie 2002's complete algebraic
proof are not certified here: findings 7 and 18 identify the demonstrable
consumer/source gap and require those supplier proofs to be closed by the fix.
ILO locators refer to the explicitly cited arXiv v1, not an assumed identical
pagination of the 2014 book.

## Validation

- Exactly forty unique input IDs receive one verdict each; original severities
  are retained. No red-team input or roadmap is modified by this review.
- JSON, the red-team checker and the submission scope checker are run on the
  two review deliverables: check_redteam.py reports ok; intake.py check-files
  reports 2 files, 0 problems.
- Pinned positive declarations were read and their file hashes verified.
  Proposed existing-stage edges were checked together; new-stage graphs remain
  the implementation job's responsibility.
- No Lean file is required by this review, and no Lean compilation or mathematical
  formalization is claimed. The confirmed fixes need their own APIs, tests,
  source closure and implementation validation.

Publication guard: main `0e104881128890174db3843266431bef9f89ec43` has all 101 tracked
reading inputs unchanged; integrated links, decompositions and restructuring
data are also unchanged. The submission changes exactly the two authorized files.
