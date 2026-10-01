# RT-PAPER-ALLEN-ETAL-23

Red team of the accepted extraction PAPER-ALLEN-ETAL-23: Allen, Calegari, Caraiani, Gee, Helm, Le Hung, Newton, Scholze,
Taylor and Thorne, *Potential automorphy over CM fields*, Annals of Mathematics 197 (2023), 897–1113. Issue #4065.

Red team: Claude Code, session `cc-c2c06b`, 1 October 2026. I did not write or review:
- the extraction (`cc-39fac3`, PR #2201);
- its review (`cc-7b31c4`, PR #2387).

Disclosures:
- I wrote FIX-RT-PAPER-BOCKLE-HARRIS-KHARE-ETAL-19 (PR #5338); one finding cites that paper's item 22;
- I wrote REV-FIX-RT-AREA-langlands-1~2 (PR #5313), which accepted the round-2 fixes of the GlobalGaloisDeformations
  packet; three findings cite that packet's contracts;
- I wrote the red teams of PAPER-NEWTON-THORNE-26 and PAPER-CARAIANI-SCHOLZE-24 and marked PAPER-LE-LEHUNG-LEVIN-ETAL-23
  complete. The confirmed verdicts on RT-AREA-langlands-1/7 and /9 were written by others.

**Result: 71 findings, 8 high, 37 medium and 26 low.**

## Method

**The source.** The published version (author-hosted, <https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf>), the
version the extraction read, was re-downloaded on 2026-10-01 (SHA-256 `c5429e4f…67f02`), with the arXiv 1812.09999v2 TeX
source for formulas (`94711e86…6b`); both equal the extraction's.

**The passes.** Eight parallel passes were run by this session.
- Six read all 217 pages: §§1–2, §§3–4, §5, §6.1–6.3, §6.4–6.6, and §7 with the references.
- Two checked statuses and routes: one the 118 PotentialAutomorphyInfrastructure references and route 2, one every other
  planned and library status and routes 1 and 3–13.

**Merging.** Many findings were reported by several passes; the result's `checked` field lists the merges. The largest:
the lifting theorems at PA.3 (five reports), ι-ordinarity (four), the prerequisites (four) and the broken note pointers
(five).

**What I re-verified myself.** All eight high findings:
- the stage order in the assembled graph: PA.4 requires PA.3, and ML.2, PA.0, SR.1 and G7 are ancestors of ML.5, PA.1,
  PA.2 and AG2.7 respectively;
- the placements of the items concerned in the extraction, and route 1's brief, which imports Theorem 2.4.8 from PA.0;
- PAPER-QIAN-23's accepted placement of Theorem 6.1.2 at PA.4, and the confirmed verdicts on RT-AREA-langlands-1/7 and
  /9;
- Theorem 1.0.1 on p. 899 against Corollaries 7.1.12 and 7.1.14.

**Severities.** I changed none; merged findings take the highest severity of their parts.

The full list of what was checked is in the result's `checked` field.

## The high findings

### /1 — error

**Where.** route 2 (items PAPER-ALLEN-ETAL-23/181, /182, /259, /270, /276, /289); route 2 reason; note of
PAPER-ALLEN-ETAL-23/182; the report (PAPER-ALLEN-ETAL-23.md), Routes, item 2; route 2 (items PAPER-ALLEN-ETAL-23/181,
/182, /259, /270, /276, /289); PAPER-ALLEN-ETAL-23/182 note; the report (PAPER-ALLEN-ETAL-23.md), route 2; route 2;
PAPER-ALLEN-ETAL-23/181; PAPER-ALLEN-ETAL-23/182; the report (PAPER-ALLEN-ETAL-23.md), 'Routes', item 2;
PAPER-ALLEN-ETAL-23/258, /267, /288 (planned at PA.3), with the standing set-ups /254 and /275 (planned at PA.3);
PAPER-ALLEN-ETAL-23/258, PAPER-ALLEN-ETAL-23/259, PAPER-ALLEN-ETAL-23/267, PAPER-ALLEN-ETAL-23/270,
PAPER-ALLEN-ETAL-23/276, PAPER-ALLEN-ETAL-23/288, PAPER-ALLEN-ETAL-23/289 (and the notes of PAPER-ALLEN-ETAL-23/181,
PAPER-ALLEN-ETAL-23/182); route 2; the report (PAPER-ALLEN-ETAL-23.md), section Routes, item 2

**Claim.** Route 2 assigns the automorphy lifting theorems (Theorems 6.1.1 and 6.1.2, Corollary 6.5.5, Theorem 6.6.2,
and the proofs of 6.1.1 and 6.1.2 by soluble base change) to PotentialAutomorphyInfrastructure:PA.3. PA.3's text plans
no lifting theorem, and PA's own text sends the lifting theorem elsewhere, so this placement rests only on PA citing the
paper. It also closes a dependency cycle. The proofs need PA.4: the Taylor–Wiles levels, Lemma 6.5.9, Proposition 6.5.11
and the patched complexes. They also need PA.1 (Theorem 4.5.1, through Proposition 6.5.3) and PA.2 (Theorem 5.5.1,
through Proposition 6.6.7). But PA.4 requires PA.3, and PA.3 requires neither PA.1 nor PA.2. The reason's justification
'PAPER-QIAN-23 routed Theorem 6.1.2 here' and the note of /182 ('routed to PA.3; this item follows that routing') are
out of date. The accepted, reviewed QIAN-23 now routes the same theorem (QIAN/072) to PA.4 and says that PA.3 would
close a cycle. The confirmed finding RT-AREA-langlands-1/7 (high) reached the same conclusion. Its fix prescribes
exactly this change to route 2, and the change has not been applied. Also: Two accepted extractions put the same main
theorem at different stages, and one of the two placements closes a cycle. The extraction sends the lifting theorems
(Theorems 6.1.1 and 6.1.2, Corollary 6.5.5, Theorem 6.6.2 and their soluble base-change deductions) to
PotentialAutomorphyInfrastructure:PA.3. It justifies this by saying 'PAPER-QIAN-23 routed Theorem 6.1.2 here'. The
accepted PAPER-QIAN-23 routes that same theorem (its item 072, ACC+ Theorem 6.1.2) to PA.4. Its accepted reason says
that PA.3 would close a cycle and that this extraction should move the theorems. The cycle is real. In the atlas, PA.4
requires PA.3. In this extraction, the proofs of Theorems 6.5.4 and 6.6.2, and hence of Theorems 6.1.1 and 6.1.2,
consume items planned at PA.4: the auxiliary Taylor–Wiles levels, Proposition 6.5.11 and the patching data (items
260–266 and 283–287). The citation of PAPER-QIAN-23 in route 2's reason, in item 182's note and in the report was true
of PAPER-QIAN-23 before its review moved item 072, and is false of the accepted text. Also: Route 2 sends the paper's
two automorphy lifting theorems, Theorems 6.1.1 and 6.1.2 (items 181 and 182), together with Corollary 6.5.5, Theorem
6.6.2 and their soluble base-change deductions (items 259, 270, 276, 289), to PotentialAutomorphyInfrastructure PA.3 as
a source route. PROTOCOL section 16 allows a source route only for an item that 'belongs inside existing layers'. No
layer of that roadmap plans an automorphy lifting theorem. PA.3 is 'Derived support and changes of local deformation
condition', the roadmap's scope is 'reusable ... interfaces', and PA.5 says outright that the lifting theorem stays
'with its dedicated owner'. The route's own reason concedes this ('no stage states an automorphy lifting theorem'), and
so does item 181's note. As routed, the main theorems of section 6 have no owner. A PA blueprint cannot add them without
going beyond its accepted layer statements, and ModularityAndLanglandsExtensions ML.2 only applies the infrastructure to
potential automorphy. Also: The extraction plans three items at PA.3: Theorem 6.5.4 (/258), the dimension count and
conclusion of its proof (/267, which it also lists at PA.4), and the support step of Theorem 6.6.2 (/288). Each is
proved from data that the extraction plans at PA.4: the Taylor–Wiles levels and complexes, Lemma 6.5.9, Proposition
6.5.11 and the patching data (/260, /263, /265, /266, /284–/287). PA.4 requires PA.3, so this placement is a cycle.
PA.3's text plans the comparison of two patched systems, which is an input. It does not plan the arithmetic support
theorem that this comparison yields. The standing hypotheses /254 (§6.5.1 (1)–(17)) and /275 (§6.6.1 (1)–(15)) are the
hypotheses of these theorems and of Corollary 6.5.5 and Theorem 6.6.2, so they belong with them. Also: The extraction
places the arithmetic outputs of the patching argument at PotentialAutomorphyInfrastructure PA.3. These are Theorem
6.5.4 (item 258, planned at PA.3 and P9), the conclusion of its proof (item 267, planned at PA.3, PA.4 and P9) and the
ordinary support step (item 288, planned at PA.3 and P9). Route 2 also sends Corollary 6.5.5 (259), Theorem 6.6.2 (276)
and the proofs of Theorems 6.1.1 and 6.1.2 (270, 289) to PA.3; its reason reads 'PA.3: the lifting theorems themselves'.
Each of these results is proved from the Taylor–Wiles and ultrapatching system that the extraction itself places at
PA.4: items 260–266, 273 and 283–287. Item 258's own note says 'The arithmetic patching verification is items 266–267
(PA.4)'. In the atlas, PA.4 requires PA.3. So PA.3 needs PA.4 and PA.4 requires PA.3, which is a dependency cycle. The
reviewed extraction PAPER-QIAN-23 places ACC+ Theorem 6.1.2 at PA.4 for exactly this reason. The report's justification
'PAPER-QIAN-23 routed Theorem 6.1.2 to PA.3' and item 182's note ('routed to PA.3; this item follows that routing') are
therefore out of date.

**Evidence.** Stage texts (data/atlas.json). PA.3: 'Use the general patching owner to compare patched complexes for two
systems of local conditions … Do not demand or infer integral R=T from a support comparison alone.' PA.5: '… while
leaving the lifting theorem with its dedicated owner.' PA README, Scope: 'Those source-qualified endpoints require their
own complete proof decomposition and do not become prerequisites of the infrastructure below.' Requires: PA.4 requires
[PA.3]; PA.3 requires [DeformationAndDerivedPatchingAlgebra:P9, PA.0]. The paper (published): p. 1063, proof of
Proposition 6.5.3, 'Theorem 4.5.1 shows that the Fontaine–Laffaille condition is satisfied for each v|p. We apply
Theorem 3.1.1 …'; p. 1064, proof of Corollary 6.5.5, 'Theorem 6.5.4 implies that ker f is in the support of H∗(X_K,
V_λ(1))_m[1/p]; Theorem 2.4.10 then implies …'; p. 1069, 'By Lemma 6.5.9, there are canonical isomorphisms … By
Proposition 6.5.11 we have nilpotent ideals I_N'; p. 1078, 'with the appeal to Theorem 4.5.1 being replaced instead with
an appeal to Theorem 5.5.1'. PAPER-QIAN-23 route 5 (stages [PotentialAutomorphyInfrastructure:PA.4], verdict accept):
'It is owned at PA.4; placing it at PA.3, which PA.4 requires, would close a cycle … The ACC+ extraction places Theorems
6.1.1, 6.1.2 and 6.6.2 at PA.3 and should move them with it.' (Its first version had PA.3; its review moved it.)
RT-AREA-langlands-1/7 has verdict confirmed. Its fixes report, §/7 item 5, says to replace the route-2 clause by 'PA.6:
the lifting theorems themselves, Theorems 6.1.1 and 6.1.2, Corollary 6.5.5 and Theorem 6.6.2, and their deductions
(added for RT-AREA-langlands-1/7; PA.3 cannot hold them, because PA.4 requires PA.3 and the theorems need PA.4)'. The
second-round fixes hand the PA.6 endpoint to BP-PotentialAutomorphyInfrastructure. Also: PAPER-QIAN-23, route 5, stages
['PotentialAutomorphyInfrastructure:PA.4'], item 072 ('Ordinary automorphy lifting theorem over CM and totally real
fields (ACC+ Theorem 6.1.2)'). Its reason: 'It is owned at PA.4; placing it at PA.3, which PA.4 requires, would close a
cycle. PA.4 currently requires only PA.3, so its blueprint must add PA.2 and PA.5 as prerequisites; neither depends on
PA.4. The ACC+ extraction places Theorems 6.1.1, 6.1.2 and 6.6.2 at PA.3 and should move them with it.' Its review
accepts the route, which uses 'PA.4's Taylor–Wiles primes and ultrapatching'. Atlas stage
PotentialAutomorphyInfrastructure:PA.4 requires PotentialAutomorphyInfrastructure:PA.3. This extraction's route 2
reason: 'PA.3: the lifting theorems themselves ... and PAPER-QIAN-23 routed Theorem 6.1.2 here'. Item 182's note:
'PAPER-QIAN-23 records this theorem as its item 072, status missing, routed to PA.3'. Items 266 and 287 ('The
Taylor–Wiles patching data for Theorem 6.5.4' and the same for Theorem 6.6.2) are planned at PA.4. Also: Atlas stage
PotentialAutomorphyInfrastructure:PA.5: 'Supply a reusable checklist theorem which records that the input package for a
chosen lifting argument survives a specified base change, while leaving the lifting theorem with its dedicated owner.'
Roadmap summary: 'Build the reusable cohomological, representation-theoretic and patching interfaces required by [ACC+]
... The scope is general-dimensional infrastructure'. PA.3: 'compare patched complexes for two systems of local
conditions ... Establish the generic support implication used for derived Ihara avoidance'. Route 2 reason in the
extraction: 'PA.3: the lifting theorems themselves, Theorems 6.1.1 and 6.1.2, Corollary 6.5.5 and Theorem 6.6.2, and
their deductions; no stage states an automorphy lifting theorem'. Item 181 note: 'No stage plans ACC+'s own unpolarized
CM-field lifting endpoint.' PROTOCOL section 16: 'source: it belongs inside existing layers of a proposed roadmap';
'part-ii: it needs new layers in the direction of an existing roadmap'. The paper (published, p. 1029), Theorem 6.1.1:
'Then ρ is automorphic: there exists a cuspidal automorphic representation Π of GL_n(A_F) of weight λ such that ρ ≅
r_ι(Π).' Also: The paper (published, pp. 1067–1070). The proof of Theorem 6.5.4 fixes 'a choice of Taylor–Wiles datum …
as in Proposition 6.2.33'. It then uses 'By Lemma 6.5.9 … By Proposition 6.5.11 …', and ends with 'we can apply
Proposition 6.3.8 to conclude that H∗(C∞) has full support over R∞'. data/atlas.json: PA.4 requires [PA.3]. PA.3's text:
'Use the general patching owner to compare patched complexes for two systems of local conditions which agree modulo a
chosen coefficient ideal … Establish the generic support implication used for derived Ihara avoidance.' The fix of the
confirmed RT-AREA-langlands-1/7 puts the following into the lifting endpoint PA.6: 'Take the set-up of §6.5.1: its
assumptions (1)–(17)' and 'Prove Theorem 6.5.4 … The ingredients are the Taylor–Wiles data and ultrapatching of PA.4,
the component properties of Lemma 6.2.26 and the comparison of PA.3, and Proposition 6.3.8'. Also: Atlas stage
PotentialAutomorphyInfrastructure:PA.4 ('Auxiliary primes and ultraproduct compatibility') has requires
['PotentialAutomorphyInfrastructure:PA.3'] and says: 'Prove that the system of finite-level complexes satisfies the
boundedness and compatibility hypotheses of ultrapatching; identify its specialization with the original complex ...
This layer proves the arithmetic tower meets those statements'. The paper (published, p. 1069), proof of Theorem 6.5.4:
'The objects introduced above satisfy the setup described in Section 6.4.1. We can then apply the results of Section
6.4.2 and obtain the following'. The paper (published, p. 1080), proof of Theorem 6.6.2: 'We can then apply the results
of Section 6.4.2 to complexes A(μ, χ, Q)_{n^Q} ⊗ O(ν + w_0^G μ)^{−1} (for choices of Taylor–Wiles data ... proved to
exist using Proposition 6.2.33)'. PAPER-QIAN-23, the route for item PAPER-QIAN-23/072 (ACC+ Theorem 6.1.2): 'It is owned
at PA.4; placing it at PA.3, which PA.4 requires, would close a cycle. ... The ACC+ extraction places Theorems 6.1.1,
6.1.2 and 6.6.2 at PA.3 and should move them with it.'

**Fix.** In route 2's reason, replace 'PA.3: the lifting theorems themselves, Theorems 6.1.1 and 6.1.2, Corollary 6.5.5
and Theorem 6.6.2, and their deductions; no stage states an automorphy lifting theorem, and PAPER-QIAN-23 routed Theorem
6.1.2 here.' with the sentence that the RT-AREA-langlands-1/7 fix prescribes. That sentence names the lifting endpoint
PA.6, which BP-PotentialAutomorphyInfrastructure adds. PA.6 requires PA.1, PA.2, PA.3, PA.4, PA.5,
GlobalGaloisDeformations G7 and G8, and LocalGaloisDeformationRings L7, L8 and R08.2; ModularityAndLanglandsExtensions
ML.2 consumes it. Add PotentialAutomorphyInfrastructure:PA.6 to route 2's stages once that stage exists in
data/atlas.json. Until then, say in the reason that the stage is pending, and do not name PA.3. Rewrite the note of /182
to say that PAPER-QIAN-23 route 5 now places Theorem 6.1.2 at PA.4, and that both extractions move it to the lifting
endpoint. Make the same correction in the notes of /181, /259, /270, /276 and /289, and in the report's description of
route 2. Also: Within route 2, move items 181, 182, 259, 270, 276 and 289 to PA.4, as PAPER-QIAN-23 does. In route 2's
reason, say that PA.4's blueprint must add PA.1, PA.2 and PA.5 as prerequisites; none of them depends on PA.4. Theorem
6.5.4 and the support steps (items 258, 267 and 288) also consume PA.4's patching data, so either move them to PA.4 as
well or state that PA.3 hands only the abstract support implication to PA.4. Rewrite route 2's reason, item 182's note
and the route-2 paragraph of the report to cite PAPER-QIAN-23 accurately: route 5, stage PA.4. Also: Remove items 181,
182, 259, 270, 276 and 289 from route 2. Add a part-ii route with parent PotentialAutomorphyInfrastructure, roadmap
PotentialAutomorphyInfrastructurePartIIAutomorphyLifting, title 'Reusable infrastructure for potential automorphy over
CM fields, Part II: automorphy lifting theorems over CM fields' and area langlands (the parent's galaxy). Its brief must
state Theorems 6.1.1 and 6.1.2 exactly as printed on pp. 1029–1030, with all five hypotheses of each and both
unramifiedness conclusions. It must cover Corollary 6.5.5, Theorem 6.6.2 and the soluble base-change reductions of
§§6.5.12 and 6.6.10. It imports PotentialAutomorphyInfrastructure PA.3–PA.5, DeformationAndDerivedPatchingAlgebra P7–P9,
GlobalGaloisDeformations G7 and G8, LocalGaloisDeformationRings L7 and L8, ArithmeticLocallySymmetricSpaces ALS.5
(Theorem 2.4.10) and AutomorphicGaloisRepresentationsPartII AG2.7, and has ModularityAndLanglandsExtensions ML.2 as its
consumer. Update the notes of items 181 and 182, the route 2 reason, and the report's route list accordingly. Also:
Remove PotentialAutomorphyInfrastructure:PA.3 from the planned lists of /258, /267, /288, /254 and /275. Until the
lifting endpoint PA.6 exists, mark these five items missing, add them to route 2, and assign them in its reason to that
endpoint. In their notes, name P9 as the supplier of Proposition 6.3.8 and Corollary 6.3.9. If the reviewer prefers to
keep them planned now, plan them at PA.4 rather than PA.3, and record in route 2's reason that PA.4 must then import
PA.1 and PA.2. Also: In route 2, move items 181, 182, 259, 270, 276 and 289 from PA.3 to PA.4, rewrite the route reason
to match, and record there that PA.4's blueprint must add PA.2 (Theorem 5.5.1, used through Propositions 6.6.7 and
6.6.9) and PA.5 (the base-change checklist, item 271) as prerequisites, as PAPER-QIAN-23 does. In the planned lists of
items 258, 267 and 288, replace PA.3 by PA.4 and keep P9 for the abstract support step. PA.3 stays only on the abstract
comparison items, such as 253. In the report and in the notes of items 181 and 182, replace the claim that PAPER-QIAN-23
routes Theorem 6.1.2 to PA.3 with 'PAPER-QIAN-23 (reviewed) places Theorem 6.1.2 at PA.4, because PA.3 would close a
cycle'.

### /2 — error

**Where.** PAPER-ALLEN-ETAL-23/8 (route 2, assigned to PA.1), /38 (planned PA.1), /110 and /111 (planned at PA.0, with
PA.1 for /110); their PA.0 consumers /76, /79, /80, /107

**Claim.** Objects that the extraction places at PA.1 are used in statements and proofs that it plans at PA.0, and PA.1
requires PA.0, so the plan is cyclic. Theorem 4.2.1 (/107, PA.0) is stated with two such objects: the Kostant
representatives W^P_v̄ (/8, which route 2 sends to PA.1) and the weight dictionary (2.2.2) (/38, planned at PA.1 only).
Its proof rests on Lemma 4.2.2(2) (/110, listed at both PA.1 and PA.0), which uses the same objects together with
Jantzen's linkage results. PA.1's text plans those linkage results. Theorems 2.4.2 and 2.4.4 and the splitting /80 (all
at PA.0) are stated with the lattices 𝒱_λ̃ and the dictionary λ ↦ λ̃ of /38. The note of /80 itself says that its
coefficient input [NT16, Cor. 2.11] 'fits PA.1'.

**Evidence.** The paper (published). p. 968: 'we may also define the subset W^P_τ ⊂ W_τ of representatives for the
quotient W_{P,τ}\W_τ (cf. Section 1.2)'. p. 969, Theorem 4.2.1: '(1) For each v ∈ S̄_1, λ̃_v̄ = λ_v̄ (identification as
in (2.2.2)) … (3) For each v ∈ S̄_2, there exists w_v̄ ∈ W^P_v̄ such that λ_v̄ = w_v̄(ρ_v̄) − ρ_v̄'. p. 970: 'The second
claim follows from Lemmas 4.2.2 and 4.2.3 below'; Lemma 4.2.2(2): 'Given w ∈ W^P_v̄, let λ_w = w(ρ_v̄) − ρ_v̄ … (using
the identification (2.2.2))'. p. 971: '[Jan03, Cor. II.5.6] … V_λw ⊗_O k is a simple … module'. data/atlas.json: PA.1
requires [R07.3, IG.7, PA.0]. PA.1's text: 'Construct integral algebraic coefficient modules over O, reduction modulo p,
Weyl/dual Weyl modules … Prove the linkage and weight bounds actually used for degree shifting. Build the cohomological
connecting morphisms … with … precise shifted degrees.' Route 2 reason: 'PA.1: Kostant representatives, CTG weights …'.
The only result that cites Theorem 4.2.1 is Proposition 4.3.4 (/117, planned at PA.1). On p. 974 the paper says: 'This
results on combining Theorems 4.3.3 and 4.2.1'.

**Fix.** Plan /38 at PotentialAutomorphyInfrastructure:PA.0, together with AutomorphicFormsOnReductiveGroups:AF.4 as for
/37, instead of PA.1. In route 2's reason, assign /8 to PA.0, not PA.1. Record in the note of /80 that its input [NT16,
Cor. 2.11] is planned with /38. Plan Theorem 4.2.1 (/107), Lemma 4.2.2(2) (/110) and Lemma 4.2.3 (/111) at PA.1 instead
of PA.0: outside §4.2 the only result that uses them is Proposition 4.3.4 (/117), which is at PA.1, and PA.1 plans the
linkage results and the shifted degrees. Name ALS.4 and TC.3 as their suppliers in the notes. If the reviewer prefers to
keep /107, /110 and /111 at PA.0, then PA.0 must itself plan the Jantzen linkage inputs of /110, and the route-2 reason
must say so.

### /3 — error

**Where.** PAPER-ALLEN-ETAL-23/30, /31 (planned at PA.2); route 5 (/32, /33 sent to SmoothRepresentationsOfLocalGroups
SR.1); PAPER-ALLEN-ETAL-23/30, PAPER-ALLEN-ETAL-23/31, route 5

**Claim.** The extraction plans Lemmas 2.1.10–2.1.11 at PA.2. These lemmas define, for any reductive group over a
non-archimedean local field, the monoids Δ_M and Δ of U-positive elements and the homomorphisms r_P, r_M and 𝒮 on their
Hecke algebras. Route 5 sends Lemmas 2.1.12–2.1.13, which are stated in terms of them, to SR.1. SR.1 lies upstream of
PA.2 (PA.2 → IG.7 → IG.5 → ET.6 → SR.2 → SR.1), so SR.1 would need PA.2, which is a cycle. PA.2's text plans the
positive-monoid operators of its own p-adic tower, not this general local formalism, as the note of /30 flags. The
formalism is also used at the prime-to-p places of §2.2.5, in Theorem 2.4.8 and in §3. Route 5's own reason places
monoid Hecke algebras at SR.1. Also: Items 30 and 31 (the Hecke algebras ℋ(Δ,U), ℋ(Δ_M,U_M), ℋ(Δ_P,U_P) of the positive
monoids attached to an Iwahori decomposition, Lemma 2.1.10, and the homomorphisms r_P, r_M, 𝒮 on them, Lemma 2.1.11) are
marked planned at PotentialAutomorphyInfrastructure:PA.2 only. Every other consumer of them sits at a stage that PA.2
itself requires. Items 32–33 (Lemmas 2.1.12–2.1.13, stated on ℋ(Δ_M,U_M) → ℋ(Δ,U) and on 𝒮) are routed by route 5 to
SmoothRepresentationsOfLocalGroups:SR.1. Items 34–35 (Lemma 2.1.14, the ℋ(Δ,U)-equivariant evaluation map, and the
global split morphisms with monoid Hecke actions) are planned at PA.0 and ALS.4. Route 1's items 47, 50, 51 and 56 apply
Lemma 2.1.13, and route 1's brief imports SR.1 for that lemma but does not import PA.2. In the atlas, PA.2 requires PA.0
(which requires ALS.4) and, transitively, SR.1, so SR.1, PA.0 and ALS.4 cannot import PA.2. This is a dependency cycle.
PA.2 is the §5 ordinary tower, but the general local lemmas are used at places v ∤ p in §2.2.5 and in Theorem 2.4.8.

**Evidence.** The paper (published). p. 913: 'Let F be a non-archimedean local field, and let G be a reductive group
over F … We define ∆ = U_N ∆_M U_N̄. Lemma 2.1.10 …'. p. 914: 'Lemma 2.1.12. Consider the map t : H(∆_M, U_M) → H(∆, U)
… Thus we have constructed injective algebra homomorphisms t : H(∆_M, U_M) → H(∆, U), S : H(∆, U) → H(∆_M, U_M)'. p. 947
(proof of Theorem 2.4.8): 'See, in particular, Lemma 2.1.13, which applies at the ramified places we consider here'.
Route 5 reason: 'SR.1 owns Hecke algebras over rings. Lemmas 2.1.12–2.1.13 are Bushnell–Kutzko's G-cover formalism
([BK98, §§6–7]) for monoid Hecke algebras over arbitrary rings'. Note of /30: 'the general Iwahori-decomposition lemma
is not stated separately (flag)'. data/atlas.json requires chain: PA.2 → IgusaVarietiesAndTorsionConcentration:IG.7 →
IG.5 → EndoscopicTransferAndUnitaryTraceComparison:ET.6 → SmoothRepresentationsOfLocalGroups:SR.2 → SR.1. Also: Paper
(published, p. 913): 'we write Δ_M ⊂ M(F) for the set of U-positive elements ... We define Δ = U_NΔ_MU_N̄. Lemma 2.1.10.
...'. p. 914: 'Lemma 2.1.12. Consider the map t : H(Δ_M, U_M) → H(Δ, U) ... Thus we have constructed injective algebra
homomorphisms t : H(Δ_M, U_M) → H(Δ, U), S : H(Δ, U) → H(Δ_M, U_M)'. p. 915: 'Lemma 2.1.14. ... a natural morphism φ :
V^U → r_P^* W^{U_P} of H(Δ, U) ⊗_Z R-modules'. p. 925: 'Lemma 2.1.13 thus implies that there is an injective O-algebra
homomorphism t'. Atlas requirement chain: PA.2 → IG.7 → IG.5 → ET.6 → SR.2 → SR.1, and PA.2 → PA.0 → ALS.4. SR.1
requires only SR.0:abelian-category. PA.2's text: 'construct the parabolic level tower, its commuting positive-monoid
operators and the ordinary summand ... Track positive monoids'.

**Fix.** Mark /30 and /31 missing and add them to route 5, so that SR.1 receives the whole local formalism of §2.1.9
(Lemmas 2.1.10–2.1.13). Extend route 5's reason accordingly. In their notes, say that PA.2 (for the Iwahori tower at p)
and the route-1 Part II (at the places of R) import the formalism from SR.1. Also: Mark items 30 and 31 missing and add
them to route 5 (source of SmoothRepresentationsOfLocalGroups:SR.1) alongside items 32 and 33. Extend route 5's reason
to say that SR.1 owns the subalgebra ℋ(Δ,U) of functions supported on an open U-stable submonoid, together with the
restriction and integration maps r_P, r_M, 𝒮 for an Iwahori decomposition. Remove PA.2 from the planned lists of items
30 and 31; PA.2 becomes a consumer. In the notes of items 34 and 35, name SR.1 (Lemmas 2.1.10–2.1.13) as an import.

### /4 — error

**Where.** PAPER-ALLEN-ETAL-23/81, /82, /88 (planned at PA.0); route 1 brief; PAPER-ALLEN-ETAL-23/81,
PAPER-ALLEN-ETAL-23/82, PAPER-ALLEN-ETAL-23/88; route 1; route 1 brief; PAPER-ALLEN-ETAL-23/81, PAPER-ALLEN-ETAL-23/82,
route 1 brief

**Claim.** Three items are planned at PA.0: Theorem 2.4.8 (/81), the Hecke algebras T̃^T_R and T^T_R with ramified
operators at R together with the extended Satake map (/82), and the §3 set-up with T^T_R(K, λ) (/88). They are built
from the pro-ℓ-Iwahori operators t_{v,i}(σ) and e_{v,i}(σ) and from Propositions 2.2.18–2.2.19, which route 1 sends to
layer (1) of the new IntegralHeckeAndGaloisDeterminants Part II. Yet the route-1 brief says that this Part II imports
PA.0 'for the boundary summand of Theorems 2.4.2 and 2.4.8'. PA.0 would thus depend on the Part II, and the Part II on
PA.0. Theorem 2.4.8 is used only inside route 1's §3 argument (pp. 954, 958, 962). Also: Three items are marked planned
at PotentialAutomorphyInfrastructure:PA.0: Theorem 2.4.8 (item 81, also at ALS.4), the Hecke algebras T̃^T_R and T^T_R
with the extended Satake map 𝒮 (item 82), and the §3.1 setting with T^T_R(K,λ) (item 88, also at IHG.2). Their
statements are built from objects that the extraction itself marks missing and routes to route 1: - the ramified
operators t_{v,i}(σ) and e_{v,i}(σ) (items 47 and 51); - the levels 𝔮̃_v and Ĩ_v̄ (items 49 and 56); - the invertible
strongly positive elements of Lemma 2.2.10 and (2.2.17) (items 50 and 56), which the proof of Theorem 2.4.8 also uses.
No text of PA.0, ALS.4 or IHG.2 mentions ramified or pro-ℓ-Iwahori operators. Route 1's brief, in turn, imports Theorem
2.4.8 from PA.0. So the Part II needs PA.0, and PA.0 would need the Part II's first layer: the two depend on each other.
The three items are not planned by any existing layer, and route 1 owns them. Also: Item 81 (Theorem 2.4.8) is planned
at PA.0 and ALS.4, and item 82 (the algebras T̃^T_R and T^T_R and the extended 𝒮) at PA.0. Both are built from the
ramified operators t_{v,i}(σ) (v ∈ R) and e_{v,i}(σ) (v ∈ R^c − R) of (2.2.11) and (2.2.17). Their 𝒮 is extended at R
through Lemma 2.1.13, Lemma 2.2.10 and the invertible strongly positive element of (2.2.17). The extraction marks
exactly these (items 47, 50, 51, 56) missing and routes them to route 1's Part II, layer (1). Yet route 1's brief
imports 'PotentialAutomorphyInfrastructure PA.0 (the boundary summand of Theorems 2.4.2 and 2.4.8)'. So PA.0 would need
the Part II's layer (1), while the Part II imports PA.0: a cycle. PA.0's text plans no ramified Hecke operators. Theorem
2.4.8 is used only in §3 (pp. 954, 958, 962), the Part II's own layer (2). Item 97 (§3: duality for T̃^T_R, planned at
ALS.5:finite-level-duality and AG2.2) has the same defect.

**Evidence.** The paper (published). p. 947, Theorem 2.4.8: 'Let T̃^T_R … denote the (commutative) O-subalgebra
generated by T̃^S and all the elements t_{v,i}(σ) (v ∈ R, σ ∈ W_{F_v}) and e_{v,i}(σ) (v ∈ R^c − R, σ ∈ W_{F_v})'. p.
962, proof of Proposition 3.1.2: 'By Theorem 2.4.8, the map S descends …'. The statement of /82: 'its values on P̃_v,
P̃_{v,σ}, P_{v,σ}, P_{v^c,σ^{−c}} are given by Propositions 2.2.16, 2.2.18, 2.2.19'. Route-1 brief, layer (1): 'the
pro-ℓ-Iwahori operators t_{v,i}(α), e_{v,i}(α) … Propositions 2.2.18–2.2.19'. Route-1 brief, imports: 'Import, never
re-plan: … PotentialAutomorphyInfrastructure PA.0 (the boundary summand of Theorems 2.4.2 and 2.4.8)'. Also: The paper
(published, pp. 946–947), Theorem 2.4.8: 'Let T̃^T_R ⊂ H(G̃(A^∞_{F+}), K̃) ⊗_Z O denote the (commutative) O-subalgebra
generated by T̃^S and all the elements t_{v,i}(σ) (v ∈ R, σ ∈ W_{F_v}) and e_{v,i}(σ) (v ∈ R^c − R, σ ∈ W_{F_v}) ...
Then there is a map 𝒮 : T̃^T_R → T^T_R, which descends ...'. Its proof: 'See, in particular, Lemma 2.1.13, which applies
at the ramified places we consider here; cf. the discussion at the end of Section 2.2.5'. P. 948: 'we can take z to be a
product (over places of R_0) of strongly positive Hecke operators'. Atlas stage PA.0: 'Compare algebraic coefficient
local systems, finite-level cellular complexes and the integral Hecke actions used by each source. Prove derived
coefficient change, level change and boundary localization compatibilities. Construct the summand/filtration maps
entering the unitary boundary argument'. Route 1 brief: 'Import, never re-plan: ... PotentialAutomorphyInfrastructure
PA.0 (the boundary summand of Theorems 2.4.2 and 2.4.8)'. Also: Paper (published, pp. 946–947), Theorem 2.4.8: 'Let
T̃^T_R ⊂ H(G̃(A^∞_{F+}), K̃) ⊗_Z O denote the (commutative) O-subalgebra generated by T̃^S and all the elements
t_{v,i}(σ) (v ∈ R, σ ∈ W_{F_v}) and e_{v,i}(σ) (v ∈ R^c − R, σ ∈ W_{F_v})'. p. 947, its proof: 'The map S is the one
described in Section 2.1.2 (at unramified places) and Section 2.1.9. (See, in particular, Lemma 2.1.13, which applies at
the ramified places we consider here; cf. the discussion at the end of Section 2.2.5.)' Atlas PA.0: 'Compare algebraic
coefficient local systems, finite-level cellular complexes and the integral Hecke actions used by each source. Prove
derived coefficient change, level change and boundary localization compatibilities. Construct the summand/filtration
maps entering the unitary boundary argument ...' (no ramified operators). Route 1 brief: 'Import, never re-plan: ...
PotentialAutomorphyInfrastructure PA.0 (the boundary summand of Theorems 2.4.2 and 2.4.8)'.

**Fix.** Mark /81, /82 and /88 missing and add them to route 1. In the brief, add Theorem 2.4.8 and the algebras T^T_R
and T̃^T_R to layer (2), which comes after layer (1) where their generators are defined. Change the import to
'PotentialAutomorphyInfrastructure PA.0 (Theorem 2.4.2 and the split morphisms of §2.1.9 and of the proof of Theorem
2.4.4)'. Also: Set items 81, 82 and 88 to missing and add them to route 1. Keep PA.0, ALS.4, IHG.2 and
SmoothRepresentationsOfLocalGroups SR.1 (Lemma 2.1.13) in their notes as imports. In route 1's brief, list the algebras
T̃^T_R and T^T_R, the extended 𝒮 and Theorem 2.4.8 after the §2.2.5 operators, and put the §3.1 setting in the ℓ ≠ p
layer. Change the PA.0 import to 'PotentialAutomorphyInfrastructure PA.0 (the boundary summand of Theorem 2.4.2)'.
Update the route's item count and the report's counts. Also: Mark items 81 and 82 missing and add them to route 1, as a
step between its layers (1) and (2). In route 1's brief, replace 'PA.0 (the boundary summand of Theorems 2.4.2 and
2.4.8)' by 'PA.0 (Theorem 2.4.2 and the split morphisms α, β, γ, δ between the Siegel stratum and X_K, §2.1.9)'. List
Theorem 2.4.8, with T̃^T_R, T^T_R and the extended 𝒮, among the Part II's own layers. Treat item 97 the same way.

### /5 — duplicate

**Where.** route 7 (items PAPER-ALLEN-ETAL-23/300, /303, /304) and route 7 reason; route 7; PAPER-ALLEN-ETAL-23/300,
PAPER-ALLEN-ETAL-23/303, PAPER-ALLEN-ETAL-23/304; the report (PAPER-ALLEN-ETAL-23.md), route 7

**Claim.** Three items in route 7 are statements about decomposed genericity: Lemma 7.1.5 (/300), Lemma 7.1.6(3)–(5)
(/303) and Lemma 7.1.7 (/304). The extraction plans decomposed genericity itself at
AutomorphicGaloisRepresentationsPartII AG2.7 (/113). Route 7 sends these lemmas to ArithmeticGaloisRepresentations R01.4
and G7, which lie upstream of AG2.7 (AG2.7 → AG2.5 → ET.6 → AG2.1a → AG2.0 → G7 → R01.4), so stating them there is a
cycle. Route 7's reason says that it routes them 'as PAPER-QIAN-23 routed them'. In fact the accepted QIAN-23 routes
ACC+ Lemma 7.1.6(3) (QIAN/121) and Lemma 7.1.7 (QIAN/089) to PotentialAutomorphyInfrastructure PA.5, for exactly this
reason. The same lemmas now have two owners. Also: Route 7 sends three lemmas to ArithmeticGaloisRepresentations
R01.4/G7: Lemma 7.1.5 (a criterion for decomposed genericity), Lemma 7.1.6(3)–(5) (decomposed genericity of Sym^m r̄)
and Lemma 7.1.7 (decomposed genericity survives disjoint base change). Decomposed genericity is defined at
AutomorphicGaloisRepresentationsPartII:AG2.7: this extraction plans Definition 4.3.1 there (items 112–113), and the
accepted AG2 decomposition states it there. AG2.7 transitively requires G7 and R01.4. Stating these lemmas at G7/R01.4
would therefore make G7 depend on AG2.7, which is a cycle. The accepted PAPER-QIAN-23 owns two of the same ACC+ lemmas
at PotentialAutomorphyInfrastructure:PA.5 for exactly this reason: its item 121 is ACC+ Lemma 7.1.6(3) and its item 089
is ACC+ Lemma 7.1.7. The lemmas therefore have two owners. The report's 'Lemmas 7.1.4–7.1.7 and 7.1.8(2), as
PAPER-QIAN-23 routed them' is false of the accepted PAPER-QIAN-23 for Lemmas 7.1.6(3) and 7.1.7, which it routes to
PA.5. Only its enormous-image item, ACC+ Lemma 7.1.6(2), is at G7.

**Evidence.** PAPER-QIAN-23 route 2 reason: 'The decomposed-genericity lemmas (items 027, 089 and 121) are not here:
decomposed genericity is defined at AutomorphicGaloisRepresentationsPartII AG2.7, which requires G7, so G7 cannot state
them. They go to PotentialAutomorphyInfrastructure PA.5, which must add AG2.7 as a prerequisite.' PAPER-QIAN-23 route 6
has stages [PA.5] and items 027, 089 ('ACC+ … Lemma 7.1.7'), 121 ('ACC+ Lemma 7.1.6(3)') and 122, with verdict accept.
ACC+ route 7 reason: 'the lemmas producing enormous image, scalar elements and decomposed genericity for symmetric
powers (Lemmas 7.1.4–7.1.7) are its verification lemmas, as PAPER-QIAN-23 routed them'. data/atlas.json requires chain:
AutomorphicGaloisRepresentationsPartII:AG2.7 → AG2.5 → EndoscopicTransferAndUnitaryTraceComparison:ET.6 → AG2.1a → AG2.0
→ ArithmeticGaloisRepresentations:G7, and G7 requires R01.1 and R01.4. Also: Atlas requirements: AG2.7 requires AG2.5,
AG2.5 requires ET.6, ET.6 requires AG2.1a, AG2.1a requires AG2.0, AG2.0 requires ArithmeticGaloisRepresentations:G7, and
G7 requires R01.1 and R01.4. Accepted decomposition node
AutomorphicGaloisRepresentationsPartII:AG2.7/the-residual-ratio-condition-for-taylor-wiles-primes: 'Definition 4.3.1 ...
(3) r is DECOMPOSED GENERIC if some prime l different from p is decomposed generic for r.' PAPER-QIAN-23, route 2
reason: 'The decomposed-genericity lemmas (items 027, 089 and 121) are not here: decomposed genericity is defined at
AutomorphicGaloisRepresentationsPartII AG2.7, which requires G7, so G7 cannot state them. They go to
PotentialAutomorphyInfrastructure PA.5'. Its route 6 (PA.5) holds items 027, 089, 121 and 122, and its review accepts
both routes. The paper (published, p. 1090), Lemma 7.1.5: '... If M does not contain a primitive lth root of unity, then
r is decomposed generic.' The paper (published, p. 1091), Lemma 7.1.7: 'Then r|G_{FE} is decomposed generic and
absolutely irreducible.'

**Fix.** Move /300, /303 and /304 from route 7 to route 2, and assign them to PA.5 in route 2's reason. Record there
that PA.5 must require AG2.7, as PAPER-QIAN-23 route 6 states. In route 7's reason, keep Lemmas 7.1.4, 7.1.6(1)–(2) and
7.1.8(2) and totally odd characters. Replace 'Lemmas 7.1.4–7.1.7 … as PAPER-QIAN-23 routed them' with the lemmas that
remain, and cite PAPER-QIAN-23 route 2 only for Lemma 7.1.6(2). Also: Remove items 300, 303 and 304 from route 7. Route
them to the owner that PAPER-QIAN-23 uses: a source of PotentialAutomorphyInfrastructure PA.5, with a note that PA.5
must add AG2.7 as a prerequisite. Alternatively, if the maintainer prefers AG2.7 itself, add them to route 6 (AG2.7) and
change PAPER-QIAN-23 to match. Either way the two papers must agree. Keep items 299, 301, 302 and 306 in route 7.
Correct route 7's reason and the report's route-7 sentence.

### /6 — error

**Where.** PAPER-ALLEN-ETAL-23/268, PAPER-ALLEN-ETAL-23/269, PAPER-ALLEN-ETAL-23/18, PAPER-ALLEN-ETAL-23/12; route 2
(items 270 and 289); route 10; PAPER-ALLEN-ETAL-23/268, /269 (planned at ML.5, and ML.2 for /269); their consumers /270
and /289 in route 2; PAPER-ALLEN-ETAL-23/268, PAPER-ALLEN-ETAL-23/269 (and PAPER-ALLEN-ETAL-23/18)

**Claim.** The extraction's owners form a dependency cycle through soluble base change. Proposition 6.5.13 (items 268
and 269) is planned at ModularityAndLanglandsExtensions:ML.5, and item 269 also at ML.2. Items 18 and 12 (global and
local base change) also name ML.5. But Proposition 6.5.13 is an input of the automorphy lifting theorems themselves. The
proofs of Theorems 6.1.1 and 6.1.2 (items 270 and 289, which route 2 sends to PotentialAutomorphyInfrastructure:PA.3)
apply it to descend from the soluble CM extension E to F. In the atlas, ML.5 requires ML.3, and ML.3 requires ML.2. ML.2
owns Theorem 7.1.11 and Corollary 7.1.12 (items 315 and 316), whose proofs apply Theorem 6.1.1 at l_1 and l_2. So the
chain is: PA.3 needs ML.5, ML.5 needs ML.3, ML.3 needs ML.2, and ML.2 needs PA.3. The PA roadmap text forbids this
direction. Item 269 is also double-listed across ML.5 and ML.2. ML.5 only 'registers' cyclic base change, and the note
of item 268 itself concedes that the soluble iteration and the Galois-side compatibility are not planned there. Also:
Proposition 6.5.13, soluble base change and descent for GL_n, is planned at ModularityAndLanglandsExtensions ML.5 (and
ML.2 for /269). The proofs of Theorems 6.1.1 and 6.1.2 (/270, /289), which route 2 sends to PA, use it. But ML.5 lies
downstream of ML.2 (ML.5 → ML.3 → ML.2), and ML.2 is the declared consumer of PA's potential-automorphy output. Once
ML.2 imports the lifting endpoint, as the confirmed RT-AREA-langlands-1/7 fix prescribes, sourcing Proposition 6.5.13
from ML.5 or ML.2 closes a cycle. EndoscopicTransferAndUnitaryTraceComparison ET.7a plans the Arthur–Clozel cyclic
base-change steps and already reaches PA.0. Also: Proposition 6.5.13 (soluble base change and descent) is planned at
ModularityAndLanglandsExtensions ML.5, and item 269 is also planned at ML.2. Proposition 6.5.13 is an input to the
proofs of Theorems 6.1.1 and 6.1.2 (items 270 and 289). Theorem 6.1.1 is in turn applied in the proof of Theorem 7.1.11
(item 315, planned at ML.2 and ML.3). In the atlas, ML.5 requires ML.3 and ML.3 requires ML.2. So the base change is
planned at a stage that comes after the stages that use it through the lifting theorem, giving the cycle ML.2 → Theorem
6.1.1 → Proposition 6.5.13 at ML.5 → ML.3 → ML.2. Planning item 269 at ML.2 has the same defect, because ML.2 is itself
a consumer of Theorem 6.1.1.

