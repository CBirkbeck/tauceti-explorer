# RT-AREA-etale

Red team of the area **Étale cohomology (Algebraic geometry)**, issue #1517. By Claude Code, session `cc-38267a`, 24 September 2026. This session wrote or reviewed none of the area's roadmaps, restructurings or paper routes.

The area has eight roadmaps: AdicCoefficientsAndComparisons, ClassicalAdicEtaleCohomology, DeligneWeightsAndPurity, EtaleDualityAndPerverseSheaves, HabiroCohomologyFoundations, LefschetzPencilsAndVanishingCycles, WeightsInEtaleCohomology and WeilConjectures. That is 76 stages, plus 61 paper routes into them and eleven restructuring proposals touching them.

**40 findings: 6 high, 30 medium, 4 low.** Each finding in `RT-AREA-etale.result.json` has its evidence and a fix a worker can apply.

## How it was checked

- **Split.** Four checkers took one part each: the weights family (DWP, WIC, WC, in the light of accepted RS-17); étale duality and Lefschetz pencils with their many Part IIs; the adic pair (in the light of RS-05); and the Habiro family.
- **What each read.** Every stage, the reviewed decompositions, the restructuring proposals (accepted ones as decisions), the paper routes with their reviews, and the draft roadmaps. Each searched the whole atlas and both pinned libraries for every "planned nowhere" claim.
- **Graph check.** Tarjan's algorithm over all 3508 stage edges, with and without the accepted RS links, finds no cycle. The roadmap-level mutual prerequisites (for example DeligneWeights ↔ EtaleDuality) are therefore stage interleavings, not errors. Every edge a fix proposes was checked to be acyclic.
- **Re-checks.** I re-checked every high finding myself against the files, including the stage texts, route verdicts and edge lists. The "Laszlo" hits in stage descriptions are all Beauville–Laszlo gluing, which is why the stacks finding stands.

## Findings

### 1. missing, high

**Where:** PAPER-SCHIFFMANN-16 route 3 (accepted) → DeligneWeightsAndPurity:DWP.0, item PAPER-SCHIFFMANN-16/36; Weil II §3.5

An accepted source route sends Schiffmann's Proposition 4.8 (the Weil numbers of genus-g curves are Zariski dense in T_g/W_g) into DWP.0, which only defines Weil q-numbers and cannot prove it. Its proof (Appendix B) needs two things no layer plans and the libraries lack: the Katz–Sarnak theorem that the geometric monodromy of R¹ρ_!Q_ℓ over an open of M_g has Zariski closure Sp_2g, and Deligne's equidistribution theorem (Weil II 3.5.3). Weil II §3.5 falls between DWP.8 (§3.4) and LPV.7:invariant-cycles (§3.6) and is in no stage's sources.

**Fix:** Add a DWP layer (e.g. DWP.8:equidistribution, requiring DWP.5, DWP.7, DWP.8) owning Weil II 3.5.1–3.5.3, with the function-field Sato–Tate statements 3.5.5–3.5.7 as acceptance and Haar probability imported from tauceti RepresentationTheory/CompactGroups. Extend the accepted Part II 'LefschetzPencilsAndVanishingCycles, Part II: universal hypersurface monodromy' (BROWNING-SAWIN-20 route 6, which owns Katz–Sarnak 11.4.9) with Katz–Sarnak 10.1.16/10.2.2 for the universal curve. Re-route SCHIFFMANN-16/36 to the new DWP layer; DWP.0 keeps only the Weil-number bookkeeping. Record Schiffmann's [D1] label ('La conjecture de Weil I', but 'Publ. Math. 52' = Weil II) as a source issue.

### 2. duplicate, high

**Where:** PAPER-CESNAVICIUS-19 route 3 (accepted source → SchemeAndStackFoundations:SF.2, item absolute-purity-input) vs PAPER-CESNAVICIUS-SCHOLZE-24 route 4 (accepted Part II EtaleDualityAbsolutePurityPartII)

