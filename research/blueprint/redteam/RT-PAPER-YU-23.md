# RT-PAPER-YU-23

Red team of the accepted extraction PAPER-YU-23: Hongjie Yu, *Comptage des systèmes locaux ℓ-adiques sur une courbe*,
Annals of Mathematics 197 (2023), 423–531 (arXiv 1807.04659v5). Issue #4062.

Red team: Claude Code, session `cc-c2c06b`, 1 October 2026. I did not write or review:
- the extraction (`codex-a71f92`, `codex-c83e7a`, `cc-442dc5`; PRs #2021, #2138, #2145);
- its reviews (`cc-7b31c4`, PR #2388; `cc-39fac3`, PR #2406).

Disclosures: I wrote FIX-RT-PAPER-SCHIFFMANN-16 (PR #5243), which added the sentence of PAPER-SCHIFFMANN-16 route 1's
brief that /5 quotes; the duplication itself is the independently confirmed RT-PAPER-SCHIFFMANN-16/3. I also wrote
REV-FIX-RT-AREA-etale~2; /6 cites an étale-area verdict.

**Result: 41 findings, 5 high, 19 medium and 17 low.**

## Method

**The source.** arXiv 1807.04659v5 (<https://arxiv.org/abs/1807.04659v5>), the version the extraction read, was
re-downloaded on 2026-10-01 with its LaTeX source. Its SHA-256 (`9383bcde…454de1c`) equals the extraction's. The
published Annals text is paywalled and was not read.

**The passes.** Five parallel passes were run by this session.
- Four read all 85 pages: §§1–3 with Appendix B, §§4–5, §6, and §7 with Appendices A and C and the references.
- One checked the 13 routes, the 25 planned and 11 library statuses and the briefs against the atlas, other papers'
  accepted routes, earlier red teams and the pinned libraries (Mathlib 082e2d3, Tau Ceti f790474).

**Merging.** I merged findings reported by more than one pass:
- the number-field owners of routes 3 and 4; the Schiffmann duplicate; the route 12 brief;
- Théorème 1.4 for gcd(e, n) > 1; the prerequisites; the dependency graph; the stale report.

**What I re-verified myself.** All five high findings:
- the three cycles, from the extraction's recorded item dependencies and the atlas requirements (GS.6 requires DWP.7 and
  FA.6; GS.0 requires FA.6; FA.6 → FA.2 → FA.1 → FA.0 → SF.3);
- the number-field scope of AutomorphicSpectralTheory and AL.3 in the atlas, and the confirmed RT-PAPER-YUN-ZHANG-17/1;
- PAPER-SCHIFFMANN-16 route 1's brief, which says Yu's route 12 imports these results, against route 12, which still
  carries them.

**Severities.** I changed none; merged findings take the highest severity of their parts.

The full list of what was checked is in the result's `checked` field.

## The high findings

### /1 — error

**Where.** route 12 items PAPER-YU-23/003, /004, /006, /030, /101, /155, /156, /162, against their consumers
PAPER-YU-23/014 (route 2, planned GS.6), /042 (route 5), /129 (route 10), /018, /021 and /157 (route 3), /068 (route 4),
/033 and /126 (route 2), /102 (route 7)

**Claim.** Route 12 is a Part II of GlobalShtukasAndFunctionFieldLanglands: that roadmap is its first prerequisite, and
its brief imports FunctionFieldArithmetic, AutomorphicSpectralTheory, AutomorphicLFunctionsAndLocalFactors,
DeligneWeightsAndPurity, EtaleDualityAndPerverseSheaves and QSeriesPartitionsAndMockModularForms. Yet route 12 owns
basic definitions on which items planned in, or routed to, those roadmaps depend. Each of the following edges makes a
layer depend on a roadmap that depends on it. (a) 014 (Lafforgue's correspondence with twists, planned GS.6) depends on
003 (Weil group of a curve) and 004 (inertial characters and twist equivalence). (b) 042 (planned DWP.7, WC.1 and
EDC.2:pairings) and 129 (planned EDC.2:pairings) depend on 003. (c) 021 (route 3) depends on 004; 018 (planned AS.4) and
021 use the automorphic twist action and Fix(π) defined in 162; 157 (route 3) is a statement about the counts Γ_I
defined in 030. (d) 068 (route 4, AL.3) depends on 006 (Clifford decomposition, Fix(σ) cyclic) and uses Fix(π). (e) 033
and 126 (route 2, GS.0) depend on 030 (T-semistability), and 033 also rests on 155 and 156 (Lafforgue's cutoff formula
and its reading as the count of T-semistable bundles). (f) 102 (route 7, QM.0) depends on 101 (the monomials of
η_{s,X_l}). In addition, 003 is not missing: the accepted PAPER-DELIGNE-80 plans the same object, the Weil group W(X₀,
x̄) of a scheme over F_q, at DeligneWeightsAndPurity:DWP.5, which is upstream of both GS.6 and DWP.7.

**Evidence.** Dependencies recorded in the extraction: 014 [003, 004, 012]; 042 [001, 003, 041]; 129 [003, 042]; 021
[004, 020]; 068 [006, 014, 041, 042, 129]; 033 [009, 011, 024, 026, 030]; 126 [026, 030]; 102 [043, 090, 101]. Note of
162: 'C_n(X_k) (item 015), Corollaire 2.3.3 (item 016) and the stabilizers (items 018, 021) all use the automorphic
twist action and Fix(π).' Note of 155: 'item 033 assumes the cutoff form without stating it.' Statement of 157: 'Yu's
Γ_I equals Chaudouard's Γ_P.' PAPER-DELIGNE-80/s1a-1.1.10 (status planned, DeligneWeightsAndPurity:DWP.5): 'The Weil
group W(X₀, x̄) is the inverse image of W(F/F_q) under the natural map of π₁(X₀, x̄) to π₁(Spec(F_q), x̄) = Gal(F/F_q).
The topology ... is the product topology'. In the atlas, GS.6 requires DWP.7, and the requirement closure of DWP.7
contains DWP.5. PROTOCOL section 15: a Part II has 'the existing roadmap as its first prerequisite'. The same pattern (a
source-route item depending on Part II items) was confirmed as a high-severity cycle in
RT-PAPER-ESNAULT-GROECHENIG-20/1.

**Fix.** Give each shared definition an owner upstream of all its consumers. (1) 003: status planned at
DeligneWeightsAndPurity:DWP.5, citing PAPER-DELIGNE-80/s1a-1.1.10, and remove it from route 12. (2) Move 004
(Galois-side twists) to route 2 at GS.6, which plans 'extension by twists'; move 162 (automorphic-side twists and
Fix(π)) to route 1 at FA.6; make 021 depend on 162 instead of 004. (3) Move 068, 069 and 130 into route 12, as the
review notes on these three items already propose ('Either AL.3 imports those or the item moves to the route-12 Part
II'); 006 then stays in route 12. (4) Split 033: the bundle–adèle dictionary stays in route 2 (GS.0); the cancellation
of automorphism weights on the T-cutoff moves to route 12 together with 155 and 156; move 126 (Chaudouard's
shifted-slope Harder–Narasimhan filtration) and 157 into route 12 beside 030. (5) Restate 102 for arbitrary signs
ε_(j,s) ∈ {±1} and arbitrary list lengths l_s, m_s, so that it no longer depends on 101, or move it into route 12. Then
record these dependencies and check that no item of a source route, and no planned item, depends on an item of route 12
or route 13.

### /2 — error

**Where.** PAPER-YU-23/064 (route 1), /013 (route 2), /127 (route 4, planned AL.3), /128 (route 4), /065 (route 3)

**Claim.** 064 (Lemme 5.3.3: a nonzero spherical cusp form is nonzero somewhere on G(A)^0) is routed to
FunctionFieldArithmetic, where only FA.6 has cusp forms, but it depends on 013 (multiplicity one, route 2, stages
GS.0/GS.6) and on 127 and 128 (Whittaker theory, AL.3). GS.0 and GS.6 both require FA.6, so FA.6 → GS → FA.6. 127
depends on 009, 011 and 012 (FA.2, FA.6), so FA.6 → AL.3 → FA.6. Neither GS layer plans multiplicity one: GS.6 consumes
it, and the GS blueprint asks FA.6 for it.

**Evidence.** Dependencies recorded in the extraction: 064 [008, 009, 012, 013, 127, 128]; 013 [012]; 127 [009, 011,
012]; 128 [008, 127]; 065 [013, 020, 021, 060, 064]. Atlas: GS.0 requires FunctionFieldArithmetic:FA.6; GS.6 requires
FunctionFieldArithmetic:FA.6; AL.3 requires AF.1, AL.2 and SR.5, and no FunctionFieldArithmetic stage is in its
requirement closure. The GlobalShtukasAndFunctionFieldLanglands blueprint packet's GS.6 node says uniqueness follows
'from the strong multiplicity one theorem of Piatetski-Shapiro', and the packet requests from
FunctionFieldArithmetic:FA.6 'The space of cuspidal automorphic forms ..., with its Hecke module structure, its finite
dimensionality and the strong multiplicity one theorem.'

**Fix.** Put 013, 127 and 128 in route 1 (FunctionFieldArithmetic, FA.6) as source items next to 064; change 127's
status from planned (AL.3) to missing; remove 013 from route 2 and 127, 128 from route 4, and update the three route
reasons. Then 064 and 065 depend only on FunctionFieldArithmetic items.

### /3 — error

**Where.** PAPER-YU-23/125 (route 9, planned SchemeAndStackFoundations:SF.3) and /026 (route 2, planned
GlobalShtukasAndFunctionFieldLanglands:GS.0)

**Claim.** 125 is planned at SF.3 but depends on 026 (vector bundles on X_1 with rank, degree and slope), which is
planned at GS.0. GS.0 requires FA.6, and the chain FA.6 → FA.2 → FA.1 → FA.0 ends at SF.3, so SF.3 would depend on a
layer that depends on SF.3. The dependency is genuine: 125 asks for 'the actual image, saturated image, and coimage
degree inequalities ... to apply the slope bounds', which use 026's slopes.

**Evidence.** Dependencies of 125 in the extraction: [008, 026]. Statement of 125: 'For bundles U,V on a smooth
projective curve, Ext1(U,V) is dual to Hom(V,U⊗omega). The actual image, saturated image, and coimage degree
inequalities are needed to apply the slope bounds when the induced map is not a subbundle inclusion.' Atlas
requirements: FA.0 requires SchemeAndStackFoundations:SF.3; FA.1 requires FA.0; FA.2 requires FA.1; FA.6 requires FA.2
and FA.4; GS.0 requires FA.6.

**Fix.** Split 125. Serre duality Ext¹(U, V) ≅ Hom(V, U ⊗ ω)^∨ for locally free sheaves on the curve stays planned at
SF.3 and depends only on 008 and SchemeAndStackFoundations' locally free sheaves, not on 026. The degree inequalities
for images, saturations and coimages, which need slopes, become a separate missing item in route 12 next to 031 (or in
route 2 at GS.0).

### /4 — duplicate

**Where.** route 3 (47 items) and route 4 (10 items); planned items PAPER-YU-23/010, /017, /018, /024, /025, /060, /061,
/166 (AutomorphicSpectralTheory) and /127 (AutomorphicLFunctionsAndLocalFactors:AL.3); route 4; PAPER-YU-23/068,
PAPER-YU-23/069, PAPER-YU-23/130, PAPER-YU-23/170, PAPER-YU-23/171, PAPER-YU-23/172; route 12 brief; the report
(PAPER-YU-23.md), section 'Route 4: AutomorphicLFunctionsAndLocalFactors'; PAPER-YU-23/060, PAPER-YU-23/061,
PAPER-YU-23/166, PAPER-YU-23/127 (planned statuses); route 3; route 4; PAPER-YU-23/024, PAPER-YU-23/025

**Claim.** Routes 3 and 4 send Yu's function-field automorphic analysis (the discrete spectrum and Eisenstein residues
of GL_n over F = F_q(X_1), Lafforgue's truncated trace J_e^T and its continuation, Chaudouard's Lie-algebra counts, the
spectral expansion twisted by η, the unramified Rankin–Selberg L-functions as rational functions of z) as source
material to two roadmaps whose scope is number fields, and nine of these items are marked planned there. No
AutomorphicSpectralTheory or AL.3 stage has a FunctionFieldArithmetic stage in its requirement closure, so these layers
cannot even state G(F)\G(A)^e, the degree map or Ξ_M for a function field. Route 3's own reason concedes this is 'not an
assertion that its number-field trace theorem already applies in characteristic p'. The AS and AL blueprint jobs would
either ignore the source, leaving the items without an owner, or plan a second global-field theory by a different
method. The same defect was confirmed in RT-PAPER-YUN-ZHANG-17/1, whose fix moved function-field analytic theory into
the shtuka Part II, where PAPER-YUN-ZHANG-17/45 ('Function-field Eisenstein series and automorphic-kernel spectral
decomposition') now sits; keeping Yu's items in AS gives function-field Eisenstein series and spectral expansions two
owners. Also: Route 4 sends the §6.1–6.2 L-function items 068, 069, 130, 170, 171 and 172 to
AutomorphicLFunctionsAndLocalFactors:AL.3. That roadmap does not own this material. AL is a number-field roadmap: it
consumes GlobalNumberFields adeles, AL.3 plans local GL_n×GL_m zeta integrals, archimedean Whittaker theory and global
unfolding, and its README never mentions function fields. Yu's proofs of these items work on the Galois side over
F_q(X_1). The degree (2g−2)n1n2 comes from the Euler characteristic; the shape of Q and the value of ε come from H^0,
H^2 and the symplectic pairing on H^1; the root radius comes from purity. Items 069 and 170 are Euler-product identities
for Speh representations over a function field, item 171 is a rational-function identity resting on 130, and item 172 is
complex analysis. The review recorded this mismatch in the notes of 068, 069 and 130 and left it unresolved, while
accepting route 4. Every consumer of these items (071, 083, 084) is in route 12, so in practice they have no owner that
will build them. Also: Four items of §5 are marked planned at number-field layers: 060 (induced spherical sections
A_{R,π}) at AutomorphicSpectralTheory:AS.1, 061 (intertwining operators and the operator-valued (G,M)-family μ ↦
M_Q(λ,P;μ)) at AS.2, 166 (residual forms as residues of cuspidal Eisenstein series) at AS.4, and 127 (global Whittaker
models) at AutomorphicLFunctionsAndLocalFactors:AL.3. All four are statements for GL_n over the global function field F
= F_q(X_1). AutomorphicSpectralTheory is scoped to number fields and AS.6 says its sources are not a function-field
trace formula; AutomorphicLFunctionsAndLocalFactors is built on the GlobalNumberFields adeles and characters. No atlas
layer builds induced sections from discrete data, intertwining operators, Eisenstein series or Whittaker models over a
function field, so these items are missing, not planned. AS.1 is also restricted to cuspidal data, whereas 060 induces a
discrete, possibly residual, π. The same scope problem underlies route 3, which sends 47 function-field items into AS
layers as a source route (its reason concedes 'not an assertion that its number-field trace theorem already applies in
characteristic p'), and route 4's function-field Rankin–Selberg items; items 010 and 018 (§2, planned at AS.1 and AS.4)
are affected in the same way. Also: Items 024 (Arthur's truncated kernel for 1_{GL_n(O)} and J_e^T over a function
field) and 025 (absolute convergence and quasi-polynomiality of T ↦ J_e^T) are marked planned at
AutomorphicSpectralTheory:AS.3 (and AS.6 for 024). That roadmap is scoped to number fields, and its AS.6 text explicitly
disclaims a function-field trace formula. On a function field the T-dependence is quasi-polynomial, Σ_ν p_ν(T)q^{⟨ν,T⟩}
with ν ∈ (2πi/log q)X^*(B) ⊗ Q, and not polynomial, so it is not what AS.3 plans. The status is also inconsistent with
item 157 (Chaudouard's Prop. 4.5.5 lattice quasi-polynomiality), which is the key step of the function-field proof and
is marked missing in the same route. Moreover, Yu proves nothing here himself: he refers for a proof to [Ch15, Théorème
5.2.1], which is the Lie-algebra statement for the Hitchin kernel k^T_D, so the group version for 1_K must be built by
transposing that proof. Neither item says so. Item 024 also does not cite [Ar78, Lemma 5.1], which Yu uses for the
finiteness of the δ-sum in (3.2.1).

**Evidence.** Atlas, AutomorphicSpectralTheory summary: 'Develop the analytic structure of automorphic forms and L²
automorphic representations for connected reductive groups over number fields.' AS.6: 'their acquisition is not a full
proof-closure audit or a general function-field trace formula.' AutomorphicLFunctionsAndLocalFactors summary: 'Consume
GlobalNumberFields character/adeles APIs'. ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic: 'Reuse
... AS.0's abstract functional analysis, **not** AF.2–3/AS.6's number-field automorphic theorems.' The requirement
closures of AS.1, AS.4, AS.6 and AL.3 contain no FunctionFieldArithmetic stage. RT-PAPER-YUN-ZHANG-17/1 (confirmed):
'Nothing in GZ.5 or its inputs builds automorphic forms, Eisenstein series or Poisson summation over a function field'.
PAPER-YUN-ZHANG-17/45 is in that paper's accepted route 1 (part-ii of GlobalShtukasAndFunctionFieldLanglands). Also:
Route 4 reason: 'Whittaker normalization and unramified Rankin–Selberg product, pole and functional-equation
calculations belong to the existing Rankin–Selberg layer.' The atlas summary of AutomorphicLFunctionsAndLocalFactors:
'Develop reusable analytic local factors and zeta-integral machinery ... Consume GlobalNumberFields character/adeles
APIs, ArithmeticDirichletSeries for common convergence and Dirichlet-series arguments'. AL.3: 'Construct the GL_n×GL_m
local zeta integrals, convergence, nonarchimedean rationality and gcd-normalized factors. Separately develop the
archimedean Whittaker functional ... Prove unramified calculations and the global unfolding for cuspidal data.' The
review's note on 068 (repeated on 069 and 130): 'AL.3 ... plans the zeta-integral Rankin–Selberg theory (unramified
computation, poles in the twist case) but not what this proof uses: the function-field degree (2g−2)n1n2 from the Euler
characteristic, the purity separation of H0/H1/H2 and the epsilon value, all Galois-side through Lafforgue's
correspondence ... Either AL.3 imports those or the item moves to the route-12 Part II.' The paper (arXiv v5, p. 42):
'Soit F1 (resp. F2) un faisceau de Weil lisse irréductible ... correspondant à π1 (resp. π2) par la correspondance de
Langlands ([Laf02, Théorème VI.9] ...). On est ramené à traiter les fonctions L de F1 ⊗ F2^∨.' The dependencies of 071
include 068, 069 and 130, and the dependencies of 083 include 069; 071, 083 and 084 are all in route 12. Also: Atlas,
AutomorphicSpectralTheory summary: 'Develop the analytic structure of automorphic forms and L² automorphic
representations for connected reductive groups over number fields. This covers Eisenstein series, intertwining
operators, discrete and continuous spectrum, truncation and the invariant trace formula.' AS.6: 'their acquisition is
not a full proof-closure audit or a general function-field trace formula.' AS.1: 'For a rational parabolic P=MN and
cuspidal data on M construct sections of normalized induction'.
ExcursionOperatorsAndSpectralAction:ES7:function-field-automorphic: 'Reuse SR.0–2's locally profinite carriers and
AS.0's abstract functional analysis, not AF.2–3/AS.6's number-field automorphic theorems.'
AutomorphicLFunctionsAndLocalFactors summary: 'Consume GlobalNumberFields character/adeles APIs'. The report
(PAPER-YU-23.md), 'Ownership and implementation boundary': 'The programme's number-field scope is not treated as a
theorem for function fields'. The paper (arXiv v5, p. 32): 'Soit (P, π) une paire discrète de G ... Soit A_{R,π}
l'induite de π dans A_R'. The confirmed finding RT-PAPER-YUN-ZHANG-17/5 reached the same conclusion for function-field
Eisenstein series, which are now the missing item PAPER-YUN-ZHANG-17/45 in ShtukaSpecialCyclesAndHigherSiegelWeil. Also:
Atlas roadmap AutomorphicSpectralTheory, summary: 'Develop the analytic structure of automorphic forms and L²
automorphic representations for connected reductive groups over number fields.' Stage AS.6: 'their acquisition is not a
full proof-closure audit or a general function-field trace formula.' The paper (arXiv v5, p. 18): 'Le théorème suivant
est démontré par Arthur sur un corps de nombres (cf. théorème 9.1 de [Ar05]). La même méthode marche pour un corps de
fonctions aussi, on renvoie le lecteur au théorème 5.2.1 de [Ch15] pour une preuve.' p. 16: 'la somme sur δ peut être
prise sur un ensemble fini (qui dépend de x et T, cf. [Ar78, Lemma 5.1])'. Chaudouard [Ch15], author's copy (SHA-256
2ae48bde…), p. 29: '(5.2.1) J^{T,e}_D = ∫_{G(F)\G(A)^e} k^T_D(g) dg … Théorème 5.2.1. — La fonction sur a_B T ↦
J^{T,e}_D est quasi-polynomiale', proved from the Γ'_Q decomposition, the factorisation (5.1.7), periodicity in H and
Proposition 4.5.5. p. 24–25, Définition 4.5.3: Φ(T) = Σ_{ν∈f} p_ν(T)q^{⟨ν,T⟩}.

**Fix.** Give the function-field spectral theory one function-field owner, either (a) a new part-ii route with parent
AutomorphicSpectralTheory titled 'Automorphic spectral theory and trace distributions, Part II: global function fields',
importing FunctionFieldArithmetic FA.2/FA.6 and the field-independent AS results and coordinated with
PAPER-YUN-ZHANG-17/45, or (b) route 12, beside PAPER-YUN-ZHANG-17/45 in the same merged design job. In either case:
change 017, 018, 024, 025, 060, 061 and 166 from planned to missing and route them to that owner; mark 010 planned at
FunctionFieldArithmetic:FA.6, which plans the degree lattice (verdict of RT-AREA-geomlanglands/12); move the
function-field items of route 3 (at least 019–021, 038, 039, 062, 063, 065, 066, 145–147, 149–153, 157, 164, 165) to the
same owner; keep in route 3 only field-independent algebra (for example 022, 023, 047–056, 058, 059, 115–117, 148, 169,
175) and say so in its reason; move route 4's Galois-side items 068, 069, 130, 170, 171, 172 to route 12 (as the review
notes on 068, 069 and 130 propose), 057 and 168 to the new owner, and 127, 128 to FunctionFieldArithmetic FA.6 with 064.
Also: Move 068, 069, 130, 170, 171 and 172 from route 4 to route 12. In route 12's brief, add a layer before the
cycle-block computation: 'Rankin–Selberg L-functions of everywhere-unramified cuspidal and residual pairs over F_q(X_1):
rationality, the exact denominator, deg P = (2g−2)n1n2 (+2|Fix| for self-pairs), ε(π×π^∨) = q^{(g−1)n²}, the root radius
q^{−1/2}, the Speh Euler product (Lemme 6.1.3) and the zero–pole counts of Corollaire 6.1.2 and (6.2.5)–(6.2.6). These
are proved through Lafforgue's correspondence and purity (GlobalShtukasAndFunctionFieldLanglands:GS.6), Weil II
(DeligneWeightsAndPurity:DWP.7) and Poincaré duality (EtaleDualityAndPerverseSheaves:EDC.2:pairings), with only the
local unramified factors imported from AutomorphicLFunctionsAndLocalFactors.' Keep route 4 for its §5 items (057, 127,
128), and rewrite its reason and the report's Route 4 paragraph to match. Also: Set 060, 061, 166 and 127 to status
missing, remove their 'planned' fields and keep AS.1, AS.2, AS.4 and AL.3 in the notes only as number-field models.
Route them, together with the function-field spectral items of routes 3 and 4, to a function-field owner: route 12's
Part II (its brief must then add induced sections from discrete data, intertwining operators, Eisenstein series and
their residues, and Whittaker models for GL_n over F) or a Part II of FunctionFieldArithmetic for GL_n spectral theory
over function fields. Coordinate with PAPER-YUN-ZHANG-17/45 so that one function-field Eisenstein theory is planned, not
two. Apply the same correction to items 010 and 018. Also: Set items 024 and 025 to status missing, keeping them in
route 3 as source items whose function-field versions the AutomorphicSpectralTheory blueprint must add, as is already
done for 157, 019, 020 and 021. In 024, cite [Ar78, Lemma 5.1] (p. 16) for the local finiteness of the δ-sum. In 025's
proof outline, say that [Ch15, Thm 5.2.1] treats the Lie-algebra kernel k^T_D, and that the group statement for 1_K is
obtained by transposing its proof: the decomposition of k^T over Γ'_Q, the analogue of (5.1.7) for the unipotent
integral of 1_K, H-periodicity, and Ch15 Prop. 4.5.5 (item 157). Make 025 depend on 157.

### /5 — duplicate

**Where.** route 12: PAPER-YU-23/027, /036, /037, /045, /046, /131, /178; route 12 brief; PAPER-YU-23/100,
PAPER-YU-23/131, PAPER-YU-23/178, PAPER-YU-23/119, route 12, route 12 brief, gaps S3 and S6 (the same pattern holds for
PAPER-YU-23/027, /036, /037 and /046)

**Claim.** These route-12 items plan results that the accepted PAPER-SCHIFFMANN-16 route 1 (new roadmap
CountingBundlesAndHallAlgebrasOfCurves, design job pending) owns after the confirmed RT-PAPER-SCHIFFMANN-16/3:
Krull–Schmidt for bundles (027 = Schiffmann/15), the stable Higgs moduli (036 = /9), the Higgs count equals the
indecomposable count (037 = /10, Theorem 3), Mellit's theorem and the universal polynomial A_{g,n} (046 = /2, /3, /8,
with 045 defining the H_{g,n} in 046's statement), purity and the Poincaré polynomial of Higgs^st (131 = /11), and the
top-weight term (178 = Corollary 1.5 in /11). Schiffmann's brief says Yu's route 12 imports them; route 12's brief
instead says to build 'the coprime stable GL_n coarse-moduli/mass adapter' and never names that roadmap. Two pending
design jobs would plan the same theorems. Also: Items 100, 131 and 178 are routed to route 12 as missing statements that
the counting Part II of GlobalShtukasAndFunctionFieldLanglands must plan, and nothing in the extraction mentions the
accepted extraction PAPER-SCHIFFMANN-16. Since FIX-RT-PAPER-SCHIFFMANN-16 (confirmed finding RT-PAPER-SCHIFFMANN-16/3),
these statements have one owner elsewhere, and that extraction says Yu's route 12 imports them: purity and the signed
Poincaré polynomial of the stable Higgs moduli with its top degree (Yu 131 and 178 = PAPER-SCHIFFMANN-16/11, owned by
CountingBundlesAndHallAlgebrasOfCurves), the Zariski density of Weil tuples (Yu 100 = PAPER-SCHIFFMANN-16/36, routed to
UniversalHypersurfaceMonodromy, the LefschetzPencilsAndVanishingCycles Part II), and Mellit's all-degree theorem
(PAPER-SCHIFFMANN-16/8, owned by CountingBundlesAndHallAlgebrasOfCurves), which item 119 and the route 12 brief say must
be imported for gcd(e,n) > 1. The route 12 brief names neither roadmap, and gaps S3 and S6 still treat Schiffmann's
paper as an unread outside supplier. Both design jobs (DESIGN-GlobalShtukasAndFunctionFieldLanglandsPartII and
DESIGN-CountingBundlesAndHallAlgebrasOfCurves) are pending, so as the files stand these statements will be planned
twice.

**Evidence.** PAPER-SCHIFFMANN-16 route 1 brief: 'It is the one owner of the counting polynomial A_{g,r,d} and of
Theorems 1, 2 and 3 with their corollaries (items 2, 3, 7, 10, 11 and 12), of Mellit's theorem (item 8), of
Krull–Schmidt for Coh(X) (item 15) and of the stable Higgs moduli (item 9). PAPER-YU-23 route 12
(GlobalShtukasAndFunctionFieldLanglandsCountingPartII) imports them by node id rather than plan its items 027, 036, 037,
046, 131 and 178 again.' RT-PAPER-SCHIFFMANN-16/3 (high, confirmed). Its fixes report: 'PAPER-YU-23, for one owner per
statement. I cannot edit this file ... Move items 027, 036, 037, 046, 131 and 178 out of route 12 into a new route with
this paper's route 1 id, title and area, and have route 12's brief import them.' The extraction never mentions
CountingBundlesAndHallAlgebrasOfCurves or PAPER-SCHIFFMANN-16. Also: PAPER-SCHIFFMANN-16, route 1 brief: 'It is the one
owner of the counting polynomial A_{g,r,d} and of Theorems 1, 2 and 3 with their corollaries (items 2, 3, 7, 10, 11 and
12), of Mellit's theorem (item 8), of Krull–Schmidt for Coh(X) (item 15) and of the stable Higgs moduli (item 9).
PAPER-YU-23 route 12 (GlobalShtukasAndFunctionFieldLanglandsCountingPartII) imports them by node id rather than plan its
items 027, 036, 037, 046, 131 and 178 again.' Route 1 reason: '… and the LefschetzPencilsAndVanishingCycles Part II for
the density (route 3). Yu's route 12 imports them.' PAPER-SCHIFFMANN-16/11 note: 'PAPER-YU-23/131 and /178 use these
statements; route 1 owns them (RT-PAPER-SCHIFFMANN-16/3).' PAPER-SCHIFFMANN-16/11 states Σ_n (−1)^n dim
H^n_c(Higgs^st_{r,d}(X_C)) t^n = t^{2(1+(g−1)r²)}A_{g,r,d}(t,…,t) and 'A_{g,r,d} is unitary of degree 2(1+(g−1)r²)';
PAPER-SCHIFFMANN-16/36 is the density of {σ_X} in T_g/W_g. In this extraction route 12 lists 027, 036, 037, 046, 100,
131 and 178, all 'missing'; item 100 states the density 'in the form of Schiffmann AppendixB used by Yu'; S6 says 'Read
Schiffmann's leading asymptotic and AppendixB density'. The paper uses exactly these inputs (arXiv v5, p. 65): 'Le
polynôme dans le théorème 1.1.1 est nécessairement unique par un théorème de densité des q-entiers de Weil, cf.
l'appendice B de [Sc16]'; p. 74: 'son polynôme de Poincaré … est donné par t^{2(1+n²(g−1))}A_{g,n}(t², t, …, t) (cf.
corollaire 1.3 de [Sc16])'.

**Fix.** Move 027, 036, 037, 045, 046, 131 and 178 out of route 12 into a new route with roadmap
CountingBundlesAndHallAlgebrasOfCurves, title 'Counting bundles over function fields: Hall algebras, Kac polynomials and
Higgs moduli' and area functionfields (the id, title and area of PAPER-SCHIFFMANN-16 route 1, so that make_queue merges
the two), keeping the verifier's qualifications: 037 in the characteristic range Yu states (Mozgovoy–Schiffmann for all
characteristics) and 046 with Mellit's all-degree theorem. In route 12's brief replace 'the coprime stable GL_n
coarse-moduli/mass adapter' by an import of these results from 'Counting bundles over function fields: Hall algebras,
Kac polynomials and Higgs moduli (CountingBundlesAndHallAlgebrasOfCurves)'. Also: Item 131: say in the note that the
statement is PAPER-SCHIFFMANN-16/11 (published Corollary 1.3), owned by CountingBundlesAndHallAlgebrasOfCurves and
imported by node id, not planned by route 12. Item 178: same import (published Corollary 1.5, in /11); keep only the
translation to Yu's variables (the unique degree-2D monomial of A_{g,n} is t^D, read off with a curve whose q, σ_1, …,
σ_g are multiplicatively independent, item 121). Item 100: either restate it as the uniqueness of P_{g,n} alone, proved
from items 121 and 120/140 as the review note already proposes, or import the density as PAPER-SCHIFFMANN-16/36 from
UniversalHypersurfaceMonodromy; do not plan the density in route 12. Item 119 and the correction in the route 12 brief:
import Mellit's theorem as PAPER-SCHIFFMANN-16/8. Add to the route 12 brief: 'Import Counting bundles over function
fields: Hall algebras, Kac polynomials and Higgs moduli (CountingBundlesAndHallAlgebrasOfCurves) for Schiffmann's
Theorems 1–3 and corollaries, Mellit's theorem, Krull–Schmidt for Coh(X) and the stable Higgs moduli, and Lefschetz
pencils, nearby cycles and vanishing cycles, Part II: universal hypersurface monodromy (UniversalHypersurfaceMonodromy)
for the density of Weil tuples; items 027, 036, 037, 046, 131, 178 and the density in 100 are imports, not new layers.'
Point S3 and S6 to PAPER-SCHIFFMANN-16 instead of the unread paper.

## All findings

| Finding | Severity | Kind | Where | Claim (abridged) |
|---|---|---|---|---|
| /1 | high | error | route 12 items PAPER-YU-23/003, /004, /006, /030, /101, /155, /156, … | Route 12 is a Part II of GlobalShtukasAndFunctionFieldLanglands: that roadmap is its first prerequisite, and its brief imports FunctionFieldArithmetic, … |
| /2 | high | error | PAPER-YU-23/064 (route 1), /013 (route 2), /127 (route 4, planned … | 064 (Lemme 5.3.3: a nonzero spherical cusp form is nonzero somewhere on G(A)^0) is routed to FunctionFieldArithmetic, where only FA.6 has cusp forms, but it … |
| /3 | high | error | PAPER-YU-23/125 (route 9, planned SchemeAndStackFoundations:SF.3) and … | 125 is planned at SF.3 but depends on 026 (vector bundles on X_1 with rank, degree and slope), which is planned at GS.0. GS.0 requires FA.6, and the chain FA.6 … |
| /4 | high | duplicate | route 3 (47 items) and route 4 (10 items); … | Routes 3 and 4 send Yu's function-field automorphic analysis (the discrete spectrum and Eisenstein residues of GL_n over F = F_q(X_1), Lafforgue's truncated … |
| /5 | high | duplicate | route 12: PAPER-YU-23/027, /036, /037, /045, /046, /131, /178; … | These route-12 items plan results that the accepted PAPER-SCHIFFMANN-16 route 1 (new roadmap CountingBundlesAndHallAlgebrasOfCurves, design job pending) owns … |
| /6 | medium | duplicate | PAPER-YU-23/100 and /134 (route 12) | 100 (Zariski density of the Weil tuples of genus-g curves, 'in the form of Schiffmann Appendix B') is the same statement as PAPER-SCHIFFMANN-16/36, which the … |
| /7 | medium | error | PAPER-YU-23/035 (route 6, planned … | 035 states Higgs bundles (E, θ: E → E ⊗ ω_{X_1}) and their slope (semi)stability, and is marked planned at ET.2b. ET.2b plans Higgs fields 'twisted by a chosen … |
| /8 | medium | library-claim | PAPER-YU-23/027 (note) | 027's note treats Krull–Schmidt as only planned ('Krull–Schmidt, planned for finite-length modules' in the Tau Ceti QuiverRepresentations roadmap) and says … |
| /9 | medium | error | PAPER-YU-23/060 (planned AS.1), /061 (planned AS.2), /024 (planned … | Several items are planned at an AutomorphicSpectralTheory layer that precedes material they need, so the named layer plans only part of them. 060 (induced … |
| /10 | medium | error | PAPER-YU-23/042 (route 5, planned DWP.7, WC.1 and EDC.2:pairings) and … | 042 bundles three statements with three owners (purity of H^i of a pure lisse sheaf, the duality H² ≅ H⁰(dual)^∨(−1), and the cohomological Euler product with … |
| /11 | medium | error | route 13 (PAPER-YU-23/099) and route 12 (PAPER-YU-23/098; … | 099, the only item of ClassicalGroupsPartII, depends on 098 (the ring R_g = Z[z_i, t/z_i]^W with its cone condition), which is in route 12, while route 12's … |
| /12 | medium | other | route 12 (roadmap id …; … | make_queue.py merges every accepted part-ii route with parent GlobalShtukasAndFunctionFieldLanglands into one job, … |
| /13 | medium | error | route 12 brief (statement of the final theorems); … | The brief does not state the final theorems as the paper does. (1) Théorème 1.1 holds for every k ≥ 1, every finite field F_q, every smooth projective … |
| /14 | medium | error | route 12 brief (imports) | The brief does not name its imports by exact title and id. Five titles are not the atlas titles: 'Function-field arithmetic', 'Automorphic spectral theory', … |
| /15 | medium | error | PAPER-YU-23/155 to /179 (dependencies and uses) and their consumers; … | The 25 items the review added have no dependencies and no uses recorded (both fields are null), and no older item lists them as a dependency, although their … |
| /16 | medium | missing | a new item (Drinfeld's rank-two count, equation (1.1.1)); … | Drinfeld's theorem (1.1.1) [Dr81], the result that Théorème 1.1 generalises (abstract: 'ce qui généralise un résultat de Drinfeld en rang 2 et prouve une … |
| /17 | medium | missing | PAPER-YU-23/040, PAPER-YU-23/112, PAPER-YU-23/114 (a new item: the … | The identity /Pic^0_{X_1}(F_{q^k})/ = Π_{i=1}^{2g}(1 − σ_i^k) = J_g(q^k, σ_1^k, …, σ_g^k), with J_g = Π_{i=1}^{g}(1 − z_i)(1 − t/z_i) and σ_iσ_{i+g} = q, is … |
| /18 | medium | missing | PAPER-YU-23/119; … | For gcd(e, n) > 1, item 119 and the brief say Théorème 1.4 'must be imported from Mellit [Me17]'. Mellit's theorem does not state it. Mellit proves that the … |
| /19 | medium | missing | PAPER-YU-23/067, PAPER-YU-23/054; … | The paper obtains (5.3.8) in one line, 'En appliquant le corollaire 4.2.6 pour e = −1', but Corollaire 4.2.6 does not apply as stated, and two compensating … |
| /20 | medium | missing | prerequisites; … | The prerequisites omit L. Lafforgue, 'Chtoucas de Drinfeld et conjecture de Ramanujan–Petersson', Astérisque 243 (1997), the source of Yu's function-field … |
| /21 | medium | missing | PAPER-YU-23/051, PAPER-YU-23/050 | Two results of Arthur 1981 that Yu uses in §4.2 have no item. Proposition 4.2.3 is proved by applying Arthur's Corollary 6.5, in Arthur's normalisation, and … |
| /22 | medium | missing | PAPER-YU-23/066 | The proof of Proposition 5.3.4, which computes every scalar in Proposition 5.1.1, rests on two cited results that no item states: the Euler factorization of … |
| /23 | medium | missing | PAPER-YU-23/068, PAPER-YU-23/069, PAPER-YU-23/130 and a new item | No item states Lafforgue's Ramanujan–Petersson theorem [Laf02, Théorème VI.10], which the paper cites twice in §6.1. No item states its consequence that … |
| /24 | medium | missing | PAPER-YU-23/042 (and PAPER-YU-23/068) | The Euler-characteristic formula χ(X, F1⊗F2^∨) = (2 − 2g)n1n2, which the paper cites from [Ra95, Théorème 1, p. 133], has no item of its own, and nothing plans … |
| /25 | low | error | the report (PAPER-YU-23.md): opening, 'Mathematical outcome and …; … | The report no longer matches the extraction or the atlas. (1) It opens with 'The result has 154 items: 11 library, 23 planned and 120 missing'; the extraction … |
| /26 | low | error | route 3 reason and route 6 reason | For a source route, the reason is the text make_queue hands to the target blueprint job, but the review's corrections were added only to route 12's brief. … |
| /27 | low | duplicate | PAPER-YU-23/138 (route 12) | 138 defines the mass Σ_[x] 1//Aut(x)/ of a finite groupoid inside route 12. The accepted PAPER-BERGSTROM-FABER-PAYNE-24 (item point-count-stack, route 2) gives … |
| /28 | low | library-claim | PAPER-YU-23/027 | Item 027's note says the uniqueness half of Krull–Schmidt 'can reuse the exchange argument of … QuiverRepresentations Layer 2 (Krull–Schmidt, planned for … |
| /29 | low | missing | a new sourceIssue (§1.2, p. 5, definition of [z^v]) | The coefficient notation used in (1.2.3) is defined only for v ⩾ 1, but (1.2.3) applies it with v = a_j = 0 for every j > n and for every part size j absent … |
| /30 | low | error | sourceIssues E1 | E1's 'printed' field quotes only 'P ∈ P(B)', which is the p. 9 wording. The second location E1 cites (§3.3.1, p. 18) does not contain that string. The review … |
| /31 | low | missing | PAPER-YU-23/046 | Item 046 records A_{g,n} ∈ Z[q, z_1^{±1}, …, z_g^{±1}] with the cone condition, but omits its W-invariance: it is symmetric in the z_i and invariant under z_i … |
| /32 | low | missing | PAPER-YU-23/054 | Corollaire 4.2.6 ends with 'par le lemme 4.2.5 et le théorème des résidus'. The argument principle it uses is a cited classical result with no item, and Tau … |
| /33 | low | error | sourceIssues E7, sourceIssues E37 | Two §§4–5 issues carry an 'affects' value that their own reasoning contradicts. E7 (H^e_Q printed in a_L^G) is a membership label: the displayed vector and … |
| /34 | low | other | PAPER-YU-23/060, PAPER-YU-23/153, gaps S2, sourceIssues E8 … | The review settled the induction convention of §5.2.2/§5.3.2: ρ_R = δ_R^{1/2}, membership ρ_R^{−1}φ/_M ∈ π and spherical basis φ_R = ρ_Rφ_π, the p. 39 exponent … |
| /35 | low | error | route 12 brief (correction bullet on (5.3.2)); … | The brief's bullet 'In (5.3.2) (Proposition 5.3.4) the normalising factor pairs each root with L(Π_i × Π_j^∨), not L(Π_j × Π_i^∨)' does not say which root is … |
| /36 | low | missing | sourceIssues (§§4–5) | Six slips in §§4–5 are not recorded. (1) Théorème 4.2.4 says 'dans la première somme, F parcourt ...', but F indexes the second sum. (2) End of its proof: 'F ⊆ … |
| /37 | low | error | PAPER-YU-23/051, PAPER-YU-23/054, PAPER-YU-23/055 | Three §4 statements are incomplete as written. Item 051 omits that (c_Q) and (d_Q) are (G,M)-families on a neighbourhood of 1, that (cd)_Q = c_Qd_Q, that d_L … |
| /38 | low | library-claim | PAPER-YU-23/172 | Item 172 (the zero–pole index N−P on the open unit disc) is marked missing and cites no library declaration. Mathlib already has the divisor of a meromorphic … |
| /39 | low | error | PAPER-YU-23/042, PAPER-YU-23/072, PAPER-YU-23/079, sourceIssues E14 | Several §6 locators lack a page or give the wrong one. 042 ('Proposition6.1.1 proof; WeilII and trace/duality inputs') has no page; the proof is on pp. 42–43. … |
| /40 | low | error | PAPER-YU-23/122 (statement and note), PAPER-YU-23/121 (statement) | Item 122 adds the hypothesis that P takes integer values 'for all choices of paired eigenvalues', and its note says the re-indexing in the proof makes this … |
| /41 | low | error | PAPER-YU-23/109 (locator and proof outline) | The locator 'Theorem1.1(1) p3; §7.2 with Sc16 asymptotics' suggests that §7.2 proves the top-weight assertion with Schiffmann's asymptotics. It does not: §7.2 … |

## Notes for the fix job

- **Cycles first.** Give each shared definition an owner upstream of all its consumers (003 planned at DWP.5; the twist
  and Fix(π) items at GS.6 and FA.6; 013, 127, 128 at FA.6; split 125), then rerun a stage-level projection of the item
  dependencies.
- **One function-field owner.** Move the function-field spectral theory and the §6 L-function items out of AS and AL.3,
  into route 12 beside PAPER-YUN-ZHANG-17/45 or into a function-field Part II of AutomorphicSpectralTheory.
- **Schiffmann.** Move the counting items to the CountingBundlesAndHallAlgebrasOfCurves route and import them in route
  12's brief, as RT-PAPER-SCHIFFMANN-16/3 decided; item 100 and 134 go with the Lefschetz Part II.
- **Brief and prerequisites.** State Théorèmes 1.1–1.4 exactly, add the missing cited inputs, and list Lafforgue 1997,
  Chavdarov, Larsen, Mœglin–Waldspurger, Deligne–Flicker, Arthur 1982 and Simpson.