**Evidence.** The paper (published, p. 1074), proof of Theorem 6.1.1: 'We can therefore apply Corollary 6.5.5 to ρ|G_E
and Proposition 6.5.13 to conclude that ρ is associated to a cuspidal, regular algebraic automorphic representation Π of
GL_n(A_F) of weight λ.' The paper (published, p. 1084), proof of Theorem 6.1.2: 'By Proposition 6.5.13 and [Ger19, Lem.
5.7], we can descend Π_E to obtain a cuspidal, regular algebraic automorphic representation Π of GL_n(A_F)'. Atlas stage
ModularityAndLanglandsExtensions:ML.5 requires ML.3 and ML.4, and its text says: 'Register cyclic base change,
automorphic induction and selected tensor/symmetric-power transfers with exact hypotheses'. ML.3 requires AN.4, ML.2 and
PA.5. PotentialAutomorphyInfrastructure roadmap text: 'The final potential-automorphy assembly has downstream owner
ModularityAndLanglandsExtensions ML.2 ... Those source-qualified endpoints require their own complete proof
decomposition and do not become prerequisites of the infrastructure below', and 'these downstream owners are not
prerequisites of PA.0–PA.5'. Atlas stage EndoscopicTransferAndUnitaryTraceComparison:ET.7a: 'Develop the required GL_m
residual-spectrum/Speh classification and cyclic automorphic- induction/base-change steps from the Arthur–Clozel and
Moeglin–Waldspurger proofs, with central characters and cuspidality hypotheses. Export these identities to
AutomorphicGaloisRepresentationsPartII'. PA.3 already depends on ET.7a and AG2.7, through PA.0 → AG2.7 → AG2.4 → AG2.3 →
AG2.2 → ET.7a. Also: data/atlas.json: ML.5 requires [ML.3, ML.4]; ML.3 requires [AN.4, ML.2, PA.5]. ET.7a's text:
'Develop the required GL_m residual-spectrum/Speh classification and cyclic automorphic-induction/base-change steps from
the Arthur–Clozel and Moeglin–Waldspurger proofs'. Requires chain: PA.0 → AG2.7 → AG2.4 → AG2.3 → AG2.2 → ET.7a. The
paper (published, p. 1084): 'By Proposition 6.5.13 and [Ger19, Lem. 5.7], we can descend Π_E'. RT-AREA-langlands-2/40
(verdict confirmed): 'EndoscopicTransferAndUnitaryTraceComparison ET.7a plans the GL_m Arthur–Clozel base-change steps'.
RT-AREA-langlands-1 fixes, §/7 item 4: 'ET.7a, which develops the Arthur–Clozel base-change steps, already reaches PA.0,
and so PA.6'. Also: The paper (published, p. 1074): 'We can therefore apply Corollary 6.5.5 to ρ|_{G_E} and Proposition
6.5.13 to conclude that ρ is associated to a cuspidal, regular algebraic automorphic representation Π of GL_n(A_F) of
weight λ'. The paper (published, p. 1084): 'By Proposition 6.5.13 and [Ger19, Lem. 5.7], we can descend Π_E'. The paper
(published, p. 1106), proof of Theorem 7.1.11: 'Applying Theorem 6.1.1 (the conditions on the residual representations
are satisfied by parts (1), (2) and (4) of Lemmas 7.1.6 and 7.1.8)'. Atlas: ModularityAndLanglandsExtensions:ML.5
requires ['ModularityAndLanglandsExtensions:ML.3', 'ModularityAndLanglandsExtensions:ML.4'], and ML.3 requires ML.2.
Atlas stage EndoscopicTransferAndUnitaryTraceComparison:ET.7a says: 'Develop the required GL_m residual-spectrum/Speh
classification and cyclic automorphic-induction/base-change steps from the Arthur–Clozel and Moeglin–Waldspurger proofs,
with central characters and cuspidality hypotheses'. AutomorphicGaloisRepresentationsPartII:AG2.2 says: 'Prove
compatibility of dual, conjugate, tensor-by-character and solvable restriction operations'. Both ET.7a and AG2.2 are in
the transitive prerequisites of PA.3, and neither requires an ML stage.