Gabber's absolute purity is planned twice by two accepted routes. The Česnavičius route puts it into SF.2's blueprint (make_queue.py appends every accepted source route to the roadmap's sources), and the Česnavičius–Scholze route makes it the main theorem of a new Part II; the CS24 review accepted the Part II because purity is 'not planned by any of its stages', missing the earlier accepted CS19 route. LI-LIU-21/79 (unreviewed) routes the general form to SF.2 too. The same CS19 route also puts cohomology with supports into SF.2, which accepted RS-19 assigns to EDC.0.

**Fix:** Make EtaleDualityAbsolutePurityPartII the single owner, stated in the general form (regular closed immersions of regular schemes; Fujiwara Thm 2.1.1 / ILO XVI 3.1.1). Re-mark CESNAVICIUS-19/absolute-purity-input (and LI-LIU-21/79 at its review) as planned there. Split SF.2 as CS19 asks (early site/Kummer prefix, Brauer-purity suffix) and link the Part II only into the suffix, which keeps the graph acyclic since the Part II imports SF.2. Re-mark CESNAVICIUS-19/supports as planned at EDC.0.

### 3. missing, high

**Where:** EtaleDualityAndPerverseSheaves (scheme-only) vs consumers on algebraic stacks: EDC.8 items YUN-ZHANG-17/35, YUN-ZHANG-19/120; LAFFORGUE-18/48; GlobalShtukas GS.1, GS.3; ET.2b; Part IIs ShtukaSpecialCyclesAndHigherSiegelWeil, RamifiedGeometricClassFieldTheory

No layer plans ℓ-adic sheaf theory on Artin or Deligne–Mumford stacks: the Laszlo–Olsson / Liu–Zheng six operations, bounded constructible categories, the perverse t-structure and IC on stacks, and correspondences and trace formulas on DM stacks. EDC is explicitly scheme-only, yet accepted routes and stages apply its EDC.5/7/8 outputs on stacks (shtuka, Hitchin, Bun_G and root-Picard stacks), and one extraction marks the stack formalism 'planned' at EDC.0/SF.1 while its own note says no stage has it. RS-22 covers only GS.3's shtuka-specific descent. The libraries have no algebraic stacks.

**Fix:** Plan it once, most generally: 'Étale duality, cycle classes and perverse sheaves, Part II: Artin and Deligne–Mumford stacks' covering Laszlo–Olsson I–II / Liu–Zheng enhanced operations, the perverse t-structure and IC on Artin stacks, the decomposition theorem for DM stacks, and Varshavsky/Behrend correspondences and trace formulas on DM stacks. Add edges from it to GS.1, GS.3, ET.2b and the EDC.8 stack items; make the shtuka and ramified-GCFT Part II briefs import it; correct LAFFORGUE-18/48 to missing and route it there.

### 4. missing, high

**Where:** AdicCoefficientsAndComparisons:L5 task 2 (node L5/de-jong-5-8-curve-fibration-alteration)

de Jong's proofs of his Theorems 4.1 and 5.8 (hence 6.5), which L5 plans, need the proper moduli stack M̄_{g,n} of stable n-pointed curves (n ≥ 3, all g) and a projective scheme M finite and dominant over it carrying a universal curve. No layer plans this and L5 names no supplier. Tau Ceti StableReduction stops before it, and two accepted routes plan fragments that do not cover the pointed projective cover, omit the link to L5 and overlap on M̄_g.

**Fix:** Make StableReductionPartII the single owner and widen its brief to M̄_{g,n} for 2g−2+n > 0, including de Jong 2.24's projective cover M (normalization in level-ℓ covers for two primes ℓ ≥ 3) with its universal curve and the pointed stable compactification after finite surjective base change. LANDESMAN-LITT-24/106 imports it. Add an edge from that stage to L5 (or to L5:alterations, see the finding on alterations) and rewrite L5 task 2 as an import; the edge is acyclic.

### 5. missing, high

**Where:** ClassicalAdicEtaleCohomology:H5 (Huber 3.8.1 in characteristic p) and H3

ECD 27.2 applies Huber's Theorem 3.8.1 over a characteristic-p field to affine m-space for every m, and H5 owns that case. Huber's recorded proof in characteristic p (Berkovich's comparison) needs relative Poincaré duality for smooth morphisms of every dimension. H5's only duality supplier, H3, plans duality for curves only ('Poincaré duality for curves'), and the Zavyalov route adds only the absolute smooth proper case. So H5's proof has an unplanned input.

**Fix:** Add a suffix H3:smooth-duality with Huber 5.7.2, 7.2.2 and 7.5.3 for smooth morphisms of pure dimension d, all d (sources Berkovich 7.2.1, 7.3.1, 7.4.9, transported by the Huber–Berkovich comparison, ZAVYALOV-25/136–139), keep the curve part as the early prefix that S4/S5 consume, and add the edge H3:smooth-duality → H5.

### 6. missing, high

**Where:** HabiroCohomologyFoundations:HQ.5 (Wagner, q-Hodge complexes over the Habiro ring, Theorem 4.22)

HQ.5 plans Theorem 4.22(a) and (b), but the inputs of both proofs are missing. Part (b) is a special case of the ku paper's Theorem 4.17 (E₁-lift, quasi-regular case, with p = 2 through Theorems 4.14 and 4.16); RT.4:q-Hodge is not upstream of HQ.5 and plans only the E₂-lift, 2-inverted case. Part (a) uses the Meyer–Wagner divided-power lifts, planned nowhere. HQ.5 also misstates hypothesis (b) as 'a spherical E₁-lift' of R, whereas Theorem 4.22(b) lifts R_∞ = (R⊗_A A_∞)^∧_p.

**Fix:** Move Theorem 4.22(b) to HQ.5-trace (as the accepted PLAN-HABIRO decides), add ku Theorem 4.17 (with 4.14 and 4.16) as a named target of RT.4:q-Hodge, add Meyer–Wagner v4 Lemma 3.16 (= thesis Lemma 11.17) as a named HQ.5 target with arXiv:2410.23115v4 among HQ's sources, record the 3.16/3.17 numbering mismatch as a source issue, and restate hypothesis (b) as a lift of R_∞.

### 7. missing, medium

**Where:** PAPER-HARPAZ-WITTENBERG-16 route 4 (items /24, /88) and PAPER-BRIGHT-NEWTON-23 route 2 (item /87), both rejected; FiniteFieldsAndCharacterSums:FF.2

Two results used by routed papers are planned nowhere. Harpaz–Wittenberg need the uniform Lang–Weil estimate (error constant depending only on the embedding data) and Ekedahl's geometric Chebotarev for finite étale covers of varieties over F_q. RS-17 moved DWP.10's point counts into WC.5, whose contract is smooth projective, so the only accepted Lang–Weil plan is the non-uniform one routed to FF.2 by BROWNING-SAWIN-20 route 2. That plan already covers Bright–Newton's need, yet their route was rejected as having 'no owner'.

**Fix:** FF.2 (already the Lang–Weil owner through the accepted BS-20 route) plans Lang–Weil in its most general required form, the uniform Theorem 1 of Lang–Weil (Amer. J. Math. 76 (1954)), and Ekedahl's Chebotarev (importing FA.5's constant-field coset convention). Mark BN-23/87 and BS-20/langweil planned at FF.2; re-route HW-16/24 and /88 as source routes to FF.2; state in WC.5 that non-smooth-projective counts are imported from FF.2.

### 8. duplicate, medium

**Where:** PAPER-SHENDE-TSIMERMAN-17 routes 9–10 (items curve-zeta, curve-rh); planned fields of SKINNER-20/71, CARO-PASTEN-23/curve-weil, KISIN-ZHOU-25/P16, LI-LIU-21/73, LI-LIU-22/82, FRESAN-SABBAH-YU-22/5

Paper routes and planned fields still point at owners that accepted RS-17 reassigned, reinstating the WC.5/DWP.1 double ownership of the Riemann hypothesis for curves and misplacing other weight results.

**Fix:** Re-point to the RS-17 owners: ST route 10 stage → DWP.1 (WC.5 as the b₁ = 2g compatibility consumer); planned = ['DeligneWeightsAndPurity:DWP.1'] for ST/curve-rh, SKINNER-20/71 and CARO-PASTEN/curve-weil; ST/curve-zeta → FA.5 with WC.1 as comparison; KISIN-ZHOU/P16 → FA.5 plus DWP.3 for the ℓ-adic passage; the two LI-LIU items → DWP.7; FSY-22/5 → DWP.6 and DWP.7.

### 9. duplicate, medium

**Where:** PadicDifferentialEquationsAndRigidCohomology:RD.6 vs DeligneWeightsAndPurity:DWP.0

RD.6 re-defines Weil-number ι-weights of Frobenius eigenvalues instead of importing DWP.0; it has no edge from DWP.0, and RS-17's DWP.0 owner entry does not list it, although other accepted routes already treat DWP.0 as the owner in p-adic settings.

**Fix:** Add the stage edge DWP.0 → RD.6; RD.6 imports Weil q-numbers and ι-weights and defines only pointwise purity/mixedness of overconvergent F-isocrystals; add RD.6 to the DWP.0 owner's 'formerly' list.

### 10. duplicate, medium

**Where:** WeightsInEtaleCohomology:R34.4 (with R34.3)

RS-17 keeps R34.4 as a 'pencil hypothesis adapter for subsequent arithmetic cohomology', but nothing consumes it, and its kept content is the hypothesis check DWP.3 performs for the only application and LPV.5 proves. Separately, R34.3 imports no DWP stage, which contradicts §15's rule that a Part II starts where its parent stops once WIC becomes DWP's Part II.

**Fix:** Drop R34.4 (coverage closed, suppliers LPV.3–5 and DWP.3). When RS-17 is applied, the Part II introduction names R34.3 as an explicit LPV-only adapter exception, kept for RS-06's R13.6 and R14.6 links.

### 11. duplicate, medium

**Where:** YANG-ZHAO-25/T16 (Part II EtaleDualityAndPerverseSheavesPartIIRelativeTraces) vs CESNAVICIUS-SCHOLZE-24/042 (Part II EtaleDualityAbsolutePurityPartII)

The fundamental (Gysin) class of a regular immersion over a general Noetherian base is planned in the relative-traces Part II, and the absolute-purity Part II states that the same class is an isomorphism, but neither names the other. The purity Part II imports only EDC.0–EDC.2 (schemes over a field), and EDC.3's class exists only for smooth pairs over a perfect field.

**Fix:** Give ILO XVI §2 (Gysin classes of regular immersions) one owner, the first layer of EtaleDualityAbsolutePurityPartII; RelativeTraces imports it for T16/T17; the purity Part II takes the general-base exceptional pullback (YZ/B02) or the EDC.1:adjoint prefix as an explicit input.

### 12. missing, medium

**Where:** Part II EtaleDualityAndPerverseSheavesPartIIMicrolocal (YANG-ZHAO-25 route 5 accepted; SHENDE-TSIMERMAN-17 route 14 rejected); LAWRENCE-SAWIN-25 route 2

Characteristic cycles in characteristic 0 have no accepted owner. The only accepted Microlocal brief (Yang–Zhao) is scoped to characteristic p > 0 and tells the design job to 'extend the existing Microlocal brief, preserving its characteristic-zero polar-bound branch', but that brief (Shende–Tsimerman) was rejected. Lawrence–Sawin's accepted route needs characteristic-0 characteristic cycles (Krämer's criteria) and imports no owner for them.

