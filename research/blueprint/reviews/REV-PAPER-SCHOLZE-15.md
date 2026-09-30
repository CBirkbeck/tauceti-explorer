# REV-PAPER-SCHOLZE-15

**Verdict: accept.** Independent review by Claude Code, session `cc-48533a`, 29 September 2026, issue #4504. The extraction was made by Claude Code, session `cc-39fac3`, in issue #4502 (PR #4563).

- **Repository.** Reviewed at origin/main.
- **Pinned libraries.** Mathlib 082e2d3 and Tau Ceti f790474.
- **Paper.** Scholze, *On torsion in the cohomology of locally symmetric varieties*, Ann. of Math. 182 (2015), 945–1066. Both of these were read:
  - the published PDF, https://annals.math.princeton.edu/wp-content/uploads/annals-v182-n3-p03-p.pdf (SHA-256 ebac854f47381c19a987b43b59d2c05cad55c3186c4d8cde067a7be0d06cbd16);
  - arXiv:1306.2070v2 and its TeX source (PDF SHA-256 e15abf4e7ab3e400ecaae963e5ccd80b340919d8499ebfde5b55f2ceb83ab285).

## Method

Four readers worked in parallel:

- items in §§1–3.2;
- items in §§3.3–5;
- the recorded mistakes, plus a fresh reading of §§2–3;
- the routes, the missing items and the prerequisites, plus a fresh reading of §§4–5.

How the checks were done:

- **Statements.** Every statement was compared with the published text. Pages were rendered where a symbol mattered.
- **Stages.** Every cited stage description and node was read.
- **Missing items.** They were searched for in the atlas (stages, packets, decompositions, proposed roadmaps and accepted paper routes) and in the Mathlib and Tau Ceti declaration index.
- **Conflicting corrections.** Where two readers proposed different corrections to one item (/39, /66, /67, /70, /78, /95), the lead reviewer chose or merged them.
- **Duplicate findings.** Two readers found the same new mistakes independently: the Lagrangian charts, the sign in Lemma 5.2.5, and l_0/q_0. Each was recorded once.
- **Checker.** `python3 scripts/check_paper.py` reports the corrected file `ok`.

## Outcome

The extraction is careful and nearly complete, and its routing is sound. The corrected file has 127 items (119 planned, 8 missing), 8 routes (all accepted) and 46 recorded mistakes. None of the mistakes affects a main theorem of the paper. The substantive new ones are:

- **E16.** For g ≥ 2, GSp_{2g}(ℤ_p) permutes only the 2^g Lagrangian charts Fl_J. On the Lagrangian Grassmannian the Plücker relation s_13 = −s_24 holds, and for g = 2 the chart {1,3} has p³ − p points mod p, against p³ for the Lagrangian charts. So Theorem 3.3.18(i), Theorem 4.1.1(i) and Lemma 4.3.3 are proved only for Lagrangian J. These charts cover Fl, so every later use goes through.
- **E17.** The formula for C_m(R′) in Corollary 3.2.6 fails when R′ is not integrally closed in R′[1/p].
- **E18.** The Frobenius lifts of Theorem 3.2.15 are not flat integrally for ε > 0.
- **E19.** Γ₀(p^m) must use the similitude factor, not det, for X*_{Γ₀(p^m)} to live over ℚ(ζ_{p^m}).
- **E37.** Corollary 5.1.11 needs its weight condition m > n (m ≥ n in the CM case).
- **E39.** The new prime ℓ before Lemma 5.3.6 must also satisfy I_{0,ℓ} = I_0.
- **E44–E45.** In the proof of Corollary 5.4.2, the quadratic twist may not exist unramified outside S, and a kernel containment is reversed.
- **E20 and E21.** Gaps in the proofs of Corollary 2.3.5 and Lemma 2.2.8. E21 is already recorded in the atlas as PerfectoidSpaces/E19.

## Route decisions