**Fix.** Re-plan Proposition 6.5.13 upstream of PA.3. Mark items 268 and 269 missing and remove
ModularityAndLanglandsExtensions:ML.5 and ML.2 from their planned lists. Route them as a source of
AutomorphicGaloisRepresentationsPartII, either by adding them to route 6 with stage AG2.7 or by creating a new source
route. In their notes, name EndoscopicTransferAndUnitaryTraceComparison:ET.7a as the supplier of Arthur–Clozel cyclic
base change, and AG2.4–AG2.5 as the supplier of r_ι(π) and of the local identity. Identify the soluble iteration and the
Chebotarev comparison as the new content. Remove ML.5 from items 12 and 18: keep ET.6 for local base change and
AG2.2/ET.7a for global base change. Correct the reasons of route 2 and route 10 to match. Add a note for the maintainer
that two other accepted extractions cite the same owner and should follow: PAPER-CARAIANI-NEWTON-23 route 1's brief
('ModularityAndLanglandsExtensions ML.5 for solvable base change and descent ([ACC+18, Prop. 6.5.13])') and
PAPER-BOXER-CALEGARI-GEE-ETAL-25/107. Also: Plan /268 and /269 at EndoscopicTransferAndUnitaryTraceComparison:ET.7a, not
at ML.5 or ML.2. If the reviewer judges that ET.7a's text does not cover the soluble iteration and the Galois-side
compatibility, mark both items missing and route them as a source of ET.7a. In the notes of /270 and /289, name ET.7a,
not ML.5, as the supplier of base change. Also: Plan items 268 and 269 at
EndoscopicTransferAndUnitaryTraceComparison:ET.7a for the Arthur–Clozel cyclic base change and descent ([AC89, Ch. 3,
Thms 4.2, 5.1]). Add AutomorphicGaloisRepresentationsPartII:AG2.2 for the Galois side: r_ι(π_E) ≅ r_ι(π)|_{G_E} by
Chebotarev, and the twist that recovers ρ. The local identity at every place (E90) comes from the local Langlands owner
ET.6, which item 11 already uses for rec. Remove ML.5 and ML.2 from the planned lists of items 268 and 269 (ML.5 may
re-export the result) and rewrite their notes. Item 18 (global soluble base change, §1.2) should likewise drop ML.5 and
be planned at ET.7a and AG2.2.