**Fix:** Add a sourced characteristic-0 branch to the Microlocal Part II (conormal characteristic cycles of constructible/perverse complexes, the Kashiwara–Schapira index formula, Krämer's Gauss-map criteria), or route it separately; make SheafConvolutionOnAbelianVarieties import it for LS/15–16; delete Yang–Zhao's reference to the rejected brief.

### 13. library-claim, medium

**Where:** Part II EtaleDualityAndPerverseSheavesPartIIIndConstructibles (YUN-ZHANG-19 route 9; items 63, 64, 176)

Most of what this Part II would build is in Mathlib at the pin: the Serre quotient Ind(C)/C with its 'mc-isomorphisms' and 'mc-zero maps', two-out-of-three and exactness of the quotient functor are Mathlib's Serre-class localization. The review's reason ('Mathlib already provides Ind and abelianness, but not the paper's mc quotient interface') is false at the pin.

**Fix:** Mark items 63, 64 and 176 library/partial with these declarations, shrink the Part II (or fold it into EDC.5 as one lemma: the essential image of an essentially small finite-length abelian C is a Serre class in Ind(C), applied to C = Perv_c), and correct the route reason.

### 14. duplicate, medium

**Where:** Part II LefschetzPencilsAndVanishingCyclesPartIIGeneralBasesFourier (ABE-25/A19, YANG-ZHAO-25/A02) vs FiniteFieldsAndCharacterSums:FF.2 (BROWNING-SAWIN-20 items schreier, fourierdeligne) vs KloostermanMomentsAndPotentialAutomorphy (FRESAN-SABBAH-YU-22/33)

The Artin–Schreier sheaf L_ψ is planned in three roadmaps, and the global one-variable Fourier–Deligne transform (→ FF.2) and Laumon's local Fourier transforms (→ GeneralBasesFourier) are split across two roadmaps with no link.

**Fix:** One owner for L_ψ (construction, trace function, additivity, pullback), e.g. FF.2 via BS20/schreier; re-mark ABE/A19, YZ/A02 and the AS_ψ part of FSY22/33 as planned there, keeping only the product kernels L_ψ(tt′) and their nearby-cycle stalks in GeneralBasesFourier; put the global and local Fourier transforms together (move BS20/fourierdeligne to GeneralBasesFourier, or add FF.2 → GeneralBasesFourier with a comparison task).

### 15. duplicate, medium

**Where:** Part II LefschetzPencilsAndVanishingCyclesPartIIGeneralBasesFourier (ABE-25 route 5, YANG-ZHAO-25 route 4) vs AdicCoefficientsAndComparisons:L2 and ClassicalAdicEtaleCohomology:H1:valuation-nearby-cycles

The Part II re-plans general-base foundations owned elsewhere and imports neither owner: (a) Noetherian approximation and continuity of Hom and D^b_c over affine inverse limits (ABE/A10–A11), owned by L2; (b) constructibility of Rj_* over valuation bases (YZ/A07, ABE/A14), owned by H1:valuation-nearby-cycles.

**Fix:** Add L2 → GeneralBasesFourier and H1:valuation-nearby-cycles / H1:valuation-exports → GeneralBasesFourier to the brief's imports; re-mark the étale-continuity base of A10 as planned at L2 and move A11 into L2; state A07/A14 as extensions of H1's valuation-base theory with a comparison obligation.

### 16. error, medium

**Where:** PAPER-ZHU-17 route 7 (source → EtaleDualityAndPerverseSheaves EDC.0–EDC.7)

A source route adds about twenty missing items outside EDC's declared scope: six operations, Verdier duality, perversity, IC and Chern classes on perfect pfp spaces; equivariant perverse sheaves and Borel equivariant cohomology; and Braden hyperbolic localization. Under §16 material that needs new layers is a Part II, not a source. Scheme-level hyperbolic localization is planned nowhere else (VS1's is for v-stacks).

**Fix:** Convert route 7 into a Part II ('Étale duality, cycle classes and perverse sheaves, Part II: perfect schemes, equivariant coefficients and hyperbolic localization') importing GS0:Witt-geometry's perfect-space carrier and L2's perfection invariance, and sharing its equivariant part with the stacks Part II; keep only the in-scope items (e.g. E06 on finite-type models) as sources of EDC.7.

### 17. error, medium

**Where:** EtaleDualityAndPerverseSheaves:EDC.6 ← AdicCoefficientsAndComparisons:L3 (missing stage edge)

EDC.6 uses the characteristic-p scheme/diamond comparison of ECD 27.1–27.4, which AdicCoefficientsAndComparisons:L3 owns, but L3 is not among EDC.6's ancestors; L3's only consumer is VS3. The decomposition review's orchestrator decision to add this edge has not been applied.

**Fix:** Add the stage edge AdicCoefficientsAndComparisons:L3 → EtaleDualityAndPerverseSheaves:EDC.6, and close the decomposition gap noting that L4 and H5 are already implied.

### 18. error, medium

**Where:** LefschetzPencilsAndVanishingCycles:LPV.2

LPV.2 demands an all-characteristic algebraic proof of the odd-dimensional Picard–Lefschetz formula and calls the complex comparison 'optional', but its only source (SGA 7 XV 3.3) proves the formula transcendentally, LPV.2 has no ComplexComparison ancestor, and the purely algebraic proof in the literature (Illusie 2002) is not cited. That proof goes through the Rapoport–Zink description of N, which the atlas plans only in LPV.7:semistable-curves, downstream of LPV.2.

**Fix:** Add Illusie 2002 (with its erratum) as LPV.2's source for the algebraic route and move the local semistable calculation it needs (RΨ and N for the two-component model after a degree-2 base change and blowup) into a prefix before LPV.2, keeping the graph acyclic; or make the complex comparison a required edge into LPV.2 with a supplier for the topological Picard–Lefschetz formula.

### 19. other, medium

**Where:** Shared Part II ids EtaleDualityAndPerverseSheavesPartIIRelativeTraces and LefschetzPencilsAndVanishingCyclesPartIIGeneralBasesFourier (ABE-25 routes 4–5, YANG-ZHAO-25 routes 3–4); HANSEN-KALETHA-WEINSTEIN-22/049

Both papers send design work to the same two Part II ids, but make_queue.py keeps one prompt per job id, so the later paper's brief (Yang–Zhao, which is written as an extension of Abe's) overwrites Abe's, and Abe's final theorems (Lu–Zheng Thm 2.16, Prop. 2.26, Abe Thm 1.5 and the Laumon Fourier items) vanish from the design prompt. Separately, the generic 2-categorical trace is still a missing item in two Part IIs.