- **Route 1: accept.** R07.6's text plans 'the deformation-theoretic tangent and obstruction calculations', the roadmap README (ownership paragraph) makes R07.6 the owner of deformations of finite flat/p-divisible groups over nilpotent bases, and R07.6 alone in that roadmap depends on DerivedDeRhamCohomology DD.0–DD.1, which supply the cotangent complexes behind the co-Lie complexes ℓ̌_H, ℓ̌_G of Theorem 3.2.1. The stage graph runs R07.6 → A4 → T0 → T3, so the consumer (Corollary 3.2.2 in T3) sits downstream; no cycle. I searched stages, packets, decompositions and the Mathlib/Tau Ceti baseline: nothing plans Illusie's obstruction theory for group schemes. Overlap to record: PAPER-PILLONI-20's accepted route 11 names Illusie LNM 283 as a source for R07.1–R07.2 and routes a consequence of Th. VII.4.2.5 to R07.1; plan the theorem once, here (itemChanges, item 27).
- **Route 2: accept.** The route's stages are the right owners, but its reason and the notes of items 30 and 57 name the wrong one. Item 28 (Corollary 3.2.2, the explicit-constant lifting lemma behind canonical subgroups, uniform in p = 2) belongs in T3 ('existence, uniqueness ... of canonical subgroups', 'independent proofs for the p = 2 estimates'). Items 30 and 57 do not belong in T3, whose text takes 'the Hasse neighbourhoods R2/H2/C6' as input. They belong in T0, which is also named: T0 plans 'the relevant Hodge ideal' and the extension 'to semi-abelian degeneration charts with the explicit toric/abelian pieces', and the accepted route 8 of PAPER-PILLONI-20 already gives T0 'Ha(G) = det V^⋆ ... for a BT_1 G over any F_p-scheme'. Ha(A/S) is the case G = A[p], and Lemma 3.3.2 sits in the situation of Proposition 3.3.1, which T0 plans (item 56). The route reason's claim that nothing supplies the Siegel Ha is true of R2/H2/C6 but not of T0 after PILLONI-20. Accept with the note corrections in itemChanges (items 30, 57). The planned items (29, 31–35 in T3; 39–41, 61 in T3/T4; 56 in T0/T2; 59 in T2) are all planned in stages the route names; T3/T4 are written for BHW's Hilbert case, but PerfectoidShimuraVarieties S1 ('The Siegel construction') depends on T3–T4, which is the extraction's reading and I accept it. The route reason and the notes of items 30 and 57 were corrected in place.
- **Route 3: accept.** As corrected in place, the route now carries item 80 only (Proposition 5.1.1, the holomorphic discrete series π_k of Sp_{2n}(ℝ) and U(n,n)) to AF.1/AF.4. That is where the accepted routes of PAPER-PILLONI-20 (13), PAPER-CALEGARI-GERAGHTY-20 (10) and PAPER-BOXER-PILLONI-26 (14) put discrete series and their Harish-Chandra parameters. The original route also sent item 81 to AF.5. That item is a statement on the minimal compactification of a Shimura variety, which AutomorphicFormsOnReductiveGroups (upstream of all Shimura-variety roadmaps) cannot state, so it moved to route 6.
- **Route 4: accept.** Planned items only. PerfectoidShimuraVarieties names 'Scholze's construction for Siegel/Hodge type' as a selected source, and there is no PerfectoidShimuraVarieties packet or decomposition (checked research/blueprint/packets and data/decompositions). Every item names at least one of S0–S3 in its planned list, and the stage texts cover them. S0 covers the p-level towers and limits (26, 58). S1 covers the anticanonical tower, Frobenius-approximating transition maps, perfectoidness, the covering by translates, the minimal compactification and the closedness of the boundary (38–54, 59, 61–63, 65, 66). S2 covers Hodge type (68–70, and 114's use of Theorem 4.1.1 for unitary similitude groups). S3 covers the period map and π_HT*ω (64, 65, 67, 69, 71). If the Lagrangian-J correction in newIssues is adopted, S1/S2 should state Theorems 3.3.18(i)/4.1.1(i) for Lagrangian J.
- **Route 5: accept.** Planned items only. The TC README's source table maps §§2–5 to TC.0–TC.4 and the named suppliers, and there is no TC packet. Every listed item names one of TC.0–TC.4 in its planned list, and the stage texts cover them: TC.0 the bounded-function extension theorem and Hartogs; TC.1 the ω ≅ π_HT*ω_Fl lattice comparison and approximation; TC.2 the completed/torsion comparison and amplitude; TC.3 the Levi Satake identities and factor extraction with nilpotent coefficients; TC.4 the specialization output. One caveat, which the extraction raises itself: TC's summary says the target is 'not an additional requirement to formalize its final Galois-representation theorem', and TC.4 says 'No new terminal claim about all Galois representations of all groups is part of this layer'. So calling Theorem 5.4.1, Corollaries 5.4.3–5.4.4 and Theorem 1.0.3 (items 3, 109, 111, 112) planned rests on reading that as a statement of scope. I accept that reading. IgusaVarietiesAndTorsionConcentration IG.6 depends on TC.4 for 'lower-rank torsion Galois systems', which is exactly Corollary 5.4.3, and three accepted extractions (PAPER-ALLEN-ETAL-23/69 and /72, PAPER-CARAIANI-NEWTON-23/thm-2-1-24, PAPER-CARAIANI-SCHOLZE-24/2) mark the theorem planned in TC.2–TC.4/IHG.5. The design job for TC should state Theorem 5.4.1 explicitly and use the corrected proof steps in newIssues (the new-ℓ condition before Lemma 5.3.6, the kernel containment in Corollary 5.4.2).
- **Route 6: accept.** Added in review. Item 81 joins the Part II IntegralCoherentHeckeComplexes (parent AutomorphicBundles), which PAPER-CALEGARI-GERAGHTY-18 proposes. The item says that the Hecke eigensystems on holomorphic cusp forms H^0(X*_K, ω^k ⊗ ℐ) are those of cuspidal π with π_∞ ≅ π_k, semisimple by the Petersson product. Three accepted extractions join that Part II with the same dictionary, and planning it once there avoids a second owner.
- **Route 7: accept.** Added in review. The compactly supported torsion primitive comparison used in Theorem 4.2.1 goes with Scholze 2013 Theorem 5.1. The accepted routes of PAPER-SCHOLZE-13 (1) and PAPER-ZAVYALOV-25 (7) already send that theorem to PadicHodgeTheory P8, and the P7 packet records that no stage owns Scholze 2013 §5 yet.
- **Route 8: accept.** Added in review. Clozel's result says that a regular L-algebraic cuspidal representation of GL_n contributes to cuspidal cohomology with the matching coefficients. That is the characteristic-zero comparison of Betti and relative Lie algebra cohomology with automorphic forms which ALS.5 plans, consuming AutomorphicSpectralTheory AS.5 and AF.4's cohomological representations.

