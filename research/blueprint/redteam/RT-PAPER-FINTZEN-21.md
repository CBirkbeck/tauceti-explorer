# RT-PAPER-FINTZEN-21

Red team of the accepted extraction PAPER-FINTZEN-21: Jessica Fintzen, *Types for tame p-adic groups*, Annals of
Mathematics 193 (2021), 303–346 (arXiv 1810.04198v2). Issue #4073.

Red team: Claude Code, session `cc-c2c06b`, 1 October 2026. I did not write or review:
- the extraction (`codex-a71f92`, checkpoint PR #1835; `cc-7b31c4`, PR #1916);
- its review (`codex-c83e7a`, PR #2412), which corrected the packet in place.

Disclosures. Three findings cite earlier work of this session:
- I wrote FIX-RT-PAPER-KALETHA-16 (PR #5200), which applied RT-PAPER-KALETHA-16/1; /1 cites that finding as the
  precedent for its severity;
- I wrote REV-RT-PAPER-STEVENS-08 (PR #5392), which confirmed RT-PAPER-STEVENS-08/3, cited in /7;
- I wrote FIX-RT-PAPER-BOCKLE-HARRIS-KHARE-ETAL-19 (PR #5338), which edited the item list and reason of that
  extraction's route 2 but not its items 4 and 5, cited in /8 and /9.
The routes pass also checked my RT-PAPER-HANSEN-26 (PR #4940) and REV-RT-PAPER-CIUBOTARU-HARRIS-26 (PR #5378); no
finding rests on them.

**Result: 44 findings, 5 high, 25 medium and 14 low.**

## Method

**The source.** arXiv 1810.04198v2 (<https://arxiv.org/pdf/1810.04198v2>), the version the extraction read, was
re-downloaded on 2026-10-01 with its LaTeX source; its SHA-256 (`bd332fd7…8cc`) equals the extraction's. It has 39
pages. The published Annals text was not read.

**The passes.** Four parallel passes were run by this session.
- Three read all 39 pages against the TeX source: §§1–3, §§4–6, and §§7–8 with the references.
- One checked the four routes, the 9 planned items and the briefs against the atlas, the accepted restructurings RS-21
  and RS-31, other papers' accepted routes, earlier red teams and the pinned Mathlib (082e2d3).

**Merging.** I merged the normalized distance on the building, the locators of items 32a and 32b, and the prerequisite
entries copied from the Yu 2001 entry, each found by two passes.

**What I re-verified myself.** All five high findings:
- the route cycle, from research/blueprint/make_queue.py, which plans route 4 as ReductiveGroupsPartIII built on
  ReductiveGroupsPartII, and route 2's reason, which has RG2 import from route 4;
- Lemma 6.1.1(ii), with the GL_3 example: 1+ϖE_13 lies in (G_1)_{y,3/4} but not in (G_1)_{y,1} at y = x + (0,0,δ);
- Lemma 5.1(b), with the GL_3 example: exact equality would make A+M conjugate to A, which the characteristic polynomial
  rules out;
- Lemmas 7.5 and 7.7, from the K^H definitions and the proof in the TeX source, with the SL_2 example of depth 4;
- Yu's Proposition 14.1 and Theorem 14.2, from Remark 3.2 of Fintzen's Compositio paper (arXiv 1908.09819v2) and the
  citations of [Yu01, Proposition 4.6] and [KY17, 7.5] on p.36.

**Severity I changed.** Lemma 5.1(b) in item 16a is high, not medium: the item states exact identities that are false,
even though Corollaries 5.2–5.4 use them only modulo P.

The full list of what was checked is in the result's `checked` field.

## The high findings

### /1 — error

**Where.** route 2 (reason); route 4 and route 4 brief; PAPER-FINTZEN-21/9; the report (PAPER-FINTZEN-21.md), sections
Route 2 and Route 4

**Claim.** The routing makes ReductiveGroupsPartII (RG2) and the roadmap that route 4 becomes depend on each other.
Route 2 puts the Adler–Roche form /9 into RG2.1–RG2.3, and its reason tells RG2's blueprint to 'Import ... the new
good-prime consequences from route 4'. Route 4's brief says 'Export these early results to ReductiveGroupsPartII’s
invariant-form construction'. But route 4 is a Part II of tauceti:TauCetiRoadmap/ReductiveGroups, and the atlas already
has a Part II of that parent: ReductiveGroupsPartII itself. So paper_designs in research/blueprint/make_queue.py merges
route 4 into DESIGN-ReductiveGroupsPartIII, 'Reductive algebraic groups, Part III'. Its generated brief says that
ReductiveGroupsPartII 'continues tauceti:TauCetiRoadmap/ReductiveGroups: build on it'. RG2 would then import from a
roadmap that is built on RG2, while route 4's late items (/10b, /41) import /9 back from RG2. This leaves a two-way
dependency between the roadmaps. It becomes a stage cycle as soon as the Part III's first layer builds on RG2, which is
what PROTOCOL section 15 ('starts where the existing roadmap stops') and the merged brief both ask for. This is the
pattern confirmed as high in RT-PAPER-KALETHA-16/1. The extraction and the report never mention that this parent already
has a Part II, or that route 4 will be planned as a Part III. Coordinator note: this session wrote
FIX-RT-PAPER-KALETHA-16 (PR #5200), which applied RT-PAPER-KALETHA-16/1; that finding is cited here only as the
precedent for the severity.

**Evidence.** The paper (arXiv v2, p. 11), Remark 3.10: 'Since p does not divide the index of connection of Φ(G) (Lemma
2.2(e)), Adler and Roche ([AR00, Proposition 4.1]) provide a non-degenerate, G-equivariant, symmetric bilinear form B :
g×g → k such that the induced identification of g with g* identifies g_{x,r} with g*_{x,r}'. The paper (arXiv v2, pp.
9–10), proof of Lemma 3.4: 'we can G_k̄-equivariantly identify g*_k̄ with g_k̄ (see [AR00, Proposition 4.1], Lemma
2.2(e) and Lemma 2.2(b))'. /9's note: 'Keep the full Weyl-order hypothesis and Lemma 2.2'. Lemma 2.2(b),(e) are /3b and
/3e, both on route 4. Atlas: roadmap ReductiveGroupsPartII, title 'Reductive groups, Part II: local structure and
arithmetic models', has prerequisites that include tauceti:TauCetiRoadmap/ReductiveGroups.
research/blueprint/make_queue.py, paper_designs: 'base = name.split("/")[-1].split(":")[-1]'; 'if rid in roadmaps: part,
rid = "Part III", base + "PartIII"'; '{base}PartII is already in the atlas and continues {name}: build on it, and plan
here only what it does not.' The queue holds the pending job DESIGN-ReductiveGroupsPartIII, named 'Reductive algebraic
groups, Part III'. Route 4's brief: 'The latter branch may import the already-constructed Adler–Roche identification
from ReductiveGroupsPartII'.

**Fix.** 1. Move PAPER-FINTZEN-21/9 from route 2 to route 4. The Adler–Roche form is then built in the Part III after
its Lemma 2.2 layer, importing the Moy–Prasad Lie and dual lattices (/7a) from RG2, which the Part III builds on. RG2
then imports nothing from route 4. No other route-2 item uses a route-4 item. 2. In route 2's reason, delete 'and the
new good-prime consequences from route 4'. 3. In route 4's brief, replace 'Export these early results to
ReductiveGroupsPartII’s invariant-form construction; this early branch must not depend on that form' and 'may import the
already-constructed Adler–Roche identification from ReductiveGroupsPartII'. The new instruction: construct the form of
Remark 3.10 ([AR00, Proposition 4.1], with Lemma 2.2(b),(e)) in this roadmap after the good-prime layer, then /10b and
/41. 4. State in route 4's brief and in the report that the atlas already has ReductiveGroupsPartII for this parent, so
the queue plans route 4 as 'Reductive algebraic groups, Part III' (DESIGN-ReductiveGroupsPartIII), built on RG2. 5.
Update the route counts in the report (route 2: 12, route 4: 13).

### /2 — other

**Where.** PAPER-FINTZEN-21/19d, PAPER-FINTZEN-21/19f, route 1 brief, sourceIssues (new)

**Claim.** The proof of Lemma 6.1.1(ii) gets the lower bound f(y) ≥ f(x) − ε by 'switching x and y'. This is the half of
continuity that the minimisation of f on p.23 needs: a G_j(k)-invariant function with compact quotient attains its
minimum when it is lower semicontinuous, and the other half (f(y) ≤ f(x) + ε) does not give that. The switch is
justified only by the claim (G_i)_{y,r_i−d_i/2} = (G_i)_{y,r_i}, and that claim is false in general. When a root group
of G_i has a filtration jump at x exactly at depth r_i, the jump moves to depth r_i − δ at a nearby point y, with 0 < δ
≤ d(x,y) < ε. Re-choosing d_i at y does not rescue the argument: any d with (G_i)_{y,r_i−d} = (G_i)_{y,r_i} then
satisfies d ≤ δ < ε, which contradicts the requirement ε < d/2. The same moved jump can also break Corollary 5.3's
hypothesis (H_i)_{y,r_i−ε,r_i/2+} = (H_i)_{y,r_i,r_i/2+} at y, which the first half of the proof needs when it applies
Corollary 5.3 at y. So can Corollary 5.3's bound ε < r_{j−1}/4, which ε < min{r_j/4, d_i/2} does not ensure when f(x) >
r_{j−1}. In the first half both are harmless: the proof establishes the action of the larger group
(H_i)_{y,r_i−d_i/2,r_i/2+} directly, and that is all Corollary 5.3's proof uses, and ε can be shrunk. The extraction
records none of this, and items 19d and 19f present the paper's argument as complete. No claim is made that Lemma 6.1.1
or Theorem 6.1 is false.

**Evidence.** Paper (arXiv v2, p.23; identical in the TeX source): 'For 1 ≤ i ≤ j −1, let d_i < r_i be a positive real
number such that (G_i)_{x,r_i−d_i} = (G_i)_{x,r_i}.' … 'It remains to prove continuity around x in the case f(x) = r_j >
0. Suppose f(y) < r_j−ε … Note that (G_i)_{y,r_i−d_i/2} = (G_i)_{y,r_i} for 1 ≤ i ≤ j −1. Hence, by the same reasoning
as above (switching x and y), we deduce that f(x) < r_j, a contradiction.' Then: 'Since f is G_j(k)-equivariant,
continuous, bounded below by zero, and the fundamental domain for the action of G_j(k) on B_j is bounded, there exists a
point x_j ∈ B_j such that f(x_j) ≤ f(x) for all x ∈ B_j.' Counterexample to the displayed equality. Take G = GL_3 with p
≥ 5 and j = 2. Let X_1 correspond under the trace form to ϖ^{-1}diag(a,a,b) with a, b ∈ O^× and a ≢ b mod P; it is
generic of depth −1 with G_2 = Cent(X_1) = GL_2×GL_1, so r_1 = 1. Let x be the vertex fixed by GL_3(O), where G_{x,s} =
1+ϖ^{⌈s⌉}M_3(O), so d_1 = 1/2 is allowed. Let y = x + (0,0,δ) in the diagonal apartment, which lies in B_2, with 0 < δ <
ε < 1/4 and d(x,y) < ε. By the lattice-function description, g_{y,s} = {Z : val(Z_kl) ≥ ⌈s − v_k + v_l⌉}. The (1,3)
entry must have valuation ≥ ⌈3/4+δ⌉ = 1 at s = 3/4 but ≥ ⌈1+δ⌉ = 2 at s = 1, so 1+ϖE_13 ∈ (G_1)_{y,3/4} but 1+ϖE_13 ∉
(G_1)_{y,1}. For the hypothesis of Corollary 5.3, take y = x + (δ,0,0) instead. The same computation for the (2,1)
entry, whose root lies in G_2, gives 1+ϖE_21 ∈ (H_1)_{y,1−ε,1/2+} but 1+ϖE_21 ∉ (H_1)_{y,1,1/2+}, with H_1 = SL_3.

**Fix.** Add a new sourceIssue. Kind: gap. Locator: Lemma 6.1.1(ii) proof, p.23, the sentence 'Note that
(G_i)_{y,r_i−d_i/2} = (G_i)_{y,r_i} for 1 ≤ i ≤ j−1' with the following 'switching x and y', and the appeal to Corollary
5.3 at y earlier in the same proof. Printed: as quoted. Correction: the equality is false in general (the GL_3 example),
so the lower bound f(y) ≥ f(x) − ε needs an argument that uses jump-free intervals only at the fixed point x. A
suggested route, which the blueprint must check: (1) choose ε < r_{j−1}/4 such that each (G_i)_{x,·} has no jump in
[r_i−2ε, r_i) ∪ (r_i, r_i+2ε]; (2) show directly that (H_i)_{x,r_i+} fixes the subspace found at y; (3) show that
(H_i)_{x,r_i,r_i/2+} acts on that subspace through ϕ∘(X_i+C_i), with C_i as in the first half; (4) apply Corollary 5.3
at x, where its equality hypothesis holds. Affects: the proof. Known: new, unless the correction search used for E1–E5
finds a correction. Add to the notes of 19d and 19f that the paper's justification of lower semicontinuity is defective
and that 19f depends on the corrected 19d. In the route 1 brief, after 'continuity, minimum', add 'with a corrected
proof of the lower bound in Lemma 6.1.1(ii) (see the sourceIssue)'. List the new sourceIssue in the report's section on
source findings.

### /3 — error

**Where.** PAPER-FINTZEN-21/16a, route 1 brief, sourceIssues (new)

**Claim.** Item 16a states Lemma 5.1(b)(i)–(ii) as exact identities: Ad*(g)(X+C) 'agrees with X on g_{x,r} and vanishes
on r″∩g_{x,d+}'. As exact equalities of k-valued functionals these are false in general. The paper's proof gives them
only modulo P, and modulo P is all that Corollaries 5.2–5.4 use, because they only use ϕ, which has conductor P. The
paper prints the exact form in both the statement and the proof, and no sourceIssue records this. The route 1 brief asks
for 'all parts of Lemma 5.1' as printed. Severity set to high by the coordinator: item 16a states the exact identities,
and they are false. The coordinator checked the GL_3 example: g_{x,1} spans g over k, so exact (i) would make A+M
conjugate to A, but conjugation preserves the characteristic polynomial and det(t−A−M) = det(t−A) − (t−A_33) ≠ det(t−A).
A false item statement is high, as for item 18 in RT-PAPER-BHATT-SCHOLZE-22, even where the cases used survive.

**Evidence.** Paper (arXiv v2, p.18), Lemma 5.1(b): '(i) Ad(g)(X + C)|_{g_{x,r}} = X|_{g_{x,r}}, (ii) Ad(g)(X +
C)|_{r″∩g_{x,d+}} = 0 = X|_{r″∩g_{x,d+}}'. On p.19 the proof has only the congruence 'Ad(g^{-1})(Z) ≡ Z + [−Y, Z] mod
g_{x,r′+2(r−d−ε)}' and then writes '= X(Z)'. Counterexample to the exact form. Take G = GL_3 with p ≥ 5, so p ∤ |W| = 6.
Let x be the vertex fixed by GL_3(O), so g_{x,s} = ϖ^{⌈s⌉}M_3(O), and identify g* with g by the trace form. Let X
correspond to A = ϖ^{-1}diag(a_1,a_2,a_3), with a_i ∈ O^× pairwise distinct mod P. Then X is generic of depth −1 at x,
G′ is the diagonal torus, and j* corresponds to the off-diagonal matrices. Take r = 1, d = 1/2, ε = 1/8, and let C
correspond to M = E_12+E_21. C lies in j*∩g*_{x,−5/8} because tr(M·ϖM_3(O)) ⊂ P. Since g_{x,1} spans g over k, exact (i)
would force Ad*(g)(X+C) = X, i.e. g(A+M)g^{-1} = A. This is impossible: det(t−A−M) = ((t−A_11)(t−A_22)−1)(t−A_33) ≠
det(t−A). The congruence version holds, because each term the proof drops (C(Z), X([Y,Z]) with Y ∈ g_{x,r−d−ε}, and the
second-order terms) has positive valuation on the relevant lattices.

**Fix.** Restate 16a: 'there is g ∈ G_{x,r−d−ε} with Ad*(g)(X+C)(Z) − X(Z) ∈ P for all Z ∈ g_{x,r}, and Ad*(g)(X+C)(Z) ∈
P for all Z ∈ r″∩g_{x,d+}; equivalently, ϕ∘Ad*(g)(X+C) equals ϕ∘X on g_{x,r} and is trivial on r″∩g_{x,d+}'. Note in 16a
that exact equality is false in general. Add a new sourceIssue. Kind: error. Locator: Lemma 5.1(b)(i)–(ii) and the two
displayed equalities in its proof, pp.18–19. Printed: as quoted. Correction: congruences modulo P. Reason: the GL_3
example. Affects: a stated result as printed; every use in Corollaries 5.2–5.4 needs only the corrected form. Known:
new, unless the correction search finds otherwise. In the route 1 brief, change 'Prove all parts of Lemma 5.1' to 'Prove
all parts of Lemma 5.1, with (b)(i)–(ii) as congruences modulo P'.

### /4 — error

**Where.** PAPER-FINTZEN-21/22, PAPER-FINTZEN-21/22c, PAPER-FINTZEN-21/22d, PAPER-FINTZEN-21/22g, PAPER-FINTZEN-21/23c,
route 1 brief, sourceIssues (unrecorded), report section on source issues

**Claim.** With the groups K^H_{0+} and K^H_+ defined as on p.28, which item /22 copies ('replacing each G_i with H_i in
the latter two products'), the third and fourth identities of Lemma 7.5 are false, so items /22c and /22d state false
identities. Lemma 7.7, item /22g, is then also false: K^H_{0+}/N^H is not a Heisenberg group with centre K^H_+/N^H, and
K^H_+/N^H need not have order p. The proof of Lemma 7.5 asserts a Lie-algebra direct sum that omits the torus directions
in Lie(T∩H_i) that are not in Lie(T∩H_{i+1}). In the mixed-depth group (H_i)_{x,r_i,r_i/2} these directions sit at depth
r_i, but in (H_i)_{x,r_i/2} they sit at depth r_i/2, and (H_{i+1})_{x,r_i/2} contains only T∩H_{i+1}. Since G_{i+1} is a
proper twisted Levi with a larger centre, T∩H_i is strictly larger than T∩H_{i+1}. Counterexample: take p odd, G=SL_2, T
the diagonal torus, x the hyperspecial vertex of its apartment, n=1 and X_1∈t* with val X_1(H_α)=−4 (generic of depth
−4). Then G_2=T, H_1=SL_2 and H_2=T^der=1. K^H_{0+}=SL_2(k)_{x,2} contains t=diag(1+ϖ², (1+ϖ²)^{-1}). But
(H_2)_{x,0+}(H_1)_{x,4,2}=(H_1)_{x,4,2}, and every element of it has diagonal entries ≡1 mod P⁴, so the third identity
fails. In the same way diag(1+ϖ³,·)∈SL_2(k)_{x,3}=K^H_+ lies outside (H_1)_{x,4,2+}, so the fourth identity fails. For
every g∈SL_2(k)_{x,2}, the commutator [t,g] has diagonal entries in 1+P⁶ and off-diagonal entries in P⁴, so θ([t,g])=1,
because θ=φ̂_1 on G_{x,3}/G_{x,5} sees only the diagonal part through φ∘X_1. Hence tN^H is central in K^H_{0+}/N^H
although t∉K^H_+. For k=Q_p, θ(K^H_+)⊇φ_1(T(k)_3)=μ_{p²}, so K^H_+/N^H has order p², contradicting the line 'K^H_+/N^H
has order p' on p.30. As printed, the proof of Lemma 7.8 then fails at the uniqueness of the Heisenberg representation.
With the mixed-depth products as definitions, everything holds: Lemma 7.5 lines 1–2, Lemma 7.6, Lemma 7.7 and Lemma 7.8.
The main theorems are unaffected. The route 1 brief tells the design job to 'prove all four product identities and
construct the individual and combined Heisenberg quotients on those actual groups', which is impossible as written. The
report says that all recorded issues are notational slips.

**Evidence.** The paper (arXiv v2, p.28), as in the TeX source: 'K^H_{0+} =
(H_{n+1})_{x,0+}(H_n)_{x,r_n/2}…(H_1)_{x,r_1/2}', 'K^H_+ = (H_{n+1})_{x,0+}(H_n)_{x,r_n/2+}…(H_1)_{x,r_1/2+}'. Lemma 7.5
(p.28): 'K^H_{0+} = (H_{n+1})_{x,0+}(H_n)_{x,r_n,r_n/2}…(H_1)_{x,r_1,r_1/2}' and 'K^H_+ =
(H_{n+1})_{x,0+}(H_n)_{x,r_n,r_n/2+}…'. Proof (p.29): '(h_i(E))_{x,r_i/2+}/(h_i(E))_{x,r_i} =
(h_i(E))_{x,r_i,r_i/2+}/(h_i(E))_{x,r_i} ⊕ (h_{i+1}(E))_{x,r_i/2+}/(h_{i+1}(E))_{x,r_i}'. Definition on p.16:
'(G_i)_{x,r̃,r̃′} := G(k)∩⟨T(E)_{r̃}, U_α(E)_{x,r̃}, U_β(E)_{x,r̃′} …⟩' with 'H_i := G_i^der for i > 1'. Lemma 7.7 proof
(p.30): 'K^H_{0+}/K^H_+ ≃ (H_1)_{x,r_1,r_1/2}/(H_1)_{x,r_1,r_1/2+} ⊕ … ⊕ (H_n)_{x,r_n,r_n/2}/(H_n)_{x,r_n,r_n/2+}' and
'the image of θ|K^H_+ is {c ∈ C | c^p = 1}'. Lemma 7.8 proof (p.31): 'By Lemma 7.7 and the theory of Heisenberg
representations there exists a unique irreducible representation of K^H_{0+} factoring through K^H_{0+}/N^H'. The
extraction's item /22 reads 'Define K^H_{0+} and K^H_+ by replacing each G_i with H_i in the latter two products'.

**Fix.** In PAPER-FINTZEN-21/22, define K^H_{0+} as the group generated by (H_{n+1})_{x,0+}, (H_n)_{x,r_n,r_n/2}, …,
(H_1)_{x,r_1,r_1/2}, and K^H_+ in the same way with the second depths r_i/2+. Note that the p.28 definitions are
corrected in this way. Replace the theorem statements of /22c and /22d with these definitions; they are no longer
identities to prove. Restate /22a and /22b as K_+=(G_{n+1})_{x,0+}K^H_+ and K_{0+}=(G_{n+1})_{x,0+}K^H_{0+} for the
corrected groups. These follow from Corollary 7.2 and the identity
(G_i)_{x,r_i/2}=(G_i)_{x,r_i,r_i/2}(G_{i+1})_{x,r_i/2}, which absorbs the torus factors T(k)_r into (G_{n+1})_{x,0+}.
Keep /22g as stated, now for the corrected groups, and add a note to /23c that the uniqueness step uses them. Add a new
sourceIssue: kind error; locator p.28 definitions of K^H_{0+} and K^H_+, Lemma 7.5 third and fourth identities with the
Lie-algebra equality in its proof (pp.28–29), and Lemma 7.7 (pp.30–31); printed as quoted; correction: use the
mixed-depth products as the definitions; reason: the SL_2, r_1=4 example; affects: the proof (Lemmas 7.5, 7.7 and 7.8 as
written), not the stated main results. In the route 1 brief, replace 'prove all four product identities and construct
the individual and combined Heisenberg quotients on those actual groups' with 'define K^H_{0+} and K^H_+ as the
mixed-depth products, prove K_+=(G_{n+1})_{x,0+}K^H_+ and K_{0+}=(G_{n+1})_{x,0+}K^H_{0+}, and construct the combined
Heisenberg quotient on the corrected groups'. Update the report's statement that all recorded issues are notational.

### /5 — missing

**Where.** PAPER-FINTZEN-21/5, PAPER-FINTZEN-21/4, PAPER-FINTZEN-21/25, PAPER-FINTZEN-21/25a, PAPER-FINTZEN-21/26,
prerequisites, route 1 brief, sourceIssues (unrecorded), report paragraph on literature warnings

**Claim.** Theorem 8.1 rests on [Yu01, Proposition 4.6]: Yu's compactly induced representation is irreducible and
supercuspidal. Theorems 7.12 and 8.1 also rest on [KY17, 7.5 Theorem]: the Kim–Yu pair is a G-cover of a supercuspidal
type of M_1, and hence a type. The published proofs of both results depend on [Yu01, Proposition 14.1 and Theorem 14.2].
Those two results are false, because Yu used a misprinted Gérardin theorem (the same misprint as in the paper's footnote
3). The correct routes in the literature are as follows. (a) For Yu's irreducibility: Fintzen, 'On the construction of
tame supercuspidal representations', Theorem 3.1. (b) For the Kim–Yu type results: the twisted construction of
Fintzen–Kaletha–Spice (Cor. 4.1.11, 4.1.12, Thm 4.1.13). Adler–Fintzen–Mishra–Ohara, Remark 4.1.7, records that the
results of [KY17] apply once the construction is twisted. The sign character ε is quadratic and trivial on pro-p
subgroups (p odd). So the untwisted pair (K, ρ_Yu⊗κ) equals the twisted pair built from ρ_Yu·ε, and ρ_Yu·ε still
satisfies the depth-zero cuspidality condition. The statements of Theorems 7.12 and 8.1 therefore survive, but their
proofs cannot go through Yu01 §§14–15 or KY17 as written. The extraction mentions none of this. Its prerequisites list
neither paper. The route 1 brief says 'Yu irreducibility' and lists only the Kim07, KY17 D5 and Gérardin warnings. The
report says the same.

**Evidence.** The paper (arXiv v2, p.36): 'ind_{K̃}^{G(k)} π_K̃ is the corresponding irreducible supercuspidal
representations ([Yu01, Proposition 4.6])' and 'Kim and Yu ([KY17, 7.5 Theorem]) show that the type (K, π_K) is a cover
of a type for the group M_1'. Fintzen, arXiv:1908.09819v2, Remark 3.2: 'This theorem follows from [Yu01, Theorem 15.1].
However, the proof in [Yu01] relies on [Gér77, Theorem 2.4(b)] and unfortunately the statement of [Gér77, Theorem
2.4(b)] contains a typo … Therefore Proposition 14.1 and Theorem 14.2 of [Yu01], on which Yu's proof relies, are no
longer true.' Kim–Yu, arXiv:1612.04204, 7.5: 'Ti is a Gi-cover of Ti_M. Hence Ti is an Si(Gi)-type in Gi. Proof. The
second statement follows from the first and [BK, Theorem 8.3]'; the T_M are Yu supercuspidal types 'see [Yu, Remark
15.4] and the discussions following [Yu, Theorem 15.7]'. Adler–Fintzen–Mishra–Ohara, arXiv:2408.07805, Remark 4.1.7:
'some of the results of [KY17] rely on [Yu01, Proposition 14.1] and [Yu01, Theorem 14.2], which were pointed out in
[Fin21a] to be false in general. On the other hand, according to [FKS23, Corollary 4.1.11, Corollary 4.1.12], the
twisted representation ρx satisfies the analogues of these propositions. Thus, we can apply the results of [KY17],
replacing their non-twisted construction with our twisted construction.'

**Fix.** Add two prerequisites. (1) Jessica Fintzen, On the construction of tame supercuspidal representations,
Compositio Math. 157 (2021), no. 12, 2733–2746, doi:10.1112/S0010437X21007636, arXiv:1908.09819. Why: Theorem 3.1 is a
correct proof that Yu's representations are irreducible and supercuspidal, replacing Yu01 §§14–15, which is needed for
Theorem 8.1; §4 gives the counterexample to [Yu01, Prop. 14.1, Thm 14.2]. (2) Jessica Fintzen, Tasho Kaletha and Loren
Spice, A twisted Yu construction, Harish-Chandra characters, and endoscopy, Duke Math. J. 172 (2023), no. 12, 2241–2301,
doi:10.1215/00127094-2022-0080, arXiv:2106.09120. Why: the quadratic twist ε restores Yu's intertwining results (Cor.
4.1.11, 4.1.12, Thm 4.1.13), so that the Kim–Yu type and cover results used in Theorems 7.12 and 8.1 hold. Cite
Adler–Fintzen–Mishra–Ohara, arXiv:2408.07805, Remark 4.1.7 for the dependence of KY17. Add notes to /25 and /25a:
'irreducibility and supercuspidality via Fintzen, Compositio 2021, Theorem 3.1, not Yu01 §15'. Add a note to /26 and /4:
'type and cover property via the FKS-twisted construction; the untwisted pair from ρ_Yu equals the twisted pair from
ρ_Yu·ε'. Add a new sourceIssue: kind gap; locator Theorem 8.1 proof p.36 and Theorem 7.12 proof pp.34–35 (the uses of
[Yu01, Prop. 4.6] and [KY17, 7.5 Theorem]); affects: the proof; known: the Fintzen 2021 Compositio and FKS 2023
corrections. In the route 1 brief, replace 'Yu irreducibility' with 'Yu irreducibility in the form of Fintzen,
Compositio 2021, Theorem 3.1', and add the Yu01 Prop. 14.1/Thm 14.2 caution and the FKS twist to the listed warnings.
Add the same caution to the report's paragraph on literature warnings.

## All findings

| Finding | Severity | Kind | Where | Claim (abridged) |
|---|---|---|---|---|
| /1 | high | error | route 2 (reason); … | The routing makes ReductiveGroupsPartII (RG2) and the roadmap that route 4 becomes depend on each other. Route 2 puts the Adler–Roche form /9 into RG2.1–RG2.3, … |
| /2 | high | other | PAPER-FINTZEN-21/19d, PAPER-FINTZEN-21/19f, route 1 brief, … | The proof of Lemma 6.1.1(ii) gets the lower bound f(y) ≥ f(x) − ε by 'switching x and y'. This is the half of continuity that the minimisation of f on p.23 … |
| /3 | high | error | PAPER-FINTZEN-21/16a, route 1 brief, sourceIssues (new) | Item 16a states Lemma 5.1(b)(i)–(ii) as exact identities: Ad*(g)(X+C) 'agrees with X on g_{x,r} and vanishes on r″∩g_{x,d+}'. As exact equalities of k-valued … |
| /4 | high | error | PAPER-FINTZEN-21/22, PAPER-FINTZEN-21/22c, PAPER-FINTZEN-21/22d, … | With the groups K^H_{0+} and K^H_+ defined as on p.28, which item /22 copies ('replacing each G_i with H_i in the latter two products'), the third and fourth … |
| /5 | high | missing | PAPER-FINTZEN-21/5, PAPER-FINTZEN-21/4, PAPER-FINTZEN-21/25, … | Theorem 8.1 rests on [Yu01, Proposition 4.6]: Yu's compactly induced representation is irreducible and supercuspidal. Theorems 7.12 and 8.1 also rest on [KY17, … |
| /6 | medium | error | PAPER-FINTZEN-21/14c and PAPER-FINTZEN-21/20a (route 2); … | Three supplier items are stated in terms of objects owned by a downstream route. - /14c (route 2, into RG2) opens with 'For a truncated datum set H₁=G₁ if … |
| /7 | medium | duplicate | PAPER-FINTZEN-21/33 (route 1); … | The finite cuspidality predicate /33 has the wrong owner. It defines cuspidality for representations of Q(f), Q connected reductive over a finite field. It is … |
| /8 | medium | duplicate | PAPER-FINTZEN-21/3c, PAPER-FINTZEN-21/3e, PAPER-FINTZEN-21/30a, …; … | The arithmetic of primes not dividing the Weyl-group order is planned by two owners. Route 4 plans bad primes, the index of connection and their derivation … |
| /9 | medium | duplicate | PAPER-FINTZEN-21/32 and PAPER-FINTZEN-21/32a (route 4), their notes; … | Orbit-closure theory and the Hilbert–Mumford theorem are planned twice, and the extraction does not record it. /32 defines geometric orbit closure, … |
| /10 | medium | missing | PAPER-FINTZEN-21/10b, PAPER-FINTZEN-21/11a, route 4, route 4 brief | The centralizer theorem [Yu01, Propositions 7.1 and 7.2] is a cited result used in two §3 proofs, but no item states it and route 4's brief does not name it … |
| /11 | medium | missing | PAPER-FINTZEN-21/11b, PAPER-FINTZEN-21/13, route 2 | [Yu01, Lemma 8.2] is used twice in §3, but no item states it. In the form used: let T be a maximal torus split over a tame extension E. If X ∈ (g_E)*_{y,s} for … |
| /12 | medium | missing | PAPER-FINTZEN-21/12, route 1 brief, prerequisites (Adler 1998; … | The proof of Lemma 3.11 (/12) has three steps. It moves X to X̌ ∈ g through the Adler–Roche form. It observes that X̌ is a good semisimple element of depth r … |
| /13 | medium | missing | PAPER-FINTZEN-21/3, PAPER-FINTZEN-21/3b, PAPER-FINTZEN-21/3c, … | Six cited classical results used in proofs in §§2–3 are not items; they appear only in the 'why' notes of the Bourbaki, Borel and Springer–Steinberg/Steinberg … |
| /14 | medium | missing | PAPER-FINTZEN-21/9, PAPER-FINTZEN-21/12, PAPER-FINTZEN-21/13, route 2 | Lemma 3.11 and Proposition 3.12 use a fact about G′ = Cent_G(X) at points x ∈ B(G′,k): the Moy–Prasad filtrations of g′ and (g′)* are the restrictions of those … |
| /15 | medium | missing | PAPER-FINTZEN-21/8a, PAPER-FINTZEN-21/11, PAPER-FINTZEN-21/13, … | §3 uses Bruhat–Tits tame Galois descent of buildings throughout, but no item states it. For a tame Galois extension E/k, B(G,k) is identified … |
| /16 | medium | missing | PAPER-FINTZEN-21/7a, PAPER-FINTZEN-21/7c | /7a records only the Lie-algebra comparison (g_E)_{x,r} ∩ g = g_{x,r} of equation (1). Two facts that §3 also uses are in no item. The first is the dual … |
| /17 | medium | error | PAPER-FINTZEN-21/39 | /39 tells the blueprint to 'use the Adler–DeBacker result with the non-simply-connected qualification recorded at the start of their §3'. This conflates two … |
| /18 | medium | error | PAPER-FINTZEN-21/2a, route 2, route 4 brief | /2a (under Assumption 2.1 every k-torus of G splits over a tame extension, by [Fin19]) is listed among route 2's items. Route 2 is a source route to … |
| /19 | medium | error | PAPER-FINTZEN-21/16, PAPER-FINTZEN-21/16b, PAPER-FINTZEN-21/16c, … | Two items drop the condition that the auxiliary maximal torus has x in its apartment. Item 16 says only 'choose a tame split maximal torus of G′=Cent_G(X)'; … |
| /20 | medium | missing | PAPER-FINTZEN-21/15, PAPER-FINTZEN-21/15a, PAPER-FINTZEN-21/17, … | No item states the group-to-Lie-algebra isomorphisms on which 'contains a datum', Corollaries 5.2–5.4 and the function f are built. There are two kinds. First, … |
| /21 | medium | missing | PAPER-FINTZEN-21/13, PAPER-FINTZEN-21/19, PAPER-FINTZEN-21/19c, …; … | The argument of §6, together with Proposition 3.12, which Lemma 6.1.3 applies, rests on four building and filtration facts that no item states. (a) The fixed … |
| /22 | medium | missing | PAPER-FINTZEN-21/14, PAPER-FINTZEN-21/14a, PAPER-FINTZEN-21/14c, … | Two identities that §4 asserts or presupposes have no item. (a) The paper asserts, on p.16 and without proof or citation, that (H_i)_{x,r̃} := G_{x,r̃}∩H_i(k) … |
| /23 | medium | missing | PAPER-FINTZEN-21/6, sourceIssues (unrecorded) | Corollary 8.3 is stated for an arbitrary maximal datum. Its proof refers to the proof of Theorem 8.1 for the implication 'supercuspidal ⇒ M_{n+1}=G_{n+1} and … |
| /24 | medium | missing | PAPER-FINTZEN-21/23c (Lemma 7.8); … | Lemma 7.8 obtains the factorisation (π/_K, V̂) ≅ ρ⊗κ from [Kim07, Proposition 18.5] ('or rather the analogous statement in our setting that is proved in the … |
| /25 | medium | missing | PAPER-FINTZEN-21/22g (Lemma 7.7); … | The proof of Lemma 7.7 uses two cited Heisenberg-group criteria that no item states: [Yu01, Lemma 10.1], which reduces being a Heisenberg p-group to exhibiting … |
| /26 | medium | missing | PAPER-FINTZEN-21/24c, PAPER-FINTZEN-21/24b | The argument that proves D2 (item /24c) rests on the cited [KY17, 3.6 Lemma (b)]. That lemma gives λ∈X_*(Z_s(M_{n+1})) such that, for small ε>0, Diagram (3) is … |
| /27 | medium | missing | PAPER-FINTZEN-21/21c, PAPER-FINTZEN-21/25, PAPER-FINTZEN-21/26 | No item defines Yu's genericity, although Lemma 7.3(iii), Yu's input conditions ([Yu01, §3], used in Theorem 8.1) and Kim–Yu's D5 are all stated in its terms. … |
| /28 | medium | missing | PAPER-FINTZEN-21/25a | The proof of Theorem 8.1 cites [MP96, Proposition 6.6]: compact induction from the stabilizer of a vertex of the reduced building, of a representation whose … |
| /29 | medium | missing | PAPER-FINTZEN-21/27c, PAPER-FINTZEN-21/20a, prerequisites | Two cited results used in §7 proofs have no items. (1) [BT71, 3.7 Corollaire], used in Lemma 7.10: the image of U_f in Sp(V_i^0), a group of unipotent … |
| /30 | medium | error | prerequisites (entries for Kim–Yu, Reeder–Yu, Moy–Prasad, Kim07, …; … | Five prerequisite entries are wrong or incomplete. (1) The Kim–Yu 'why' is a verbatim copy of the Yu 2001 'why' ('The general tame twisted-Levi construction … |
| /31 | low | other | route 1 brief; … | The briefs name some imports by the extraction's internal route numbers, or by roadmap ids that the queue never creates, instead of by title and id. The queue … |
| /32 | low | library-claim | PAPER-FINTZEN-21/37 (note); … | The library account of /37 misses the Mathlib route that does supply its algebraic core. /37 is the extension of a smooth character from an open subgroup of an … |
| /33 | low | duplicate | PAPER-FINTZEN-21/7, PAPER-FINTZEN-21/7a, PAPER-FINTZEN-21/8a (route 2); … | Two items carry hypotheses their objects do not need, and two other items are duplicated in another owner. - Hypotheses: /7 (Moy–Prasad group filtration) and … |
| /34 | low | error | sourceIssues (no entry for Table 1, p.8); … | Table 1 heads a column 'D_n (n ≥ 3)' and lists 2 as a bad prime and as a torsion prime. For n = 3, D_3 = A_3, which has neither bad nor torsion primes, … |
| /35 | low | error | sourceIssues (no entry for Lemma 3.4 proof, p.10); … | The proof of Lemma 3.4 writes X = X_s + X_n with X_s ∈ Lie(T) and X_n ∈ Lie(U). This is the decomposition Lie(B) = Lie(T) ⊕ Lie(U), not the Jordan … |
| /36 | low | error | sourceIssues (no entry for Lemma 3.11 proof, p.12); … | The proof of Lemma 3.11 asserts 'dα(X̌) = X(H_α)'. This is false for every non-simply-laced G. For any invariant symmetric form B and Z ∈ t, pairing H_α = … |
| /37 | low | other | PAPER-FINTZEN-21/32a, PAPER-FINTZEN-21/32b, PAPER-FINTZEN-21/26; … | Three locators omit pages where the paper uses the item. /32a (Kempf Corollary 4.3) and /32b (lifting the destabilizing cocharacter to a parahoric torus and … |
| /38 | low | other | PAPER-FINTZEN-21/15b, sourceIssues (new) | Definition 4.6 compares the facet of x in B(G_{n+1},k) with 'the facet of B(G_{n+1},k) that contains x′' for an arbitrary other contained datum, printed as … |
| /39 | low | other | PAPER-FINTZEN-21/17b, sourceIssues (new) | Corollary 5.4's conclusion as printed, 'there exists a subspace V″ … such that …', is vacuous, since V″ = 0 qualifies. Lemma 6.1.3 needs V″ ≠ 0 to conclude … |
| /40 | low | other | sourceIssues (new), PAPER-FINTZEN-21/16b, PAPER-FINTZEN-21/17a, … | Four unrecorded misprints in §§5–6. (1) In the proof of Lemma 6.1.1(ii), ε is bounded by 'min{r_j/4, d_i/2 / 1 ≤ i < j−1}', which omits d_{j−1}; the bound ε < … |
| /41 | low | other | PAPER-FINTZEN-21/19c, PAPER-FINTZEN-21/19f, sourceIssues (new) | Lemma 6.1.3 checks that (y,(X_i)_{1≤i≤j}) is a truncated datum, and the check is incomplete in two places. (1) Definition 4.1(a) needs r_j < r_{j−1}, but the … |
| /42 | low | other | PAPER-FINTZEN-21/14c, PAPER-FINTZEN-21/19, PAPER-FINTZEN-21/19c, … | The definition 'H_1 := G_1 if G_1 = G_2 and H_1 := G_1^der if G_1 ≠ G_2' does not define H_1 in two cases where G_2 is missing. One is a datum of length n = 0. … |
| /43 | low | missing | PAPER-FINTZEN-21/20b, PAPER-FINTZEN-21/23c, sourceIssues (unrecorded) | The paper speaks of 'the irreducible K_{G_{n+1}}-subrepresentation of V_π containing V′' and 'the irreducible K-subrepresentation … that contains Ṽ' without … |
| /44 | low | error | PAPER-FINTZEN-21/6 | Item /6 (Corollary 8.3) adds the hypothesis 'For the non-torus construction assume G is not a torus (hence p is odd)'. The corollary has no such hypothesis and … |

## Notes for the fix job

- **Route cycle.** Move the Adler–Roche form (/9) to route 4, delete route 2's import from route 4, and say in the
  report and route 4's brief that the queue plans route 4 as ReductiveGroupsPartIII, built on ReductiveGroupsPartII.
- **K^H groups.** Define K^H_{0+} and K^H_+ by the mixed-depth products in item 22, so that 22c and 22d become
  definitions, and record the p.28 definitions as a new sourceIssue. Lemma 7.7 then holds as printed.
- **Yu's irreducibility.** Add Fintzen's Compositio paper and Fintzen–Kaletha–Spice as prerequisites, and say in route
  1's brief that Theorem 8.1 must use Fintzen's Theorem 3.1, not Yu01 §§14–15.
- **Proof gaps.** Record Lemma 6.1.1(ii) and Lemma 5.1(b) (exact only modulo P) as new sourceIssues and restate 16a
  modulo P. Corollary 8.3 needs the D2 perturbation from the proof of Theorem 7.12.
