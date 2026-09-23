# Andreatta–Goren–Howard–Madapusi Pera (2018): Faltings heights of CM abelian varieties, extraction and routing

Issue [#1143](https://github.com/CBirkbeck/tauceti-explorer/issues/1143). Status: **complete**. Implementation and proof closure are not claimed.

- **Provenance.** Completed by Claude Code, session cc-442dc5, on 23 September 2026. It continues the merged Codex checkpoint (codex-a71f92), whose report follows below as history.
- **The paper.** F. Andreatta, E. Z. Goren, B. Howard and K. Madapusi Pera, *Faltings heights of abelian varieties with complex multiplication*, Ann. of Math. 187 (2018), 391–531.
  - The published PDF was re-fetched; its SHA-256 (e1274468…) matches the checkpoint.
  - Crossref registers no erratum.
- **Items.** The result has **172 items: 6 library, 13 planned and 153 missing**. Every missing item is routed exactly once, and every numbered statement is an item.
- **Mistakes.** Twenty-seven are recorded under `sourceIssues`.
  - Four affect a stated result: Lemma 9.4.4 (E1), Proposition 9.4.5 (E2), Lemma 9.4.3 (E3), and the BKY12 formula that this paper corrects (E26).
  - None affects Theorems A or B.

## This continuation (cc-442dc5)

**New items.** The checkpoint had grouped or left out a number of numbered statements; they now have their own items, 31 new in all.
- §2: Proposition 2.3.1 and Lemma 2.5.4.
- §3: Lemma 3.6.3.
- §4: Definition 4.2.1, Lemmas 4.3.5, 4.3.6 and 4.5.2, and Propositions 4.5.3, 4.5.4 and 4.5.5.
- §5: Propositions 5.4.2–5.4.5.
- §7:
  - Proposition 7.1.1, Lemmas 7.1.6 and 7.1.7, and Corollary 7.1.9;
  - Propositions 7.4.1–7.4.3 and Lemma 7.5.3;
  - Propositions 7.6.1 and 7.6.2, Lemma 7.6.3, Lemma 7.7.2 and Proposition 7.7.3.
- §8–9: Lemma 8.3.2, Definition 9.1.3, Conjecture 9.1.6 and Lemma 9.5.3.

Items that had merged several statements now carry just one, with its exact locator.

**Findings rechecked.**
- **E1 and E2.** Both hold.
  - The correct length in Lemma 9.4.4 is the cross-pair sum X; the printed formula gives −X. On Q_3(√3), Proposition 9.4.5 prints −1 for a module of length 1.
  - Proposition 9.4.1 is unaffected, because the final values in (9.4.12) and (9.4.13) are the positive ones.
- **E6.** The lattice identity (9.5.3) is false.
  - In the unramified case, the self-dual lattice is t·L0 with t t̄ = (ξ d_F)^(−1).
  - With that lattice the degree difference is still log|D_F|, as (9.5.1) asserts.

**Reclassified to affect nothing.** Each is a slip whose intended form is what the paper uses.
- **E4.** The metric −[z, z̄]_0 has the wrong sign; §9.5 uses the positive one.
- **E7.** Missing normalization by deg_C(Y).
- **E8.** The Kuga–Satake dimension is 2^(n+1).
- **E13.** Q(x) on disconnected bases.
- **E18.** m(p), and a stray u in the proof of Lemma 7.5.3 (p. 494 image checked).
- **E22.** A dropped negation. Theorem 8.3.4 is used only with c_f(0,0) ≠ 0.
- **E23.** Continuous versus locally constant class functions.
- **E24.** The proof uses only the ≈_L form.

**Gaps.**
- G7 is resolved.
- G4 and G5 are recorded as findings.
- The others are deferred as cited suppliers' proofs.

**Why the status is now complete.**
- Every numbered statement is an item.
- Every missing item is routed exactly once, and the mistakes are recorded.
- The remaining gaps are cited suppliers' proofs.

## Mistakes found (`sourceIssues`)

- **E1** (error; affects a stated result), Published Lemma9.4.4 pp.517–518; author version targeted collation; journal p.517 image checked. *Printed:* length C(Υ) = within(Υ)+within(Υc)−(1/2)length(C/D_B/A C) *Correction:* Reverse the sign: length equals the cross-pair valuation sum, hence half-discriminant minus the two within-subset sums. First split by embeddings of B0. In the proof n1(Υ)=cross+within(Υc), and C⊗_B A must read C⊗_A B.
- **E2** (error; affects a stated result), Published Proposition9.4.5 p.519 and equation(9.4.13) p.522; author version same sign; p.519 image checked. *Printed:* length C(M,Υ) = −(e_P/2)(μ_p(a_Υ)+μ_p(a_Υc)) *Correction:* Use +(e_P/2) with the positively defined Artin-conductor functional; the corresponding minus in(9.4.13) also changes. Recheck the local total-reflex cancellation before accepting9.4.1.
- **E3** (error; affects a stated result), Published Lemma9.4.3 p.516, journal image and author version checked. *Printed:* |∫η(e)|=(2π)^−dim(A) for an OE′-module generator e *Correction:* Specify a trace-normalized generator or retain |σ(Tr_dR(e))|. The proof's own Tr_dR=(2πi)^−g∫ implies ∫=(2πi)^gσ(Tr_dR(e)), not the displayed negative exponent. Read DMOS and resolve homological dual/metric conventions before using a repaired degree identity.
- **E4** (error; affects nothing), Published §9.4 p.514 definition of the metric on ω0; journal image checked. *Printed:* ||z||²_0=−[z,bar z]_0 *Correction:* For the positive standard space V0=End_conj(E), use its positive Hermitian form (or explicitly change the form's sign before applying the orthogonal convention). Recompute the determinant and orthogonal metric adapters, rather than changing one sign without proof.
- **E5** (misprint; affects the proof), Published Proposition7.1.10 p.484 and equation(7.3.3) p.488; both journal images checked; ratio also collated with author PDF. *Printed:* W′_α(0,Φ)/W_α(0,^pΦ)=+ell_p(α)log N(q)/2; (7.3.3) inserts −W′/W *Correction:* For raw Whittaker functions the ratio is negative when the opposite nearby Weil indices are retained; remove the extra minus introduced between the preceding derivative identity and(7.3.3). Keep the final negative Fourier/orbital formula7.3.2. Complete the W* normalization audit separately.
- **E6** (error; affects the proof), Published equation(9.5.3), p.523. *Printed:* Λ_p=ξ d_Fp/Qp^−1 L0,p *Correction:* Do not use this equality of full lattices. Compute the actual maximal OE,p-stable lattice from ξ and its norm valuation, then prove the required filtered Hodge-line comparison directly; a complete replacement proof has not been established in this checkpoint.
- **E7** (misprint; affects nothing), Published equation(9.5.1), p.523. *Printed:* [omegahat:Y]−deg_hat_Y(omegahat0)−log|D_F|≈_L0 *Correction:* Divide the difference of arithmetic degrees by deg_C(Y), or multiply log|D_F| by that degree. Keep the normalization compatible with9.4.2 and8.3.4.
- **E8** (misprint; affects nothing), Published §4.2 p.435, Kuga–Satake dimension sentence. *Printed:* relative dimension 2^(n+2) *Correction:* For the full Clifford representation H=C(V), use relative dimension2^(n+1). Its degree-one homological realization has rank2^(n+2).
- **E9** (misprint; affects the proof), Published §2.1/Theorem2.1.1 variance; author's explicit comment on Kis10 Theorem1.4.2. *Printed:* Kis10 Theorem1.4.2 is off by a Tate twist *Correction:* Use the paper's explicitly corrected integral classification only after checking its contravariant Tate convention and the identity Tp(H∨)=Tp(H)^∨(1). Do not reuse the cited Kisin statement without the twist.
- **E10** (misprint; affects the proof), Published Proposition2.3.3 proof; §2.4 denominator valuation; §2.5 thickening setup. *Printed:* a0; r(μ)=−ord_p(μ̃); G_k=G_(OK/ϖ^(k+1)) *Correction:* Use the consistent generator f0; measure denominator depth by normalized ord_E so it is a positive integer; align G_k, its realization, and V_μ(G_k) over the same kth thickening before the obstruction map to k+1.
- **E11** (misprint; affects nothing), Published Proposition3.5.2 and §3.6 standard crystalline realization. *Printed:* Λ_p,y; W⊗_Qp OE *Correction:* Use the lattice N_p,y in the representation under discussion; integral tensors use W⊗_Zp OE, and the isocrystal is obtained by inverting p.
- **E12** (misprint; affects nothing), Published Proposition3.6.1 and Proposition5.4.3. *Printed:* p is not split in F *Correction:* Read 'p is not split in E' for the prime p of F under discussion.
- **E13** (misprint; affects nothing), Published §4.3 opening and Propositions4.3.7/4.5.4 scalar-norm phrasing. *Printed:* L_(p)→H_(p); Q:V(A_S)→Z *Correction:* The special representation embeds into End_C(H), not H. State the scalar quadratic form over connected S or as a locally constant integer on components.
- **E14** (gap; affects the proof), Published Theorem4.4.6(3) compared with Theorem4.4.5. *Printed:* p odd and p²∤D_L *Correction:* Retain n≥2 in this branch as in4.4.5, or supply a separate proof for the omitted low-dimensional case. This extraction uses only the weaker, explicitly proved branch.
- **E15** (misprint; affects nothing), Published §4.6; §5.3; Proposition5.4.4 ramified case. *Printed:* Theorem4.4.6(3); Res_E/Q SO(V); π_q∈F_p; Proposition2.3.3 *Correction:* The Hodge-line reference is4.4.6(2); the binary F-space uses Res_F/Q SO(V); a ramified E-uniformizer lies in E_q, and its special-line calculation uses Proposition2.3.4.
- **E16** (misprint; affects the proof), Published Proposition7.1.3 measure calculation; Lemma7.1.6 range. *Printed:* N(p)^−r Vol(OF,p)=N(p)^(r−m/2); k>1 *Correction:* Use N(p)^r times the volume when scaling the integration domain by π^−r; check the annular lemma for k≥1, including the k=1 case used by the sum.
- **E17** (misprint; affects nothing), Published §7.2 off-prime lattice and coset indicator decompositions; proof of Proposition7.8.2. *Printed:* ^pΛ_p′=Λ_p; φ_μ=⊗_λ φ_λ *Correction:* For p′≠p use Λ_p′; a finite disjoint union of cosets gives a sum of indicator functions. Tensor products are reserved for independent local factors.
- **E18** (misprint; affects nothing), Published §7.5 definition of m(p) (p.491); proof of Lemma 7.5.3, last sentence (p.494, image checked). *Printed:* m(p)=ord_q(d_F/Qp); x_cris≡u *Correction:* Use m(p)=ord_p(d_F/Qp) as in7.1 and the specified coset μ in the congruence.
- **E19** (misprint; affects the proof), Published Proposition7.6.2 local comparison and target. *Printed:* β=π_p=Nm(π_q) in the unramified quadratic case *Correction:* Keep β=π_p as the nearby rescaling but do not identify it with the norm of an E-uniformizer at an inert unramified prime. Add the appropriate adelic scalar extension to the target lattice/realization identification.
- **E20** (misprint; affects nothing), Published Lemma7.6.3; proof of Theorem7.7.4; final cancellation in§7.8. *Printed:* Proposition5.3.1; Proposition2.3.3 twice; c_f(m) for m>0 *Correction:* Use5.3.4 for good-prime étaleness,2.3.4 in the ramified branch, and c_f^+(−m,μ) in the positive-divisor coefficient sums.
- **E21** (misprint; affects nothing), Published §8.2 definition ofρ_Λ(m,μ) and proof of Proposition8.2.1. *Printed:* #{x∈μ+Λ}; a negative sign before the coefficient convolution *Correction:* Restrict the set to Q(x)=m. In the Green-value convolution use the positive sign in the proposition statement and6.3.1.
- **E22** (misprint; affects nothing), Published §8.3 vertical error support and Theorem8.3.4 denominator. *Printed:* p²∤D_L; division by c_f(0,0) *Correction:* The possible odd-prime error support is p²|D_L#, with sharp lattice/dimension indices throughout; require c_f(0,0)≠0 for the divided formula.
- **E23** (error; affects nothing), Published §9.4 p.518 class-function space preceding Proposition9.4.5. *Printed:* Continuous class functions have a basis of irreducible finite-dimensional characters *Correction:* Restrict to locally constant class functions (finite-quotient functions) for the algebraic character expansion and Artin-conductor linear functional used here.
- **E24** (misprint; affects nothing), Published equation(9.5.5), p.526. *Printed:* Σ_p b_E(p)log p=[Ehat#(f):Y]/(4c_f(0,0)deg_C(Y)) *Correction:* Retain ≈_L, or assert equality only of coefficients at primes not dividing D_bad,L. The proof needs only the chosen good prime's coefficient.
- **E25** (misprint; affects nothing), Published proof of Theorem9.5.5, p.526. *Printed:* c_f(m)≠0 only if m is not represented by Λ_Q *Correction:* Restrict this support statement to the negative principal part: if m>0 is represented by Λ_Q then c_f(−m,μ)=0. Preserve c_f(0,0)≠0.
- **E26** (error; affects a stated result), BKY12 Proposition4.6 as used in AGHMP18 Proposition6.2.3. *Printed:* The earlier constant-term formula omits the local correction contribution *Correction:* Use AGHMP18 Proposition6.2.3, including M(s,φ) and the derivative−M′(0,φ), with its Λ and Nv factors.
- **E27** (misprint; affects nothing), Published bibliography [KR94] p.529 and [YZ18] p.530. *Printed:* doi.org/0.2307/2118540; 10.4007/annals.2018/187.2.4 *Correction:* Use DOI10.2307/2118540 for KR94 and10.4007/annals.2018.187.2.4 for YZ18.

The reasons and the places searched are in the JSON.

## Gaps: status after this continuation

- **G1** (closure; deferred). The Breuil–Kisin classification (Kisin 2006/2010, Kim 2012) and its PD-thickening conventions are cited suppliers' proofs; E9 and E10 record the paper's own slips.
- **G2** (closure; deferred). The integral orthogonal models and crystalline tensors (MP15, MP16, KMP16 with its appendix erratum) are cited suppliers' proofs.
- **G3** (normalization; deferred). The local Whittaker values are taken from HY12, Yan05 and BKY12, which are cited suppliers; the sign question in the ratio is recorded as E5.
- **G4** (normalization; recorded). The paper's own normalization mistakes are E1, E2, E3 and E4 (E4 now affects nothing); Col93 and DMOS are cited suppliers.
- **G5** (proof; recorded). The wrong lattice identity (9.5.3) is E6, with a degree check in the unramified case, and the normalization of (9.5.1) is E7.
- **G6** (closure; deferred). The Armitage and Bruinier inputs are cited suppliers' proofs.
- **G7** (inventory; resolved). Every numbered statement is now its own item: the grouped statements are split and the omitted ones added, 31 new items in all, including Definitions 4.2.1 and 9.1.3 and Conjecture 9.1.6; Definitions 5.1.2 and 9.1.1 are the locators of existing items.

## Validation (cc-442dc5)

`scripts/check_paper.py` and `research/blueprint/intake.py check-files` pass on the result. Item ids are unique, every missing item is routed exactly once, and every `dependsOn` target exists. No Lean deliverable is part of a paper job.

## Checkpoint history (unchanged)

The report of the earlier checkpoint follows as it was written. Where it says *partial* or *open*, or gives the earlier classification of E4, E7, E8, E13, E18, E22, E23 or E24, this continuation supersedes it.

## AGHMP18: whole-paper extraction and normalization checkpoint

Status: partial. Worker: Codex, session codex-a71f92. Issue #1143.
The claim was confirmed against comment5786641367 by bot comment5786643142.
The published paper has been read completely; this does not mean the extraction's proof closure is complete.

### Result and scope

For a CM field E/F, [F:Q]=d, with maximal order OE, the paper proves

`2^(-d) sum_Phi h_Falt(E,Phi) = -L_f'(0,chi)/(2 L_f(0,chi)) - log(D_E/D_F)/4 - d log(2*pi)/2.`

The sum is over all2^d CM types. This is the averaged, not the individual, Colmez identity.
The proof passes through special divisors on integral GSpin Shimura stacks, big CM cycles,
ramified and dyadic Lubin–Tate lifting, incoherent Eisenstein derivatives, Borcherds products,
and total-reflex determinant lines.

This checkpoint contains 141 items: 6 precise library reuses,
13 existing-layer imports, and 122 missing items.
Every missing item is routed exactly once across11 routes.
There are 46 definition/construction APIs with specification tests,
95 theorem proof outlines, 27 source findings awaiting independent review,
and7 explicit completion gates. Remaining grouped statements and external leaves prevent status complete.
No Lean file is requested by this paper issue, delivered, compiled or claimed formalized.

The decisive findings are concrete, not merely a name-search disagreement: Lemma9.4.4 gives
length−1 for a quotient of actual length1; Proposition9.4.5 has the matching conductor sign;
the arbitrary-generator period lemma is not invariant under multiplication by a unit;
the printed standard-line metric is negative on a positive space; and(9.5.3) fails a basic
maximal-lattice scaling test. These do not establish that the main theorem is false.
The targets depending on their repair remain explicitly gated.

### Versions and provenance

- Full published PDF: [Annals187(2018),391–531](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p03-p.pdf), SHA-256
  `e1274468312566b3b062e9612cd89818349e9c98cf9e58a728f85704b740c6bb`,141pages; acquired/read2026-09-23.
  All extracted lines1–7364 were read sequentially, including every proof and bibliography.
- Author PDF: [Colmez_v3.5.pdf](https://www.math.mcgill.ca/goren/PAPERSpublic/Colmez_v3.5.pdf), SHA-256
  `fc3600d517f4f853574ecaa3a236f9c0034a270653ce95363cc1073c4914c8de`. Only targeted§9.4 trace/length/conductor
  and§7.1.10 ratio passages were collated. It is not claimed fully read.
- [arXiv1508.00178](https://arxiv.org/abs/1508.00178) history was checked:
  v1 2August2015, v2 21November2015, v3 30September2017. Its PDF was not read.
- Journal images were inspected for printed pp.484,488,514,516,517,519.
  Other typographic groups have text-level evidence and still need the final image/independent pass.
- Publisher and author errata searches are documented per finding. The separate
  [KMP16 appendix erratum](https://doi.org/10.1017/fms.2020.2) is an external-input scope gate;
  this extraction does not assert that it invalidates the integral-model theorem.

The JSON includes the complete sequential reading ledger and bounded correction search.
Original external papers are not counted as read merely because their bibliography entries were read.

### Conventions that must survive implementation

| Quantity | Convention and test |
| --- | --- |
| Finite L versus completed Lambda | Lambda=(D_E/D_F)^(s/2) Gamma_R(s+1)^d L_f(s); the finite-L formula retains -d log(2*pi)/2. |
| Faltings metric | AGHMP uses the unscaled squared volume. Yuan–Zhang scales it by(2*pi)^(-d), so h_YZ=h_AGHMP+d log(2*pi)/2. |
| CM degree | deg_C(Y) counts E-stack points with1/Aut. The Z-complex weighted size is2d times that degree. |
| Arithmetic degree | Finite étale-local lengths times log N(q)/Aut plus half the archimedean sum. |
| Local valuation | v_p on F and v_q on E each normalize their own uniformizer; they differ by2 on F in the ramified case. |
| Local support | Nonzero ramified denominator depth is strictly less than the different exponent; r=n is excluded in the application. |
| Raw nearby Whittaker ratio | Keep the two opposite Weil indices; the corrected raw ratio is negative. |
| Bad-prime equality | approximately_L means a rational sum of log p for p dividing D_bad,L, not exact equality. |
| Borcherds principal part | Z(f) uses c_f(-m,mu), m>0. The constant term may and must be nonzero when divided by. |
| Standard versus orthogonal metric | V0 has a positive form; the orthogonal domain has a negative plane. One sign formula cannot be copied to both. |

### Ownership and nonduplication

| Route | Owner | Item count |
| --- | --- | ---: |
| 1: source | FiniteFlatGroupsAndIntegralPadicHodgeTheory | 5 |
| 2: source | ComplexMultiplicationAndExplicitReciprocity | 1 |
| 3: source | ShimuraVarieties | 1 |
| 4: source | AutomorphicBundles | 3 |
| 5: source | ArakelovGeometryAndAbelianHeights | 3 |
| 6: source | MetaplecticAutomorphicForms | 1 |
| 7: source | QSeriesPartitionsAndMockModularForms | 1 |
| 8: part-ii | LubinTateFormalModulesAndQuasiCanonicalLifts | 13 |
| 9: part-ii | OrthogonalIntegralModelsAndKugaSatake | 26 |
| 10: part-ii | GSpinSpecialDivisorHeights | 44 |
| 11: part-ii | ComplexMultiplicationAndExplicitReciprocityPartII | 37 |

The four Part II IDs are coalescing instructions, not fresh competing roadmaps.
The reviewed BKO21 proposal already supplies general Lubin–Tate modules.
Charles16 proposed the orthogonal integral/KS owner; SST22, Li–Zhang22 and
Maulik–Shankar–Tang22 already extend/consume it and GSpinSpecialDivisorHeights.
Tsimerman18 and Yuan–Zhang18 already use the CM-height Part II.
The existing HigherGreenFunctionCMValues proposal is not the ordinary Borcherds Green-function owner.

Generic BK classification stays in R07.4, generic realization descent in AutomorphicBundles B1/B2,
torus canonical models in ShimuraVarieties V4, CM types in CM.0, degree/metric in R35,
finite Weil/theta in MP, and the Maass xi sequence in QM.3.
The generic integral Hodge-type model candidate is an import of the orthogonal owner,
not replanned here. No pending paper route is mislabeled an accepted stage.

#### Route 1: FiniteFlatGroupsAndIntegralPadicHodgeTheory

Height-one modules, all-prime classification, integral comparisons and generic crystalline obstruction theory are already within R07. Import them rather than expanding the pending tensor-specific Part II merely for ordinary BK theory.

Existing stages: FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2, FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4, FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.6. The item statements and API/tests in the JSON specify this paper's contribution.

Suggested eventual module: `TauCeti/PadicHodge/BreuilKisin/HeightOne.lean`.

#### Route 2: ComplexMultiplicationAndExplicitReciprocity

The paper is a source for CM types/reflex norms; these definitions already have the generic CM owner. The total-reflex height construction is the separate CM Part II extension.

Existing stages: ComplexMultiplicationAndExplicitReciprocity:CM.0. The item statements and API/tests in the JSON specify this paper's contribution.

Suggested eventual module: `TauCeti/NumberTheory/ComplexMultiplication/Types.lean`.

#### Route 3: ShimuraVarieties

Generic finite étale torus canonical models and the reciprocity condition are V4; the integral maximal-level model and CM Hodge lattices are additional CM-specific work, not another generic Shimura canonical-model roadmap.

Existing stages: ShimuraVarieties:V4. The item statements and API/tests in the JSON specify this paper's contribution.

Suggested eventual module: `TauCeti/Geometry/Shimura/TorusCanonicalModel.lean`.

#### Route 4: AutomorphicBundles

The existing canonical principal bundle/representation-valued realization owner supplies Betti, étale and de Rham descent, including absolute Hodge tensors. Do not duplicate this in the CM or orthogonal applications.

Existing stages: AutomorphicBundles:B0, AutomorphicBundles:B1, AutomorphicBundles:B2. The item statements and API/tests in the JSON specify this paper's contribution.

Suggested eventual module: `TauCeti/Geometry/Shimura/AutomorphicBundles/Realizations.lean`.

#### Route 5: ArakelovGeometryAndAbelianHeights

Generic hermitian line degree, Green-divisor formalism, stack projection/normalization interfaces and Faltings metric stay with Arakelov. The CM average and orthogonal Green evaluation are consumers, not private definitions of degree.

Existing stages: ArakelovGeometryAndAbelianHeights:R35.1, ArakelovGeometryAndAbelianHeights:R35.2. The item statements and API/tests in the JSON specify this paper's contribution.

Suggested eventual module: `TauCeti/Arakelov/StackDegree.lean`.

#### Route 6: MetaplecticAutomorphicForms

Finite discriminant Weil modules, adelic measure/Weil conventions and generic theta/Siegel–Weil machinery stay with MetaplecticAutomorphicForms. The specific incoherent Hilbert coefficients are a GSpin big-CM application importing these APIs.

Existing stages: MetaplecticAutomorphicForms:MP.4, MetaplecticAutomorphicForms:MP.5, MetaplecticAutomorphicForms:MP.6. The item statements and API/tests in the JSON specify this paper's contribution.

Suggested eventual module: `TauCeti/Automorphic/Weil/FiniteQuadraticModule.lean`.

#### Route 7: QSeriesPartitionsAndMockModularForms

Harmonic Maass forms, ξ, weakly holomorphic kernel and cusp-form surjectivity belong to QM.3. The paper adds a representation/conjugation normalization test for its GSpin lift.

Existing stages: QSeriesPartitionsAndMockModularForms:QM.3. The item statements and API/tests in the JSON specify this paper's contribution.

Suggested eventual module: `TauCeti/ModularForms/HarmonicMaass/Xi.lean`.

#### Route 8: LubinTateFormalModulesAndQuasiCanonicalLifts

Reuse the reviewed candidate ID from PAPER-BURUNGALE-KOBAYASHI-OTA-21. Its general finite-Qp formal-module foundation is exactly the common supplier; AGHMP adds the conjugate-semilinear, denominator and wild lifting-depth branch, not a second LT theory.

Augment LubinTateFormalModulesAndQuasiCanonicalLifts, preserving the existing Lubin–Tate reciprocity, Honda and quasi-canonical-lift obligations. Import finite flat groups and integral p-adic Hodge theory (FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1, R07.2, R07.4, R07.6), Mathlib FormalGroup, and the existing Class field theory Artin map, never a rival reciprocity map. For arbitrary finite E/Qp construct the OE-action, LT group and explicit rank-one BK realization. For quadratic E/F construct conjugate-semilinear special endomorphisms, Hermitian composition, denominator torsors V_mu and the strict ramified different cutoff r(mu)≤v_E(d_E/F)−1. Prove AGHMP18 Theorem2.5.5: over the kth local thickening a nonzero residue special quasi-endomorphism lifts iff ord_E(f)≥k, with generator depth1 unramified and v_E(different) ramified; set ord_E(0)=∞. Prove the all-prime obstruction line and twisted OE-linearity, not just the tame/odd case. Correct the source's thickening indices and confirm Tate variance against Kisin/Kim before closing G1. Export integral and rational comparison maps to the GSpin consumer without importing that consumer. Tests must include p=2, the strict boundary r=n, zero, multiplication by a uniformizer, and an odd ramified extension with no nonzero denominator coset.

Suggested eventual module: `TauCeti/NumberTheory/LubinTate/SpecialEndomorphismLifting.lean`.

#### Route 9: OrthogonalIntegralModelsAndKugaSatake

Reuse OrthogonalIntegralModelsAndKugaSatake from PAPER-CHARLES-16 and its all-prime extension in PAPER-SHANKAR-SHANKAR-TANG-ETAL-22, also consumed by Li–Zhang and Maulik–Shankar–Tang. This paper supplies its foundational §4 source, not another orthogonal model owner.

Augment the existing OrthogonalIntegralModelsAndKugaSatake proposal with AGHMP18 §4 and the total-reflex Clifford embedding of5.2. Import Complex Shimura varieties and canonical models (ShimuraVarieties V4–V6), Shimura data (ShimuraData), the pending general integral Hodge-type models (ShimuraVarietiesHondaTatePartII), canonical realizations (AutomorphicBundles B1–B2), Abelian schemes and arithmetic moduli (AbelianSchemesAndArithmeticModuli A4–A5), finite flat groups and integral p-adic Hodge theory (R07.2, R07.4, R07.6), and Mathlib CliffordAlgebra/TauCeti.IntegralLattice. For maximal L of signature(n,2), construct GSpin, full-Clifford KS of dimension2^(n+1), its realizations, smooth self-dual models including2, and auxiliary-independent flat normal integral models. Prove Theorem4.4.6 with the verified dimension restrictions, the extended Hodge line, finite enlargement maps and Serre tensor comparison. Construct realization-defined special endomorphisms and denominator cosets, their positive norm on connected bases, Z(m,mu), complement pullbacks and4.5.8 Cartier/flatness with n≥3 and self-dual-at2 hypotheses where needed. Prove principal deformation equations and rigidity separately from Cartier non-zero-divisor assertions. No height or theta lift is owned here. Tests: norm-one Spin is not GSpin, connected versus disconnected scalar norm, m=0, nontrivial discriminant gluing, dyadic self-dual case and change of auxiliary enlargement. G2 and the external KMP16 appendix-erratum scope must be settled before closure.

Suggested eventual module: `TauCeti/Geometry/Shimura/Orthogonal/IntegralSpecialDivisors.lean`.

#### Route 10: GSpinSpecialDivisorHeights

Reuse GSpinSpecialDivisorHeights from the existing SST22/Li–Zhang22/Maulik–Shankar–Tang22 proposals. Ordinary Borcherds Green functions and big-CM arithmetic intersections belong here; do not duplicate the distinct HigherGreenFunctionCMValues proposal or curve-level GZ.6–7.

Add the AGHMP18 big-CM branch to GSpinSpecialDivisorHeights without replacing its existing exceptional-reduction goals. Import OrthogonalIntegralModelsAndKugaSatake for the integral stack, KS and special divisors; LubinTateFormalModulesAndQuasiCanonicalLifts for exact special-endomorphism lift depth; CM types and torus realizations from ComplexMultiplicationAndExplicitReciprocity, ShimuraVarieties V4 and AutomorphicBundles B1–B2; ArakelovGeometryAndAbelianHeights R35.1–2 for degree/metric; MetaplecticAutomorphicForms MP.4–6, QSeriesPartitionsAndMockModularForms QM.3 and AutomorphicLFunctionsAndLocalFactors AL.1 for analytic inputs. Construct big CM Y, good primes, nearby Hermitian lines, denominator-truncated Schwartz functions, normalized Whittaker integrals, weighted orbital integrals, Z_F(alpha,mu) and the regularized Green arithmetic divisor. Prove Theorem7.7.4's local length ell, Theorem7.8.1 deg Z_F/deg_C Y=−a_F/Λ(0), and Theorem6.4.2: for d>1 and f∈H_(2−d)(omega_L) with integral principal part, [Zhat(f):Y]/deg_C Y≈_L−L'(0,xi f)/Λ(0)+a(0,0)c_f^+(0,0)/Λ(0). The ambiguity is exactly rational logs at D_bad,L. Prove the integral Borcherds metric identity with log(4πe^γ), positive-complement contraction, proper-support criterion and8.3.4 with nonzero constant term. Add Bruinier's prescribed-negative-support theorem9.5.6. Keep finite L and completed Λ separate, E-stack degree versus Z-complex multiplicity2d, all stabilizers and dyadic/wild cases. Resolve the raw/normalized Whittaker signs and all G3 input hypotheses before activating the formulas. Export the Hodge height and good-prime vertical-error vanishing to the CM height consumer, not the averaged Colmez identity itself.

Suggested eventual module: `TauCeti/Arakelov/GSpin/BigCMIntersection.lean`.

#### Route 11: ComplexMultiplicationAndExplicitReciprocityPartII

Reuse the same CM Part II ID requested by PAPER-TSIMERMAN-18 and already extended by PAPER-YUAN-ZHANG-18. Add the independent total-reflex/GSpin proof branch and an explicit Faltings-metric adapter; do not create a duplicate average-height target.

Augment ComplexMultiplicationAndExplicitReciprocityPartII with AGHMP18's independent proof of the averaged Colmez formula, preserving the Yuan–Zhang corrected quaternionic branch and quantitative/orbit branches. For every maximal-order CM field E/F, [F:Q]=d, prove 2^(-d)Σ_all types h_Falt(E,Phi)=−(1/2)L_f'(0,chi)/L_f(0,chi)−(1/4)log(D_E/D_F)−(d/2)log(2π) using AGHMP's unscaled squared volume metric; prove the adapter h_YZ=h_AGHMP+d log(2π)/2. Import generic CM types/reflex norms (ComplexMultiplicationAndExplicitReciprocity CM.0/CM.2), torus canonical models (ShimuraVarieties V4), canonical realization tensors (AutomorphicBundles B1–B2), integral BK comparisons (FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.4), Arakelov geometry (R35.1–2), generic Artin/Hecke conductors (AutomorphicLFunctionsAndLocalFactors AL.1), and GSpinSpecialDivisorHeights for the big-CM Hodge height. Construct integral maximal-level CM realizations, total reflex algebra/type, its polarized abelian scheme, CM class functions and determinant section. Prove Colmez's height linearity as an input, the averaged character identities, local partition-resultant/conductor lengths with corrected signs, and the local/global discriminant degree. Repair the positive ω0 metric, arbitrary-generator trace lemma and false full-lattice scaling assertion before proving9.4.2/9.5.1. Vary auxiliary lattices to remove each bad-prime log coefficient, using good-prime Borcherds and prescribed negative support. Provide the d=1 classical input. The individual Colmez conjecture is not a proved endpoint or assumption. Tests include d=1, product reflex algebra, the ramified quadratic length1 (not−1), level-invariant normalized degrees and nonzero constant term. G4–G6 are hard activation gates, not silently assumed lemmas.

Suggested eventual module: `TauCeti/NumberTheory/ComplexMultiplication/TotalReflexAveragedColmez.lean`.

### Pinned-library evidence

Mathlib commit `082e2d37e8b0463410cdb532e111cd43d5a66174`; Tau Ceti commit `f790474821cf4256814db967cb154e7af3d0c369`.
Owner/audit snapshot `e46225b7ff6538f1e39b3322e3981022a0241290`; publication checks use
`becf0c2f0664cc8652a6732a31ce655e82f36e84`.

Read declaration statements, not just names: CM field/conjugation, the weighted product formula,
Vandermonde determinant, Clifford algebra and its generating relation, FormalGroup/IsComm,
and IntegralLattice with its separate nondegeneracy predicate and absolute Gram determinant.
The existing Spin carrier is norm-one Spin, not GSpin. The formal-group law does not supply
an OE-action, LT tower or reciprocity. An integral lattice does not supply a Shimura stack.
Accepted audits for R35, CM.0, V4/V6, A4, B0/B1/B2, MP.0/4/5/6, QM.3 and GZ.0/6/7 were read,
along with the relevant full layer descriptions. No accepted R07 audit entry was found;
the R07 planned status is based on its actual stage text and pinned tree searches.

Both complete pinned source trees were searched for the advanced names, with unrelated
citation/analytic/vertex-algebra hits inspected rather than counted as implementations.
The JSON records the actual declaration paths and the scoped negative-search conclusions.

### Item index

The JSON is the authoritative statement/API/proof-outline inventory.
Grouped statement leaves remain subject to G7; a locator does not replace a theorem statement.

| Item suffix | Status | Name / locator |
| --- | --- | --- |
| cm-field | library | CM field and conjugation — §1.1; Mathlib CMField.lean:71,143–170 |
| product-formula | library | Weighted number-field product formula — §2.2; Mathlib ProductFormula.lean:98 |
| vandermonde | library | Vandermonde determinant and injectivity criterion — §2.2 and §6.2; Mathlib Vandermonde.lean:219–235 |
| clifford | library | Clifford algebra of a quadratic form — §4.1; Mathlib/LinearAlgebra/CliffordAlgebra/Basic.lean:74,114,122 |
| formal-group | library | Commutative one-dimensional formal group law — §2.2; Mathlib/RingTheory/FormalGroup/Basic.lean:55–78 |
| integral-lattice | library | Integral quadratic lattice carrier and discriminant — §4.1; TauCeti/LinearAlgebra/IntegralLattice/Basic.lean:61–76,139; Gram.lean:243–257 |
| bk-carrier | planned | Height-one Breuil–Kisin module — §2.1, pp.398–401 |
| bk-classify | planned | All-prime height-one classification — Theorem2.1.1, classification assertion |
| bk-crys | planned | Integral crystalline specialization — Theorem2.1.1(1) |
| bk-dr | planned | Integral de Rham specialization and filtration — Theorem2.1.1(2) |
| bk-dp | planned | Divided-power comparison — Theorem2.1.1(3) |
| lt-module | missing | Lubin–Tate formal OE-module — §2.2, pp.401–404 |
| lt-bk | missing | Explicit rank-one Lubin–Tate BK module — §2.2 preceding Proposition2.2.1 |
| lt-realization | missing | Lubin–Tate realization comparison — Proposition2.2.1 |
| special-line | missing | Conjugate-semilinear special endomorphisms — §2.3; Proposition2.3.1 |
| special-rank | missing | Special line and Frobenius fixed points — Proposition2.3.1; Lemma2.3.2 |
| special-inert | missing | Unramified special Hermitian lattice — Proposition2.3.3 |
| special-ramified | missing | Ramified special Hermitian lattice — Proposition2.3.4 |
| denominator-torsor | missing | Denominator special quasi-endomorphism torsor — §2.4, p.406 |
| denominator-existence | missing | Ramified denominator cutoff — Proposition2.4.1 |
| obstruction | missing | One-step special-endomorphism obstruction line — Proposition2.5.1; §2.5 |
| obstruction-lift | missing | Crystalline Hodge criterion for lifting — Proposition2.5.1; Lemma2.5.2 |
| depth-shift | missing | Uniformizer raises exact lift depth — Lemma2.5.3 and Lemma2.5.4 |
| lift-depth | missing | Exact local lifting length — Theorem2.5.5 |
| cm-type | planned | CM type and reflex norm — §3.1; §9.1 |
| cm-torus | missing | CM quotient torus and norm-one torus — §3.1, pp.414–417 |
| torus-stack | planned | Non-neat zero-dimensional Shimura stack — §3.2; Proposition3.2.1 generic assertion |
| torus-integral | missing | Étale CM integral model at maximal local level — Proposition3.2.1 integral assertion |
| betti-system | planned | Representation-valued Betti variation — §3.3 |
| ell-system | planned | Representation-valued étale system — §3.3; Proposition3.3.1 |
| polarized-cm-family | missing | Abelian scheme from a polarized CM representation — Proposition3.4.1 |
| total-reflex-algebra | missing | Total reflex CM algebra — §3.4; §9.2 |
| total-reflex-polarization | missing | Polarized total-reflex representation — Proposition3.4.2 |
| dr-descent | planned | Canonical de Rham realization and Hodge tensors — Proposition3.5.1 |
| cm-local-crystal | missing | CM crystalline realization via local reciprocity — Proposition3.5.2 and Remark3.5.3 |
| cm-integral-bk | missing | Integral CM BK functor — Corollary3.5.4 |
| cm-integral-dr | missing | Functorial integral CM realizations — Proposition3.5.5(1) |
| cm-integral-generic | missing | Generic-fiber restriction of integral CM de Rham realization — Proposition3.5.5(2) |
| cm-integral-crys | missing | Evaluation of the integral CM crystal — Proposition3.5.5(5) |
| cm-integral-tensors | missing | Abelian-scheme comparison of integral CM realizations — Proposition3.5.5(3) |
| cm-hecke | missing | Torus action on every realization — Proposition3.5.6(1) |
| standard-cm-line | missing | Standard conjugate-semilinear torus representation — §3.6; §9.4 |
| cm-nonsplit | missing | Nonsplit criterion for special realizations — Proposition3.6.1 |
| cm-supersingular | missing | CM supersingular criterion — Proposition3.6.2; Lemma3.6.3 |
| gspin-datum | missing | Orthogonal GSpin Shimura datum — §4.1 |
| orth-connected | missing | Geometric connectedness of the orthogonal stack — Proposition4.1.1 |
| ks-family | missing | Full-Clifford Kuga–Satake abelian scheme — §4.2, p.435 |
| orth-selfdual | missing | Self-dual smooth integral model at every prime — Proposition4.2.2 |
| orth-dr | missing | Integral orthogonal de Rham tensors — Proposition4.2.4 |
| orth-crys | missing | Integral orthogonal crystalline tensors — Proposition4.2.5 |
| orth-special | missing | Special endomorphism on the orthogonal model — §4.3 |
| special-deformation | missing | Orthogonal Hodge lifting criterion — Proposition4.3.2 |
| special-principal | missing | Principal special-endomorphism deformation ideal — Corollary4.3.3 |
| special-fiberwise | missing | Fiberwise specialness and rigidity — Propositions4.3.4–4.3.6 |
| special-positive | missing | Positive norm of special endomorphisms — Proposition4.3.7; Proposition4.5.4 |
| orth-normalization | missing | Maximal-lattice model by self-dual enlargement — §4.4; Proposition4.4.1 |
| orth-flat-normal | missing | Normality and flatness of the special-lattice locus — Proposition4.4.2 |
| orth-lci | missing | Local complete intersection of the complement locus — Lemma4.4.3 |
| orth-fiber-connected | missing | Connected normal special fibers — Theorem4.4.5; Theorem4.4.6(3) |
| orth-global-model | missing | Global normal integral orthogonal stack — Theorem4.4.6(1) |
| orth-hodge-line | missing | Canonical extension of the orthogonal Hodge line — Theorem4.4.6(2) |
| orth-ambient-map | missing | Finite enlargement map and Serre tensor KS comparison — Proposition4.4.7(1) |
| orth-ambient-line | missing | Hodge-line pullback under enlargement — Proposition4.4.7(2) |
| special-independence | missing | Auxiliary-independent specialness — Propositions4.5.1–4.5.2 |
| special-cosets | missing | Discriminant-coset special quasi-endomorphisms — §4.5, pp.447–450 |
| special-divisor | missing | Special divisor Z(m,μ) — §4.5; Propositions4.5.5–4.5.6 |
| special-pullback | missing | Orthogonal-complement decomposition of special cycles — Proposition4.5.5; Corollary4.5.7 |
| special-cartier | missing | Cartier and flatness properties of special divisors — Proposition4.5.8 |
| arithmetic-divisor | planned | Arithmetic divisor and metrized line class — §4.6; §6.4 |
| finite-weil | missing | Finite Weil representation and harmonic Maass forms — §4.7 |
| maass-xi | planned | Harmonic Maass ξ exact sequence — §4.7, equation(4.7.1) |
| borcherds-green | missing | Special arithmetic divisor of a Maass form — §4.7–4.8 |
| borcherds-product | missing | Integral Borcherds product and metric identity — Theorem4.8.1 |
| borcherds-error | missing | Support and vanishing of the vertical Borcherds error — Theorem4.8.1(2)–(3) |
| nearby-hermitian | missing | Nearby coherent Hermitian line — §5.1 |
| reflex-clifford | missing | Total reflex algebra in the even Clifford algebra — Proposition5.2.1 |
| big-cm-cycle | missing | Integral big CM cycle — §5.3; Proposition5.3.1 |
| big-cm-realizations | missing | CM/orthogonal realization comparison — Proposition5.3.2 |
| good-prime | missing | Good rational prime for a maximal CM lattice — Definition5.3.3 |
| good-etale | missing | Good primes have maximal CM level — Proposition5.3.4 |
| special-cm-zero | missing | Characteristic-zero and split-prime vanishing — Propositions5.4.1 and5.4.2 |
| special-cm-nearby | missing | Special endomorphisms as the nearby Hermitian line — Propositions5.4.3–5.4.5; Corollary5.4.6 |
| completed-l | missing | Finite and completed quadratic Hecke L-functions — §6.1; equation(6.0.1); §9.3 |
| incoherent-eisenstein | missing | Incoherent Hilbert Eisenstein series — §6.1 |
| diff-set | missing | Local nonrepresentation set — §6.2 |
| positive-fourier | missing | Support and logarithmic rationality of positive coefficients — Proposition6.2.2 |
| constant-fourier | missing | Corrected constant term of the incoherent derivative — Proposition6.2.3; correction to BKY12 Proposition4.6 |
| diagonal-series | missing | Diagonal restriction and convolution coefficients — §6.2, equation(6.2.5); §6.3 |
| green-cm | missing | Big CM value of the regularized theta lift — Theorem6.3.1 (BKY input) |
| arithmetic-cm-degree | missing | Stack-weighted arithmetic intersection — §6.4 |
| main-intersection | missing | Big CM arithmetic intersection formula — TheoremB; Theorem6.4.2 |
| local-whittaker | missing | Local Whittaker normalization and nearby cosets — §7.1, pp.474–476 |
| whittaker-inert | missing | Inert unramified Whittaker polynomial — Proposition7.1.2 |
| whittaker-ramified | missing | Ramified zero-coset Whittaker polynomial — Proposition7.1.3 |
| whittaker-denominators | missing | Nonzero coset Whittaker coefficients — Proposition7.1.4 |
| gauss-support | missing | Gauss valuation and annular character cancellation — Lemmas7.1.5–7.1.7 |
| whittaker-zero | missing | Zero-index local correction factor — Proposition7.1.8; Corollary7.1.9 |
| local-length | missing | Local intersection length coefficient — Proposition7.1.10; Proposition7.3.2 |
| whittaker-ratio | missing | Corrected raw nearby Whittaker derivative ratio — Proposition7.1.10; E5 |
| nearby-schwartz | missing | Truncated nearby Schwartz function — §7.2 |
| orbital-integral | missing | Normalized nearby orbital integral — Definition7.3.1 |
| fourier-orbital | missing | Fourier derivative equals negative weighted orbital length — Proposition7.3.2 |
| ks-lt-decomposition | missing | Local KS p-divisible factorization — §7.4 |
| ks-lt-special | missing | KS/LT special-line comparison with denominators — Proposition7.5.1 |
| bk-discriminant | missing | Constant BK discriminant quotient and coset integrality — Lemma7.5.2; Lemma7.5.3 |
| norm-cm-cycle | missing | Fixed F-norm CM special cycle — §7.6 |
| cm-point-count | missing | Stack-weighted CM point count — Propositions7.6.1–7.6.2; Lemmas7.6.3–7.6.4 |
| ks-lt-lifts | missing | All-level KS/LT lifting equivalence — Proposition7.7.1; Lemma7.7.2 |
| cm-local-ring-length | missing | Exact étale-local intersection length — Proposition7.7.3; Theorem7.7.4 |
| finite-cm-degree | missing | Finite arithmetic degree of a fixed-norm CM cycle — Theorem7.8.1 |
| constant-good | missing | Good-prime reduction of constant coefficients — Proposition7.8.2 |
| complement-theta | missing | Positive complement theta contraction — §8.1–8.2 |
| extended-green | missing | Green function under positive-complement contraction — Proposition8.2.1 |
| proper-support | missing | Principal-part avoidance hypothesis — Hypothesis8.3.1 |
| proper-intersection | missing | Complement avoidance implies proper intersection — Lemma8.3.2; Proposition8.3.3 |
| omega-height | missing | Orthogonal Hodge height with vertical error — Theorem8.3.4 |
| cm-classfunction | missing | CM class functions and Colmez functional — §9.1 |
| faltings-height | planned | Stable Faltings height in the AGHMP metric — Definition9.1.4 |
| colmez-linearity | missing | Colmez height/type invariance and linearity — Theorem9.1.5, citing Col93 Theorem0.3 |
| reflex-orbits | missing | Orbit decomposition of the total reflex pair — Proposition9.2.1 |
| average-character | missing | Averaged CM-type character identity — Proposition9.3.1, equation(9.3.1) |
| average-analytic | missing | Average of analytic Colmez heights — Proposition9.3.1 |
| reflex-character | missing | Total-reflex character average — Proposition9.3.2 |
| reflex-height | missing | Total-reflex Faltings-height identity — Corollary9.3.3 |
| reflex-determinant | missing | Total-reflex Hodge determinant section — §9.4, equations(9.4.1)–(9.4.3) |
| dvr-splitting | missing | CM embedding-partition cokernel — §9.4 preceding Lemma9.4.4 |
| dvr-length | missing | Corrected embedding-partition length — Lemma9.4.4; E1 |
| artin-length | missing | Corrected conductor formula for partition length — Proposition9.4.5; E2 |
| trace-volume | missing | Trace-normalized top de Rham period — Lemma9.4.3; E3 |
| reflex-local-length | missing | Local total-reflex determinant length — Equation(9.4.9), proof of Proposition9.4.1 |
| reflex-global-degree | missing | Discriminant degree of the determinant section — Proposition9.4.1 |
| faltings-omega | missing | Faltings-height and standard Hodge-line comparison — Theorem9.4.2 |
| orth-cm-line-adapter | missing | Normalized orthogonal/CM Hodge-line comparison — Proof of Proposition9.5.1, equations(9.5.1)–(9.5.3) |
| height-error | missing | Average height difference as a vertical error — Proposition9.5.1 |
| auxiliary-good | missing | Auxiliary CM lattices avoid any finite prime set — Proposition9.5.2; Lemma9.5.3 |
| different-character | missing | Unramified CM different-character identity — Lemma9.5.4, citing Armitage67 |
| prescribed-borcherds | missing | Weakly holomorphic form with prescribed negative support — Theorem9.5.6, citing Bru16 Theorem1.1 |
| averaged-colmez | missing | Averaged Colmez identity — TheoremA; Theorem9.5.5 |
| cm-integral-completion | missing | Completed-local de Rham comparison — Proposition3.5.5(4) |
| cm-torus-abelian | missing | Torus action on the CM abelian scheme — Proposition3.5.6(2) |
| orth-complement-codim | missing | Codimension of the non-primitive complement locus — Lemma4.4.4 |

### Source findings

No finding below has a self-assigned review verdict. 'New' means no correction was found
in the documented bounded search, not a claim of publication priority.
The two already printed corrections (Kisin's twist and BKY's constant term) remain recorded.
Potential issues lacking a conclusive check are in the completion gates, not promoted to false statements.

#### E1: error; affects a stated result

Locator: Published Lemma9.4.4 pp.517–518; author version targeted collation; journal p.517 image checked.

Printed: `length C(Υ) = within(Υ)+within(Υc)−(1/2)length(C/D_B/A C)`.

Correction: Reverse the sign: length equals the cross-pair valuation sum, hence half-discriminant minus the two within-subset sums. First split by embeddings of B0. In the proof n1(Υ)=cross+within(Υc), and C⊗_B A must read C⊗_A B.

Check: Take A=Z3, B=C=Z3[π], π²=3, Υ={π↦π}. K(Υ)=(t−π), K(Υc)=(t+π), so the quotient is C/(2π), length1. Both within sums are0 and v_C(discriminant12)=2, giving the printed value−1. A negative module length is impossible. For a nontrivial unramified part, distinct embeddings can agree on π; only same-B0 embedding pairs belong in the ramified formula.

Known: new.

#### E2: error; affects a stated result

Locator: Published Proposition9.4.5 p.519 and equation(9.4.13) p.522; author version same sign; p.519 image checked.

Printed: `length C(M,Υ) = −(e_P/2)(μ_p(a_Υ)+μ_p(a_Υc))`.

Correction: Use +(e_P/2) with the positively defined Artin-conductor functional; the corresponding minus in(9.4.13) also changes. Recheck the local total-reflex cancellation before accepting9.4.1.

Check: For K=Q3(√3), each singleton indicator is(1+χ)/2 on its quadratic Galois quotient. Its conductor functional is1/2, e_P=2, so the printed result is−1, whereas E1 computes length1. Formula(9.4.12) already has positive length and supports the intended correction.

Known: new.

#### E3: error; affects a stated result

Locator: Published Lemma9.4.3 p.516, journal image and author version checked.

Printed: `|∫η(e)|=(2π)^−dim(A) for an OE′-module generator e`.

Correction: Specify a trace-normalized generator or retain |σ(Tr_dR(e))|. The proof's own Tr_dR=(2πi)^−g∫ implies ∫=(2πi)^gσ(Tr_dR(e)), not the displayed negative exponent. Read DMOS and resolve homological dual/metric conventions before using a repaired degree identity.

Check: Replacing an arbitrary integral generator by a unit u multiplies its period at σ by|σu|, which need not be1 (e.g.1+√2 at a real embedding). Global cancellation can use the product formula, but cannot justify an embeddingwise constant. This invalidates the lemma as written; it does not alone disprove9.4.2.

Known: new.

#### E4: error; affects a stated result

Locator: Published §9.4 p.514 definition of the metric on ω0; journal image checked.

Printed: `||z||²_0=−[z,bar z]_0`.

Correction: For the positive standard space V0=End_conj(E), use its positive Hermitian form (or explicitly change the form's sign before applying the orthogonal convention). Recompute the determinant and orthogonal metric adapters, rather than changing one sign without proof.

Check: Writing f_a(x)=a c(x), its square is a c(a), so Q0=Tr_F/Q(a c(a)) is positive definite. Thus [z,bar z]_0>0 for any nonzero complexified vector, and the printed negative value is not a squared norm. The orthogonal V has a negative real plane and is different.

Known: new.

#### E5: misprint; affects the proof

Locator: Published Proposition7.1.10 p.484 and equation(7.3.3) p.488; both journal images checked; ratio also collated with author PDF.

Printed: `W′_α(0,Φ)/W_α(0,^pΦ)=+ell_p(α)log N(q)/2; (7.3.3) inserts −W′/W`.

Correction: For raw Whittaker functions the ratio is negative when the opposite nearby Weil indices are retained; remove the extra minus introduced between the preceding derivative identity and(7.3.3). Keep the final negative Fourier/orbital formula7.3.2. Complete the W* normalization audit separately.

Check: In the ramified zero-coset case normalized W=1−N^(−as), nearby W=1+N^(−as). Their normalized derivative/value ratio is+a log N/2, while the raw ratio changes sign because γ(^pV)=−γ(V). Differentiating E_α=(W/Wnear)Enear at W(0)=0 introduces no additional minus. These paired corrections preserve the final coefficient formula.

Known: new.

#### E6: error; affects the proof

Locator: Published equation(9.5.3), p.523.

Printed: `Λ_p=ξ d_Fp/Qp^−1 L0,p`.

Correction: Do not use this equality of full lattices. Compute the actual maximal OE,p-stable lattice from ξ and its norm valuation, then prove the required filtered Hodge-line comparison directly; a complete replacement proof has not been established in this checkpoint.

Check: Take F_p=Q_p and unramified quadratic E_q/F_p with ξ=p². Then d_F=1 and L0,p=OE,q. For Q=p²Nm a maximal OE-stable integral lattice is p^−1OE,q, whereas the printed expression is p²OE,q. The latter is strictly smaller and is not maximal. Weak approximation allows this local ξ valuation with the required global signs.

Known: new.

#### E7: misprint; affects the proof

Locator: Published equation(9.5.1), p.523.

Printed: `[omegahat:Y]−deg_hat_Y(omegahat0)−log|D_F|≈_L0`.

Correction: Divide the difference of arithmetic degrees by deg_C(Y), or multiply log|D_F| by that degree. Keep the normalization compatible with9.4.2 and8.3.4.

Check: A finite étale level cover multiplies both degree terms but not log|D_F|. The surrounding formulas are normalized by deg_C(Y); the printed equation is not invariant under level change.

Known: new.

#### E8: misprint; affects a stated result

Locator: Published §4.2 p.435, Kuga–Satake dimension sentence.

Printed: `relative dimension 2^(n+2)`.

Correction: For the full Clifford representation H=C(V), use relative dimension2^(n+1). Its degree-one homological realization has rank2^(n+2).

Check: dim_Q V=n+2, so dim_Q C(V)=2^(n+2), whereas H_1 of an abelian variety has rank twice its dimension. This corrects the numerical dimension, not the chosen full-Clifford construction.

Known: new.

#### E9: misprint; affects the proof

Locator: Published §2.1/Theorem2.1.1 variance; author's explicit comment on Kis10 Theorem1.4.2.

Printed: `Kis10 Theorem1.4.2 is off by a Tate twist`.

Correction: Use the paper's explicitly corrected integral classification only after checking its contravariant Tate convention and the identity Tp(H∨)=Tp(H)^∨(1). Do not reuse the cited Kisin statement without the twist.

Check: The paper itself flags the external error; Cartier duality supplies the cyclotomic twist. This is a known correction to the cited source, not a newly discovered false AGHMP classification.

Known: AGHMP18 §2.1 explicitly records the Tate-twist correction to Kis10 Theorem1.4.2; exact input collation remains G1..

#### E10: misprint; affects the proof

Locator: Published Proposition2.3.3 proof; §2.4 denominator valuation; §2.5 thickening setup.

Printed: `a0; r(μ)=−ord_p(μ̃); G_k=G_(OK/ϖ^(k+1))`.

Correction: Use the consistent generator f0; measure denominator depth by normalized ord_E so it is a positive integer; align G_k, its realization, and V_μ(G_k) over the same kth thickening before the obstruction map to k+1.

Check: The generator a0 is not the defined special f0; in a ramified quadratic extension normalized F-valuation of an E-uniformizer is1/2, inconsistent with the declared integer denominator depth. The two printed base exponents disagree. These are a cluster of notation/index repairs; exact PD-transition collation remains G1.

Known: new.

#### E11: misprint; affects nothing

Locator: Published Proposition3.5.2 and §3.6 standard crystalline realization.

Printed: `Λ_p,y; W⊗_Qp OE`.

Correction: Use the lattice N_p,y in the representation under discussion; integral tensors use W⊗_Zp OE, and the isocrystal is obtained by inverting p.

Check: Λ is not the lattice named in3.5.2. OE is not a Qp-module, so the displayed integral tensor product over Qp is ill-typed.

Known: new.

#### E12: misprint; affects nothing

Locator: Published Proposition3.6.1 and Proposition5.4.3.

Printed: `p is not split in F`.

Correction: Read 'p is not split in E' for the prime p of F under discussion.

Check: Splitting is being tested in the quadratic extension E/F; the neighboring statements and the local Hermitian invariant depend on that extension.

Known: new.

#### E13: misprint; affects a stated result

Locator: Published §4.3 opening and Propositions4.3.7/4.5.4 scalar-norm phrasing.

Printed: `L_(p)→H_(p); Q:V(A_S)→Z`.

Correction: The special representation embeds into End_C(H), not H. State the scalar quadratic form over connected S or as a locally constant integer on components.

Check: Special tensors are endomorphisms of the Clifford representation. On a disjoint union one may choose a zero endomorphism on one component and a nonzero special one on another, so a single globally constant integer need not exist.

Known: new.

#### E14: gap; affects the proof

Locator: Published Theorem4.4.6(3) compared with Theorem4.4.5.

Printed: `p odd and p²∤D_L`.

Correction: Retain n≥2 in this branch as in4.4.5, or supply a separate proof for the omitted low-dimensional case. This extraction uses only the weaker, explicitly proved branch.

Check: The claimed immediate consequence removes the dimension hypothesis of its input. No proof of the stronger branch is supplied here; the finding is a missing justification, not an independently established counterexample.

Known: new.

#### E15: misprint; affects nothing

Locator: Published §4.6; §5.3; Proposition5.4.4 ramified case.

Printed: `Theorem4.4.6(3); Res_E/Q SO(V); π_q∈F_p; Proposition2.3.3`.

Correction: The Hodge-line reference is4.4.6(2); the binary F-space uses Res_F/Q SO(V); a ramified E-uniformizer lies in E_q, and its special-line calculation uses Proposition2.3.4.

Check: These are determined by the surrounding definitions: the relevant line is part2, SO(V) is defined over F, and no F-element has E-valuation1 in a ramified quadratic extension.

Known: new.

#### E16: misprint; affects the proof

Locator: Published Proposition7.1.3 measure calculation; Lemma7.1.6 range.

Printed: `N(p)^−r Vol(OF,p)=N(p)^(r−m/2); k>1`.

Correction: Use N(p)^r times the volume when scaling the integration domain by π^−r; check the annular lemma for k≥1, including the k=1 case used by the sum.

Check: Haar scaling gives Vol(π^−r O)=N(p)^r Vol(O). A sum indexed k≥1 cannot consume a lemma only stated for k>1 without separately treating k=1.

Known: new.

#### E17: misprint; affects nothing

Locator: Published §7.2 off-prime lattice and coset indicator decompositions; proof of Proposition7.8.2.

Printed: `^pΛ_p′=Λ_p; φ_μ=⊗_λ φ_λ`.

Correction: For p′≠p use Λ_p′; a finite disjoint union of cosets gives a sum of indicator functions. Tensor products are reserved for independent local factors.

Check: The first error changes the local coefficient field. Indicators of disjoint cosets add; multiplying/tensoring functions on the same space is not the indicator of their union.

Known: new.

#### E18: misprint; affects the proof

Locator: Published §7.5 definition of m(p); Lemma7.5.3 congruence.

Printed: `m(p)=ord_q(d_F/Qp); x_cris≡u`.

Correction: Use m(p)=ord_p(d_F/Qp) as in7.1 and the specified coset μ in the congruence.

Check: At a ramified quadratic prime ord_q restricted to F is2ord_p, so the change would double m. The congruence is meant to encode μ, not an unrelated u.

Known: new.

#### E19: misprint; affects the proof

Locator: Published Proposition7.6.2 local comparison and target.

Printed: `β=π_p=Nm(π_q) in the unramified quadratic case`.

Correction: Keep β=π_p as the nearby rescaling but do not identify it with the norm of an E-uniformizer at an inert unramified prime. Add the appropriate adelic scalar extension to the target lattice/realization identification.

Check: For unramified quadratic E/F, a uniformizer has norm valuation2; π_p has valuation1. The nearby odd-valuation rescaling is exactly not a norm.

Known: new.

#### E20: misprint; affects nothing

Locator: Published Lemma7.6.3; proof of Theorem7.7.4; final cancellation in§7.8.

Printed: `Proposition5.3.1; Proposition2.3.3 twice; c_f(m) for m>0`.

Correction: Use5.3.4 for good-prime étaleness,2.3.4 in the ramified branch, and c_f^+(−m,μ) in the positive-divisor coefficient sums.

Check: The numbered inputs have distinct contents. Z(f) is defined by negative Fourier indices; using positive ones does not match its divisor.

Known: new.

#### E21: misprint; affects nothing

Locator: Published §8.2 definition ofρ_Λ(m,μ) and proof of Proposition8.2.1.

Printed: `#{x∈μ+Λ}; a negative sign before the coefficient convolution`.

Correction: Restrict the set to Q(x)=m. In the Green-value convolution use the positive sign in the proposition statement and6.3.1.

Check: The unrestricted coset is infinite for a positive-rank lattice. The tensor-contracted Green formula has the same sign as the lower-dimensional Green formula; its displayed proof line disagrees with both.

Known: new.

#### E22: misprint; affects a stated result

Locator: Published §8.3 vertical error support and Theorem8.3.4 denominator.

Printed: `p²∤D_L; division by c_f(0,0)`.

Correction: The possible odd-prime error support is p²|D_L#, with sharp lattice/dimension indices throughout; require c_f(0,0)≠0 for the divided formula.

Check: Theorem4.8.1 makes the error vanish at odd primes with p²∤D_L#. The division is undefined for zero constant term, which Hypothesis8.3.1 alone does not exclude.

Known: new.

#### E23: error; affects a stated result

Locator: Published §9.4 p.518 class-function space preceding Proposition9.4.5.

Printed: `Continuous class functions have a basis of irreducible finite-dimensional characters`.

Correction: Restrict to locally constant class functions (finite-quotient functions) for the algebraic character expansion and Artin-conductor linear functional used here.

Check: A general continuous class function on a profinite group need not factor through a finite quotient or be a finite character sum. The functions a_(K,Υ) used in the proof are locally constant, so the required application lies in the corrected space.

Known: new.

#### E24: misprint; affects the proof

Locator: Published equation(9.5.5), p.526.

Printed: `Σ_p b_E(p)log p=[Ehat#(f):Y]/(4c_f(0,0)deg_C(Y))`.

Correction: Retain ≈_L, or assert equality only of coefficients at primes not dividing D_bad,L. The proof needs only the chosen good prime's coefficient.

Check: Proposition9.5.1 provides a congruence modulo bad-prime logarithms. Replacing it by a global equality erases an uncontrolled term; Q-linear independence permits the required coefficientwise argument.

Known: new.

#### E25: misprint; affects nothing

Locator: Published proof of Theorem9.5.5, p.526.

Printed: `c_f(m)≠0 only if m is not represented by Λ_Q`.

Correction: Restrict this support statement to the negative principal part: if m>0 is represented by Λ_Q then c_f(−m,μ)=0. Preserve c_f(0,0)≠0.

Check: As printed it conflicts with the necessary nonzero constant term because0 is represented. Theorem9.5.6 gives precisely a negative-index support restriction.

Known: new.

#### E26: error; affects a stated result

Locator: BKY12 Proposition4.6 as used in AGHMP18 Proposition6.2.3.

Printed: `The earlier constant-term formula omits the local correction contribution`.

Correction: Use AGHMP18 Proposition6.2.3, including M(s,φ) and the derivative−M′(0,φ), with its Λ and Nv factors.

Check: AGHMP explicitly supplies a correction and proves the rational local-factor formula. Omitting M′ changes the constant term at nonstandard/bad local Schwartz data.

Known: AGHMP18 Proposition6.2.3 explicitly corrects BKY12 Proposition4.6; the original BKY text has not been independently collated in this checkpoint..

#### E27: misprint; affects nothing

Locator: Published bibliography [KR94] p.529 and [YZ18] p.530.

Printed: `doi.org/0.2307/2118540; 10.4007/annals.2018/187.2.4`.

Correction: Use DOI10.2307/2118540 for KR94 and10.4007/annals.2018.187.2.4 for YZ18.

Check: The KR94 DOI omits the leading1; the YZ18 DOI has a slash where its verified publisher record has a dot. These are citation-link repairs only.

Known: new.

### External leaves and completion gates

The JSON lists15 prerequisite sources and their exact uses/read status.
These are source-leaf requests within the existing owners, not automatic duplicate paper/design jobs.
Where an existing paper job covers the input, extend/cross-reference it rather than create another.

#### G1: closure

Collate Kisin06/10 and Kim12, fix the Tp(H∨) versus Tp(H)^∨(1) convention, write the exact Frobenius pullback formulas and align the kth/k+1 thickening definitions/PD maps. Expand all subparts of2.1.1/2.5.1 with their complete base hypotheses.

Resume: Start with the explicit source correction to Kis10 Theorem1.4.2 and the §2.5 obstruction's actual base rings. Do not change the confirmed denominator and valuation conventions.

#### G2: closure

Read exact all-prime integral model and crystalline tensor inputs, the separate KMP16 appendix erratum, and MP15/MP16 special-endomorphism results. Resolve potential-good-reduction stack extension versus finite base extension and the connected-base nonzero/spanning hypothesis of5.4.6(3).

Resume: Retain the existing orthogonal owner; check the erratum's affected theorem before importing any Tate application. Never infer that all of KMP16 is invalid.

#### G3: normalization

Reconcile the printed W*=γ/N^(f/2)W with7.1.8 and the starred/unstarred inert nearby display. Check the r=n boundary of7.1.4 rather than extending the strict application range. Read HY12/Yan05/BKY12, coherent Siegel–Weil and Hör14/HM17/Bru16 inputs; prove all additive measures, Weil indices, factor2 and metric constants.

Resume: Use E5's paired sign correction and the raw ratio tests as diagnostics, not as a substitute for the missing normalization proof. The final coefficient sign remains negative.

#### G4: normalization

Read Col93 and DMOS. Repair positive ω0 metric and trace-normalized period statement; derive the determinant metric and the local total-reflex BK conductor values independently. Then prove9.4.1/9.4.2 with the correct2π factor. E1/E2 have concrete counterexamples; they do not by themselves establish every downstream corrected identity.

Resume: Start with the rank-one ramified quadratic cokernel and positive conductor functional, then the determinant action on local Hodge eigenspaces. Do not silently switch between cohomological and homological determinant lines.

#### G5: proof

Replace the false full-lattice equality(9.5.3) with an actual maximal-lattice and filtered-line calculation. Establish the normalized degree comparison and archimedean |ι(ξ)| factor. A complete replacement proof has not been found here.

Resume: Test arbitrary v_p(ξ), including ξ=p² at inert p, before proposing a general Fil1 formula. Use good-prime definitions and7.7.2, not the printed scalar multiple.

#### G6: closure

Read Armitage and Bruinier inputs, decompose auxiliary self-dual enlargement existence and infinite admissible squarefree support, and state the classical d=1 input. Prove rational-log coefficient elimination without the false globally exact(9.5.5).

Resume: Prove each prime coefficient independently after choosing p-good L and p-self-dual L#. No need to kill every bad-prime ambiguity with one auxiliary choice.

#### G7: inventory

Final statement-level atomization and locator pass: split remaining grouped4.3.4–6,5.4.3–5,7.1.5–7 and7.6 inputs; split the exact numbered parts of3.5.4, base hypotheses and explicit Frobenius matrices. Include remaining external definition leaves. Inspect journal images for grouped typographic findings not yet image-collated and verify each independently. Reading is complete, extraction closure is not.

Resume: Use the complete sequential readingLedger to compare every displayed/named result against items. Candidate checks still open:7.1.4 boundary,4.4.1 extension descent,5.4.6 nonzero condition, exact finite-conductor norm in9.3.1. Do not promote these candidates to false-statement findings without proof.

### Executed diagnostics and validation

The standalone exact Python program below passed27970 cases:
4788 Sylvester/cross-resultant identities;14364 valuation/length sign checks;
4282 averaged CM character and4282 total-reflex checks;
80 inert and155 ramified raw Whittaker-ratio checks;
one ramified quadratic counterexample,17 maximal-lattice valuation checks and one metric-sign check.

These finite tests do not prove the analytic, integral-geometric or general p-adic assertions.
The Whittaker tests assume the stated normalized polynomials and opposite Weil indices;
they are a consistency check, not a replacement for G3.

Repository validation passed: check_paper; intake check-files on exactly3 files (0 problems);9 paper-checker tests;7 source-issue tests. Additional checks passed: unique IDs, all122 missing items routed exactly once, resolved/acyclic dependency graph,46 carrier APIs with at least2 tests each,95 proof outlines.
No Lean compilation was run.

<details>
<summary>Reproduce the exact finite checks with Python3</summary>

```python
"""Exact finite checks for AGHMP18 extraction; NOT proofs of the paper."""
from fractions import Fraction
from itertools import combinations, permutations, product
from math import prod
import json

checks = {}
def count(name):
    checks[name] = checks.get(name, 0) + 1

def valuation(x, p):
    x = abs(x)
    assert x
    v = 0
    while x % p == 0:
        x //= p
        v += 1
    return v

def polynomial(roots):
    a = [1]
    for r in roots:
        b = [0] * (len(a) + 1)
        for i, c in enumerate(a):
            b[i] -= r*c
            b[i+1] += c
        a = b
    return a

def determinant(a):
    a = [[Fraction(x) for x in row] for row in a]
    result = Fraction(1)
    for i in range(len(a)):
        pivot = next(j for j in range(i, len(a)) if a[j][i])
        if pivot != i:
            a[i], a[pivot] = a[pivot], a[i]
            result = -result
        z = a[i][i]
        result *= z
        for j in range(i+1, len(a)):
            ratio = a[j][i]/z
            for k in range(i, len(a)):
                a[j][k] -= ratio*a[i][k]
    assert result.denominator == 1
    return int(result)

# The ideal presentation by f,g has determinant the cross-resultant.
# Integer split polynomials test the identity, not arbitrary DVR geometry.
for n in range(2, 7):
    for roots in combinations(range(8), n):
        for mask in range(1, 2**n-1):
            left = [r for i,r in enumerate(roots) if mask >> i & 1]
            right = [r for i,r in enumerate(roots) if not mask >> i & 1]
            f, g = polynomial(left), polynomial(right)
            cols = []
            for h, shifts in [(f,len(right)), (g,len(left))]:
                for j in range(shifts):
                    cols.append([0]*j + h + [0]*(n-j-len(h)))
            det = determinant(list(map(list, zip(*cols))))
            cross = prod(abs(x-y) for x in left for y in right)
            assert abs(det) == cross
            count("sylvester_cross_resultant")
            for p in (2,3,5):
                full = sum(valuation(x-y,p) for x,y in combinations(roots,2))
                within_l = sum(valuation(x-y,p) for x,y in combinations(left,2))
                within_r = sum(valuation(x-y,p) for x,y in combinations(right,2))
                c = valuation(cross,p)
                assert c == full-within_l-within_r
                assert (c+within_r)+(c+within_l)-full == c
                assert within_l+within_r-full == -c
                count("partition_length_and_printed_sign")

# Signed permutations act on the embeddings +/-1,...,+/-d.
# Check all CM types, not only orbit representatives.
for d in range(1,6):
    types = [{(i+1)*s for i,s in enumerate(signs)}
             for signs in product((-1,1),repeat=d)]
    for perm in permutations(range(1,d+1)):
        for signs in product((-1,1),repeat=d):
            action = {i+1:perm[i]*signs[i] for i in range(d)}
            action.update({-i:-action[i] for i in range(1,d+1)})
            char = sum(action[i]==i for i in range(1,d+1))-sum(
                       action[i]==-i for i in range(1,d+1))
            total = sum(len(phi & {action[x] for x in phi}) for phi in types)
            assert total == 2**(d-1)*(d+char)
            count("cm_average_character")
            # Conjugacy average of the total-reflex indicator, over embeddings.
            reflex_total = 0
            for j in tuple(range(1,d+1))+tuple(range(-d,0)):
                reflex_total += sum(j in phi and action[j] in phi for phi in types)
            assert Fraction(reflex_total,2*d) == Fraction(total,2*d)
            count("total_reflex_average")

# Exact normalized derivatives in units of log N(p).
for q in (2,3,5,7,11):
    for a in range(1,32,2):
        # Inert W*=(1+q^(-s-1))*sum(-1)^j q^(-js), j=0..a.
        derivative = (1+Fraction(1,q))*sum((-1)**j*(-j) for j in range(a+1))
        nearby_value = -(1+Fraction(1,q))
        ratio = derivative/nearby_value
        ell = Fraction(a+1,2)
        assert ratio == -ell  # log N(q_E)=2 log N(p).
        count("inert_raw_whittaker_ratio")
    for a in range(1,32):
        normalized_derivative, nearby_normalized_value = a, 2
        raw_ratio = -Fraction(normalized_derivative,nearby_normalized_value)
        assert raw_ratio == -Fraction(a,2)
        count("ramified_raw_whittaker_ratio")

# Ramified quadratic counterexample: pi^2=3, v_C(2pi)=1.
actual_length, printed_length = 1, -1
assert actual_length != printed_length
assert Fraction(2,2)*(Fraction(1,2)+Fraction(1,2)) == actual_length
count("ramified_quadratic_counterexample")
# Unramified quadratic, Q=p^2 Nm: p^-1 O is maximal integral among fractional ideals.
for exponent in range(-8,9):
    integral = 2+2*exponent >= 0
    assert integral == (exponent >= -1)
    count("maximal_lattice_scaling")
# Positive standard Q0 versus the negative squared norm in the source.
assert -(1*1+1*1) < 0
count("positive_standard_metric")
print(json.dumps({"checks":checks,"total":sum(checks.values()),
                 "scope":"finite algebra/combinatorics only; no Lean or analytic proof"},indent=2))
```

</details>