## Scope question for the maintainer

TorsionCohomologyInfrastructure's summary says its target is "not an additional requirement to formalize its final Galois-representation theorem".

The review nevertheless keeps Theorem 5.4.1, Theorem 1.0.3 and Corollaries 5.4.3–5.4.4 planned in TC.3–TC.4 with IHG.5. Several things support that reading:

- TC.3 plans the determinant extraction "at the arithmetic point of use";
- IgusaVarietiesAndTorsionConcentration IG.6 depends on TC.4 for lower-rank torsion Galois systems;
- CompletedCohomologyPartII CC.8 assigns torsion Galois determinants to TC and IHG;
- three accepted extractions read it the same way.

The TC design should state Theorem 5.4.1 explicitly, with the corrected proof steps E39, E44 and E45. If the maintainer reads the summary as excluding the theorem, items /3, /109, /111, /112 and /122 become missing and need a Part II of TorsionCohomologyInfrastructure.

## Prerequisites

All five DOIs match Crossref, and none of the five papers is yet an atlas source. Other extractions already request four of them: FGL, Shin's appendix, Morel, and Caraiani–Le Hung. PAPER-PILLONI-20 already asks for Illusie's LNM 283. The maintainer should merge these requests. Morel is cited only as an alternative ("cf. also") in Remark 5.4.6.

## Item corrections

