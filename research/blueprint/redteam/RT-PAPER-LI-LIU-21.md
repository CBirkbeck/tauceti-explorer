# RT-PAPER-LI-LIU-21

Red team of the accepted extraction PAPER-LI-LIU-21: Chao Li and Yifeng Liu, *Chow groups and L-derivatives of
automorphic motives for unitary groups*, Ann. of Math. 194 (2021), 817–901 (arXiv 2006.06139). Issue #5059.

Red team: Claude Code, session `cc-c2c06b`, 1–2 October 2026. I did not write or review:
- the extraction (`cc-fb70e5`, PRs #1940 and #1959);
- its review (`cc-58621d`, PR #4783).

**Disclosures.** Some findings cite, as existing owner decisions or for comparison, extractions this session red-teamed
or fixed:
- CAI-FRIEDBERG-KAPLAN-24 (#5358);
- GAN-ICHINO-18 (#5231);
- ZHANG-21 (#5405);
- BEUZARTPLESSIS-LIU-ZHANG-ETAL-21 (#5433);
- CESNAVICIUS-19 (#5021);
- CESNAVICIUS-SCHOLZE-24 (#5351);
- HE-LI-SHI-ETAL-23 (#4957).

The findings that cite them (/4, /9, /12, /20, /26, /27, /28, /34) carry coordinator notes, and no finding rests on a
verdict of mine.

**Result: 50 findings, 8 high, 22 medium and 20 low.**

## Method

**The source.** The authors' final version (<https://www.math.columbia.edu/~chaoli/AIPF.pdf>), 67 pages, dated 20
October 2021, was re-downloaded on 2026-10-01. Its SHA-256 (`6ef2d63e…e566`) equals the extraction's. The typeset Annals
text is paywalled and was not read.

**The passes.** Four parallel passes were run by this session.
- Three read all 67 pages, checking decisive formulas on page images: §§1–3, §§4–8, and §§9–11 with the appendices.
- One checked the nine routes, the 21 prerequisites, the planned statuses and the briefs.

**Merging.** Four pairs reported by two passes each were merged: the doubling owner, Matsushima, Ramakrishnan, and the
eigencharacter convention.

**What I re-verified myself.** Every high finding, against the text:
- **Doubling (/4).** The EHLS Part II brief claims the Li–Liu doubling integrals.
- **Route cycles (/1–/3).** Route 1 imports the stages to which items depending on route-1 definitions are sent.
- **Archimedean terms (/7).** Definition 3.11(2) includes archimedean u, while Remark 3.12 covers only totally positive
  T□. The step on p. 51 sums over Herm°_r(F)^+ only.
- **Eigencharacter (/8).** The change of variables on p. 51 gives χ_π(t); an abelian toy computation confirms it.
- **Levels (/5).** L^R contains −1.
- **Lemma 8.2 (/6).** S lies outside R, and Λ^R_v is not self-dual there.

The full list of what was checked is in the result's `checked` field.

## The high findings

### /1 — error

**Where.** research/blueprint/papers/PAPER-LI-LIU-21.result.json route 5 (IgusaVarietiesAndTorsionConcentration IG.0,
IG.1, IG.4, IG.5, IG.7) and items /78, /81

**Claim.** Route 5 records Lemma 7.3 (item 81) at IG.5 'with IG.7 as its consumer'. This creates a dependency cycle:
Lemma 7.3 is stated 'in the situation of Proposition 7.1', localizes at 𝔪 = 𝔪^R_π ∩ S^{R∪V^(p)}_{Q^ac} (item 51), and is
proved from Corollary B.15(2) (item 70), Proposition 6.9(2) (item 52) and Hypothesis 6.6 (item 49), all routed to
UnitaryArithmeticInnerProductFormula, while that Part II imports 'IgusaVarietiesAndTorsionConcentration: the vanishing
Lemma 7.3'. Its only consumer is Proposition 7.1 (item 55); IG.7 (consumers PA.1, PA.2, non-compact datum) does not use
it. Second, item 78 ([CS17, Cor. 6.1.4] and [CS17, Thm. 5.5.7]) duplicates accepted PAPER-CARAIANI-SCHOLZE-17 items:
Cor. 6.1.4 is CS17/117, routed to IG.4 as its compact-case widening, and Thm. 5.5.7 is CS17/108, owned by the Part II
IgusaVarietiesAndTorsionConcentrationPartIICompactUnitary, which itself imports IG.5; putting Thm. 5.5.7 under IG.5 is
either a second owner or a second cycle. Item 78's note ('neither plans [CS17, Cor. 6.1.4] or [CS17, Thm. 5.5.7] in the
compact case') and the route reason ('which the IG layers plan only for their own datum') ignore that accepted routing.

**Evidence.** Paper p.34-35: 'Lemma 7.3. Let the situation be as in Proposition 7.1 with p ≠ ℓ ... Applying Corollary
B.15(2) to S = S^{R∪V(p)}, L = Q^ac, and 𝔪 = 𝔪^R_π ∩ S^{R∪V(p)}_{Q^ac}, it suffices ... Part (1) has already been proved
in Proposition 6.9(2) (as we have assumed Hypothesis 6.6). ... The argument for (3) is similar to the proof of [CS17,
Theorem 6.3.1] ... by [CS17, Theorem 5.5.7] (together with the modification in the proof of [LTXZZ, Theorem D.1.3]) and
the very strong multiplicity one property [Ram, Theorem A], we must have j = 0'; p.35 Proof of Proposition 7.1: 'Take s
... that is an ℓ-tempered Q^ac-étale correspondence of 𝒳_m, which exists by Lemma 7.3 and Corollary B.15(1)'. IG.5 text:
'Prove CSnc Corollary 5.1.3's obstruction: for p totally split ...'; IG.7 consumers
['PotentialAutomorphyInfrastructure:PA.1', 'PotentialAutomorphyInfrastructure:PA.2']. PAPER-CARAIANI-SCHOLZE-17 route 1
brief: 'IG.5 and IG.7 remain tied to the non-compact datum of the sequel'; 'Imports, by title and id: ...
(IgusaVarietiesAndTorsionConcentration IG.0, IG.1, IG.3, IG.4, and IG.5 for the anti-involution of the Hecke algebra)';
items CS17/108 (Theorem 5.5.7, route 1) and CS17/117 (Corollary 6.1.4, route 2: 'IG.4 the equivariant nearby cycles,
Proposition 6.1.3 and Corollary 6.1.4 as the compact-case strengthenings'). PAPER-LIU-ETAL-22 route 8 reason: 'the
compact case [12] is also proposed as IgusaVarietiesAndTorsionConcentrationPartIICompactUnitary by
PAPER-CARAIANI-SCHOLZE-17, whose design should take these items' (its Proposition D.1.3 is item PAPER-LIU-ETAL-22/Z03).

**Fix.** Move item 81 to route 1 (UnitaryArithmeticInnerProductFormula). Split item 78: Corollary 6.1.4 (Q_ℓ
coefficients, footnote 16's L_u-hyperspecial relaxation) stays a source item for IG.4, coordinated with CS17/117;
Theorem 5.5.7 with the LTXZZ Proposition D.1.3 modification goes to a part-ii route {parent
IgusaVarietiesAndTorsionConcentration, roadmap IgusaVarietiesAndTorsionConcentrationPartIICompactUnitary, title 'Igusa
varieties, compactified period fibers and torsion concentration, Part II: compact unitary Shimura varieties', area
langlands}. Keep items 77 and 80 (Drinfeld-level Newton strata, Harris-Taylor Igusa varieties of the first kind) at
IG.0/IG.1. Set route 5 stages to IG.0, IG.1, IG.4 and replace the last two sentences of its reason by: 'Lemma 7.3
itself, whose statement and proof use 𝔪^R_π, Hypothesis 6.6, Proposition 6.9(2) and Corollary B.15, is planned in
UnitaryArithmeticInnerProductFormula, which imports Corollary 6.1.4 from IG.4 and Theorem 5.5.7 from
IgusaVarietiesAndTorsionConcentrationPartIICompactUnitary.' In route 1's brief, replace
'IgusaVarietiesAndTorsionConcentration: the vanishing Lemma 7.3' by the two imports with titles and stage ids, and add
Lemma 7.3 and Remark 7.4 to its final theorems.

### /2 — error

**Where.** research/blueprint/papers/PAPER-LI-LIU-21.result.json route 3 (UnitaryKudlaRapoportCycles) items /42, /43,
against route 1 items /30, /48, /68

**Claim.** Route 3 sends Lemma 5.4 (item 42) and the integral special cycles with their K-theory classes (item 43) to
UnitaryKudlaRapoportCycles, but both are stated in terms of objects this extraction routes to
UnitaryArithmeticInnerProductFormula: Kudla's cycles Z(x)_L and Z_T(φ^∞)_L (Definition 4.1, item 30), p-basic functions
(Definition 6.5, item 48) and 'extensions' in the sense of Definition B.9 (item 68). Since route 1's brief imports the
integral cycles and identities from UnitaryKudlaRapoportCycles, the two Part IIs would depend on each other: a cycle.
The split also leaves the generic Kudla-Rapoport cycles planned twice: PAPER-LI-ZHANG-22-B/105 and /109 already plan
semi-global and global KR cycles Z(T, ϕ_K) (with the generic-fibre cycle and its Zariski closure) in
UnitaryKudlaRapoportCycles, while item 30 plans Z(x)_L in the AIPF.

**Evidence.** Item 42 statement: '(2) its image cycle Z(x)′_L equals the restriction of Z(x)_L to X′_L'. Item 43
statement: 'For p-basic φ^∞ (Definition 6.5) ... ^K𝒵_T(φ^∞)_L ... in F^m K^Z_0(𝒳_L)_C [GS87, Prop. 5.5], hence an
extension of Z_T(φ^∞)′_L'. Paper p.37-38: 'Take an integer m ⩾ 1 and an element φ^∞ ∈ S(V^m ⊗ A^∞_F)^L that is p-basic
(Definition 6.5)'; '... whose induced cycle coincides with the restriction of Z_T(φ^∞)_L to X′_L (Lemma 5.4)'; 'By
[GS87, Proposition 5.5], ^K𝒵_T(φ^∞)_L belongs to F^r K^Z_0(𝒳_L)_C, hence is an extension of Z_T(φ^∞)′_L (Definition
B.9)'. Item 30 note: 'the integral models of these cycles go to UnitaryKudlaRapoportCycles. Routed to the Part II
UnitaryArithmeticInnerProductFormula'. Route 1 brief: 'Import: ... UnitaryKudlaRapoportCycles: the integral special
cycles, their K-theory classes and the local Kudla–Rapoport identities'. PAPER-LI-ZHANG-22-B/109: 'On M = M_{K_m}:
Z(t_i, ϕ_i) the Zariski closure of the generic-fibre cycle'.

**Fix.** Move item 42 and the K-theory-class/extension part of item 43 to route 1 (they bridge Definition 4.1,
Definition 6.5 and Definition B.9, which live there); keep in route 3 only the integral cycles 𝒵_T(φ)_L → 𝒳_L on the
smooth and semistable RSZ models [LZ, §13.3] with the uniformization (8.3) and ^K𝒩(x) (split item 43 accordingly), and
items 44-45. Replace route 3's first two 'Add' bullets by: 'the integral special cycles on the smooth and semistable
models (Li–Zhang §13.3, already PAPER-LI-ZHANG-22-B/105 and /109) and their uniformization (8.3), exported without
reference to Li–Liu's Definitions 4.1, 6.5 or B.9; Lemma 5.4 and the classes ^K𝒵_T(φ^∞)_L are planned in
UnitaryArithmeticInnerProductFormula'. Alternatively move Definition 4.1 (item 30, the cycle Z(x)_L) into
UnitaryKudlaRapoportCycles and import it into the AIPF; either way name one owner of the generic special cycles in both
briefs.

### /3 — error

**Where.** research/blueprint/papers/PAPER-LI-LIU-21.result.json route 4 (MetaplecticAutomorphicForms MP.3) item /17

**Claim.** Item 17 (Proposition 3.6) is sent to MP.3, but parts (1) and (2) are doubling statements: (1) is multiplicity
one for the degenerate principal series I^□_{r,v}(0) and (2) characterizes V_v by the nonvanishing of the functional
Z-natural_{π_v,V_v}, which item 82 defines and route 1 plans in UnitaryArithmeticInnerProductFormula. MP.3 would then
import from the AIPF, which imports MP.2-MP.4: a dependency cycle. (With the doubling machinery moved to
AutomorphicLFunctionsAndLocalFactorsPartIIDoubling as it should be, the cycle becomes MP.3 → doubling Part II → MP.3,
since that Part II imports MP.3.) Only part (3), the theta statement, is MP.3 material.

**Evidence.** Paper p.16: 'Proposition 3.6 ... (1) For every v ∈ V^fin_F, we have dim_C
Hom_{G_r(F_v)×G_r(F_v)}(I^□_{r,v}(0), π_v ⊠ π^∨_v) = 1. (2) For every v ∈ (V^fin_F \ R) ∪ V^spl_F, V_v is the unique
hermitian space over E_v of rank 2r, up to isomorphism, such that Z♮_{π_v,V_v} ≠ 0. ... Thus, we obtain (1) by [KS97,
Theorem 1.2 & Theorem 1.3]. ... the nonvanishing of Z♮_{π,V} follows from [Liu, Proposition 5.6 & Lemma 6.1].' Item 82
(route 1) defines Z♮_{π_v,V_v}. MP.3 text: 'Construct orthogonal–symplectic and unitary dual-pair embeddings ... Define
big theta modules ... see-saw identities ... first-occurrence/vanishing comparisons.' PAPER-EISCHEN-HARRIS-LI-ETAL-20
route 1 brief: 'Import from: ... (MetaplecticAutomorphicForms) MP.3 (unitary dual pairs)'.

**Fix.** Split item 17. Keep at MP.3 (route 4) only: 'For tempered π_v and a hermitian space Ṽ of rank 2r over E_v,
Θ(π_v, Ṽ) = Hom_{G_r(F_v)}(S(Ṽ^r), π_v) is zero or irreducible [GT16, Thm. 1.2; GI16, Thm. 4.1(v)], and exactly one Ṽ up
to isomorphism has Θ(π_v, Ṽ) ≠ 0 [GG11, Thm. 1.8; HKS96]' (consistent with PAPER-DISEGNI-LIU-24/22). Route parts (1) and
(2) of Proposition 3.6 with the owner of I^□_{r,v}(s) and Z♮ (AutomorphicLFunctionsAndLocalFactorsPartIIDoubling, see
the doubling finding; or route 1), which imports MP.3. Update route 4's reason to drop 'doubling multiplicity one'.

### /4 — duplicate

**Where.** research/blueprint/papers/PAPER-LI-LIU-21.result.json items /16, /82, /83 and /14 (planned:
AutomorphicPadicLFunctions:L4); route 1 brief, Import bullet 'AutomorphicPadicLFunctions L4 ... Plan here Yamana's good
sections, the Siegel–Weil sections, the normalized functionals Z^♮_{π_v,V_v} and Remark 3.5 (items 82–83)';
research/blueprint/papers/PAPER-LI-LIU-21.result.json item /14 (status planned at AutomorphicPadicLFunctions:L4), items
/16, /19, /82, /83 (route 1), and route 1 brief (Import bullet 'AutomorphicPadicLFunctions L4 ...')

**Claim.** Route 1 plans the general local theory of the unitary doubling method inside the GZ Part II
UnitaryArithmeticInnerProductFormula. That covers Yamana's good sections, the local doubling zeta integral and its
normalization Z^♮, the functional Z^♮_{π_v,V_v}, the convergence of Remark 3.5 (items 82-83) and the doubling L-factors
of Definition 3.3 (item 16). It also cites L4 as owner of the rest (item 14). An accepted Part II already owns this
mathematics: AutomorphicLFunctionsAndLocalFactorsPartIIDoubling (route 1 of PAPER-EISCHEN-HARRIS-LI-ETAL-20 and route 1
of PAPER-CAI-FRIEDBERG-KAPLAN-24, one design job DESIGN-AutomorphicLFunctionsAndLocalFactorsPartII). Its brief claims
the degenerate principal series, Siegel Eisenstein series, the global doubling identity, local doubling zeta integrals
'with convergence, rationality and the unramified computation', L(s,π,χ) and the archimedean theory. It names the Li–Liu
doubling zeta integrals explicitly as its own. By RS-14, L4 keeps only the EHLS-datum instance, and per that brief it
imports the general machinery. So items 16, 82 and 83 are planned twice, and item 14's owner is the Part II, not L4.
Coordinator note: PAPER-CAI-FRIEDBERG-KAPLAN-24, whose route 1 is the same Part II, was red-teamed by this session (PR
#5358); the finding rests on the accepted PAPER-EISCHEN-HARRIS-LI-ETAL-20 route 1 brief, which this session did not
write. Also: The doubling machinery has an accepted owner that this extraction ignores. PAPER-EISCHEN-HARRIS-LI-ETAL-20
route 1 (accepted 23 Sept 2026, before this extraction's review) proposes the Part II
AutomorphicLFunctionsAndLocalFactorsPartIIDoubling, which owns the degenerate principal series, Siegel Eisenstein
series, Siegel-Weil/Godement sections, local doubling zeta integrals, the unramified computation, the continuation of
L(s, pi) and the archimedean theory (naming Eischen-Liu as a source), and states that L4 keeps only EHLS-specific
choices and imports that Part II. So item 14 is not planned at L4, and items 16 (doubling L-function, Yamana), 82 (good
sections, normalized zeta integral), 83 (Yamana Lemma 7.2) duplicate it when planned in
UnitaryArithmeticInnerProductFormula. Two other accepted extractions already route the Siegel-Weil section f_Phi(g) =
omega(g)Phi(0) and the Siegel-Weil measure (item 19, Definition 3.8) to MetaplecticAutomorphicForms MP.2-MP.3, and the
Siegel Eisenstein series with its Whittaker factorization to UnitaryKudlaRapoportCycles; PAPER-LI-LIU-22's brief for
this same Part II instead constructs the doubling zeta integrals inside it and takes Eisenstein series from AS.1-AS.2.
As routed, the same local theory is planned in three or four places, with different normalizations (LL21 (3.3)/Def. 3.8
at s = 0 with gamma^{2r}_{V_v}/b_{2r,v}(0); DL24 with b_{2r,v}(1)), and the complex AIPF is made to depend on L4, whose
ancestors include PadicFamilies L0-L1.

**Evidence.** PAPER-EISCHEN-HARRIS-LI-ETAL-20 route 1 brief (accepted): 'Cover, in this order: … the degenerate
principal series and Godement sections f^Φ …; Siegel Eisenstein series with convergence, continuation and functional
equation; the global doubling integral, its unfolding …; local doubling zeta integrals with convergence, rationality and
the unramified computation; the continuation and functional equation of L(s, π, χ) …; the archimedean theory (5) … Owner
boundary: EHLS's specific choices … stay with AutomorphicPadicLFunctions L4, which names EHLS and imports this Part II.
The unitary doubling zeta integrals that PAPER-LI-LIU-22 routes to the Part II UnitaryArithmeticInnerProductFormula are
the same local theory and should be owned here and imported there.' Its reason: 'What no layer plans is the general
machinery of the doubling method that L4 applies'. RS-14 narrows L4 to 'Instantiate … in EHLS's exact datum; … Own …
doubling embedding, global identity and ramified/p-adic local calculations.' RT-AREA-iwasawa-1.md: 'If it is created,
APL L4 … must be narrowed to import it.' PAPER-LI-LIU-21 item 14 note: 'L4 plans the doubling embedding … in the
Eischen–Harris–Li–Skinner setting'. Items 82 and 83 are 'Routed to the Part II UnitaryArithmeticInnerProductFormula'.
The paper's own text (pp.14-16) is the general U(r,r) × U(r,r) ⊂ U(2r,2r) doubling with Yamana's good sections [Yam14,
Def. 3.1, Thm. 5.2, Lemma 7.2]. REV-PAPER-LI-LIU-21 does not mention the EHLS Part II. Also:
PAPER-EISCHEN-HARRIS-LI-ETAL-20.result.json route 1 (roadmap AutomorphicLFunctionsAndLocalFactorsPartIIDoubling) reason:
'What no layer plans is the general machinery of the doubling method that L4 applies: the degenerate principal series
and Siegel Eisenstein series of U(W) with their continuation, the doubling identity and its unfolding, the unramified
computation, ... the continuation of L(s, pi, chi), and the archimedean local theory'; brief: 'Owner boundary: EHLS's
specific choices ... stay with AutomorphicPadicLFunctions L4, which names EHLS and imports this Part II. The unitary
doubling zeta integrals that PAPER-LI-LIU-22 routes to the Part II UnitaryArithmeticInnerProductFormula are the same
local theory and should be owned here and imported there.' PAPER-DISEGNI-LIU-24/21 ('the Siegel-Weil section f^SW_Phi(g)
= (omega_{2r,v}(g)Phi)(0) ...; and the Siegel-Weil measure dh_v, the unique Q-valued Haar measure with I_{T}(Phi) = ...
= b_{2r,v}(1)·W_{T}(f^SW_Phi)', routed to MP.2-MP.3) and PAPER-LI-ZHANG-22-B/25 ('The Weil representation of U(n, n) x
U(V) and Siegel-Weil sections', routed to MP.2/MP.3); PAPER-LI-ZHANG-22-B/102 ('Siegel Eisenstein series on U(n, n) and
their Fourier coefficients ... E_T = prod_v W_{T,v}', routed to UnitaryKudlaRapoportCycles); PAPER-LI-LIU-22 route 3
brief: 'Construct: ... the doubling zeta integrals with the section f^(s)_r, and the doubling L- and epsilon-factors
(Yamana)'. Paper p.16: 'For ... a good section f^(s) in I_{r,v}(s) ([Yam14, Definition 3.1]), we have the local doubling
zeta integral ... and the normalized version'. L4 stage text ('Construct the PEL/unitary Shimura varieties ... in the
exact setting of EHLS') requires L3 and PadicFamilies:L1.

**Fix.** Add a part-ii route: parent AutomorphicLFunctionsAndLocalFactors, roadmap
AutomorphicLFunctionsAndLocalFactorsPartIIDoubling, title 'Automorphic L-functions and local factors, Part II: the
doubling method for classical and unitary groups'. Its items: 82, 83, the local part of 16 (split 16 into (a) the
doubling L-factor L(s, π_v) of [Yam14, Thm. 5.2] with Remark 3.4, routed here, and (b) the global Euler product L(s, π)
= Π_v L(s, π_v) with (3.2), which stays in route 1), and the new items of the next two findings. Its brief: 'Same Part
II as PAPER-EISCHEN-HARRIS-LI-ETAL-20 route 1 and PAPER-CAI-FRIEDBERG-KAPLAN-24 route 1. Add the unitary doubling of
Li–Liu 2021 §3: G_r × G_r ⊂ G^□_r = U(2r,2r), I^□_{r,v}(s) = Ind(|·|^s_{E_v} ∘ δ^□_r), Yamana's good sections and
doubling L-factors, Z^♮ = (L(s+1/2, π_v)/b_{2r,v}(s))^{−1} Z with b_{m,v}(s) = Π_{i=1}^m L(2s+i, η_v^{m−i}), its
absolute convergence and the invertibility of the normalizing factor at s = 0, the global doubling identity, and the
unramified, archimedean (Eischen–Liu) and almost-unramified evaluations.' In item 14's note replace 'L4 plans the
doubling embedding …' with 'Owned by AutomorphicLFunctionsAndLocalFactorsPartIIDoubling (accepted EHLS/CFK route 1); L4
keeps only EHLS's datum (RS-14).' Mark item 14 missing and add it to the new route if the maintainer confirms that the
Part II supersedes L4 here. In route 1's brief replace the L4 import bullet with 'Automorphic L-functions and local
factors, Part II: the doubling method (AutomorphicLFunctionsAndLocalFactorsPartIIDoubling): Siegel Eisenstein series,
the global doubling identity, Yamana's good sections and doubling L-factors, the normalized zeta integrals
Z^♮_{π_v,V_v}, Remark 3.5 and the local evaluations. Plan here only Proposition 3.7 in this normalization.' Make
DESIGN-GrossZagierAndArithmeticHeightsPartII wait for DESIGN-AutomorphicLFunctionsAndLocalFactorsPartII. Also: Item 14:
set status 'missing', delete 'planned', and note that L4 keeps only EHLS-specific choices. Add a part-ii route {parent
AutomorphicLFunctionsAndLocalFactors, roadmap AutomorphicLFunctionsAndLocalFactorsPartIIDoubling, title 'Automorphic
L-functions and local factors, Part II: the doubling method for classical and unitary groups', area automorphic} taking
items 14, 16, 82, 83, with a brief: 'This reuses the candidate of PAPER-EISCHEN-HARRIS-LI-ETAL-20 and
PAPER-CAI-FRIEDBERG-KAPLAN-24. Li-Liu 2021 §3 add, for U(r,r) x U(r,r) in U(2r,2r): Yamana's good sections [Yam14, Def.
3.1]; Z-natural(phi^v ⊗ phi, f^(s)) = (L(s+1/2, pi_v)/b_{2r,v}(s))^{-1} Z(...) and the functional Z-natural_{pi_v,V_v};
Remark 3.5 [Yam14, Lemma 7.2]; the doubling L-factor [Yam14, Thm. 5.2] with (3.2) at archimedean v; the unramified value
Z-natural = 1 [Yam14, Prop. 7.1, (7.2)]; the archimedean value Z(0, ...) = (−1)^r 2^{−2r²}·2^{r²−r} π^{r²}
Γ(1)⋯Γ(r)/(Γ(r+1)⋯Γ(2r)) [Eischen-Liu, Thm. 1.3, Prop. 3.3.2].' Remove 16, 82, 83 from route 1. Route item 19's
Siegel-Weil measure (with LL21's normalization W_T(0, 1_{4r}, Phi_v) = (gamma^{2r}_{V_v,psi_{F,v}}/b_{2r,v}(0)) ∫
Phi_v(h^{-1}x) dh_v and an explicit conversion to DL24's b_{2r,v}(1) form) to the same owner as PAPER-DISEGNI-LIU-24/21
(MetaplecticAutomorphicForms MP.3 as source), and the Siegel-Weil section part of item 82 likewise. In route 1's brief
replace the L4 bullet by: 'Automorphic L-functions and local factors, Part II: the doubling method for classical and
unitary groups (AutomorphicLFunctionsAndLocalFactorsPartIIDoubling): degenerate principal series, Siegel Eisenstein
series, good sections, local doubling zeta integrals, Z-natural and the doubling L-function (items 14, 16, 82, 83).
Metaplectic groups, Weil representations and automorphic theta kernels (MetaplecticAutomorphicForms MP.3): Siegel-Weil
sections and the Siegel-Weil measure (item 19). The Whittaker functions W_T(s, g, Phi) of (3.3): from Gross-Zagier
formulas and arithmetic heights, Part II: unitary Kudla-Rapoport cycles (UnitaryKudlaRapoportCycles,
PAPER-LI-ZHANG-22-B/102).' Update the report's 'Planned' bullet for L4 and its 'Not in the atlas' list accordingly.

### /5 — error

**Where.** research/blueprint/papers/PAPER-LI-LIU-21.result.json items /34, /35, /54, /57 (and sourceIssues E19)

**Claim.** The paper allows every level L (every L = L_R L^R) and claims three things for all of them. Definition 4.8:
Theta_L has a well-defined image in colim_L CH^r(X_L). Lemma 5.2: X'_L represents the RSZ functor. Definition 6.11:
vol^nat(L) times the height pairing does not depend on L, by the projection formula (footnote 11 adds that the Hodge
bundle on X_L has degree 2 vol^nat(L)^{-1}). All three fail when -1 lies in L, which L^R always allows, since L^R is the
stabilizer of a lattice and so contains -1. Counterexample: take L' neat and L = {+-1}L' (take L_R = {+-1}L'_R). Since
-1 is in uH(F), it acts trivially on uD x H(A^inf_F)/L', so X_{L'} -> X_L is an isomorphism, while vol^nat(L) = 2
vol^nat(L'). The orbits L'x and L'(-x) are distinct, Z(x) = Z(-x) and phi is even, so Definition 4.1 gives Z_T(phi)_{L'}
= 2 Z_T(phi)_L, hence Theta_{L'} = 2 Theta_L under X_{L'} = X_L. Consequences: (a) the colimit claim of Definition 4.8
fails; (b) vol^nat(L')<Theta_{L'},Theta_{L'}> = 2 vol^nat(L)<Theta_L,Theta_L>; (c) footnote 11 cannot hold at both
levels; (d) Proposition 8.1, whose right side does not depend on L, can hold at only one of L, L' unless
E_{T1,T2}(...)_u = 0, and the main theorem needs it nonzero. (e) Lemma 5.2 also fails at L, because the pair (phi_0,
phi) = (1, -1) is a nontrivial automorphism of every object. The computation (8.3)-(8.6) is the neat-level one. E19's
argument that nothing is affected rests on the level-independence in (b), which is false.

**Evidence.** p. 32, Definition 6.11: 'to be the unique element such that for every L = L_R L^R as in Proposition 6.10
... we have <...>^nat_{X,E} = vol^nat(L) . <Theta(phi_1)_L, Theta(phi_2)_L>^ell_{X_L,E} ... Note that by the projection
formula, the right-hand side of the above formula is independent of L', and footnote 11: 'the total degree of the Hodge
line bundle on X_L is equal to 2 vol^nat(L)^{-1}'. p. 25, Definition 4.8: 'It is clear that the image of
Theta_{phi}(phi)_L in CH^r(X)_C := lim_L CH^r(X_L)_C depends only on phi and phi^inf'. p. 26, Lemma 5.2: 'For every open
compact subgroup L ⊆ H(A^inf_F) ... X'_L represents the functor'. p. 23, Definition 4.1: Z_T(phi^inf)_L := sum over x in
L \ V^m with T(x) = T of phi^inf(x)Z(x)_L. p. 11, (H8): L^R is the stabilizer of Lambda^R. p. 18: vol^nat(L) is the
volume of H(F_inf)L. p. 49 (Section 11) takes 'an open compact subgroup L ... of the form L_R L^R ... that fixes both
phi_1 and phi_2', with no neatness.

**Fix.** Restrict to neat levels throughout. In items 35, 54 and 57 (and in Definition 4.8 as recorded in item 34) add:
'L is neat (for L = L_R L^R it suffices that L_R be neat at one place of R)'. Item 34 should say 'the image in colim
over neat L of CH^r(X_L)_C'. Item 54 should say 'for every neat L = L_R L^R ... independent of the neat L by the
projection formula', and footnote 11 should be stated for neat L. Item 57's Proposition 8.1, and Propositions 7.1, 9.1,
10.1 and Lemma 11.1 for the s3 range, should be stated for neat L. Add a sourceIssue (kind error, affects a stated
result, known new) quoting Definition 6.11 and Lemma 5.2. Give the counterexample L = {+-1}L' with Theta_{L'} = 2
Theta_L and vol^nat(L) = 2 vol^nat(L'). Amend E19's reason: neatness is needed for the normalisation, the colimit
compatibility and representability, not only for smoothness; 'affects' becomes 'a stated result'.

### /6 — error

**Where.** research/blueprint/papers/PAPER-LI-LIU-21.result.json item /57 (Proposition 8.1 and Lemma 8.2); no
sourceIssue

**Claim.** Lemma 8.2 reduces to g_{iv} = 1 at all v in V^(p)_F \ R'. It writes m(a_i)^{-1}n(b_i)^{-1}g_{iv} = k_v in
K_{r,v} and then drops k_v. That needs omega_{r,v}(k_v)phi_{iv} = phi_{iv}. This fails at two kinds of place, both
allowed by Proposition 8.1, which assumes only that the underline-u is not in S and that V^(p)_F ∩ R ⊆ V^spl_F. (i) At
an inert v ≠ the underline-u above the same p with v in S: phi_{iv} = 1_{(Lambda^R_v)^r} with Lambda^R_v of index q_v^2
in its dual. Since w_r ∈ K_{r,v} and omega(w_r)phi = gamma^r phi-hat, w_r sends 1_{(Lambda^R_v)^r} to a nonzero multiple
of 1_{((Lambda^R_v)^vee)^r}. So for g_{iv} outside P(F_v)·Stab(1_{(Lambda^R_v)^r}), no choice of a_i, b_i makes the
function p-basic, and the integral-model argument does not apply. (ii) At split v in (R \ R') above p, phi_{iv} is
arbitrary. Case (ii) is repaired by keeping g_v; case (i) is a real gap. Section 11 uses Proposition 8.1 in case (i):
Lemma 11.1(1) applies it to g = tau g^(j) h_k, where h_k ∈ G_r(A^{inf,R}_F) comes from Liu's Hecke algebra at the places
of S.

**Evidence.** p. 36, proof of Lemma 8.2: 'we may find elements a_i ∈ GL_r(E) and b_i ∈ Herm_r(F) such that
m(a_i)^{-1}n(b_i)^{-1}g_{iv} ∈ K_{r,v} for every v ∈ V^(p)_F \ R' ... let g~_i be the away-from-(R' ∪ V^(inf)_F ∪
V^(p)_F)-component ... By Lemma 4.3, we have I(phi_1, phi_2, s_1, s_2, g_1, g_2) = C · I(phi~_1, phi~_2, s_1, s_2, g~_1,
g~_2)'. p. 13, (W1): 'omega_{m,v}(w_m)phi(x) = gamma^m_{V_v,psi_{F,v}} · phi-hat(x)'. p. 11, (H6): Lambda^R_v has index
q_v^{1-epsilon_v} in its dual. p. 36: 'Take an element u ∈ V^int_E such that [underline u] ∉ S and whose underlying
rational prime p is odd and satisfies V^(p)_F ∩ R ⊆ V^spl_F'. p. 37: 'φ^∞ ... p-basic (Definition 6.5)', i.e. phi_v =
1_{(Lambda^R_v)^m} for v ∈ V^(p)_F \ (R ∪ V^spl_F). p. 50, proof of Lemma 11.1(1): '(c_k, h_k) ∈ C × G_r(A^{inf,R}_F)
such that h phi_1 = sum c_k omega(h_k)phi_1'.

**Fix.** Add a sourceIssue (kind gap, affects the proof, known new). In item 57 replace 'Lemma 8.2 reduces to g_{1v} =
g_{2v} = 1 at v ∈ V^(inf)_F ∪ V^(p)_F using Lemma 4.3' with the following. 'Lemma 8.2 reduces to g_{1v} = g_{2v} = 1 at
archimedean v and at v ∈ V^(p)_F \ (R ∪ S ∪ V^spl_F), where 1_{(Lambda^R_v)^r} is K_{r,v}-invariant, keeping the
components at split places. At v ∈ V^(p)_F ∩ S the reduction holds only for g_{iv} ∈ P(F_v)·Stab(1_{(Lambda^R_v)^r});
the paper gives no argument for other g_{iv}.' Then either restrict Proposition 8.1 to such sextuples and check whether
Section 11 needs more (it does in Lemma 11.1(1) when t has components at places of S above a prime that also has an
inert place outside S), or record the missing case as an open input.

### /7 — error

**Where.** research/blueprint/papers/PAPER-LI-LIU-21.result.json items /62 (Proposition 10.1) and /63 (Lemma 11.1),
route 1 brief ('the local-index Propositions 7.1, 8.1, 9.1 and 10.1', 'Lemma 11.1'); missing sourceIssue

**Claim.** The archimedean bookkeeping drops the Fourier terms with T_1 outside Herm_r(F)^+ on both sides, and the
published chain only closes because the two omissions cancel. (a) Analytic side: for an archimedean place u, every T□ in
𝔈_{T_1,T_2}(·)_u has Diff(T□,V) = {u}, i.e. T□ is not positive definite at u, so Remark 3.12 (which concerns
Herm°_{2r}(F)^+) does not apply; T_1 can be negative at u (e.g. r = 1, t_1 < 0 at u, t_1 > 0 at the other real places),
W'_{T□,u}(0,·,Φ^0_u) ≠ 0 for signature (2r−1,1), and these terms are part of E'(0,(g_1,g_2),Φ)_{−,T_2}. So the step on
p.51 'By Proposition 3.10 and Remark 3.12, Σ_{T_1∈Herm°_r(F)^+} 𝔈^S_{T_1,T_2} = E'(0,…)_{−,T_2} − …' omits them; they do
not vanish after ∫_{𝔉^{(j)}}φ^c, since 𝔉^{(j)} is not a product domain. (b) Geometric side: the proof of Proposition
10.1 (p.48) asserts Σ_{T_1∈Herm°^+} φω^KM_{T_1} = Σ_{T_1∈Herm^+} φω^KM_{T_1} = (…)∫_{𝔉_1}φ^c ω^KM, then uses that this
is harmonic (Millson) and cohomologically trivial. The Kudla–Millson theta form also has nonzero Fourier terms at T_1 ∉
Herm_r(F)^+ (vectors of ^uV^r with T(x) indefinite at u), and the proof drops them. Its stated reason for the first
equality, 'supp(φ^∞_{1v}) ⊆ (V^r_v)_reg', is not available: Definition 6.3 only gives supp(φ_{1v} ⊗ φ_{2v}^c) ⊆
(V^{2r}_v)_reg, which allows x_1 with T(x_1) degenerate. (The degenerate terms vanish for another reason: for F ≠ Q, ^uV
is definite at a second real place, so a global x with T(x) degenerate is linearly dependent, and then (x_v, y) is never
regular.) As printed, Proposition 10.1 (right-hand side over Herm°_r(F)^+ only) is not what the harmonic-form argument
proves, and Lemma 11.1(1) is derived through a false equality.

**Evidence.** p.48: 'Since supp(φ^∞_{1v}) ⊆ (V^r_v)_reg for some v ∈ R′, we have Σ_{T_1∈Herm°_r(F)^+} φω^KM_{T_1} =
Σ_{T_1∈Herm_r(F)^+} φω^KM_{T_1} … However, Σ_{T_1∈Herm_r(F)^+} φω^KM_{T_1} = (ω_{r,∞}(g_{2∞})φ^0_∞(T_2))^c · ∫_{𝔉_1}
φ^c(τ_1g_1)ω^KM(τ_1g_1) dτ_1, where ω^KM(g_1) is the Kudla–Milson form for the generating function'. p.29 Def. 6.3:
'satisfying that supp(φ^∞_{1v} ⊗ (φ^∞_{2v})^c) ⊆ (V^{2r}_v)_reg for v ∈ R′'. p.11 (H3): '(V^m_v)_reg :=
∪_{T∈Herm°_m(F_v)} (V^m_v)_T'; (H4): 'Diff(T, V) := {v ∈ V_F | (V^m_v)_T = ∅}'. p.10: 'Herm_m(F)^+ (resp. Herm°_m(F)^+)
… totally semi-positive definite (resp. totally positive definite)'. p.18 Prop. 3.10(2): 'E′(0, g, Φ) =
Σ_{w∈V_F∖V^spl_F} 𝔈(g, Φ)_w, where 𝔈(g, Φ)_w := Σ_{T□∈Herm°_{2r}(F), Diff(T□,V)={w}} W′_{T□}(0, g_w, Φ_w) Π_{v≠w}
W_{T□}(0, g_v, Φ_v)'. p.19 Remark 3.12: 'The image of Herm°_{2r}(F)^+ under ∂_{r,r} is contained in Herm°_r(F)^+ ×
Herm°_r(F)^+.' p.50: 𝔈^S := Σ_{u∈V_E∖V^spl_E} 𝔈_{T_1,T_2}(…)_u − … (archimedean u included). p.51: 'By Proposition 3.10
and Remark 3.12, we have Σ_{T_1∈Herm°_r(F)^+} 𝔈^S_{T_1,T_2}((τ^{(j)}g^{(j)}h_k, g_2), Φ^0_∞ ⊗ Φ^∞) = E′(0,
(τ^{(j)}g^{(j)}h_k, g_2), Φ^0_∞ ⊗ Φ^∞)_{−,T_2} − Σ_{u∈S_E} …'.

**Fix.** Add a sourceIssue (kind gap; locator: proof of Proposition 10.1, p.48, and proof of Lemma 11.1(1), p.51;
affects: the proof, and the statement of Proposition 10.1 as printed). Item 62: replace the right-hand side of (10.1) by
½∫_{𝔉_1}φ^c(τ_1g_1) Σ_{T_1∈Herm_r(F)} 𝔈_{T_1,T_2}((τ_1g_1, g_2), Φ^0_∞ ⊗ (s_1φ^∞_1 ⊗ (s_2φ^∞_2)^c))_u dτ_1 (all T_1 ∈
Herm_r(F), the left-hand side unchanged), and say in the proof outline: the degenerate T_1 ∈ Herm_r(F)^+ terms vanish
because F ≠ Q (a second definite real place forces linear dependence, which the regular-support condition of Definition
6.3 excludes), not because of 'supp(φ^∞_{1v}) ⊆ (V^r_v)_reg'; the terms with T_1 ∉ Herm_r(F)^+ of the Kudla–Millson form
are kept in (10.8) and matched with the archimedean terms 𝔈_{T_1,T_2}(·)_u by the archimedean identity for Green forms
of empty cycles (Kudla 1997; [Liu11a, Thm. 4.20] if it covers all T_1, which the design must check). Item 63: the step
on p.51 then follows from Proposition 3.10(2) alone. Remark 3.12 is needed only for the finite-place terms. Route 1
brief: list Proposition 10.1 'with the right-hand side summed over all T_1 ∈ Herm_r(F) (new sourceIssue)'.

### /8 — error

**Where.** research/blueprint/papers/PAPER-LI-LIU-21.result.json item /63 (Lemma 11.1(1) and the §11 normalisations),
sourceIssues E10 (its correction and reason), item /4 (proof note), route 1 brief;
research/blueprint/papers/PAPER-LI-LIU-21.result.json items /81 and /52 (with /55)

**Claim.** E10 extends Disegni–Liu's correction of Proposition 6.10(1) to Lemma 11.1(1) ('Lemma 11.1(1) has χ^R_{π∨}(t)
for χ^R_π(t)^c'). That is not what the proof of Lemma 11.1(1) computes. The lemma involves t only through the test
function, by tφ^∞_1 = hφ^∞_1 = Σ_k c_k ω(h_k)φ^∞_1 with θ^R(h) = t, and no Hecke action on cycles enters. The change of
variables gives the operator φ^c_1 ↦ Σ_k c_k φ^c_1(·h_k^{−1}), whose eigenvalue on the K-fixed φ^c_1 is χ^R_{π,W_r}(h) =
χ^R_π(t). Indeed e_K Σ_k conj(c_k)π(h_k^{−1})e_K is the Petersson adjoint of e_K Σ_k c_kπ(h_k)e_K = χ^R_π(t) on π^K. So
the factor is χ^R_π(t), not χ^R_π(t)^c (printed) and not χ^R_{π∨}(t) (item 63, E10). These differ whenever χ^R_π(t) ∉ R,
even for t = 1_{LhL} at a split place. E10's 'check' takes the operator Σ_k c_kπ^∨(h_k) and so omits the inversion h_k ↦
h_k^{−1}. The extraction also mixes conventions. Under E10's χ^R_{π∨} in Lemma 11.1(1), the proof of Theorem 1.5 in item
4's note localizes at 𝔪^R_π with χ^R_π(t_{T_2}) = 1, but it needs the factor for the adjoint t̂_{T_2} to be nonzero.
That factor would be χ^R_{π∨}(t̂_{T_2}) = conj χ^R_{π∨}(t_{T_2}), which χ^R_π(t_{T_2}) = 1 does not control. Also: (a)
After the E10 correction, item 55 takes s^u_i outside 𝔪^R_{π∨}. Its sketch obtains them 'from Lemma 7.3 and Corollary
B.15(1)', but item 81 states Lemma 7.3 only for 𝔪 = 𝔪^R_π ∩ S^{R∪V^(p)}. That gives elements outside 𝔪^R_π, not outside
𝔪^R_{π∨}. (b) Item 81 proves part (1) of Lemma 7.3 'by Proposition 6.9(2)', as the paper does. The statement recorded in
item 52 (nonemptiness of (S)^<ℓ>_{L_R} \ 𝔪) does not give (1). What (1) needs is the localized vanishing proved inside
the proof of Proposition 6.9(2), applied at level L_{u̲,m}L^{u̲} (so with R ∪ {u̲}), to X'_L ⊗ K over the unramified
extension K/E_u, and for the Hecke algebra S^{R∪V^(p)}.

**Evidence.** p.31 Def. 6.8: 'the algebra H^R_{W_r} acts on V^{[r]R}_π by a character χ^R_{π,W_r} … χ^R_{π,W_r} = (χ^R_π
⊗_{Q^ac} C) ∘ θ^R'. p.50: 'pick an element h ∈ H^R_{W_r} such that θ^R(h) = t … hφ^∞_1 = Σ_k c_kω^∞_r(h_k)φ^∞_1 and hφ_1
= Σ_k c_kπ(h_k)φ_1 … tφ^∞_1 = hφ^∞_1 = Σ_k c_kω^∞_r(h_k)φ^∞_1'. p.51: '= ∫_{G_r(F)\G_r(A_F)} (hφ^c_1)(g_1)E′(0, (g_1,
g_2), Φ^0_∞ ⊗ Φ^∞)_{−,T_2} dg_1 … Part (1) follows as hφ^c_1 = χ^R_π(t)^c · φ^c_1.' The preceding line is Σ_k
c_k∫φ^c_1(g_1)E′(0,(g_1h_k,g_2),…)dg_1, so (hφ^c_1)(g) = Σ_k c_kφ^c_1(gh_k^{−1}). Toy check: G abelian, φ = e^{iθx}, h =
δ_a gives Σ c_kφ^c(x − a) = e^{iθa}φ^c(x) = χ(h)φ^c(x), not conj χ(h). p.52 (proof of Thm 1.5): 'we can find t_{T_2} ∈
T^R_{Q^ac} satisfying χ^R_π(t_{T_2}) = 1 … Let t̂_{T_2} be the adjoint of t_{T_2} … applying Lemma 11.1(1) twice with t
= t̂_{T_2} and t = 1'. Also: p. 34, Lemma 7.3: '(H^{2r}(𝒳_m, Q_ℓ(r)) ⊗ Q^ac)_m = 0 where m := m^R_π ∩
S^{R∪V^(p)}_{Q^ac}'. p. 35: 'Part (1) has already been proved in Proposition 6.9(2)'. p. 31, proof of Proposition
6.9(2): 'it remains to show that for every given u ∈ V^fin_E \ V^(ℓ)_E ... the localization of H^{2r}(X_{L_R L^R,u},
Q_ℓ(r)) at m^R_π vanishes'. sourceIssues E10, correction: 'the elements should be taken in S^R_{Q^ac} \ m^R_{π^∨}'.

**Fix.** Item 63(1): replace both factors χ^R_{π∨}(t) by χ^R_π(t) (= χ^R_{π,W_r}(h), θ^R(h) = t), with the note:
'printed χ^R_π(t)^c; the proof's change of variables g_1 ↦ g_1h_k^{−1} and the unitarity of π give χ^R_π(t)'. E10:
remove Lemma 11.1(1) from 'The same substitution applies in §11', and replace the last part of the reason by: 'Lemma
11.1(1) involves only the action of [Liu, Thm. 1.1] on test functions, and there the factor is χ^R_π(t). The
eigencharacter of the cycles (Proposition 6.10(1)) and the normalisations χ(s̃_i) = 1 in §11 must use the Hecke
convention of Lemma 4.4 as reproved by Disegni–Liu (Remark 4.51). With s^*Z_T(φ) = Z_T(sφ), the same computation gives
χ^R_π(s) in Proposition 6.10(1), so Disegni–Liu's χ^R_{π∨}(s) presupposes a transpose there, which then also enters the
test functions s_iφ_i of Propositions 7.1–10.1.' Item 4's note: say that the contradiction argument is run at the
maximal ideal that carries the eigencharacter of the cycles (𝔪^R_{π∨} under Disegni–Liu's convention, then transported
to 𝔪^R_π by 1 ⊗ c), and that t̂_{T_2} must make the Lemma 11.1(1) factor equal to conj of that eigencharacter at
t_{T_2}. The route 1 brief should require the design to fix one convention and propagate it. Also: In item 81 add: 'the
same holds with 𝔪^R_{π∨} ∩ S^{R∪V^(p)}_{Q^ac} = c(𝔪 ∩ S^{R∪V^(p)}_{Q^ac}) in place of 𝔪, by applying 1 ⊗ c to H ⊗_Q
Q^ac; Proposition 7.1 (item 55) uses that version'. In item 52 add the intermediate statement: 'under Hypothesis 6.6,
for every finite set R~ ⊇ R of places, every level L_{R~}L^{R~}, every u ∉ V^(ℓ)_E and every finite extension K/E_u,
(H^{2r}(X_{L_{R~}L^{R~}} ⊗_E K, Q_ℓ(r)) ⊗ Q^ac) localized at 𝔪^R_π ∩ S^{R~}_{Q^ac} is 0'. Then make item 81 cite it in
place of 'Proposition 6.9(2)'.

## All findings

| Finding | Severity | Kind | Where | Claim (abridged) |
|---|---|---|---|---|
| /1 | high | error | research/blueprint/papers/PAPER-LI-LIU-21.result.json route 5 … | Route 5 records Lemma 7.3 (item 81) at IG.5 'with IG.7 as its consumer'. This creates a dependency cycle: Lemma 7.3 is stated 'in the situation of Proposition … |
| /2 | high | error | research/blueprint/papers/PAPER-LI-LIU-21.result.json route 3 … | Route 3 sends Lemma 5.4 (item 42) and the integral special cycles with their K-theory classes (item 43) to UnitaryKudlaRapoportCycles, but both are stated in … |
| /3 | high | error | research/blueprint/papers/PAPER-LI-LIU-21.result.json route 4 … | Item 17 (Proposition 3.6) is sent to MP.3, but parts (1) and (2) are doubling statements: (1) is multiplicity one for the degenerate principal series … |
| /4 | high | duplicate | research/blueprint/papers/PAPER-LI-LIU-21.result.json items /16, /82, …; … | Route 1 plans the general local theory of the unitary doubling method inside the GZ Part II UnitaryArithmeticInnerProductFormula. That covers Yamana's good … |
| /5 | high | error | research/blueprint/papers/PAPER-LI-LIU-21.result.json items /34, /35, … | The paper allows every level L (every L = L_R L^R) and claims three things for all of them. Definition 4.8: Theta_L has a well-defined image in colim_L … |
| /6 | high | error | research/blueprint/papers/PAPER-LI-LIU-21.result.json item /57 …; … | Lemma 8.2 reduces to g_{iv} = 1 at all v in V^(p)_F \ R'. It writes m(a_i)^{-1}n(b_i)^{-1}g_{iv} = k_v in K_{r,v} and then drops k_v. That needs … |
| /7 | high | error | research/blueprint/papers/PAPER-LI-LIU-21.result.json items /62 …; … | The archimedean bookkeeping drops the Fourier terms with T_1 outside Herm_r(F)^+ on both sides, and the published chain only closes because the two omissions … |
| /8 | high | error | research/blueprint/papers/PAPER-LI-LIU-21.result.json item /63 (Lemma …; … | E10 extends Disegni–Liu's correction of Proposition 6.10(1) to Lemma 11.1(1) ('Lemma 11.1(1) has χ^R_{π∨}(t) for χ^R_π(t)^c'). That is not what the proof of … |
| /9 | medium | error | research/blueprint/papers/PAPER-LI-LIU-21.result.json route 6 … | Absolute purity (item 79) is routed to SF.2 on the strength of PAPER-CESNAVICIUS-19's routing, although SF.2's text does not mention purity (the route itself … |
| /10 | medium | duplicate | research/blueprint/papers/PAPER-LI-LIU-21.result.json item /64 and … | Beilinson's non-archimedean local index (B.1) with Lemma B.3 (item 64) is routed to UnitaryArithmeticInnerProductFormula, yet the accepted PAPER-DISEGNI-LIU-24 … |
| /11 | medium | duplicate | research/blueprint/papers/PAPER-LI-LIU-21.result.json item /84 and … | Item 84 is marked missing and planned inside UnitaryArithmeticInnerProductFormula, but the accepted PAPER-LIU-ETAL-22 extraction already records the same … |
| /12 | medium | missing | research/blueprint/papers/PAPER-LI-LIU-21.result.json route 3 brief …; … | Route 3's brief names no imports at all, contrary to PROTOCOL §16 ('names the roadmaps it imports from, by title and id'), and it asks the design to add 'the … |
| /13 | medium | duplicate | research/blueprint/papers/PAPER-LI-LIU-21.result.json item /61 (route … | Item 61 plans in UnitaryArithmeticInnerProductFormula the Kudla–Millson forms and Green currents and Liu's archimedean identity [Liu11a, Thm. 4.20]. The … |
| /14 | medium | error | research/blueprint/papers/PAPER-LI-LIU-21.result.json route 9 … | Gillet's ℓ-adic Chern classes with supports on K_0 (item 76) are routed to M.8, the regulator stage. Its prerequisites are the whole higher-K-theory chain: M.8 … |
| /15 | medium | error | research/blueprint/papers/PAPER-LI-LIU-21.result.json route 7 … | Route 7 asks MC.7 to 'register Theorems 1.5 and 1.7 as proved cases', but those theorems are planned in UnitaryArithmeticInnerProductFormula, so MC.7 would … |
| /16 | medium | missing | research/blueprint/papers/PAPER-LI-LIU-21.result.json (no item; … | The proof of Proposition 3.7 starts from the global doubling identity (Piatetski-Shapiro–Rallis unfolding) in Liu's normalization, cited as 'the formula … |
| /17 | medium | missing | research/blueprint/papers/PAPER-LI-LIU-21.result.json (no items; … | Proposition 3.7 and Proposition 3.6(2) rest on three cited evaluations of local doubling zeta integrals, and none is an item. (a) The archimedean value [EL, … |
| /18 | medium | error | research/blueprint/papers/PAPER-LI-LIU-21.result.json items /3, /9 … | Three items drop the paper's restriction to finite places in statements about the local Hasse invariant, and the statements become false at archimedean places … |
| /19 | medium | other | research/blueprint/papers/PAPER-LI-LIU-21.result.json route 1 brief …; … | Protocol §16 requires a brief to state the final theorems exactly as the paper does. Route 1's brief only names 'Lemma 11.1, Theorems 1.5 and 1.7, and … |
| /20 | medium | duplicate | research/blueprint/papers/PAPER-LI-LIU-21.result.json item /7 (route … | Item 7, the classical Rallis inner product formula for the coherent equal-rank unitary pair, is routed as missing mathematics to … |
| /21 | medium | missing | research/blueprint/papers/PAPER-LI-LIU-21.result.json (no item; … | The proof of Proposition 3.13 needs matrix coefficients of the tempered π_v to lie in L^{2+ε}. It needs this on G_r(F_v), and modulo the centre when E_v = F_v … |
| /22 | medium | missing | research/blueprint/papers/PAPER-LI-LIU-21.result.json item /3 (Remark … | Remark 1.4(1) uses [Sch75, Theorem 1.3] (Schmid) to identify Assumption 1.3(1) with Assumption 3.1(1). Assumption 1.3(1) prescribes the holomorphic discrete … |
| /23 | medium | missing | research/blueprint/papers/PAPER-LI-LIU-21.result.json item /27 (Lemma …; … | The second half of Lemma 3.15 rests on two cited results that have no item: Matsushima's formula, and the fact that a cohomological discrete series has … |
| /24 | medium | error | research/blueprint/papers/PAPER-LI-LIU-21.result.json items /56 and …; … | Proposition 8.1 allows p = ℓ: ℓ R-good and u inert above an odd p with the underline-u not in S are compatible. Section 11 sums local indices over all finite … |
| /25 | medium | duplicate | research/blueprint/papers/PAPER-LI-LIU-21.result.json items /38, /39, …; … | Routes 2 and 3 send these items to the Part II candidates proposed by PAPER-LI-ZHANG-22-B, whose own items already state the same results for the same … |
| /26 | medium | missing | research/blueprint/papers/PAPER-LI-LIU-21.result.json (no item); … | No item records [Ram, Thm. A], Ramakrishnan's strong multiplicity one for isobaric representations of GL_n(A_E) from agreement at almost all split (degree-one) … |
| /27 | medium | missing | research/blueprint/papers/PAPER-LI-LIU-21.result.json (no item); … | No item records the Hasse principle for hermitian forms (Landherr) together with Witt's theorem. Definition 4.1 needs, for x with T(x) ∈ Herm°_m(F)^+, a global … |
| /28 | medium | missing | research/blueprint/papers/PAPER-LI-LIU-21.result.json item /33 …; … | Proposition 4.7 rests on (4.2), dim_C M^[r]_m(Γ^(i)) < ∞: holomorphic hermitian modular forms on G_m of weight κ^r_m and level Γ^(i) form a finite-dimensional … |
| /29 | medium | error | research/blueprint/papers/PAPER-LI-LIU-21.result.json item /64 …; … | Lemma B.3(1) asserts ⟨c′_1, c′_2⟩^ℓ_{X′,K′} = ⟨c_1, c_2⟩^ℓ_{X,K} for every finite extension K′/K. Its proof's diagram identifies both H^1(Spec K, Q_ℓ(1)) and … |
| /30 | medium | missing | research/blueprint/papers/PAPER-LI-LIU-21.result.json: no items for …; … | Lemma 9.2 (pp.41–44), on the main chain through Proposition 9.1, uses cited results that no item records. They are named only inside item 58's proof sketch. … |
| /31 | low | other | research/blueprint/papers/PAPER-LI-LIU-21.result.json prerequisites … | PROTOCOL §16 lists as prerequisites 'the papers this one builds on that the atlas does not yet cover'. Two of the 21 records are already extracted and … |
| /32 | low | other | research/blueprint/papers/PAPER-LI-LIU-21.result.json routes 1–3 … | PROTOCOL §16 requires briefs to name imported roadmaps 'by title and id'. All three briefs give ids only (e.g. 'MetaplecticAutomorphicForms MP.2–MP.4', … |
| /33 | low | error | research/blueprint/papers/PAPER-LI-LIU-21.result.json item /74 … | The weight spectral sequence of a strictly semistable model is planned in the sub-stage LPV.7:semistable-curves ('For higher-dimensional strict normal-crossing … |
| /34 | low | other | research/blueprint/papers/PAPER-LI-LIU-21.result.json items /75 and … | The same cited statements carry different statuses in accepted extractions. Item 75 (K^Z_0 with supports, codimension filtration, F^a·F^b ⊆ F^{a+b} rationally … |
| /35 | low | other | research/blueprint/papers/PAPER-LI-LIU-21.md (Routes, item 2; … | The report says route 2 has '(7 items)' but the route has 8 (items 35–41 and 85). Its 'Not in the atlas' list (absolute purity, the doubling integral) and its … |
| /36 | low | missing | research/blueprint/papers/PAPER-LI-LIU-21.result.json items /14 and … | Two definitions and facts of §3 that later sections use are not stated by any item. (i) The Siegel Eisenstein series E(s, g, Φ) is meromorphic in s and … |
| /37 | low | other | research/blueprint/papers/PAPER-LI-LIU-21.result.json sourceIssues … | Notation 2.2(H4) asserts that Diff(T, V) is finite and disjoint from V^spl_F for every T ∈ Herm_m(F) and every m ≥ 0. This is false once m > n = 2r. For … |
| /38 | low | other | research/blueprint/papers/PAPER-LI-LIU-21.result.json item /9 ('a …; … | Notation 2.2(H5) requires R to be nonempty, but Corollary 1.9 and its proof use R = ∅. They use the lattice Λ^∅, the space V^{[r]∅}_π, and Proposition 3.7 … |
| /39 | low | other | research/blueprint/papers/PAPER-LI-LIU-21.result.json sourceIssues …; … | Three slips in §§2–3 are not in sourceIssues. (1) Footnote 5 sits in §2, where V is an arbitrary totally positive definite space and π is not yet defined, but … |
| /40 | low | error | research/blueprint/papers/PAPER-LI-LIU-21.result.json item /17 … | Proposition 3.6 and its whole proof are on p.16; the proof's □ is at the foot of p.16, and p.17 starts with Proposition 3.7. The locator says pp.16–17. |
| /41 | low | error | research/blueprint/papers/PAPER-LI-LIU-21.result.json item /35 (Lemma …; … | Lemma 5.2 defines the equivalence of sextuples by 'O_F-linear quasi-isogenies'. In this paper F is the totally real field and E the CM field, so the morphisms … |
| /42 | low | error | research/blueprint/papers/PAPER-LI-LIU-21.result.json item /55 (proof …; … | The proof of Lemma 7.2 has three defects. (a) It reduces to <Z(x_1)'_L, Z(x_2)'_L>^ℓ_{X_0,K} = 0 (7.1). Individual special cycles are not ℓ-adically … |
| /43 | low | error | research/blueprint/papers/PAPER-LI-LIU-21.result.json item /57 (proof …; … | The proof passes from (8.4) to (8.5) 'using vol^nat(L_{underline u}) = 1'. But vol^nat is defined only for open compact L ⊆ H(A^inf_F), as the d^nat h-volume … |
| /44 | low | other | research/blueprint/papers/PAPER-LI-LIU-21.result.json item /48 … | Item 48 says that 'the local indices at finite and archimedean u are its terms in (6.1)'. The terms of (6.1) are 2<,>_{X_L,u,E_u} and log … |
| /45 | low | error | research/blueprint/papers/PAPER-LI-LIU-21.result.json items /39 and … | Both items write 'u ∉ S' for the paper's condition on the place of F below u. S ⊆ V^int_F is a set of places of F, and u ∈ V^int_E. Proposition 8.1 prints the … |
| /46 | low | missing | research/blueprint/papers/PAPER-LI-LIU-21.result.json item /55 (no … | [RSZ20, Lemma 8.7] is the input that makes split-place local indices vanish in Lemma 7.2 and in the proof of Proposition 7.1. In the special fibre at a split … |
| /47 | low | error | research/blueprint/papers/PAPER-LI-LIU-21.result.json item /58 (proof … | Corollary B.15(2) needs (H^{2r}(X, Q_ℓ(r)) ⊗ L)_𝔪 = 0 for the generic fibre X = X′_L ⊗_{E′} K of 𝒳_L, over the field K. Proposition 6.9(2) gives an element of … |
| /48 | low | error | research/blueprint/papers/PAPER-LI-LIU-21.result.json item /4 (note); … | The proof of Theorem 1.5 assumes (CH^r(X_L)^0_C)_{𝔪^R_π} = 0. It then picks t_{T_2} with t^*_{T_2}Z_{T_2}(ω^∞_r(g^{(j)})φ^∞_2)_L = 0, but Z_{T_2}(…)_L is not … |
| /49 | low | missing | research/blueprint/papers/PAPER-LI-LIU-21.result.json sourceIssues … | Four misprints in §§10–11 are not recorded. (1) (11.1) keeps t on the right: the right-hand side should be Σ_k c_k I_{T_1,T_2}(φ^∞_1, φ^∞_2, s̃_1, s̃_2, … |
| /50 | low | error | research/blueprint/papers/PAPER-LI-LIU-21.result.json item /5 … | The joint proof of Theorem 1.7 and Corollary 1.9 begins on p.52, where its first display (the expression of the normalized height through the global indices) … |

## Notes for the fix job

- **Owners and cycles first.** Move items 14, 16, 82 and 83 to AutomorphicLFunctionsAndLocalFactorsPartIIDoubling. Move
  item 81 and items 42–43 into route 1, keeping only the integral cycles in route 3. Split item 17, so that only its
  theta part stays at MP.3.
- **Source issues.** Record the archimedean-term gap in Proposition 10.1 and Lemma 11.1, the neat-level requirement, the
  Lemma 8.2 gap at places of S, and the corrected eigencharacter in Lemma 11.1(1). Then propagate one Hecke convention
  through items 4, 55, 63 and 81.
- **Inputs.** Add the missing cited inputs as items with the owners the findings name.
