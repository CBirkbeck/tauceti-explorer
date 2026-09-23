# Balakrishnan–Dogra–Müller–Tuitman–Vonk (2019): explicit Chabauty–Kim for X_s(13), extraction and routing

Issue [#2173](https://github.com/CBirkbeck/tauceti-explorer/issues/2173). Status: **complete**. Implementation and proof closure are not claimed.

- **Provenance.** Written by Claude Code, session cc-442dc5, on 23 September 2026.
- **The paper.** J. S. Balakrishnan, N. Dogra, J. S. Müller, J. Tuitman and J. Vonk, *Explicit Chabauty–Kim for the split Cartan modular curve of level 13*, Ann. of Math. 189 (2019), 885–944, DOI 10.4007/annals.2019.189.3.6.
- **Items.** The result has **92 items: 1 library, 22 planned and 69 missing**. Every numbered statement is an item, and every missing item is routed exactly once.
- **Mistakes.** Eight findings are recorded under `sourceIssues`. Only one reaches a stated result: Lemma 4.7, which the authors retracted in 2023 and which the paper never uses.

## The version read

- **The published text.** The Annals site serves the full published PDF openly (60 pages, SHA-256 `e1aa5f96…`). It was read in full and is the version the locators follow.
- **arXiv v1.** 1711.05846v1 (15 November 2017) is the only arXiv version (41 pages, SHA-256 `77c57b03…`).
  - It was read in full first, with the formula pages checked on page images.
  - It is the submitted version: the KU Leuven repository copy is byte-identical to it.
- **The two versions differ.** The paper was revised after submission (received 7 July 2018, revised 20 December 2018).
  - §§4–6 and the appendix are renumbered; for example, arXiv Lemma 4.5 is published Lemma 4.7.
  - §4.5 is rewritten around Theorem 4.11.
  - §5 is reorganised.
  - The zero tables and the second chart's differentials moved to the authors' code repository [BDM+].
- **Slips in arXiv v1 that the published text corrects.** These are not recorded as findings, because the published paper does not contain them.
  - X(Q_p)_α is defined with AJ_b(z) for AJ_b(x) (p.4).
  - Definition 3.1 says "G_*-representations".
  - Formula (19) for the gauge transformation contradicts its own (17)–(18). The published (29) is right: dΩ_x = −ω and dg_x = Ω_x^T Z dΩ_x − η.
  - Lemma 4.7 asserts a unique β ∈ K^{2g}. This fails whenever a basis differential is holomorphic, since β + e_i is another solution. The published N and b_Fil ∈ Q^g fix it.
  - Lemma 5.3's display is garbled.
  - "d × d-matrix G" should be (2g+2) × (2g+2).
  - (22) normalises at b instead of the Teichmüller point b_0.
  - The proof of Lemma 5.5 multiplies in the order L·M·R^{-1}. The published proof of Lemma 5.7 uses L·R^{-1}·M, which is right.
  - η_{Z_2} is printed as −(40x² + 148xy + 36y²)dx/Q_y. The published text and the authors' data sheet have (−40x² + 148xy + 36y²)dx/Q_y.
  - The §6.5 zero table prints 12·7, 8·7 and 2·7 for 12·17, 8·17 and 2·17. These are u-coordinates in the disks u ≡ 0 mod 17.
  - Lemma A.4 ends with ω(A_n(C, ω)) for ω(A_n(C, ν)).

## What the paper proves

**The main results.**
- **Theorem 1.1.** X_s(13)(Q) consists of six CM points and one cusp.
- **Theorem 1.2.** Combined with Bilu–Parent–Rebolledo, the primes ℓ for which some non-CM E/Q has mod-ℓ image in a split Cartan normaliser are exactly 2, 3, 5 and 7.
- **Corollary 1.3.** Via Baran's isomorphism X_ns(13) ≃ X_s(13), there are seven rational points on X_ns(13), all CM. This gives a new proof of the class number one theorem.
  - I checked the CM counts: 13 splits in exactly six class-number-one orders and is inert in exactly seven.

**The method.** It is quadratic Chabauty for curves with r = g and ρ > 1.
- **The pair.** A nice correspondence Z gives a depth-two quotient U_Z of the unipotent fundamental group and a twisted mixed extension A_Z(b, x).
  - Nekovář's p-adic height of A_Z(b, x) gives a quadratic Chabauty pair (θ, Υ): Lemma 3.7.
  - For potentially good reduction everywhere, Υ = {0}: Corollary 3.8.
- **The determinant.** Lemma 1.5 turns the pair into a determinant det T(x) that vanishes on X(Q).
- **The local height at p.** The paper's contribution is explicit: θ is h_p of a filtered φ-module. Both structures come from universal properties:
  - the Hodge filtration from Hadian's theorem (Theorem 4.5), made explicit in Theorem 4.11;
  - the Frobenius structure from the universal pointed unipotent isocrystal (Lemma 5.2), made explicit in (45) and the splittings of §5.3.
- **The example.** At p = 17, with Tate classes from T_7 and T_11 and three charts, the common zeros are exactly the seven known points.
- **Remark 6.9's check.** The Z_1 rows in T_2 are intended, since the pairing B = h is the same for both classes. So the vanishing of det T_2 at P1, P3 and P5 is a genuine check.

## What the atlas has

**The owners.**
- **AnabelianGeometryAndNonabelianChabauty.** It owns the Chabauty–Kim tower:
  - NC.2 plans the unipotent fundamental groups with their realisations and comparisons;
  - NC.3 plans the Selmer varieties and NC.4 the Chabauty–Kim loci;
  - NC.5 plans quadratic Chabauty and height equations, with the Néron–Severi and bad-place terms and the rank criterion.
- **EffectiveDiophantineMethods ED.6.** It consumes NC.5 and owns certified worked examples.
- **ColemanIntegration L1.** It plans Coleman functions and Besser's Tannakian iterated integrals.
- **Other layers.**
  - PadicHodgeRegulators L1 plans the Bloch–Kato maps, PadicHodgeTheory R06.2 filtered φ-modules and D_cris, and PadicDifferentialEquationsAndRigidCohomology RD.3 overconvergent isocrystals with Frobenius.
  - ModularCurvesPartII plans Hecke correspondences (R14.1), A_f (R14.5) and bad-fibre models (R13.5).
  - HeegnerPointEulerSystems HE.7 plans Kolyvagin–Logachev.
  - Tau Ceti's ModularForms plans L(f, s) and its Fricke sign.

**What is missing.**
- **Nothing constructs a p-adic height.** The library audit for NC.5 and ED.6 finds none, and GZ.9 is the BDP setting.
- **None of these appear anywhere:** Nekovář's local heights, mixed extensions of filtered φ-modules, universal pointed unipotent objects, Hadian's and Chiarellotto–Le Stum's theorems, and semi-stable models of X_0(ℓ²).
- **The one library item.** Tau Ceti has the normalised Fricke involution on cusp forms, with its ±1 eigenspace splitting.

## Routes

The maintainer routed the paper as a source of NC.5 and ED.6, not a new roadmap. The routes below follow that and add two companion layers:
- **NC.2**, in the same roadmap, for the Tannakian and comparison machinery that NC.5 consumes;
- **ModularCurvesPartII R13.5**, for the semi-stable models of X_s(ℓ), which make the local heights away from p vanish.

### Route 1: source of AnabelianGeometryAndNonabelianChabauty:NC.5

The maintainer routed this paper to NC.5 (quadratic Chabauty and height equations). These items are its theory. They cover quadratic Chabauty pairs and the determinant criterion, nice correspondences and the quotient U_Z, Nekovář's p-adic heights with their local decomposition (bad-place terms, Lemma 3.2), the local height at p through mixed extensions of filtered φ-modules, the twisted mixed extension A_Z(b,x), Lemma 3.7 and Corollary 3.8, and the D_cris comparison for A_Z. NC.5 plans the depth-two quotient, the height equations, the Néron–Severi and bad-place terms and the rank criterion; nothing in the atlas constructs a p-adic height (GZ.9 is the BDP setting). The planned Theorem 2.3, U_Z, Kim–Tamagawa and nice-correspondence items are listed too, as the paper is a good source for them.

**Missing items taken (21).** Quadratic Chabauty pair (/11); Lemma 1.5: the determinant criterion (/12); Equivariant heights reduce the number of points (/13); Lemma 2.4 (/22); Nekovář's p-adic height pairing (/24); Definition 3.1: mixed extensions (/25); Local decomposition of the height (/26); The local height away from p (/27); Lemma 3.2 (/28); Mixed extensions of filtered φ-modules (/30); The local height at p (/31); The height formula (17) (/32); A_Z(b), twisting and the pair (θ, Υ) (/33); Lemma 3.7 (/35); Corollary 3.8 (/36); Independence of the splitting and the character (/37); Chow–Heegner points (Remarks 3.11, 5.6) (/38); Admissible Tate classes Z (/46); Lemma 4.7 (corrected) (/47); The filtered connection A_Z (/48); Lemma 5.4: comparison for A_Z (/62).

**Planned items the paper is a good source for (4).** Theorem 2.3 (Balakrishnan–Dogra) (/20); Symmetric and nice correspondences (/21); The depth-two quotient U_Z (/23); Theorem 3.6 (Kim–Tamagawa) (/34).

### Route 2: source of AnabelianGeometryAndNonabelianChabauty:NC.2

NC.2 constructs the unipotent étale and de Rham fundamental groups through their Tannakian categories, with path torsors carrying filtration and Frobenius and the comparison maps. This route adds its explicit machinery. It covers the universal pointed n-unipotent objects and their path torsors (Appendix A), Kim's universal connection on an affine curve (Theorem 4.2, Lemma 4.3, Corollary 4.4), Hadian's characterisation of the Hodge filtration (Theorem 4.5), and unipotent isocrystals with their Frobenius structure (Lemma 5.2). It also covers the non-abelian Berthelot–Ogus comparison (Chiarellotto–Le Stum) and the Frobenius operators on de Rham path torsors via Besser's transport. These belong to the same roadmap as NC.5 and are its inputs, so this is not a re-route. Tau Ceti's Tannaka reconstruction for affine group schemes is the library starting point (library audit for NC.2).

**Missing items taken (14).** The universal unipotent connection on Y (/40); Theorem 4.2 (Kim): universality (/41); Lemma 4.3: the trivialisation respects composition (/42); Corollary 4.4 (/43); Filtered connections (/44); Theorem 4.5 (Hadian) (/45); Unipotent isocrystals and the Frobenius structure (/54); Lemma 5.2 (/55); Theorem 5.3 (Chiarellotto–Le Stum) (/56); Frobenius operators on de Rham path torsors (/57); Unipotent Tannakian categories and the universal objects A_n(C, ω) (/67); Universal pointed objects (/68); Lemma A.3 (/69); Path torsors of the universal objects (Lemma A.4) (/70).

**Planned items the paper is a good source for (2).** Olsson's non-abelian comparison (/63); Iterated integrals and the transport τ_{b,x} (/58).

### Route 3: source of EffectiveDiophantineMethods:ED.6

The maintainer routed the algorithm and the X_s(13) computation to ED.6 (explicit higher methods and reproducible examples). This route covers the explicit connection and gauge transformations, the Hodge filtration algorithm (Lemma 4.10, Theorem 4.11), the Frobenius structure (45) and splittings, Lemmas 5.5 and 5.7, and the precision estimate. It also covers the whole worked example: model, rational points, Tate classes from T_7 and T_11, Hodge data, Frobenius lifts, the matrices T_i, the three chart computations, the rank (Proposition 6.2), and Theorems 1.1, 1.2 and Corollary 1.3 with their cited inputs (Bilu–Parent–Rebolledo, Chen, Baran). ED.6 requires certified termination and comparison with global points; the Magma code [BDM+] is public.

**Missing items taken (28).** Bilu–Parent–Rebolledo (cited) (/2); Chen's isogeny decomposition (cited) (/3); Baran's isomorphism (cited) (/4); Theorem 1.1 (/5); Theorem 1.2 (/6); Corollary 1.3 (/7); Remark 1.4: class number one (/8); Set-up for the explicit computation (/39); The connection of A_Z on Y (/49); Gauge transformations at the points of D (/50); Lemma 4.10: uniqueness of η (/51); Theorem 4.11: the Hodge filtration of A_Z (/52); Algorithm for the Hodge filtration (/53); The Frobenius operator on A_Z(b,x) (/59); The Frobenius structure (45) (/60); The Frobenius-equivariant splitting (/61); Lemma 5.5: the local height at p (/64); Changing the base point (Lemma 5.7) (/65); End(J) and the Picard number of J_s(13) (/77); Proposition 6.2 (/82); The model of X_s(13) and its seven rational points (/85); The first chart: basis, Tate classes and Hodge data (/86); Frobenius lifts and the functions θ_{Z_i} (/87); Equivariant heights and the matrices T_i (/88); Precision and Newton polygons (/89); Rational points on ]U_1[ (/90); Rational points on ]U_2[ (/91); The residue disk of P0 (/92).

### Route 4: source of ModularCurvesPartII:R13.5

Potentially good reduction of X_s(13) is a statement about bad fibres of modular curves. R13.5 (bad fibres and regular/semistable models) owns the local models, supersingular intersections, Igusa components and base extensions, with its cases listed explicitly. These items add the cases X_0(ℓ²) over Q_ℓ^nr(ϖ) (Edixhoven) and the quotient by w_{ℓ²}, which gives X_s(ℓ) for ℓ ≡ 1 mod 12. They also add the genus formula and Corollary 6.7, which NC.5 consumes to make the local heights away from p vanish. Nothing else in the atlas computes models of X_0(ℓ²) at ℓ.

**Missing items taken (6).** X_0^+(ℓ²) ≃ X_s(ℓ) (/71); Models, semi-stability and the Igusa curve (/72); Theorem 6.5 (Edixhoven) (/73); Theorem 6.6 (/74); Genus of X_s(ℓ) (/75); Corollary 6.7 (/76).

## Prerequisite papers the atlas does not cover

- J. S. Balakrishnan and N. Dogra, Quadratic Chabauty and rational points, I: p-adic heights, Duke Math. J. 167 (2018), 1981–2038 (https://doi.org/10.1215/00127094-2018-0013). Theorem 2.3, the twisting construction, Lemma 3.7's identity (π_1,π_2)(A_Z(b,x)) = (AJ_b(x), E AJ_b(x) + c).
- J. S. Balakrishnan and N. Dogra, Quadratic Chabauty and rational points II: generalised height functions on Selmer varieties, IMRN 2021 (https://doi.org/10.1093/imrn/rnz362). [BD17, Lemma 10] (π_*, h_p∘τ_p) is an isomorphism; K-equivariant heights; [BD17, Lemma 25] behind Theorem 4.11.
- M. Kim, The unipotent Albanese map and Selmer varieties for curves, Publ. RIMS 45 (2009), 89–133 (https://doi.org/10.2977/prims/1234361156). Selmer varieties, Theorem 2.2, Zariski density of j_n^dR, Theorem 4.2.
- M. Kim, The motivic fundamental group of P¹∖{0,1,∞} and the theorem of Siegel, Invent. Math. 161 (2005) (https://doi.org/10.1007/s00222-004-0433-9). Representability of the Galois cohomology varieties.
- J. Nekovář, On p-adic height pairings, Séminaire de Théorie des Nombres, Paris 1990–91, Progr. Math. 108 (1993), 127–202 (https://doi.org/10.1007/978-1-4757-4271-8_8). The height pairing (11), its local decomposition and the local heights (§§3.1–3.3).
- M. Hadian, Motivic fundamental groups and integral points, Duke Math. J. 160 (2011), 503–565 (https://doi.org/10.1215/00127094-1444296). Theorem 4.5.
- M. Olsson, Towards non-abelian p-adic Hodge theory in the good reduction case, Mem. AMS 210 (2011), no. 990 (https://doi.org/10.1090/s0065-9266-2010-00625-2). The comparison D_cris(A_n^ét(b,x)) ≅ A_n^dR(b,x).
- B. Chiarellotto and B. Le Stum, F-isocristaux unipotents, Compositio Math. 116 (1999), 81–110 (https://doi.org/10.1023/A:1000602824628). Theorem 5.3 and the Frobenius action on π_1^rig.
- M. Kim and A. Tamagawa, The ℓ-component of the unipotent Albanese map, Math. Ann. 340 (2008), 223–235 (https://doi.org/10.1007/s00208-007-0151-x). Theorem 3.6.
- A. Besser, Coleman integration using the Tannakian formalism, Math. Ann. 322 (2002), 19–48 (https://doi.org/10.1007/s002080100263). The Frobenius-equivariant transport (41).
- J. Tuitman, Counting points on curves using a map to P¹, Math. Comp. 85 (2016); II, Finite Fields Appl. 45 (2017) (https://doi.org/10.1090/mcom/2996). Frobenius lifts and the reduction algorithm behind (45); part II: https://doi.org/10.1016/j.ffa.2016.12.008.
- J. S. Balakrishnan and J. Tuitman, Explicit Coleman integration for curves, Math. Comp. 89 (2020) (https://doi.org/10.1090/mcom/3542). Coleman integrals to the disk of P0 (§6.6).
- B. Edixhoven, Minimal resolution and stable reduction of X_0(N), Ann. Inst. Fourier 40 (1990), 31–67; and thesis, Utrecht 1989 (https://doi.org/10.5802/aif.1202). Theorem 6.5.
- M. Raynaud, p-groupes et réduction semi-stable des courbes, Grothendieck Festschrift III (1990), 179–197 (https://doi.org/10.1007/978-0-8176-4576-2_7). Semi-stability of the quotient model (proof of Theorem 6.6).
- Y. Bilu and P. Parent, Serre's uniformity problem in the split Cartan case, Ann. of Math. 173 (2011); Y. Bilu, P. Parent and M. Rebolledo, Rational points on X_0^+(p^r), Ann. Inst. Fourier 63 (2013) (https://doi.org/10.4007/annals.2011.173.1.13). The case ℓ ≠ 13 of Theorem 1.2 (second paper: https://doi.org/10.5802/aif.2781).
- B. Baran, An exceptional isomorphism between modular curves of level 13, J. Number Theory 145 (2014); and via Torelli's theorem, Math. Res. Lett. 21 (2014) (https://doi.org/10.1016/j.jnt.2014.05.017). The isomorphism (1), the quartic model and J ∼ A_f (second paper: https://doi.org/10.4310/MRL.2014.v21.n5.a1).
- I. Chen, The Jacobians of non-split Cartan modular curves, Proc. LMS 77 (1998) (https://doi.org/10.1112/s0024611598000392). The isogeny decomposition in §1.1.
- V. A. Kolyvagin and D. Yu. Logachëv, Finiteness of the Shafarevich–Tate group and the group of rational points for some modular abelian varieties, Algebra i Analiz 1:5 (1989), 171–196; Leningrad Math. J. 1:5 (1990), 1229–1253 (https://www.mathnet.ru/eng/aa47). Proposition 6.2 (HE.7 plans the extension).
- K. Ribet, Twists of modular forms and endomorphisms of abelian varieties, Math. Ann. 253 (1980) (https://doi.org/10.1007/bf01457819). End(J) ⊗ Q ≃ Q(ζ_7)^+ (§6.1).
- J. S. Balakrishnan, N. Dogra, J. S. Müller, J. Tuitman and J. Vonk, Quadratic Chabauty for modular curves: algorithms and examples, Compositio Math. 159 (2023), 1111–1152 (https://doi.org/10.1112/S0010437X23007170). The authors' sequel: it retracts Lemma 4.7 (§3.5.2), restates §§4–5 with precision bounds, and ships QCMod, the successor of the code [BDM+].

## Mistakes found (`sourceIssues`)

Every finding is in the published text; arXiv v1 differences are listed above. Where each was searched for an existing correction is recorded in the result.

- **E1** (misprint; affects nothing), Published (40), p.921; arXiv v1 §5.1, p.24 (both displays of C_n).
  - *Printed:* I(x_1, x_2) = 1 + Σ_w ∫_{x_1}^{x_2} w(ω_0, …, ω_{2g+2d−2})
  - *Correction:* w(ω_0, …, ω_{2g+d−2}).
  - *Why:* There are 2g + d − 1 differentials ω_0, …, ω_{2g+d−2} (§4.1), and the next sentence substitutes ω_i for T_i with T_0, …, T_{2g+d−2}.
- **E2** (misprint; affects nothing), Published §4.5, step (i) at the end of the section, p.918.
  - *Printed:* Compute η as in (27), as the unique linear combination of ω_{2g}, …, ω_{2g+d−2} such that dΩ_x^T Z Ω_x − η has vanishing residue at all x ∈ X∖Y.
  - *Correction:* … such that Ω_x^T Z dΩ_x − η has vanishing residue at all x ∈ X∖Y, as in (30).
  - *Why:* (29) gives dg_x = Ω_x^T Z dΩ_x − η; checked by cc-442dc5 from C_x^{-1}dC_x = Λ. So (30) is the condition for g_x to exist, and it is the one used in the proof of Lemma 4.10. By property (d), Z is antisymmetric, so dΩ_x^T Z Ω_x = −Ω_x^T Z dΩ_x, and step (i) as printed flips the sign of that term. It then determines a different η unless the residues of Ω_x^T Z dΩ_x vanish. The authors' code (Cartan13 hodge.m, with Ω = −Ω_x) solves Σ_j η_j Res_x(ω_{2g+j}) = −Res_x(ω^T Z Ω), which is (30).
- **E3** (error; affects the proof), Published §5.3.2, display after 'Using the parallel transport formula from Section 5.3.1', p.923, and §5.3.1 ('When applied to the integrals I(x, x_0) and I(b_0, b) …'); arXiv v1 (24), p.25.
  - *Printed:* s_0(b,x)^{-1}∘s^φ(b,x) is the product of [[1,0,0],[∫_x^{x_0}ω,1,0],[∫_x^{x_0}η + ∫_x^{x_0}ω^T Zω, ∫_x^{x_0}ω^T Z, 1]], [[1,0,0],[∫_{b_0}^b ω,1,0],[∫_{b_0}^b η + ∫_{b_0}^b ω^T Zω, −∫_{b_0}^b ω^T Z, 1]] and the matrix at (b_0, x_0).
  - *Correction:* By (41), τ_{b,x}(v) = I(x_0,x)·v·I(b,b_0). The first two factors are left multiplication by I(x_0,x) and right multiplication by I(b,b_0): all limits are swapped (∫_{x_0}^x and ∫_b^{b_0}).
  - *Why:* s^φ(b,x) = τ_{b,x}∘s^φ(b_0,x_0). As printed, the (2,1) block gives α_φ(b,x) = α_φ(b_0,x_0) − ∫_{x_0}^x ω − ∫_b^{b_0} ω. But α_φ(b_0,x_0) = (I−F)^{-1}f(x_0) = ∫_{b_0}^{x_0} ω by Frobenius-equivariance of Coleman integration, and the Frobenius-invariant path from b to x has α_φ(b,x) = ∫_b^x ω = ∫_b^{b_0} + ∫_{b_0}^{x_0} + ∫_{x_0}^x. The printed product also fails to compose as paths. The authors' code transports the other way: Cartan13 U1.m parallel_transport(teichpoints[i], Qppoints[i], …)*frob_equiv_iso(…), and QCMod qc_modular.m pti*PhiAZb_to_b0*isoi with parallel_transport(bQ, b0, …), where parallel_transport(P1, P2) has (2,1) block ∫_{P1}^{P2} ω. The same orientation is printed in arXiv v1 (24) and in BDMTV 2023 (4.18).
- **E4** (gap; affects nothing), Published §4.1, p.909, used in §4.5, pp.916–918 (N, the proof of Theorem 4.11, uniqueness of b_Fil).
  - *Printed:* The differentials ω_0, …, ω_{2g−1} are of the second kind on X and form a symplectic basis of H^1_dR(X/Q).
  - *Correction:* Also require ω_0, …, ω_{g−1} to be holomorphic, i.e. a basis of H^0(X, Ω¹), as in §6 (ω begins (1, x, y)dx/Q_y).
  - *Why:* §4.5 uses it without stating it. N = (0_g, 1_g)^T is 'the matrix of the inclusion Fil⁰V_dR ↪ V_dR' only if [ω_0], …, [ω_{g−1}] span Fil¹. The proof of Theorem 4.11 says that Ω_x − NN^TΩ_x has entries in L[[t_x]], which needs ω_0, …, ω_{g−1} regular at every x ∈ D. It also says that Z has lower right block 0_g because Z ∈ Fil¹, which needs the basis adapted to the Hodge filtration. If some ω_i with i < g had a pole at a point of D (allowed by §4.1), the bundle spanned by (33) would not extend over that point.
- **E5** (error; affects a stated result), Published Lemma 4.7 and its proof, pp.913–914; arXiv v1 Lemma 4.5, p.20.
  - *Printed:* Lemma 4.7. Let Z be a class satisfying properties (a)–(d). If ρ(J) = ρ(J_{Q_p}), then there exists a nice element of Pic(X × X) mapping to Z. … By the p-adic Lefschetz (1,1)-theorem of Berthelot–Ogus [BO83, §3.8], property (b) implies that it lifts to something in NS(J_{Q_p}) ⊗ Q_p.
  - *Correction:* Only the forward direction holds: classes of nice correspondences satisfy (a)–(d). The converse is not established. The space of Rosati-symmetric correspondences can have smaller dimension than ∧²H^1_dR(X_{Q_p})^{φ=p} ∩ Fil¹.
  - *Why:* Property (a) and the Tate conjecture put Z in NS(J_{F_p}) ⊗ Q_p, a Q_p-linear combination of divisor classes. Berthelot–Ogus lifts a divisor class over F_p whose crystalline class lies in Fil¹. A Q_p-combination lying in Fil¹ need not be a combination of such classes: a Z-lattice can meet a Q_p-subspace in smaller rank than the dimension of its intersection with the lattice's Q_p-span. The conclusion 'an element of Pic(X × X)', rather than of Pic(X × X) ⊗ Q, also only holds up to a rational multiple. *Known:* BDMTV, Quadratic Chabauty for modular curves: algorithms and examples, Compositio Math. 159 (2023), §3.5.2: 'need not equal the dimension of ∧²H^1_dR(X_{Q_p})^{φ=p} ∩ Fil¹, as was erroneously claimed in [BDM+19, Lemma 4.5]' (arXiv numbering; Lemma 4.7 in print).
- **E6** (misprint; affects nothing), Published Theorem 4.2, p.910; arXiv v1 Theorem 4.1, p.18.
  - *Printed:* for any n-step unipotent vector bundle V with connection on Y, and any section v of V, there exists a unique map f: A_n^dR(Y) → V such that f(1) = v.
  - *Correction:* … and any v in the fibre b*V, there is a unique morphism f with f(1) = v in the fibre at b, as for a pointed object (V, v), v ∈ ω(V), in §A.1.
  - *Why:* The theorem says it holds 'in the sense of Section A.1', where pointed objects carry a vector in the fibre. For sections it is false already for n = 0: A_0^dR(Y) = (O_Y, d), whose morphisms to (O_Y, d) are multiplication by constants, so no f has f(1) = x for a nonconstant function x on Y.
- **E7** (misprint; affects nothing), Published §6.5, p.933.
  - *Printed:* we obtain the zeroes of det(T_1'(u)) and det(T_2(u'))
  - *Correction:* det(T_2'(u)).
  - *Why:* The matrices on ]U_2[ are T_1'(u) and T_2'(u), defined in the preceding paragraph; u' is not defined.
- **E8** (gap; affects nothing), Published proof of Lemma 3.7, p.907, and the sketch of Theorem 2.3, p.899.
  - *Printed:* By assumption, we have r = g and H^1_f(G_T, V) ≃ H^1_f(G_p, V) ≃ H^0(X_{Q_p}, Ω¹)*
  - *Correction:* Under the assumptions of §1.4 (r = g and J(Q) of finite index in J(Q_p)), what is available is κ(J(Q)) ⊗ Q_p ≃ H^1_f(G_p, V). The equality with H^1_f(G_T, V) needs Sha(J/Q)[p^∞] to be finite. The proof only needs h on κ(J(Q)) ⊗ Q_p. There π_1(A_Z(b,x)) = κ(x − b) lies for x ∈ X(Q), and π_2 = E_Z κ(x − b) + [IA_Z(b)] does too, [IA_Z(b)] being the class of a Chow–Heegner point (Remark 3.11).
  - *Why:* dim H^1_f(G_T, V) = r + corank Sha(J/Q)[p^∞], so the stated isomorphism is an extra hypothesis. The sketch of Theorem 2.3 likewise bounds the global side by r; that holds for the Selmer variety, which §2.1 cuts down by the image of J(Q) ⊗ Q_p. For X_s(13), Sha is finite by Kolyvagin–Logachev, since each conjugate of f has analytic rank one; this is the theorem already used for Proposition 6.2.

## Gaps

- **G-computations** (deferred). The Magma computations of §6 were not re-run: the Tate classes, η, β_Fil, γ_Fil, Frobenius structures and the zero tables. ED.6 must certify them. The code [BDM+] (github.com/jtuitman/Cartan13) and its successor QCMod are public. This extraction checked by direct computation the model, the seven points, smoothness mod 17, #X(F_17) = 20 and the covering of residue disks by U_1, U_2 and (1:1:1).
- **G-numerics** (recorded). Proposition 6.2 rests on a numerical bound L'(f,1) > 0.6 with stated error < 10^{-100}. ED.6 with ED.0's certified numerics must supply an error-controlled proof; Remark 6.3's descent alternative is conditional on GRH.
- **G-inputs** (deferred). The cited theorems (Kim, Hadian, Olsson, Chiarellotto–Le Stum, Kim–Tamagawa, Nekovář, Besser, Edixhoven, Raynaud, Bilu–Parent–Rebolledo, Baran, Chen, Gross–Zagier, Kolyvagin–Logachev, Shimura, Ribet) were read here only as stated in the paper. Listed under prerequisites for later batches.

## Validation

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-BALAKRISHNAN-DOGRA-MULLER-ETAL-19.result.json`: ok.
- `python3 research/blueprint/intake.py check-files research/blueprint/papers/PAPER-BALAKRISHNAN-DOGRA-MULLER-ETAL-19.result.json research/blueprint/papers/PAPER-BALAKRISHNAN-DOGRA-MULLER-ETAL-19.md`: ok.
- **Library checks.**
  - Tau Ceti was searched at f790474 and Mathlib at 082e2d3 by `git grep` for Chabauty, Coleman, Tannaka, isocrystal, p-adic height, Selmer, Atkin–Lehner/Fricke, Néron–Severi, Rosati, Igusa, semistable and Newton polygon.
  - The only relevant declarations found are the Fricke and Atkin–Lehner operators and Tau Ceti's Tannaka reconstruction for affine group schemes. The library audit (data/library-coverage.json) lists NC.0–NC.5 and ED.0–ED.6 as not built.
- **Direct computation (cc-442dc5).**
  - The model Q and the seven points; Q(X−Y, X+Y, X+Z) = 16 × Baran's quartic.
  - Smoothness mod 17 and #X(F_17) = 20: seventeen points in U_1, plus (1:1:0) and (1:−1:0) in U_2, plus (1:1:1).
  - The genus formula; the CM counts behind Theorem 1.1 and Corollary 1.3; the equations (29) and (45) entry by entry; the products in Lemma 5.7 and in §5.3.2.

## Item index

| Item | Kind | Name | Locator | Status | Layers or declarations |
|---|---|---|---|---|---|
| /1 | definition | Split and non-split Cartan modular curves | Published §1.1, p.887 (arXiv v1 §1.1, p.2) | planned | tauceti:TauCetiRoadmap/ModularCurves#…, tauceti:TauCetiRoadmap/ModularCurves#… |
| /2 | theorem | Bilu–Parent–Rebolledo (cited) | Published §1.1, p.887 | missing | routed: EffectiveDiophantineMethods:ED.6 |
| /3 | theorem | Chen's isogeny decomposition (cited) | Published §1.1, p.887 (arXiv v1 attributes it to Momose [Mom86]) | missing | routed: EffectiveDiophantineMethods:ED.6 |
| /4 | theorem | Baran's isomorphism (cited) | Published §1.1, (1), p.888 | missing | routed: EffectiveDiophantineMethods:ED.6 |
| /5 | theorem | Theorem 1.1 | Published Theorem 1.1, p.888 | missing | routed: EffectiveDiophantineMethods:ED.6 |
| /6 | theorem | Theorem 1.2 | Published Theorem 1.2, p.888 (arXiv v1 states it as 'if and only if ℓ ≤ 7') | missing | routed: EffectiveDiophantineMethods:ED.6 |
| /7 | theorem | Corollary 1.3 | Published Corollary 1.3, p.888 | missing | routed: EffectiveDiophantineMethods:ED.6 |
| /8 | theorem | Remark 1.4: class number one | Published Remark 1.4, p.888 | missing | routed: EffectiveDiophantineMethods:ED.6 |
| /9 | definition | Standing notation | Published §1.2, (2), p.889 | planned | SchemeAndStackFoundations:SF.3, AnabelianGeometryAndNonabelianChabauty:NC.5 |
| /10 | construction | Chabauty–Coleman | Published §1.3, (3)–(4), pp.889–890 | planned | EffectiveDiophantineMethods:ED.4, ColemanIntegration:L1 |
| /11 | definition | Quadratic Chabauty pair | Published §1.4, (5), pp.890–891 | missing | routed: AnabelianGeometryAndNonabelianChabauty:NC.5 |
| /12 | theorem | Lemma 1.5: the determinant criterion | Published Lemma 1.5, (6), p.891 | missing | routed: AnabelianGeometryAndNonabelianChabauty:NC.5 |
| /13 | theorem | Equivariant heights reduce the number of points | Published Remark 1.6, §1.7, Remark 1.7, Remark 3.9, pp.892, 895, 908 | missing | routed: AnabelianGeometryAndNonabelianChabauty:NC.5 |
| /14 | definition | Bloch–Kato set-up and the extended Chabauty diagram | Published §2.1, (8), pp.896–897 | planned | PadicHodgeRegulators:L1, AnabelianGeometryAndNonabelianChabauty:NC.3 |
| /15 | definition | Unipotent étale fundamental groups and the unipotent Kummer map | Published §2.1, (9)–(10), p.897 | planned | AnabelianGeometryAndNonabelianChabauty:NC.2, AnabelianGeometryAndNonabelianChabauty:NC.3 |
| /16 | definition | Selmer varieties | Published §2.1, Remark 2.1, pp.897–898 | planned | AnabelianGeometryAndNonabelianChabauty:NC.3 |
| /17 | definition | De Rham fundamental group and Kim's classification | Published §2.1, (9), p.898 | planned | AnabelianGeometryAndNonabelianChabauty:NC.2, AnabelianGeometryAndNonabelianChabauty:NC.4 |
| /18 | definition | Chabauty–Kim loci | Published §2.1, p.898 | planned | AnabelianGeometryAndNonabelianChabauty:NC.4 |
| /19 | theorem | Theorem 2.2 (Kim) | Published §2.2, Theorem 2.2, p.899 | planned | AnabelianGeometryAndNonabelianChabauty:NC.4 |
| /20 | theorem | Theorem 2.3 (Balakrishnan–Dogra) | Published Theorem 2.3, p.899 (arXiv v1 Lemma 2.3) | planned | AnabelianGeometryAndNonabelianChabauty:NC.5 |
| /21 | definition | Symmetric and nice correspondences | Published §2.3, p.900 | planned | AnabelianGeometryAndNonabelianChabauty:NC.5 |
| /22 | theorem | Lemma 2.4 | Published Lemma 2.4, p.900 | missing | routed: AnabelianGeometryAndNonabelianChabauty:NC.5 |
| /23 | construction | The depth-two quotient U_Z | Published §2.3, Remark 2.5, pp.900–901 | planned | AnabelianGeometryAndNonabelianChabauty:NC.5 |
| /24 | definition | Nekovář's p-adic height pairing | Published §3.1, (11), p.901 | missing | routed: AnabelianGeometryAndNonabelianChabauty:NC.5 |
| /25 | definition | Definition 3.1: mixed extensions | Published Definition 3.1, p.902 | missing | routed: AnabelianGeometryAndNonabelianChabauty:NC.5 |
| /26 | theorem | Local decomposition of the height | Published §3.1, pp.902–903 | missing | routed: AnabelianGeometryAndNonabelianChabauty:NC.5 |
| /27 | construction | The local height away from p | Published §3.2, p.903 | missing | routed: AnabelianGeometryAndNonabelianChabauty:NC.5 |
| /28 | theorem | Lemma 3.2 | Published Lemma 3.2, p.903 | missing | routed: AnabelianGeometryAndNonabelianChabauty:NC.5 |
| /29 | definition | Filtered φ-modules and their extensions | Published Definition 3.3, (12), p.904 | planned | PadicHodgeTheory:R06.2 |
| /30 | definition | Mixed extensions of filtered φ-modules | Published Definition 3.4, Remark 3.5, (13)–(14), pp.904–905 | missing | routed: AnabelianGeometryAndNonabelianChabauty:NC.5 |
| /31 | construction | The local height at p | Published §3.3, (15), p.905 | missing | routed: AnabelianGeometryAndNonabelianChabauty:NC.5 |
| /32 | theorem | The height formula (17) | Published (16)–(17), pp.905–906 | missing | routed: AnabelianGeometryAndNonabelianChabauty:NC.5 |
| /33 | construction | A_Z(b), twisting and the pair (θ, Υ) | Published §3.4, (18)–(19), pp.906–907 | missing | routed: AnabelianGeometryAndNonabelianChabauty:NC.5 |
| /34 | theorem | Theorem 3.6 (Kim–Tamagawa) | Published Theorem 3.6, p.907 | planned | AnabelianGeometryAndNonabelianChabauty:NC.5 |
| /35 | theorem | Lemma 3.7 | Published Lemma 3.7, pp.907–908 | missing | routed: AnabelianGeometryAndNonabelianChabauty:NC.5 |
| /36 | theorem | Corollary 3.8 | Published Corollary 3.8, p.908 | missing | routed: AnabelianGeometryAndNonabelianChabauty:NC.5 |
| /37 | theorem | Independence of the splitting and the character | Published Remarks 3.10, 3.12, (20), pp.908–909 | missing | routed: AnabelianGeometryAndNonabelianChabauty:NC.5 |
| /38 | theorem | Chow–Heegner points (Remarks 3.11, 5.6) | Published Remark 3.11, Remark 5.6, (47), pp.908, 925 | missing | routed: AnabelianGeometryAndNonabelianChabauty:NC.5 |
| /39 | definition | Set-up for the explicit computation | Published §4.1, pp.909–910 | missing | routed: EffectiveDiophantineMethods:ED.6 |
| /40 | construction | The universal unipotent connection on Y | Published §4.2, (21), p.910 | missing | routed: AnabelianGeometryAndNonabelianChabauty:NC.2 |
| /41 | theorem | Theorem 4.2 (Kim): universality | Published Theorem 4.2, p.910 (arXiv v1 Theorem 4.1) | missing | routed: AnabelianGeometryAndNonabelianChabauty:NC.2 |
| /42 | theorem | Lemma 4.3: the trivialisation respects composition | Published (22)–(24), Lemma 4.3, p.911 | missing | routed: AnabelianGeometryAndNonabelianChabauty:NC.2 |
| /43 | theorem | Corollary 4.4 | Published Corollary 4.4, pp.911–912 | missing | routed: AnabelianGeometryAndNonabelianChabauty:NC.2 |
| /44 | definition | Filtered connections | Published §4.3, p.912 | missing | routed: AnabelianGeometryAndNonabelianChabauty:NC.2 |
| /45 | theorem | Theorem 4.5 (Hadian) | Published Theorem 4.5, Remark 4.6, pp.912–913 (arXiv v1 Theorem 4.4) | missing | routed: AnabelianGeometryAndNonabelianChabauty:NC.2 |
| /46 | definition | Admissible Tate classes Z | Published §4.4, p.913 | missing | routed: AnabelianGeometryAndNonabelianChabauty:NC.5 |
| /47 | theorem | Lemma 4.7 (corrected) | Published Lemma 4.7, pp.913–914 (arXiv v1 Lemma 4.5) | missing | routed: AnabelianGeometryAndNonabelianChabauty:NC.5 |
| /48 | construction | The filtered connection A_Z | Published (25), p.914 | missing | routed: AnabelianGeometryAndNonabelianChabauty:NC.5 |
| /49 | theorem | The connection of A_Z on Y | Published (26)–(27), Remarks 4.8–4.9, pp.914–915 | missing | routed: EffectiveDiophantineMethods:ED.6 |
| /50 | construction | Gauge transformations at the points of D | Published (28)–(29), p.915 | missing | routed: EffectiveDiophantineMethods:ED.6 |
| /51 | theorem | Lemma 4.10: uniqueness of η | Published Lemma 4.10, (30), pp.915–916 | missing | routed: EffectiveDiophantineMethods:ED.6 |
| /52 | theorem | Theorem 4.11: the Hodge filtration of A_Z | Published (31)–(36), Theorem 4.11, pp.916–918 | missing | routed: EffectiveDiophantineMethods:ED.6 |
| /53 | construction | Algorithm for the Hodge filtration | Published end of §4.5, p.918 | missing | routed: EffectiveDiophantineMethods:ED.6 |
| /54 | definition | Unipotent isocrystals and the Frobenius structure | Published §5.1, (37), pp.918–919 | missing | routed: AnabelianGeometryAndNonabelianChabauty:NC.2 |
| /55 | theorem | Lemma 5.2 | Published Lemma 5.2, (38), p.919 | missing | routed: AnabelianGeometryAndNonabelianChabauty:NC.2 |
| /56 | theorem | Theorem 5.3 (Chiarellotto–Le Stum) | Published Theorem 5.3, p.920 (arXiv v1 Theorem A.7) | missing | routed: AnabelianGeometryAndNonabelianChabauty:NC.2 |
| /57 | construction | Frobenius operators on de Rham path torsors | Published §5.2, (42), pp.920–921 | missing | routed: AnabelianGeometryAndNonabelianChabauty:NC.2 |
| /58 | construction | Iterated integrals and the transport τ_{b,x} | Published §5.2.1, (39)–(41), pp.920–921 (arXiv v1 §5.1, Lemma 5.3, (20)–(21)) | planned | ColemanIntegration:L1 |
| /59 | construction | The Frobenius operator on A_Z(b,x) | Published §5.3, §5.3.1, (43)–(44), pp.921–922 | missing | routed: EffectiveDiophantineMethods:ED.6 |
| /60 | theorem | The Frobenius structure (45) | Published §5.3.2, (45), pp.922–923 | missing | routed: EffectiveDiophantineMethods:ED.6 |
| /61 | theorem | The Frobenius-equivariant splitting | Published §5.3.2, p.923 | missing | routed: EffectiveDiophantineMethods:ED.6 |
| /62 | theorem | Lemma 5.4: comparison for A_Z | Published Lemma 5.4, (46), pp.923–924 | missing | routed: AnabelianGeometryAndNonabelianChabauty:NC.5 |
| /63 | theorem | Olsson's non-abelian comparison | Published proof of Lemma 5.4, p.923 (arXiv v1 Theorem A.8) | planned | AnabelianGeometryAndNonabelianChabauty:NC.2 |
| /64 | theorem | Lemma 5.5: the local height at p | Published Lemma 5.5, p.924 (arXiv v1 Lemma 5.4) | missing | routed: EffectiveDiophantineMethods:ED.6 |
| /65 | theorem | Changing the base point (Lemma 5.7) | Published §5.5, (48)–(49), Lemma 5.7, pp.925–926 (arXiv v1 Lemma 5.5) | missing | routed: EffectiveDiophantineMethods:ED.6 |
| /66 | definition | Rigid triples and overconvergent isocrystals | Published §A.2, Definition A.5, pp.937–938 | planned | PadicDifferentialEquationsAndRigidCohomology:RD.3 |
| /67 | definition | Unipotent Tannakian categories and the universal objects A_n(C, ω) | Published §A.1, Definition A.1, pp.934–935 | missing | routed: AnabelianGeometryAndNonabelianChabauty:NC.2 |
| /68 | definition | Universal pointed objects | Published Definition A.2, p.935 | missing | routed: AnabelianGeometryAndNonabelianChabauty:NC.2 |
| /69 | theorem | Lemma A.3 | Published Lemma A.3, p.935 | missing | routed: AnabelianGeometryAndNonabelianChabauty:NC.2 |
| /70 | construction | Path torsors of the universal objects (Lemma A.4) | Published §A.1.2, Lemma A.4, pp.936–937 | missing | routed: AnabelianGeometryAndNonabelianChabauty:NC.2 |
| /71 | theorem | X_0^+(ℓ²) ≃ X_s(ℓ) | Published §6, p.926 | missing | routed: ModularCurvesPartII:R13.5 |
| /72 | definition | Models, semi-stability and the Igusa curve | Published §6.2, pp.927–928 | missing | routed: ModularCurvesPartII:R13.5 |
| /73 | theorem | Theorem 6.5 (Edixhoven) | Published Theorem 6.5, p.928 (arXiv v1 Theorem 6.6) | missing | routed: ModularCurvesPartII:R13.5 |
| /74 | theorem | Theorem 6.6 | Published Theorem 6.6, pp.928–929 (arXiv v1 Theorem 6.7) | missing | routed: ModularCurvesPartII:R13.5 |
| /75 | theorem | Genus of X_s(ℓ) | Published §6.2, after Figure 1, p.929 | missing | routed: ModularCurvesPartII:R13.5 |
| /76 | theorem | Corollary 6.7 | Published Corollary 6.7, Remark 6.8, p.929 (arXiv v1 Corollary 6.8) | missing | routed: ModularCurvesPartII:R13.5 |
| /77 | theorem | End(J) and the Picard number of J_s(13) | Published §6.1, pp.926–927 | missing | routed: EffectiveDiophantineMethods:ED.6 |
| /78 | definition | The modular quotient A_f | Published proof of Proposition 6.2, p.927 | planned | ModularCurvesPartII:R14.5 |
| /79 | theorem | Analytic rank one gives rank g (Gross–Zagier, Kolyvagin–Logachev) | Published proof of Proposition 6.2, p.927 | planned | HeegnerPointEulerSystems:HE.7, GrossZagierAndArithmeticHeights:GZ.8 |
| /80 | definition | L(f,s) and the Fricke sign | Published proof of Proposition 6.2, p.927 | planned | tauceti:TauCetiRoadmap/ModularForms#…, tauceti:TauCetiRoadmap/ModularForms#… |
| /81 | definition | The Fricke involution on S_2(Γ_0(N)) | Published proof of Proposition 6.2, p.927 (W_169) | library | tauceti:TauCeti.normalizedFrickeOperatorCusp, tauceti:TauCeti.normalizedFrickeOperatorCusp_involutive, tauceti:TauCeti.isCompl_eigenspace_normalizedFrickeOperatorCusp |
| /82 | theorem | Proposition 6.2 | Published Proposition 6.2, p.927 (arXiv v1 Proposition 6.3) | missing | routed: EffectiveDiophantineMethods:ED.6 |
| /83 | theorem | Eichler–Shimura on H^1_dR | Published §6.4, (50), p.930 | planned | AutomorphicGaloisRepresentations:R19.1 |
| /84 | construction | Nice classes from Hecke operators | Published §1.5, §6.4, pp.892, 930–931 | planned | ModularCurvesPartII:R14.1, AnabelianGeometryAndNonabelianChabauty:NC.5 |
| /85 | theorem | The model of X_s(13) and its seven rational points | Published §6.3, pp.929–930 | missing | routed: EffectiveDiophantineMethods:ED.6 |
| /86 | theorem | The first chart: basis, Tate classes and Hodge data | Published §6.4, pp.930–931 | missing | routed: EffectiveDiophantineMethods:ED.6 |
| /87 | construction | Frobenius lifts and the functions θ_{Z_i} | Published §6.4, p.931 | missing | routed: EffectiveDiophantineMethods:ED.6 |
| /88 | theorem | Equivariant heights and the matrices T_i | Published §6.4.1, pp.931–932 (arXiv v1 uses P4 in place of P5) | missing | routed: EffectiveDiophantineMethods:ED.6 |
| /89 | theorem | Precision and Newton polygons | Published §6.4.1, pp.932–933 | missing | routed: EffectiveDiophantineMethods:ED.6 |
| /90 | theorem | Rational points on ]U_1[ | Published §6.4.1, Remark 6.9, p.933 | missing | routed: EffectiveDiophantineMethods:ED.6 |
| /91 | theorem | Rational points on ]U_2[ | Published §6.5, p.933 | missing | routed: EffectiveDiophantineMethods:ED.6 |
| /92 | theorem | The residue disk of P0 | Published §6.6, p.934 | missing | routed: EffectiveDiophantineMethods:ED.6 |