**Fix:** Merge each shared id into one brief (Abe's plus Yang–Zhao's additions), or have make_queue.py concatenate briefs and item lists for equal ids (a maintainer note); re-mark HKW/049 as planned at EtaleDualityAndPerverseSheavesPartIIRelativeTraces and drop it from route 2's items.

### 20. duplicate, medium

**Where:** ArcTopologyAndDescent (BHATT-MATHEW-21 route 1, BHATT-SCHOLZE-17 route 17, CLAUSEN-MATHEW-MORROW-21 route 3, CESNAVICIUS-SCHOLZE-24 route 5) vs ClassicalAdicEtaleCohomology:H1:henselian

The Gabber–Huber affine analogue of proper base change for henselian pairs and the noetherian proper-case étale GAGA over a henselian base have two owners. Accepted RS-05 makes H1:henselian their owner; four accepted paper routes after it route them again to the new roadmap ArcTopologyAndDescent and mark them missing, and the Bhatt–Mathew route's reason that no layer plans them is false.

**Fix:** Set BHATT-MATHEW-21/25, CLAUSEN-MATHEW-MORROW-21/113 and CESNAVICIUS-SCHOLZE-24/029 to planned at H1:henselian, and BHATT-MATHEW-21/134 planned there for the noetherian case (Hub96 3.2.11), keeping only its strongly-noetherian-Tate case new; correct the BHATT-MATHEW-21 route-1 reason; the DESIGN-ArcTopologyAndDescent brief imports these from H1:henselian via an edge into its applications stage and keeps as genuinely new the non-noetherian Fujiwara–Gabber theorem (Bhatt–Mathew 6.11) and affinoid Artin–Grothendieck vanishing.