| Item | Fields | Correction |
|---|---|---|
| /1 | locator | The whole conjecture (and the definition of L-algebraic after it) is on printed p. 946 (annals.txt lines 69–91); p. 947 carries only footnote 1, which is not part of the statement. |
| /2 | locator | The §4-introduction definitions H̃^i_{K^p}(ℤ/p^nℤ) = colim_{K_p} H^i(X_{K_pK^p}, ℤ/p^nℤ) and H̃^i_{K^p}(ℤ_p) = lim_n H̃^i_{K^p}(ℤ/p^nℤ) are printed on p. 1017; p. 1019 carries Theorem 4.1.1. |
| /3 | planned | Consistency only: the item's own note says the torsion determinant is planned by 'TC.2–TC.4', and item /109 (Theorem 5.4.1, of which Theorem 1.0.3 is the residual form) lists TC.2 (the completed/torsion cohomology comparison that carries Theorem 4.3.1). Status 'planned' itself I concur with; see notes. |
| /5 | locator, planned | The second part ('Moreover, there is a unique invertible sheaf 𝔏 on 𝔛 with generic fibre ℒ, and such that s_j^{(i)} ∈ H^0(𝔘_i, 𝔏) …') starts on printed p. 953 (annals.txt lines 416–419) and ends on p. 954. AdicSpacesPartII R2's description plans admissible formal schemes, generic fibres, admissible blow-ups and section/Hasse domains; it says nothing about gluing an integral line bundle from compatible sections, … |
| /8 | note | The last sentence of the note is garbled ('𝒵 = 𝒳 ×_{Z}'); the paper (p. 956, after Remark 2.2.3) says 'We will often identify Z = 𝒵 and say that 𝒵 → 𝒳 is a (Zariski) closed embedding.' |
| /9 | note | Read the node: '(c) a morphism g : W → X from a perfectoid space factors through ι_I if and only if …'. Remark 2.2.3 (p. 956) is for arbitrary (T, T^+) with T^+ bounded. Status 'planned' (P4 plans Zariski closed immersions and their universal property) is still right; the note should record the gap. |
| /11 | planned | P4's description says 'The stronger assertion "Zariski closed implies strongly Zariski closed", ECD Theorem 5.8, is supplied by Q4 … P4 proves the earlier definitions, the direction from an already given surjective perfectoid quotient, the diagonal assertions, and the other §5 criteria'. Lemma 2.2.5 is the characteristic-p case of that stronger assertion (a closed embedding in characteristic p is strongly Zariski … |
| /22 | locator | Definition 2.3.8 is on p. 966 (line 1151) but the paragraph after it ('One checks easily that this notion is independent of the choice of t …', the t = 0 statement) is on p. 967 (lines 1161–1169), and the item's statement includes it. |
| /26 | statement | The printed det γ ≡ 1 does not make X*_{Γ_0(p^m)} live over ℚ(ζ_{p^m}); the similitude condition is needed (new source issue on Definition 3.1.1). |
| /27 | locator, note | Part (ii) of the theorem and its proof are on p. 976 (lines 1643–1648). Records the overlap with an accepted route so that the design job plans Illusie's theorem once. |
| /28 | locator | Remark 3.2.3 (quoted in the note, errors p^{1−2ε} and p^{1−3ε}) ends on p. 977 (lines 1689–1692). |
| /30 | note | The note names T3 as the owner, but T3's text takes 'the Hasse neighbourhoods R2/H2/C6' as input and does not construct Ha. The accepted PAPER-PILLONI-20 route 8 (review: 'The route asks T0 for the Hasse invariant ... in the generality the paper uses') makes T0 the owner of Ha for BT_1 groups over any F_p-scheme, and T0 is among route 2's stages. So the status (missing) and the route stand, but the owning stage … |
| /31 | statement | Fragment replacement. The printed equality is false for non-integrally-closed R′; see the counterexample in newIssues (Corollary 3.2.6). |
| /32 | locator | The strong-canonical-subgroup clause of the definition ('Moreover, if Ha(A_1/Spec(R/p))^{p^m} divides p^ε, then we say that C_m is a canonical subgroup', with footnote 9) is on p. 979 (line 1786). |
| /39 | statement | Fragment replacement. Integral local freeness fails for ε > 0: the special-fibre rank jumps over the non-ordinary locus. See newIssues (proof of Theorem 3.2.15). |
| /40 | statement | The square in Theorem 3.2.15(ii) (p. 985, checked on the rendered page) is between 𝒳*(p^{−m−1}ε) and 𝒳*(p^{−m}ε), so its left arrow is the extension F̃_{𝔛*} (the proof, p. 987, distinguishes F̃_{𝔛(p^{−1}ε)} from its extension F̃_{𝔛*(p^{−1}ε)}); items use corrected statements (PROTOCOL §18). |
| /42 | locator | Lemma 3.2.17 closes §3.2.2 ('Let us state one last result in this subsection', line 2260); §3.2.3 'Tilting' begins after it (line 2277). Same in arXiv v2 (III.2.3 starts after Lemma III.2.17). |
| /46 | locator | §3.2.4 'Tate's normalized traces' begins on p. 991 (line 2412) immediately before Lemma 3.2.21; §3.2.3 ends with Corollary 3.2.20. |
| /47 | locator | As for /46: Corollary 3.2.22 is in §3.2.4. |
| /48 | locator | As for /46: Corollary 3.2.23 is in §3.2.4. |
| /49 | locator | §3.2.5 'Conclusion' begins on p. 995 (line 2629), before the g ≥ 2 assumption and Lemma 3.2.24; the introduction (p. 952) also refers to 'Section 3.2.5' for this use of the Hebbarkeitssatz. Same numbering in arXiv v2 (III.2.5). |
| /50 | locator | As for /49: in §3.2.5. |
| /51 | locator, statement | As for /49: in §3.2.5; the paragraph before Lemma 3.2.27 (p. 998) defines the characteristic-p Γ_1(p^m) spaces used in Corollary 3.2.28 (see the statement change). Missing hypothesis and undefined objects. Lemma 3.2.27 and Corollary 3.2.28 sit under 'Assume that g ≥ 2 until further notice' (p. 995); the proof applies Lemma 2.3.9, which needs the boundary V(J) of codimension ≥ 2, and the definition … |
| /52 | locator | As for /49: in §3.2.5. |
| /53 | locator | As for /49: in §3.2.5. |
| /54 | locator | As for /49: in §3.2.5. |
| /55 | locator, note, planned | The Plücker paragraph ('Before we continue, let us recall some facts about the geometry of Fl …') follows the proof of Lemma 3.3.8 and precedes Lemma 3.3.9 on p. 1008; Lemma 3.3.8 already uses Fl(ℚ_p) but not Fl_J. No cited stage constructs Fl. T2 consumes 'the expected flag variety', and T4 defines 'balls about the integral points of the restriction-of-scalars flag variety' for the Hilbert (BHW) estimates, which … |
| /57 | note | As for item 30: the owning stage within route 2 is T0, not T3 (T3 consumes Hasse neighbourhoods). |
| /61 | locator | Remark 3.3.7 (the referee's argument) is printed on p. 1007, not p. 1006. |
| /66 | statement | The locator cites Theorem 3.1.2(iii), whose statement (a basis of opens U ⊂ Fl, not only the Fl_J) is not transcribed; low priority, the Fl_J form is the precise version. Fragment replacement. The paper's proof reaches only the GSp_{2g}(ℚ_p)-translates of Fl_{g+1,…,2g}, relying on a false transitivity claim for the other J. See newIssues (p. 1008). |
| /67 | locator | Pages corrected (V2) and Theorem 3.1.2(ii) added (V1). |
| /68 | locator, name | The setup the item states (G with simply connected derived group, D, K_∞, X_K = G(ℚ)∖[D × G(𝔸_f)/K], X*_K, the fixed ℂ ≅ ℚ̄_p and C, ω_K, H^0(X*_K, ω_K^{⊗k}) as complex automorphic forms) is printed on p. 1016; p. 1017 discusses completed cohomology only. 'Normalization-free' is not the paper's term. The paper's symbol is not X_K** either: in the arXiv v2 PDF, which is the same text, every occurrence in §§4.1–4.3 … |
| /69 | locator | Theorem 4.1.1 begins at the foot of p. 1018; the existence statement, π_HT and parts (iii)–(iv) are printed on p. 1019. |
| /70 | statement | Fragment replacement. Theorem 4.1.1(i) is deduced from Theorem 3.3.18(i) for G′, which is proved only for these J. See newIssues (p. 1008). |
| /71 | locator | Part (v) is printed on p. 1019. |
| /72 | statement | The paper defines the second trace map in the proof of Theorem 4.2.1 (p. 1022) by almost purity ([52, Th. 7.9(iii)], [52, Def. 4.14]). The finite-level traces play no part in that definition. Lemma 4.3.3 (pp. 1026–1027) is a later comparison: its lower trace is 'as defined in the proof of Theorem 4.2.1'. The printed item reverses the dependence. |
| /74 | planned | CC.7's stage text says that such vanishing and 'compactification-specific geometry are additional arithmetic theorems, not properties of the abstract limit functor', and CC.8's text assigns 'vanishing' to TC/IHG/IG/R31. The CC.7 decomposition node cited in the note records Corollaries 4.2.2–4.2.3, but with the reviewer's placement note: 'The corollaries are kept here verbatim pending the orchestrator's decision … |
| /77 | locator, note | The statement runs onto p. 1026 ('maps S into R. Moreover, for any integrally closed ideal …'), where the proof also is. I read both declarations at the baseline. They cover the domain case and are worth citing for whoever builds this item. |
| /78 | statement | Fragment replacement. The lemma uses Theorem 4.1.1(i) for J, which is established only for these J; the proof of Theorem 4.3.1 needs only the Čech cover by them. See newIssues (p. 1008). |
| /79 | locator | The item's last sentence (S the set of places of F above S^+) is defined on p. 1036, before Corollary 5.1.7; p. 1032 contains nothing the item uses. |
| /80 | note | AF.5 (the GL_1 and GL_2/ℚ dictionaries) is not where this proposition belongs; the precedent routes use AF.1/AF.4. See routeVerdicts, route 3. |
| /81 | kind, note | The statement asserts facts rather than defining an object: the image of 𝕋⊗ℂ is a product of copies of ℂ (via the Petersson product), and every character x comes from a cuspidal π of G_0 with the given Satake parameters and π_v ≅ π_k at infinity (p. 1036). The only construction is the Hecke action on cusp forms, which is the separate missing item listed below. The printed note says B4 plans only 'Hilbert … |
| /83 | statement | Fragment replacement in the Remark 5.1.5 clause: (Π′^∨)^c ≅ Π/·/^{−(k+1−n)/2} = Π′ ⊗ /·/^{n−1−k}; see newIssues. |
| /84 | locator, planned | The unramified transfer map and the elements T_{i,v} of part (i) are printed on p. 1035. IHG.3 is GL_n-only ('Do not assert this GL_n polynomial for a general reductive group without choosing a representation of its L-group'), and TC.3 is the Levi Satake map of §5.2. Neither constructs the Satake isomorphism for Sp_{2n}. SR.4 does: 'For unramified G and a hyperspecial subgroup K, construct the Satake transform … |
| /85 | planned | As for item 84: SR.4 owns the Satake isomorphism for the unramified quasi-split unitary group at split and inert places. ET.4 builds the unitary 'finite-place transfer maps … spherical Hecke transfers', and IHG.3 the GL_{2n} Hecke polynomial. TC.3 is the §5.2 Levi Satake map and does not plan Lemma 5.1.6. Status: planned. |
| /88 | locator | Corollary 5.1.10 and its one-line proof are on p. 1037; p. 1038 begins with Corollary 5.1.11. |
| /89 | statement | Fragment replacement. The proof needs determinants on every 𝕋_{K,mk}, which Corollaries 5.1.7/5.1.10 give only for weights mk > n (resp. ≥ n); the proof of Corollary 5.2.6 takes m large. See newIssues (Corollary 5.1.11). |
| /95 | statement | Fragment replacement. The printed top term has the wrong sign (degree 2n is even; the product on the right has leading coefficient +q_v^n T^M_{n,v}/T^M_{n,v̄}); see newIssues (Lemma 5.2.5(ii)–(iii)). Items use corrected statements. |
| /103 | statement | On p. 1050 G is the finite group Gal(F̃/F): 'there exists a finite Galois extension F̃/F unramified outside S with Galois group G and a function g ↦ P_g : G → A_0/I_0[X]'. It is not G_{F,S}. Finiteness is used: the proof of Lemma 5.3.6 embeds A[G][V^{±1}] ↪ A[G × ℤ_ℓ] = A[Gal(F̃·F^{cycl_ℓ}/F)], which needs ℓ ∤ [F̃:F]. The value q_g lies in A_0/I_0. It is not a cyclotomic character value in the Galois-theoretic sense. |
| /108 | statement | p. 1057: 'Let K ⊂ ∏_v GL_n(𝒪_{F_v}) ⊂ GL_n(𝔸_{F,f}) be a compact open subgroup of the form K = K_SK^S'. That constraint on K_S is needed for the integral local system ℳ_{ξ,K} to exist, since K_p must preserve the lattice M_ξ. The shared setting of items 98–114 omits it. The coefficients are ℤ̄_p. The arXiv v2 PDF prints a bar over ℤ_p in 'finite free ℤ̄_p-module M_ξ' and 'local system ℳ_{ξ,K} of ℤ̄_p-modules', … |
| /109 | statement | 'As above' in Theorem 5.4.1 refers to the §5.4 setup (p. 1057), which requires K ⊂ ∏_v GL_n(𝒪_{F_v}). The item's shared setting allows any compact open K_S ⊂ GL_n(𝔸_{F,S}), which weakens a hypothesis the integral coefficient system needs. The same hypothesis applies to K in items 111, 112 and 113, which use ℳ_{ξ,K}. |
| /113 | statement | The target must be the product ∏ (the image of 1 has infinitely many nonzero components); new source issue on Remark 5.4.5. |
| /114 | locator, statement | Remark 5.4.6 ends on p. 1061, where the References begin. Remark 5.4.6 (p. 1061), inside §5.4 'Conclusion', says 'all results stated in this section are unconditional under the following assumptions'. It does not claim that §5.1's inputs, such as Mok's Theorem 5.1.2, become unconditional as stated. Shin's results replace them only for what the argument needs, through unitary similitude Shimura varieties. The … |

## Items added by the review

| Item | Status | Planned | Name |
|---|---|---|---|
| 115 | planned | PerfectoidSpaces:P0 | Almost mathematics over 𝒪_K: almost zero modules, the category of 𝒪_K^a-modules, and the functors M_*, M_! |
| 116 | planned | PELModuli:M5, ShimuraCompactifications:C5 | The Siegel moduli space X_{g,K^p} over ℤ_(p), its minimal compactification X*_{g,K^p} with ample ω, and the le |
| 117 | planned | AutomorphicFormsOnReductiveGroups:AF.4 | L-algebraic automorphic representations of GL_n(𝔸_F) |
| 118 | planned | TorsionCohomologyInfrastructure:TC.1 | The fake Hasse invariants: the formal model 𝔛*_{K_pK^p} with ω^int and 𝔍, and the Hecke-invariant sections s̄_ |
| 119 | planned | AutomorphicBundles:B5, AdicSpacesPartII:R3 | The Hecke action on p-adic cusp forms H^0(𝒳*_{K_pK^p}, ω^{⊗k} ⊗ ℐ) via trace maps |
| 120 | missing | — | The torsion (primitive) comparison theorem with compact supports on the minimal compactification |
| 121 | planned | CompletedCohomologyPartII:CC.6, ArithmeticLocallySymmetricSpaces:ALS.6 | Hochschild–Serre from compactly supported completed cohomology to finite level, Hecke-equivariantly |
| 122 | planned | TorsionCohomologyInfrastructure:TC.3, ArithmeticLocallySymmetricSpaces:ALS.4 | Boundary induction for GL_n: determinants on the Borel–Serre boundary cohomology |
| 123 | planned | IntegralHeckeAndGaloisDeterminants:IHG.0, IntegralHeckeAndGaloisDeterminants:IHG.4 | Chenevier, Corollary 1.14 (descent of a determinant to the subring of its characteristic-polynomial coefficien |
| 124 | planned | IntegralHeckeAndGaloisDeterminants:IHG.1 | Chenevier, Theorem 2.12: determinants over an algebraically closed field come from unique semisimple represent |
| 125 | planned | IntegralHeckeAndGaloisDeterminants:IHG.1 | Chenevier, Theorem 2.22(i): residually absolutely irreducible determinants over henselian local rings come fro |
| 126 | planned | TorsionCohomologyInfrastructure:TC.2 | Cohomological dimension of the infinite-level minimal compactification is at most d |
| 127 | missing | — | Clozel: regular L-algebraic cuspidal representations of GL_n contribute to the cohomology of X_K |

## The extraction's recorded mistakes

All eleven are confirmed. Three are reworded:

- E2: its side claim about S⁺ = S°.
- E4: its correction now says the maps are finite étale only after inverting p.
- E7: its "normal".

Every `known` field is right. The review looked for published corrections on the Annals article page, Crossref, Scholze's pages, the arXiv listing and zbMATH.

| Finding | Verdict | Check |
|---|---|---|
| E1 | confirmed | The quote matches the published Remark 2.2.4 on p. 956 and arXiv v2 Remark II.2.4 on p. 14 verbatim (TeX l. 385). The claim is false. Bhatt–Scholze arXiv v4 (12 Jan 2022) Theorem 7.4 says 'The map S → S_perfd is surjective'. Its Remark 7.5 says 'It was claimed… |
| E2 | confirmed | The quote matches p. 957 and arXiv v2 p. 15.  The counterexample in the reason works: - Take R^+ as the integral closure of 𝒪_K + R°°. Its image in R°/R°° = k[T^{1/p^∞}] is integral over k, so it lies in k, and T ∉ R^+. - R°/R^+ is killed by m_K, so R^+ → R° i… |
| E3 | confirmed | The published text on p. 984 reads 'In particular, X*(ε) → X* is an admissible blowup in the sense of Raynaud.' arXiv v2 p. 38 has 'blow-up'. In the TeX the sentence sits after \end{lem}, so the locator 'the sentence after Lemma 3.2.13' is right.  The mistake … |
| E4 | confirmed | The quote matches p. 986 and arXiv v2 p. 40. The degree slip is real: - the same proof, p. 987, says 'Both vertical maps are finite étale of degree p^{g(g+1)/2} (using that m ≥ 1)'; - Corollary 3.2.23 normalises by 1/p^{(m′−m)g(g+1)/2}. The degrees p^{g(g+1)/2… |
| E5 | confirmed | The published p. 986 and arXiv v2 p. 39 both read '(iii) There is a weak canonical subgroup C ⊂ 𝔄(ε)[p] of level p.' - Definition 3.2.7 (p. 978) indexes the level by m, with C_m ⊂ A[p^m]. Theorem 3.2.15(ii) says 'C_m ⊂ 𝔄(p^{-m}ε)[p^m] of level m'. - The proof … |
| E6 | confirmed | The v2 TeX has \varprojlim_{K^p\subset K^{p\prime}\subset G(\A_f^p)}, while the preceding sentence has 'K^{p′} ⊂ G′(𝔸_f^p)'. The published p. 1020 has the same: its pdftotext shows 'K p ⊂K ⊂G(Apf )' with no prime on G, whereas the preceding sentence prints 'G0… |
| E7 | confirmed | The quote matches p. 1020 and arXiv v2 p. 69. The whole proof of (i) for G is that sentence, and nothing in the construction compares R^+_{K^p}, built from the Zariski-closed subspaces of the Siegel 𝒴*_{K^p}(J), with the finite-level rings R^+_{J,K_p}. So 'aff… |
| E8 | confirmed | The v2 TeX has /\cdot/^{(\ell_i-i)/2} and \varphi_{\Pi_{iv}}: W_{F_v}\to {}^L \GL_{h,v}. The published p. 1033 is the same. Both corrections are right: - Remark 5.1.3 uses exponents (2j − ℓ_i − 1)/2 for j = 1, …, ℓ_i, and the proof of Corollary 5.1.7 uses σ_i … |
| E9 | confirmed | The v2 TeX has X^P_{X_P}\to X^M_{X_P^M}. The published p. 1038 and arXiv v2 p. 85 are the same. The lemma's first sentence and its proof use K_P and K_P^M. Misprint.… |
| E10 | confirmed | The v2 TeX has 'X^M_{K^M}\to K^P_{K^P}'. The published p. 1041 and arXiv v2 p. 87 are the same. The paragraph immediately precedes Lemma 5.2.3, and the same sentence speaks of 'the projection X^P_{K^P} → X^M_{K^M}'. Misprint.… |
| E11 | confirmed | The published p. 1060 and the v2 TeX (Corollary V.4.4, p. 103) read det(1 − X Frob_v / σ_ψ) with the Hecke operators themselves as coefficients, right after σ_𝔪 : G_{F,S} → GL_n(𝕋_{F,S}(K,ξ,i)_𝔪/I) is introduced. For σ_ψ, Corollary 5.4.3 already gives the iden… |

## Mistakes found by the review

Each was checked in the published text and in arXiv v2. None is corrected in print.

| Finding | Kind | Affects | Locator |
|---|---|---|---|
| E12 | misprint | nothing | §3.1, Definition 3.1.1, third line, p. 971 (published); arXiv v2: Definition III.1.1, p. 27, where it does not |
| E13 | misprint | nothing | §2.1, proof of Lemma 2.1.1, p. 954 (published); arXiv v2: proof of Lemma II.1.1, p. 12 |
| E14 | misprint | nothing | §3.2.2, Theorem 3.2.15(ii), the square, p. 985 (published); arXiv v2: Theorem III.2.15(ii), p. 39 |
| E15 | misprint | nothing | §3.2.4, proof of Lemma 3.2.21(ii), p. 992 (published); arXiv v2: proof of Lemma III.2.21(ii), p. 44 |
| E16 | error | a stated result | §3.3, the paragraph before Lemma 3.3.9, p. 1008; Theorem 3.3.18(i), p. 1012, and the last sentence of its proo |
| E17 | error | a stated result | §3.2.1, Corollary 3.2.6 (the displayed formula) and its proof, pp. 977–978; Proposition 3.2.8(i)–(ii) and its  |
| E18 | error | nothing | §3.2.2, proof of Theorem 3.2.15, p. 986 (published); arXiv v2: proof of Theorem III.2.15, p. 40. This is the s |
| E19 | misprint | nothing | §3.1, Definition 3.1.1 and the two sentences after it, p. 971; §3.2.2, the paragraph defining 𝒳_{K_p}, p. 983  |
| E20 | gap | the proof | §2.3.2, proof of Corollary 2.3.5, p. 963 (published); arXiv v2: proof of Corollary II.3.5, p. 20. Same text in |
| E21 | gap | the proof | §2.2, Lemma 2.2.8, p. 957 (published); arXiv v2: Lemma II.2.8, p. 15. |
| E22 | misprint | nothing | §3.2.5, proof of Lemma 3.2.30, p. 999 (published); arXiv v2: proof of Lemma III.2.30, p. 51. Same text in both |
| E23 | misprint | nothing | §3.3, proof of Theorem 3.3.18(vi), last paragraph, p. 1015 (published); arXiv v2: proof of Theorem III.3.18(vi |
| E24 | misprint | nothing | §3.3, Remark 3.3.7, p. 1007 (published); arXiv v2: Remark III.3.7, p. 57. Same text in both (TeX \Lie G^\ast). |
| E25 | misprint | nothing | §3.2.1, proof of Proposition 3.2.8(iv), p. 980 (published); arXiv v2: p. 35. Same text in both. |
| E26 | misprint | nothing | §3.2.2, proof of Theorem 3.2.15(iii), p. 987 (published); arXiv v2: p. 41. Same text in both. |
| E27 | misprint | nothing | §2.3.2, proof of Lemma 2.3.6, p. 964 (published); arXiv v2: proof of Lemma II.3.6, p. 21. Same text in both. |
| E28 | misprint | nothing | §3.2.3, proof of Corollary 3.2.19, p. 990 (published); arXiv v2: proof of Corollary III.2.19, p. 43. Same text |
| E29 | misprint | nothing | §2.3.1, Remark 2.3.3, p. 959 (published); arXiv v2: Remark II.3.3, p. 16. Same text in both. |
| E30 | misprint | nothing | §3.3, proof of Lemma 3.3.6 and Remark 3.3.7, p. 1007 (published); arXiv v2: Lemma III.3.6 and Remark III.3.7,  |
| E31 | misprint | nothing | §5.4, the setup paragraph, p. 1057 (published); arXiv v2: §V.4, p. 101 (correct there) |
| E32 | misprint | nothing | §4.2, proof of Corollary 4.2.3, p. 1024 (published); arXiv v2: proof of Corollary IV.2.3, p. 72 |
| E33 | misprint | nothing | §4.2, paragraph after Corollary 4.2.3, p. 1024 (published); arXiv v2: after Corollary IV.2.3, p. 72 |
| E34 | misprint | nothing | §4.3, proof of Theorem 4.3.1, last paragraph, p. 1030 (published); arXiv v2: proof of Theorem IV.3.1, p. 77 |
| E35 | misprint | nothing | §4, last paragraph before §4.1, p. 1018 (published); arXiv v2: Chapter IV introduction, p. 66 |
| E36 | misprint | nothing | §5.1, Remark 5.1.5, p. 1034 (published); arXiv v2: Remark V.1.5, p. 81 |
| E37 | gap | a stated result | §5.1, Corollary 5.1.11 and its proof, p. 1038 (published); arXiv v2: Corollary V.1.11, p. 84 |
| E38 | misprint | nothing | §5.2, Lemma 5.2.5(ii), p. 1042, and (iii), p. 1043 (published); arXiv v2: Lemma V.2.5(ii)–(iii), pp. 88–89 |
| E39 | gap | the proof | §5.3, the paragraph between Corollary 5.3.5 and Lemma 5.3.6, p. 1050 (published); arXiv v2: before Lemma V.3.6 |
| E40 | misprint | nothing | §5.3, proof of Lemma 5.3.6, p. 1051 (published); arXiv v2: proof of Lemma V.3.6, pp. 95–96 |
| E41 | misprint | nothing | §5.3, proof of Lemma 5.3.10 (uniqueness), p. 1053 (published); arXiv v2: proof of Lemma V.3.10, p. 98 |
| E42 | misprint | nothing | §5.3, proof of Lemma 5.3.10 (the claim Q_m ∈ S[XT^m]), pp. 1053–1054 (published); arXiv v2: proof of Lemma V.3 |
| E43 | misprint | nothing | §5.3, proof of Lemma 5.3.8 (multiplicativity of D^{(m)}), the display before Lemma 5.3.12, p. 1055 (published) |
| E44 | gap | the proof | §5.4, proof of Corollary 5.4.2, p. 1059 (published); arXiv v2: proof of Corollary V.4.2, p. 103 |
| E45 | error | the proof | §5.4, proof of Corollary 5.4.2, p. 1060 (published); arXiv v2: proof of Corollary V.4.2, p. 103 |
| E46 | misprint | nothing | §5.4, Remark 5.4.5, p. 1061 (published); arXiv v2: Remark V.4.5, p. 104 |

## Checks

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-SCHOLZE-15.result.json`: ok.
- Every planned stage id in the corrected file exists in `data/atlas.json`.
- Every missing item is routed exactly once.