### /7 — error

**Where.** PAPER-ALLEN-ETAL-23/69, PAPER-ALLEN-ETAL-23/72, PAPER-ALLEN-ETAL-23/73, PAPER-ALLEN-ETAL-23/74; route 1
brief; the report (PAPER-ALLEN-ETAL-23.md), 'What the atlas already has', paragraph 'Routing calls I made';
PAPER-ALLEN-ETAL-23/69, /72

**Claim.** Four results are marked planned, but no stage plans any of them. They are Theorems 2.3.5 and 2.3.7 (Scholze's
torsion Galois representations, from [Sch15, Cor. 5.4.3] and [Sch15, Cor. 5.4.4]) and Theorem 2.3.8 with Proposition
2.3.9 (the 2n-dimensional analogue for T̃^S(K̃,λ̃), from [NT16, Th. 5.7]). Their planned lists name TC.2, TC.3, TC.4,
IHG.1, IHG.2, IHG.4 and IHG.5, and item 69's also names R01.5. None of these stages plans the existence theorem: -
TorsionCohomologyInfrastructure's summary excludes the final theorem, and TC.4 excludes terminal claims; - TC.2 is the
comparison diagram, and TC.3 is the symplectic/unitary factor extraction; - IHG.5 is a schema that takes the geometric
comparison as input. The report leaves the question open for the reviewer, and the review did not settle it. The
confirmed high finding RT-AREA-langlands-1/9 settles it: the endpoint is missing. Its fix proposes a new stage
TorsionCohomologyInfrastructure:TC.5 for GL_n, consumed by PA.0 for ACC+ Theorems 2.3.5 and 2.3.7. That stage is not yet
in the atlas, which has only TC.0–TC.4. Even with it, the unitary-group results 2.3.8 and 2.3.9 have no owner, and
[NT16, Th. 5.7] is not an item. These theorems are the only source of the ρ̄_𝔪 and ρ_𝔪 used in §§3–6, so an input of the
main proof chain has no owner. Route 1's brief imports 'TorsionCohomologyInfrastructure TC.3–TC.4 (... Scholze's
determinants, Theorems 2.3.5 and 2.3.7 of ACC+)', which is false of those stages. Also: Theorems 2.3.5 and 2.3.7 are
Scholze's torsion Galois representations for GL_n over a CM field. The extraction marks them planned at TC.2, TC.3,
TC.4, IHG.1, IHG.5 and R01.5. But the confirmed finding RT-AREA-langlands-1/9 (high) established that no layer of the
atlas owns Scholze's theorem. The report itself left the status for the reviewer to settle, and the review does not
settle it. The PA consumers of the theorem are PA.1 (Theorem 4.5.1 and Proposition 4.4.6) and PA.4 (Propositions 6.5.3,
6.5.11, 6.6.7 and 6.6.9).

