# Liu–Zhu (2017): extraction and independent review

Paper issue [#1302](https://github.com/CBirkbeck/tauceti-explorer/issues/1302); review [#1303](https://github.com/CBirkbeck/tauceti-explorer/issues/1303). Extraction status: **partial**. Review verdict: **revise**.

Independent reviewer: Codex — codex-a71f92, 23 September 2026. Input checkpoint PR1977 was by codex-c83e7a; completion PR2110 was by cc-442dc5. This review supersedes the latter's completeness assertion, not its provenance. Neither input is the reviewer's work.

Current inventory: **132 items, 16 library, 13 planned, 103 missing**. Every missing item has one proposed route, but routes6,9,12,15 are rejected and must not be treated as approved owners. The review itself is finished; source and supplier gaps keep the extraction partial. API/tests below are planning specifications, not implemented wrappers or Lean proofs.

Source: Liu–Zhu, [final arXiv v3](https://arxiv.org/abs/1602.06282v3), all35pages including proofs and bibliography read independently. [Version of record](https://link.springer.com/article/10.1007/s00222-016-0671-7): Invent. Math.207 (2017),291–343; the full53-page published text was not obtained. All findings refer only to v3. Thirteen source entries are retained:12 confirmed, E08 rejected.

## Review corrections

- A09 now leaves tensor **inside** Galois cohomology, as Lemma3.11 does. A10 separately uses sufficiently wide windows and flat-cohomology base change; no arbitrary-window H^i⊗B assertion survives.
- A11 includes filtrations on both D^0 and D^1. R11/R12 now cite Theorem3.8(iii)/(ii), respectively. T27 uses the affinoid unit torus with m≥1, not all G_m^an.
- Added P19 (Hodge–Tate family predicate), P20 (de Rham local-system association) and T28 (the explicit completed-structure-sheaf/Higgs cohomology comparison).
- Corrected nonexistent §1.1/§4.3 locators, §2.3 proof locators, T01/T22/A01 formula references and the [SW] bibliographic substitution. T06 now identifies the finite-projective supplier Lemma5.6.6 rather than treating scalar strict cochains as the module result.
- P12/P17/G01 are missing, not already planned wholesale. Route1 adds P8's proper suffix and R06.5; route4 adds E1. Routes6,9,12,15 require the revisions below.
- GAP02–GAP06 remain open, not discharged by relabelling them downstream design. GAP07's independent verification is resolved; GAP09 records ownership repair.

### Mathematical scope

| Setting | Proved result | Boundary |
|---|---|---|
| Smooth rigid X over finite k/Qp | H sends Qp local systems to nilpotent Higgs bundles on X_K with semilinear Galois action | A tensor functor, not a claimed equivalence or full faithfulness |
| Ringed de Rham base X_BdR | RH gives filtered bundles with integrable connection and period reconstruction | No canonical K→BdR embedding or ordinary rigid base-change construction |
| Arbitrary morphisms between smooth rigid spaces | Pullback compatibility of H, RH and every D^i_dR | Includes nonflat closed embeddings; proof needs Tor control |
| Smooth proper f | Higgs and de Rham direct-image comparisons | The proof assumes all R^q f_*L are Zp local systems |
| Geometrically connected rigid X/k | One classical de Rham stalk implies all are de Rham with the same weight multiset | Crystalline and semistable analogues are false; singular reduction requires its own resolution argument |
| Geometrically connected algebraic X/number field | One geometric closed stalk implies all closed stalks geometric | Geometric means unramified almost everywhere and de Rham at p, not an actual motivic realization |
| All Shimura data | Canonical G^c local systems have geometric stalks and analytic de Rham torsors | Comparison with the algebraic automorphic torsor is conjectural in this paper |

The relative Fontaine–Mazur prediction remains a conjecture, apart from the separately cited abelian-monodromy case. The uniform potential-semistability expectation and the proposed full Fargues–Fontaine twistor family are not constructed here. These distinctions are part of the inventory and its gap register.

### Proof architecture

The local geometric chain starts with the corrected proétale site and structural period sheaves. A toric chart has a perfectoid tower with Γ_geom=Zp(1)^n and polynomial OC coordinates V_i. Kedlaya–Liu decompletion gives a finite-level module with cohomology comparison. Arithmetic cyclotomic conjugation and finite descent make its geometric action quasi-unipotent; cancellation of finite Kummer characters produces the canonical unipotent module M_K. The polynomial translation lemma computes OC invariants and kills higher cohomology. This gives H, its nilpotent Higgs field, reconstruction and pullback.

The period connection has the sign `gr∇V_i=−t⁻¹dlog(T_i)`. On invariant lifts the total operator is `θ+t⁻¹∂_V`, so the induced period field is θ. The finite Kummer example has a nontrivial local system but zero Higgs field, illustrating why descent and Galois data matter. On a non-rational point, the entire base-changed fiber uses the induced representation from its residue-field Galois group; one must not identify all components with a single geometric fiber.

The ringed de Rham base uses finite-field completed tensors with BdR+/t^n, their inverse limit, and then t-inversion. Finite-projective descent and the graded Simpson result lift through the filtration to RH. Its plus lattice carries the t-connection t∇. Reducing modulo t gives the Higgs object; after inverting t the ordinary connection is recovered by dividing by t. Keeping t∇ unchanged would give the wrong Leibniz rule.

The arithmetic chain specializes K to the completed cyclotomic extension. Corrected Tate–Sen decompletion reduces Galois cohomology to finite coefficients and a procyclic two-term complex. Graded weight bounds give coherent D^i_dR, and connections on a smooth characteristic-zero base make them locally free. Arbitrary pullback requires both algebraic nonflat base change and comparison with completed tensors. A single full-rank de Rham stalk then fixes the rank on a connected base. The filtered-window induction supplies subbundles and strictness before taking graded objects.

Globally, normalize compactifications in congruence frame covers and split branch divisors into vertical and horizontal parts. A good arithmetic section bounds vertical ramification uniformly in the level; every other section meets the horizontal boundary only finitely often. Combine this with local de Rham rigidity. For Shimura varieties, geometric-Artin torus reciprocity gives potentially crystalline special-point representations. Special points in each geometric component and global rigidity give all canonical stalks. The representation group is G^c=G/Z_G^s throughout; the ancillary B(G) assertion needs an additional lifting input.


## Route decisions

These verdicts concern the corrected route objects; the overall revise verdict gates application. An accepted source direction does not claim its suppliers are implemented or recursively closed.

### Route 1: PadicHodgeTheory — accept

Type: source. 

Stages: `PadicHodgeTheory:R06.1`, `PadicHodgeTheory:R06.2`, `PadicHodgeTheory:P8:local-rational`, `PadicHodgeTheory:P8`, `PadicHodgeTheory:R06.5`.

Items: P01, P02, P07, P08, P09, P10, P11, T03, T22, T23, G13, G23, P19, P20.

Import the pinned underlying period rings, then complete their filtration/Galois/DVR structure and the existing period-functor owner. P8:local-rational owns corrected structural period sheaves, OC/Faltings extension, local acyclicity and relative Poincaré. It precedes proper comparisons; the new Simpson/RH application is placed in T6:comparison, so there is no reverse dependency through a proper comparison. Review: P8's proper suffix, not merely P8:local-rational, supplies T23; R06.5 receives G23's geometric representation applications. P19/P20 are explicit relative period-functor predicates. No reverse dependency from early period sheaves to the Simpson consumer is introduced.

Review: Corrected stage assignment: R06.1/2 and P8:local-rational own period foundations and predicates; the full P8 proper suffix is needed for T23, and R06.5 for G23 geometric representation applications. The early/local dependency cut is preserved.

### Route 2: AdicEtaleGeometry — accept

Type: source. 

Stages: `AdicEtaleGeometry:A1`, `AdicEtaleGeometry:A2`.

Items: P03, P04, P13, P14, T18.

Reuse the corrected ordinary analytic sites, base-change maps and coherent slice arguments. Add the exact finite-descent basis and perfectoid finite-projective pullback adapters here; do not use deleted Scholze point descriptions. Basic analytic geometry remains AdicSpacesPartII.

Review: A1 supplies the corrected analytic site; A2 imports the canonical geometry and coefficient descent, not a duplicate adic-space carrier. P13/P14/T18 are appropriate missing source statements, with perfectoid specialization hypotheses retained.

### Route 3: AdicSpacesPartII — accept

Type: source. 

Stages: `AdicSpacesPartII:R0`, `AdicSpacesPartII:R3`.

Items: P05, P06, P15, P18.

R0 supplies local smooth/toric geometry and analytic differential adapters; R3 supplies coherent-module descent, Tate/Kiehl and the connection-to-local-freeness application. R4 is only a site reexport and is not credited with these geometric theorems.

Review: R0/R3 own smooth charts, analytic differentials, coherent modules and finite-projective descent. Algebraic Kähler differentials do not alone supply the completed analytic module. P18's source-qualified local-freeness proof remains an explicit gap, not a library claim.

### Route 4: EnhancedDerivedSheaves — accept

Type: source. 

Stages: `EnhancedDerivedSheaves:E1`, `EnhancedDerivedSheaves:E2`.

Items: P12.

Coherent-slice colimits, derived limits and the period-tower Mittag–Leffler input use the shared cohomological-completeness owner. Generic derived completion is imported from DD.1. Review: E1 is also needed for filtered colimits; P12 is missing, not an already explicit E2 theorem.

Review: After adding E1 and changing P12 to missing, the filtered-colimit/derived-limit contract is a source contribution to the shared derived-sheaf owner. Work on coherent slices and prove the actual limit hypotheses; do not assume arbitrary X is quasi-compact or every analytic topos replete.

### Route 5: DerivedDeRhamCohomology — accept

Type: source. 

Stages: `DerivedDeRhamCohomology:DD.1`.

Items: P16, A08.

Reuse the single Koszul/completion foundation, extending its basic Koszul carrier to finite families of commuting endomorphisms as required by continuous toric cohomology and Higgs complexes. Record the flat two-term cohomology base-change lemma here; keep Tor terms rather than re-plan a private derived category.

Review: DD.1 is the shared Koszul/derived-completion owner. The commuting-endomorphism specialization uses a polynomial-ring action, and A08 retains flat cohomology as a hypothesis. Reuse existing derived-category and Tor carriers.

### Route 6: ArithmeticGaloisDuality — reject

Type: source. 

Stages: `ArithmeticGaloisDuality:R02.1`, `ArithmeticGaloisDuality:R02.2`.

Items: P17, A02, A03, A04.

The pin already has continuous cochains. This owner supplies actual Banach-coefficient Cartan–Leray/procyclic/Hochschild–Serre comparisons and the reusable corrected Tate–Sen trace/inverse/decompletion input, including finite rational descent at p=2. The classical PG Herr complex is not a replacement for these analytic coefficient theorems.

Review: R02.1/2 do not plan cyclotomic Tate–Sen normalized traces, norm estimates or arbitrary finite affinoid-module decompletion. P17 also combines site Cartan–Leray with Banach/procyclic and analytic comparison outside the stated compact/lattice scope. Split these inputs; use p-adic Hodge/geometric-tower suppliers for specialized estimates and the existing cohomology owner only for general carrier/comparison results.

### Route 7: CrystallineCohomology — accept

Type: source. 

Stages: `CrystallineCohomology:CR.1`.

Items: H01.

Use the already designated generic integrable-connection carrier, formulated on a ringed differential site and independent of the later crystalline quasi-nilpotence condition. HodgeStructuresPartII already explicitly imports this same carrier. Analytic and period instances are adapters, not new definitions of connection.

Review: CR.1 supplies the shared connection/stratification carrier. Its crystalline specialization requires quasi-nilpotence; this source contribution must not turn arbitrary analytic integrable connections into crystals. No new connection carrier is justified.

### Route 8: HodgeTateAndCanonicalSubgroups — accept

Type: source. 

Stages: `HodgeTateAndCanonicalSubgroups:T6:comparison`.

Items: T01, T09, T10, T11, T12, T13, T14, T15, T16, T17, T19, T20, T21, T24, T25, T26, T27, R01, R02, R03, R04, R05, R06, R07, R08, R09, R10, R11, R12, R13, R14, R15, R16, A01, A05, A06, A07, A09, A10, A11, A12, A13, A14, A15, A16, G05, G06, G07, G08, G11, G12, G16, G18, G19, G20, T11C, T16V, T21D, T25H, R10V, A07V, A16R, G12C, T28.

The full stage explicitly owns logarithmic Riemann–Hilbert, arithmetic rigidity and canonical G^c local systems. Liu–Zhu supplies its ordinary, empty-boundary prefix: nilpotent Simpson, geometric and arithmetic RH, arbitrary pullback, qualified proper pushforward and local/global rigidity, followed by the canonical Shimura application. No competing PadicHodgeTheory Riemann–Hilbert successor is proposed. The prefix only needs the ordinary site/period suppliers and geometric decompletion; the later logarithmic boundary and algebraicity comparison stay in the existing suffix.

Review: T6:comparison explicitly owns logarithmic RH, arithmetic rigidity and canonical local systems. Its ordinary empty-boundary prefix is the right home for Liu–Zhu, now including T28. The corrected A09/A11 and predicates preserve the Higgs/arithmetic distinction. Supplier closure remains an overall extraction gate, not a second RH roadmap.

### Route 9: SchemeAndStackFoundations — reject

Type: source. 

Stages: `SchemeAndStackFoundations:SF.4`.

Items: G01.

Import characteristic-zero resolution, compactification and spreading from the existing birational-model owner, retaining a named analytic resolution theorem and the disconnected-resolution/component-propagation obligation.

Review: SF.4 gives scheme/model/birational foundations, not the named rigid-analytic resolution theorem used in G01. Split algebraic compactification/spreading from rigid desingularization and connected-component propagation; assign the latter to an actual analytic owner with a precise source. G01 is no longer planned wholesale.

### Route 10: InverseGaloisAndArithmeticFundamentalGroups — accept

Type: source. 

Stages: `InverseGaloisAndArithmeticFundamentalGroups:IG.0`, `InverseGaloisAndArithmeticFundamentalGroups:IG.1`.

Items: G02, G03, G04.

Frame torsors, tame inertia, purity/specialization and uniform vertical ramification belong to the arithmetic fundamental-group owner. These supply the almost-everywhere unramified half of global rigidity; no second fundamental group is proposed.

Review: IG.0/1 own finite-cover Galois categories, inertia and specialization. G02–G04 are legitimate source additions with total finite étale normalization and p excluded in the tame argument. Purity and nonproper boundary/section avoidance remain named supplier obligations.

### Route 11: ShimuraVarieties — accept

Type: source. 

Stages: `ShimuraVarieties:V4`, `ShimuraVarieties:V7`, `ShimuraVarieties:V8`.

Items: G09, G10, G17, G17S.

Reflex norms, geometric-Artin torus reciprocity, canonical models for general data and special points already have owners. Import them for the special-stalk calculation; all-datum geometry is not inferred merely from abelian-type models.

Review: V4/V7/V8 match torus reciprocity, all-datum canonical models and the algebraic tower. Preserve source/target levels for Hecke maps and the separate special-point-in-each-component supplier; do not infer arbitrary-data canonical models from the abelian case alone.

### Route 12: ReductiveGroupsPartII — reject

Type: source. 

Stages: `ReductiveGroupsPartII:RG2.0a`, `ReductiveGroupsPartII:RG2.5`.

Items: G14, G15, G15C.

Build the central anisotropic/real-split quotient and its unit-closure criterion using the existing torus/lattice carriers, Weil restriction and quotient group owner. Share the exact quotient G^c with automorphic and Tannakian consumers.

Review: RG2.0a constructs Weil restriction; RG2.5 constructs the integral dual/L-group. Neither plans the rational/real-split central quotient or adelic unit-lattice/discreteness conclusions G14/G15/G15C. Coordinate the torus algebra with the existing AdelicAlgebraicGroups central-quotient/reduction owner (AA.0–AA.3) and give precise statements instead of routing to unrelated dual groups.

### Route 13: BunGAndNewtonStrata — accept

Type: source. 

Stages: `BunGAndNewtonStrata:BG0`, `BunGAndNewtonStrata:BG2:uniformization`.

Items: G21, G22.

BG0 already owns exact tensor functors, torsors and G-isocrystals. Import RF4 patching and VB2 classification for the pointwise period-lattice modification application; record that the source functor gives G^c structure and requires extra input for a G lift.

Review: BG0/BG2:uniformization are the correct reductive-isocrystal and bundle-classification owners. G21/G22 must use G^c for the given tensor functor unless an additional G lift is supplied (E10). Corrected [SW] provenance does not pretend its unread classification proof is closed.

### Route 14: HodgeStructuresPartII — accept

Type: part-ii. Parent: `tauceti:TauCetiRoadmap/HodgeStructures`.

Items: H02, H03.

Reuse the existing candidate, whose full two source briefs were read. Its Higgs, λ-connection and Griffiths algebra must be formulated early for general ringed differential sites so the complex, crystalline and rigid analytic specializations share it. This does not make the p-adic proof depend on complex nonabelian Hodge theory. The candidate is not an existing planned stage.

Review: Reuse the existing HodgeStructuresPartII candidate and its Landesman–Litt/Esnault–Groechenig briefs. A ringed-differential-site Higgs/λ-connection prefix can serve complex, crystalline and analytic consumers without making p-adic RH depend on complex Simpson. This extends, not duplicates, the upstream fibrewise Hodge roadmap.

Design brief (subject to the verdict above):

Extend the existing HodgeStructuresPartII candidate from its parent tauceti:TauCetiRoadmap/HodgeStructures. Preserve the Landesman–Litt and Esnault–Groechenig briefs; this adds a shared early algebraic prefix, not a replacement for those endpoints. Import the generic connection carrier from CrystallineCohomology CR.1, analytic differentials from AdicSpacesPartII R0, algebraic Kähler differentials from the pin, and the shared commuting-endomorphism Koszul construction from DerivedDeRhamCohomology DD.1. Define twisted integrable Higgs bundles, finite nilpotence filtrations, tensor/dual fields, λ-connections and Griffiths filtrations on ringed differential sites. Construct associated-graded Higgs maps and λ-invertible rescaling explicitly; prove compatibility with the already planned complex and characteristic-p carriers. Keep nilpotence bounds and nonreduced bases explicit. Prove the nilpotent endomorphism coordinate characterizations in the reduced finite-rank settings actually used. The p-adic instance uses Ω¹(-1); its Galois twist cannot be erased. Tests: nonzero E12 Higgs field, a nonnilpotent scalar Higgs line over a reduced base, noncommuting curvature matrices, λ=0, λ=1 and λ=t with division by t after inversion. Suggested file: TauCeti/Geometry/Hodge/Higgs/ParameterConnection.lean. Export this prefix to the ordinary Liu–Zhu proof in HodgeTateAndCanonicalSubgroups T6:comparison and to CrystallineCohomologyPartIICartierFlows. The ordinary p-adic Simpson functor, analytic RH and rigidity are not owned here; complex Simpson and stable moduli remain the previous candidate's later layers. Design the prefix without a reverse dependency on its consumers.

### Route 15: PhiGammaModulesPartIIGeometricTowers — reject

Type: part-ii. Parent: `PhiGammaModulesAndIwasawaCohomology`.

Items: T02, T04, T05, T06, T07, T08.

PG.0–PG.6 are fixed-field cyclotomic constructions and PG.7 is the KPX arithmetic affinoid-family theorem. The full README explicitly excludes obtaining multivariable towers by renaming Γ. Liu–Zhu requires the distinct KL geometric and arithmetic-geometric toric decompletion theorem. One continuation owns that reusable input; it imports the parent coefficient comparisons and does not rebuild Robba analytic carriers.

Review: The geometric-tower Part II direction is justified relative to PG.0–PG.7, but the current brief is not yet a safe implementation contract: KL perfect/imperfect rings, weak/local decompletion, finite-projective quotient cochains and theta specialization remain bundled; the original Tate–Sen import was invalid. T06 now cites Lemma5.6.6, but exact coefficient/radius/strictness hypotheses and supplier DAG still need extraction, plus the v1/current-version comparison. Keep this candidate, revise its detailed brief before creating its design job.

Design brief (subject to the verdict above):

Start after PhiGammaModulesAndIwasawaCohomology, importing its fixed-field cyclotomic construction and proving the zero-geometric-dimension specialization agrees. Import PadicHodgeTheory P7:annulus-foundations for general analytic ring/norm operations, R06.1 for period constants, AdicSpacesPartII R0/R3 for completed affinoid products/coherence, AdicEtaleGeometry A1 for the corrected site, PerfectoidSpaces for the toric completions, and the existing continuous-cohomology carrier/general comparisons from ProfiniteCohomology and ArithmeticGaloisDuality only within their coefficient hypotheses. Specialized analytic comparison and corrected Tate–Sen norm estimates require explicit p-adic-Hodge suppliers; route6 does not establish them. This is geometric toric descent, not a second KPX arithmetic-family theorem.

Construct both toric towers over a perfectoid field containing the cyclotomic extension and relative toric towers over a finite p-adic field, with the exact Γgeom=Zp(1)^d and cyclotomic semidirect action. Define weak and local decompletion, the perfect/imperfect relative Robba rings at bounded radii, Γ-modules and φ-linearizations, and distinguish globally étale modules from arbitrary φ-modules. Read KL2 at the cited v1 and compare with the current corrected version before closing the design. Prove the fractional-monomial quotient decomposition, the γ−1 inverse with uniform norm bounds, strict cochain exactness, rational/finite-étale stability and analytic-to-continuous cohomology comparison. The relative arithmetic Γ factor is not normal, so use the source's correct cohomology argument there. Descend finite-projective idempotents and actions, then prove the exact tensor equivalence for globally étale modules rather than assume it in a structure field.

Final export is Liu–Zhu Lemma2.14: for a local system on a smooth toric chart, a sufficiently high finite B_m module M_m, its completed reconstruction, all Γgeom cohomology comparisons and standard étale base-change compatibility. The choice M_m is not unique. Prove the theta-specialization cocartesian squares with radii0<s≤r/p and p^ms≤1≤p^mr; strictness and completion cannot be dropped. The canonical unipotent summand, arithmetic nilpotence, polynomial OC calculation and H/RH functors belong to T6:comparison, which consumes this module. Tests include dimension0 agreement with the parent, one toric coordinate, a finite nontrivial Kummer character, a rational localization, a finite étale extension, radius rescaling and a non-étale Robba module. Suggested files: TauCeti/NumberTheory/PadicHodge/GeometricTowers/{PeriodRings,Decompletion,EtaleModules,ThetaSpecialization}.lean. Split every original supplier declaration and close the analytic norm/descent gaps before claiming a completed blueprint.

## Source findings: independent verdicts

The bounded correction search checked the arXiv history, publisher page and targeted title/identifier searches. No applicable correction was found. Liu's page timed out and Zhu's old homepage was unavailable during this review; earlier successful checks remain attributed history in JSON. Novelty is not proved, and findings are not asserted present in the unavailable published version. No author was contacted.

### E01 — confirmed (misprint)

Locator: arXiv1602.06282v3; Lemma2.10 proof,PDF13.

Printed mathematical/textual token: `Σ_(i=1)^r γ^-i(1−γ)^(i−1)(w) binom(V,i+j)`.

Correction: Use the upper bound r+1 under the printed assumption (γ−1)^(r+1)w=0.

Reason: For r=0 and γ=1,w=1,j=0, the printed sum is empty, so its difference is0 rather than1. The corrected primitive is V. In general adjacent binomial coefficients telescope and only the (r+1)st nilpotence power remains. Exact rational Jordan-block diagnostics confirm the correction.

Independent decision: Confirmed from v3 Lemma2.10 and TeX: r=0, γ=1, w=1, j=0 makes the displayed sum empty. Including i=r+1 gives the required binomial primitive. Exact rational checks also exercise nontrivial unipotent Jordan blocks.

Reach: the proof. No broader failure is inferred.

### E02 — confirmed (misprint)

Locator: arXiv1602.06282v3; θ display after(2.13),PDF14.

Printed mathematical/textual token: `θ: O_X+(U_j) hat⊗ Ainf(U) → hatO_X+(U_j)`.

Correction: The target is hatO_X+(U), or R+ for the completed affinoid perfectoid U, with [1/p] giving R in the later completed formula.

Reason: The Ainf(U) theta map lands in the completed ring of U; there is no such canonical map back to the finite-level U_j ring. Scholze’s corrigendum PDF2 explicitly gives the corrected target and tensor construction.

Independent decision: Confirmed only the finite-level target typo. The theta map evaluates A_inf(U) in the completed U ring. The source ALREADY includes p-adic completion; Scholze's three-page corrigendum corroborates the target, not an allegation of an uncompleted tensor in Liu–Zhu.

Reach: nothing. No broader failure is inferred.

### E03 — confirmed (misprint)

Locator: arXiv1602.06282v3; Last display and sentence,PDF15.

Printed mathematical/textual token: `V_i↦V_i (i≤n); V_i↦0 (i>n)`.

Correction: For n source variables and m target variables, use i≤min(m,n); in a closed embedding kill V_i for m<i≤n. For a smooth projection m≥n retain all source variables.

Reason: For a closed embedding T^1→T^2 with T_2=1, the displayed source variable V_2 must map to0, but the printed rule asks for a nonexistent target V_2 and its zero condition never applies to a source index.

Independent decision: Confirmed from the polynomial map on PDF15/TeX: for m=1,n=2 the source V_2 must be killed. The printed threshold n asks for a nonexistent target variable.

Reach: nothing. No broader failure is inferred.

### E04 — confirmed (misprint)

Locator: arXiv1602.06282v3; Lemma3.1,PDF20.

Printed mathematical/textual token: `H^i((X_K)_et,O_Xhat⊗(BdR+/t^i))`.

Correction: Separate q, the cohomological degree, from n≥1, the truncation index. State H^q of BdR+/t^n as sections for q=0 and0 for q>0.

Reason: The printed i=0 clause only computes the zero sheaf BdR+/t^0, so it does not state the desired sections theorem for any nonzero truncation. The proof immediately uses induction on the truncation length.

Independent decision: Confirmed from the displayed formula and its induction proof. Cohomological degree and truncation length must be independent; otherwise the i=0 case concerns the zero quotient.

Reach: nothing. No broader failure is inferred.

### E05 — confirmed (misprint)

Locator: arXiv1602.06282v3; Theorem3.8(iv),PDF23; Lemma3.11,PDF27.

Printed mathematical/textual token: `f:X→Y; f*L (L on X)`.

Correction: Use f:Y→X, so A→B and pullback of L to Y agree with every subsequent formula.

Reason: A local system on X cannot be pulled back along a morphism with target Y. The proof and displayed coefficient maps have the corrected variance.

Independent decision: Confirmed variance at both locators: the coefficient morphism is A→B and L is on X, so f has source Y and target X. Theorem3.8 is on PDF23 (its proof continues on24).

Reach: nothing. No broader failure is inferred.

### E06 — confirmed (error)

Locator: arXiv1602.06282v3; Lemma3.10 statement and proof,PDF25; repeated in Lemma3.11,PDF27.

Printed mathematical/textual token: `v_p(χ(γ)−1)≥m ⇒ (γ−1)^−1 on (Mhat⊗K)/(M⊗k_m)`.

Correction: For the cohomology proof select a generator of Gal(k∞/k_m), with v_p(χ(γ)−1)=m after stable indexing. The scalar Tate–Sen inverse bound applies when n(γ)≤m; retain the additional small-action requirement in the finite-module perturbation argument. Do not quantify over all deeper elements.

Reason: Take k=Q3,M=k and χ(γ)=1+3^(m+1). This is a nonidentity cyclotomic element meeting ≥m, yet it fixes ζ_(3^(m+1)), whose class in K/k_m is nonzero since [k_(m+1):k_m]=3. Thus γ−1 has a nonzero kernel. Berger–Colmez Definition3.1.3(TS3),printed310,visually read, has n(γ)≤n; Proposition4.1.1 realizes that condition for Cp. This repairs the input used for the cohomology proof, without refuting the main rigidity theorem. (cc-442dc5) Rechecked at the locator. The statement quantifies over all γ with v_p(χ(γ) − 1) ≥ m, while the proof says 'it suffices to treat the case that v_p(χ(γ) − 1) = m', which the counterexample shows is not a reduction. The cohomological consequence, which needs only a topological generator of Gal(k∞/k_m), stands.

Independent decision: Confirmed the false quantified lemma, not a failure of rigidity. For k=Q3, m≥1, χ(γ)=1+3^(m+1) fixes a nonzero ζ_(3^(m+1)) class in K/k_m. BC TS3 has n(γ)≤n (original printed310 inspected visually). A suitable level generator is the intended input; full norm-controlled finite-module repair remains GAP04.

Reach: a stated result. No broader failure is inferred.

### E07 — confirmed (misprint)

Locator: arXiv1602.06282v3; Proposition4.1 proof,PDF29.

Printed mathematical/textual token: `Frac(X_m)`.

Correction: Normalize in the total finite étale algebra of the possibly disconnected frame torsor, or work componentwise. The full frame torsor can retain its GL_n torsor action; only a selected connected component has the monodromy subgroup.

Reason: The full frame torsor need not be connected: a constant rank-one F3 local system has a two-component frame cover. Its total quotient algebra is a product of fields, not one fraction field. The ramification argument works componentwise with the same group-order bound.

Independent decision: Confirmed only the fraction-field wording: the constant F3 line has a two-component frame torsor. A disconnected GL_n torsor remains a valid torsor; its normalization uses the total finite étale algebra, not a single field.

Reach: the proof. No broader failure is inferred.

### E08 — rejected (misprint)

Locator: arXiv1602.06282v3; Congruence-level paragraph,PDF33.

Printed mathematical/textual token: `system of open neighborhoods of G(Qp)`.

Proposed clarification, not a verified source correction: Say that the K_p^(n) are open normal congruence subgroups in K_p sufficient to trivialize Λ/p^n. They are neighborhoods of K_p∩kerρ and form an identity basis only after passing to the effective image.

Reason: For the trivial representation K_p^(n)=K_p for all n. The construction of associated finite sheaves needs these open kernels, not faithfulness of ρ or an identity-neighborhood basis in G.

Independent decision: Rejected as an alleged missing-faithfulness error. The source says 'system of open neighborhoods', not a fundamental system or neighborhood basis. Every congruence kernel is indeed open and contains the identity, even for trivial ρ. Effective-image language is useful exposition but does not establish a false mathematical assertion.

Reach: nothing. Not a confirmed erratum.

### E09 — confirmed (misprint)

Locator: arXiv1602.06282v3; Example4.7,PDF33.

Printed mathematical/textual token: `Betti local system of the first de Rham homology`.

Correction: The Betti local system is first singular homology with Q coefficients; de Rham homology is its vector-bundle comparison realization after the appropriate scalar extension.

Reason: The Betti system V has a rational locally constant carrier, whereas algebraic de Rham homology is a vector bundle over the base. The stated Tate-module comparison is consistent with singular homology.

Independent decision: Confirmed category/realization slip: the rational Betti local system is singular homology, whereas relative de Rham homology is a vector bundle. The adjoining Tate-module assertion fixes the covariant convention.

Reach: nothing. No broader failure is inferred.

### E10 — confirmed (gap)

Locator: arXiv1602.06282v3; Remark4.1(iii),PDF34.

Printed mathematical/textual token: `b_x∈B(G_Qp)`.

Correction: The tensor construction explicitly available in the preceding paragraph yields a class in B(G^c_Qp). To assert a class in B(G_Qp), supply a G-level lift and prove its existence/choice properties, or assume G=G^c.

Reason: The available functor has domain Rep(G^c), so its Tannakian structure group is G^c. It omits central representations removed by G→G^c, and therefore cannot by itself reconstruct that missing central data. This is an omitted group-lifting input in an ancillary remark, not a counterexample to Theorem1.2.

Independent decision: Confirmed narrowly as an omitted lifting input in Remark4.1(iii): the stated tensor functor has domain Rep(G^c_Qp), so it yields G^c structure, not by itself G structure. No impossibility of an additional lift and no counterexample to Theorem1.2 is asserted.

Reach: the proof. No broader failure is inferred.

### E11 — confirmed (misprint)

Locator: arXiv1602.06282v3; First paragraph,PDF31.

Printed mathematical/textual token: `r(μ)_K|Gal(Fab/F_K):Gal(Fab/F_K)→K/(K∩T(Q)^−)`.

Correction: Restrict the full inverse-limit map r(μ), then use that its image is in K/(K∩closure). Reserve r(μ)_K in(4.3) for the finite quotient map, or explicitly redefine the notation.

Reason: F_K is defined by the kernel of the finite map r(μ)_K, so its literal restriction is trivial. The nontrivial map used to construct r(μ,ρ) comes from the full reciprocity map displayed immediately before.

Independent decision: Confirmed as notation only. Restricting the finite quotient map to its defining kernel is trivial; the intended nontrivial character is obtained by restricting the inverse-limit reciprocity map. The source's reuse of notation can be repaired explicitly.

Reach: nothing. No broader failure is inferred.

### E12 — confirmed (gap)

Locator: arXiv1602.06282v3; Proposition4.1 proof,choice of N onPDF29 and tame-inertia deduction onPDF30.

Printed mathematical/textual token: `|GL_n(F_p)| divides N`.

Correction: Also require p to divide N before asserting that every surviving residue characteristic is prime to |GL_n(Z/p^m)|. Enlarge N by p; this is harmless to the almost-everywhere conclusion.

Reason: For n=1, |GL_1(F_p)|=p−1, so the displayed divisibility condition does not exclude residue characteristic p. But |GL_1(Z/p²)|=p(p−1), and wild inertia can have nontrivial image there. For n≥2 the printed order already contains p. The uniform tame argument needs the explicit extra condition in rank one.

Independent decision: Confirmed rank-one omission in the tame proof: |GL_1(F_p)|=p−1 does not exclude p, while the mod-p² group has order p(p−1). Adding p to N is harmless; this is not a counterexample to the almost-everywhere result.

Reach: the proof. No broader failure is inferred.

### E13 — confirmed (misprint)

Locator: arXiv1602.06282v3, §2.3 immediately after(2.9), PDF12; TeX Higgs-cohomology display.

Printed mathematical/textual token: `ϑ∧ϑ : M_K⊗Ω¹(-1) → M_K⊗Ω²(-2)`.

Correction: Use the exterior extension d_ϑ=ϑ∧ in degree1, defined by m⊗ω ↦ ϑ(m)∧ω. The composition d_ϑ² is the curvature and vanishes, not the differential d_ϑ itself.

Reason: Take M=Ae1⊕Ae2 over a two-variable characteristic-zero base and ϑ(e2)=e1 dx, ϑ(e1)=0. Integrability holds, yet d_ϑ(e2⊗dy)=e1 dx∧dy is nonzero. The printed curvature ϑ∧ϑ has source M and is zero. This is a typed arrow-label slip, not failure of the intended Higgs cohomology comparison.

Independent decision: Checked the displayed arrow in the full v3 text and independently in the author TeX (not an OCR artifact). The explicit nilpotent rank-two calculation distinguishes the differential from its square. T28 records the correctly typed comparison.

Reach: nothing. No broader failure is inferred.

## Inventory and planning API

### L06 — Connected reductive group predicate

definition; library. Reuse the finite-type commutative Hopf-algebra property expressing smoothness, geometric connectedness and trivial geometric connected normal smooth unipotent subgroups.

Locator: §§2–4 foundational algebra, cohomology and torus inputs.

Pinned declarations: `tauceti:TauCeti.reductiveCommHopfAlgProperty`, `tauceti:TauCeti.reductiveCommHopfAlgProperty_iff`.

API:

- `LiuZhu17.L06.geometricRadical` (characterisation): Reuse the geometric normal-unipotent-subgroup characterization.
- `LiuZhu17.L06.baseChange` (compatibility): Transport the predicate through permitted field extensions.
- `LiuZhu17.L06.iso` (functoriality): Transport reductivity under Hopf-algebra isomorphisms.

Acceptance specifications (not Lean compiled):

- `LiuZhu17.L06.test1` (compatibility): G_m is reductive.
- `LiuZhu17.L06.test2` (compatibility): GL_n is reductive in characteristic zero.
- `LiuZhu17.L06.test3` (compatibility): The additive group is not reductive.

Use in §§2–4: Underlying Witt, finite-projective, derived, Galois, scheme or torus carrier; none supplies the analytic period-sheaf or rigidity theorem.

Review/coverage note: Only the cited pinned declarations are existing implementation evidence. The downstream API and tests specify requested reuse or adapters; they do not claim uninspected wrappers are built.

### L07 — Algebraic torus predicate

definition; library. A finite-type affine group over a field is a torus when its coordinate Hopf algebra becomes that of a finite-rank split torus after extension to an algebraic closure.

Locator: §§2–4 foundational algebra, cohomology and torus inputs.

Pinned declarations: `tauceti:TauCeti.torusCommHopfAlgProperty`, `tauceti:TauCeti.torusCommHopfAlgProperty_iff`.

API:

- `LiuZhu17.L07.fromSplitting` (constructor): A geometric split-torus isomorphism proves the predicate.
- `LiuZhu17.L07.geometricFiber` (compatibility): The geometric fiber has the specified finite rank.
- `LiuZhu17.L07.iso` (functoriality): Transport the torus predicate along an isomorphism.

Acceptance specifications (not Lean compiled):

- `LiuZhu17.L07.test1` (compatibility): G_m is rank one.
- `LiuZhu17.L07.test2` (compatibility): A norm-one quadratic torus need not be split.
- `LiuZhu17.L07.test3` (compatibility): G_a is not a torus.

Use in §§2–4: Underlying Witt, finite-projective, derived, Galois, scheme or torus carrier; none supplies the analytic period-sheaf or rigidity theorem.

Review/coverage note: Only the cited pinned declarations are existing implementation evidence. The downstream API and tests specify requested reuse or adapters; they do not claim uninspected wrappers are built.

### L08 — Geometric character lattice

definition; library. Use the additive group of group-like elements of the geometrically extended coordinate Hopf algebra, with its absolute Galois action. For a torus this is X*(T).

Locator: §§2–4 foundational algebra, cohomology and torus inputs.

Pinned declarations: `tauceti:TauCeti.CommHopfAlgCat.additiveCharacterGroup`, `tauceti:TauCeti.CommHopfAlgCat.geometricCharacterGroup`.

API:

- `LiuZhu17.L08.galoisAction` (projection): Expose the action inherited from geometric scalar extension.
- `LiuZhu17.L08.charactersAsMaps` (compatibility): Identify a character with a group-scheme map to G_m.
- `LiuZhu17.L08.addCharacters` (simp): Addition of characters corresponds to multiplication of their values.

Acceptance specifications (not Lean compiled):

- `LiuZhu17.L08.test1` (compatibility): X*(G_m) is Z.
- `LiuZhu17.L08.test2` (compatibility): Conjugation acts by minus one on a real norm-one torus.
- `LiuZhu17.L08.test3` (compatibility): The trivial torus has zero character group.

Use in §§2–4: Underlying Witt, finite-projective, derived, Galois, scheme or torus carrier; none supplies the analytic period-sheaf or rigidity theorem.

Review/coverage note: Only the cited pinned declarations are existing implementation evidence. The downstream API and tests specify requested reuse or adapters; they do not claim uninspected wrappers are built.

### L09 — Cocharacter lattice and pairing

definition; library. For a torus use geometric group-scheme morphisms G_m to T, their integral-dual comparison to X*(T), and the evaluation pairing. Its Galois action is contragredient.

Locator: §§2–4 foundational algebra, cohomology and torus inputs.

Pinned declarations: `tauceti:TauCeti.MultiplicativeTypeCommHopfAlgCat.cocharacterLattice`, `tauceti:TauCeti.MultiplicativeTypeCommHopfAlgCat.cocharacterLatticeLinearEquivDual`, `tauceti:TauCeti.MultiplicativeTypeCommHopfAlgCat.characterCocharacterPairing`.

API:

- `LiuZhu17.L09.dual` (equivalence): Use the integral-dual linear equivalence.
- `LiuZhu17.L09.pairing` (projection): Evaluate a character on a cocharacter as an integer exponent.
- `LiuZhu17.L09.galois` (compatibility): The dual action evaluates against the inverse Galois action on characters.

Acceptance specifications (not Lean compiled):

- `LiuZhu17.L09.test1` (compatibility): For G_m, exponents a and b pair to ab.
- `LiuZhu17.L09.test2` (compatibility): The zero cocharacter pairs to zero.
- `LiuZhu17.L09.test3` (compatibility): Simultaneous sign reversal on a norm-one torus preserves the pairing.

Use in §§2–4: Underlying Witt, finite-projective, derived, Galois, scheme or torus carrier; none supplies the analytic period-sheaf or rigidity theorem.

Review/coverage note: Only the cited pinned declarations are existing implementation evidence. The downstream API and tests specify requested reuse or adapters; they do not claim uninspected wrappers are built.

### L20 — Absolute Galois group

definition; library. For a field F, Gamma is Aut_F(Fsep) with its Krull topology; it is topologically isomorphic to the algebraic-closure version.

Locator: §§2–4 foundational algebra, cohomology and torus inputs.

Pinned declarations: `tauceti:TauCeti.AbsoluteGaloisGroup`, `tauceti:TauCeti.absoluteGaloisGroupRestrictEquiv`.

API:

- `LiuZhu17.L20.construct` (constructor): Form the separable-closure automorphism group.
- `LiuZhu17.L20.characterise` (characterisation): Identify its topology with the Krull topology.
- `LiuZhu17.L20.transport` (functoriality): Restrict algebraic-closure automorphisms through the topological group equivalence.

Acceptance specifications (not Lean compiled):

- `LiuZhu17.L20.test1` (computation): Gamma_R has two elements.
- `LiuZhu17.L20.test2` (degenerate): Gamma_C is trivial.
- `LiuZhu17.L20.test3` (non-example): The abstract discrete topology on an infinite absolute Galois group is not substituted.

Use in §§2–4: Underlying Witt, finite-projective, derived, Galois, scheme or torus carrier; none supplies the analytic period-sheaf or rigidity theorem.

Review/coverage note: Only the stated pinned carrier or theorem is credited. Additional specialized API and tests are planning contracts, not certified implementations.

### L23 — Continuous cohomology carrier

definition; library. For a continuous topological representation A of a topological group, continuousCohomology is the homology of its homogeneous continuous cochains. This credits the carrier, not inverse-limit or finite-quotient comparison theorems.

Locator: §§2–4 foundational algebra, cohomology and torus inputs.

Pinned declarations: `mathlib:TopRep.homogeneousCochains`, `mathlib:continuousCohomology`.

API:

- `LiuZhu17.L23.construct` (constructor): Construct homogeneous continuous cochains.
- `LiuZhu17.L23.characterise` (characterisation): Identify the cohomology object with homology of that complex.
- `LiuZhu17.L23.transport` (functoriality): Induce maps from continuous equivariant coefficient homomorphisms.

Acceptance specifications (not Lean compiled):

- `LiuZhu17.L23.test1` (computation): Trivial finite group cochains recover the expected degree-zero invariants.
- `LiuZhu17.L23.test2` (degenerate): Zero coefficients have zero cohomology.
- `LiuZhu17.L23.test3` (non-example): The cohomology of an inverse limit is not identified with a limit without a comparison theorem.

Use in §§2–4: Underlying Witt, finite-projective, derived, Galois, scheme or torus carrier; none supplies the analytic period-sheaf or rigidity theorem.

Review/coverage note: Only the stated pinned carrier or theorem is credited. Additional specialized API and tests are planning contracts, not certified implementations.

### L01 — Witt-vector coefficient carrier

definition; library. The pinned p-typical Witt-vector carrier is defined for a commutative coefficient ring. Perfect characteristic-p hypotheses are imposed separately for p-torsionfreeness and the geometry used here.

Locator: §§2–4 foundational algebra, cohomology and torus inputs.

Pinned declarations: `mathlib:WittVector`.

API:

- `LiuZhu17.L01.ofCoefficients` (constructor): Reuse WittVector.mk on a coefficient sequence.
- `LiuZhu17.L01.ext` (extensionality): Equality follows from equality of every coefficient.
- `LiuZhu17.L01.fractionField` (compatibility): The map to L preserves the existing ring operations.

Acceptance specifications (not Lean compiled):

- `LiuZhu17.L01.test1` (compatibility): Equal coefficient sequences give equal vectors.
- `LiuZhu17.L01.test2` (compatibility): Over F_p the fraction field specializes to Q_p after the standard comparison.
- `LiuZhu17.L01.test3` (compatibility): Witt addition in positive coordinates is not coordinatewise addition in general.

Use in §§2–4: Underlying Witt, finite-projective, derived, Galois, scheme or torus carrier; none supplies the analytic period-sheaf or rigidity theorem.

Review/coverage note: Only the cited pinned declarations are existing implementation evidence. The downstream API and tests specify requested reuse or adapters; they do not claim uninspected wrappers are built.

### L36 — Ordinary unbounded derived category

construction; library. For an abelian category C with a chosen localization, DerivedCategory C is the category of integer cochain complexes localized at quasi-isomorphisms.

Locator: §§2–4 foundational algebra, cohomology and torus inputs.

Pinned declarations: `mathlib:DerivedCategory`.

API:

- `LiuZhu17.L36.construct` (constructor): Choose HasDerivedCategory.standard in the required universe.
- `LiuZhu17.L36.characterise` (characterisation): Q sends quasi-isomorphisms to isomorphisms.
- `LiuZhu17.L36.transport` (functoriality): Compare enhanced derived functors to this ordinary localization.

Acceptance specifications (not Lean compiled):

- `LiuZhu17.L36.test1` (computation): An acyclic complex maps to zero.
- `LiuZhu17.L36.test2` (degenerate): The zero abelian category has a zero derived category.
- `LiuZhu17.L36.test3` (non-example): Its ordinary categorical nerve does not supply the stable enhancement.

Use in §§2–4: Underlying Witt, finite-projective, derived, Galois, scheme or torus carrier; none supplies the analytic period-sheaf or rigidity theorem.

Review/coverage note: Only the stated carrier or theorem is credited to the pinned library. Additional API/test specifications are not claims of existing formalization.

### L37 — Tor bifunctor

construction; library. In an abelian monoidal preadditive category with projective resolutions, Tor C n left-derives tensoring in the second factor; higher Tor vanishes for projective second argument.

Locator: §§2–4 foundational algebra, cohomology and torus inputs.

Pinned declarations: `mathlib:CategoryTheory.Tor`, `mathlib:CategoryTheory.isZero_Tor_succ_of_projective`.

API:

- `LiuZhu17.L37.construct` (constructor): Apply the left-derived tensor functor in degree n.
- `LiuZhu17.L37.characterise` (characterisation): For projective Y, Tor_(n+1)(X,Y)=0.
- `LiuZhu17.L37.transport` (functoriality): Use its bifunctorial maps on both arguments.

Acceptance specifications (not Lean compiled):

- `LiuZhu17.L37.test1` (computation): Tor_1(R,R)=0.
- `LiuZhu17.L37.test2` (degenerate): Tensor with the zero object gives zero.
- `LiuZhu17.L37.test3` (non-example): The existing Tor functor alone does not prove Tor vanishing for perfect-ring diagrams.

Use in §§2–4: Underlying Witt, finite-projective, derived, Galois, scheme or torus carrier; none supplies the analytic period-sheaf or rigidity theorem.

Review/coverage note: Only the stated carrier or theorem is credited to the pinned library. Additional API/test specifications are not claims of existing formalization.

### L40 — Finite projective splitting

theorem; library. For a finite projective module over a semiring there are maps R^n→M→R^n with surjective first map, injective second map and composite id_M.

Locator: §§2–4 foundational algebra, cohomology and torus inputs.

Pinned declarations: `mathlib:Module.Finite.exists_comp_eq_id_of_projective`.

Proof route:

- Use the pinned finite-generator surjection and projective lifting property.

Review/coverage note: Only the stated carrier or theorem is credited to the pinned library. Additional API/test specifications are not claims of existing formalization.

### L42 — Scheme carrier

construction; library. A scheme is a locally ringed space locally isomorphic to Spec of a commutative ring; morphisms are locally ringed-space morphisms.

Locator: §§2–4 foundational algebra, cohomology and torus inputs.

Pinned declarations: `mathlib:AlgebraicGeometry.Scheme`.

API:

- `LiuZhu17.L42.construct` (constructor): Reuse Scheme and Scheme.Hom.
- `LiuZhu17.L42.characterise` (characterisation): Affine neighborhoods identify the structure sheaf.
- `LiuZhu17.L42.transport` (functoriality): Use existing fibre products and morphism properties.

Acceptance specifications (not Lean compiled):

- `LiuZhu17.L42.test1` (computation): Spec F_p is a scheme.
- `LiuZhu17.L42.test2` (degenerate): The empty scheme is allowed.
- `LiuZhu17.L42.test3` (non-example): A sheaf-valued lattice functor is not a scheme without representability.

Use in §§2–4: Underlying Witt, finite-projective, derived, Galois, scheme or torus carrier; none supplies the analytic period-sheaf or rigidity theorem.

Review/coverage note: Only the stated carrier or theorem is credited to the pinned library. Additional API/test specifications are not claims of existing formalization.

### L50 — Binomial polynomial basis

definition; library. For every nontrivial Q-algebra K, the polynomials binom(V,n) form a K-basis of K[V].

Locator: Lemma2.10 proof.

Pinned declarations: `tauceti:TauCeti.binomialPolynomialBasis`, `tauceti:TauCeti.binomialPolynomialBasis_apply`.

API:

- `LiuZhu17.L50.construct` (constructor): Construct the basis n↦Ring.choose V n.
- `LiuZhu17.L50.characterise` (characterisation): Identify the nth basis vector with V(V−1)…(V−n+1)/n!.
- `LiuZhu17.L50.transport` (functoriality): Extend coefficient scalars between nontrivial Q-algebras, preserving each basis vector.

Acceptance specifications (not Lean compiled):

- `LiuZhu17.L50.test1` (computation): binom(V,2)=(V²−V)/2.
- `LiuZhu17.L50.test2` (degenerate): binom(V,0)=1.
- `LiuZhu17.L50.test3` (non-example): Monomials V^n are not this basis: translation of binom(V,2) has difference V.

Use in T13: The finite-difference recurrence and its corrected primitive use these coordinates.

Review/coverage note: Only the precise pinned carrier or theorem is credited. Specialized API/tests remain acceptance contracts, not certified implementations.

### L51 — Nilpotent exponential

definition; library. In a Q-algebra A, a nilpotent element has the finite exponential sum exp(a)=Σ_(i<N) a^i/i! for any N with a^N=0.

Locator: §2.3 logarithmic Higgs construction.

Pinned declarations: `mathlib:IsNilpotent.exp`, `mathlib:IsNilpotent.exp_eq_sum`, `mathlib:IsNilpotent.exp_add_of_commute`.

API:

- `LiuZhu17.L51.construct` (constructor): Construct IsNilpotent.exp on A.
- `LiuZhu17.L51.characterise` (characterisation): For a^N=0 identify exp(a) with the length-N sum.
- `LiuZhu17.L51.transport` (functoriality): For commuting nilpotents a,b identify exp(a+b)=exp(a)exp(b).

Acceptance specifications (not Lean compiled):

- `LiuZhu17.L51.test1` (computation): For E12²=0,exp(E12)=I+E12.
- `LiuZhu17.L51.test2` (degenerate): exp(0)=1.
- `LiuZhu17.L51.test3` (non-example): The finite nilpotent formula is not a convergent exponential theorem for an arbitrary nonnilpotent p-adic matrix.

Use in T07,T12: Convert the unipotent Γ action to the nilpotent Higgs endomorphisms.

Review/coverage note: Only the precise pinned carrier or theorem is credited. Specialized API/tests remain acceptance contracts, not certified implementations.

### L52 — Algebraic Kähler differential carrier

definition; library. For commutative R-algebra S and S-module M with compatible R action, Ω_(S/R)=I/I² represents R-derivations from S to M.

Locator: §§2–3 differential prerequisites.

Pinned declarations: `mathlib:KaehlerDifferential`, `mathlib:KaehlerDifferential.D`, `mathlib:KaehlerDifferential.linearMapEquivDerivation`.

API:

- `LiuZhu17.L52.construct` (constructor): Construct Ω_(S/R) and its universal derivation D.
- `LiuZhu17.L52.characterise` (characterisation): Identify Hom_S(Ω,M) with Der_R(S,M).
- `LiuZhu17.L52.transport` (functoriality): Transport derivations through the representing equivalence.

Acceptance specifications (not Lean compiled):

- `LiuZhu17.L52.test1` (computation): D(T²)=2T dT in R[T].
- `LiuZhu17.L52.test2` (degenerate): D(1)=0.
- `LiuZhu17.L52.test3` (non-example): Algebraic Ω of an affinoid algebra is not automatically the finite completed analytic differential module.

Use in P05,H01: Analytic differential completion and connection carriers reuse this algebra.

Review/coverage note: Only the precise pinned carrier or theorem is credited. Specialized API/tests remain acceptance contracts, not certified implementations.

### L53 — Underlying de Rham period ring plus

definition; library. For a commutative p-adically complete ring R with p prime and nonunit, use Mathlib BDeRhamPlus R p: the kernel-of-Fontaine-theta completion of W(PreTilt R)[1/p]. Only this underlying ring is credited.

Locator: §3.1 absolute period-ring input.

Pinned declarations: `mathlib:BDeRhamPlus`.

Prerequisites: L01.

API:

- `LiuZhu17.L53.construct` (constructor): Construct BDeRhamPlus from the p-inverted theta kernel.
- `LiuZhu17.L53.characterise` (characterisation): Identify the ring with the stated adic completion.
- `LiuZhu17.L53.transport` (functoriality): Use the completion map from W(PreTilt R)[1/p].

Acceptance specifications (not Lean compiled):

- `LiuZhu17.L53.test1` (computation): For R=O_Cp the input is the usual absolute period-ring construction.
- `LiuZhu17.L53.test2` (degenerate): For p=0 in R its p-inverted construction is the zero ring.
- `LiuZhu17.L53.test3` (non-example): A bare BDeRhamPlus carrier does not supply the DVR theorem or Galois-filtered comparison.

Use in P01,R01: Complete the arithmetic period structure in the existing PH owner.

Review/coverage note: Only the precise pinned carrier or theorem is credited. Specialized API/tests remain acceptance contracts, not certified implementations.

### L54 — Underlying de Rham period localization

definition; library. For the same R,p, Mathlib BDeRham localizes BDeRhamPlus at the multiplicative closure of images of all generators of the theta kernel. Identifying it with inversion of t needs the separate principal-kernel theorem.

Locator: §3.1.

Pinned declarations: `mathlib:BDeRham`.

Prerequisites: L53.

API:

- `LiuZhu17.L54.construct` (constructor): Construct the declared generator localization.
- `LiuZhu17.L54.characterise` (characterisation): Use its localization universal property.
- `LiuZhu17.L54.transport` (functoriality): Compare with inversion of a chosen generator once principality and the comparison are proved.

Acceptance specifications (not Lean compiled):

- `LiuZhu17.L54.test1` (computation): For a principal kernel generated by ξ the multiplicative set includes the image of ξ.
- `LiuZhu17.L54.test2` (degenerate): The p=0 case remains the zero ring.
- `LiuZhu17.L54.test3` (non-example): No chosen t or discrete valuation is part of this carrier alone.

Use in P01,R01: Retain existing algebra before adding topology, filtration and Galois action.

Review/coverage note: Only the precise pinned carrier or theorem is credited. Specialized API/tests remain acceptance contracts, not certified implementations.

### P01 — Filtered Galois period rings

definition; planned. For k/Qp finite and K the completion of a Galois extension containing k∞, equip BdR+(K) and BdR(K) with their topology, filtration, semilinear Gal(K/k) action, t and gr^j=K(j); construct canonical embeddings of each finite k′⊂K. Do not assume a canonical K→BdR+ section.

Locator: §1 notations and §3.1.

Existing layers: `PadicHodgeTheory:R06.1`.

Prerequisites: L53, L54.

API:

- `LiuZhu17.P01.construct` (constructor): Construct the filtered Galois ring and finite-subfield maps.
- `LiuZhu17.P01.characterise` (characterisation): Identify the residue and all graded pieces with their Tate twists.
- `LiuZhu17.P01.transport` (functoriality): Prove compatibility of finite-subfield embeddings and Galois transport.

Acceptance specifications (not Lean compiled):

- `LiuZhu17.P01.test1` (computation): gr^1=tBdR+/t²=K(1).
- `LiuZhu17.P01.test2` (degenerate): gr^0=K.
- `LiuZhu17.P01.test3` (non-example): The residue quotient K is not canonically a coefficient subfield of BdR+.

Use in R01,R08: Define the ringed base and period coefficients.

Open proof/declaration closure: this is an extraction contract, not an implemented or recursively closed blueprint.

### P02 — De Rham and geometric representations

definition; planned. For a finite-dimensional continuous Qp representation V of G_k, DdR(V)=(V⊗BdR)^Gk and V is de Rham when dim_k DdR(V)=dim_Qp V. For a number field E, geometric means unramified at all but finitely many finite places and de Rham at every place above p.

Locator: §1 introduction and Theorem1.1.

Existing layers: `PadicHodgeTheory:R06.2`.

Prerequisites: P01, L20.

API:

- `LiuZhu17.P02.construct` (constructor): Construct DdR and its comparison morphism.
- `LiuZhu17.P02.characterise` (characterisation): Characterize admissibility by the full-rank comparison isomorphism.
- `LiuZhu17.P02.transport` (functoriality): Prove de Rham finite-extension descent and tensor/dual compatibility in the admissible category.

Acceptance specifications (not Lean compiled):

- `LiuZhu17.P02.test1` (computation): Qp(1) is de Rham, with filtration and HT(χp)=+1 translated consistently.
- `LiuZhu17.P02.test2` (degenerate): The zero representation is de Rham.
- `LiuZhu17.P02.test3` (non-example): Unramified outside finitely many places alone is not the definition of geometric.

Use in A15,G06: Stalk predicates and finite-extension descent.

Open proof/declaration closure: this is an extraction contract, not an implemented or recursively closed blueprint.

### P03 — Analytic local systems and completed coefficients

definition; missing. On a rigid analytic X/k use locally constant finite free Z/p^n sheaves with compatible Zp lattices and their rational Qp local systems; pass to associated completed sheaves hatL on the proétale site. Keep the p-adic coefficient topology.

Locator: §§2.1,2.2.

Prerequisites: L23.

API:

- `LiuZhu17.P03.construct` (constructor): Construct lattice reduction, inverse-limit completed sheaf and rationalization.
- `LiuZhu17.P03.characterise` (characterisation): Identify a geometric stalk with its continuous representation.
- `LiuZhu17.P03.transport` (functoriality): Construct pullback and tensor/dual maps, preserving coefficient completion.

Acceptance specifications (not Lean compiled):

- `LiuZhu17.P03.test1` (computation): The constant rank-one lattice gives hatZp.
- `LiuZhu17.P03.test2` (degenerate): The zero local system remains zero.
- `LiuZhu17.P03.test3` (non-example): A discrete Qp sheaf is not substituted for its completed continuous proétale coefficient sheaf.

Use in T01,R08: The source of H and RH.

Open proof/declaration closure: this is an extraction contract, not an implemented or recursively closed blueprint.

### P04 — Corrected analytic proétale site

definition; planned. For locally noetherian analytic X, use Scholze proétale objects and the corrigendum covering condition: transfinite successive pullbacks of finite étale surjections, with limit-stage surjectivity. Construct ν:X_proet→X_et and base-change ν′ over K.

Locator: §2.1; Scholze corrigendum(1)–(2).

Existing layers: `AdicEtaleGeometry:A1`.

API:

- `LiuZhu17.P04.construct` (constructor): Construct the site, covering pullbacks and ν.
- `LiuZhu17.P04.characterise` (characterisation): Identify countable toric covers as permitted covers.
- `LiuZhu17.P04.transport` (functoriality): Construct morphisms of sites and restriction to slices.

Acceptance specifications (not Lean compiled):

- `LiuZhu17.P04.test1` (computation): A countable p-power toric tower is a permitted proétale cover.
- `LiuZhu17.P04.test2` (degenerate): The identity is a cover.
- `LiuZhu17.P04.test3` (non-example): An arbitrary open continuous surjection of profinite sets need not split; deleted point classifications are not used.

Use in P03,T01,R08: Shared topology for period sheaves and Cartan–Leray.

Open proof/declaration closure: this is an extraction contract, not an implemented or recursively closed blueprint.

### P05 — Analytic toric charts and differentials

definition; planned. For smooth rigid X/k, construct local standard étale charts to the rigid torus, finite locally free analytic Ω_X and its exterior powers; on the n-torus Ω¹ has basis dlog(T_i).

Locator: §1 notations and conventions; §2.3 toric-chart setup.

Existing layers: `AdicSpacesPartII:R0`.

Prerequisites: L52.

API:

- `LiuZhu17.P05.construct` (constructor): Construct continuous analytic differentials and standard étale chart pullback.
- `LiuZhu17.P05.characterise` (characterisation): Identify Ω¹ on a torus with the free module on dlog(T_i).
- `LiuZhu17.P05.transport` (functoriality): Prove étale pullback and the smooth relative differential exact sequence.

Acceptance specifications (not Lean compiled):

- `LiuZhu17.P05.test1` (computation): dlog(T²)=2dlog(T).
- `LiuZhu17.P05.test2` (degenerate): The zero-dimensional torus has Ω¹=0.
- `LiuZhu17.P05.test3` (non-example): The naive algebraic differential module without completion is not asserted to be the analytic Ω¹.

Use in T02,H01,R07: Coordinates and integrability.

Review/coverage note: R0 owns smooth charts; its analytic differential adapter is coordinated with A2, which imports the geometry. R4 is only an early-site reexport.

Open proof/declaration closure: this is an extraction contract, not an implemented or recursively closed blueprint.

### P06 — Affinoid coherence and Tate acyclicity

theorem; planned. For an affinoid rigid space over a complete nonarchimedean field, coherent sheaves correspond to finite modules, vector bundles to finite projective modules, and coherent higher cohomology vanishes; use actual completed restriction maps.

Locator: Proposition2.3; Corollary2.6; Proposition3.3.

Existing layers: `AdicSpacesPartII:R3`.

Prerequisites: L40.

Proof route:

- Kiehl coherence and Tate acyclicity, with rational and finite étale descent. The nonnoetherian perfectoid version is a distinct P07 input.

Open proof/declaration closure: this is an extraction contract, not an implemented or recursively closed blueprint.

### P07 — Affinoid-perfectoid vector-bundle descent and acyclicity

theorem; missing. For affinoid perfectoid U in X_proet and finite locally free hatO_X-module M, H^q(X_proet/U,M)=0 for q>0. Its evaluation descends to a finite projective module on the associated affinoid perfectoid space.

Locator: Proposition2.3; KL1 Theorem9.2.15 and Theorem2.6.5(a).

Prerequisites: P04, P06, L40.

Proof route:

- Descend M to the associated perfectoid space; use its rational finite-projective sheaf theorem and acyclicity, then the Čech-to-derived spectral sequence. The full KL1 proof remains a supplier gap.

Open proof/declaration closure: this is an extraction contract, not an implemented or recursively closed blueprint.

### P08 — Structural de Rham period sheaves

definition; planned. Construct O_BdR+ on X_proet by sheafifying the finite-level colimit of kerθ-completions of (O_X+(U_j) p-completed-tensor Ainf(U))[1/p]. Theta lands in the completed ring on U. Construct O_BdR, filtration and integrable connection.

Locator: §2.1; p14; Scholze corrigendum(3).

Existing layers: `PadicHodgeTheory:P8:local-rational`.

Prerequisites: P01, P04, P05.

API:

- `LiuZhu17.P08.construct` (constructor): Construct the corrected sheaf and structural theta maps.
- `LiuZhu17.P08.characterise` (characterisation): Identify its local completed toric power-series description.
- `LiuZhu17.P08.transport` (functoriality): Prove filtered pullback and connection compatibility.

Acceptance specifications (not Lean compiled):

- `LiuZhu17.P08.test1` (computation): A toric chart gives BdR+(U)[[X_1,…,X_n]] after kernel completion.
- `LiuZhu17.P08.test2` (degenerate): A point has the absolute structural period sheaf.
- `LiuZhu17.P08.test3` (non-example): O_X+(U_j)⊗Ainf(U) without p-completion is the deleted construction.

Use in P09,R08: The single structural period-sheaf owner.

Open proof/declaration closure: this is an extraction contract, not an implemented or recursively closed blueprint.

### P09 — Higgs period sheaf

definition; missing. Define OC=gr^0 O_BdR with gr^j O_BdR=OC(j) and gr∇:OC→OC⊗Ω¹_X(-1). The Higgs field is O_X-linear and square-zero in exterior degree two.

Locator: §2.1.

Prerequisites: P08.

API:

- `LiuZhu17.P09.construct` (constructor): Construct OC and its graded Higgs map.
- `LiuZhu17.P09.characterise` (characterisation): Identify every graded piece with the Tate twist of OC.
- `LiuZhu17.P09.transport` (functoriality): Transport OC under smooth-space morphisms using the graded period map.

Acceptance specifications (not Lean compiled):

- `LiuZhu17.P09.test1` (computation): On a toric tower gr∇V_i=−t^-1 dlog(T_i).
- `LiuZhu17.P09.test2` (degenerate): On a point the Higgs map is zero.
- `LiuZhu17.P09.test3` (non-example): Forgetting the (-1) twist changes the Galois-equivariance contract.

Use in T01,T13: Coefficient sheaf of Simpson.

Open proof/declaration closure: this is an extraction contract, not an implemented or recursively closed blueprint.

### P10 — Faltings extension and affine polynomial algebra

definition; missing. Use 0→hatO_X→E→hatO_X⊗Ω¹_X(-1)→0 from the first structural period filtration. Identify OC with Sym(E)/(1_alg−1_E), equivalently colim_n Sym^n(E) with transitions multiplication by the distinguished section.

Locator: §2.1 formula(2.3).

Prerequisites: P09.

API:

- `LiuZhu17.P10.construct` (constructor): Construct the extension and its distinguished unit section.
- `LiuZhu17.P10.characterise` (characterisation): Prove the affine symmetric-algebra presentation of OC.
- `LiuZhu17.P10.transport` (functoriality): Identify changes of local splitting with polynomial translations.

Acceptance specifications (not Lean compiled):

- `LiuZhu17.P10.test1` (computation): For a split rank-one extension, quotienting by 1_alg−e_0 gives hatO[V].
- `LiuZhu17.P10.test2` (degenerate): If Ω¹=0 then OC=hatO.
- `LiuZhu17.P10.test3` (non-example): Quotienting by e_0=0 yields a different algebra and loses the affine unit.

Use in P11,T03: Reduce period cohomology to finite locally free symmetric powers.

Open proof/declaration closure: this is an extraction contract, not an implemented or recursively closed blueprint.

### P11 — Period interval acyclicity

theorem; missing. For affinoid perfectoid U and a Qp local system L, H^q(U,hatL⊗O_BdR^[a,b])=0 for q>0 for all finite or infinite intervals allowed by the separated complete filtration; graded OC coefficients are included.

Locator: Corollary2.4.

Prerequisites: P07, P10, P12.

Proof route:

- Finite symmetric powers and filtered colimits on a coherent slice give OC acyclicity; finite filtration induction gives bounded intervals; use the source Mittag–Leffler/derived-limit theorem for infinite ends, not naive limit exactness.

Open proof/declaration closure: this is an extraction contract, not an implemented or recursively closed blueprint.

### P12 — Cohomological colimits and derived limits

theorem; missing. On the coherent proétale slices used here, filtered colimits commute with the specified cohomology functors; for the surjective period-quotient towers, the applicable derived-limit statement controls lim¹ and gives the unbounded-interval comparison.

Locator: Corollary2.4; Scholze Lemma3.18.

Prerequisites: L36, P04.

Proof route:

- Record coherence locally on the slice, and prove the exact Mittag–Leffler hypotheses. No global quasi-compactness of arbitrary X is silently added.

Review/coverage note: The exact coherent-slice filtered-colimit and period-tower comparison is not stated by E2 alone. E1/E2 are appropriate general owners for this missing source theorem; local coherent slices, not global quasi-compactness of arbitrary X, must be used.

Open proof/declaration closure: this is an extraction contract, not an implemented or recursively closed blueprint.

### P13 — Finite-descent étale basis

definition; missing. Let B consist of standard étale Y→X_k′ for finite k′⊂K, with toric charts after finite enlargement; regard them over K. Morphisms descend to some finite common k′.

Locator: Lemma2.5.

Prerequisites: P04, P05.

API:

- `LiuZhu17.P13.construct` (constructor): Construct objects and finite-level morphisms of B.
- `LiuZhu17.P13.characterise` (characterisation): Prove B is a full covering basis for (X_K)_et.
- `LiuZhu17.P13.transport` (functoriality): Compare sheaves on B with the entire étale topos.

Acceptance specifications (not Lean compiled):

- `LiuZhu17.P13.test1` (computation): A rational subdomain defined over k lies in B after choosing a toric chart.
- `LiuZhu17.P13.test2` (degenerate): X=Spa(k) permits finite étale k′-objects.
- `LiuZhu17.P13.test3` (non-example): A finite-level descent field need not be the original k.

Use in P14,T01,R01: Define sheaves from affinoid finite-level formulas.

Open proof/declaration closure: this is an extraction contract, not an implemented or recursively closed blueprint.

### P14 — Finite descent of étale morphisms

theorem; missing. The base-change functor defining P13 is full and its image covers (X_K)_et. Roots descend after a finite extension using finite Shilov boundary, Krasner approximation and Ax–Sen–Tate invariants B_K^Gal(K/k′)=B_k′.

Locator: Lemma2.5 proof.

Prerequisites: P13.

Proof route:

- Split standard étale maps into rational localizations and finite étale root data. Approximate the finitely many roots and coefficients uniformly on the Shilov boundary, enlarge k′, and use reducedness to identify functions from their boundary values. The original rigid analytic suppliers remain open.

Open proof/declaration closure: this is an extraction contract, not an implemented or recursively closed blueprint.

### P15 — Finite-projective étale gluing

theorem; missing. A compatible assignment Y↦M(Y) of finite projective B_K modules on the basis P13, with scalar-extension isomorphisms for standard étale maps and cocycle compatibility, defines a vector bundle on X_K.

Locator: Corollary2.6.

Prerequisites: P06, P13.

Proof route:

- Apply Tate/Kiehl rational descent and faithfully flat finite étale descent; prove compatibility on overlaps.

Open proof/declaration closure: this is an extraction contract, not an implemented or recursively closed blueprint.

### P16 — Koszul complexes of commuting endomorphisms

definition; planned. For a module M and a finite family of pairwise commuting linear endomorphisms D_i, form the cochain Koszul complex with degree-j direct sums indexed by j-subsets and alternating differential. Ring-element Koszul complexes are special cases.

Locator: §2.3 and Lemma2.10 applications.

Existing layers: `DerivedDeRhamCohomology:DD.1`.

API:

- `LiuZhu17.P16.construct` (constructor): Construct the complex from commuting endomorphisms.
- `LiuZhu17.P16.characterise` (characterisation): Prove d²=0 with the declared alternating signs.
- `LiuZhu17.P16.transport` (functoriality): Construct scalar extension, permutations and comparison with ring-element Koszul complexes.

Acceptance specifications (not Lean compiled):

- `LiuZhu17.P16.test1` (computation): For D1,D2, d0(m)=(D1m,D2m) and d1(a,b)=D1b−D2a.
- `LiuZhu17.P16.test2` (degenerate): The empty family gives M in degree0.
- `LiuZhu17.P16.test3` (non-example): Noncommuting endomorphisms give d1d0=[D1,D2], which need not vanish.

Use in T11,T13: Shared algebraic complex; continuous cohomology comparison is separately cohomology-owned.

Open proof/declaration closure: this is an extraction contract, not an implemented or recursively closed blueprint.

### P17 — Continuous Cartan–Leray and procyclic cochains

theorem; missing. For the affinoid-perfectoid torsors and continuous Qp-Banach coefficients in this paper, identify proétale cohomology with continuous Γ-cohomology. For a suitable torsion-free procyclic Γ generated by γ, compute by [M→M], γ−1, in degrees0,1. Finite rational descent is exact, including p=2.

Locator: Lemma2.7; §§2.3,3.2.

Prerequisites: L23, P07, P16.

Proof route:

- Construct continuous cochains from torsor fiber products and use acyclicity; prove the topological procyclic resolution/comparison. Do not apply the integral odd-p torsion-averaging shortcut at p=2.

Review/coverage note: R02.1/2 do not state this Banach-coefficient Cartan–Leray/procyclic package. Split site descent, general continuous cochains and analytic comparison; keep the existing canonical cohomology carrier.

Open proof/declaration closure: this is an extraction contract, not an implemented or recursively closed blueprint.

### P18 — Coherent connections are locally free

theorem; missing. A coherent module with integrable connection on a smooth rigid analytic variety over a characteristic-zero field is locally free.

Locator: Theorem3.9 proof; Kedlaya Ke1 §1.2.

Prerequisites: P05, H01.

Proof route:

- Use the connection-stability of Fitting ideals and smooth characteristic-zero differential algebra, with the analytic coherent comparison. Smoothness and characteristic zero are essential; the original cited statement remains to be recursively split.

Open proof/declaration closure: this is an extraction contract, not an implemented or recursively closed blueprint.

### H01 — Integrable connections on ringed differential sites

definition; missing. Given a ringed site with a differential graded algebra Ω• and derivation d, a connection on finite locally free E is additive and satisfies ∇(ae)=a∇e+e⊗da; its extension to forms squares to zero when integrable. This general carrier precedes the quasi-nilpotent crystalline specialization.

Locator: Definition3.6; generic prerequisite.

Prerequisites: L52.

API:

- `LiuZhu17.H01.construct` (constructor): Construct a connection from a Leibniz map and curvature-zero proof.
- `LiuZhu17.H01.characterise` (characterisation): Identify integrability with vanishing of the curvature map.
- `LiuZhu17.H01.transport` (functoriality): Construct pullback, tensor and dual connections with their signs.

Acceptance specifications (not Lean compiled):

- `LiuZhu17.H01.test1` (computation): On O² over Q[x,y], noncommuting constant connection matrices have nonzero curvature.
- `LiuZhu17.H01.test2` (degenerate): The structure module carries d and has zero curvature.
- `LiuZhu17.H01.test3` (non-example): An arbitrary integrable characteristic-zero connection is not automatically a quasi-nilpotent crystal.

Use in H02,R07,A01: Reuse the generic carrier requested by CR.1 and HodgeStructuresPartII.

Open proof/declaration closure: this is an extraction contract, not an implemented or recursively closed blueprint.

### H02 — Twisted nilpotent Higgs bundles

definition; missing. For a locally free Ω¹ and invertible twist T on a ringed site, a Higgs bundle is finite locally free E with O-linear θ:E→E⊗Ω¹⊗T and θ∧θ=0. Nilpotent means a finite filtration whose graded Higgs fields vanish, equivalently the locally commuting action is nilpotent in the finite-rank setting used here.

Locator: Theorem2.1; §2.3 logarithmic Higgs construction.

Prerequisites: H01, P16.

API:

- `LiuZhu17.H02.construct` (constructor): Construct a Higgs object with its twist and nilpotence filtration.
- `LiuZhu17.H02.characterise` (characterisation): Identify integrability with commuting coordinate operators.
- `LiuZhu17.H02.transport` (functoriality): Construct tensor, dual and pullback, transporting twists.

Acceptance specifications (not Lean compiled):

- `LiuZhu17.H02.test1` (computation): E=O² with θ=E12 dlogT is nonzero nilpotent.
- `LiuZhu17.H02.test2` (degenerate): Over a smooth reduced characteristic-zero base, a rank-one nilpotent Higgs field is zero.
- `LiuZhu17.H02.test3` (non-example): The scalar field θ=dlogT on a line is integrable but not nilpotent.

Use in T01,T12: General Higgs algebra shared with complex and Cartier-flow consumers.

Open proof/declaration closure: this is an extraction contract, not an implemented or recursively closed blueprint.

### H03 — Filtered and parameter connections

definition; missing. For a central parameter λ with dλ=0, a λ-connection satisfies ∇λ(ae)=a∇λ(e)+λe⊗da. A Griffiths filtration on an ordinary connection satisfies ∇Fil^j⊂Fil^(j−1)⊗Ω¹; associated graded carries the induced Higgs field.

Locator: Definition3.6; Remark3.2.

Prerequisites: H01, H02.

API:

- `LiuZhu17.H03.construct` (constructor): Construct a λ-connection and decreasing Griffiths filtration.
- `LiuZhu17.H03.characterise` (characterisation): Identify the λ=0 fiber as a Higgs object and the λ=1 fiber as a connection.
- `LiuZhu17.H03.transport` (functoriality): For λ invertible recover an ordinary connection by λ^-1∇λ, and construct filtered pullback.

Acceptance specifications (not Lean compiled):

- `LiuZhu17.H03.test1` (computation): t∇ has t-Leibniz rule; dividing by t recovers ∇ after inversion.
- `LiuZhu17.H03.test2` (degenerate): At λ=0 the Leibniz correction is zero.
- `LiuZhu17.H03.test3` (non-example): Keeping t∇ unchanged after inverting t does not satisfy the ordinary Leibniz rule.

Use in R07,R16,A11: Shared filtered/Hodge algebra, independent of complex comparison theorems.

Open proof/declaration closure: this is an extraction contract, not an implemented or recursively closed blueprint.

### T01 — Arithmetic p-adic Simpson functor

definition; missing. For smooth rigid X/k and a Qp local system L, set H(L)=ν′_*(hatL⊗OC) on (X_K)_et with Higgs field induced by gr∇ and semilinear Gal(K/k) action. Theorems below prove it is a rank-preserving nilpotent Higgs bundle.

Locator: Theorem2.1(i); §2.1 definition of H.

Prerequisites: P03, P09, H02.

API:

- `LiuZhu17.T01.construct` (constructor): Construct the pushforward and induced Higgs/Galois maps.
- `LiuZhu17.T01.characterise` (characterisation): Identify sections on a finite-descent affinoid with the invariant formula after T13.
- `LiuZhu17.T01.transport` (functoriality): Construct the functor on local-system morphisms and its composition law.

Acceptance specifications (not Lean compiled):

- `LiuZhu17.T01.test1` (computation): For X=Spa(k), H(V)=(V⊗Cp)^Gal(Cp/K), with zero Higgs field.
- `LiuZhu17.T01.test2` (degenerate): H(0)=0.
- `LiuZhu17.T01.test3` (non-example): Forgetting Galois action at a point loses the representation; H is not asserted fully faithful.

Use in T16,R12: The graded piece of RH and the engine of rigidity.

Open proof/declaration closure: this is an extraction contract, not an implemented or recursively closed blueprint.

### T02 — Arithmetic and geometric toric towers

definition; missing. On a standard étale chart Y over the n-torus, adjoin p^m roots of all torus coordinates and cyclotomic roots; distinguish the relative tower over k from its geometric K-base change. Construct Γgeom≃Zp(1)^n, Γ≃Γgeom⋊Gal(K/k), and the associated affinoid-perfectoid completions.

Locator: §2.3 formulas(2.6)–(2.7).

Prerequisites: P04, P05.

API:

- `LiuZhu17.T02.construct` (constructor): Construct finite levels, transition maps and completed tower rings.
- `LiuZhu17.T02.characterise` (characterisation): Identify the geometric action γ_i(T_j^(1/p^m))=ζ_(p^m)^δij T_j^(1/p^m).
- `LiuZhu17.T02.transport` (functoriality): Prove arithmetic conjugation δγδ^-1=γ^χ(δ) and standard étale base change.

Acceptance specifications (not Lean compiled):

- `LiuZhu17.T02.test1` (computation): For one coordinate, γ multiplies T^(1/p^m) by ζ_(p^m).
- `LiuZhu17.T02.test2` (degenerate): For n=0 the geometric Γ is trivial.
- `LiuZhu17.T02.test3` (non-example): The proétale inverse-system object is not identified by notation with its associated completed adic space.

Use in T03,T05: Input towers for relative decompletion.

Open proof/declaration closure: this is an extraction contract, not an implemented or recursively closed blueprint.

### T03 — Polynomial period coordinates

theorem; missing. On the geometric toric tower, OC=hatO[V_1,…,V_n] with V_i=t^-1 log([T_i^flat]/T_i), γ_s(V_i)=V_i+δsi, and gr∇V_i=−t^-1 dlogT_i.

Locator: §2.3 formula(2.8); Lemma2.11.

Prerequisites: P08, P09, T02.

Proof route:

- Use the corrected structural-period power-series presentation, take the zero graded piece and compute both the Kummer translation and negative connection sign.

Open proof/declaration closure: this is an extraction contract, not an implemented or recursively closed blueprint.

### T04 — Locally decompleting towers and relative period modules

definition; missing. For a weakly decompleting finite étale tower ψ, decompleting means the Frobenius quotient complex in KL2v1 Definition5.6.1 is exact at every sufficiently high level. Locally decompleting also requires stable uniformity and this property after every rational localization. Construct perfect/imperfect Robba-period Γ-modules and Frobenius-linearization isomorphisms, with globally étale subcategories distinguished.

Locator: §2.4; KL2v1 Definitions5.6.1–2,5.7.2.

Prerequisites: T02, P01, L40.

API:

- `LiuZhu17.T04.construct` (constructor): Construct the exactness predicate and the finite-projective semilinear period-module categories.
- `LiuZhu17.T04.characterise` (characterisation): Identify Frobenius structure with an isomorphism φ* M≃M, keeping globally étale lattices separate.
- `LiuZhu17.T04.transport` (functoriality): Construct rational and finite étale base extensions and their comparison maps.

Acceptance specifications (not Lean compiled):

- `LiuZhu17.T04.test1` (computation): A standard geometric toric tower is locally decompleting by the theorem T05.
- `LiuZhu17.T04.test2` (degenerate): The zero module is globally étale.
- `LiuZhu17.T04.test3` (non-example): A general Robba φ-module is not a local system without étaleness.

Use in T05,T06: Original-source interface for Lemma2.14; the internal relative-ring definitions still need finer splitting.

Open proof/declaration closure: this is an extraction contract, not an implemented or recursively closed blueprint.

### T05 — Toric decompletion and étale equivalence

theorem; missing. Geometric toric towers over perfectoid fields and relative toric towers over p-adic fields are locally decompleting. In the KL2v1 hypotheses, the scalar-extension functors between globally étale finite-projective (φ,Γ)-modules over the displayed perfect/imperfect period rings are exact tensor equivalences and identify with the corresponding isogeny local systems.

Locator: KL2v1 Lemmas7.1.7,7.2.7; Theorems5.7.4,7.1.9,7.2.8; §2.4.

Prerequisites: T04.

Proof route:

- Split the Frobenius quotient into fractional-monomial summands; each nontrivial summand has a suitable γ−1 inverse by a norm-small perturbation argument. Relative arithmetic Γ is not normal, so use the appropriate analytic-cohomology theorem. Descend projectors and Γ action; compare globally étale categories. This bundled supplier must be split further before closure.

Open proof/declaration closure: this is an extraction contract, not an implemented or recursively closed blueprint.

### T06 — Strict quotient cochains and theta specialization

theorem; missing. For a sufficiently small interval 0<s≤r/p and m with p^m s≤1≤p^m r, the perfect/imperfect relative-period quotient cochains are strictly exact. Their theta specialization yields the cocartesian squares(2.27), with imperfect image B_m or B_(K,m), and identifies analytic and continuous cohomology in the stated coefficient category.

Locator: Lemma2.14 proof; KL2v1 Corollaries5.6.5,5.6.7, Lemma5.6.6 and Theorem1.3.8.

Prerequisites: T05, P17.

Proof route:

- Use uniform strict norm bounds, Frobenius radius transport, and completed base change along theta; finite étale stability comes from KL2v1 Corollary5.6.7. Do not discard strictness when passing to Banach quotients.

Review/coverage note: Corollary5.6.5 is a scalar quotient statement. The finite-projective module version needs Lemma5.6.6, sufficiently small radii and sufficiently deep Γ_n, with uniform bounds and strict exactness. These are not automatic for arbitrary Banach coefficients.

Open proof/declaration closure: this is an extraction contract, not an implemented or recursively closed blueprint.

### T07 — Finite-level toric descent module

definition; missing. For M=(hatL⊗hatO)(relative tower), choose sufficiently large m and a finite-projective B_m submodule M_m(Y), stable under Γ, whose scalar extension to the completed tower is M. This choice is not unique; larger levels also work.

Locator: Lemma2.14 first assertion.

Prerequisites: T06, P03.

API:

- `LiuZhu17.T07.construct` (constructor): Construct a descent module by theta specialization of the imperfect period module.
- `LiuZhu17.T07.characterise` (characterisation): Prove its completed scalar extension equals M.
- `LiuZhu17.T07.transport` (functoriality): Transport to larger levels and along standard étale maps.

Acceptance specifications (not Lean compiled):

- `LiuZhu17.T07.test1` (computation): For the constant local system choose M_m=B_m.
- `LiuZhu17.T07.test2` (degenerate): The zero system gives the zero module.
- `LiuZhu17.T07.test3` (non-example): M_m is not claimed uniquely characterized at a fixed finite level.

Use in T08,T09: Intermediate finite descent before the canonical unipotent summand.

Open proof/declaration closure: this is an extraction contract, not an implemented or recursively closed blueprint.

### T08 — Toric descent cohomology comparison

theorem; missing. For T07 and every q≥0, H^q_cont(Γgeom,M_m(Y)⊗_(B_km)B_K)→H^q_cont(Γgeom,M(geometric tower)) is an isomorphism, compatibly with standard étale base change.

Locator: Lemma2.14 second and third assertions.

Prerequisites: T07, T06.

Proof route:

- Specialize the strictly exact quotient cochains and use the analytic-to-continuous comparison. Split base-change naturality from mere existence of a descent module in the later design.

Open proof/declaration closure: this is an extraction contract, not an implemented or recursively closed blueprint.

### T09 — Arithmetic quasi-unipotence

theorem; missing. The B_K-linear Γgeom action on M_(K,m)=M_m⊗k_m K is quasi-unipotent. A sufficiently small geometric γ has nilpotent logγ.

Locator: Lemma2.15.

Prerequisites: T07, L51.

Proof route:

- Finite-level descent lets an open arithmetic subgroup fix the coefficients of the matrix of logγ. Conjugation scales it by χ(δ); each positive-degree characteristic coefficient is fixed and multiplied by χ(δ)^j. Choose δ of infinite cyclotomic order to force those coefficients to zero. Cayley–Hamilton gives nilpotence. Retain finite descent; the conclusion does not follow for arbitrary semilinear K-coefficients.

Open proof/declaration closure: this is an extraction contract, not an implemented or recursively closed blueprint.

### T10 — Canonical unipotent toric module

definition; missing. Define M_K(Y) as the generalized trivial-character part after sufficiently high finite-level descent and cancellation of finite Γgeom characters by fractional torus monomials. It is the unique finite-projective B_K submodule of the completed M that is Γ-stable, has unipotent B_K-linear Γgeom action and recovers M after completed tower scalar extension.

Locator: Proposition2.8; proof after Lemma2.15.

Prerequisites: T08, T09.

API:

- `LiuZhu17.T10.construct` (constructor): Construct the trivial generalized-character summand and its inclusion in completed M.
- `LiuZhu17.T10.characterise` (characterisation): Prove the three characterizing properties and uniqueness using toric generalized eigenvectors.
- `LiuZhu17.T10.transport` (functoriality): Prove independence of enlarged finite level and standard étale compatibility.

Acceptance specifications (not Lean compiled):

- `LiuZhu17.T10.test1` (computation): A finite character τ is cancelled by T^(-a/p^m) when τ(γ)=ζ_(p^m)^a.
- `LiuZhu17.T10.test2` (degenerate): For constant L, M_K=B_K.
- `LiuZhu17.T10.test3` (non-example): Using the entire M_(K,m) as a B_K module retains unwanted finite characters and gives the wrong rank.

Use in T11,T12,T13: Canonical local object underlying H.

Open proof/declaration closure: this is an extraction contract, not an implemented or recursively closed blueprint.

### T11 — Finite arithmetic descent and unipotent cohomology

theorem; missing. M_K(Y) descends to a Γ-stable finite-projective B_km0 module M(Y), compatibly with standard étale base change.

Locator: Proposition2.8(P1).

Prerequisites: T10, T08, P17.

Proof route:

- Take the trivial character part at a common finite field. For every nontrivial generalized character choose one γ_s−1 invertible; Hochschild–Serre kills all cohomology of that summand. P1 and P2 must be split into separate declarations in the design.

Open proof/declaration closure: this is an extraction contract, not an implemented or recursively closed blueprint.

### T12 — Logarithmic Higgs field

definition; missing. For M_K(Y), define commuting nilpotent Higgs operators by logγ_i=t·θ(T_i∂/∂T_i). Assemble θ:M_K→M_K⊗Ω¹_Y(-1); the Tate factor makes it independent of the chosen cyclotomic trivialization.

Locator: §2.3 after Proposition2.8.

Prerequisites: T10, H02, L51.

API:

- `LiuZhu17.T12.construct` (constructor): Construct the finite nilpotent logarithms and θ.
- `LiuZhu17.T12.characterise` (characterisation): Identify exp(tθ_i)=γ_i and prove θ∧θ=0.
- `LiuZhu17.T12.transport` (functoriality): Prove generator, coordinate and cyclotomic-trivialization compatibility.

Acceptance specifications (not Lean compiled):

- `LiuZhu17.T12.test1` (computation): For γ=I+E12, logγ=E12.
- `LiuZhu17.T12.test2` (degenerate): For trivial geometric action θ=0.
- `LiuZhu17.T12.test3` (non-example): Dropping t gives the wrong Tate twist under arithmetic conjugation.

Use in T15,T16: Identify the period-sheaf Higgs field.

Open proof/declaration closure: this is an extraction contract, not an implemented or recursively closed blueprint.

### T13 — Translation invariants and surjective difference

theorem; missing. For a Q-vector space W with automorphism γ, let γ act on W[V] by γ(wV^i)=γ(w)(V+1)^i. Evaluation at V=0 identifies invariants with ⋃_N ker(γ−1)^N. If every vector is generalized invariant, γ−1 on W[V] is surjective.

Locator: Lemma2.10.

Prerequisites: L50.

Proof route:

- Expand in binomial polynomials. Invariance gives w_(i+1)=γ^-1(1−γ)w_i. For (γ−1)^(r+1)w=0, a primitive of w binom(V,j) is Σ_(i=1)^(r+1) γ^-i(1−γ)^(i−1)w binom(V,i+j), with the corrected final term.

Open proof/declaration closure: this is an extraction contract, not an implemented or recursively closed blueprint.

### T14 — Polynomial period invariants and higher vanishing

theorem; missing. For Y in B, H^q(Y_(K,proet),hatL⊗OC) equals M_K(Y) for q=0 and vanishes for q>0, equivariantly for Gal(K/k).

Locator: Lemma2.9.

Prerequisites: T03, T11, T13, P17, T11C.

Proof route:

- Use successive geometric Zp factors and the polynomial translation lemma; apply continuous Koszul/Cartan–Leray comparison and Hochschild–Serre. This identifies the pushforward and kills higher pushforwards locally.

Open proof/declaration closure: this is an extraction contract, not an implemented or recursively closed blueprint.

### T15 — Identification and sign of the Higgs field

theorem; missing. Under H(L)(Y_K)≃M_K(Y), the field induced by gr∇ is the logarithmic θ. On M_K[V], total Θ=θ+t^-1Σ∂_(V_i)dlogT_i, whereas gr∇=−t^-1Σ∂_(V_i)dlogT_i; restriction to kerΘ gives θ.

Locator: Lemma2.11.

Prerequisites: T12, T14.

Proof route:

- Write the invariant lift as the kernel of the total Higgs operator and use its equation to compare the two fields. The negative sign in gr∇ is essential.

Open proof/declaration closure: this is an extraction contract, not an implemented or recursively closed blueprint.

### T16 — Nilpotent p-adic Simpson bundle

theorem; missing. For a Qp local system L on smooth X/k, H(L) is a rank-rkL vector bundle on X_K with nilpotent Higgs field and semilinear Gal(K/k) action.

Locator: Theorem2.1(i),bundle clause.

Prerequisites: T14, T15, P15.

Proof route:

- Glue the canonical finite-projective modules and local nilpotent fields. Vanishing is checked on the full covering basis.

Open proof/declaration closure: this is an extraction contract, not an implemented or recursively closed blueprint.

### T17 — Higgs period reconstruction

theorem; missing. There is a canonical equivariant isomorphism ν′*H(L)⊗OC≃hatL⊗OC, intertwining the tensor Higgs field θ_H+gr∇ with gr∇ on the coefficient factor.

Locator: Theorem2.1(ii).

Prerequisites: T16, T10, T16V.

Proof route:

- Use the adjunction map and the local scalar-extension isomorphism; include the coefficient Higgs field rather than comparing only θ_H.

Open proof/declaration closure: this is an extraction contract, not an implemented or recursively closed blueprint.

### T18 — Finite-projective pullback on perfectoid slices

theorem; missing. For f:Z→X and finite locally free hatO_X-module M, evaluation on affinoid perfectoid V→U gives (f_proet* M)(V)=M(U)⊗_(hatO_X(U))hatO_Z(V), with the completed ring maps and the finite-projective tensor convention.

Locator: Lemma2.12.

Prerequisites: P07, L40.

Proof route:

- Descend to the associated affinoid perfectoid spaces and apply finite-projective scalar extension; do not confuse sheaf inverse image with the ringed-site pullback.

Open proof/declaration closure: this is an extraction contract, not an implemented or recursively closed blueprint.

### T19 — Arbitrary smooth-space pullback of Simpson

theorem; missing. For any morphism f:Z→X of smooth rigid k-varieties, f_K*H(L)≃H(f*L), compatibly with Higgs fields and Galois actions.

Locator: Theorem2.1(iii).

Prerequisites: T18, T16, T17, T16V.

Proof route:

- Factor locally into a closed embedding and a smooth projection with compatible toric charts. For source n and target m variables, map V_i to V_i for i≤min(m,n), and kill source variables i>m in the closed-embedding case. Apply polynomial invariants. Flatness of f is not assumed.

Open proof/declaration closure: this is an extraction contract, not an implemented or recursively closed blueprint.

### T20 — Simpson tensor compatibility

theorem; missing. H(L1⊗L2)≃H(L1)⊗H(L2), with sum Higgs field and diagonal Galois action, naturally and associatively.

Locator: Theorem2.1(iv),tensor clause.

Prerequisites: T17, T19.

Proof route:

- Construct the adjunction-induced tensor map and check it on geometric points, using rank and locally free detection.

Open proof/declaration closure: this is an extraction contract, not an implemented or recursively closed blueprint.

### T21 — Simpson unit and dual

theorem; missing. H(Qp)≃(O_XK,0) with its natural semilinear Galois action.

Locator: Theorem2.1(iv),unit clause.

Prerequisites: T20, T16, T16V.

Proof route:

- The unit comes from the constant local-system calculation; the dual map follows from evaluation/coevaluation and the tensor isomorphism.

Open proof/declaration closure: this is an extraction contract, not an implemented or recursively closed blueprint.

### T22 — Relative Higgs Poincaré lemma

theorem; planned. For smooth f:X→Y, the augmented complex 0→f_proet*OC_Y→OC_X→OC_X⊗Ω¹_X/Y(-1)→… is exact with the induced relative gr∇.

Locator: §2.3, unnumbered relative Higgs resolution after Remark2.8, PDF16.

Existing layers: `PadicHodgeTheory:P8:local-rational`.

Prerequisites: P08, P09, P05.

Proof route:

- Use the local polynomial period coordinates and characteristic-zero polynomial integration; preserve relative twists and the augmentation.

Open proof/declaration closure: this is an extraction contract, not an implemented or recursively closed blueprint.

### T23 — Smooth proper period projection formula

theorem; missing. For smooth proper f:X→Y between smooth rigid varieties and a locally free O_X-module M on X_proet, the natural map Rf_proet,*M ⊗_(O_Y)OC_Y→Rf_proet,*(M⊗_(O_X)f_proet*OC_Y) is an isomorphism.

Locator: Lemma2.13.

Prerequisites: P11, P04.

Proof route:

- Read Scholze Lemma8.6 with the source-specified replacement of its coefficient sheaf by f_proet*OC_Y. This source-dependent projection formula is not inferred from an arbitrary underived tensor.

Open proof/declaration closure: this is an extraction contract, not an implemented or recursively closed blueprint.

### T24 — Smooth proper Higgs direct image

theorem; missing. Let f:X→Y be smooth proper between smooth rigid k-varieties and L a Zp local system such that every R^q f_*L is a Zp local system. Then H((R^i f_*L)⊗Qp)≃R^i f_(Higgs),*H(L⊗Qp), where relative Higgs degree j is H(L)⊗Ω^j_X/Y(-j), with the induced Gauss–Manin Higgs structure.

Locator: Theorem2.1(v).

Prerequisites: T22, T23, T16, T16V.

Proof route:

- Push the relative Higgs Poincaré complex through the two sides of the proétale/étale square. Preserve the all-q local-system hypothesis explicitly used on p17.

Open proof/declaration closure: this is an extraction contract, not an implemented or recursively closed blueprint.

### T25 — Proper étale–Higgs cohomology comparison

theorem; missing. For proper smooth X/k and a Qp local system L admitting a Zp lattice, H^i_et(X_Cp,L)⊗Cp≃H^i_Higgs(X_Cp,H(L)), equivariantly.

Locator: Corollary2.2,general comparison.

Prerequisites: T24.

Proof route:

- Apply the proper direct-image theorem to the structural map after retaining its local-system and finite-generation inputs. Split comparison and constant-coefficient specialization in a complete design.

Open proof/declaration closure: this is an extraction contract, not an implemented or recursively closed blueprint.

### T26 — Simpson external products

theorem; missing. For smooth X,Y/k and local systems L,M, H(L⊠M)≃H(L)⊠H(M), equivariantly for Galois and with the sum Higgs field.

Locator: Remark2.8.

Prerequisites: T19, T20.

Proof route:

- Express external product as the tensor product of projection pullbacks.

Open proof/declaration closure: this is an extraction contract, not an implemented or recursively closed blueprint.

### T27 — Kummer local-system calculation

theorem; missing. For X=Spa(k〈T^{±1}〉,O_k〈T^{±1}〉), m≥1 and ζ_(p^m)∈k and π:T_m→T the p^m-Kummer cover, L=π_*Zp has M_K=⊕_(a mod p^m) A_K·T^(-a/p^m)⊗τ_a. Its geometric Γ action and Higgs field are trivial although the local system is nontrivial and is not small in the cited integral Faltings sense.

Locator: Example2.16(ii).

Prerequisites: T10, T12.

Proof route:

- Diagonalize the finite permutation representation, cancel each τ_a by the inverse fractional monomial, and retain the descent/Galois data.

Open proof/declaration closure: this is an extraction contract, not an implemented or recursively closed blueprint.

### R01 — Completed de Rham base sheaves

definition; missing. For a basis object Y=Spa(B,B+) over finite k′⊂K, define O_Xhat⊗(BdR+/t^n) by Bhat⊗_k′(BdR+/t^n), n≥1; sheafify compatibly, take inverse limit for the plus sheaf and invert t for the full sheaf.

Locator: §3.1 formula(3.1).

Prerequisites: P01, P13, P06.

API:

- `LiuZhu17.R01.construct` (constructor): Construct finite quotients, inverse limit and t-inversion in this order.
- `LiuZhu17.R01.characterise` (characterisation): Identify sections on each basis object with the completed tensor formula.
- `LiuZhu17.R01.transport` (functoriality): Prove independence of finite field of definition and restriction compatibility.

Acceptance specifications (not Lean compiled):

- `LiuZhu17.R01.test1` (computation): For X=Spa(k), sections are BdR+/t^n, BdR+ and BdR.
- `LiuZhu17.R01.test2` (degenerate): For n=1 the quotient sheaf is O_XK.
- `LiuZhu17.R01.test3` (non-example): An ordinary tensor O_XK⊗_K BdR is undefined without a K-algebra structure and cannot replace this construction.

Use in R02,R04: Construct the ringed BdR base without a fictitious K embedding.

Open proof/declaration closure: this is an extraction contract, not an implemented or recursively closed blueprint.

### R02 — Finite period quotient acyclicity

theorem; missing. For X=Spa(A,A+) and every n≥1, H^q((X_K)_et,O_Xhat⊗(BdR+/t^n)) equals Ahat⊗_k(BdR+/t^n) for q=0 and vanishes for q>0.

Locator: Lemma3.1 with independent cohomology and truncation indices.

Prerequisites: R01, P06.

Proof route:

- A Schauder basis gives exact sequences between successive t-quotients; induct on n from Tate acyclicity over K. The printed reuse of i must be repaired.

Open proof/declaration closure: this is an extraction contract, not an implemented or recursively closed blueprint.

### R03 — Graded period base sheaf

theorem; missing. For each j∈Z, gr^j(O_Xhat⊗BdR)=O_XK(j), compatibly with restriction and semilinear Galois action.

Locator: Lemma3.2.

Prerequisites: R01, R02.

Proof route:

- Use the completed-tensor exact sequences and the t-shift of the filtration.

Open proof/declaration closure: this is an extraction contract, not an implemented or recursively closed blueprint.

### R04 — Finite-projective modules on the period base

theorem; missing. For smooth affinoid X=Spa(A,A+), finite-projective modules over Ahat⊗BdR+/t^n, and over Ahat⊗BdR+, correspond to finite locally free sheaves on the analytic or étale ringed sites. The analytic-to-étale pullback is an equivalence.

Locator: Proposition3.3; Corollary3.4.

Prerequisites: R02, L40, P06.

Proof route:

- Lift finite bases through nilpotent t-quotients and compatibly through the inverse limit; descend by Laurent covers and finite étale faithfully flat maps. The module-to-sheaf equivalence, effectivity and analytic/étale comparison require separate declarations.

Open proof/declaration closure: this is an extraction contract, not an implemented or recursively closed blueprint.

### R05 — The ringed de Rham base

definition; missing. Define X+=(X_K,O_Xhat⊗BdR+) and X_BdR=(X_K,O_Xhat⊗BdR) on the analytic site, with their étale analogues. These are ringed spaces; no representability as an ordinary rigid variety over BdR is asserted.

Locator: Definition3.5.

Prerequisites: R01, R04.

API:

- `LiuZhu17.R05.construct` (constructor): Construct the ringed spaces and analytic/étale comparison morphism.
- `LiuZhu17.R05.characterise` (characterisation): Identify reduction of X+ modulo t with X_K.
- `LiuZhu17.R05.transport` (functoriality): Construct pullback from a morphism of smooth rigid k-varieties.

Acceptance specifications (not Lean compiled):

- `LiuZhu17.R05.test1` (computation): For X=Spa(k), the coefficient ring is BdR+.
- `LiuZhu17.R05.test2` (degenerate): Reduction modulo t on the plus base is K.
- `LiuZhu17.R05.test3` (non-example): Base change through a canonical K→BdR is not part of the definition.

Use in R06,R08: Target geometry for RH.

Open proof/declaration closure: this is an extraction contract, not an implemented or recursively closed blueprint.

### R06 — Filtered period vector bundles with lattices

definition; missing. A vector bundle on X_BdR is locally free of finite rank and must admit an X+ lattice E+ with E+[1/t]≃E. A filtered object has a decreasing filtration by O_Xhat⊗BdR+ submodules with t^i Fil^j=Fil^(i+j), and the RH construction provides locally free filtration lattices.

Locator: Definition3.5.

Prerequisites: R05.

API:

- `LiuZhu17.R06.construct` (constructor): Construct an object with its admitted plus lattice and exhaustive separated t-filtration.
- `LiuZhu17.R06.characterise` (characterisation): Identify the full bundle as lattice localization and gr^j through t^j transport.
- `LiuZhu17.R06.transport` (functoriality): Construct tensor, dual and filtered pullback with lattice comparison maps.

Acceptance specifications (not Lean compiled):

- `LiuZhu17.R06.test1` (computation): For the unit object Fil^j=t^j O_X+.
- `LiuZhu17.R06.test2` (degenerate): Rank zero admits the zero lattice.
- `LiuZhu17.R06.test3` (non-example): An arbitrary locally free module after t-inversion is not silently accepted without the required lattice existence.

Use in R08,R11: State the genuine target category.

Open proof/declaration closure: this is an extraction contract, not an implemented or recursively closed blueprint.

### R07 — Relative filtered de Rham complexes

definition; missing. On X_BdR use BdR-linear integrable connections relative to the original smooth k-space and Ω^j_Xhat⊗BdR. A filtered connection satisfies Griffiths transversality. For smooth f:X→Y define relative de Rham hypercohomology with its induced connection on Y_BdR.

Locator: Definition3.6.

Prerequisites: R06, H01, H03, P05.

API:

- `LiuZhu17.R07.construct` (constructor): Construct the connection-valued de Rham complex and filtered differential.
- `LiuZhu17.R07.characterise` (characterisation): Prove d²=0 and identify the relative differential sequence for smooth f.
- `LiuZhu17.R07.transport` (functoriality): Construct pullback, tensor connections and the Gauss–Manin connection on permitted direct images.

Acceptance specifications (not Lean compiled):

- `LiuZhu17.R07.test1` (computation): The unit bundle has the exterior derivative.
- `LiuZhu17.R07.test2` (degenerate): On a point the relative differential vanishes.
- `LiuZhu17.R07.test3` (non-example): A connection lowering filtration by one is not filtration-preserving in the unshifted complex.

Use in R08,R15: Target of geometric RH and its pushforward.

Open proof/declaration closure: this is an extraction contract, not an implemented or recursively closed blueprint.

### R08 — Untwisted period-sheaf direct image

theorem; missing. For any permitted interval [a,b], Rν′_*O_BdR^[a,b]≃(O_Xhat⊗BdR)^[a,b], and the analogous identity holds after tensoring Ω^j. All higher pushforwards vanish.

Locator: Lemma3.7.

Prerequisites: P11, R02, R03.

Proof route:

- First compare gr^j via OC for the constant local system, then bounded intervals and derived-complete limits. Keep the original O_X pullback distinct from the completed O_XK.

Open proof/declaration closure: this is an extraction contract, not an implemented or recursively closed blueprint.

### R09 — Geometric Riemann–Hilbert functor

definition; missing. For a Qp local system L on smooth X/k define RH(L)=ν′_*(hatL⊗O_BdR), its filtration by period intervals, and its induced BdR-linear connection and semilinear Gal(K/k) action. Define RH+(L)=Fil^0 RH(L).

Locator: Theorem3.8; Theorem1.4.

Prerequisites: R08, P03, R07.

API:

- `LiuZhu17.R09.construct` (constructor): Construct RH on objects and local-system morphisms.
- `LiuZhu17.R09.characterise` (characterisation): Identify Fil^j sections with the filtered period pushforward.
- `LiuZhu17.R09.transport` (functoriality): Construct tensor and pullback comparison morphisms before proving they are isomorphisms.

Acceptance specifications (not Lean compiled):

- `LiuZhu17.R09.test1` (computation): RH(Qp) is the unit period bundle with its differential.
- `LiuZhu17.R09.test2` (degenerate): RH(0)=0.
- `LiuZhu17.R09.test3` (non-example): RH is a functor here, not a proved equivalence between all period connections and local systems.

Use in R10,A01: Geometric object whose Galois cohomology yields arithmetic DdR.

Open proof/declaration closure: this is an extraction contract, not an implemented or recursively closed blueprint.

### R10 — Filtered Riemann–Hilbert bundle and vanishing

theorem; missing. RH(L) has rank rkL and a locally free plus lattice, with semilinear Galois action and integrable connection satisfying Griffiths transversality.

Locator: Theorem3.8(i),bundle clause.

Prerequisites: R09, T16, R04, T16V.

Proof route:

- Use the graded Simpson theorem, induct on finite t-length, lift bases, and pass through the complete filtration. Verify strictness and local freeness before asserting the unbounded object.

Open proof/declaration closure: this is an extraction contract, not an implemented or recursively closed blueprint.

### R11 — Filtered period reconstruction

theorem; missing. The adjunction map ν′*RH(L)⊗O_BdR→hatL⊗O_BdR is an isomorphism compatible with filtration, the tensor connection and Galois actions.

Locator: Theorem3.8(iii).

Prerequisites: R10, T17, R10V.

Proof route:

- The graded map is the Simpson reconstruction. Completeness and filtered finite-projective control lift it to the filtered map.

Open proof/declaration closure: this is an extraction contract, not an implemented or recursively closed blueprint.

### R12 — Associated graded of Riemann–Hilbert

theorem; missing. gr^0 RH(L)≃H(L) with its Higgs field, and gr^j RH(L)≃H(L)(j).

Locator: Theorem3.8(ii).

Prerequisites: R10, T15, R10V.

Proof route:

- Use period graded comparison and higher-pushforward vanishing to commute gr with ν′_*; the induced connection is exactly the Higgs field.

Open proof/declaration closure: this is an extraction contract, not an implemented or recursively closed blueprint.

### R13 — Arbitrary pullback of Riemann–Hilbert

theorem; missing. For any f:Y→X of smooth rigid k-varieties, f*RH_X(L)≃RH_Y(f*L), with filtration, connection and Galois action.

Locator: Theorem3.8(iv),direction corrected.

Prerequisites: R11, R12, T19.

Proof route:

- Construct the period pullback map and check associated graded by Simpson pullback; lift through the complete t-filtration. No flatness assumption is added.

Open proof/declaration closure: this is an extraction contract, not an implemented or recursively closed blueprint.

### R14 — Riemann–Hilbert tensor structure

theorem; missing. RH is a tensor functor: it preserves unit, tensor products and duals together with connection, filtration, Galois action and the coherence isomorphisms.

Locator: Theorem3.8(i),tensor assertion.

Prerequisites: R11, T20, T21, T21D.

Proof route:

- Construct tensor comparison from multiplication of period coefficients; reduce to the graded isomorphism and complete. Unit and dual follow through evaluation/coevaluation.

Open proof/declaration closure: this is an extraction contract, not an implemented or recursively closed blueprint.

### R15 — Smooth proper Riemann–Hilbert pushforward

theorem; missing. For smooth proper f:X→Y between smooth rigid k-varieties and a Zp local system L with all R^q f_*L locally constant finite free, RH((R^i f_*L)⊗Qp)≃R^i f_dR,* RH(L⊗Qp) as filtered bundles with integrable connection and Galois action.

Locator: Theorem3.8(v).

Prerequisites: R14, T24, R07.

Proof route:

- Use the filtered relative period Poincaré complex and projection formula. Track Gauss–Manin connection and strictness; preserve the all-q local-system hypothesis.

Open proof/declaration closure: this is an extraction contract, not an implemented or recursively closed blueprint.

### R16 — The t-connection interpolation

theorem; missing. The plus lattice RH+(L) with ∇+=t∇ is a t-connection. Modulo t it yields H(L) with the Tate-normalized Higgs field; after inverting t and dividing ∇+ by t it yields RH(L) with its ordinary connection.

Locator: Remark3.2.

Prerequisites: R10, R12, H03, R10V.

Proof route:

- Check the t-Leibniz rule, Griffiths preservation of Fil0 after multiplication by t, and the two specializations. The speculative full Fargues–Fontaine twistor family is not asserted constructed.

Open proof/declaration closure: this is an extraction contract, not an implemented or recursively closed blueprint.

### A01 — Arithmetic de Rham direct images

definition; missing. Define D^i_dR(L)=R^iν_*(hatL⊗O_BdR) on X_et with the induced connection. Via Cartan–Leray these are continuous Gal(K/k)-cohomology sheaves of the geometric RH object. For general L no full-rank admissibility is assumed.

Locator: §3.2 unnumbered definition of D_dR^i, PDF24; Theorem1.5.

Prerequisites: R09, P17.

API:

- `LiuZhu17.A01.construct` (constructor): Construct the arithmetic derived pushforwards and connection.
- `LiuZhu17.A01.characterise` (characterisation): Identify their local sections with the specified continuous Galois cohomology when the acyclicity hypotheses hold.
- `LiuZhu17.A01.transport` (functoriality): Construct pullback and comparison maps, with later base-change theorems supplying isomorphisms.

Acceptance specifications (not Lean compiled):

- `LiuZhu17.A01.test1` (computation): At X=Spa(k), D^0_dR is Fontaine DdR.
- `LiuZhu17.A01.test2` (degenerate): D^i_dR(0)=0.
- `LiuZhu17.A01.test3` (non-example): A general p-adic representation need not have dim D^0_dR equal to its rank.

Use in A07,A13: Arithmetic realization whose local freeness proves rigidity.

Open proof/declaration closure: this is an extraction contract, not an implemented or recursively closed blueprint.

### A02 — Normalized trace complement

definition; missing. For k∞=∪k_m and K its completion, extend normalized traces to bounded projections R_m:K→k_m and put X_m=ker R_m, so K=k_m⊕X_m. Tensor with the finite affinoid modules using the specified Banach topology.

Locator: Lemma3.10 proof; BC Proposition4.1.1.

Prerequisites: P01.

API:

- `LiuZhu17.A02.construct` (constructor): Construct normalized traces and their continuous extension.
- `LiuZhu17.A02.characterise` (characterisation): Prove the topological direct-sum decomposition and Γ-equivariance.
- `LiuZhu17.A02.transport` (functoriality): Construct compatible larger-level projections and completed coefficient extension.

Acceptance specifications (not Lean compiled):

- `LiuZhu17.A02.test1` (computation): An element a∈k_m has R_m(a)=a.
- `LiuZhu17.A02.test2` (degenerate): The complement has zero intersection with k_m.
- `LiuZhu17.A02.test3` (non-example): The complement is not fixed-point-free for every deeper cyclotomic γ.

Use in A03,A04: Tate–Sen inverse and perturbation argument.

Open proof/declaration closure: this is an extraction contract, not an implemented or recursively closed blueprint.

### A03 — Correct Tate–Sen inverse condition

theorem; missing. For large m and a chosen generator γ of Gal(k∞/k_m), hence v_p(χ(γ)−1)=m after stable indexing, γ−1 is continuously invertible on X_m with a uniform inverse bound. More generally the scalar Tate–Sen condition has n(γ)≤m, not ≥m.

Locator: Corrected Lemma3.10; BC Definition3.1.3(TS3),printed310; Proposition4.1.1,printed314.

Prerequisites: A02.

Proof route:

- Use BC TS3 and its Cp realization; verify the cyclotomic index convention after a sufficiently large base level. A nonidentity γ fixing k_(m+1) has a nonzero fixed class in K/k_m and refutes the source’s ≥ condition.

Open proof/declaration closure: this is an extraction contract, not an implemented or recursively closed blueprint.

### A04 — Finite-module cyclotomic decompletion

theorem; missing. Let M be a finite A_m0-module with continuous semilinear Gal(k∞/k) action. For sufficiently large m, choose a generator γ of Gal(k∞/k_m). Then γ−1 is continuously invertible on (Mhat⊗k_m0 K)/(M⊗k_m0 k_m). Consequently finite-level inclusion gives an isomorphism on all continuous Galois cohomology groups.

Locator: Lemma3.10,corrected quantifier.

Prerequisites: A03, P17.

Proof route:

- View finite M as a Banach module. On the normalized-trace complement compare γ−1 with the scalar operator, and prove a norm-small perturbation estimate uniformly on the tensor product; use a Neumann series for surjectivity as well as injectivity. Pass to rational finite quotient descent. The required coefficient norm details remain a recursive gap.

Open proof/declaration closure: this is an extraction contract, not an implemented or recursively closed blueprint.

### A05 — Graded cyclotomic finiteness and weight bounds

theorem; missing. For the finite-descent module M(X) of Proposition2.8(P1), H^i(Gal(k∞/k),H(L)(X_K)(j)) is a finite A-module, zero for i≥2 and for |j| sufficiently large. These groups commute with standard étale base change.

Locator: Theorem3.9(i) proof,conditions(a),(b).

Prerequisites: T11, A04, P17, T11C.

Proof route:

- Reduce completed coefficients to finite-level modules by corrected decompletion. A sufficiently small cyclotomic generator acts with an invertible γ−1 outside finitely many integral twists; use the two-term complex and finite rational descent.

Open proof/declaration closure: this is an extraction contract, not an implemented or recursively closed blueprint.

### A06 — Finite cohomology of period windows

theorem; missing. For every finite interval [a,b], Galois cohomology of RH^[a,b](L)(X_K) is finite over A, vanishes in degrees≥2, and stabilizes to D^i_dR(L) as the ends leave the finite range allowed by A05.

Locator: Theorem3.9(i) proof.

Prerequisites: A05, R10, P12, R10V.

Proof route:

- Induct on the graded windows, use their exact sequences, then derive the completed-limit and colimit comparisons with the bounded weight range.

Open proof/declaration closure: this is an extraction contract, not an implemented or recursively closed blueprint.

### A07 — Local freeness of all arithmetic realizations

theorem; missing. For smooth X/k and any Qp local system L, every D^i_dR(L) is a vector bundle with integrable connection.

Locator: Theorem3.9(i),local-freeness clause.

Prerequisites: A06, P18, A01.

Proof route:

- Finiteness makes each sheaf coherent; its integrable connection and smooth characteristic-zero base make it locally free.

Open proof/declaration closure: this is an extraction contract, not an implemented or recursively closed blueprint.

### A08 — Nonflat cohomology base change criterion

theorem; missing. For a two-term complex of flat A-modules concentrated in degrees0,1 with both cohomology modules flat over A, its cohomology commutes with arbitrary algebraic base change A→B. Without flat cohomology retain the Tor correction.

Locator: Theorem3.9(ii) proof preceding Lemma3.11.

Prerequisites: L37.

Proof route:

- Split the exact image/kernel sequences using the flatness conditions, or use the universal-coefficient spectral sequence. Distinguish algebraic tensor from later Banach completion.

Open proof/declaration closure: this is an extraction contract, not an implemented or recursively closed blueprint.

### A09 — Analytic period-window base change

theorem; missing. For smooth toric affinoids X=Spa(A), Y=Spa(B), f:Y→X, a Zp local system L on X and integers a≤b, the natural map H^i(Γ, RH^[a,b](L)(X_K) ⊗_A B) → H^i(Γ, RH^[a,b](f*L)(Y_K)) is an isomorphism for every i≥0, with Γ=Gal(k∞/k) and K the completed cyclotomic extension. Tensor is INSIDE cohomology. Moving it outside requires the separate flat-cohomology argument for sufficiently wide stabilizing windows.

Locator: Lemma3.11,direction corrected.

Prerequisites: R13, A04.

Proof route:

- Reduce to graded H(L)(j), apply its arbitrary pullback and finite descent M(Y)=M(X)⊗A_m0 B_m0, and use the selected generator for both sides. Compare algebraic and completed tensor through the acyclic trace complement; the printed deeper-generator inequality is not used.

Review/coverage note: Review correction: Lemma3.11 does not assert arbitrary finite-window H^i⊗B base change. Its printed variance and deeper-generator quantifier are corrected as E05/E06; the norm-controlled module argument remains GAP04.

Open proof/declaration closure: this is an extraction contract, not an implemented or recursively closed blueprint.

### A10 — Arbitrary pullback of arithmetic realizations

theorem; missing. For every morphism f:Y→X of smooth rigid k-varieties and every i≥0, f*D^i_dR(L)≃D^i_dR(f*L), compatibly with the integrable connections.

Locator: Theorem3.9(ii).

Prerequisites: A09, A06, A07, A07V, A08.

Proof route:

- Use stabilized finite windows and glue the affine comparison. The proof requires A08’s Tor control because f may be a closed immersion.

Open proof/declaration closure: this is an extraction contract, not an implemented or recursively closed blueprint.

### A11 — One de Rham stalk gives strict filtration

theorem; missing. Assume X is connected and smooth and L has one classical de Rham stalk. The period-filtration spectral sequence degenerates at E1; for i=0,1, D^i_dR(L) has a decreasing filtration by subbundles satisfying Griffiths transversality, and the arbitrary-pullback isomorphism A10 preserves these filtrations. Higher D^i vanish by A07V.

Locator: Theorem3.9(iii).

Prerequisites: A10, P02, H03.

Proof route:

- The rank of D^0 is locally constant, so one full-rank stalk makes all classical stalks de Rham. Induct on finite windows using the six-term exact sequence; the pointwise connecting maps vanish, H1 cokernel commutes with base change, and finite-module flatness/Tor criteria force subbundles. Preserve reduced Jacobson fiber detection.

Open proof/declaration closure: this is an extraction contract, not an implemented or recursively closed blueprint.

### A12 — De Rham local-system comparison

theorem; missing. Under A11’s hypotheses, L is de Rham in Scholze’s sense: the filtered integrable bundle (D^0_dR(L),∇,Fil) reconstructs hatL⊗O_BdR through the filtered horizontal comparison map.

Locator: Theorem3.9(iv),first clause.

Prerequisites: A11, R11, P20.

Proof route:

- Construct the comparison and verify it at every classical fiber; use local freeness, strict filtration and the geometric reconstruction. This is stronger than merely saying that all stalks satisfy a numerical rank equality.

Open proof/declaration closure: this is an extraction contract, not an implemented or recursively closed blueprint.

### A13 — First arithmetic direct image in the de Rham case

theorem; missing. Under A11’s hypotheses, D^1_dR(L) is isomorphic to D^0_dR(L). No canonical normalization of this isomorphism is claimed without specifying the cyclotomic cohomology generator.

Locator: Theorem3.9(iv),second clause.

Prerequisites: A12, A04.

Proof route:

- Use the de Rham comparison and the scalar cyclotomic H0/H1 computation; tensor with the finite-projective DdR module.

Open proof/declaration closure: this is an extraction contract, not an implemented or recursively closed blueprint.

### A14 — Tensor de Rham realization

theorem; missing. On the category of de Rham Qp local systems on a smooth rigid k-space, D^0_dR is a tensor functor to filtered vector bundles with integrable connection satisfying Griffiths transversality.

Locator: Theorem3.9(v).

Prerequisites: A12, R14.

Proof route:

- Construct tensor comparison and check it using period admissibility at classical points, preserving filtered subbundles, unit and dual.

Open proof/declaration closure: this is an extraction contract, not an implemented or recursively closed blueprint.

### A15 — Geometric rigidity of de Rham stalks

theorem; missing. For geometrically connected rigid analytic X over a finite extension k/Qp, a Qp local system with one classical de Rham stalk has every classical stalk de Rham and all their Hodge–Tate weight multisets equal. X need not be smooth.

Locator: Theorem1.3.

Prerequisites: A10, A11, P02, G01.

Proof route:

- Smooth case follows from locally constant ranks and filtered subbundles. Resolve the singular variety and descend through finite residue-field extensions; use a connected-component incidence argument if the resolution/normalization is disconnected. The exact singular analytic supplier remains open.

Open proof/declaration closure: this is an extraction contract, not an implemented or recursively closed blueprint.

### A16 — Hodge–Tate and period recovery for de Rham systems

theorem; missing. A de Rham Qp local system on smooth X/k is Hodge–Tate; H(L) is identified with the graded DdR bundle with its specified twists.

Locator: Corollary3.12(i).

Prerequisites: A12, R12, P19.

Proof route:

- Apply the filtered period reconstruction and take associated graded only after proving strictness.

Open proof/declaration closure: this is an extraction contract, not an implemented or recursively closed blueprint.

### G01 — Resolution, compactification and arithmetic spreading

theorem; missing. In characteristic zero, use the source-qualified algebraic or rigid resolution theorem, smooth compactifications for the algebraic smooth case, and spread the algebraic data over O_E[1/N] with smooth projective compactification and boundary after enlarging N. Keep connected and irreducible components distinct.

Locator: Proofs of Theorem1.3 and Proposition4.1; Bierstone–Milman.

Prerequisites: L42.

Proof route:

- Specify the exact analytic/algebraic resolution theorem before using it. For a singular connected source, propagate the stalk property through the component incidence graph and descend finite residue extensions. The full supplier statement and this reduction remain open.

Review/coverage note: SF.4 does not supply a named rigid-analytic resolution theorem. Split the algebraic compactification/spreading contract from analytic resolution and connected-component propagation before accepting this route.

Open proof/declaration closure: this is an extraction contract, not an implemented or recursively closed blueprint.

### G02 — Congruence frame torsors and branch divisors

definition; missing. For a rank-n Zp local system on a smooth number-field variety and m≥1, take the finite étale frame torsor of L/p^m with group GL_n(Z/p^m). Normalize a chosen compactification model in its finite étale generic algebra, retaining all components; separate the branch divisor into vertical and horizontal parts.

Locator: Proposition4.1 proof.

Prerequisites: P03, G01.

API:

- `LiuZhu17.G02.construct` (constructor): Construct the frame torsor and normalization componentwise.
- `LiuZhu17.G02.characterise` (characterisation): Identify ramification away from the open locus as horizontal boundary plus vertical fibers.
- `LiuZhu17.G02.transport` (functoriality): Construct compatible level maps and base-field extensions.

Acceptance specifications (not Lean compiled):

- `LiuZhu17.G02.test1` (computation): A trivial rank-one mod-p system has a disconnected frame torsor when |F_p×|>1.
- `LiuZhu17.G02.test2` (degenerate): For the zero-rank system the frame group is trivial.
- `LiuZhu17.G02.test3` (non-example): The total quotient algebra of a disconnected cover is not a single fractional field.

Use in G03,G04: Uniform bad-prime control for all levels.

Open proof/declaration closure: this is an extraction contract, not an implemented or recursively closed blueprint.

### G03 — Uniform finiteness of vertical ramification

theorem; missing. If one closed stalk of L is unramified almost everywhere, then after choosing N divisible by p·|GL_n(Fp)| the union over m of vertical bad-prime sets of the frame covers is finite.

Locator: Lemma4.2.

Prerequisites: G02.

Proof route:

- Spread the good stalk as an arithmetic section and discard finitely many places meeting the horizontal boundary or ramified in its field of definition. At other primes, group order is prime to residue characteristic. Use tame specialization along the smooth vertical divisor to detect any nontrivial vertical inertia in the section, contradicting its unramifiedness. The purity/Abhyankar and specialization inputs require original-source closure.

Open proof/declaration closure: this is an extraction contract, not an implemented or recursively closed blueprint.

### G04 — Unramifiedness propagates between closed points

theorem; missing. For a geometrically connected algebraic variety X over a number field E and a Qp local system L, if one closed stalk is unramified at almost all finite places then every closed stalk is unramified almost everywhere.

Locator: Proposition4.1.

Prerequisites: G03, G01.

Proof route:

- First reduce to the smooth compactified case. The finite vertical union is uniform; each new arithmetic section meets the horizontal boundary at only finitely many primes. Apply finite-extension descent and component propagation for the general source.

Open proof/declaration closure: this is an extraction contract, not an implemented or recursively closed blueprint.

### G05 — Local de Rham propagation in the algebraic case

theorem; missing. Under the hypotheses of Theorem1.1, de Rhamness at all places above p for one closed stalk implies the same for every closed stalk.

Locator: Theorem1.1 proof.

Prerequisites: A15, P02.

Proof route:

- Pass to each p-adic completion and analytification, retain geometric connectedness, and use the local rigidity theorem. Descend any finite residue-field extensions.

Open proof/declaration closure: this is an extraction contract, not an implemented or recursively closed blueprint.

### G06 — Global geometric rigidity

theorem; missing. Let X be a geometrically connected algebraic variety over a number field E and L a Qp étale local system. If L at one closed point is geometric in the Fontaine–Mazur sense, then L at every closed point is geometric.

Locator: Theorem1.1.

Prerequisites: G04, G05, P02.

Proof route:

- Combine almost-everywhere unramified propagation with local de Rham rigidity at each p-adic place. The conclusion is about closed-point representations, not a construction of a family of motives.

Open proof/declaration closure: this is an extraction contract, not an implemented or recursively closed blueprint.

### G07 — Relative Fontaine–Mazur conjecture specification

definition; missing. For geometrically connected algebraic X/E and a Qp local system having one geometric closed stalk, the relative Fontaine–Mazur conjecture predicts that the generic-stalk representation is a subquotient, up to Tate twist, of étale cohomology of some variety over the generic point. This item specifies a conjecture, not a proved target.

Locator: §1 introduction.

Prerequisites: G06.

API:

- `LiuZhu17.G07.construct` (constructor): Construct the geometric-origin predicate at the generic point with degree, Tate twist and subquotient data.
- `LiuZhu17.G07.characterise` (characterisation): State the conjectural implication with its exact one-stalk hypothesis.
- `LiuZhu17.G07.transport` (functoriality): Transport a supplied realization under finite generic-field extension.

Acceptance specifications (not Lean compiled):

- `LiuZhu17.G07.test1` (computation): For X=Spec(E), this specializes to the ordinary Fontaine–Mazur geometric-origin prediction.
- `LiuZhu17.G07.test2` (degenerate): The zero system has a zero subquotient realization.
- `LiuZhu17.G07.test3` (non-example): Theorem1.1 alone does not produce the required variety over the generic point.

Use in §1 introduction contextual endpoint: Prevent the proved rigidity theorem from being mislabeled motivic realization.

Open proof/declaration closure: this is an extraction contract, not an implemented or recursively closed blueprint.

### G08 — Abelian-monodromy relative Fontaine–Mazur case

theorem; missing. The relative Fontaine–Mazur prediction in G07 is known when the arithmetic monodromy is abelian, using finite geometric monodromy and the abelian case of Fontaine–Mazur.

Locator: §1 introduction discussion.

Prerequisites: G07.

Proof route:

- Extract the finite-geometric-monodromy argument and Henniart’s abelian geometric-origin theorem with their exact hypotheses. This checkpoint records the source claim and leaves those original inputs open.

Open proof/declaration closure: this is an extraction contract, not an implemented or recursively closed blueprint.

### G09 — Reflex norm of a torus cocharacter

definition; planned. For a Q-torus T and cocharacter μ defined over a number field F, define Nμ:Res_(F/Q)Gm→Res_(F/Q)T_F→T by restriction of μ and multiplication over embeddings.

Locator: §4.2.

Existing layers: `ShimuraVarieties:V4`.

Prerequisites: L07, L09.

API:

- `LiuZhu17.G09.construct` (constructor): Construct the restriction-of-scalars map and the torus norm.
- `LiuZhu17.G09.characterise` (characterisation): Identify its splitting-field formula as the product of conjugate cocharacters.
- `LiuZhu17.G09.transport` (functoriality): Prove finite-field-extension and torus-homomorphism compatibility.

Acceptance specifications (not Lean compiled):

- `LiuZhu17.G09.test1` (computation): For T=Gm and μ(z)=z^a, Nμ is the a-th power of the field norm.
- `LiuZhu17.G09.test2` (degenerate): The zero cocharacter gives the trivial norm.
- `LiuZhu17.G09.test3` (non-example): Multiplying by [F:Q] on points is not the same map as the torus field norm.

Use in G10,G13: Torus reciprocity and special-point stalks.

Open proof/declaration closure: this is an extraction contract, not an implemented or recursively closed blueprint.

### G10 — Torus reciprocity and closure quotient

definition; planned. Fix compact open K⊂T(Af). Global Artin with geometric-Frobenius normalization and Nμ gives r(μ)_K:Gal(Fab/F)→T(Q)\T(Af)/K. Passing to all levels gives r(μ) valued in T(Q)^−\T(Af), with T(Q)^− the adelic closure. Let F_K be fixed by ker r(μ)_K. Restrict the FULL r(μ) to Gal(Fab/F_K), giving values in K/(K∩T(Q)^−).

Locator: §4.2 formula(4.3) and inverse-limit passage,PDF30–31.

Existing layers: `ShimuraVarieties:V4`.

Prerequisites: G09.

API:

- `LiuZhu17.G10.construct` (constructor): Construct the finite-level reciprocity action and its field of definition.
- `LiuZhu17.G10.characterise` (characterisation): Identify the inverse-limit action and its restriction to K modulo rational closure.
- `LiuZhu17.G10.transport` (functoriality): Prove level and field-extension compatibility with the geometric Artin convention.

Acceptance specifications (not Lean compiled):

- `LiuZhu17.G10.test1` (computation): At finite level the restriction of r(μ)_K itself to Gal(Fab/F_K) is trivial.
- `LiuZhu17.G10.test2` (degenerate): If μ=0 all reciprocity actions are trivial.
- `LiuZhu17.G10.test3` (non-example): The full restricted map can be nontrivial even though its finite-level quotient is zero.

Use in G11,G15: Construct the stalk representation from the full reciprocity map.

Open proof/declaration closure: this is an extraction contract, not an implemented or recursively closed blueprint.

### G11 — p-adic torus reciprocity representation

definition; missing. For an Q-rational algebraic representation ρ of T whose adelic realization kills K∩T(Q)^−, compose the full restricted reciprocity map G10 with ρ and project to p, obtaining r(μ,ρ)_(K,p) on Gal(Fbar/F_K).

Locator: §4.2,after(4.4).

Prerequisites: G10.

API:

- `LiuZhu17.G11.construct` (constructor): Construct the continuous representation after proving independence of closure representatives.
- `LiuZhu17.G11.characterise` (characterisation): Identify its local characters after splitting T and the coefficient field.
- `LiuZhu17.G11.transport` (functoriality): Prove tensor/dual and level-change compatibility.

Acceptance specifications (not Lean compiled):

- `LiuZhu17.G11.test1` (computation): For a CM reflex norm and the natural representation, recover the Tate-module reciprocity convention.
- `LiuZhu17.G11.test2` (degenerate): The trivial representation gives a trivial local system.
- `LiuZhu17.G11.test3` (non-example): If ρ does not kill K∩closure, the quotient-valued reciprocity map cannot be composed with it.

Use in G12,G18: Special points supply geometric stalks.

Open proof/declaration closure: this is an extraction contract, not an implemented or recursively closed blueprint.

### G12 — Geometric torus reciprocity representations

theorem; missing. The p-adic torus reciprocity representation r(μ,ρ)_(K,p) is unramified at almost all finite places.

Locator: Lemma4.4,unramified clause.

Prerequisites: G11, P02, G13.

Proof route:

- Split the torus and representation, express inertial characters as products of embeddings of a local field via its norm, and apply local algebraicity/Lubin–Tate crystallinity. Translate Conrad PropositionB.4’s arithmetic Artin convention to this paper’s geometric convention; the signs cancel by inversion of local Artin.

Open proof/declaration closure: this is an extraction contract, not an implemented or recursively closed blueprint.

### G13 — Local algebraic character criterion

theorem; missing. Let L,K/Qp be finite, ψ:G_L^ab→O_K× continuous, and V its underlying Qp representation. With arithmetic local Artin r_L, V is crystalline iff ψ∘r_L agrees on O_L× with a Qp-torus homomorphism Res_(L/Qp)Gm→Res_(K/Qp)Gm. Agreement only on an open unit subgroup yields potential crystallinity after finite extension.

Locator: Lemma4.4 supplier; Conrad PropositionB.4(i),PDF35–36.

Prerequisites: P02.

Proof route:

- After scalar splitting reduce the algebraic characters to products of field embeddings. With arithmetic Artin, Lubin–Tate characters correspond to inverse embeddings; pass to a finite extension for local algebraicity. Only part(i) is used; the Frobenius formula in part(ii) is not needed.

Open proof/declaration closure: this is an extraction contract, not an implemented or recursively closed blueprint.

### G14 — The real-split anisotropic torus quotient

definition; missing. For a Q-torus T, define T^a as the connected kernel of all Q-rational characters, T^s as the maximal Q-subtorus of T^a that is R-split, and T^c=T/T^s. For reductive G use Z_G^s in its center and G^c=G/Z_G^s.

Locator: §4.2 before Lemma4.5; §4.2.

Prerequisites: L06, L07, L08.

API:

- `LiuZhu17.G14.construct` (constructor): Construct the character-kernel torus, maximal split subtorus and quotient.
- `LiuZhu17.G14.characterise` (characterisation): Characterize representations of G^c as representations of G trivial on Z_G^s.
- `LiuZhu17.G14.transport` (functoriality): Prove functoriality for the torus inclusions and representation restriction used at special points.

Acceptance specifications (not Lean compiled):

- `LiuZhu17.G14.test1` (computation): For T=Gm, T^a=1 and T^c=Gm.
- `LiuZhu17.G14.test2` (degenerate): For the trivial torus all quotients are trivial.
- `LiuZhu17.G14.test3` (non-example): A Q-anisotropic torus may be R-split, so Q-anisotropic does not imply real compact.

Use in G15,G16: Correct quotient group for canonical local systems.

Open proof/declaration closure: this is an extraction contract, not an implemented or recursively closed blueprint.

### G15 — Closure criterion for the central quotient

theorem; missing. If an algebraic torus representation ρ kills K∩T(Q)^− for a compact open K, then ρ(T^s)=1.

Locator: Lemma4.5(i).

Prerequisites: G14.

Proof route:

- Use compactness of anisotropic torus adelic quotients and the resulting unit lattice whose Zariski closure contains T^s; conversely use discreteness of T^c(Q) in T^c(Af) and shrink the compact subgroup. Split the two implications and their arithmetic unit suppliers in the next design.

Open proof/declaration closure: this is an extraction contract, not an implemented or recursively closed blueprint.

### G16 — Canonical Shimura local systems

definition; planned. For a Shimura datum (G,X), sufficiently small neat K=K_pK^p and ρ∈Rep_Qp(G^c), choose a K_p-stable lattice Λ. Set K_p^(n)=K_p∩ρ^-1(1+p^nEndΛ), form the associated finite étale Λ/p^n sheaf on Sh_K, and take its inverse limit then rationalize.

Locator: §4.2 construction before Lemma4.8.

Existing layers: `HodgeTateAndCanonicalSubgroups:T6:comparison`.

Prerequisites: G14, G15, G17, P03, G15C, G17S.

API:

- `LiuZhu17.G16.construct` (constructor): Construct the congruence-associated sheaves and compatible transition maps.
- `LiuZhu17.G16.characterise` (characterisation): Prove independence of lattice after rationalization and identify Betti comparison for Q-rational ρ.
- `LiuZhu17.G16.transport` (functoriality): Prove tensor, dual, level and Hecke compatibility over the reflex field.

Acceptance specifications (not Lean compiled):

- `LiuZhu17.G16.test1` (computation): For Siegel standard representation obtain the p-adic Tate module of the universal abelian scheme.
- `LiuZhu17.G16.test2` (degenerate): The trivial representation produces the constant Qp local system.
- `LiuZhu17.G16.test3` (non-example): For nonfaithful ρ the intersection of K_p^(n) is K_p∩kerρ, so these need not form a basis at the identity of G(Qp).

Use in G18,G19,G20: The existing canonical-local-system owner.

Open proof/declaration closure: this is an extraction contract, not an implemented or recursively closed blueprint.

### G17 — Canonical models and special-point supply

theorem; planned. For every Shimura datum, use the canonical model over its reflex field with geometric-Artin special-point reciprocity and algebraic level maps.

Locator: §4.2 canonical-model input.

Existing layers: `ShimuraVarieties:V4`, `ShimuraVarieties:V7`, `ShimuraVarieties:V8`.

Prerequisites: G09, G10.

Proof route:

- Import the actual all-datum canonical-model construction and torus-model reciprocity, not only Hodge/abelian type. Density/nonemptiness comes from special-pair and Hecke theory.

Open proof/declaration closure: this is an extraction contract, not an implemented or recursively closed blueprint.

### G18 — Special-point stalk identification

theorem; missing. For x=[h,a]_K and a Q-torus T_h containing h(S), identify the stalk of the canonical system with r(μ_h,ρ|T_h) at the induced torus level T_h(Af)∩aKa^-1, with the representation transported by a_p and restricted to the residue-field Galois group.

Locator: Lemma4.8,explicit level/transport convention.

Prerequisites: G11, G16, G17, G17S.

Proof route:

- Pull the congruence tower back along the torus special-point morphism and apply canonical torus reciprocity; retain the Hecke translate a in the level and fiber identification.

Open proof/declaration closure: this is an extraction contract, not an implemented or recursively closed blueprint.

### G19 — All Shimura canonical stalks are geometric

theorem; missing. For every Shimura datum and a representation of G^c defining the canonical Qp local system, its stalk at every closed point is geometric. For Q-rational V this is Theorem1.2; the §4.2 tensor construction and argument apply to Rep_Qp(G^c).

Locator: Theorem1.2 and §4.2 proof.

Prerequisites: G12, G18, G06, G17, G12C, G17S.

Proof route:

- Choose a special point in each geometric connected component, use potentially crystalline torus reciprocity there, and apply global geometric rigidity. No abelian-type restriction is imposed.

Open proof/declaration closure: this is an extraction contract, not an implemented or recursively closed blueprint.

### G20 — Canonical analytic de Rham torsor

definition; missing. At v|p of the reflex field, the exact faithful tensor functor V↦D_dR(L_V,p) on Rep_Qp(G^c) defines a G^c torsor on Sh_K^ad over E_v. Its filtered refinement gives the parabolic reduction determined by the Hodge cocharacter class.

Locator: Corollary4.9; Remark4.1(i).

Prerequisites: G19, A14, G21.

API:

- `LiuZhu17.G20.construct` (constructor): Construct the tensor fiber functor and its isomorphism torsor.
- `LiuZhu17.G20.characterise` (characterisation): Identify the filtration with a section of the associated flag/parabolic bundle.
- `LiuZhu17.G20.transport` (functoriality): Prove pullback and Hecke transport of the torsor and filtration.

Acceptance specifications (not Lean compiled):

- `LiuZhu17.G20.test1` (computation): For the trivial group G^c=1 the torsor is the unique trivial torsor.
- `LiuZhu17.G20.test2` (degenerate): For the unit representation the filtered bundle is the unit object.
- `LiuZhu17.G20.test3` (non-example): This construction alone does not prove algebraicity or identify the torsor with the algebraic automorphic torsor; the source leaves that comparison conjectural.

Use in Remark4.1: Analytic automorphic output consumed by the later logarithmic comparison.

Open proof/declaration closure: this is an extraction contract, not an implemented or recursively closed blueprint.

### G21 — Tannakian torsor reconstruction

theorem; missing. For an affine algebraic group H over Qp and an exact faithful tensor functor Rep_Qp(H)→finite locally free modules on a ringed analytic base satisfying the standard fiber-functor hypotheses, the sheaf of tensor isomorphisms from the trivial fiber functor is an H-torsor; filtrations of a fixed cocharacter type give the corresponding parabolic reduction.

Locator: Corollary4.9 input.

Prerequisites: G14.

Proof route:

- Read the original Tannakian reconstruction and analytic torsor representability/descent; verify local triviality and exactness rather than treating tensor functor alone as a torsor axiom. This supplier remains open.

Open proof/declaration closure: this is an extraction contract, not an implemented or recursively closed blueprint.

### G22 — Pointwise period lattice and isocrystal class

definition; missing. At a classical point, after embedding its algebraic residue closure in Cp, the filtered de Rham comparison gives a BdR+ lattice in V⊗BdR for every representation V of G^c. Applying the source-qualified Fargues modification/BKF tensor construction gives the associated class in B(G^c_Qp). A class in B(G_Qp) requires a lift or additional G-level input.

Locator: Remark4.1(iii),quotient-group clarification.

Prerequisites: G20, R11.

API:

- `LiuZhu17.G22.construct` (constructor): Construct the compatible pointwise period lattices.
- `LiuZhu17.G22.characterise` (characterisation): Identify their tensor functor and the resulting G^c isocrystal class.
- `LiuZhu17.G22.transport` (functoriality): Transport under representation morphisms and the map B(G)→B(G^c) when a lift is supplied.

Acceptance specifications (not Lean compiled):

- `LiuZhu17.G22.test1` (computation): For G^c=1 the output class is unique.
- `LiuZhu17.G22.test2` (degenerate): The unit representation gives the unit period lattice.
- `LiuZhu17.G22.test3` (non-example): Rep(G^c) does not retain the central characters of G removed in the quotient.

Use in Remark4.1(iii): Record the exact group of the Tannakian output without claiming a motivic crystalline realization.

Open proof/declaration closure: this is an extraction contract, not an implemented or recursively closed blueprint.

### G23 — Alternative geometric comparison illustrations

theorem; missing. The source explains an alternative route to de Rham comparison for abelian varieties using a CM elliptic curve with p split, rigidity on connected polarized moduli, and functorial cohomology; Fermat domination and Shioda–Katsura extend the argument to the indicated hypersurface cohomology.

Locator: Remark4.2.

Prerequisites: A15.

Proof route:

- Specify good reduction or finite extension for the CM curve, the connected moduli component and all tensor/subquotient operations, and read the Shioda–Katsura motivic correspondence before claiming this alternative proof complete. This is an explicitly open supplier interface.

Open proof/declaration closure: this is an extraction contract, not an implemented or recursively closed blueprint.

### T11C — Canonical unipotent cohomology comparison

theorem; missing. For every i≥0, inclusion M_K(Y)→M(geometric completed tower) induces an isomorphism in continuous Γgeom cohomology.

Locator: Proposition2.8(P2).

Prerequisites: T10, T08, P17.

Proof route:

- Take the trivial character part at a common finite field. For every nontrivial generalized character choose one γ_s−1 invertible; Hochschild–Serre kills all cohomology of that summand. P1 and P2 must be split into separate declarations in the design.

Open proof/declaration closure: this is an extraction contract, not an implemented or recursively closed blueprint.

### T16V — Higher Simpson direct-image vanishing

theorem; missing. For every Qp local system L on smooth X/k, R^qν′_*(hatL⊗OC)=0 for all q>0.

Locator: Theorem2.1(i),vanishing clause.

Prerequisites: T14, T15, P15.

Proof route:

- Glue the canonical finite-projective modules and local nilpotent fields. Vanishing is checked on the full covering basis.

Open proof/declaration closure: this is an extraction contract, not an implemented or recursively closed blueprint.

### T21D — Simpson duality

theorem; missing. H(L∨)≃H(L)∨ with the negative-transpose Higgs field and dual Galois action.

Locator: Theorem2.1(iv),dual clause.

Prerequisites: T20, T16, T16V.

Proof route:

- The unit comes from the constant local-system calculation; the dual map follows from evaluation/coevaluation and the tensor isomorphism.

Open proof/declaration closure: this is an extraction contract, not an implemented or recursively closed blueprint.

### T25H — Constant-system Hodge–Tate comparison

theorem; missing. For proper smooth X/k, H^i_et(X_Cp,Qp)⊗Cp≃⊕_(a+b=i) H^a(X,Ω^b_X)⊗k Cp(-b), with the Galois action and the source Hodge–Tate normalization.

Locator: Corollary2.2,constant-system specialization.

Prerequisites: T24.

Proof route:

- Apply the proper direct-image theorem to the structural map after retaining its local-system and finite-generation inputs. Split comparison and constant-coefficient specialization in a complete design.

Open proof/declaration closure: this is an extraction contract, not an implemented or recursively closed blueprint.

### R10V — Filtered-period higher direct-image vanishing

theorem; missing. For every allowed finite or infinite period interval [a,b], R^qν′_*(hatL⊗O_BdR^[a,b])=0 for q>0.

Locator: Theorem3.8(i),vanishing clause.

Prerequisites: R09, T16, R04, T16V.

Proof route:

- Use the graded Simpson theorem, induct on finite t-length, lift bases, and pass through the complete filtration. Verify strictness and local freeness before asserting the unbounded object.

Open proof/declaration closure: this is an extraction contract, not an implemented or recursively closed blueprint.

### A07V — Arithmetic cohomological amplitude

theorem; missing. For smooth X/k and any Qp local system L, D^i_dR(L)=0 for i≥2.

Locator: Theorem3.9(i),vanishing clause.

Prerequisites: A06, P18, A01.

Proof route:

- Finiteness makes each sheaf coherent; its integrable connection and smooth characteristic-zero base make it locally free.

Open proof/declaration closure: this is an extraction contract, not an implemented or recursively closed blueprint.

### A16R — Recovery of geometric RH from de Rham realization

theorem; missing. For a de Rham Qp local system L, RH(L)≃D^0_dR(L)hat⊗BdR compatibly with filtration, connection and Galois action.

Locator: Corollary3.12(ii).

Prerequisites: A12, R12.

Proof route:

- Apply the filtered period reconstruction and take associated graded only after proving strictness.

Open proof/declaration closure: this is an extraction contract, not an implemented or recursively closed blueprint.

### G12C — Potential crystallinity of torus reciprocity

theorem; missing. The p-adic torus reciprocity representation r(μ,ρ)_(K,p) is potentially crystalline at each place above p.

Locator: Lemma4.4,p-adic clause.

Prerequisites: G11, P02, G13.

Proof route:

- Split the torus and representation, express inertial characters as products of embeddings of a local field via its norm, and apply local algebraicity/Lubin–Tate crystallinity. Translate Conrad PropositionB.4’s arithmetic Artin convention to this paper’s geometric convention; the signs cancel by inversion of local Artin.

Open proof/declaration closure: this is an extraction contract, not an implemented or recursively closed blueprint.

### G15C — Shrinking the level after the central quotient

theorem; missing. If ρ(T^s)=1, there is a sufficiently small compact open K with ρ(K∩T(Q)^−)=1.

Locator: Lemma4.5(ii).

Prerequisites: G14.

Proof route:

- Use compactness of anisotropic torus adelic quotients and the resulting unit lattice whose Zariski closure contains T^s; conversely use discreteness of T^c(Q) in T^c(Af) and shrink the compact subgroup. Split the two implications and their arithmetic unit suppliers in the next design.

Open proof/declaration closure: this is an extraction contract, not an implemented or recursively closed blueprint.

### G17S — Special points in every component

theorem; planned. Every geometric connected component of Sh_K(G,X) contains a special point.

Locator: §4.2 proof of Theorem1.2; Milne Lemma13.5.

Existing layers: `ShimuraVarieties:V4`, `ShimuraVarieties:V7`, `ShimuraVarieties:V8`.

Prerequisites: G09, G10.

Proof route:

- Import the actual all-datum canonical-model construction and torus-model reciprocity, not only Hodge/abelian type. Density/nonemptiness comes from special-pair and Hecke theory.

Open proof/declaration closure: this is an extraction contract, not an implemented or recursively closed blueprint.

### P19 — Hodge–Tate local-system predicate

definition; missing. Set OB_HT=gr OB_dR=⊕_{j∈Z}OC(j) and D_HT(L)=ν_*(hatL⊗OB_HT). A Qp local system L is Hodge–Tate in the convention of Remark2.5 when D_HT(L) is a vector bundle on X of rank rk(L). Do not replace this family predicate by a list of pointwise Hodge–Tate stalks without a theorem.

Locator: Remark2.5, PDF8–9.

Prerequisites: P03, P08, P09.

API:

- `LiuZhu17.P19.construct` (constructor): Form the graded period sheaf, direct-sum coefficient object and pushforward.
- `LiuZhu17.P19.rankCriterion` (characterisation): State finite local freeness and the expected-rank condition, componentwise if ranks vary.
- `LiuZhu17.P19.pointComparison` (comparison): For X=Spa(k), identify the pushforward with the usual graded D_HT of the Galois representation.

Acceptance specifications (not Lean compiled):

- `LiuZhu17.P19.test1` (computation): For the constant Qp line recover one-dimensional D_HT in weight zero.
- `LiuZhu17.P19.test2` (degenerate): The zero local system has rank-zero D_HT.
- `LiuZhu17.P19.test3` (non-example): A rank-one cyclotomic analytic character χ^s with nonintegral s is not Hodge–Tate; do not promote it by forgetting integral grading.

Use in A16 and Remark2.5: Distinguishes the family Hodge–Tate predicate from pointwise and geometric H functors.

Extraction contract; source-qualified recursive proof closure remains open.

### P20 — de Rham local-system predicate and associated filtered bundle

definition; missing. On a smooth rigid k-variety, call L de Rham when hatL⊗B_dR^+ is associated to a finite locally free filtered O_X-module E with integrable connection and Griffiths transversality: after structural OB_dR extension there is a filtration- and connection-compatible isomorphism ν*E⊗OB_dR ≅ hatL⊗OB_dR. The filtration on E is separated, exhaustive and by locally direct summands. This is the local predicate used by Liu–Zhu; Scholze Definition8.3 is printed in a proper-smooth setting, whereas association itself is defined in §7.

Locator: Theorem3.9(iv), final arXiv v3; Scholze Definitions7.4–7.5,8.3.

Prerequisites: P03, P08, H01, H03.

API:

- `LiuZhu17.P20.associated` (constructor): Package the actual period comparison isomorphism and its filtration/connection diagrams.
- `LiuZhu17.P20.locality` (characterisation): Prove the predicate is local on X and independent of the integral lattice.
- `LiuZhu17.P20.reconstruct` (comparison): For a de Rham local system use A12 to recover E as D^0_dR(L), not by definition for every L.

Acceptance specifications (not Lean compiled):

- `LiuZhu17.P20.test1` (computation): The constant line corresponds to O_X with d and the weight-zero filtration.
- `LiuZhu17.P20.test2` (degenerate): Zero rank has the zero associated filtered bundle.
- `LiuZhu17.P20.test3` (non-example): Non-de-Rham point representations do not acquire associated full-rank filtered bundles merely because D_dR is defined.

Use in A11–A14: Makes the conclusion de Rham local system precise and distinguishes it from pointwise rank conditions.

Extraction contract; source-qualified recursive proof closure remains open.

### T28 — Completed-structure-sheaf cohomology as Higgs cohomology

theorem; missing. For a smooth toric affinoid X=Spa(A) over k, perfectoid K containing k∞, and local system L defined over X, the Higgs complex of the canonical unipotent module M_K(X), with degree q term M_K(X)⊗_A Ω^q_{A/k}(-q) and differential d_θ(m⊗ω)=θ(m)∧ω, computes H^*(X_proet/X_K,hatL⊗hatO_X). It is the Koszul complex of the commuting logarithmic geometric Γ generators. Integrability gives d_θ²=0; the second differential is not the curvature θ∧θ.

Locator: §2.3 after (2.9), PDF12; Proposition2.8(P2).

Prerequisites: T10, T11C, T12, P16, P17.

Proof route:

- Use the geometric Γ cohomology comparison of Proposition2.8(P2).
- Compare the Koszul operators γ_i−1 and their nilpotent logarithms through invertible polynomial factors; retain the t and differential twists.
- Identify the resulting complex with the Higgs complex; use the exterior extension of θ in each degree (E13).

Use in Local Simpson cohomology and T25: Records the explicit unnumbered comparison omitted by the original extraction.

Extraction contract; source-qualified recursive proof closure remains open.

## Independent evidence and boundaries

- Liu–Zhu final arXiv v3, all35pages including proofs and bibliography; author TeX at E01–E05,E07–E09,E12,E13.
- Scholze corrigendum, all3pages; original Definitions7.4–7.5,8.3 and Lemma8.6/proof, plus Lemma8.7 statement (not full original).
- Berger–Colmez printed309–310 and314–315; TS3 page image checked.
- KL2v1 pp20–22 definitions/analytic comparison, pp94–96 tower/ring definitions, pp109–110 strict cochains, pp111–113 through Theorem5.7.4/proof, pp130–135 toric statements/proofs. Full supplier and current-version collation not claimed.
- Conrad PropositionB.4(i) and complete proof, printed35–36; part(ii) is not imported.
- All15 cited owner-stage descriptions; full upstream AdicSpaces and HodgeStructures READMEs; both preceding HodgeStructuresPartII route briefs.
- All29 cited library declaration bodies at the stated pins, with ambient hypotheses. Reviewed audit entries at matching stages; exact-stage audit absences explicitly retained.

Reviewed atlas snapshot: `552344528e9a0207b157b44ed10cd304dac62cc3`. Matching reviewed audit rows read: ArithmeticGaloisDuality:R02.1/2; SchemeAndStackFoundations:SF.4; InverseGaloisAndArithmeticFundamentalGroups:IG.0/1; ShimuraVarieties:V4/V7/V8; BunGAndNewtonStrata:BG0/BG2; EnhancedDerivedSheaves:E2; upstream ProfiniteCohomology Layer1. Several newer adic/p-adic/derived/CR/PG stages have no exact audit entry; direct pinned-tree and owner-text checks are used, not absence-of-entry reasoning.

Name/body searches across both pinned trees and the native atlas targeted period rings/sheaves, Higgs/Griffiths/λ-connections, toric towers/decompletion, Tate–Sen, Cartan–Leray/procyclic comparison, analytic differentials/descent, rigidity, reflex norms and Shimura/Tannakian structures. Abstract cohomology, Tor, Witt, period-ring and torus carriers are credited only at their inspected declarations; they do not provide these specialized analytic statements.

The following baseline/acquisition ledger is retained from the original workers, as historical evidence, not as additional independent reading by this reviewer:

### Pinned-library and baseline evidence

Mathlib commit `082e2d37e8b0463410cdb532e111cd43d5a66174`; Tau Ceti commit `f790474821cf4256814db967cb154e7af3d0c369`; atlas input commit `eeedeb89f7d982d11c67212e63cdb8f598f4f972`. The JSON retains exact declaration statements, ambient contexts, file hashes and the input manifest. A reviewed audit led to the already present period-ring carriers, which were opened and read. No exact audit entry exists for several newer stages; that absence is not evidence of library absence.

Both pinned trees searched for Higgs, Riemann–Hilbert, Tate–Sen, decompleting and Faltings-extension terms; inspected actual BDeRham, binomial-basis, nilpotent-exponential and Kähler declarations. Imported narrowly scoped same-session declaration readings for continuous cochains, finite projectives, derived/Tor carriers and torus/Galois algebra. Read current PH, PG, T6, adic, CR.1, BG0 and canonical-model owner texts, exact layer descriptions and matching paper route briefs. The underlying period rings already exist; their arithmetic structure and structural sheaves are separate.

Initial review compared the447-input manifest with the previous444-input baseline. Read the new Feng–Yun–Zhang24 and Jannsen16 summaries and all route lists; shtuka special cycles and Kato/weight homology do not supply the ordinary p-adic RH or geometric-toric descent theorem. Kaletha16 adds rigid inner forms and real packets. Read in full both existing HodgeStructuresPartII briefs, the EG20 Cartier-flow/rigid-companion briefs and the Bhatt-et-al23 integral prismatic RH brief; their boundaries are explicitly preserved. Before publication, seven new or changed paper results were read: Benoist–Wittenberg20,Feng24,Guo–Reinecke24,Liu–Wood–ZureickBrown24,NgoDac21,Schmidt–Stix16,and Treumann–Venkatesh16. All summaries and route lists were inspected; both Guo–Reinecke prismatic/crystalline-local-system briefs were read in full. The latter explicitly consumes the Liu–Zhu de Rham criterion; it remains a crystalline extension, importing the ordinary T6 prefix here. The other topology, random-group, mod-p base-change, anabelian and function-field MZV lanes do not own geometric p-adic toric descent. The final manifest also includes every additionally consulted owner README.

- [https://arxiv.org/pdf/1602.06282v3](https://arxiv.org/pdf/1602.06282v3): 35 PDF pages, SHA256 `8b11e55bffbfb1835a6da8975272670c9465601c08640e06f3a566a459a1da79`.
- [https://www.numdam.org/item/AST_2008__319__303_0.pdf](https://www.numdam.org/item/AST_2008__319__303_0.pdf): 36 PDF pages, SHA256 `f3343b4a612c4a8961bbda5a8b4ffb5b99fb52789c30f3cf3379b4780b533b86`.
- [https://authors.library.caltech.edu/records/7hy40-ybp47/files/1602.06282.pdf?download=1](https://authors.library.caltech.edu/records/7hy40-ybp47/files/1602.06282.pdf?download=1): 35 PDF pages, SHA256 `8b11e55bffbfb1835a6da8975272670c9465601c08640e06f3a566a459a1da79`.
- [https://math.stanford.edu/~conrad/papers/locchar.pdf](https://math.stanford.edu/~conrad/papers/locchar.pdf): 37 PDF pages, SHA256 `782fe71a3c7f26ccd67943d468f73540d384e2de5d474bf8369475b8b631d9bd`.
- [https://arxiv.org/pdf/1602.06899v1](https://arxiv.org/pdf/1602.06899v1): 170 PDF pages, SHA256 `288a26ff42fe45039a6c14dff1dbdeda05fb4ea0a7b232468ac63cb71e448471`.
- [https://www.math.uni-bonn.de/people/scholze/pAdicHodgeErratum.pdf](https://www.math.uni-bonn.de/people/scholze/pAdicHodgeErratum.pdf): 3 PDF pages, SHA256 `3cfa56b9e3875c04240d97739dccd58091e41f714c101d5470b95172f73cb235`.

Acquisition is not reading coverage: the precise ranges are in `source.readSections`. The full original-source queue remains open.


## Validation and remaining gaps

Final schema, dependency, focused regression and intake checks are recorded in the independent review and handoff. No Lean file was supplied or compiled; nothing here is claimed formalized.

- **GAP01 — Published-version collation (unavailable)**: All35 pages of final arXivv3 were read; Caltech submitted copy has identical bytes. Bibliography/title/abstract match the published53-page article, but the full version of record was not obtained. Compare theorem statements, proofs and E01–E13 against the published text before claiming published-source coverage. Resolution: The Inventiones version is closed access; arXiv v3 is read and the findings refer to it.
- **GAP02 — Declaration-sized and recursive closure (open)**: T04–T06,R04,A05,A11,G01,G08,G21 and related external interfaces still combine several declarations. Fully split the original-source definitions, hypotheses and proof DAG. All current missing contracts are routed, but this is not complete mathematical closure. Resolution: Not discharged by the completion. Exact supplier hypotheses, declarations and dependencies remain extraction obligations; see independent review.
- **GAP03 — Relative p-adic Hodge suppliers (open)**: KL2v1 PDF109–113 and131–135 were read, not the full170-page supplier. Read the general perfect/imperfect ring definitions, topological tensor and analytic-cochain prerequisites; compare to the current version. Read KL1 Theorems2.6.5(a),9.2.15 and their descent/acyclicity dependencies. No v1-to-current equivalence is assumed. Resolution: Not discharged by the completion. Exact supplier hypotheses, declarations and dependencies remain extraction obligations; see independent review.
- **GAP04 — Tate–Sen and nonflat base change (open)**: BC printed309–312 and314 were read; TS3 inequality was visually confirmed. Finish the norm-controlled tensor perturbation and Neumann inverse for arbitrary finite affinoid modules, the procyclic Banach cohomology comparison, finite rational descent and completed/algebraic tensor comparison. Check all A08–A11 flatness and period-window induction details. Resolution: Not discharged by the completion. Exact supplier hypotheses, declarations and dependencies remain extraction obligations; see independent review.
- **GAP05 — Analytic geometry and singular rigidity (open)**: Read the exact Krasner/Shilov/Ax–Sen–Tate suppliers, Kiehl/finite-projective descent and coherent-connection local freeness. Pin a suitable rigid resolution theorem and write the component-incidence propagation argument for connected singular spaces; a resolution need not be connected. Resolution: Not discharged by the completion. Exact supplier hypotheses, declarations and dependencies remain extraction obligations; see independent review.
- **GAP06 — Global ramification and Shimura suppliers (open)**: Close purity and tame-specialization along vertical divisors, arithmetic section avoidance and the disconnected frame-cover normalization. Read torus unit-lattice/discreteness, all-datum canonical models, special-point density and Tannakian analytic reconstruction. ConradB4(i) was read in full, but its p-divisible/Lubin–Tate inputs and CM/Shioda–Katsura alternatives remain recursive suppliers. Resolution: Not discharged by the completion. Exact supplier hypotheses, declarations and dependencies remain extraction obligations; see independent review.
- **GAP07 — Independent source review (resolved)**: Independently review E01–E12, especially the explicit cyclotomic counterexample E06 and the ancillary G versus G^c lifting gap E10. Verify publication status and preserve the bounded errata search. No main rigidity theorem is claimed refuted. Resolution: REV-PAPER-LIU-ZHU-17 independently reviewed all twelve inherited findings, rejected E08, and added confirmed E13. Version-of-record collation remains GAP01.
- **GAP08 — Design and Lean realization (deferred)**: No Lean file was supplied or compiled for this paper issue. Candidates are proposed directions, not existing stages. Produce declaration signatures, source-qualified proofs, meaningful tests and planets in the later design; numerical and schema checks are not formalization. Resolution: Design and Lean realization are downstream work.
- **GAP09 — Ownership corrections and specialized source closure (open)**: Replace rejected routes6,9,12 with statement-matched ownership: separate Banach cochains from Tate–Sen estimates; split algebraic models from rigid resolution; route rational/real central torus arithmetic through the adelic owner rather than RG2.5 dual groups. Route15's direction is plausible but its brief requires exact KL coefficient/radius/strictness declarations and valid Tate–Sen imports. Resolution: Do not instantiate or publish design jobs from rejected routes.

## Original-source queue

- [Scholze, p-adic Hodge theory for rigid-analytic varieties](https://arxiv.org/abs/1205.3463): Structural periods, proétale coefficients, Lemmas3.18/8.6 and de Rham local-system definition; read the full original with its corrigendum. Only the stated ranges are credited as read; download or citation alone is not recursive closure.
- [Scholze, corrigendum to p-adic Hodge theory for rigid-analytic varieties](https://www.math.uni-bonn.de/people/scholze/pAdicHodgeErratum.pdf): All3 pages read: corrected covers, removed point assertions and corrected p-completed structural period tensor. Only the stated ranges are credited as read; download or citation alone is not recursive closure.
- [Kedlaya–Liu, Relative p-adic Hodge theory: Foundations](https://arxiv.org/abs/1301.0792): Perfectoid finite-projective descent and proétale vector bundles,especially2.6.5(a),9.2.15; recursive reading remains open. Only the stated ranges are credited as read; download or citation alone is not recursive closure.
- [Kedlaya–Liu, Relative p-adic Hodge theory II: Imperfect period rings, v1](https://arxiv.org/abs/1602.06899v1): PDF109–113,131–135 read for decompletion and the toric theorem; original definitions and current-version comparison remain open. Only the stated ranges are credited as read; download or citation alone is not recursive closure.
- [Berger–Colmez, Familles de représentations de de Rham et monodromie p-adique](https://www.numdam.org/item/AST_2008__319__303_0/): Printed309–312,314 read; TS3 bound is ≤, visually checked. Complete the finite-module adaptation and its cohomology comparison. Only the stated ranges are credited as read; download or citation alone is not recursive closure.
- [Conrad, Lifting global representations with local properties](https://math.stanford.edu/~conrad/papers/locchar.pdf): PDF35–36 PropositionB.4(i) and proof read: arithmetic-Artin algebraic-unit criterion. Do not silently copy its Artin sign into geometric normalization. Only the stated ranges are credited as read; download or citation alone is not recursive closure.
- [Kedlaya, Good formal structures for flat meromorphic connections I](https://arxiv.org/abs/0811.0190): §1.2 supplies local freeness of coherent modules with connection; exact analytic hypotheses and proof still need reading. Only the stated ranges are credited as read; download or citation alone is not recursive closure.
- [Bierstone–Milman, Canonical desingularization in characteristic zero](https://arxiv.org/abs/alg-geom/9508005): The resolution setting and the singular rigid/algebraic reductions require exact supplier extraction. Only the stated ranges are credited as read; download or citation alone is not recursive closure.
- [Milne, Introduction to Shimura varieties](https://www.jmilne.org/math/xnotes/svi.pdf): Reflex norms, canonical-model conventions and special points in every component; import existing Shimura owners. Only the stated ranges are credited as read; download or citation alone is not recursive closure.
- [Milne, Canonical models of mixed Shimura varieties and automorphic vector bundles](https://www.jmilne.org/math/articles/1990a.pdf): Canonical local systems and principal bundles; source predicts their de Rham comparison rather than proving algebraicity here. Only the stated ranges are credited as read; download or citation alone is not recursive closure.
- [Scholze–Weinstein, Lectures on p-adic geometry, Berkeley course notes (2014)](https://math.berkeley.edu/~jared/Math274/ScholzeLectures.pdf): This is [SW] in Liu–Zhu's bibliography, not Moduli of p-divisible groups. Locate the exact Fargues/BKF lattice classification used by Remark4.1(iii), including functorial tensor compatibility and the actual quotient structure group. Bibliographic identity checked against the complete Liu–Zhu bibliography; original lecture classification proof remains a source gap.
- [Henniart, Représentations l-adiques abéliennes](https://arxiv.org/abs/1602.06282v3): Abelian Fontaine–Mazur input cited in the introduction; locate the exact chapter statement before closing G08. Only the stated ranges are credited as read; download or citation alone is not recursive closure.

Further original suppliers named in the paper include Ax–Sen–Tate, Krasner approximation, Kiehl, Tate acyclicity, Berkovich Shilov boundary, de Jong–van der Put, Kedlaya's multivariate Robba estimates, Liu's finite-flat base-change criterion, Zariski–Nagata purity, tame Abhyankar specialization, torus unit/discreteness and Shioda–Katsura. Their exact declarations and hypotheses remain open. Contextual Faltings/Abbes–Gros comparisons are not asserted equivalent to the Liu–Zhu functor.
