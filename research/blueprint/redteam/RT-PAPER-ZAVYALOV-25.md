# RT-PAPER-ZAVYALOV-25

Red team of the accepted extraction PAPER-ZAVYALOV-25: Bogdan Zavyalov, *Mod-p Poincaré Duality in p-adic analytic
geometry*, Annals of Mathematics 201 (2025), 647–773 (arXiv 2111.01830v3). Issue #4035.

Red team: Claude Code, session `cc-c2c06b`, 1 October 2026. I did not write or review:
- the extraction (`cc-39fac3`, PR #2101);
- its review, REV-PAPER-ZAVYALOV-25 (`cc-d67081`, PR #2352).

Disclosure: this session wrote FIX-RT-AREA-padic-1~2, which edited the AdicSpacesPartII packet. The finding on route 4
concerns that blueprint's sources and coverage, which the fix did not change.

**Result: 63 findings, 7 high, 31 medium and 25 low.**

## Method

**The source.** arXiv 2111.01830v3 (<https://arxiv.org/abs/2111.01830v3>) was re-downloaded on 2026-10-01 with its LaTeX
source. Its SHA-256 is `a984d973…2c951`, equal to the extraction's. The published Annals text is paywalled and was not
read, so every misprint finding is scoped to v3.

**The passes.** All 101 pages were read against the extraction in five parallel passes run by this session:
- §§1–2 (pp. 1–30);
- §3 (pp. 30–48);
- §4 (pp. 48–74);
- §5 with Appendices A–D and the bibliography (pp. 74–101);
- the routes and statuses, against `data/atlas.json`, the blueprint packets, the AnalyticStacks roadmap,
  `make_queue.py`, the accepted restructures, other papers' accepted routes and the pinned libraries.

**Cited sources.** The §5 pass read Berkovich's 1993 paper (Numdam) to check Theorem 5.3.3.

**Merging.** I merged findings reported by more than one pass:
- the AS.1 route, which three findings raised;
- the characteristic hypothesis of §5, with item 123;
- the TB.0 duplication;
- item 117, item 121, and the p-torsion items of the H3 route;
- the library declarations, and the torus-duality input of Lemma 4.3.10;
- the stale planned stages of items 89, 132 and 140.

**What I re-verified myself:**
- the §2.7 hypothesis that K is algebraically closed, which item 44 drops (TeX);
- AS.1's text in the AnalyticStacks roadmap: a formalism in which all maps lie in P, with nothing on universally
  coherent schemes or compactification-built f^!;
- Lemma 4.2.15's multiplication isomorphism: with n_1 = 1, t_{1,0}·t_{1,1} = ϖ_1 lands in ϖ_1O_C;
- §5's standing mixed-characteristic hypothesis, absent from §1.4 and from the items, and Λ = ℤ/n for any n in §5.3;
- the missing [−2d] in Theorem 5.5.2, against the degree-wise statement of Theorem 5.4.2;
- the AdicSpacesPartII blueprint's sources, R2/F0 coverage and nodes, for route 4;
- the node H3/berkovich-taut-comparison and the earlier review that rejected a TB.0 route.

**Scope of the high findings.** Four are slips or dropped hypotheses in statements the paper uses correctly; three are
routing errors. None refutes the paper's theorems. The full list of what was checked is in the result's `checked` field.

## The high findings

### /1 — error

**Where.** PAPER-ZAVYALOV-25/44 (also /46, which uses its Tr_f)

**Claim.** Item 44 drops the standing hypothesis of §2.7 that O_K is a complete rank-one valuation ring with
algebraically closed fraction field K. Without it the extracted statement is false. The uniqueness clause quantifies
over models with geometrically reduced special fibres, and over a general K there may be none: then the condition is
vacuous and every map satisfies it. Existence is also proved only through Theorem 2.7.1, which needs K algebraically
closed. Item 46 (Lemma 2.7.9, Tr_f = Tr^expl_f) is meaningless without item 44 and inherits the defect.

**Evidence.** §2.7, p. 25: 'Throughout this section, we fix a base formal scheme S = Spf O_K for a complete rank-1
valuation ring O_K with a pseudo-uniformizer ϖ and algebraically closed fraction field K … The reason we need to assume
that K is algebraically closed is due to the following fact: Theorem 2.7.1.' Theorem/Definition 2.7.6, p. 27: 'there is
a unique trace morphism Tr_f … such that, for each morphism 𝔣 : 𝔛 → 𝔜 of admissible formal O_K-models with geometrically
reduced special fibers satisfying 𝔣_K = f, the following diagram … commutes'; proof: 'Uniqueness is clear because s_𝔛
and s_𝔜 are isomorphisms. In order to prove existence, Theorem 2.7.1 implies …'. Counterexample to the extracted
wording: take K = Q_p and X = Y = D = Sp(Q_p⟨T,S⟩/(T² − pS)), the disc |T| ≤ |p|^{1/2}, with f = id (proper, smooth,
qcqs, separated, pure dimension 1). Suppose 𝔜 is a model of D with reduced special fibre, and take an affine open Spf B
whose generic fibre contains the Gauss point η of D. By the paper's Lemmas B.6–B.7, B = (B_K)° and B/pB is reduced. Then
some cT ∈ B has nonzero reduction, and that reduction is not nilpotent, so |T|_sup on Sp(B_K) equals |c|^{-1} ∈ p^Z. But
it equals |T(η)| = |p|^{1/2}. So no such model exists, the condition is vacuous, and both 0 and id : Ω^1_D → Ω^1_D
satisfy it.

**Fix.** Restate item 44 with 'Let O_K be a complete rank-one valuation ring with algebraically closed fraction field K
(the standing hypothesis of §2.7)'. Do the same for item 46. Add the standing hypothesis to items 42 and 43, which the
paper proves only in that setting.

### /2 — error

**Where.** routes[1] (source route to AnalyticStacks:AS.1, items PAPER-ZAVYALOV-25/12–/30); PAPER-ZAVYALOV-25 route 2
(source AnalyticStacks:AS.1; items 12–25), and the Part II brief's import of AS.1 'f^!, relative dualizing complexes,
ω_X'; PAPER-ZAVYALOV-25 route 2, items 26–30 (§2.3: depth, weakly associated primes,
flatness/torsion-freeness/reflexivity of ω_X); PAPER-ZAVYALOV-25 route 2 (AS.1) versus route 3 (L2)

**Claim.** AS.1 does not plan the mathematics routed to it, so the 19 items would be orphaned. The route says they
'belong inside existing layers' of AS.1. AS.1's quasi-coherent target is Scholze's Lecture VIII formalism 'in which all
maps lie in P', so f_! = f_* for every map and f^! is the right adjoint of f_*. For a non-proper open immersion j that
right adjoint is not j^*. The paper's f^! (Theorem 2.2.3) is the Stacks Project's compactification-built upper shriek on
D^+_qc, with f^! ≅ Lf^* for open immersions. AS.1 also plans nothing on nonnoetherian finiteness (Kiehl/Fujiwara–Kato),
relative dualizing complexes in the sense of Stacks 0E2T, amplitude bounds, or finite-flat trace compatibility. Nothing
of §2.3 is in its scope (Gabber–Ramero depth, weakly associated primes, torsion-freeness, reflexivity of ω over a
rank-one valuation ring). Yet Theorem 2.3.7 feeds Theorem 2.5.5 and hence Faltings' trace, so it is on the critical path
to the main theorem. Also: AS.1 does not plan the upper-shriek functor these items need. Zavyalov's §2.2 builds the
classical Deligne–Hartshorne/Stacks pseudo-functor on D^+_qc through finitely presented compactifications, with f^! ≅
Lf^* for open immersions and étale maps. AS.1 plans Scholze's 'Option 1' quasi-coherent formalism, in which every map is
proper. Its f^! is the right adjoint of f_* for every map, which differs from the classical f^! for every non-proper
map. Items 14, 15, 21 and 22, and through them ω^•_𝔛 = R lim f_n^!O for non-proper admissible 𝔛 (Theorem 2.4.4), would
be false as stated for AS.1's functor. The route is also inert. AnalyticStacks is a draft outside the atlas, and the
queue only creates blueprint jobs for atlas roadmaps, so no job exists to receive the source. Also: Items 26–30 are not
inside AS.1. Items 26–27 are ring-level depth and associated-prime theory, whose atlas owner is
DeformationAndDerivedPatchingAlgebra R03.3. Items 28–30 concern the dualizing module of flat finitely presented
O_K-schemes with reduced special fibre, and are used only for Theorem 2.5.5 in the Part II. Also: Theorem 2.2.3 (item
14) needs Corollary 2.1.5 (item 11, the cofiltered Comp_fp, routed to AdicCoefficientsAndComparisons L2). AnalyticStacks
does not have AdicCoefficientsAndComparisons among its prerequisites, and the route does not record the needed L2 → AS.1
link. Adding the link creates no cycle.

**Evidence.** AnalyticStacks AS.1 (research roadmap, status draft): '*Quasi-coherent formalism* (Lecture VIII). Derived
schemes modelled on animated rings (§8.1). Grothendieck–Serre duality for proper smooth maps (Theorem 8.1). The
formalism X ↦ D_qc(X) on derived schemes in which all maps lie in P, extended to stacks by Theorem 5.19.' The whole
AnalyticStacks roadmap contains no occurrence of 'compactif', 'noetherian', 'depth', 'reflexive' or 'upper shriek'; no
stage of data/atlas.json mentions 'Grothendieck duality' or 'upper shriek'. Paper, Theorem 2.2.3(2), p. 11: 'for an open
immersion f : X → Y, f^! ≃ Lf^*(−)'; §2.3, p. 15: 'we restrict our attention to flat, finitely presented schemes over a
rank-1 valuation ring'. Also: AS.1 stage text: 'Grothendieck–Serre duality for proper smooth maps (Theorem 8.1). The
formalism X↦D_qc(X) on derived schemes in which all maps lie in P'. Scholze, Six-Functor Formalisms (arXiv 2510.26269v2)
§8.3 'Option 1: All maps are proper': '(We are reluctant to denote this by f^! in general, as f^! has a standard meaning
in coherent cohomology, but for proper maps it is the correct functor.)' §8.2 adds that for open immersions the pullback
'− ⊗_A A[1/g] … does not admit a left adjoint'. Item 14: 'f^! ≅ Lf^* for an open immersion f'. Item 22: 'For étale f in
FPS_S … f^! ≅ Lf^*'. research/blueprint/roadmaps/AnalyticStacks.json has 'status: draft'. make_queue.py builds `roadmaps
= {r["id"]: r for r in atlas["roadmaps"]}` and runs add_blueprint over atlas roadmaps only. queue.json has no job whose
roadmapIds contain AnalyticStacks. Also: R03.3 stage text: 'Develop regular sequences, depth, Cohen–Macaulay
rings/modules … Give equidimensionality, associated-prime and support lemmas for finite modules.' PAPER-CESNAVICIUS-21
(accepted), route 4 to R03.3, reason: 'Fix FIX-RT-PAPER-CESNAVICIUS-21 … moved the ring-level duality items here from
route 5'. Its route 5 reason: 'AS.1's contract plans none of that ring-level theory, so AS.1 imports it from R03.3'. The
AS.1 text mentions no depth, local cohomology or reflexivity. Also: research/blueprint/roadmaps/AnalyticStacks.json
prerequisites: ['DerivedDeRhamCohomology', 'EnhancedDerivedSheaves', 'SchemeAndStackFoundations', 'SolidAnalyticRings'].
Item 14's note: 'The proof adapts [Stacks 0DWE]/[0A9Y] with finitely presented compactifications (Corollary 2.1.5)'.
data/atlas.json has no edge from AdicCoefficientsAndComparisons into AnalyticStacks or its consumers.

**Fix.** Withdraw route 2. Route items 12–30 in one of two ways. Either use a `new` route, for example coherent
Grothendieck duality for schemes: Stacks Tag 0DWE's f^! over noetherian bases and its extension to universally coherent
bases (§2.2), relative dualizing complexes, and depth and reflexivity of ω over rank-one valuation rings (§2.3). Or add
them as a first layer of the proposed Part II, before its layer (1). Remove 'AS.1 … Grothendieck duality for universally
coherent schemes' from the Part II brief's import list. Also: Either route items 12–25 to a named AS.1 substage for the
classical pseudo-functor (e.g. AS.1:classical-upper-shriek: D^+_qc over FPS_S via L2's Comp_fp, with j^! = j^*, flat
base change and the smooth/étale cases), stating that it is distinct from Option 1 and comparing the two for proper
maps; or move items 12–25 into the Part II as a prefix layer 'Grothendieck duality over universally coherent bases'.
Note in the route that AnalyticStacks has no blueprint job yet, and make the Part II brief import name the classical
functor explicitly. Also: Re-route items 26–27 as a source of DeformationAndDerivedPatchingAlgebra:R03.3, flagging the
non-Noetherian (|Spec R| Noetherian, Gabber–Ramero) form. Move items 28–30 into the Part II's layer (1) next to Theorem
2.5.5. Also: Record the link AdicCoefficientsAndComparisons:L2 → (the owner of items 14–25) in route 2's reason, or in
the Part II if finding 3's fix moves those items there.

### /3 — error

**Where.** PAPER-ZAVYALOV-25/87 (and sourceIssues)

**Claim.** Item 87 states that the weight pieces multiply isomorphically, 'R^+ = ⊕̂_{χ∈X(T)} V_χ (4.6) with V_χ ⊗ V_χ′ ≅
V_{χ+χ′}'. This copies a false claim of the paper. The multiplication map V_χ ⊗ V_χ′ → V_{χ+χ′} is injective but is an
isomorphism only when the relevant ϖ_i are units, i.e. in the smooth case. For a genuinely semistable or polystable
chart (ϖ_i ∈ 𝔪) it fails already for integral characters (m = 0). The extraction neither corrects the item, as §18
requires ('Items and nodes use the corrected statements'), nor records the mistake in sourceIssues.

**Evidence.** §4.2.2, p. 53, display after (4.6): 'And the multiplication in R+ is induced by canonical isomorphisms V_χ
⊗ V_χ′ ∼→ V_{χ+χ′}.' Lemma 4.2.15, p. 54: 'the multiplication map on R+_m induces isomorphisms V_χ ⊗ V_χ′ ∼→ V_{χ+χ′}
for each χ, χ′ ∈ (1/p^m)X(T).' Counterexample: take l = 1, n_1 = 1 and R+ = O_C⟨t_0,t_1⟩/(t_0t_1 − p). Then X(T) =
Z²/Z(1,1). Take χ = class of (1,0), so −χ = class of (0,1). The paper's normalisation (p. 53: subtract the smallest
a_{i,j} in each block) gives V_χ = O_C·t_0, V_{−χ} = O_C·t_1 and V_0 = O_C. Multiplication sends t_0 ⊗ t_1 ↦ t_0t_1 = p,
so the image is pO_C ≠ O_C. In general, for normalised exponent vectors a, a′ one has t^a·t^{a′} = ∏_i
ϖ_i^{c_i}·t^{norm} with c_i = min_j(a_{i,j}+a′_{i,j}). The paper uses the isomorphism only when ϖ is a unit: Lemma
4.2.21, and Proposition 4.3.6 Case 1, p. 61, 'V_χ ⊗ V_−χ ≃ O_C via the multiplication map'. Elsewhere it uses only
V_χ·V_χ′ ⊂ V_{χ+χ′}: Corollary 4.3.7 and Theorem 4.3.15, 'R+_χ pairs non-trivially only with elements of R+_−χ'. So no
stated result is affected.

**Fix.** Restate item 87 as follows. Multiplication gives injective O_C-linear maps V_χ ⊗ V_χ′ → V_{χ+χ′} whose image is
∏_i ϖ_i^{c_i}·V_{χ+χ′}. Here c_i = min_j(a_{i,j}+a′_{i,j}) for the normalised exponent vectors, and ϖ_i^{c_i} means
(ϖ_i^{1/p^m})^{p^m c_i}. The maps are isomorphisms when every ϖ_i is a unit. Add a sourceIssue: kind error; locator
§4.2.2, p. 53 (display after (4.6)) and Lemma 4.2.15, p. 54; correction as above; reason, the t_0t_1 = p example;
affects nothing; known new.

### /4 — error

**Where.** PAPER-ZAVYALOV-25/116, /119, /120, /124, /127, /129, /130, /131 (and the conventions of /150, /152–/155);
PAPER-ZAVYALOV-25/123; route source ClassicalAdicEtaleCohomology:H3 (reason 'for all torsion coefficients'); report
§Routes item 5

**Claim.** These items state §5's theorems 'over K' or 'over C' with no characteristic hypothesis, but the paper's §1.4
lets K be any complete rank-one valued field and imposes mixed characteristic (0, p) only as a standing hypothesis of §5
(and of Appendices C–D). Without it the recorded statements are false: for K = F_p((t)) and X = P^1_K (d = 1),
H^2_ét(X_C, F_p) = 0 (Remark 1.1.5), so t_X : 0 → F_p is not an isomorphism (item 124) and the pairings of items 127,
129–131 are not perfect (H^0 = F_p pairs with 0); items 119–120 are statements about O_C/p, almost mathematics over 𝔪_C
∋ p and the twist O_C(−d) = O_C ⊗ Z_p(−d), all of which presuppose characteristic 0 and residue characteristic p (in
characteristic p, O_C/p = O_C and Z_p(1) = T_p(μ_{p^∞}) = 0); for a supersingular elliptic curve E over C of
characteristic p, H^1_ét(E, F_p) = 0 while H^1(E_ét, O^+)[1/ϖ] = H^1(E, O_E) ≅ C ≠ 0, so H^1(E_ét, O^+) is not almost
zero and item 116's primitive comparison fails. Only item 126 carries the hypothesis. Also: Item 123 states Berkovich's
trace for 'Λ = Z/n (n arbitrary)' over an unspecified K. Berkovich's construction (Ber93 §7.2, which the paper
translates) assumes n prime to char K; Zavyalov may take all n only because §5 assumes char K = 0. Routed to H3, a layer
over arbitrary non-archimedean fields, the recorded statement is false: for char K = p, n = p and f : P^1_K → Spa(K,
O_K) (fibres nonempty), R^2f_!Λ(1) has geometric stalk H^2(P^1_C, Λ(1)) = 0 (Λ(1) = μ_p is the zero sheaf in
characteristic p, and H^2(P^1_C, F_p) = 0 anyway by Remark 1.1.5), contradicting property (4). Berkovich's theorem also
asserts that the traces are uniquely determined by its properties, which item 123 drops (see the next finding).

**Evidence.** §1.4, p. 8: 'Let K be a complete rank-1 valued field … We denote by C := K̂̄ the completed algebraic
closure of K.' §5.1, p. 74: 'Throughout this section, we fix a complete rank-1 valued field K … We also assume that O_K
is of mixed characteristic (0, p). We denote the completed algebraic closure of K by C.' Remark 1.1.5, p. 3: 'for a
proper rigid-analytic K-space X of dimension > 0 and a prime ℓ = char K, one can see H^{2d}_ét(X_K̂̄, F_ℓ) = 0 showing
that there is no chance to have duality in this case.' Appendix C, p. 95: 'Now we assume that K is of mixed
characteristic (0, p)'; Appendix D, p. 95: 'we fix a complete, algebraically closed rank-1 valued field C of mixed
characteristic (0, p)'. [Sch13a, Theorem 5.1] (item 116) is for 'K an algebraically closed complete extension of Q_p'.
Also: Berkovich, Publ. IHÉS 78 (1993), §7.2, p. 130: 'In this subsection we fix an integer n which is prime to the
characteristic of the field k.' Theorem 7.2.1, p. 131: 'One can assign to every separated smooth morphism φ : Y → X of
pure dimension d a trace mapping Tr_φ : R^{2d}φ_!(μ_n^{⊗d}) → (Z/nZ)_X. These mappings have the following properties and
are uniquely determined by them: a) … compatible with base change; b) … compatible with composition; c) if d = 0 … the
trace mapping from §5.4; d) … curves … from §6.2. Furthermore, if the fibres of φ are nonempty, then Tr is an
epimorphism.' Zavyalov §5.3, p. 77: 'For the rest of the section, we fix a ring Λ = Z/nZ for some n > 0', under §5.1's
'O_K is of mixed characteristic (0, p)'. Remark 1.1.5, p. 3 gives H^{2d}(X_K̂̄, F_ℓ) = 0 for ℓ = char K.

**Fix.** Prefix items 124, 127, 129, 130, 131 with 'Let K be a complete non-archimedean field of mixed characteristic
(0, p) and C = K̂̄'; in items 116, 119, 120 replace 'over C' by 'over C, the completed algebraic closure of a field K of
mixed characteristic (0, p) (equivalently, C algebraically closed, complete, of characteristic 0 with residue
characteristic p)'; add 'O_K perfectoid of mixed characteristic (0, p)' to item 150 and 'C algebraically closed of mixed
characteristic (0, p)' to items 152–155. Carry the hypothesis into the Part II brief's statements of Theorems
5.2.4–5.2.5, 5.4.2, 5.4.5, 5.5.2, 5.5.4 and 5.5.6. Also: Restate item 123 as: 'Let K be a complete non-archimedean field
and n ≥ 1 an integer invertible in K (for K of characteristic 0, every n ≥ 1; this is the case used, including n = p^m
with p the residue characteristic) …', keep (1)–(4), and add Berkovich's uniqueness clause. Replace 'for all torsion
coefficients' in the H3 route reason, the Part II brief and the report by 'for all n invertible in K'. Correct the
locator to '§5.3, pp. 77–78' (the □ construction is on pp. 77–78; Theorem 5.3.3 and its proof are on p. 78).

### /5 — error

**Where.** PAPER-ZAVYALOV-25/129, /130, /131; route part-ii brief ('the derived pairings RΓ_ét(X_C, Λ) ⊗^L RΓ_ét(X_C,
Λ(d)) → Λ are perfect'); sourceIssues (missing entry)

**Claim.** The paper's derived p-adic duality theorems omit the shift [−2d]: the pairing and the duality morphism land
in Λ = Z/p^n, Z_p, Q_p instead of Λ[−2d]. As printed (and as copied into items 129–131 and the brief) the statements are
false for d > 0, and there is no map RΓ(X_C, Λ(d)) → Λ induced by t_X, which is defined on H^{2d}. Example: X = P^1_C, d
= 1: RΓ(X, Z/p^n) ≅ Z/p^n ⊕ Z/p^n[−2] but RHom(RΓ(X, Z/p^n(1)), Z/p^n) ≅ Z/p^n ⊕ Z/p^n[2]. The intended statement is
clear from Theorem 5.1.1 (target O^a_C/p(−d)[−2d]) and from the degree-wise corollary in Theorem 5.5.6. The extraction
records no sourceIssue for it.

**Evidence.** Theorem 5.5.2, p. 81: 'RΓ_ét(X_C, Z/p^nZ) ⊗^L_{Z/p^nZ} RΓ_ét(X_C, Z/p^nZ(d)) −∪→ RΓ_ét(X_C, Z/p^nZ(d))
−t_{X,Z/p^nZ}→ Z/p^nZ is a perfect Galois-equivariant pairing'; proof: 'the duality morphism D_{X,Z/p^nZ} : RΓ_ét(X,
Z/p^nZ) → RHom_{Z/p^nZ}(RΓ_ét(X, Z/p^nZ(d)), Z/p^nZ)'. Theorem 5.5.4, p. 82: '… −t_{X,Z_p}→ Z_p'. Theorem 5.5.6, p. 82:
'… −t_{X,Q_p}→ Q_p'. Contrast Theorem 5.1.1, p. 74: '… −Tr_X→ O_C^a/p(−d)[−2d]'.

**Fix.** In items 129–131 and the brief, write the pairings as RΓ(X_C, Λ) ⊗^L_Λ RΓ(X_C, Λ(d)) → RΓ(X_C, Λ(d)) →
H^{2d}(X_C, Λ(d))[−2d] −t_{X,Λ}[−2d]→ Λ[−2d], and D_{X,Λ} : RΓ(X_C, Λ) → RHom_Λ(RΓ(X_C, Λ(d)), Λ[−2d]). Add sourceIssue
a new sourceIssue (kind misprint, locator Theorems 5.5.2, 5.5.4, 5.5.6 and the proof of 5.5.2, pp. 81–82, arXiv v3;
correction: target Λ[−2d]; affects: nothing, the intended meaning being fixed by Theorem 5.1.1 and the degree-wise
statement of 5.5.6).

### /6 — missing

**Where.** PAPER-ZAVYALOV-25 route 4 (source AdicSpacesPartII:R2, F0; items 41, 141–146); Part II brief import 'via the
source route the Reduced Fibre Theorem, Elkik's algebraization and Appendix B'

**Claim.** The seven items routed to AdicSpacesPartII are orphaned. The AdicSpacesPartII blueprint was written and
accepted after this extraction's routes were accepted, but it never took the paper as a source. Its R2 and F0 coverage
is closed with nothing remaining, and no continuation job exists. So these items get no blueprint: the Reduced Fibre
Theorem B.9, Theorem 2.7.1 (BLR localisation), Elkik–Temkin algebraisation with pure relative dimension (B.5), dimension
of models (B.2–B.4), connected components (B.12) and good dense opens (B.13–B.15). The Part II's layer (1) (Theorem
2.5.5, Lemma 2.7.3) and Definition 5.2.1 (existence of nice models) import things nobody plans. Naming F0 is also stale:
RS-05 narrowed F0 to Noetherian formal geometry and made R2 the owner of admissible formal models.

**Evidence.** REV-PAPER-ZAVYALOV-25 was merged 2026-09-23 (#2352). BP-AdicSpacesPartII was first committed 2026-09-26
(#2924), and its reviewHistory reads 'status: accepted … date: 2026-09-28' (REV-AdicSpacesPartII).
research/blueprint/packets/AdicSpacesPartII.json has 43 sources, including Zavyalov's 'Quotients…' and 'Some
foundational results…'. arXiv 2111.01830, BLR IV and Temkin 2017 are not among them, and no node states the Reduced
Fibre Theorem or Elkik algebraisation over O_K. The coverage entries are AdicSpacesPartII:R2 'source_decomposed,
remaining: []' and AdicSpacesPartII:F0 'source_decomposed, remaining: []'. F0's note says: 'The analytic paragraph of
the F0 stage text (… formal-model comparisons) is realised by R0–R3 and has no F0 nodes.' In queue.json,
BP-AdicSpacesPartII is 'done' and REV-AdicSpacesPartII is 'done', with no BP-AdicSpacesPartII~2. RS-05.result.json gives
F0 'narrow: Noetherian Spf, …' and the owner of 'Type-(S)/admissible formal models, generic fibers and formal/analytic
geometry' as AdicSpacesPartII:R2. One part is covered: the claim 'if A_k is reduced then A = A°_K' in item 143 is node
AdicSpacesPartII:R0/reduced-reduction-ring-of-definition ('If A₀/ϖA₀ is a reduced ring, then A₀ = A°').

**Fix.** Mark the 'A = A°_K' half of item 143 as planned at AdicSpacesPartII:R0 (node
R0/reduced-reduction-ring-of-definition). Then take one of two routes. (a) Move items 41, 141, 142, 144, 145, 146 and
the rest of 143 into the Part II as a layer 'admissible formal models with reduced special fibre' that imports
AdicSpacesPartII:R2. (b) Hand them to a FIX/continuation of the finished AdicSpacesPartII packet, with arXiv 2111.01830
App. B, BLR95 and Temkin 2017 as sources and new R2 nodes. Drop F0 from the route in either case. Update the Part II
brief's AdicSpacesPartII import to match.

### /7 — duplicate

**Where.** PAPER-ZAVYALOV-25 route 6 (source TropicalAndBerkovichArithmetic:TB.0; items 133–135); Part II brief import
of TB.0; PAPER-ZAVYALOV-25/134 (route source TropicalAndBerkovichArithmetic:TB.0), /138

**Claim.** Huber's equivalence between Hausdorff strictly analytic Berkovich spaces and taut adic spaces (Lemma A.7) is
already planned by ClassicalAdicEtaleCohomology H3. So are the categories (A)′/(An) and X_max (Definitions A.5–A.6).
Routing items 133–135 to TB.0 plans this a second time. The atlas already rejected exactly this routing for another
paper. Also: Item 134 (Huber's equivalence (An) ≅ (A)′, Lemma A.7) is routed to TB.0 as missing. The H0–H3 blueprint
packet (unreviewed, written after the extraction) plans the same statement in node
ClassicalAdicEtaleCohomology:H3/berkovich-taut-comparison (a), and in part (c) the overconvergent comparison of Lemma
A.18 (Hub96 Theorem 8.3.5), which is item 138. If both routes are applied, the equivalence is planned twice.

**Evidence.** Node ClassicalAdicEtaleCohomology:H3/berkovich-taut-comparison
(research/blueprint/packets/ClassicalAdicEtaleCohomology--H0.json, #3281) reads: '(a) Huber's functor gives an
equivalence between Hausdorff strictly k-analytic Berkovich spaces and taut adic spaces locally of finite type over
Spa(k, k°) … X^Berk is identified with the set of rank-one points of X^ad and the continuous retraction … is the maximal
Hausdorff quotient … (c) For an overconvergent étale sheaf F … the étale cohomology of X^ad and of X^Berk … agree'. The
H3 coverage lists 'the Huber–Berkovich comparison (§8.3)' among H3's own gaps. PAPER-SCHOLZE-12.review.json, route 3:
'reject … Huber's equivalence between Hausdorff strictly k-analytic Berkovich spaces and taut adic spaces … is planned
by ClassicalAdicEtaleCohomology H3. See H3/taut-spaces-and-morphisms and H3/berkovich-taut-comparison (a) … Routing it
into TB.0 would plan it twice.' The TB.0 stage text plans only the affinoid comparison: 'Compare a strictly affinoid
algebra with its Huber adic spectrum by rank-one points'. Also: Packet ClassicalAdicEtaleCohomology--H0, node
ClassicalAdicEtaleCohomology:H3/berkovich-taut-comparison: '(a) Huber's functor gives an equivalence between Hausdorff
strictly k-analytic Berkovich spaces and taut adic spaces locally of finite type over Spa(k, k°) … (c) For an
overconvergent étale sheaf F … the étale cohomology of X^ad and of X^Berk … agree' (proof steps cite Hub96 Proposition
8.3.1 and Theorem 8.3.5). Zavyalov Lemma A.7, p. 85, and Lemma A.18, p. 87.

**Fix.** Set items 133 and 134 to planned at ClassicalAdicEtaleCohomology:H3 (node H3/berkovich-taut-comparison). Move
item 135 (the morphism classes under u) into route 5 (H3) next to Theorem A.15. Delete route 6. In the Part II brief,
replace the TB.0 import with H3/berkovich-taut-comparison. Also: Once that packet is reviewed, mark items 134 and 138 as
planned at that node, or keep the TB.0 route and have the H3 packet import the equivalence from TB.0. Record the
coordination in the route reason either way.

## All findings

| Finding | Severity | Kind | Where | Claim (abridged) |
|---|---|---|---|---|
| /1 | high | error | PAPER-ZAVYALOV-25/44 (also /46, which uses its Tr_f) | Item 44 drops the standing hypothesis of §2.7 that O_K is a complete rank-one valuation ring with algebraically closed fraction field K. Without it the … |
| /2 | high | error | routes[1] (source route to AnalyticStacks:AS.1, items …; … | AS.1 does not plan the mathematics routed to it, so the 19 items would be orphaned. The route says they 'belong inside existing layers' of AS.1. AS.1's … |
| /3 | high | error | PAPER-ZAVYALOV-25/87 (and sourceIssues) | Item 87 states that the weight pieces multiply isomorphically, 'R^+ = ⊕̂_{χ∈X(T)} V_χ (4.6) with V_χ ⊗ V_χ′ ≅ V_{χ+χ′}'. This copies a false claim of the … |
| /4 | high | error | PAPER-ZAVYALOV-25/116, /119, /120, /124, /127, /129, /130, /131 (and …; … | These items state §5's theorems 'over K' or 'over C' with no characteristic hypothesis, but the paper's §1.4 lets K be any complete rank-one valued field and … |
| /5 | high | error | PAPER-ZAVYALOV-25/129, /130, /131; … | The paper's derived p-adic duality theorems omit the shift [−2d]: the pairing and the duality morphism land in Λ = Z/p^n, Z_p, Q_p instead of Λ[−2d]. As … |
| /6 | high | missing | PAPER-ZAVYALOV-25 route 4 (source AdicSpacesPartII:R2, F0; … | The seven items routed to AdicSpacesPartII are orphaned. The AdicSpacesPartII blueprint was written and accepted after this extraction's routes were accepted, … |
| /7 | high | duplicate | PAPER-ZAVYALOV-25 route 6 (source TropicalAndBerkovichArithmetic:TB.0; … | Huber's equivalence between Hausdorff strictly analytic Berkovich spaces and taut adic spaces (Lemma A.7) is already planned by ClassicalAdicEtaleCohomology … |
| /8 | medium | error | PAPER-ZAVYALOV-25/20 | Item 20 restricts the base change g : S′ → S to morphisms in FPS_S. The paper allows any morphism of qcqs universally coherent schemes, and uses … |
| /9 | medium | error | PAPER-ZAVYALOV-25/7 | Item 7 defines a perfect pairing only for pairings into the unit, 'A ⊗ B → 1'. The paper's definition allows an arbitrary target object C, and every duality … |
| /10 | medium | missing | items PAPER-ZAVYALOV-25/12–/36 (no item for the universal coherence … | The paper applies the §2.2 formalism, which is stated only over a qcqs universally coherent base S, to S = Spec O_K for a rank-one valuation ring, to Spec … |
| /11 | medium | missing | PAPER-ZAVYALOV-25/41 (no item for Raynaud's theorem; … | Raynaud's theorem has no item: the generic fibre is an equivalence from admissible formal O_K-schemes, localized at admissible blow-ups, to qcqs rigid K-spaces … |
| /12 | medium | missing | items PAPER-ZAVYALOV-25/31–/40 (no item for coherent sheaves on … | §§2.4–2.6 rest on three cited facts that have no item and no planned owner. First, the theory of coherent O_𝔛-modules and D^b_coh(𝔛) on admissible formal … |
| /13 | medium | missing | PAPER-ZAVYALOV-25/30 (Theorem 2.3.7): no item for the Gabber–Ramero … | The key nonnoetherian input of Theorem 2.3.7 has no item: Gabber–Ramero's depth formula for an O_K-flat coherent module along a finitely presented morphism … |
| /14 | medium | other | sourceIssues (missed) / PAPER-ZAVYALOV-25/38 and the Conrad … | Missed gap: the proofs of Lemmas 2.5.3 and 2.5.4 cite [Con99, Lemma 2.1.4], whose hypothesis is a connected normal rigid space. Here 𝔛 is an arbitrary … |
| /15 | medium | error | PAPER-ZAVYALOV-25/9 and /11 | Item 9 does not state the definition of strictness: it says 'strict if it is an isomorphism over X in the appropriate sense'. Every morphism of … |
| /16 | medium | missing | sourceIssues (new entry, a new sourceIssue); … | The extraction misses a misprint in the defining diagram of Theorem/Definition 3.4.13. As printed, the left vertical arrow of diagram (3.7) is multiplication … |
| /17 | medium | error | PAPER-ZAVYALOV-25/70 | The item describes Faltings' trace as the reduction of Tr^+_{F,𝔛} 'via the projection formula and base change ω^•_𝔛 ⊗^L O_{𝔛_0} ≅ ω^•_{𝔛_0}'. The paper does … |
| /18 | medium | error | PAPER-ZAVYALOV-25/60 | The item has three errors. (1) It drops a necessary hypothesis: the paper takes X → T^d to be étale AND a composition of rational embeddings and finite étale … |
| /19 | medium | error | PAPER-ZAVYALOV-25/56 | The item ends 'hence 0 → Ω̂^n{−n} → Ω̂^n(−n) → Q → 0 with image (ζ_p − 1)^n' without the hypothesis that 𝔛 is smooth. The paper proves the sequence only for … |
| /20 | medium | missing | new items for the cited inputs of §3.4 (Corollary 3.4.9, Theorem … | Three results that §3.4 cites from elsewhere have no item. They appear only inside the notes of items 38, 62 and 64, contrary to PROTOCOL §16 ('A result the … |
| /21 | medium | error | PAPER-ZAVYALOV-25/108 | Item 108 restricts G-equivariant modules to 'a finite group G acting trivially on X'. Definition 4.4.4 is for a ringed site with an arbitrary right G-action. … |
| /22 | medium | error | PAPER-ZAVYALOV-25/77 | Item 77 states almost Grothendieck duality only for the structure morphism f_0 : 𝔛_0 → Spec O_C/p, with the global form RΓ(𝔛_0, RalHom(F, ω^{•,a})) ≅ … |
| /23 | medium | missing | PAPER-ZAVYALOV-25 items (Part II layer (0) imports from [Zav21a]) | No item defines the functor (−)^{L∆} from derived p-complete complexes to complexes on Spf S^+, or records the properties §4.2 uses. Those are: compatibility … |
| /24 | medium | missing | PAPER-ZAVYALOV-25 items (Part II layer (5)) | No item states the existence of geometric quotients of admissible formal O_C-schemes by finite groups, which Definition 4.4.2 presupposes and the proof of … |
| /25 | medium | missing | PAPER-ZAVYALOV-25/81 (or a new item in Part II layer (3)) | The extraction never records that polystable formal O_C-schemes have (geometrically) reduced special fibre, so that a separated polystable 𝔛 with generic fibre … |
| /26 | medium | missing | PAPER-ZAVYALOV-25/100 (cited input); … | The proof of Lemma 4.3.10 rests on two cited inputs: topological Poincaré duality with locally constant coefficients on the torus (S¹)^d = B(Z^d), and the … |
| /27 | medium | error | PAPER-ZAVYALOV-25/97 | The item drops every hypothesis of Lemma 4.3.5. It says only that 'RHom is compatible with completed tensor products (a Künneth formula, by derived Nakayama)', … |
| /28 | medium | missing | PAPER-ZAVYALOV-25/123, /129, /130; … | Definition 5.5.3 (t_{X,Z_p} := lim_n t_{X,Z/p^n}) and the proofs of Theorems 5.5.2 and 5.5.4 need the traces t_f for Λ = Z/p^n to be compatible with the … |
| /29 | medium | error | PAPER-ZAVYALOV-25/126 (note) | The note says Theorem 5.4.4 follows 'from Theorem 5.2.5 by the primitive comparison, Lemma 5.4.3 and the compatibility of Tr_X with t_X on each component … |
| /30 | medium | duplicate | PAPER-ZAVYALOV-25/117; … | Item 117 (Scholze's Corollary 3.17 comparing pro-étale and étale cohomology, and Proposition 3.12(vii) that X_proét is coherent) is marked missing and routed … |
| /31 | medium | error | Route source ClassicalAdicEtaleCohomology:H3 (items …; … | The H3 route sends to H3 the p-torsion parts of §5.3 and Appendix A: Lemma 5.3.2 and Theorem 5.3.3 for Λ = Z/p^n with p the residue characteristic, and the … |
| /32 | medium | missing | Items for Ber93's étale cohomology (none); … | The adic trace of Theorem 5.3.3 is defined as θ_Y^*(t^B_f), from Berkovich's trace for smooth separated morphisms of K-analytic spaces, and Theorem A.15 and … |
| /33 | medium | missing | No item; … | The trace t_X : H^{2d}_ét(X_C, F_p(d)) → F_p in the main theorem is built in the preamble of §5.4 and Remark 5.4.1. Étale F_p-sheaves on Spa(K, O_K) are … |
| /34 | medium | other | PAPER-ZAVYALOV-25 route 2 (items 13, 19, 20, 24) and the Part II brief | Section 15 requires a general theory to build on the special cases an existing roadmap builds, but neither the route nor the brief does. Tau Ceti … |
| /35 | medium | error | PAPER-ZAVYALOV-25/121 (Definition 5.3.1: dimension of locally …; … | Item 121 is planned by the accepted AdicEtaleGeometry blueprint, on top of a Mathlib definition. Routing it to H3 would create a second dimension notion for … |
| /36 | medium | duplicate | PAPER-ZAVYALOV-25/130 (Theorem 5.5.4, Z_p Poincaré duality) and /123 … | Ownership of p-adic Poincaré duality is split. GUO-REINECKE-24 sends to H3 'trace maps … inducing p-adic Poincaré duality'. This paper proves that duality … |
| /37 | medium | duplicate | PAPER-ZAVYALOV-25/49 (Bhatt: L̂_{O_C/Z_p} ≅ O_C{1}[1] and L̂ of … | Item 49 bundles two facts that accepted routes already own. The first half is planned at AI.0 by PAPER-BHATT-MORROW-SCHOLZE-18. The second half (the … |
| /38 | medium | library-claim | PAPER-ZAVYALOV-25/7 (perfect and almost perfect pairings); … | Mathlib already has perfect pairings of modules, contrary to the item and the report. This is exactly the degree-wise notion in the final theorems: H^i ⊗ … |
| /39 | low | other | sourceIssues (missed misprints in §§2.1–2.6) | Six misprints in the share are not recorded, each with an evident intended meaning and affecting nothing. (a) Definition 2.3.1 calls H^i_Z(F) the 'sheaf of … |
| /40 | low | other | PAPER-ZAVYALOV-25/147 and /37, /43; … | Appendix C defines the generic fibre F_K and proves Lemma C.8 only over a perfectoid O_K. §2.5 uses F_K over any complete rank-one O_K, for example a … |
| /41 | low | error | PAPER-ZAVYALOV-25/24, /26, /31, /36 (and /31–/40 generally) | Several statements drift from the paper's hypotheses. (a) Item 24 defines ω^•_{X/S} only for pure relative dimension d; the paper defines ω^• for every flat, … |
| /42 | low | error | PAPER-ZAVYALOV-25/25 versus /45 | Item 25 bundles two different things: the trace Tr_f : f_*O_X → O_Y of a finite locally free morphism, glued from Tr_{B/A}, and Lemma 2.2.16. It marks both … |
| /43 | low | missing | §1.4 conventions and §§2.3, 2.7 definitions with no item | Several definitions and conventions that the share uses have no item: (a) Tate twists Z_p(n), O_C(n) and F(n), with the canonical H^i(U, F(n)) ≅ H^i(U, F)(n), … |
| /44 | low | missing | §1.1, Theorem 1.1.1 (no item) | Theorem 1.1.1 (classical Poincaré duality for compact complex manifolds) has no item. The extraction says it read 'Theorems 1.1.1–1.1.4' and items the equally … |
| /45 | low | other | prerequisites | The share builds on works missing from prerequisites. Kiehl 1972 and Fujiwara–Kato 2018 supply Theorem 2.2.2, the finiteness that replaces noetherian … |
| /46 | low | missing | sourceIssues (misprints in §3 not recorded) | Besides E5, E6 and the Theorem/Definition 3.4.13 misprint above, §3 has further misprints whose intended meaning is clear and which the extraction does not … |
| /47 | low | error | PAPER-ZAVYALOV-25/57, /61, /62, /69, /71, /49 | Several items in the §3 share drop or alter hypotheses. Item 57 omits 'separated' and 'generic fibre of pure dimension d' from Definition 3.3.5; ω_𝔛 and r_𝔛 … |
| /48 | low | other | PAPER-ZAVYALOV-25/5 | Item 5 is planned at AdicEtaleGeometry:A1 and AInfCohomology:AI.3. AI.3 constructs the completed integral structure sheaf only 'on the analytic generic fiber X … |
| /49 | low | missing | PAPER-ZAVYALOV-25 items (Part II layer (3)) | Three cited commutative-algebra inputs of §4.2.3 have no item, contrary to §16 ('A result the paper cites from elsewhere is one item'). (i) [ČK19, Lemma 3.6]: … |
| /50 | low | other | sourceIssues (new); … | Definition 4.2.9 omits p-adic completeness, so Remark 4.2.10's claim that it coincides with BMS18 Definition 3.5 is false as printed. Item 84 silently … |
| /51 | low | other | sourceIssues PAPER-ZAVYALOV-25/E8 | E8 is correct but incomplete. The same Step 2 of the proof of Theorem 4.3.16 has two further slips in the commutative diagram that E8's sentence leads into: … |
| /52 | low | other | sourceIssues (new, §§4.2–4.3); … | Four misprints in §§4.2–4.3 are not recorded. (a) p. 53: the explicit V_χ is printed with product index 'i = 1 … n' instead of 'i = 1 … l'. (b) Proposition … |
| /53 | low | other | sourceIssues (new, §4.4) | Three misprints in §4.4 are not recorded. (a) Proof of Theorem 4.4.1 cites '[Zav21b, Theorem 1.3]' for the construction, while the statement cites Theorem 1.4. … |
| /54 | low | error | PAPER-ZAVYALOV-25/115; … | Three locators are wrong. Item 115 gives Theorem 4.4.24 as 'pp. 74–75', but the theorem and its proof lie entirely on p. 74, where §5 begins. Item 83 gives … |
| /55 | low | error | PAPER-ZAVYALOV-25/106 | Item 106 narrows Definition 4.4.2. It requires both formal schemes to be nice and both special fibres to be quasi-projective. The paper requires only that 𝔛′ … |
| /56 | low | error | PAPER-ZAVYALOV-25/92 | The sheaf version in item 92 applies the functors in the wrong order. It reads 'Lη_{1−ζ_p}(RΓ_cont(Γ, R^+_∞)^{L∆}) ≅ Lη_{1−ζ_p}Rν_∗Ô^+_X'. Corollary 4.2.28 … |
| /57 | low | other | PAPER-ZAVYALOV-25/110 (sourceIssues: gap) | Item 110 records 'O_C central suffices, Remark 4.4.13' as if it were established. The remark is an unproved blanket claim that 'almost all results' of [Zav21a, … |
| /58 | low | other | PAPER-ZAVYALOV-25/123 (proof route); … | The proof of Theorem 5.3.3 has three slips the extraction did not record. (a) It drops the Tate twist (d) from both t^B_f and t_f, although the statement has … |
| /59 | low | other | sourceIssues (missing entries); … | The extraction missed these misprints and citation slips in the share. (1) Lemma 5.2.2 states independence 'for any two choices of admissible formal … |
| /60 | low | other | prerequisites | The prerequisite list misses sources that the share cites as load-bearing inputs: Scholze's survey [Sch13b] (Theorem 3.17, finiteness for proper but possibly … |
| /61 | low | missing | No items (cited inputs of §5.4) | Two cited inputs of §5.4 have no item. (1) [Sch13a, Proposition 2.10], the classification of finitely presented torsion O_C-modules, is used in Theorem 5.4.2 … |
| /62 | low | error | PAPER-ZAVYALOV-25/140 (planned AdicSpacesPartII:F0) and /132 (planned …; … | The planned stage ids are stale against the accepted AdicSpacesPartII blueprint. Lemma B.1 is node R2/formal-rigid-properness-comparison, and F0 has no such … |
| /63 | low | other | PAPER-ZAVYALOV-25/58 (Ω^1(−1) ≅ R^1µ_*Ô), route 7 (P8) | Part of item 58 is already planned: the degree-one isomorphism for X smooth over a discretely valued k. The new content is the case over C and the exterior … |

## Notes for the fix job

- **Source issues.** Record the paper mistakes confirmed here under PROTOCOL §18: diagram (3.7), Lemma 4.2.15, the shift
  in Theorems 5.5.2–5.5.6, Conrad's lemma for non-normal generic fibres, and the smaller slips.
- **Routes 2, 4 and 6.** The AS.1 items need a real owner. The likeliest is the Part II itself, with the depth theory at
  R03.3. The Appendix B items of route 4 need a continuation of the AdicSpacesPartII blueprint, or a move into the Part
  II. Route 6 should be dropped in favour of H3.
- **H3 and the Part II.** The p-torsion items of the H3 route, and the split ownership of p-adic Poincaré duality with
  PAPER-GUO-REINECKE-24, should be settled together, so that no H3 → Part II → H3 cycle arises.