**Evidence.** Atlas roadmap TorsionCohomologyInfrastructure summary: 'The target is a reusable library underlying its
argument, not an additional requirement to formalize its final Galois-representation theorem.' Atlas stage TC.4: 'No new
terminal claim about all Galois representations of all groups is part of this layer.' Atlas stage IHG.5: 'Provide
theorem schemas which take an actual geometric Hecke comparison with a quantified nilpotent error ideal and produce the
determinant ... The geometric comparison itself is built by TorsionCohomologyInfrastructure'. Verdict on
RT-AREA-langlands-1/9: 'Confirmed the missing instantiated endpoint. TC.4 expressly stops at reusable comparison
infrastructure, IHG.5 is an input-parametrized schema'. Its fixes report proposes TC.5, with consumer 'PA.0, where ACC+
Theorems 2.3.5 and 2.3.7 are this theorem's Corollaries 5.4.3 and 5.4.4'. The paper (published, p. 938): 'From [Sch15,
Cor. 5.4.3], we deduce …'. P. 939: 'Proof. This follows from [Sch15, Cor. 5.4.4].' P. 939, Theorem 2.3.8: the
determinant 'is implicit in [Sch15] and also follows from [NT16, Th. 5.7]'. Also: TC.4's text: 'No new terminal claim
about all Galois representations of all groups is part of this layer.' RT-AREA-langlands-1/9 (verdict confirmed):
'Scholze's main theorem is owned by no layer … TC disclaims it, IHG.5 is only a schema'. Its fix: 'Add
TorsionCohomologyInfrastructure:TC.5 … Add TC.5 → IG.6 and TC.5 → PotentialAutomorphyInfrastructure:PA.0'. The
second-round fixes hand this to BP-TorsionCohomologyInfrastructure. The report (PAPER-ALLEN-ETAL-23.md):
'PAPER-IYENGAR-KHARE-MANNING-24 and PAPER-CALEGARI-GERAGHTY-18 treated similar statements as missing, so the reviewer
should settle which is right.' The paper (published, p. 1063): 'the existence of a Galois representation ρ_m … is
contained in Theorem 2.3.7'.

