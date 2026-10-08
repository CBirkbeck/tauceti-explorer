# Independent round-two review: Metaplectic groups, Weil representations and theta kernels

**Job:** REV-MetaplecticAutomorphicForms--MP.0~2 · **Issue:** #7074 · **Reviewer:** Codex, session codex-2XfYcg · **Date:** 2026-10-08 · **Verdict:** `accepted`.

This completes the independent review of revision BP-MetaplecticAutomorphicForms--MP.0~2 (#6993). I did none of the original blueprint, its revision or its first review. All 176 node statements, hypotheses, proof routes, direct prerequisites, API items, tests, native/omitted signature inventories and planet choices were checked. All 64 baseline statements were read at the pinned commits. All 23 source issues have fresh scoped confirmations. The reader was brought into agreement with every correction. No node, stage, implementation or source proof is marked closed.

Acceptance applies to a finished target-level planning pass under Protocol §§0,13. The revision replaced the prior review's false statements about arbitrary representations, Fourier operators, sections, residues and cochains with concrete partial native constructions or explicitly omitted obligations. The remaining source/category/analytic work is recorded rather than asserted. The full Lean file has an environmental import blocker; its selected Mathlib-only portion elaborated. Neither acceptance nor elaboration proves the signatures, which retain proof placeholders.

## Counts and stage coverage

| Quantity | Result |
| --- | ---: |
| Nodes | 176 |
| Definitions / constructions / lemmas / theorems / comparisons | 11 / 48 / 5 / 88 / 24 |
| Node verdicts: verified / corrected / added / unverifiable | 159 / 17 / 0 / 0 |
| Named API items / tests | 186 / 180 |
| Planets | 42 |
| Pinned baseline declarations / distinct modules | 64 / 25 |
| Source records / version receipts | 27 / 29 |
| Source issues: confirmed / rejected / added | 23 / 0 / 0 |
| Explicit gaps / supplier requests | 168 / 31 |
| Planned / closed stages | 8 / 0 |
| Named native targets / API signatures / examples | 64 / 130 / 147 |
| Explicitly omitted named obligations | 201 |
| Total distinct named obligations | 542 |

Stage counts are MP.0:18, MP.1:7, MP.2:10, MP.3:44, MP.4:8, MP.5:16, MP.6:22 and MP.7:51. All 111 distinct source-item routes remain. Each of the 59 definitions/constructions has at least three discriminating tests and a named API. Per-stage planet counts are 4,5,4,6,5,6,6,6; their mathematical labels and ownership are unchanged. The planning status remains complete, every coverage status remains planned, and every implementation status remains unchecked. No proof-level expansion or new node was needed.

The packet's `review.checked` is the exhaustive 176-entry ledger. “Verified” means the qualified target and its disclosed proof/carrier boundary are sound; it does not mean its future proof has been reconstructed or its omitted source carrier exists.

## Corrections applied

| Nodes or record | Correction and evidence |
| --- | --- |
| MP.0 bilinear-factor-set, isometry-extension, isometry-action, polarization-equivalence, central-character | Fifteen existing examples had short comment labels and were wrongly inventoried as omitted. Fully qualified their labels, updated packet/reader statuses and removed those obligations from the omission appendix. No mathematical Lean declaration changed. |
| MP.0 topological-heisenberg | The target now assumes jointly continuous isometry evaluation, matching its existing API/signature. For finite-dimensional local fields, the isometry group receives its subspace topology in GL(W). An arbitrary group topology does not imply continuity. |
| MP.1 intertwiner-lines | Norm-one cocycle scalars require choosing unitary A_g, rather than merely using a unitary representation category. Scalar rescaling of a nonzero intertwiner need not preserve its norm. |
| MP.2 character-and-dual | Corrected the prototype boundary: tensor weight 2−2=0 descends, while dual weight −1+2=1 is normalized genuine. The target and unit identities already used those weights. Kudla II.4 pp.36–37. |
| MP.3 unitary-splitting | With the trace symplectic pairing fixed, the splitting is δ-independent. A character ratio η trivial on F× must be transported by Hilbert90 to η̃(x/xᶜ)=η(x) before composing with the unitary determinant. Changing χV twists the W-factor and changing χW twists the V-factor. Gan–Ichino §4 PDF11–12 and GQT §2.9(2.2), PDF13. |
| MP.3 unitary-splitting supplier boundary | General quadratic E/F Hermitian and quaternionic carriers remain requested ClassicalGroups Part-II inputs. The existing complex classical-group roadmap does not provide them. The proof route now acknowledges this before importing a carrier. |
| MP.3 quaternionic-sharp-descent | Specified the doubled Y□ cocycle and both μ-corrected cochains before descent. LemmaA.10, using A.9, establishes independence of the norm lift; A.12 handles auxiliary χ. Ichino–Prasanna AppendixA PDF93–96. |
| MP.3 periods-i-first-scalar-calculation | The A.16 value on ι([α,α],1) has χ(α)^−2, rather than χ(α)^−4. The distinct general doubled scalar χ(α)^−2m is unchanged. AppendixA PDF101–102. |
| MP.6 doubling-schwartz-map | Replaced the incorrect §11.2/equation locators by the unnumbered δ displays of GQT §11.3 PDF52; matched its splitting hypothesis. |
| MP.6 local-doubling-integral | The integral and normalized unramified displays are in GQT §11.6 PDF54; global factorization is (11.3). Kept Z*=Z/L and the unscaled good-place value d_v^−1. |
| MP.6 rallis-inner-product | Theorem11.4's positive range d(n)<m≤2d(n), r≤n includes convergent as well as second-term cases. The description and proof route now account for the relevant Witt index. GQT PDF54. |
| MP.7 theta-residue-normalization and DIT16 E22 | Replaced the stale claim that |θ|² is invariant with the correct Petersson integrand sqrt(y)|θ|². Fresh numerical corroboration is recorded below; Chiera's convention is not certified. |
| MP.7 duke-coefficient-bound | Added Duke88 as a direct source and a hashed public-source receipt, with its unit-norm convention and cosh factor. Corrected the DIT16 (6.6) locator to printed968–969/PDF20–21. |
| MP.7 biro-shintani-lift | Its emitted sum runs over all nonzero signed indices, using positive-D inputs b_f(DQ²). Corrected the API/boundary text that called it a positive-index series. The general-level, complementary spectral range and sqrt(abs(Q))/P coefficient are unchanged. |
| Reader and provenance | Mirrored all statement, hypothesis, route, source, inventory and gap corrections. Added fresh source receipts and 23 independent source-issue reasons. Prior reviews, findings and dated reading receipts remain historical provenance. |

These changes repair the remaining contradictions in the deliverables. They do not add unproved equations between arbitrary data or change the upstream roadmap files.

## First-review obligations and handed findings

The first review's Haar/oscillator counterexamples are addressed by additive-invariant measures, the actual ψ-dependent phase and the real-line a.e. L² construction. Smooth and unitary uniqueness, cover nonsplitting and central sign are now source-scoped; arbitrary C/C² representation equivalences and arbitrary central scalars are absent. Finite Weil operators use actual finite functions and the selected pairing/quadratic data. The local theta, quaternionic splitting, Siegel–Weil, spectral-residue, plus-space and Shimura source assertions are omitted where their actual objects cannot yet be expressed. Native fragments explicitly identify what they do and what remains missing.

The internal node prerequisite graph is acyclic. Fifteen broad GN.2/3 imports from thirteen consumers were removed by the revision; GN's theta-lattice consumer is no longer treated as an independent arithmetic supplier. Requests specify binary genus characters, ideal/norm/trace-dual arithmetic, CM stabilizers and oriented cycle dictionaries without MP theta/spectral inputs. GZ.5 and BSD.2 consumer feedback edges remain absent. These local checks do not certify every whole-stage expansion of the entire atlas acyclic.

RT-AREA-automorphic-1/19 is represented by MP's norm/theta/normalized toric pairing targets, with GZ as their consumer and an independent arithmetic orbit gate. The public YZZ2011 draft supplies the scoped nonzero-norm local formula; its referenced split proof remains unread. /21 retains SR.0/2/3 and AF.1 before local theta categories. /22 imports QFI's nonarchimedean Hilbert/Hasse conventions, GlobalQuadraticForms for real signatures and quadratic global existence, and a separately sourced global Hermitian existence gate. /23 retains AA.3 and AF.2/3 geometry and decay before global theta, without claiming those suppliers prove cover-specific convergence. The Jacobi producer direction and QM.1 items(a)–(e), plus the separate unitary L2s instance, remain explicit rather than being supplied by MP.8.

The reviewed library audit's MP.0–7 rows and the relevant upstream/supplier statements were read. Existing factor sets, bilinear isometries, algebraic coinvariants, Lp, Schwartz, invariant measures and semidirect products are reused. Scalar AL Fourier results are not claimed to provide the requested finite-dimensional/joint extension; complex ClassicalGroups results are not claimed to provide general Hermitian/quaternionic local groups. No audited existing construction is duplicated as a new owner.

## Pinned baseline

All 64 declarations were independently read in the following 25 modules at [Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174](https://github.com/leanprover-community/mathlib4/tree/082e2d37e8b0463410cdb532e111cd43d5a66174) and [Tau Ceti f790474821cf4256814db967cb154e7af3d0c369](https://github.com/TauCetiProject/TauCeti/tree/f790474821cf4256814db967cb154e7af3d0c369). Names, statements, assumptions, coordinate order and claimed uses were checked. No baseline citation was removed or replaced. The six declarations added by the revision include native Schwartz/Lp and measure/integral infrastructure; they do not provide missing smooth or automorphic categories.

| Pinned module | Confirmed declarations |
| --- | ---: |
| [Mathlib/Algebra/Group/Invertible/Defs.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Group/Invertible/Defs.lean) | 1 |
| [Mathlib/Algebra/Group/TypeTags/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Group/TypeTags/Basic.lean) | 1 |
| [Mathlib/Analysis/Distribution/SchwartzSpace/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/Distribution/SchwartzSpace/Basic.lean) | 3 |
| [Mathlib/Analysis/SpecialFunctions/Gamma/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/SpecialFunctions/Gamma/Basic.lean) | 1 |
| [Mathlib/GroupTheory/Coset/Defs.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/GroupTheory/Coset/Defs.lean) | 1 |
| [Mathlib/GroupTheory/SemidirectProduct.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/GroupTheory/SemidirectProduct.lean) | 1 |
| [Mathlib/GroupTheory/Subgroup/Center.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/GroupTheory/Subgroup/Center.lean) | 1 |
| [Mathlib/LinearAlgebra/BilinearForm/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/BilinearForm/Basic.lean) | 2 |
| [Mathlib/LinearAlgebra/BilinearForm/IsometryEquiv.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/BilinearForm/IsometryEquiv.lean) | 5 |
| [Mathlib/LinearAlgebra/BilinearForm/Properties.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/BilinearForm/Properties.lean) | 3 |
| [Mathlib/LinearAlgebra/BilinearMap.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/BilinearMap.lean) | 5 |
| [Mathlib/LinearAlgebra/Matrix/BilinearForm.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/Matrix/BilinearForm.lean) | 2 |
| [Mathlib/MeasureTheory/Function/LpSpace/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/MeasureTheory/Function/LpSpace/Basic.lean) | 1 |
| [Mathlib/MeasureTheory/Group/Defs.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/MeasureTheory/Group/Defs.lean) | 1 |
| [Mathlib/MeasureTheory/Integral/Prod.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/MeasureTheory/Integral/Prod.lean) | 2 |
| [Mathlib/NumberTheory/ModularForms/CongruenceSubgroups.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/ModularForms/CongruenceSubgroups.lean) | 1 |
| [Mathlib/RepresentationTheory/Coinvariants.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory/Coinvariants.lean) | 3 |
| [Mathlib/RepresentationTheory/Continuous/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory/Continuous/Basic.lean) | 2 |
| [Mathlib/RepresentationTheory/Homological/GroupCohomology/LowDegree.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory/Homological/GroupCohomology/LowDegree.lean) | 1 |
| [Mathlib/RepresentationTheory/Intertwining.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory/Intertwining.lean) | 2 |
| [Mathlib/RingTheory/Artinian/Defs.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Artinian/Defs.lean) | 1 |
| [Mathlib/RingTheory/RootsOfUnity/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/RootsOfUnity/Basic.lean) | 1 |
| [TauCeti/GroupTheory/GroupExtension/Of/FactorSet.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/GroupTheory/GroupExtension/Of/FactorSet.lean) | 18 |
| [TauCeti/LinearAlgebra/BilinearForm/Isometry.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/LinearAlgebra/BilinearForm/Isometry.lean) | 3 |
| [TauCeti/RepresentationTheory/ProjectiveRepresentation/Extension.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/ProjectiveRepresentation/Extension.lean) | 2 |

Algebraic coinvariants are used only as algebraic quotient adapters. ContRepresentation supplies continuous linear operators, not automatically continuity in the group variable, unitarity, smooth admissibility or finite length. Lp and Schwartz embedding statements do not identify every local oscillator model. FactorSet and native form isometries supply algebraic extension carriers, not the normalized topological metaplectic double cover. These distinctions match the cited nodes' disclosed boundaries.

## Sources and independent reading boundary

The fresh receipts are in each source's `independentReviewReading` and the reader bibliography. Twenty-six unique public PDFs were acquired and hashed: the 25 acquired original source records and Duke88. Kudla's alternate hostname has identical bytes. The publisher Biró URL returned HTTP403; the author-hosted public scan has the historical SHA-256. The YZZ2011 author draft was accessible as cached public text but direct download returned HTTP403, so its inherited hash and physical-page offsets were not independently certified. That draft is distinct from the 2013 book. No private-library or uncleared book was used, and no source file or passage is included in the repository.

The scoped public versions read are linked below. This is an access/locator ledger, not a section-by-section account of any paper. Detailed results are stated in the packet's own mathematical targets.

| Public source | Independently inspected locators |
| --- | --- |
| [Kudla96](https://www.math.toronto.edu/skudla/castle.pdf) | I.1–4 pp.3–26; II pp.29–39; III pp.44–49; IV pp.52–53; V pp.59–66,70–74 |
| [Weil64](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/weil2.pdf) | PDF6–7,15,18–20,27–28,30–57; II §§24–30, III §§31–41, IV §§42–44 |
| [Garrett20](https://www-users.cse.umn.edu/~garrett/m/mfms/SSW/06_svn_theorem.pdf) | PDF1–4, Claim0.7 and multiplicity conclusion |
| [GQT](https://arxiv.org/pdf/1207.4709v3) | PDF5–6,11–18,25,28,33–35,52–57; §11.3, §11.6, Theorems11.4/11.7 |
| [GanTakeda16](https://arxiv.org/pdf/1407.1995v4) | PDF1–3,7–9, main statement and category hypotheses |
| [GanIchino16](https://arxiv.org/pdf/1409.6824v2) | §4 PDF11–15; §5 PDF19–20 |
| [SunZhu15](https://arxiv.org/pdf/1204.2969v3) | PDF5–10,43–46; conservation statements and conventions |
| [DIT11](https://annals.math.princeton.edu/wp-content/uploads/annals-v173-n2-p08-p.pdf) | PDF12–16; Fourier, resolvent and trace interfaces |
| [Biro00](https://users.renyi.hu/~biroand/pdfs/Cycle.pdf) | Theorem1 printed105–106/PDF3–4; printed128–129/PDF26–27 |
| [BFH90Invent](https://www.wstein.org/papers/bib/bump-friedberg-hoffstein-nonvanishing.pdf) | Published scan PDF6,8,10–12, with page images |
| [PAPER-ANDREATTA-GOREN-HOWARD-ETAL-18](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p03-p.pdf) | PDF62–63,75–77 |
| [PAPER-CHENEVIER-TAIBI-20](https://arxiv.org/pdf/1907.08783v1) | PDF50,54–55 |
| [PAPER-DISEGNI-LIU-24](https://arxiv.org/pdf/2204.09239v3) | PDF39–42 |
| [PAPER-DUKE-IMAMOGLU-TOTH-16](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p08-p.pdf) | Published PDF16–21,27–34; formula images PDF17,28–29,33–34 |
| [PAPER-GAN-ICHINO-18](https://arxiv.org/pdf/1705.10106v3) | PDF8,18–21,25–28 |
| [PAPER-GAN-SAVIN-23](https://arxiv.org/pdf/2102.00372v1) | PDF26–28,40–41,50–51,54 |
| [PAPER-GAN-SAVIN-23-B](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/2479D805B0F248C91A33671F3A03752E/S2050508623000276a.pdf/local_langlands_conjecture_for_g2.pdf) | PDF17–18,34–35 |
| [PAPER-GROSS-ZAGIER-86](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf) | Published scan PDF6,47,50–52, with page images |
| [PAPER-ICHINO-PRASANNA-23](https://arxiv.org/pdf/1806.10563v2) | PDF41–42,50–53,87–115; AppendixA |
| [PAPER-LAFFORGUE-18](https://arxiv.org/pdf/1209.5352v10) | §14 PDF169–173 |
| [PAPER-LI-LIU-21](https://www.math.columbia.edu/~chaoli/AIPF.pdf) | PDF15–17,31–32,49–50 |
| [PAPER-LI-LIU-22](https://arxiv.org/pdf/2101.09485v2) | PDF11,43–45 |
| [PAPER-LI-ZHANG-22-B](https://arxiv.org/pdf/1908.01701v3) | PDF8–9,56–58,78–79; §8.1 |
| [PAPER-YUAN-ZHANG-18](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf) | PDF46–50 |
| [PAPER-ZHANG-21](https://archive.ymsc.tsinghua.edu.cn/pacm_download/21/12000-annals.2021.193.3.5.pdf) | PDF70–71,108–109 |
| [yzz-gross-zagier-shimura-curves-2011-draft](https://www.researchgate.net/profile/Xinyi-Yuan-11/publication/267551160_Gross-Zagier_Formula_On_Shimura_Curves/links/548e842c0cf225bf66a5ff13/Gross-Zagier-Formula-On-Shimura-Curves.pdf?origin=publication_detail) | Cached draft §§2.1,2.2.1,2.3–2.4; Proposition2.2.1 nonsplit proof; hash unverified |
| [Duke88](https://www.math.ucla.edu/~wdduke/preprints/hyperbolic.pdf) | §2 PDF5–6; Theorem5 printed85–86/PDF13–14 |

Original Rao, Kudla unitary splitting, MVW, referenced Yamana/PSR/Lapid–Rallis, Fay, Kohnen, Baruch–Mao, FH95 and the split Waldspurger proof are not claimed independently reconstructed. The retained gates identify which source construction, carrier, theorem and comparison each target still needs. Historical erratum searches and the earlier DIT numerical trace experiments were not represented as fresh searches or experiments.

## Source issues and numerical checks

All 23 source issues retain their ids, version boundaries, correction/search provenance and historical independent verdicts, with a new `review.by=REV-MetaplecticAutomorphicForms--MP.0~2`. Their fresh reasons appear in both packet and reader. Kudla's isotropic-line and Q₂ half-cocycle examples, the Leray quotient counterexample, scalar-weight computation, Garrett tensor-factor contradiction and Biró Vitali counterexample were independently checked. The Gross–Zagier SL₂ and integer-modulus conventions, Gan–Savin conjugate-character/anisotropic input and Ichino–Prasanna local subscript were checked on the recorded source pages. Rao's exponent is confirmed as Kudla's already printed correction, without independent collation of Rao93.

DIT16 E2 is confirmed by unit-phase invariance of the norm and paired coefficients. E3 is independently corroborated by 1/4+(13.77975135)²=190.13154726782682; the printed 1/2 expression gives 190.38154726782682. E6 is checked against Duke88 Theorem5's cosh factor in each coefficient at t=r/2; its inherited local Weyl-law disproof was not repeated. E8 keeps the negative-D branch's |D|. E28 is checked through the sign of i∂F=−P/2 and the clockwise source-cycle parameterization; the full inherited numerical unfolding experiment was not repeated. E30 checks the leading y^(s−1) behavior against the printed small-y hypothesis. E33 checks the undefined prime-2 factor and the need for full recurrence.

For E22 I independently integrated sqrt(y)|θ(z)|² with dμ=dxdy/y² over the six Γ₀(4) cosets I, ST^j (j=0,1,2,3), and D=(1,0;2,1), using the standard PSL₂ fundamental domain x∈[−1/2,1/2], y≥sqrt(1−x²). The ST^j terms are evaluated by Poisson as sqrt(y)|θ((z+j)/4)|²/2; the D term is evaluated directly as sqrt(Im(Dz))|θ(Dz)|². Tensor Gauss–Legendre integration to height Y is supplemented by the theta cusp tail6/sqrt(Y); theta sums are truncated with cutoff ceil(sqrt(45/(2π·Im(z)))). An independent constant-integrand control uses the area tail6/Y.

| Quadrature | Theta norm squared | Area control | Quarter theta norm squared |
| --- | ---: | ---: | ---: |
| GL60, Y=12 | 6.283185307179599 | 6.283185307179590 | 1.570796326794900 |
| GL90, Y=20 | 6.283185307179608 | 6.283185307179589 | 1.570796326794902 |

This numerically corroborates 2π and π/2 for the unscaled measure and contradicts the source's 6. It is not a formal evaluation proof or a certification of Chiera's unavailable convention. Biró's separate coefficient test at N=1, χ(1)=χ(2)=1, b(D)=1 and b(4D)=0 gives a_Sh(2)=1/2, distinguishing the correct sqrt(abs(Q))/P from the earlier wrong formula.

## Validation, limitations and handoff

`python3 scripts/check_blueprint.py research/blueprint/packets/MetaplecticAutomorphicForms--MP.0.json` with the existing pinned declaration index reports **0 errors, 0 warnings**. Independent consistency checks verify 542 distinct named obligations, all 341 emitted native names/examples, all 201 omission entries, exact reader agreement for each node's statement/hypotheses/proof/API/tests/source/prerequisite/inventory fields, 176 unique node verdicts, 23 source verdicts, the acyclic internal graph and absent GN/GZ/BSD feedback edges. Allowed deliverable scope, JSON and whitespace were checked.

With 111GB available, full `lean-check` stopped at the missing prebuilt `TauCeti.RepresentationTheory.ProjectiveRepresentation.Extension.olean` import. It did not elaborate the full file. At the same authorized suggested-file path, temporarily excluding the Tau Ceti imports and the Heisenberg, Algebra and LocalTheta sections allowed 46 target signatures,98 API signatures, 116 examples and their helpers to elaborate at pinned Mathlib. The result had zero errors and 237 `sorry` warnings, with no other warning. The complete suggested file was then restored. No Lake project/build/update/cache, language server or concurrent compilation was started.

The previous broad and narrow needs_changes verdicts remain in reviewHistory. Their reported signature/supplier/reader contradictions are resolved in this revision and this review; their provenance is not rewritten as prior acceptance. There is no question blocking this completed review. The orchestrator can accept the planning pass and continue the recorded Part-II/category/arithmetic/source-proof work through its normal queue. A complete prebuilt import set at pinned Tau Ceti is needed before full-file elaboration can be certified. The source and numerical methods needed for later work are recorded here and in the packet, so the handoff depends on no scratch file.