### 21. duplicate, medium

**Where:** AdicCoefficientsAndComparisons:L5 vs SchemeAndStackFoundations:SF.4 (as narrowed by accepted RS-25) and PadicDifferentialEquationsAndRigidCohomology:RD.5

de Jong's alteration theorems have two owners that no accepted restructuring decides between: RS-25 keeps 'alterations' in SF.4 without naming L5, while L5 plans the same theorems in full, and RD.5 plans alterations with an edge to neither. Because L5 requires H1 and H5, every consumer that imports these purely schematic theorems from L5 inherits Huber's rigid-analytic theory.

**Fix:** Split L5: a new stage L5:alterations takes tasks 1–3 (de Jong 1996 4.1, 5.8, 6.5 with their finite-type geometry), requiring L2, AlgebraicModuli:A0-extension and the M̄_{g,n} owner but not H1 or H5; L5 keeps tasks 4–5 and requires L5:alterations. Add an owners entry L5:alterations (formerly SF.4); SF.4 imports alterations via L5:alterations → SF.4; add L5:alterations → RD.5 (RD.5 keeps rigid-cohomology descent) and → PrimeToDegreeAlterations. Acyclicity was checked.

### 22. error, medium

**Where:** Part II PrimeToDegreeAlterations (DITTMANN-POP-23 route 6, accepted; JANNSEN-16 route 7, extraction still 'revise')

(a) The two briefs describe different theorems: Jannsen's claim to be 'the same theorem' is false, since the field theorem does not give Dittmann–Pop's regular model over a DVR. (b) Both briefs point the proof at L5's de Jong 1996 alterations, but ILO proves both theorems by methods de Jong 1996 cannot supply (Gabber–Vidal equivariant alterations, log regularity), and no layer plans those methods.