**Fix.** Set items 69, 72, 73 and 74 to missing and remove their planned lists. In their notes, name IHG.1, IHG.2,
IHG.4, IHG.5 and R01.5 as inputs to the descent steps. Route the four items in a new source route of
TorsionCohomologyInfrastructure with stage TC.4. Its reason should say: - the owner is the TC.5 stage of the confirmed
fix to RT-AREA-langlands-1/9; - TC.5 must also cover the unitary group G̃, for Theorem 2.3.8 and Proposition 2.3.9. Once
TC.5 is in the atlas, set the four items to planned there. Add an item for [NT16, Th. 5.7], status missing, in the same
route. In route 1's brief, replace the TC import with 'TorsionCohomologyInfrastructure TC.3 (the unramified Levi Satake
identities) and the torsion Galois representations of ACC+ Theorems 2.3.5 and 2.3.7 (TC.5, proposed by
RT-AREA-langlands-1/9)'. Replace the report's 'Routing calls I made' paragraph with the settled status, and update the
counts. Also: Mark /69 and /72 missing and route them as a source of TorsionCohomologyInfrastructure. In the reason,
name the terminal stage that the RT-AREA-langlands-1/9 fix assigns to BP-TorsionCohomologyInfrastructure. In the notes
of /106, /257, /265, /283 and /286, say that PA imports the theorem from there.

### /8 — error

**Where.** PAPER-ALLEN-ETAL-23/1; PAPER-ALLEN-ETAL-23/1

**Claim.** Item 1 states, for every elliptic curve E over a CM field F, that 'for every m ≥ 0 there is a finite
extension F′/F over which Symm^m of the compatible system H¹(E) becomes automorphic', and that 'consequently the
Sato–Tate conjecture holds for E'. With 'automorphic' in the paper's own §7.1 sense (attached to a regular algebraic
cuspidal π of GL_{m+1}), this is false when E has CM by an imaginary quadratic field K: over any F′ the system Symm^m
H¹(E)|G_{F′} is reducible for m ≥ 2 (Symm² Ind_{G_{F′K}}^{G_{F′}} ψ is the sum of Ind ψ² and a character), and also for
m = 1 when K ⊂ F′, so no cuspidal π of GL_{m+1} matches it (strong multiplicity one). The paper proves Theorem 1.0.1
only for E without CM: Corollary 7.1.12 needs a strongly irreducible system, Corollary 7.1.14 assumes E non-CM, and when
K ⊂ F the system H¹(E) is reducible, so Corollary 7.1.13 does not apply at all. The CM case of Theorem 1.0.1 is true
only in the classical isobaric sense (Deuring, Hecke), with the CM form of the Sato–Tate distribution, and the paper
does not prove it. The item's own note says the Sato–Tate half 'needs E non-CM', contradicting its statement. The
paper's claim that Theorem 1.0.1 (stated for every E) is 'a special case of Corollaries 7.1.13 and 7.1.14' is a gap that
sourceIssues does not record. Also: Item 1's statement asserts 'Consequently the Sato–Tate conjecture holds for E' for
every elliptic curve E over F. The paper proves it (Corollary 7.1.14) only for non-CM E. For E with CM, Frobenius traces
are not equidistributed with respect to (2/π)√(1−t²)dt. The note says the Sato–Tate half needs E non-CM, but the
statement does not. The note's parenthesis '(Corollary 7.1.14; The analytic input ...' is also unbalanced. The printed
Theorem 1.0.1 omits the non-CM hypothesis, and this is not recorded in sourceIssues.

**Evidence.** The paper (published, p. 899): 'The first theorem is a special case of Corollaries 7.1.13 and 7.1.14:
Theorem 1.0.1. Let E be an elliptic curve over a CM number field F. Then E and all the symmetric powers of E are
potentially modular. Consequently, the Sato–Tate conjecture holds for E.' p. 1097, Corollary 7.1.14: 'Suppose that F is
a CM field and that E/F is a non-CM elliptic curve.' p. 1095, Corollary 7.1.12: 'R … is a strongly irreducible rank 2
very weakly compatible system'. pp. 1092–1093: 'R is defined to be automorphic if there are a regular algebraic,
cuspidal automorphic representation π of GL_n(A_F) and an embedding ı : M ↪ C, such that if v ∉ S, then π_v is
unramified and rec(π_v|det|_v^{(1−n)/2})(Frob_v) has characteristic polynomial ı(Q_v(X))'. Also: Paper (published, p.
899): 'Theorem 1.0.1. Let E be an elliptic curve over a CM number field F. Then E and all the symmetric powers of E are
potentially modular. Consequently, the Sato–Tate conjecture holds for E.' p. 1095: 'Corollary 7.1.14 (Sato–Tate for
Elliptic curves over CM fields). Suppose that F is a CM field and that E/F is a non-CM elliptic curve. Then the numbers
... are equidistributed in [−1, 1] with respect to the measure (2/π)√(1 − t²) dt.'

**Fix.** Restate item 1 in two cases. (a) If E has no CM: for every m ≥ 0 there is a finite Galois CM extension F′/F
such that Symm^m H¹(E)|G_{F′} is automorphic (Corollary 7.1.12 applied to the strongly irreducible system H¹(E) with H_τ
= {0,1}), and the Sato–Tate conjecture holds for E (Corollary 7.1.14). (b) If E has CM by K: H¹(E) is induced from (or,
when K ⊂ F, a sum of) algebraic Hecke characters, so E and its symmetric powers are automorphic only as isobaric sums of
automorphic inductions of Hecke characters, and the CM form of Sato–Tate holds; both are classical (Deuring, Hecke) and
not proved in the paper, and they belong to ML.3's 'CM/non-CM branches'. Add a new sourceIssue: kind 'gap', locator '§1,
Theorem 1.0.1, p. 899, with §7.1, Corollaries 7.1.12–7.1.14, pp. 1095–1097 (also in arXiv v2)', printed 'The first
theorem is a special case of Corollaries 7.1.13 and 7.1.14', correction 'only for E without CM; the CM case is classical
(Deuring, Hecke), in the isobaric sense, with the CM Sato–Tate measure', affects 'nothing', known 'new'. In the report
(PAPER-ALLEN-ETAL-23.md), 'What the paper proves', say that Theorem 1.0.1 is proved in §7 for non-CM E. Also: Change
item 1's last sentence to 'If moreover E has no CM, then the Sato–Tate conjecture holds for E (Corollary 7.1.14).'
Repair the note's parentheses. Add a new sourceIssue (kind misprint, affects nothing): Theorem 1.0.1's Sato–Tate clause
needs E non-CM.

