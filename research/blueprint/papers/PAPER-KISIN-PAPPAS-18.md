# Kisin–Pappas: integral models with parahoric level

Complete extraction; corrected 30 September 2026 by Codex (`codex-J6LwjP`), job FIX-RT-PAPER-KISIN-PAPPAS-18, issue #5011. This repair awaits independent fix review. Original extraction: Codex (`codex-c83e7a`, checkpoint PR #1684); closing pass: Claude Code (`cc-fb70e5`); independent extraction review: REV-PAPER-KISIN-PAPPAS-18 (`cc-2aeb03`). The previous counts and blanket correction claims are superseded; their machine-readable validation history is retained.

The paper is Mark Kisin and Georgios Pappas, *Integral models of Shimura varieties with parahoric level structure*, Publications mathématiques de l’IHÉS **128** (2018), 121–218, [published PDF](https://www.numdam.org/item/10.1007/s10240-018-0100-0.pdf), [DOI](https://doi.org/10.1007/s10240-018-0100-0). It constructs tame abelian-type integral Shimura models at odd primes, their local-model geometry, prime-to-p tower extension property and, under the stated unramified hypotheses, the Kottwitz semisimple trace formula.

The earlier full read of all 98 published pages remains attributed to the extraction and closing pass. This fix re-downloaded the same checksum and selectively rechecked the affected statements and proofs. `sourceVersions` records exact read scopes and hashes, including the published sequel, Pappas–Zhu v4 and Hu’s Theorem 4.5. A complete extraction records and routes the mathematics; its design jobs must still close proofs and supplier interfaces under PROTOCOL §§3–4. Nothing here is claimed formalised.

## Current inventory and library boundary

The result has **288 items**: 14 library, 18 planned and 256 missing. Every missing item occurs in exactly one of **11 routes**. The in-file dependency graph has 725 edges and is acyclic. Of the review’s 105 isolated additions, 104 remain and are wired; the duplicate Haines–Rapoport item was merged into G01, while the distinct torus clause remains separate. There are **82 active source issues** (77 historically confirmed, 5 awaiting review). E65 was retired into E64 without renumbering E66–E80; E81–E83 are new entries.


The pinned libraries remain Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The inherited fourteen library items are narrow carriers: Witt vectors, Frobenius, group predicates, character/cocharacter lattices and pairing, Weyl chambers, Bruhat order, divided powers and abelian varieties. Their recorded statements are not enlarged by this fix.

At the pin, `Module.Grassmannian` parametrizes submodules with finite projective quotient of prescribed rank; its functor and base-change laws exist, but scheme representability is explicitly a TODO. A rank-d subbundle of rank-n V uses quotient rank n−d. The scheme and Lagrangian closed-subscheme constructions are planned at `AlgebraicModuliForArithmeticGeometry:R09.1`, in accord with AUDIT-01. `ShimuraData:D3` owns reflex-field flag descent (AUDIT-10); its export must cover the local reductive-group form required in §2, without assuming an E-rational representative of the cocharacter class. `BunGAndNewtonStrata:BG1` owns π₁ and κ (AUDIT-20), retaining the integral inertia-coinvariant target needed here.

## Corrected mathematical dependencies

The display construction now uses the canonical connection map of [KPZ26](https://doi.org/10.1017/fmp.2026.10031), Lemma 5.1.15. Constancy of Ψ means equality of its composite with this specific map to Ψ₀⊗1, as in §5.1.19. D08 imports the corrected versality assertion; D09 assumes versality; D18 uses the same corrected map and the very-good condition. Cross-paper reuse is expressed by `relatedExtractionItems` to KPZ26/F10, F11 and psi-constant-modulo-a, within the existing shared display Part II. The false normal-decomposition construction is retained only in the source-error history.

Corollaries 4.2.12–4.2.13 use a very good Hodge embedding; their connected assertion requires **𝒢=𝒢°**, not equality of Z_p-points alone. The stratification descends along a torsor through stability of its strata; Lang supplies an F_q-valued lift only in the same-field comparison. The norm-one torus example in E58 detects the distinction: Frobenius acts as −1 on Z/3, so its F_p fixed group vanishes but its F_p² obstruction does not.

The auxiliary cover in Lemma 4.6.22 retains its valid original five outputs. The corrected integral-model proof imports KPZ26 Proposition 7.2.19, which supplies a very good embedding for every abelian-type datum at odd p. The (NE) condition is needed only for the elementary connected refinement of Theorem 7.2.21. Corollary 7.2.24 removes it using additional crystalline/shtuka input; it is **Corollary 1.1.2 in the published sequel**, versus 1.1.3 in arXiv v3. S36/S37 and S44/S45/S47/S48 record these corrected routes. S46’s tower extension argument by Néron–Ogg–Shafarevich is unchanged.

Theorem 0.4 is now an item: after passing from the auxiliary local model using Proposition 2.2.7 and Remark 4.2.14, the connected adjoint diagram targets the datum’s own local model. The odd-prime, tame, fundamental-group and no-D^H-or-hyperspecial-contained hypotheses remain explicit. At small finite level, Lang yields a local-model point over the same residue field and an isomorphism of henselizations. N06 consumes this item; a merely geometric comparison does not suffice for Frobenius.

Proposition 2.3.7’s representation extension retains each centralizer division-algebra multiplicity m_j and each translated lattice-chain copy, as E29 requires. The quaternion example distinguishes dimension 4 from the erroneous multiplicity-free dimension 2. The GL chain moduli, polynomial chains and automorphism schemes, their specialization at u=p, the product/direct-sum Grassmannian embeddings and unramified base-change/descent step are separate items. The PZ criterion must specialize to the chain at y. Corollary 2.3.16 follows through closed immersions with target rank ½dim V′; these statements do not follow merely from an ambient Grassmannian functor.

Proposition 4.3.7 is supplied by small-level unramified splitting and finite étale surjective prime-to-p level change, proved from Siegel level change and normalization. Choose a normal smaller K′^p and descend through its free quotient. For unnormalized closure models, finite étaleness is asserted only with an explicit compatible full or open-and-closed pullback presentation; selecting generic components over a nonnormal base alone does not suffice. S14 uses the normalized maps. A finite étale composite alone cannot establish étaleness of an intermediate factor. The later finite-level local-model statement is not a dependency of this proposition: adding it creates a cycle and contradicts its local-model-free proof route.

For Theorem 4.7.11, K^p is sufficiently small and Frobenius is **geometric**. At a GL₂ Iwahori crossing the trace is 1−q; arithmetic Frobenius would give 1−q⁻¹. N10 transports Bernstein functions as well as convolution constants, keeping μ↔μ′, q^{1/2} and normalized Haar measures fixed. The Iwahori Bernstein centre and its hyperspecial map are shared upstream with Venkatesh’s item29; the parahoric Part II imports them and keeps its extra parahoric-centre map and equal/mixed-characteristic comparison. Coefficient-ring generality remains a stated design obligation, not an unchecked invertible-volume assumption.

The finite-residue-field diagnostic for Lemma 1.4.6 now states only cd_ℓ=3 for ℓ≠p, which is what [Hu 2013, Theorem4.5](https://msp.org/ant/2013/7-8/ant-v7-n8-p06-s.pdf) proves. The split G₂/Pfister-form example disproves the intermediate field-H¹ vanishing, but does not decide the lemma’s conclusion over D[1/p]. Step2 of the proof uses algebraically closed k, making the tame splitting extension cyclic; finite k is handled separately by descent.

## Routes and design obligations

The existing candidate identities are retained. Routes 1–10 keep their original numbers; route11 is new. Changed briefs and the new route require independent fix review and maintainer reconciliation of the old numeric route approvals. The existing extraction review file has not been edited.

### 1. ReductiveGroupsPartII

40 items; source. The existing valued-group layers own the stated building, fixer and integral-group applications, not a second algebraic fundamental group or Kottwitz map. Import π₁(G) and the integral inertia-coinvariant κ_G from BunGAndNewtonStrata:BG1. Place its consumers G01, kottwitz-kernel-and-parahoric-membership and S28 in RG2.3 (not RG2.0a or RG2.1, which precede BG1). BG1 is incomparable with RG2.3 in the current stage graph. Lang is a shared unresolved owner contract, provisionally here; reconcile A02 with LIPNOWSKI-TSIMERMAN-18/lang-theorem, KISIN-ZHOU-25/R14 and KISIN-17/lang-lemma-integral (ET.0). Choose one owner and import it. Do not rebuild upstream algebraic reductive groups, roots or pinning.

Stages: `ReductiveGroupsPartII:RG2.0a`, `ReductiveGroupsPartII:RG2.1`, `ReductiveGroupsPartII:RG2.2`, `ReductiveGroupsPartII:RG2.3`, `ReductiveGroupsPartII:RG2.4`.

### 2. SchemeAndStackFoundations

4 items; source. Generic Hartogs extension, affine arithmetic descent and module torsor twisting use the existing scheme/descent owner. Import the earlier CESNAVICIUS-22 torsor and patching items before adding statement-specific adapters.

Stages: `SchemeAndStackFoundations:SF.0`, `SchemeAndStackFoundations:SF.1`.

### 3. AbelianSchemesAndArithmeticModuli

8 items; source. The A-isogeny twist, weak polarization and structured Serre–Tate comparison extend the existing arithmetic Hom/dual/deformation APIs. General torsor descent stays in SF.1; integral Shimura actions are consumers.

Stages: `AbelianSchemesAndArithmeticModuli:A2`, `AbelianSchemesAndArithmeticModuli:A4`, `AbelianSchemesAndArithmeticModuli:A6`.

### 4. LefschetzPencilsAndVanishingCycles

2 items; source. LPV owns the actual nearby-cycle functor and its inertia/monodromy filtration. Add semisimple trace on finite-inertia graded pieces with exact-triangle additivity; import the established étale trace and adic-realization suppliers. No second nearby-cycle carrier is created.

Stages: `LefschetzPencilsAndVanishingCycles:LPV.0`, `LefschetzPencilsAndVanishingCycles:LPV.1`.

### 5. ReductiveGroupsIntegralRepresentationsPartII

9 items; part-ii. Identical candidate owner to KPZ26; these are the original minuscule-lattice inputs it consumes, not a new parallel representation roadmap.

Reuse the KPZ26 candidate beginning after Reductive groups (tauceti:TauCetiRoadmap/ReductiveGroups), especially integral pinned groups Layer9, and Root systems (tauceti:TauCetiRoadmap/RepresentationTheory/RootSystems) for the root/weight carrier. Add KP18 minuscule integral highest-weight lattices, irreducible reduction (Jantzen II2.15), homothety of stable lattices, rank-one root strings, projective Schur descent through a division algebra and explicit equal-characteristic twisted Weyl data. Prove Proposition1.2.10 with its split irreducible characteristic-zero hypotheses; supply Proposition1.3.3 through the local-group owner rather than own buildings here. Do not assume arbitrary characteristic-p representations semisimple or replace integral divided powers by rational operators. Resolve the Satake primary symplectic cases and integral root-action source gates before closing this branch. Correction: the map (1.2.23)–(1.2.24) of §1.2.22 must use the product over the K-embeddings of K_1 ∩ K^ur when K_1/K is not totally ramified (E13), as §1.3 already does.

### 6. ReductiveGroupsPartIIGrothendieckSerre

18 items; part-ii. Consolidates a new parahoric purity branch with the existing arithmetic-torsor candidate and proposes a broader title. It neither claims the existing GS theorem covers it nor adds a second generic torsor carrier.

Reuse the CESNAVICIUS-22 arithmetic-torsor candidate, beginning with Reductive groups (tauceti:TauCetiRoadmap/ReductiveGroups). Add a distinct punctured-disc branch: for D=Spec W(k)[[u]], k finite or an algebraic closure of Fp, and connected parahoric G with tame reductive generic fiber without E8, prove H1_fppf(D minus closed point,G)=1 (KP18 Proposition1.4.3). This is not a specialization of the candidate’s regular-semilocal quasi-split REDUCTIVE Grothendieck–Serre theorem: the parahoric need not be reductive over D. Import ReductiveGroupsPartII RG2.1–4 for fixers/root decompositions, SchemeAndStackFoundations SF.0–2/4 for descent, cohomology, Hartogs and patching, and FiniteFlatGroupsAndIntegralPadicHodgeTheory for the Witt coefficient carrier. Split induced-torus H1/H2, flasque cyclic resolution, Serre-II generic triviality over algebraically closed k, completed-boundary triviality, the double-coset factorization and finite-k descent into separate layers. The dimension-two fraction-field argument is only used over algebraically closed k; finite k has prime-to-p cd3. Read the exact Gabber/Kato/Gille/Bayer-Fluckiger–Parimala and Brauer sources and close the no-E8 hypotheses. Export the actual trivialization and tensor-isomorphism extension to display consumers. Corrections: Lemma 1.4.6 holds as proved only for k algebraically closed, the only case used (E17); Step 3 of Proposition 1.4.3 must justify Bruhat–Tits theory over ℰ, whose residue field is imperfect (E21).

### 7. GeometricSatakeLocalModelsPartII

37 items; part-ii. Reuses the established integral local-model owner; its later degeneration/central-sheaf branch supplies this paper’s extra arithmetic application without recreating LPV or classical Hecke algebras.

Reuse GeometricSatakeLocalModelsPartII from Kisin–Zhou25/KPZ26, beginning with GeometricSatakeAndFusion. The missing algebraic LG/L⁺G over arbitrary fields and parahoric twisted affine flag varieties are explicit inputs P05 and twisted-affine-flag; GS.1 does not cover their full scope. Before design, reconcile a common owner upstream of GS.1, ET.2b and this Part II. Never make those upstream layers import a downstream Part II. Import ReductiveGroupsPartII RG2.2/RG2.3 for lattice-chain buildings/fixers and ReductiveGroupsIntegralRepresentationsPartII for integral representations. Add the original tame Pappas–Zhu closure, normality under p∤π1derived, geometrically reduced special fiber, normal Cohen–Macaulay Schubert closures and normality after every finite reflex extension; then central/derived-isogeny comparisons, symplectic chain and total-lattice good embeddings. Prove KP18 Theorem2.1.2, Propositions2.2.4/2.2.7/2.3.7 and Corollary2.3.16 with the half-rank flag convention. Add a later nearby-cycle branch importing LPV.0–1 and SmoothRepresentationsOfLocalGroups SR.1/SR.4 plus SmoothRepresentationsPartIIParahoricCenters: prove splitting-field unipotence, very-special triviality, centrality and Bernstein characterization of the local-model trace. Read PZ published10.5/10.9/10.12/10.14/10.16 (v4 §9 numbering) and its Wakimoto/central-sheaf inputs. Keep the raw constant sheaf distinct from IC[d](d/2), and make Haar, Frobenius and shift conventions explicit. Shimura test-function formulas are applications in the integral Shimura owner. Corrections: the proof of Proposition 2.3.7 must account for the degrees m_j of the centralizer division algebras (E29); in §2.3.15 the Grassmannian has rank ½·dim V′ (E31), and Corollary 2.3.16 is deduced through the composite of closed immersions (E33). Explicitly construct the GL minuscule lattice-chain model, periodic O[u]-chains and their automorphism schemes, the u↦p specialization to Λ_y^•, and the closed product/direct-sum Grassmannian embedding with rank ½dim V′. Prove unramified base change to Q_p^ur and faithfully flat descent of the closed immersion. Import R09.1 Grassmannian and Lagrangian representability and ShimuraData D3 reflex-field flag descent with the local-group generality stated in reflex-flag-variety; use Mathlib’s quotient-rank Grassmannian functor as the partial baseline. In PZ Prop.8.1 require the chain to specialize to Λ_y^•. Route 10 imports the shared Iwahori centre from route 11; do not duplicate it here.

### 8. FiniteFlatGroupsWithTensorsPartII

52 items; part-ii. Same tensor/display owner as the two preceding extractions. Original KP18 proofs and their corrections are linked, not counted as independently covered by a carrier stage.

Reuse the Kisin–Zhou25/KPZ26 candidate, beginning with FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.2/R07.4/R07.6. Import Witt vectors and divided powers from the pinned baseline, local-model rings from GeometricSatakeLocalModelsPartII, parahoric purity from ReductiveGroupsPartIIGrothendieckSerre, and generic Hartogs/descent from SchemeAndStackFoundations. Develop KP18 §3 with algebraically closed k in §§3.2–3.3, contravariant Dieudonné variance and LINEAR dual Tate modules. Replace Lemma3.1.9’s invalid normal-decomposition connection by KPZ26 §5.1.15–19’s relative-frame τ and residual-to-universal canonical map; require very-good first-order tensor preservation in3.2.12. Prove the corrected versality, tangent lifting, rational Frobenius section in its lattice-induced topology, integral tensor torsors, four tangent criteria and Proposition3.2.17/3.3.13 factorization. Split Breuil–Kisin tensor/exactness/comparison statements, exactness only on D×, Wintenberger Kottwitz image and Broshi tensor torsors. Keep Raynaud–Gruson flatness, pointwise integrality, weak-admissibility strictness and interpolation continuity as explicit proof inputs. Corrections: in Lemma 3.2.9 only φ(E([π])) is a nonzerodivisor (E41); Corollary 3.2.11 must show membership in Zink's Ŵ(R_G), not only W(R_G) (E43); the proof of Proposition 3.2.17 needs the stated completion argument (E46); Proposition 3.3.13 needs the étale tensors of the new deformation to match (E51). Coalesce D08, psi-constant-mod-a and kp18-lemma-3-1-9 with KPZ26/F10, /F11 and /psi-constant-modulo-a; D18 also uses KPZ26/E04. The in-file graph points only to in-file prerequisites, with cross-paper identity carried by relatedExtractionItems. Never revive the deleted standalone item for the sequel’s correction.

### 9. ShimuraVarietiesHondaTatePartII

84 items; part-ii. The established integral Shimura candidate owns global descent and arithmetic applications. Canonical all-case results from the sequel remain a later input, never retroactively attributed to the original paper.

Reuse the candidate established by KMPS22, Kisin–Zhou25 and KPZ26; its first prerequisite is ShimuraVarieties V1/V6/V8. Import the local-model, display, parahoric, abelian-scheme twisting and LPV/Hecke owners above. Construct the prescribed Siegel parahoric moduli before normalization (PEL M2 good-level smoothness is insufficient), absolute Hodge realizations, corrected adapted deformation rings, integral tensor frames, smooth local-model diagrams and connected-parahoric finite étale normalization. Develop the arithmetic star products, component Galois extensions, central twisting and free quotient descent including potentially infinite kernel and jKp°j^-1 component levels. Prove Lemma4.6.22’s five separate auxiliary-cover outputs only for abelian type, retaining KP18’s original valid cover statement and importing KPZ26 Proposition 7.2.19 for the very-good cover in the corrected proof; prove Theorem4.6.23’s five parts separately and Corollary4.6.26. The DVR extension property is at the full prime-to-p tower. General independence and connected G°-torsor reduction are conjectures in this source, whereas Proposition4.6.28 proves independence only for very special Kp and absolutely simple Gad. Finally prove Corollary4.7.3 and Theorem4.7.11: unramified G, p>2, p∤π1derived, and no D^H or hyperspecial-contained parahoric give at sufficiently small K^p, with geometric Frobenius, Trss(Frob_y,RΨQell)=q^(d/2)z_(μ_h,r)(w). Same-field henselization is required for Frobenius, unlike the geometric inertia comparison. Corrections: Corollaries 4.2.12 (second sentence) and 4.2.13 need 𝒢 = 𝒢°, not only K_p = K_p° (E58); in Lemma 4.6.22(3) the field K must be chosen as F·K_0 with p split in K_0 for every prime of E_2 above p to split (E70). The very-good hypothesis applies to S36’s local geometry, S37’s smoothness and S44/S45; S46’s extension-property argument remains independent of it. For S47/S48 and Theorem0.4 use KPZ26 Theorem7.2.21 and Corollary7.2.24: (NE) limits the elementary connected reduction, not the existence of very good covers. Exceptional type A requires the corollary’s additional shtuka/crystalline compatibility input; this is Corollary1.1.2 in the published sequel (1.1.3 in v3). Add the intrinsic connected diagram (Theorem0.4, Remark4.6.25(c)) and make trace transfer consume it. Prove prime-to-p finite étale surjective level change and the small-level unramified splitting before descending Proposition4.3.7 via a free quotient. The later finite-level local-geometry item is not an input to that proposition. N10 must transport z′ to z with identical Bernstein, q^{1/2} and measure conventions.

### 10. SmoothRepresentationsPartIIParahoricCenters

3 items; part-ii. Retains the missing parahoric-centre extension and equal/mixed-characteristic transfer. The Iwahori Bernstein centre and map to the hyperspecial algebra have one upstream source owner (route 11), avoiding a cycle through Venkatesh 30/31/67.

Begin after SmoothRepresentationsOfLocalGroups (Smooth representations of local groups). Import its SR.1 convolution/corners and the shared Iwahori Bernstein presentation, centre and hyperspecial comparison assigned by route 11 together with Venkatesh item 29 to SR.1/SR.4. Prove the extension from the Iwahori centre to the parahoric centre by normalized e_P (Haines2009 Theorem3.1.1), compose with the imported hyperspecial comparison, and establish change-of-parahoric compatibility. Specify the coefficient ring/field, the invertibility of q and averaging volumes, q^{1/2}, relative Weyl and Frobenius data. KP18 uses Q̄_ℓ; the modular split specialization remains with Venkatesh’s upstream owner. Import ReductiveGroupsPartII RG2.4–RG2.5 for matching unramified valued-root data. Define z_(μ,r) with geometric Frobenius, cocharacter sign and hyperspecial minuscule value q^(−d/2)1_(KμK). Prove the equal/mixed-characteristic algebra isomorphism sends z′_(μ′,r) to z_(μ,r), not only that the coset sets correspond. Export N10–N12 to local-model central sheaves without depending on the Shimura trace formula. Coalesce the parahoric part with PAPER-ZHU-17 route14; the unitary-spherical candidate does not supply this interface. Close Haines/Lusztig proof inputs in the owner’s blueprint.

### 11. SmoothRepresentationsOfLocalGroups

1 items; source. Shared upstream owner with the accepted PAPER-VENKATESH-19 source route (item 29 and consumers 30/31/67). Extend its Iwahori Bernstein presentation/centre and hyperspecial comparison to the exact unramified and coefficient hypotheses needed here. The general coefficient contract is a proof obligation, not a current library or layer claim. Route 10 imports this interface and keeps the parahoric-centre extension. Reconcile PAPER-ZHU-17 route 14 and the Venkatesh brief without making SR import its downstream Part II.

Stages: `SmoothRepresentationsOfLocalGroups:SR.1`, `SmoothRepresentationsOfLocalGroups:SR.4`.

## Reconciliation outside this job’s files

- Choose one Lang owner across RG2.3 and ET.0, reconciling this paper, Lipnowski–Tsimerman18, Kisin–Zhou25/R14 and Kisin17/lang-lemma-integral. These stages are incomparable in the inspected graph. The generic theorem should not acquire a dependency on an integral Shimura application.
- Keep BG1 imports in the RG2.3 consumers identified in route1. RG2.0a and RG2.1 already precede BG1 and must not import it. An eventual common earlier κ owner may avoid unnecessary Fargues–Fontaine prerequisites, but requires maintainer restructuring.
- Reconcile a common algebraic loop-Grassmannian owner upstream of GS.1, ET.2b and the local-model Part II; repair KPZ26/P05’s matching overclaim. The current route records the missing obligation, not a permitted reverse import.
- Coalesce the new SR.1/SR.4 source route with Venkatesh’s accepted item29 and its consumers 30/31/67. Update Zhu17 route14 to import that interface and retain the parahoric extension. The other extractions are not authorized deliverables of this job.
- Reconcile route approvals and generated source-issue records after independent review: E3 and E17 have revised active entries, E65 is a retired duplicate, and E81–E83 are unreviewed. Queue and generated atlas/register files are maintained by intake.

## Item index

Statements, prerequisites, source locators and planning contracts are in the companion JSON. The fixes report includes the complete dependency matrix for the retained review additions.

| ID suffix | Kind | Status | Name |
|---|---|---|---|
| L01 | definition | library | Witt-vector coefficient carrier |
| L02 | construction | library | Frobenius on the Witt fraction field |
| L06 | definition | library | Connected reductive group predicate |
| L07 | definition | library | Algebraic torus predicate |
| L08 | definition | library | Geometric character lattice |
| L09 | definition | library | Cocharacter lattice and pairing |
| L10 | theorem | library | Perfect character-cocharacter pairing |
| L11 | definition | library | Closed dominant chamber of a root pairing |
| L12 | theorem | library | Unique dominant representative in a Weyl orbit |
| L13 | definition | library | Abelian variety over a field |
| L15 | definition | library | Divided-power structure |
| L16 | theorem | library | Finite free cocharacter lattice |
| L17 | theorem | library | Galois invariance of the pairing |
| L18 | definition | library | Coxeter Bruhat order |
| P01 | theorem | planned | Extended buildings and facet fixers |
| P02 | theorem | planned | Bruhat–Tits smooth stabilizers and connected parahorics |
| P03 | theorem | planned | Affine Weil restriction |
| P04 | theorem | planned | Pinned root subgroup maps |
| P05 | theorem | missing | Algebraic affine Grassmannian over an arbitrary field |
| P08 | theorem | planned | Dieudonné and nilpotent deformation theory |
| P09 | theorem | planned | Integral p-divisible group classification |
| P10 | theorem | planned | Formal moduli and Artin approximation |
| P12 | theorem | planned | Siegel and PEL good-level moduli |
| P13 | theorem | planned | Canonical generic Shimura models |
| G01 | theorem | missing | Connected parahoric as the Kottwitz kernel in the fixer |
| G02 | theorem | missing | Extension of a central quotient to fixer models |
| G03 | theorem | missing | Smooth central kernel in connected parahorics |
| G04 | theorem | missing | Exact central quotient of connected parahorics |
| G05 | construction | missing | Periodic graded lattice chain |
| G06 | construction | missing | Almost self-dual symplectic chain |
| G07 | theorem | missing | Diagonal chain stabilizer is a closed immersion |
| G08 | theorem | missing | Based toral building map |
| G09 | theorem | missing | Quotient group preserves the chosen lattice |
| R01 | construction | missing | Minuscule representation in characteristic zero |
| R02 | theorem | missing | Irreducible reduction of an integral minuscule lattice |
| R03 | theorem | missing | Stable minuscule lattices are homothetic |
| G10 | theorem | missing | Uniqueness up to real translation |
| R04 | construction | missing | Integral highest-weight lattice with pinning |
| R05 | construction | missing | Tame projective descent of an irreducible representation |
| G11 | theorem | missing | Galois-equivariant minuscule building map |
| R06 | construction | missing | Equal-characteristic twisted minuscule representation data |
| R07 | theorem | missing | Rank-one minuscule root strings |
| G12 | theorem | missing | Split minuscule fixer immersion |
| G13 | theorem | missing | Tame fixed fixer comparison |
| G14 | theorem | missing | Tame faithful minuscule fixer immersion |
| G15 | theorem | missing | Equal-characteristic fixer immersion |
| U01 | construction | missing | Punctured Witt disc and p-adic boundary |
| U02 | theorem | missing | Induced-torus H1 vanishing |
| U03 | theorem | missing | Induced-torus H2 restriction vanishes |
| U04 | theorem | missing | Cohomological dimension for the algebraically closed case |
| U05 | theorem | missing | Simply connected torsors on the generic puncture |
| U06 | construction | missing | Flasque resolution for the torsor argument |
| U07 | theorem | missing | Triviality over the completed boundary |
| U08 | theorem | missing | Triviality on D[1/p] for the parahoric torsor |
| U09 | theorem | missing | Witt boundary double-coset factorization |
| U10 | theorem | missing | Parahoric torsor purity over algebraically closed k |
| U11 | theorem | missing | Finite-residue-field descent of parahoric purity |
| U12 | theorem | missing | Hartogs extension of affine torsor descent data |
| U13 | theorem | missing | Vector-bundle and chain proof in the split hyperspecial-contained case |
| M01 | construction | missing | Pappas–Zhu polynomial group and global Grassmannian |
| M02 | construction | missing | Minuscule flat local model |
| M03 | theorem | missing | Normal local model |
| M04 | theorem | missing | Reduced special fiber and normal Cohen–Macaulay strata |
| M05 | theorem | missing | Normality after finite reflex extension |
| M06 | theorem | missing | Central quotient map of polynomial models |
| M07 | theorem | missing | Adjoint local-model normalization |
| M08 | theorem | missing | Derived-isogeny comparison of local models |
| M09 | theorem | missing | Symplectic factorization of the minuscule building map |
| M10 | theorem | missing | Polynomial extension of the lattice-chain representation |
| M11 | theorem | missing | Closed symplectic local-model embedding |
| M12 | construction | missing | Polarized total lattice |
| M13 | theorem | missing | Closed ordinary-Grassmannian local-model embedding |
| D01 | construction | missing | Zink coefficient frame |
| D02 | construction | missing | Dieudonné display |
| D03 | theorem | missing | Normal decomposition and linearized display map |
| D04 | theorem | missing | Display base change compatibility |
| D05 | theorem | missing | Dieudonné antiequivalence with displays |
| D06 | construction | missing | Universal filtered deformation pair |
| D08 | theorem | missing | Versal display deformation with the corrected first-order condition |
| D09 | theorem | missing | Tangent lifting over a DVR |
| D10 | theorem | missing | Canonical rational Frobenius-equivariant section |
| D11 | theorem | missing | Filtered comparison at a DVR point |
| D12 | construction | missing | Integral tensor deformation datum |
| D13 | construction | missing | Tensor orbit deformation ring |
| D14 | construction | missing | Breuil–Kisin filtration lattice at a DVR point |
| D15 | theorem | missing | Tensor torsor of the filtration lattice |
| D16 | theorem | missing | Integral tensors in the tilde lattice |
| D17 | theorem | missing | Global integral tensor torsor over normal R_G |
| D18 | theorem | missing | Tensor-preserving versal display with very-good input |
| D19 | theorem | missing | Canonical Frobenius section preserves tensors |
| D20 | theorem | missing | Four equivalent infinitesimal adaptedness criteria |
| D21 | theorem | missing | Adapted DVR deformation factors through R_G |
| D22 | construction | missing | Integral Breuil–Kisin module |
| D23 | theorem | missing | Fully faithful integral crystalline tensor functor |
| D24 | theorem | missing | Crystalline and de Rham realizations of the Kisin module |
| D25 | theorem | missing | p-divisible Dieudonné comparison and dual convention |
| D26 | theorem | missing | Galois image lies in the Kottwitz kernel |
| D27 | theorem | missing | Tensor trivialization on the Kisin module |
| D28 | theorem | missing | Tame no-E8 full-fixer tensor comparison |
| D29 | theorem | missing | Integral crystalline and de Rham tensors of a p-divisible group |
| D30 | theorem | missing | Cocharacter splitting of the integral Hodge filtration |
| D31 | theorem | missing | Étale tensor adaptedness criterion |
| S01 | construction | missing | Hodge normalization model |
| S02 | theorem | missing | Absolute Hodge tensors and their realizations |
| S03 | theorem | missing | Completed component of the Hodge closure |
| S04 | theorem | missing | Completed normalized Hodge local rings |
| S05 | theorem | missing | Integral de Rham tensors |
| S06 | construction | missing | Hodge local-model diagram |
| S07 | theorem | missing | Smoothness of the Hodge local-model map |
| S08 | theorem | missing | Reduced Hodge special fiber and admissible stratification |
| S09 | theorem | missing | Same-field henselization comparison |
| S10 | theorem | missing | Reflex norm of local units |
| S11 | construction | missing | Temporary global central-kernel condition |
| S12 | theorem | missing | Small-level rational stabilizers are connected |
| S13 | construction | missing | Connected-parahoric normalization |
| S14 | theorem | missing | Connected normalization is finite étale |
| S15 | theorem | missing | Unramified field of connected components |
| S16 | construction | missing | Module twist by an affine torsor |
| S17 | theorem | missing | Faithfully flat twist descent |
| S18 | construction | missing | Abelian scheme twist up to A-isogeny |
| S19 | theorem | missing | Representability of the abelian twist |
| S20 | construction | missing | Weak polarization and character-compatible twist |
| S21 | theorem | missing | Integral central action on the universal abelian scheme |
| S22 | theorem | missing | Twisted prime-to-p level descends |
| S23 | construction | missing | Arithmetic star product |
| S24 | construction | missing | Arithmetic component-action groups |
| S25 | theorem | missing | Adjoint twisting action on the integral model |
| S26 | theorem | missing | Lifted action on the adjoint frame torsor |
| S27 | theorem | missing | Descent of a rational model to Z(p) |
| S28 | theorem | missing | Derived closure and adjoint neutral quotient |
| S29 | theorem | missing | Arithmetic completion depends on the derived group |
| S30 | construction | missing | Galois component-stabilizer extension |
| S31 | theorem | missing | Exact stabilizer extension and amalgamation identity |
| S32 | theorem | missing | Derived-cover maps of Galois extensions |
| S33 | theorem | missing | Cartesian arithmetic component square |
| S34 | construction | missing | Component-indexed induced Shimura model |
| S35 | theorem | missing | Freeness of the derived-cover descent kernel |
| S36 | theorem | missing | Integral abelian-type descent and local geometry |
| S37 | theorem | missing | Descent of the adjoint local-model diagram |
| S38 | construction | missing | Auxiliary Hodge cover of an abelian-type datum |
| S39 | theorem | missing | Cover fundamental group and localization condition |
| S40 | theorem | missing | Tame cover splitting |
| S41 | theorem | missing | Reflex-prime splitting in the composite field |
| S42 | theorem | missing | Connected cover center |
| S43 | theorem | missing | Torsion-free abelian coinvariants of the cover |
| S44 | theorem | missing | Tame abelian-type integral model with auxiliary local model |
| S45 | theorem | missing | Intrinsic local-model comparison |
| S46 | theorem | missing | DVR extension at full prime-to-p tower |
| S47 | theorem | missing | Connected adjoint diagram without D-quaternionic factors |
| S48 | theorem | missing | Connected diagram in the unramified fixer case |
| S49 | theorem | missing | Reduced abelian-type special fiber |
| S50 | theorem | missing | Normal special fiber at a geometric special vertex |
| S51 | theorem | missing | Choice independence at a very special simple datum |
| N01 | construction | planned | Nearby cycles with geometric Galois action |
| N02 | construction | missing | Semisimple Frobenius trace |
| N03 | theorem | missing | Local-model splitting-field inertia is unipotent |
| N04 | theorem | missing | Very-special local-model inertia is trivial |
| N05 | theorem | missing | Shimura nearby-cycle inertia |
| N06 | theorem | missing | Frobenius-compatible local trace transfer |
| N07 | construction | planned | Parahoric Hecke algebra |
| N08 | construction | missing | Local-model trace function on equal-characteristic cosets |
| N09 | theorem | missing | Centrality of the nearby-cycle trace function |
| N10 | theorem | missing | Unramified equal/mixed-characteristic Hecke comparison |
| N11 | construction | missing | Bernstein central function for a minuscule class |
| N12 | theorem | missing | Bernstein isomorphism between parahoric and spherical centers |
| N13 | theorem | missing | Unique local-model central trace with prescribed spherical image |
| N14 | theorem | missing | Kottwitz test-function formula for the integral Shimura model |
| A01 | theorem | missing | Siegel moduli with the chosen p-lattice chain |
| A02 | theorem | missing | Lang torsor triviality over a finite field |
| A03 | theorem | planned | Serre–Tate comparison with structures |
| bt-extension-criterion-1-7-6 | theorem | missing | Bruhat–Tits extension criterion for smooth models |
| bt-big-cell-isomorphism-1-2-13 | theorem | missing | A group homomorphism that is an isomorphism on the big cell is an isomorphism |
| anantharaman-quotient | theorem | missing | Representability of quotients over a DVR |
| bt-quasisplit-parahoric-structure | theorem | missing | Big-cell structure of quasi-split parahoric group schemes |
| steinberg-quasi-split | theorem | missing | Steinberg's theorem and tame cyclicity |
| edixhoven-tame-fixed-points | theorem | missing | Tame fixed points of Weil restrictions are smooth; Néron models by descent |
| pappas-rapoport-torus-kernel | theorem | missing | Exactness of connected Néron models for tame tori |
| landvogt-quotient-map | theorem | missing | Landvogt's canonical building map for quotient maps |
| landvogt-toral-embedding | theorem | missing | Landvogt: existence and uniqueness of equivariant toral embeddings |
| landvogt-levi-product | theorem | missing | Buildings of products and Levi embeddings |
| remark-1-2-7-translated-maps | construction | missing | Translated and multi-graded toral maps; Levi factorisation |
| symplectic-total-lattice | construction | missing | Symplectic total lattice Λ' in V' |
| tame-twisted-form-presentation | construction | missing | Twisted-form presentation of a tamely split group |
| tame-descent-buildings | theorem | missing | Tame Galois descent of buildings |
| tits-irreducible-representations | theorem | missing | Tits' description of irreducible representations over non-closed fields |
| minuscule-weights-multiplicity-one | theorem | missing | Weights of minuscule representations |
| closed-immersion-criterion-via-schematic-closure | theorem | missing | Reduction of Proposition 1.3.3 to smoothness of a schematic closure |
| weight-splitting-of-image-lattice-chain | theorem | missing | The lattice chain at ι(x) splits into weight lines |
| bt-big-cell-smoothness-criterion | theorem | missing | Big-cell smoothness criterion for schematic closures (Bruhat–Tits II, 2.2.3 and 2.2.5; cited) |
| smooth-closure-of-root-groups-common-apartment | theorem | missing | Root-group closures for lattices in a common apartment are smooth (Bruhat–Tits [12], 3.6 and 3.9(2); cited) |
| torus-closure-with-maximal-bounded-points-is-smooth | theorem | missing | Smoothness of a torus closure with maximal bounded integral points (Prasad–Yu [61, Lemma 4.1]; cited) |
| tame-reduction-diagram-1-3-11 | construction | missing | Comparison of ι with the split-field Levi maps (1.3.11)–(1.3.12) |
| gille-serre-conjecture-II-quasi-split | theorem | missing | Serre's Conjecture II for quasi-split groups without E8 factors (Gille [28]; cited) |
| parahoric-flasque-sequence-1-4-9 | theorem | missing | Parahoric lift of the flasque resolution and the H^2 obstruction (1.4.9) |
| rank-one-parahoric-coset-factorization | theorem | missing | Rank-one parahoric cosets over O_ℰ and W[[u]] (1.4.10)–(1.4.12) |
| products-of-rank-one-parahorics-in-image | theorem | missing | G(ℰ)^1 lies in G(W[[u]][1/p])·𝒢(O_ℰ) |
| witt-boundary-torus-decomposition | theorem | missing | G(ℰ) = T(K_0)·G(ℰ)^1 (1.4.13)–(1.4.14) |
| fpqc-gluing-on-punctured-disc | theorem | missing | Gluing sections along D[1/p] ⊔ Spec O_ℰ → D× (Grothendieck fpqc descent; Gille [29, Appendix]; cited) |
| minuscule-schubert-variety-is-flag-variety | theorem | missing | The minuscule Schubert variety S_μ is the flag variety X_μ |
| normality-from-reduced-special-fibre | theorem | missing | Normality from a normal generic fibre and a reduced special fibre (as in [59, Prop. 9.2]; cited) |
| quasi-split-polynomial-group-construction | construction | missing | Explicit construction of G̲ and 𝒢̲ for quasi-split G (2.1.5)–(2.1.6) |
| adjoint-local-model-morphism | construction | missing | The adjoint morphism of local models ad_* (§2.2.3) |
| adjoint-grassmannian-map-quasi-finite | theorem | missing | Special-fibre description and quasi-finiteness of ad_* ⊗ k ([59, Cor. 6.6], [57, §6]; cited) |
| derived-parahoric-quotient-2-2-6 | theorem | missing | Derived parahorics under a central isogeny (2.2.6) |
| local-hodge-embedding | definition | missing | Local Hodge embedding |
| hodge-embedding-toral-data | construction | missing | Data of §2.3.1 and the toral embeddings ι and s |
| symplectic-parahoric-closed-immersions | theorem | missing | Closed immersions 𝒢_x → 𝒢𝒮𝒫_z → 𝒢ℒ_y |
| gortz-symplectic-local-model | theorem | missing | Symplectic lattice-chain local model and the embedding (2.3.6) (cited) |
| pz-prop-8-1-criterion | theorem | missing | Pappas–Zhu criterion for closed immersions of local models (cited) |
| seshadri-projective-free | theorem | missing | Projective modules over O[v] are free (cited) |
| satake-symplectic-structure | theorem | missing | Satake's structure theorem for symplectic representations (cited) |
| normal-decomposition | definition | missing | Normal decomposition and M̃_1 |
| display-base-change-and-deformation | construction | missing | Base change of Dieudonné displays; deformations |
| kp18-lemma-3-1-9 | theorem | missing | Canonical first-order comparison, corrected import |
| psi-constant-mod-a | definition | missing | Ψ constant modulo a_R |
| zink-thm-3-extension | theorem | missing | Extension of Φ_1 over a divided-power thickening (cited) |
| zink-thm-4-deformations | theorem | missing | Deformations of Dieudonné displays along divided-power thickenings (cited) |
| deformation-functor-notation | definition | missing | Def(𝒢_S; S'), Def(f; S') and dual numbers |
| breuil-prop-5-1-3 | theorem | missing | Breuil's comparison for p-divisible groups over O_K (cited) |
| kisin10-lemma-1-4-5-g-splitting | theorem | missing | G-splitting of filtrations on weakly admissible modules (cited, [43, Lemma 1.4.5]) |
| component-group-sequence-3-2-7 | theorem | missing | Component-group sequence; reduction of the tensor torsor to 𝒢° |
| de-jong-integrality-normal-7-3-6 | theorem | missing | Integrality test on a normal R_G via O_K-points (cited, de Jong [19, Prop. 7.3.6]) |
| raynaud-gruson-flatness-4-1-2 | theorem | missing | Flatness of T over Ŵ(R_G) (cited, Raynaud–Gruson [65, Thm. 4.1.2]) |
| display-deformations-over-dual-numbers-3-2-16 | theorem | missing | Deformations of displays over O_K[ε] (cited, Zink [73, Thms. 3, 4]) |
| wa-tensor-strictness | theorem | missing | Strictness for weakly admissible tensor constructions (used without citation) |
| tangent-modules-def-G | definition | missing | Tensor-adapted tangent modules Def_G(ξ;O_K[ε]) and Def_G(M_{O_K};O_K[ε]) |
| regularity-of-RG-generic-fibre | theorem | missing | R_G[1/p] is regular |
| interpolating-display-over-OK-T | construction | missing | Display over O_K[[T]] interpolating y and 𝒢_{O_K}; the ideals I_n, J_G, J_G^n |
| kisin-module-tensors-3-3-3 | construction | missing | Étale tensors, their Kisin-module images, ρ and κ_G |
| broshi-tannakian-torsors | theorem | missing | Tannakian construction of torsors on a Dedekind scheme (cited, Broshi [9, Lemma 3.1, Thms. 4.3, 4.5]) |
| crystalline-tensors-and-standing-assumptions-3-3-7 | construction | missing | Crystalline tensors s_{α,0} of a deformation; standing tame assumptions |
| group-over-W-3-3-9 | construction | missing | The group 𝒢_W ⊂ GL(D) and G_{K_0} |
| etale-cycle-deformation-setup-3-3-11 | construction | missing | Deformation setup for 𝒢_0 with the tensors s_{α,0}; assumption (3.3.12) |
| shimura-datum-notation | definition | missing | Shimura datum notation: μ_h, w_h, reflex field, Sh_K, Sh(G,X), Sh_{K_p}(G,X) |
| siegel-datum | definition | missing | Symplectic similitude group and Siegel double space |
| kisin-closed-embedding-of-shimura-varieties | theorem | missing | Closed embedding of the Hodge-type Shimura variety into a Siegel variety (cited) |
| kisin-defining-tensors | theorem | missing | Integral tensors cutting out G_{Z_(p)} (cited) |
| kisin-G-split-filtration | theorem | missing | The Hodge filtration at a lift is G-split (cited) |
| local-formal-models-at-a-point | construction | missing | Formal local models M̂^loc_y = Spf R and M̂^loc_{G,y} = Spf R_G attached to a specializing point |
| blasius-wintenberger-comparison | theorem | missing | de Rham and étale Hodge cycles correspond under the p-adic comparison (cited) |
| berthelot-ogus-and-parallel-sections | theorem | missing | Crystalline–de Rham comparison and uniqueness of parallel sections over a residue disc (cited) |
| local-model-completion-notation | definition | missing | Base-changed and completed local models M^loc_{G,X,z}, M̂^loc_{G,X,z} |
| generic-de-rham-frame-torsor | construction | missing | de Rham bundle, its integral extension, and the generic torsor of tensor frames |
| local-frame-diagram | construction | missing | Local frame diagram (4.2.9) |
| connected-stabilizer-in-unramified-case | theorem | missing | Parahorics in hyperspecial subgroups are connected stabilizers (Remark 4.2.14 b) |
| rational-representative-of-cocharacter-class | theorem | missing | A conjugacy class of cocharacters of a quasi-split group has a representative in a maximal torus defined over the field of definition (implicitly cited) |
| kottwitz-kernel-and-parahoric-membership | theorem | missing | Kottwitz kernel and parahorics: K° = K ∩ ker κ_G and T°(O) ⊂ 𝒢°_x(O) (cited) |
| deligne-congruence-facts | theorem | missing | Deligne's congruence-subgroup facts (cited) |
| deligne-components-and-galois-action | theorem | missing | Connected components of Shimura varieties and the Galois action on them (cited) |
| positive-subgroups-and-closures | definition | missing | G(Q)_+, G(Q)_+^−, H_+, G^ad(Q)^+, Z(Q)^−, Z(Z_(p))^− |
| connected-parahoric-torsor-pullback | construction | missing | The torsor π° over the parahoric-level model (and the authors' conjecture) |
| a-isogeny-category | definition | missing | Abelian schemes up to A-isogeny and Aut_A |
| moret-bailly-integral-points | theorem | planned | Moret-Bailly: torsors acquire points over finite integral extensions (cited) |
| faltings-chai-extension-of-homomorphisms | theorem | missing | Homomorphisms of abelian schemes extend over normal bases (cited) |
| kisin-center-action | theorem | missing | The centre acts on the universal abelian variety up to isogeny (cited) |
| siegel-points-as-isogeny-triples | construction | missing | Prime-to-p Tate modules, level-structure sheaves and the triple description of Siegel points |
| adjoint-element-central-torsor | construction | missing | The central torsor of an adjoint element and its trivializing isogeny ι_γ̃ |
| kisin-twisting-lemmas | theorem | missing | Kisin's twisting lemmas used for the adjoint action (cited) |
| adjoint-frame-torsor | construction | missing | The pulled-back torsor 𝒮̃_{K_p} and the adjoint torsor 𝒮̃^ad_{K_p} |
| zp-parahoric-adjoint-derived-models | construction | missing | Z_(p)-models G_{Z_(p)}, G°, G^ad_{Z_(p)}, G^der_{Z_(p)}, G^{ad°}, G^{der°} |
| adelic-group-action-extends-to-parahoric-models | theorem | missing | Extension of the 𝒜(G_{Z_(p)})-action to 𝒮_{K_p} and 𝒮_{K_p°} |
| derived-isogeny-setup-4-6-8 | construction | missing | Setting of §4.6.8: the second datum (G_2,X_2) and its groups |
| coset-representatives-J | construction | missing | The inclusion of §4.6.12 and the set J |
| deligne-reciprocity-connected-components | theorem | missing | Deligne's reciprocity law for π_0 (cited [20] Thm. 2.6.3) |
| deligne-connected-to-full-shimura-variety | theorem | missing | Deligne's description of Sh(G_2,X_2) from Sh(G,X)^+ (cited [20] 2.5.6, 2.7.11, 2.7.13) |
| sharp-cover-classical-type | definition | missing | The group H^♯ and the abelian-type criterion (§4.6.21, cited [20], [43] 3.4.13) |
| deligne-hodge-type-lift | theorem | missing | Deligne's Hodge-type lifting (cited [20] 2.3.10, 2.3.2) |
| finite-level-quotient-etale-local-structure | theorem | missing | Étale local structure at finite prime-to-p level (Remark 4.6.25(a)) |
| pz-local-model-special-fibre | theorem | missing | Special fibres of tame local models (cited [59] Thm. 9.1, Cor. 9.4) |
| toroidal-compactification-hodge-type | theorem | missing | Compactification with Cartier boundary (cited [52]) |
| milne-extension-property-uniqueness | theorem | missing | Extension property gives a common open (cited [54] §2) |
| automorphic-line-bundle-omega-G | definition | missing | The ample automorphic line bundle ω_G |
| very-special-irreducible-special-fibre | theorem | missing | Irreducible special fibres and extensions of ω_G (very special level) |
| siegel-extension-property | theorem | missing | Extension property of the Siegel tower (Néron–Ogg–Shafarevich) |
| intrinsic-connected-local-model-diagram | theorem | missing | Abelian-type connected diagram for the datum’s own local model |
| grassmannian | definition | planned | Grassmannian with universal subbundle and quotient |
| lagrangian-grassmannian | definition | planned | Lagrangian Grassmannian |
| reflex-flag-variety | construction | planned | Reflex-field form of the cocharacter flag variety |
| polynomial-lattice-chain | definition | missing | Periodic polynomial lattice chains and their automorphism schemes |
| gl-lattice-chain-local-model | definition | missing | GL lattice-chain local model |
| lattice-model-grassmannian-immersion | theorem | missing | Closed immersion through the product Grassmannian |
| unramified-local-model-base-change | theorem | missing | Unramified base change and descent of the local-model embedding |
| twisted-affine-flag | definition | missing | Parahoric twisted affine flag variety |
| algebraic-fundamental-group | definition | planned | Algebraic fundamental group with Galois action |
| kottwitz-homomorphism | construction | planned | Integral inertia-coinvariant Kottwitz homomorphism |
| prime-to-p-level-finite-etale | theorem | missing | Finite étale prime-to-p level change of Hodge integral models |
| small-level-connected-torsor | theorem | missing | Unramified splitting of the connected-level cover at small level |
| iwahori-bernstein-center | theorem | missing | Iwahori Bernstein centre and hyperspecial comparison |

## Verification and limits

The paper checker, allowed-file intake, source-issue/version checks, local dependency resolution and acyclicity, exactly-once routing and cross-paper reference checks pass. The route-boundary check confirms that BG1 is downstream of RG2.0a/RG2.1 and incomparable with RG2.3; it does not certify an unresolved future owner placement. The published PDF checksum matches the inherited one. Pages 183,184,197,214 were visually checked for the misprints and duplicate finding. Simple multiplicity, norm-torus and Frobenius diagnostics were recomputed.

No Lean file is assigned to this extraction fix and no pinned compiled environment was available. No Lean build was run. APIs and tests are planning contracts; external cited theorems and proof interiors remain obligations of their named design owners. Historical full-read and review evidence is distinguished from this fix’s selective inspection in the JSON.