**Fix:** The design brief states ILO X 2.1 (field; Jannsen 2.11) and ILO X 2.4 (one-dimensional base), both at general ℓ, with Dittmann–Pop's statement as 2.4 with ℓ = 2 and Z = ∅ plus a projectivity step; correct the JANNSEN-16 route-7 reason; add layers for log regularity and Kummer-étale covers (ILO VI), functorial resolution of log-regular schemes (ILO VIII §§2–3), the log-smooth modification theorem (ILO X.1.1), and Gabber–Vidal equivariant pluri-nodal alterations (ILO X 2.2) or the Temkin route; import only the de Jong 1996 parts from L5:alterations.

### 23. error, medium

**Where:** AdicCoefficientsAndComparisons:L1 (also L3) — missing prerequisite

L1 and L3 work in D(X_proét, Λ) and use Bhatt–Scholze's identification of the left-completed étale derived category inside the pro-étale one, but have no edge from SF.2, which claims the pro-étale site comparisons; no SchemeAndStackFoundations stage is an ancestor of L1 or L3, and Mathlib has only the site.

**Fix:** Add SF.2 → L1 (acyclic) and make SF.2's pro-étale export name Bhatt–Scholze §§4–5 (repleteness, Prop. 5.2.6, Prop. 5.3.2) on top of Mathlib's Scheme.ProEt.

### 24. duplicate, medium

**Where:** AdicCoefficientsAndComparisons:L0 vs EnhancedDerivedSheaves:E4

Three pieces of generic mathematics are planned both in E4 and in L0, although E4 already feeds L0: the reconstruction D_comp ≃ lim_n D(Λ/I^n) (including the non-noetherian regular-sequence case, Bhatt–Scholze 3.5.7), completed tensor products and colimits, and the dévissage showing that reduction mod I commutes with the operations. No restructuring proposal covers E4.

**Fix:** Narrow L0 to the étale subcategory (ECD 26.1), its limit description, the six operations and the detection principle of Remark 26.3; L0 imports the reconstruction theorem, completed ⊗/colimits and the dévissage from E4; move the Bhatt–Scholze 3.5.5/3.5.7 gap from L0 to E4.

### 25. duplicate, medium

**Where:** ZAVYALOV-25 route 2 (AnalyticStacks:AS.1) vs AlgebraicModuliForArithmeticGeometry:A0-extension

Classical coherent Grothendieck duality for schemes (f^!, Rf_* ⊣ f^! for proper f, f^!O ≅ Ω^d[d] or ω[n], traces of finite maps) is owned twice: three accepted routes make A0-extension its owner, while three accepted routes and AS.1's own text make AS.1 its owner, and the ClassicalAdicEtaleCohomology mod-p Part II imports it from AS.1.

**Fix:** Make A0-extension (classical, more foundational) the single owner, covering the noetherian case and Zavyalov's universally-coherent extension (move ZAVYALOV-25/12–30 there with the classical items of BHATT-ETAL-23 route 5 and HACON-WITASZEK-23 route 5); AS.1 keeps the D_qc/solid formalism plus a comparison theorem; the mod-p Part II imports A0-extension.

### 26. error, medium

**Where:** ClassicalAdicEtaleCohomology:H1:henselian (CESNAVICIUS-19 route 14) — missing prerequisite

The accepted Česnavičius route adds a perfectoid-limit extension of Huber 3.2.9 to H1:henselian, to be proved 'through P5', but H1:henselian has no P5 edge; adding P5 to the whole stage would make every early H1 consumer wait on perfectoid limits.

**Fix:** Create a suffix H1:henselian:perfectoid-limit holding perfectoid-huber, requiring H1:henselian and P5 (acyclic: P5 has no ClassicalAdic ancestor).

### 27. duplicate, medium

**Where:** HabiroCohomologyFoundations:HQ.4, HQ.3; HabiroRings:HR.4, HR.1 vs draft QWittVectors:QW.1–QW.5, QW.7

The q-Witt / q-de Rham–Witt theory is planned twice: in the atlas stages HQ.4, HQ.3, HR.4, HR.1 and in the draft roadmap QWittVectors. The accepted plan PLAN-HABIRO (§6.5) moves this material to QW, but its moves are not applied in the atlas, CR.4 still names HQ.4 as owner, and RS-10 (which would apply them) is needs_changes, so no accepted restructuring resolves the double plan.

**Fix:** Apply PLAN-HABIRO §6.5 when QWittVectors is promoted: QW.1/QW.2–QW.4/QW.5/QW.7 own this material (owners entries); narrow HQ.4 to the framed Habiro ring and q-Habiro–Hodge complex, HR.4 to H_{R/A,m} and Theorem 2.9, HR.1 to étale Frobenius lifts; add QW.5 → HQ.3, QW.7 → HQ.2/HQ.3/HQ.4/HQ.5/HQ.8/HR.6, QW.1 → HR.1/HQ.1, QW.2–QW.4 → HR.4 (acyclic, PLAN-HABIRO §6.8); remove CR.4 → HQ.4, HR.4 → HQ.4 and HQ.4 → HQ.3 so HQ.3 → HQ.4 becomes possible (RS-10 review point 1); change CR.4's sentence to name QW.5.

### 28. duplicate, medium

**Where:** PrismaticCohomology:PR.6 vs draft QWittVectors:QW.6 (import pointer in HabiroCohomologyFoundations:HQ.1)