## All findings

| Finding | Severity | Kind | Where | Claim (abridged) |
|---|---|---|---|---|
| /1 | high | error | route 2 (items PAPER-ALLEN-ETAL-23/181, /182, /259, /270, /276, /289); … | Route 2 assigns the automorphy lifting theorems (Theorems 6.1.1 and 6.1.2, Corollary 6.5.5, Theorem 6.6.2, and the proofs of 6.1.1 and 6.1.2 by soluble base … |
| /2 | high | error | PAPER-ALLEN-ETAL-23/8 (route 2, assigned to PA.1), /38 (planned …; … | Objects that the extraction places at PA.1 are used in statements and proofs that it plans at PA.0, and PA.1 requires PA.0, so the plan is cyclic. Theorem … |
| /3 | high | error | PAPER-ALLEN-ETAL-23/30, /31 (planned at PA.2); … | The extraction plans Lemmas 2.1.10–2.1.11 at PA.2. These lemmas define, for any reductive group over a non-archimedean local field, the monoids Δ_M and Δ of … |
| /4 | high | error | PAPER-ALLEN-ETAL-23/81, /82, /88 (planned at PA.0); … | Three items are planned at PA.0: Theorem 2.4.8 (/81), the Hecke algebras T̃^T_R and T^T_R with ramified operators at R together with the extended Satake map … |
| /5 | high | duplicate | route 7 (items PAPER-ALLEN-ETAL-23/300, /303, /304) and route 7 reason; … | Three items in route 7 are statements about decomposed genericity: Lemma 7.1.5 (/300), Lemma 7.1.6(3)–(5) (/303) and Lemma 7.1.7 (/304). The extraction plans … |
| /6 | high | error | PAPER-ALLEN-ETAL-23/268, PAPER-ALLEN-ETAL-23/269, …; … | The extraction's owners form a dependency cycle through soluble base change. Proposition 6.5.13 (items 268 and 269) is planned at … |
| /7 | high | error | PAPER-ALLEN-ETAL-23/69, PAPER-ALLEN-ETAL-23/72, …; … | Four results are marked planned, but no stage plans any of them. They are Theorems 2.3.5 and 2.3.7 (Scholze's torsion Galois representations, from [Sch15, Cor. … |
| /8 | high | error | PAPER-ALLEN-ETAL-23/1; … | Item 1 states, for every elliptic curve E over a CM field F, that 'for every m ≥ 0 there is a finite extension F′/F over which Symm^m of the compatible system … |
| /9 | medium | error | PAPER-ALLEN-ETAL-23/119, /120 and /8 (route 2, assigned to PA.1); … | Route 2 sends three items to PA.1: Definition 4.3.5 (CTG weights, /119), Lemma 4.3.6 (/120) and the Kostant representatives W^P (/8). But Lemma 5.4.8 (/172) … |
| /10 | medium | duplicate | PAPER-ALLEN-ETAL-23/203, /204, /218, /221, /222 (PA.4); … | These items list a PA layer as a planner, although the PA layer's own text, or an accepted decision, gives the mathematics to another owner and makes the PA … |
| /11 | medium | other | route 2 reason; … | Building the PA layers from this paper needs layers that they do not require, directly or transitively, in data/atlas.json. Neither the route nor the report … |
| /12 | medium | missing | PAPER-ALLEN-ETAL-23/110; … | Lemma 4.2.2(2) is marked planned at PA.1 and PA.0, but its proof starts from Kostant's theorem [Kos61], the rational decomposition Hom_O(∧^i(U(O_K) ⊗ O), E) ≅ … |
| /13 | medium | missing | §§5.5, 6.1, 6.6 (items PAPER-ALLEN-ETAL-23/180, /182, /275, /276, …; … | Two cited results of Geraghty have no items. The first is the definition of an ι-ordinary automorphic representation [Ger19, Def. 5.3], with 'ordinarily … |
| /14 | medium | error | PAPER-ALLEN-ETAL-23/94, PAPER-ALLEN-ETAL-23/95, PAPER-ALLEN-ETAL-23/97; … | Three steps in the proofs of Proposition 3.2.2 and Corollary 3.2.3 (route 1's items 93 and 96) are marked planned at layers that plan nothing at the ramified … |
| /15 | medium | error | route 1 brief; … | Route 1's brief does not name all the roadmaps the Part II must import, and it names none of its imports by title: - It credits local Langlands to the wrong … |
| /16 | medium | duplicate | PAPER-ALLEN-ETAL-23/47, PAPER-ALLEN-ETAL-23/48; … | Item 47 contains the Bernstein-type embedding at pro-ℓ-Iwahori level: the injective map t : O[Ξ_v] → H(GL_n(F_v), I_v) ⊗ O for Iw_v(1,1) ⊂ I_v ⊂ Iw_v(0,1), … |
| /17 | medium | duplicate | PAPER-ALLEN-ETAL-23/32, PAPER-ALLEN-ETAL-23/33; … | Route 5 sends Lemmas 2.1.12–2.1.13 to SmoothRepresentationsOfLocalGroups:SR.1 as a source. These lemmas are Bushnell–Kutzko's cover formalism: - the algebra … |
| /18 | medium | error | PAPER-ALLEN-ETAL-23/83, PAPER-ALLEN-ETAL-23/84, …; … | The owner of Theorems 2.4.10 and 2.4.11 is unsettled. Item 83 (Theorem 2.4.10(1)) is marked planned at AS.5 and ALS.5. Its proof rests on two cited results … |
| /19 | medium | error | PAPER-ALLEN-ETAL-23/101, PAPER-ALLEN-ETAL-23/102, …; … | The paper's Fontaine–Laffaille functor uses a shift that depends on the embedding, and no named layer plans it. Items 101–105 and 198 are marked planned at … |
| /20 | medium | error | PAPER-ALLEN-ETAL-23/256, PAPER-ALLEN-ETAL-23/277, … | Items 256, 277 and 278 are the set-ups of §6.5.1 and §6.6.1. They are planned only at GlobalGaloisDeformations:G8 and LocalGaloisDeformationRings:L7/L8, which … |
| /21 | medium | error | PAPER-ALLEN-ETAL-23/18 | Item 18's second half is the global isobaric sum π₁ ⊞ π₂, the automorphic representation of GL_{n₁+n₂}(A_K) with local components π_{1,v} ⊞ π_{2,v}. It is … |
| /22 | medium | duplicate | PAPER-ALLEN-ETAL-23/131; … | Item 131 is [HSBT10, Lem. 2.2] as used in Theorem 4.5.1: an algebraic Hecke character, with its crystalline p-adic avatar, having prescribed restriction to … |
| /23 | medium | missing | PAPER-ALLEN-ETAL-23/83, PAPER-ALLEN-ETAL-23/84, PAPER-ALLEN-ETAL-23/85 | Two cited results used in the proof of Theorem 2.4.10 are not items, and no stage plans them. (a) [BW00, Ch. II, Prop. 3.1]: for cuspidal π with central … |
| /24 | medium | error | sourceIssues E23, PAPER-ALLEN-ETAL-23/69, PAPER-ALLEN-ETAL-23/72, … | E23 records that Theorem 2.4.11 needs F to contain an imaginary quadratic field, and asserts that §2 has no standing hypothesis to that effect. The same … |
| /25 | medium | error | PAPER-ALLEN-ETAL-23/76, PAPER-ALLEN-ETAL-23/77, … | Items 76, 77 and 79 list ArithmeticLocallySymmetricSpaces:ALS.4 as a planning layer. Their proofs need the residual Galois representations of Theorems 2.3.5 … |
| /26 | medium | error | PAPER-ALLEN-ETAL-23/122, PAPER-ALLEN-ETAL-23/125, …; … | Propositions 4.4.1 and 4.4.6 (items 122 and 125) assume only that K̃ ⊂ G̃(A^∞_{F⁺}) is a good subgroup and never define K, but their proofs apply Proposition … |
| /27 | medium | error | PAPER-ALLEN-ETAL-23/113; … | Item 113 folds into its statement the paper's remark 'If r̄ and r̄′ have the same associated projective representation, one is (decomposed) generic if and only … |
| /28 | medium | missing | items (no item covers [Clo90, Lem. 4.9]); … | Clozel's purity lemma [Clo90, Lem. 4.9] is a cited result used in §4 with no item. It is what makes a CTG weight useful: with it, CTG gives the hypothesis of … |
| /29 | medium | missing | PAPER-ALLEN-ETAL-23/91; … | The proof of Lemma 3.2.1 asserts without proof the existence of auxiliary characters. After enlarging O, there are characters ψ_1, ψ_2 : G_F → O^× of finite … |
| /30 | medium | missing | PAPER-ALLEN-ETAL-23/179; … | The proof of Proposition 5.4.18 (on the main ordinary chain Proposition 5.4.18 → Theorem 5.5.1 → Theorem 6.1.2) rests on two cited characteristic-zero results … |
| /31 | medium | error | PAPER-ALLEN-ETAL-23/179 | Item 179 (Proposition 5.4.18) is planned at PotentialAutomorphyInfrastructure:PA.2, but parts of its proof are neither planned nor items. Its note is also … |
| /32 | medium | missing | PAPER-ALLEN-ETAL-23/139, /142, /146, /151, /153, /161, /162, /163, … | The proofs in §§5.2–5.4 cite results from Emerton, Hauseux, Geraghty, Newton–Thorne and Chevalley, and none of them is an item; each appears only in the note … |
| /33 | medium | error | PAPER-ALLEN-ETAL-23/173 | Item 173 (Proposition 5.4.13) omits a hypothesis that its proof needs. The proof is 'Theorems 4.3.3, 5.4.3 and Lemma 5.4.8', and Theorem 4.3.3 … |
| /34 | medium | missing | PAPER-ALLEN-ETAL-23/211, PAPER-ALLEN-ETAL-23/212, … | Lemmas 6.2.26 and 6.2.27 come from applying [BLGHT11, Lem. 3.3] to the local rings. That lemma gives the dimension and minimal primes of completed tensor … |
| /35 | medium | missing | PAPER-ALLEN-ETAL-23/231, PAPER-ALLEN-ETAL-23/197 (three new items) | Three cited results used in proofs in §§6.2–6.3 are not items. PROTOCOL section 16 requires each to be one. (a) [CG18, Lem. 6.2] is the codimension–amplitude … |
| /36 | medium | missing | PAPER-ALLEN-ETAL-23/239, PAPER-ALLEN-ETAL-23/243, … | Several cited results used in proofs in §§6.4–6.6 have no item of their own. They appear only in the proof parentheses or notes of the items that use them, … |
| /37 | medium | missing | PAPER-ALLEN-ETAL-23/326; … | The proof of Corollary 7.2.4 (the elliptic-curve seed of Theorem 7.1.11) uses six cited results that are not items. They appear only in the note of item 326, … |
| /38 | medium | missing | PAPER-ALLEN-ETAL-23/325; … | Item 325 (Proposition 7.2.3) is routed as a source of ML.2. Its proof is 'the proof of [BLGGT14, Th. 3.1.2]', which needs the symplectic Dwork family, its … |
| /39 | medium | missing | PAPER-ALLEN-ETAL-23/297, PAPER-ALLEN-ETAL-23/298; … | The second part of Lemma 7.1.3 (large residual image at a density-one set of primes) rests on two cited theorems that are not items. (1) [LP92, Prop. 8.9]: the … |
| /40 | medium | missing | PAPER-ALLEN-ETAL-23/291, PAPER-ALLEN-ETAL-23/294, …; … | Henniart's theorem [Hen82] is cited and used but is not an item: every compatible family of one-dimensional l-adic representations is de Rham, so it comes from … |
| /41 | medium | error | PAPER-ALLEN-ETAL-23/328; … | Route 12 gives item 328 to ArithmeticGaloisDuality R02.2/R02.4, with the reason that the square-root step is 'a local–global (Grunwald–Wang, Brauer-class) … |
| /42 | medium | missing | PAPER-ALLEN-ETAL-23/299, PAPER-ALLEN-ETAL-23/303, … | Further cited results used in §7.1 appear only in item notes, with no items of their own, though each is a cited input of a proof (PROTOCOL §16: every cited … |
| /43 | medium | error | PAPER-ALLEN-ETAL-23/305 | The proof of Lemma 7.1.8(1) asserts 'G ≠ G^0 ≠ (0), as otherwise we would have Hodge–Tate numbers {1, 1} or {0, 0}', and then 'H ≠ H^0 ≠ (0)'. With G^0 the … |
| /44 | medium | error | PAPER-ALLEN-ETAL-23/312, PAPER-ALLEN-ETAL-23/315, …; … | Four proof gaps that these items' notes describe as recorded ('see issues') are missing from sourceIssues, against PROTOCOL §18 (mistakes are recorded, never … |
| /45 | medium | missing | prerequisites; … | The prerequisites list omits four papers that the §7 proofs depend on essentially and that the atlas does not cover. None has an extraction or an entry in the … |
| /46 | low | other | PAPER-ALLEN-ETAL-23/185, /206, /207, /208, /209, /210, /220, /222 | Several §6.2 planned lists do not match the accepted GlobalGaloisDeformations packet, which was accepted after the extraction was written: - items 185, 206 and … |
| /47 | low | other | PAPER-ALLEN-ETAL-23/228, /229, /231, /232, /249, /253, /258, /267, … | The planned lists cross the line between the abstract patching layers (DeformationAndDerivedPatchingAlgebra P8/P9) and the arithmetic layers (PA.3/PA.4), in … |
| /48 | low | error | PAPER-ALLEN-ETAL-23/114; … | Lemma 4.3.2 (infinitely many decomposed generic primes) is marked missing and routed by route 6, but the accepted base decomposition of … |
| /49 | low | error | PAPER-ALLEN-ETAL-23/274 | Item 274 is planned at AG2.5 alone, but half of it is a step of the proof of Theorem 6.1.1, which is route 2's job. That half says that varying the auxiliary … |
| /50 | low | error | PAPER-ALLEN-ETAL-23/22, PAPER-ALLEN-ETAL-23/23 | The paper defines X^G and X^G_{K_G} for any connected linear algebraic group G. It uses them for parabolic subgroups: X^P_{K̃_P} appears in §2.1.9 and in … |
| /51 | low | duplicate | PAPER-ALLEN-ETAL-23/70; … | Definition 2.3.6 (maximal ideals of Galois type, and non-Eisenstein maximal ideals, for GL_n over a CM field) is missing in route 3, a source of IHG.5. … |
| /52 | low | error | sourceIssues E21, PAPER-ALLEN-ETAL-23/87 | E21 rightly says T_n has the wrong rank, but its correction 'ρ ∈ X*(Res_{F⁺/Q} T)' is still false, and item 87 repeats it. For GL_{2n}, half the sum of the … |
| /53 | low | other | sourceIssues (new), PAPER-ALLEN-ETAL-23/31, PAPER-ALLEN-ETAL-23/36, …; … | Three misprints in §2 are not recorded in sourceIssues; each appears both in print and in arXiv v2. (a) Proof of Lemma 2.1.11: the integration identity is said … |
| /54 | low | other | PAPER-ALLEN-ETAL-23/76, PAPER-ALLEN-ETAL-23/77 | Two notes point to sourceIssues that do not exist. Item 76's note says Theorem 2.4.8's proof needs Theorem 2.4.2's isomorphism to be equivariant for more than … |
| /55 | low | error | report section 'What the paper proves' (the §2 bullet) | The report says §2 sets up 'the boundary cohomology, whose GL_n part is a direct summand after localizing (Theorems 2.4.2 and 2.4.8)'. Neither theorem gives a … |
| /56 | low | error | the report (PAPER-ALLEN-ETAL-23.md), section 'What the paper proves', … | The report says 'Caraiani–Scholze's generic vanishing puts the localized cohomology of the unitary Shimura variety in the middle degree (Theorem 4.3.3).' That … |
| /57 | low | error | the report (PAPER-ALLEN-ETAL-23.md), section 'Source issues', bullet … | The report says of E39: 'Proposition 4.4.6(c) is false in the degenerate case A(K, λ, q, m) = 0. Every application has A ≠ 0.' The second sentence is wrong. … |
| /58 | low | missing | items (cited results named only in notes): PAPER-ALLEN-ETAL-23/89, … | Several results that §§3–4 cite and use in proofs have no item and appear only inside notes. They are Chenevier's [Che14, Th. 2.22] (the sole input turning … |
| /59 | low | missing | sourceIssues (§5.4); … | The proof of Lemma 5.4.15 does not show that its K′ = ker(O_F^× → (O_F/𝔞)^×)·K(𝔞𝔟) is a good subgroup. In this paper a good subgroup must be a product ∏_v K_v. … |
| /60 | low | other | PAPER-ALLEN-ETAL-23/134, PAPER-ALLEN-ETAL-23/171; … | The notes of items 134 and 171 are cut off mid-sentence. Item 134's note ends 'The printed definition of K(b,c) has a slip (K_v for K(b,c)_v;', with an … |
| /61 | low | missing | PAPER-ALLEN-ETAL-23/210, PAPER-ALLEN-ETAL-23/221, …; … | Several standard theorems that proofs in this range name and use have no items. The proof of Proposition 6.2.25 uses the Poitou–Tate exact sequence. … |
| /62 | low | error | PAPER-ALLEN-ETAL-23/205, PAPER-ALLEN-ETAL-23/211, …; … | Proposition 6.2.21 states that R_v^□ is a power series ring over O in n² variables. But R_v^□ represents lifts on CNL_{Λ_v}, and §6.2.20 never sets Λ_v = O, … |
| /63 | low | error | PAPER-ALLEN-ETAL-23/221, PAPER-ALLEN-ETAL-23/222 | Lemma 6.2.32 and Proposition 6.2.33 are proved under the standing assumption, stated just before the definition of Taylor–Wiles data, that k contains all … |
| /64 | low | error | PAPER-ALLEN-ETAL-23/228 (and PAPER-ALLEN-ETAL-23/224 to … | The set-up of §6.3.5 takes T_∞ and T′_∞ to be S_∞-subalgebras of End_{D(S_∞)}(C_∞) and End_{D(S_∞)}(C′_∞), which are non-commutative rings. Everything that … |
| /65 | low | other | sourceIssues E68, sourceIssues E77 | Two recorded mistakes have section numbers in their locators that do not exist in the published numbering. E68 is located at '§6.2.3, proof of Lemma 6.2.4', … |
| /66 | low | error | PAPER-ALLEN-ETAL-23/236; … | Item 236 says that for every d ≥ d_0(J) and every x ∈ m_{T_N} the image of x^d is 0, and concludes 'so for d ≥ d_0(J) the surjection factors through a … |
| /67 | low | error | sourceIssues E85; … | E85 quotes 'there are local O-algebra surjections R_∞ → R_N and R′_∞ → R′_N for any N ≥ 0' but corrects only the cross-reference. The targets are also wrong. … |
| /68 | low | error | sourceIssues E92 | E92 records a case of Theorem 6.1.1's final sentence (v / p) that the proof never treats, which is a gap in the proof. It is nevertheless marked 'affects: … |
| /69 | low | error | prerequisites; … | The first prerequisites entry, Scholze's 'On torsion in the cohomology of locally symmetric varieties', is no longer a paper 'the atlas does not yet cover'. It … |
| /70 | low | other | sourceIssues; … | The published bibliography entry [MB89] cites Moret-Bailly's 'Groupes de Picard et problèmes de Skolem. II' (pp. 181–194), the part the paper uses through … |
| /71 | low | other | PAPER-ALLEN-ETAL-23/306 | The locator of item 306 (Lemma 7.1.8(2)) is 'p. 1092', but the statement of part (2) begins on p. 1091 and ends on p. 1092. sourceIssue E100 correctly says … |

## Notes for the fix job

- **Placement first.** Move the lifting theorems and patching outputs to PA.4 (or the dedicated lifting layer of
  RT-AREA-langlands-1/7), soluble base change upstream of ML.2 and PA (ET.7a / AG2.2), the monoid Hecke algebras to
  route 5 with Lemmas 2.1.12–2.1.13, Theorem 2.4.8 and its algebras into route 1, the PA.1 objects used at PA.0 down to
  PA.0, and the decomposed-genericity lemmas to PA.5 beside PAPER-QIAN-23; then project the item uses onto stages and
  check for cycles.
- **Statuses.** Mark Scholze's Theorems 2.3.5/2.3.7 and the U(n, n) results missing and route them as
  RT-AREA-langlands-1/9 requires; restrict the other partial statuses as the findings say.
- **Theorem 1.0.1.** State it for non-CM E (or split the CM case off as classical) and record the paper's omission as a
  new sourceIssue.
- **Definitions and inputs.** Add ι-ordinarity and the cited results with no items; add the missing prerequisites.