The framed q-de Rham machinery (automorphisms γ_i lifting T_i ↦ qT_i along an étale framing, q-derivatives, twisted Leibniz rule, the framed q-de Rham Koszul complex and its reduction mod q−1) is built twice, in PR.6 (p-complete) and QW.6 (over a Λ-ring, (q−1)-complete); QWittVectors says PR.6 builds it without importing QW, and HQ.1 imports it from PR.6 whereas PLAN-HABIRO has HQ.1 import it from QW.6.

**Fix:** Record one owner for framed q-derivatives and the framed q-de Rham/q-Hodge Koszul complexes in the general form over an I-completely étale framing (I = (q−1) or (p, q−1)): split QW.6's framing prefix into a stage not needing QW.5 and have PR.6 import and p-complete it; PR.6 keeps q-PD envelopes (BS22 Lemma 16.21), the q-crystalline site and the prismatic comparison; HQ.1 imports from the single owner.

### 29. missing, medium

**Where:** HabiroCohomologyFoundations:HQ.1 / HQ.3–HQ.4 (consumers: draft AnalyticHabiroStack HS.1, HS.3; HQ.6)

Two pieces of mathematics that other plans expect HQ to own are planned nowhere: q-connections and modified q-connections with the identification of modified q-connections on the torus with QCoh((G_m/q^ℤ)^d); and the framed Habiro ring H_{S/A[x]} with automorphisms γ_i and its Koszul complex representing q-𝓗dg_{S/A,□} (Wagner v2 Example 3.12). No HQ stage mentions connections and the libraries have nothing.

**Fix:** Add to HQ.1 the targets of PLAN-HABIRO §6.5's HQ.1 row (q-connections and modified q-connections, with Scholze 1606.01796 §7 as a public source); add to HQ.4 (narrowed) or HQ.3 the γ_i on HR.5's H_{S/A[x]}, the Koszul complex and its identification with q-𝓗dg_{S/A,□} (Example 3.12, Corollary 3.54); have HQ.3 name the twisted q-de Rham complexes q-dR^(m) (v2 3.14–3.19, 3.22, 3.29).

### 30. missing, medium

**Where:** HabiroCohomologyFoundations:HQ.6

HQ.6's analytic side has no supplier: HQ.6 requires only HQ.5, no atlas stage plans the analytic Habiro ring or stack, ring stacks, transmutation or analytic stacks, and the 'owners' HQ.6 cites do not exist in the atlas; the draft AnalyticHabiroStack HS.3 is the intended supplier but the RS-10 link HS.3 → HQ.6 was skipped. Its analytic source line is also out of date.

**Fix:** Add AnalyticHabiroStack:HS.3 → HQ.6 when the draft is promoted (acyclic); until then HQ.6 says its analytic half has no atlas owner; replace 'condensed/analytic stack and six-operation owners' by SolidAnalyticRings, AnalyticStacks and RingStacksAndTransmutation; cite Aoki 2603.01877 and the thesis 1.45, which confirms the comparison is still open.

### 31. error, medium

**Where:** HabiroCohomologyFoundations:HQ.3

HQ.3 puts Wagner v2 Theorem 3.11(b) on the wrong object. The atlas says the ascending filtration with gr ≃ Σ^{−i} q-W_m dR^i lives on qHdg/(q^m−1), with qHdg the (q−1)-completed colimit; in the source it lives on q-𝓗dg/(q^m−1), the Habiro–Hodge complex. On the (q−1)-complete object only (q−1)-completed graded pieces are obtained, so for m > 1 the statement as written is false.

**Fix:** Rewrite HQ.3: construct q-𝓗dg_{R/A} = lim_m q-𝓗dg_{R/A,m} (from 3.42–3.45) and put the filtration on q-𝓗dg_{R/A}/(q^m−1); state that for the (q−1)-complete qHdg only the (q−1)-completed version holds.

### 32. error, medium

**Where:** HabiroCohomologyFoundations:HQ.1 (and HQ.2) — missing prerequisite

HQ.1 works over Λ-rings but has no edge to their atlas owner HR.1; derived q-dR in HQ.2 is defined only over Λ-rings. HR.1 is not an ancestor of HQ.1 or HQ.2, although HQ's README says the early ring inputs are HabiroRings HR.1–5.

**Fix:** Add HR.1 → HQ.1 (acyclic: HR.1 requires only PR.0); once QWittVectors is promoted use QW.1 → HQ.1 instead.

### 33. error, medium

**Where:** HabiroCohomologyFoundations:HQ.7 / HQ.5-trace — missing prerequisite

HQ.7 tests 'a 2-inverted trace-theoretic input with an explicit spherical lift', which is HQ.5-trace's theorem, but HQ.7 requires only HQ.6; neither HQ.5-trace nor RT.4:q-Hodge is an ancestor of HQ.7, and HQ.5-trace has no consumers at all.

**Fix:** Add HQ.5-trace → HQ.7 (acyclic: HQ.7 has no consumers).

### 34. error, medium

**Where:** HabiroCohomologyFoundations:HQ.2 — edge to the wrong layer

HQ.2's only DerivedDeRham edge points at the wrong layer: HQ.2 imports 'ordinary derived de Rham and the Hodge filtration' (DD.2), but its actual edge is DD.6 ('Logarithmic extension and acceptance boundary'), which makes log-crystalline geometry (CR.5, CR.5:log-algebra, DD.3, DD.6) a critical-path ancestor of HQ.2–HQ.8. HQ.2 also attributes complete filtered modules to EnhancedDerivedSheaves, whereas DD.1 owns them.

**Fix:** Add DD.2 → HQ.2 and DD.1 → HQ.2; the maintainer removes DD.6 → HQ.2; change 'from EnhancedDerivedSheaves' to 'from DerivedDeRhamCohomology DD.1'.

### 35. other, medium

**Where:** HabiroCohomologyFoundations:HQ.5 — targets without a proof in the source

HQ.5 treats two statements as results although its sources prove neither: 'Extend to smooth schemes by descent; for smooth proper schemes retain the perfectness result over the Habiro completion of the localized ring'. In Wagner v2 both appear only in introduction 1.16 (p. 8); the body has no scheme-level statement or perfectness theorem, and the thesis (1.45(c)) adds none.

**Fix:** Record both as proof obligations of HQ.5 with their own arguments (Zariski descent of q-𝓗dg on Sm_{A[dim!⁻¹]}; perfectness via Habiro-complete detection, App. B, B.2–B.4, plus Theorem 3.11(b)), or label them 'stated in 1.16 without proof' and log a source issue (kind gap).

### 36. duplicate, medium

**Where:** HabiroCohomologyFoundations:HQ.5 vs HabiroRings:HR.6

The (q−1)-completion comparison for étale inputs is assigned to two stages; AUDIT-19 flags the pair and no accepted restructuring resolves it.

**Fix:** HR.6 owns the comparison; HQ.5 keeps only the export; the Taylor maps stay HR.5's.

### 37. error, low

**Where:** data/decompositions/WeilConjectures.json, node WeilConjectures:WC.2/lefschetz-trace-formula-proper-smooth-via-duality

WC.2's only node decomposes a theorem WC.2 does not use (SGA 4½ [Cycle] 3.3–3.8, the Lefschetz fixed-point formula via Künneth and cycle classes, which is EDC.8's correspondence-trace material), while WC.2's actual target, the functional equation, has no node.

**Fix:** Move the node to EDC.8's packet (or replace it with an import link), and add a WC.2 node deriving Z(X, 1/(q^dT)) = (−1)^χ Δ T^χ Z(X,T) from EDC.8's determinant relation.

### 38. error, low

**Where:** Stage edge DeligneWeightsAndPurity:DWP.4 → DWP.5

DWP.5 lists DWP.4 as a prerequisite, but nothing in it uses Weil I's dimension induction (Weil II replaces the Cartesian-power step); the edge makes the Weil II track wait for all of Weil I §7 and its pencils.

**Fix:** Remove the stage edge DWP.4 → DWP.5 and 'DWP.4' from DWP.5's Dependencies line.

### 39. other, low

**Where:** Part II metadata: EtaleDualityAndPerverseSheavesPartIIRelativeTraces, LefschetzPencilsAndVanishingCyclesPartIIGeneralBasesFourier, EtaleDualityAndPerverseSheavesPartIIMicrolocal, EtaleDualityAndPerverseSheavesPartIIIndConstructibles, LefschetzFiniteFieldBertiniPartII, SemistablePotentialMaps

Several Part II routes have invalid or wrong areas, the Microlocal title does not reproduce its parent's, and the SemistablePotentialMaps brief imports the aggregate LPV.7 contrary to RS-17.

**Fix:** Set these routes' area to 'etale', retitle Microlocal with the parent's exact title, and change the SemistablePotentialMaps import to LPV.7:semistable-curves (with its retained higher-dimensional SNC weight-spectral-sequence extension).

### 40. other, low

**Where:** HabiroCohomologyFoundations:HQ.5-trace

HQ.5-trace's description is byte-identical to HQ.5's (both 2461 characters, both containing the HQ.5-trace anchor), and in the README the paragraph exporting to HR.6 sits under the HQ.5-trace anchor, although HR.6 consumes HQ.5, not HQ.5-trace.

**Fix:** Give HQ.5 only its own two paragraphs and HQ.5-trace only the anchored trace paragraph; move the HR.6 export paragraph above the anchor.

## What held

- **Cycles.** None, before or after the accepted restructurings' links.
- **Restructurings.** RS-17's owner decisions for the weights family are coherent and applicable. RS-05 settles the diamond overlaps with the adic pair. The Part IIs of EtaleDualityAndPerverseSheaves do not overlap each other except where a finding says so.
- **Currency.** Nothing is stated as open that is now proved: general weight–monodromy, arithmetic Frobenius semisimplicity, the Hodge standard conjecture and the algebraic–analytic Habiro comparison are all still open. The cited sources match their recorded hashes or versions. Wagner's arXiv versions are the latest.
- **Single owners.** Huber's comparison theorems, the Berkovich–Huber topos comparison, Scholze's primitive comparison, mod-p Poincaré duality, Kiehl and Elkik, and the q-de Rham prism and q-crystalline site each have exactly one owner.

## Checks

- `python3 scripts/check_redteam.py research/blueprint/redteam/RT-AREA-etale.result.json`: ok.
- Lean: none. An area red team has no Lean deliverable.
