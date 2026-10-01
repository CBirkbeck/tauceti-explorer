# RT-PAPER-DIMITROV-GAO-HABEGGER-21

Red team of the accepted extraction PAPER-DIMITROV-GAO-HABEGGER-21: Vesselin Dimitrov, Ziyang Gao and Philipp Habegger,
*Uniformity in Mordell–Lang for curves*, Annals of Mathematics 194 (2021), 237–298 (arXiv 2001.10276v3). Issue #4077.

Red team: Claude Code, session `cc-c2c06b`, 1 October 2026. I did not write or review:
- the extraction (`cc-fb70e5`, PR #1842);
- its review (`cc-442dc5`, PR #2432).

Disclosures. Four findings cite, as context, earlier work of this session, and each carries a coordinator note:
RT-PAPER-YUAN-26 (PR #5331) in /2 and /9, REV-RT-RS-02 (PR #4926) in /9, RT-PAPER-KINGS-SPRANG-25 (PR #5346) in /6 and
REV-RT-PAPER-TSIMERMAN-18 (PR #4912) in /20. No finding rests on a verdict of mine.

**Result: 34 findings, 5 high, 13 medium and 16 low.**

## Method

**The source.** arXiv 2001.10276v3 (<https://arxiv.org/pdf/2001.10276v3>), the version the extraction read, was
re-downloaded on 2026-10-01 with its LaTeX source; its SHA-256 (`5fc8e86f…338a4`) equals the extraction's. It has 49
pages. The Annals version was not read.

**The passes.** Four parallel passes were run by this session.
- Three read all 49 pages: §§1–3, §§4–6, and §§7–8 with Appendices A–B and the references.
- One checked the eight routes, the 14 planned statuses and the briefs against the atlas, `make_queue.py`, the accepted
  restructurings, other papers' accepted routes, earlier red teams and the pinned libraries (Mathlib 082e2d3, Tau Ceti
  f790474).

**Merging.** I merged route 5's acceptance test, Theorem 6.2's imports, route 6's suppliers and the coarse space M_{g,1}
(three passes each), and seven findings that two passes each reported.

**What I re-verified myself.** All five high findings:
- route 5's acceptance test, from Definition 1.5 (p. 5): over a positive-dimensional base the Betti map of a constant
  family factors through the fibre;
- item 34 against (4.9)–(4.10) (p. 18);
- item 67 and E6 against the page image of David–Philippon 2002, p. 643;
- the two-way imports of routes 7 and 8, and of routes 5 and 6, in the briefs as accepted.

**Severity I changed.** The two-way dependencies of routes 7/8 and 5/6 are high, not medium: two roadmaps that import
from each other are a route cycle, as in RT-PAPER-FINTZEN-21 and RT-PAPER-ZHANG-21.

The full list of what was checked is in the result's `checked` field.

## The high findings

### /1 — error

**Where.** route 5 brief (Acceptance); route 5 brief

**Claim.** The acceptance test 'every subvariety of a constant family is non-degenerate' is false whenever the base has
positive dimension, and it contradicts the clause before it ('a torsion section is degenerate'). For a constant family A
= A₀ × S → S, the projection to A₀ followed by a real-analytic group isomorphism A₀(ℂ) ≅ T^{2g} satisfies (i)–(iii) of
Proposition B.2. By uniqueness up to GL_{2g}(ℤ) it is the Betti map. On an irreducible X ⊆ A₀ × S, rank_ℝ(db_Δ|_X) is
twice the complex rank of the projection X → A₀, so X is non-degenerate iff X → A₀ is generically finite. The zero
section {0} × S, which is a torsion section, has db_Δ|_X = 0 and rank 0 < 2 dim X = 2 dim S, so it is degenerate. So are
A₀ × S and every Y × S with dim S ≥ 1. A design job told that every such subvariety is non-degenerate would write a
false unit test, and Theorem B.1 applied to {0} × S would give 0 ≥ c₁h(s) − c₂ on a dense open set of S, which is false.
GAO-GE-KUHNE-26's accepted brief restricts the statement to 'a constant family (S a point)'. Also: The acceptance test
of route 5 (AbelianSchemesBettiMapsPartII) ends with 'every subvariety of a constant family is non-degenerate'. This is
false for every constant family over a positive-dimensional base. Take A = A₀ × S → S with dim S ≥ 1 and a real-analytic
group isomorphism β: A₀(ℂ) → T^{2g}. Then b_Δ(x,s) = β(x) satisfies (i)–(iii) of Proposition 2.1/B.2, so by the
uniqueness statement every Betti map is γ∘β∘pr₁ with γ ∈ GL_{2g}(ℤ). Hence db_Δ kills the base directions and max
rank_ℝ(db_Δ|_X) = 2·dim pr₁(X). So X is non-degenerate iff X → A₀ is generically finite. In particular X = A₀ × S
(dimension g + dim S, Betti rank 2g) and every constant section {x₀} × S (Betti rank 0) are degenerate. It must be so:
for X = A₀ × S, Theorem 1.6 would otherwise give ĥ_A(P) ≥ c₁h(π(P)) − c₂ on a dense open set, but the torsion points
(x_tors, s) are Zariski dense with ĥ_A = 0 while h(s) is unbounded. The test also contradicts the GAO-HABEGGER-19 brief
('a torsion multisection and a constant family are degenerate'), and GAO-GE-KUHNE-26 states it only for S a point. The
companion clause 'a torsion section is degenerate' also needs dim S ≥ 1: over a point a torsion section is a point, and
0 = 2·0 makes it non-degenerate. Also: The acceptance test in route 5's brief includes the claim 'every subvariety of a
constant family is non-degenerate', which is false under the paper's definition of non-degeneracy. Take a constant
family A = A₀ × S → S with dim S ≥ 1. Its Betti map is b(a, s) = φ(a), where φ: A₀(ℂ) → T^{2g} is a fixed real-analytic
group isomorphism. This map satisfies (i)–(iii) of Proposition B.2, and Betti maps are unique up to GL_{2g}(ℤ). So the
Betti rank on X ⊆ A₀ × S at a smooth point is twice the complex rank of the projection X → A₀ there. For X = A₀ × S this
is 2g < 2(g + dim S), and for a constant section {a} × S it is 0 < 2 dim S. Both are therefore degenerate. The brief
contradicts itself: the torsion section it calls degenerate in the same sentence is itself a subvariety of a constant
family whenever the family is constant. A design job that adopts this test would build against a false statement.

**Evidence.** The paper, p.5, Definition 1.5: X is non-degenerate if there is an open Δ with Betti map b_Δ such that
max_{x ∈ X^{sm,an} ∩ A_Δ} rank_ℝ(db_Δ|_{X^{sm,an}})_x = 2 dim X. P.41, Proposition B.2 and the sentence after it: 'the
Betti map is uniquely determined by properties (i) and (iii) up-to the action of GL_{2g}(ℤ) if Δ is connected'. Route 5
brief: 'Acceptance: … a torsion section is degenerate; every subvariety of a constant family is non-degenerate.'
PAPER-GAO-GE-KUHNE-26 route 5 brief: 'a constant family (S a point) is non-degenerate exactly when dim X ≤ dim A, so
every subvariety of a single abelian variety is non-degenerate'. Also: Paper p.5, Definition 1.5: 'An irreducible
subvariety X of A is said to be non-degenerate if there exists an open non-empty subset ∆ of S^an, with the Betti map b∆
… such that max_{x∈X^{sm,an}∩A∆} rank_R(db∆|X^{sm,an})_x = 2 dim X'. Paper p.8, Proposition 2.1: '(i) … b∆|As(C) : As(C)
→ T^{2g} is a group isomorphism. (ii) … b∆^{−1}(ξ) is a complex analytic subset … (iii) The product (b∆, π): A∆ → T^{2g}
× ∆ is a real analytic isomorphism', and 'b∆ is uniquely determined by (i) and (iii) up to composition with a unique
element of GL2g(Z)'. Paper p.5, Theorem 1.6: 'ĥA(P) ≥ c1h(π(P)) − c2 for all P ∈ U(Q̄)'. The extraction's route 5 brief:
'Acceptance: … a torsion section is degenerate; every subvariety of a constant family is non-degenerate.' Also: The
paper, p.43, Definition B.4: X is non-degenerate if there is a non-empty open Δ ⊆ S^{sm,an} with Betti map b_Δ such that
'max_{x ∈ X^{sm}(ℂ) ∩ A_Δ} rank_ℝ(db_Δ|_{X^{sm,an}})_x = 2 dim X'. p.41, Proposition B.2 (i)–(iii) and the sentence
after it: the Betti map 'is uniquely determined by properties (i) and (iii) up-to the action of GL_{2g}(ℤ) if Δ is
connected'. The route 5 brief: 'Acceptance: ω vanishes on the smooth locus of a curve exactly when the curve lies in a
fibre of b_Δ (Corollary 2.5); a torsion section is degenerate; every subvariety of a constant family is non-degenerate.'

**Fix.** Replace the last clause of route 5's acceptance by: 'for a constant family A₀ × S → S, an irreducible X is
non-degenerate iff its projection to A₀ is generically finite. In particular, over a point every subvariety of A₀ is
non-degenerate, and over a base of positive dimension every torsion section, A₀ × S and every Y × S are degenerate.'
Also: In route 5's brief, replace the last two acceptance clauses with: 'every subvariety of a single abelian variety (S
a point) is non-degenerate; for a constant family A₀ × S → S with dim S ≥ 1, X is non-degenerate iff the projection X →
A₀ is generically finite, so A₀ × S itself and every constant section {x₀} × S are degenerate; a torsion section over a
base of positive dimension is degenerate.' Also: In route 5's brief, replace 'a torsion section is degenerate; every
subvariety of a constant family is non-degenerate' with: 'over a base of positive dimension a torsion section is
degenerate; for a constant family A₀ × S → S, an irreducible X ⊆ A₀ × S is non-degenerate if and only if the projection
X → A₀ is generically finite onto its image (dim pr₁(X) = dim X), so A₀ × S itself and every constant section are
degenerate when dim S ≥ 1'.

### /2 — error

**Where.** PAPER-DIMITROV-GAO-HABEGGER-21/11; route 8 brief; route 7 brief

**Claim.** Route 8 asks JacobianChallengePartII for objects over M_g. These are Pic(C_g/M_g), Jac(C_g) 'with its natural
principal polarization and level-ℓ structure', the M_g-morphism C_g → Pic¹(C_g/M_g), and the difference map Pic¹ ×_{M_g}
Pic¹ → Jac. Item 11 is stated over M_g in the same way. M_g and C_g are items 10 and 12, routed to StableReductionPartII
(route 7). Route 7's brief and PAPER-YUAN-26 route 10 make StableReductionPartII import relative Jacobians, or
'Picard-family machinery', from JacobianChallengePartII. The level-ℓ structure on Jac(C_g) is the very datum M_{g,ℓ}
classifies. As written, the two new roadmaps import from each other. They stay acyclic at stage level only if
JacobianChallengePartII has a general-base layer before StableReductionPartII and an M_g layer after it. That is a
roadmap-level two-way dependency, which PROTOCOL §15's import discipline does not intend. Neither design job ('after':
[]) waits for the other. Coordinator note: this session wrote RT-PAPER-YUAN-26 (PR #5331), whose routes and finding /71
are cited here as the other sharers of the same Part II; nothing in this finding rests on that red team's verdicts.
Severity set to high by the coordinator: the coordinator checked both briefs. Route 7 says "Import ... relative
Jacobians from JacobianChallengePartII", and route 8 requires Pic(C_g/M_g) and Jac(C_g) over M_g, whose M_g and C_g are
route 7 items. Two roadmaps that import from each other are a route cycle, graded high as in RT-PAPER-FINTZEN-21 and
RT-PAPER-ZHANG-21.

**Evidence.** Route 8 brief: 'This paper requires the relative Picard group scheme Pic(C_g/M_g) = ⨆_p Pic^p(C_g/M_g) of
the universal curve, the relative Jacobian Jac(C_g) = Pic⁰ as an abelian scheme with its natural principal polarization
and level-ℓ structure (MFK Prop. 6.9), and the M_g-morphism C_g → Pic¹(C_g/M_g)'. Route 7 brief: 'Import fine moduli of
abelian varieties from PELModuli M5–M6, and relative Jacobians from JacobianChallengePartII'. PAPER-YUAN-26 route 10
brief: 'Picard-family machinery from JacobianChallengePartII'. The paper, p.23: 'Denote by Jac(C_g) the relative
Jacobian of C_g → M_g. It is an abelian scheme coming with a natural principal polarization and equipped with
level-ℓ-structure'.

**Fix.** Restate item 11 and route 8's requirements for an arbitrary smooth projective curve π : C → S of genus g ≥ 2
without a section. These are: Pic_{C/S} = ⨆_p Pic^p_{C/S} as a group scheme, Jac(C/S) = Pic⁰ as an abelian scheme with
its canonical principal polarization, the S-morphism C → Pic¹_{C/S}, and the difference map Pic¹ ×_S Pic¹ → Jac. Move
the M_g-specific statements (level-ℓ structure on Jac(C_g) and the identification with M_g ×_{A_g} 𝔄_g) to item 12 and
route 7, which instantiates the general construction at C_g → M_g.

### /3 — error

**Where.** PAPER-DIMITROV-GAO-HABEGGER-21/9; route 5; route 6

**Claim.** Item 9, the hypothesis (Hyp) of a principal polarization plus symplectic level-ℓ structure with ℓ ≥ 3, is
routed to route 6 (HeightsRationalPointsAndObstructionsPartII). Its first consumers are route 5 items: the Betti form
(item 21) and Proposition 2.2(iii)/2.7 (item 22) are both stated 'Under (Hyp)', because §2 builds ω as ι*ω_univ through
the classifying map of the fine moduli space. Route 6's brief imports 'Betti maps and non-degeneracy from
AbelianSchemesBettiMapsPartII', so with this ownership route 5 would have to import from route 6 and the two Part IIs
would depend on each other. Route 5's brief never mentions (Hyp). Severity set to high by the coordinator: the
coordinator checked that item 9 is in route 6's item list, that items 21 and 22 (route 5) are stated "Under (Hyp)", and
that route 6's brief imports "Betti maps and non-degeneracy from AbelianSchemesBettiMapsPartII". So routes 5 and 6
import from each other, a route cycle graded high as elsewhere.

**Evidence.** Paper pp.7–8: 'Let π: A → S be an abelian scheme of relative dimension g, that carries a principal
polarization, and such that A is equipped with level-ℓ-structure, for some ℓ ≥ 3, i.e., (Hyp) is satisfied.' p.12: 'As
Ag is a fine moduli space there exists a Cartesian diagram … Define ω := ι∗ωuniv.' Extraction: item 21 'Under (Hyp)
there is a closed (1,1)-form ω on A^an', item 22 'Under (Hyp), for an irreducible X ⊆ A …', both in route 5; item 9 is
in route 6's item list.

**Fix.** Move PAPER-DIMITROV-GAO-HABEGGER-21/9 from route 6 to route 5 and change its note to 'Routed to
AbelianSchemesBettiMapsPartII with the Betti form; exported to HeightsRationalPointsAndObstructionsPartII'. Add to route
5's brief: 'Define (Hyp) (principal polarization and symplectic level-ℓ structure, ℓ ≥ 3, from PELModuli M5–M6),
construct the Betti form under (Hyp) as in Proposition 2.2, and export both to
HeightsRationalPointsAndObstructionsPartII.'

### /4 — error

**Where.** PAPER-DIMITROV-GAO-HABEGGER-21/34

**Claim.** The third clause of the item is false as written. It says that on a compact projective variety, the integral
of α^{∧d} for a smooth closed (1,1)-form α 'representing any line bundle (the paper applies it to ρ₂*α, representing
O(0,1,1))' equals '(O(1,…,1)^{·d}·[X])'. A form representing c₁(L) integrates to (L^{·d}·[X]), not to the
O(1,…,1)-degree. For example α = 0 represents the trivial bundle and integrates to 0, while (O(1,…,1)^{·d}·[X]) > 0. In
the paper's own application the form represents O(0,1,1), and the integral must be (F^{·d}) = (O(0,1,1)^{·d}·[X̄_N]).
The item's formula would give (O(1,1,1)^{·d}·[X̄_N]) instead, which is a different and in general larger number. The
review generalised the clause to 'any line bundle' but kept the O(1,…,1) right-hand side. Two smaller slips: the
subvariety X̄_N is singular and lies in a smooth ambient space, and wedge products of semi-positive (1,1)-forms are
semi-positive, not positive.

**Evidence.** The paper (p.17): 'Let α be the pull-back of the Fubini–Study form under … the Segre morphism … Thus α
represents the Chern class of O(1,1)'. The paper (p.18): '(4.9) ∫_{X̄_N^an}(ρ₂*α)^{∧d} = (ρ₂*O(1,1)^{·d}[X̄_N]) where
the intersection takes place in ℙ^n×ℙ^n×ℙ^m' and '(4.10) (ρ₂*O(1,1)^{·d}[X̄_N]) = (O(0,1,1)^{·d}[X̄_N]) = (F^{·d})'. The
statement of item 34 in the extraction reads '… equals the intersection number (O(1,…,1)^{·d}·[X]) (Voisin Thm. 11.21)'.

**Fix.** In item 34, replace the third clause with: 'for a d-dimensional irreducible closed subvariety X (possibly
singular) of a smooth projective complex variety Y, and a smooth closed real (1,1)-form α on Y^an representing c₁(L) for
a line bundle L on Y, ∫_{X^{reg,an}} α^{∧d} = (L^{·d}·[X]) (Voisin Thm. 11.21). The paper applies it with Y =
ℙ^n×ℙ^n×ℙ^m, X = X̄_N, α = ρ₂*α_FS and L = ρ₂*O(1,1) = O(0,1,1), which gives (F^{·d}).' In the second clause, change
'are positive' to 'are semi-positive, and integrate non-negatively over analytic subsets'.

### /5 — error

**Where.** PAPER-DIMITROV-GAO-HABEGGER-21/67; sourceIssues E6

**Claim.** Item 67 misstates Rémond's bound as printed in David–Philippon [DP02, p.643], the source it cites. (1) The
exponent is wrong. The item has (r+1)g^5(dim X+1)^2, i.e. (r+1)·g^5·(dim X+1)^2. The source has (r+1)·g^{5(dim X+1)^2},
with the whole of 5(dim X+1)^2 in the exponent of g. For dim X ≥ 1 and g ≥ 2 the item's bound is strictly stronger than
anything the source proves, so a formaliser could not discharge the item by citing DP02. (2) The item drops the source's
standing hypothesis that A is principally polarized by a symmetric ample line bundle M. It also leaves g undefined (g =
dim A) and gives h₀(A) only by reference. The same misreading is in the correction of sourceIssues E6: for X = C − P₀
and r = 0 it gives the count as (2^{34}·h₀(Jac C)·deg(C − P₀))^{g^5·4}. The correct figure is (2^{34}·h₀(Jac C)·deg(C −
P₀))^{g^{20}}. The E6 repair itself still holds, because the bound remains independent of P₀. (3) Minor: the locator
says 'Proofs of Theorems 1.1 and 1.2'. The bound is used in the proof of Theorem 1.1 and the remark after it (p.35), and
is only mentioned in Remark 8.3 (p.36); the proof of Theorem 1.2 does not use it.

**Evidence.** David–Philippon, Comment. Math. Helv. 77 (2002), p.643 (page image checked): 'Théorème (G. Rémond). Soient
X ⊂ A une sous-variété algébrique d'une variété abelienne toutes deux définies sur Q̄ et Γ ⊂ A(Q̄) un sous-groupe de
rang fini r. Alors, avec les notations du théorème 1.4, il existe un entier naturel S satisfaisant S ≤
(2^{34}.h₀(A).deg(X))^{(r+1)g^{5(dim(X)+1)^2}}'. The exponent of g is 5(dim(X)+1)^2. pp.640–641: 'A ... munie d'un fibré
ample et symétrique M'; 'Nous supposerons dans les énoncés qui suivent que la variété A est principalement polarisée par
M et nous notons g sa dimension. Nous désignerons par h(A) la hauteur projective de l'origine de A dans le plongement
associé à M^{⊗16}'. Théorème 1.4: 'en posant h₀(A) = d max{1; h(A)}, où d = [k : Q]'. The extraction's item 67:
'(2^{34}·h₀(A)·deg X)^{(r+1)g^5(dim X+1)^2}'. Its E6 correction: '(2^{34}·h₀(Jac C)·deg(C − P₀))^{g^5·4}'. The paper,
p.35, uses the bound only in the proof of Theorem 1.1 and the remark after it.

**Fix.** In item 67, state: 'Let A be an abelian variety of dimension g over ℚ̄, principally polarized by a symmetric
ample line bundle M; let k be a number field of definition of (A, M), and let h₀(A) = [k:ℚ]·max{1, h(A)}, where h(A) is
the projective height of the origin of A in the embedding attached to M^{⊗16} ([DP02, Théorème 1.4 and p.641]). For a
subvariety X ⊆ A and a subgroup Γ ⊆ A(ℚ̄) of finite rank r, there are S ≤ (2^{34}·h₀(A)·deg X)^{(r+1)·g^{5(dim X+1)^2}}
points x_i ∈ X(ℚ̄) ∩ Γ and abelian subvarieties B_i with x_i + B_i ⊆ X and X(ℚ̄) ∩ Γ = ⋃_i (x_i + B_i)(ℚ̄) ∩ Γ.' Change
its locator to 'Proof of Theorem 1.1 and the remark after it, p.35; Remark 8.3, p.36, citing [DP02, p.643]'. In the
correction of sourceIssues E6, replace '^{g^5·4}' by '^{g^{20}}' (that is, (r+1)·g^{5·(1+1)^2} with r = 0 and dim X =
1).

## All findings

| Finding | Severity | Kind | Where | Claim (abridged) |
|---|---|---|---|---|
| /1 | high | error | route 5 brief (Acceptance); … | The acceptance test 'every subvariety of a constant family is non-degenerate' is false whenever the base has positive dimension, and it contradicts the clause … |
| /2 | high | error | PAPER-DIMITROV-GAO-HABEGGER-21/11; … | Route 8 asks JacobianChallengePartII for objects over M_g. These are Pic(C_g/M_g), Jac(C_g) 'with its natural principal polarization and level-ℓ structure', … |
| /3 | high | error | PAPER-DIMITROV-GAO-HABEGGER-21/9; … | Item 9, the hypothesis (Hyp) of a principal polarization plus symplectic level-ℓ structure with ℓ ≥ 3, is routed to route 6 … |
| /4 | high | error | PAPER-DIMITROV-GAO-HABEGGER-21/34 | The third clause of the item is false as written. It says that on a compact projective variety, the integral of α^{∧d} for a smooth closed (1,1)-form α … |
| /5 | high | error | PAPER-DIMITROV-GAO-HABEGGER-21/67; … | Item 67 misstates Rémond's bound as printed in David–Philippon [DP02, p.643], the source it cites. (1) The exponent is wrong. The item has (r+1)g^5(dim X+1)^2, … |
| /6 | medium | error | route 5 (roadmap id and brief); … | Route 5 proposes the roadmap id AbelianSchemesBettiMapsPartII ('This is the Part II proposed by PAPER-GAO-GE-KUHNE-26 under the same id'), and route 6's brief … |
| /7 | medium | missing | PAPER-DIMITROV-GAO-HABEGGER-21/25; … | Theorem 6.2 (item 25) is routed to the Betti-map Part II (route 5). Its statement and proof need objects that route 5 does not import. These are: M_g, C_S = … |
| /8 | medium | duplicate | PAPER-DIMITROV-GAO-HABEGGER-21/13; … | Item 13 bundles two constructions with different owners. The first is D_M on a single abelian variety, which RP.5 can own. The second is the family morphism … |
| /9 | medium | error | route 8 (parent, title, brief); … | Tau Ceti's JacobianChallenge already has a Part II. The accepted restructure RS-02 made AbelianSchemesAndArithmeticModuli an extension of … |
| /10 | medium | missing | route 6 brief (imports); … | Route 6's brief omits suppliers of items it owns. (a) Lemma 6.4 (item 53) uses the Hurwitz bound (item 52, planned at … |
| /11 | medium | missing | route 1; … | Route 1 sends Proposition A.2 (item 40) to HeightsRationalPointsAndObstructions:RP.0. Its proof resolves the compactifications by Hironaka's theorem (item 41, … |
| /12 | medium | error | route 4; … | Route 4 sends item 34 to ComplexComparisonPartII:C5 as 'the integration comparison this layer owns'. C5 plans the algebraic de Rham–Betti comparison for smooth … |
| /13 | medium | missing | items (none); … | The proofs of Theorems 1.1 and 1.2 use the coarse moduli space M_{g,1} of smooth genus-g curves and the fact that the fine M_{g,ℓ} is a finite cover of it. The … |
| /14 | medium | library-claim | PAPER-DIMITROV-GAO-HABEGGER-21/5; … | Item 5 (abelian group of finite rank, and its rank dim_ℚ Γ ⊗ ℚ) is marked missing and routed to RP.5 as a source, but Mathlib at 082e2d3 has it. Module.rank ℤ … |
| /15 | medium | missing | items (no item covers it); … | No item covers the Jacobian Jac(C) of a single curve over a field or the Abel–Jacobi embedding C → Jac(C), P ↦ [P − P₀]. Yet every main theorem is stated … |
| /16 | medium | error | route 3; … | Route 3 sends Siu's bigness criterion (item 32) to SchemeAndStackFoundations SF.5 as a source. Its reason says SF.5 'owns … intersection theory' and that Siu's … |
| /17 | medium | missing | PAPER-DIMITROV-GAO-HABEGGER-21/66 (locator); … | In §6.1 the paper deduces that every fibre 𝔄_{g,s} ⊆ ℙ^n of the universal abelian variety is projectively normal. Its only argument is that 'Flatness of 𝔄_g → … |
| /18 | medium | missing | PAPER-DIMITROV-GAO-HABEGGER-21 (new item; … | No item covers a key property of the Néron–Tate height used in the proof of Proposition 8.1. For a finite-rank subgroup Γ ⊆ A(ℚ̄) of rank ρ, ĥ_L extends to a … |
| /19 | low | other | prerequisites; … | The prerequisites are stale and incomplete. The Gao–Habegger 2019 entry says it is 'queued as PAPER-GAO-HABEGGER-19, not yet extracted', but that paper now has … |
| /20 | low | error | route 5 brief (mixed Ax–Schanuel import) | Route 5 tells the design job to import 'mixed Ax–Schanuel from LogicAndDefinabilityInNumberTheory LD.6 and its proposed Part II'. Neither plans Gao's mixed … |
| /21 | low | other | route 5, 6, 7 and 8 briefs (import references) | PROTOCOL §16 requires a brief to name the roadmaps it imports from by title and id. The four briefs mostly give bare ids or stage keys. Examples: … |
| /22 | low | error | report (PAPER-DIMITROV-GAO-HABEGGER-21.md), 'What the paper proves', … | The report writes the constants of Theorem 1.2 as c₁(g) and c₂(g). The paper's constants depend on g and on the chosen immersion ι of A_{g,1}. The hypothesis … |
| /23 | low | error | PAPER-DIMITROV-GAO-HABEGGER-21/22 note; … | Item 22's note says the identity ker(ω/_{T_xX}) = ker(db_Δ/_{T_xX}) comes 'from ω = b_Δ^*(2(da)ᵀ∧db)'. The report says ω̂ = 2(da)ᵀ∧db 'shows' that the top … |
| /24 | low | missing | PAPER-DIMITROV-GAO-HABEGGER-21/16; … | The uniqueness part of the Betti map, which item 16 states ('For connected Δ, b_Δ is unique up to GL_{2g}(ℤ)'), is proved in the paper with the Baire category … |
| /25 | low | other | PAPER-DIMITROV-GAO-HABEGGER-21/14 | Item 14 merges two different cited theorems with different owners: Faltings's theorem (Mordell conjecture), planned by RP.4, and the Mordell–Weil theorem, … |
| /26 | low | error | PAPER-DIMITROV-GAO-HABEGGER-21/47; … | Item 47 copies a misprint in Lemma 6.1(i): 'deg(C_s − P) ≤ c for all P ∈ 𝔄_{g,τ(s)}(ℚ̄)'. The curve C_s − P is defined only for a base point P ∈ C_s(ℚ̄), as … |
| /27 | low | error | sourceIssues E9 | E9's alternative repair is impossible as stated: '(or arrange D′ ≥ 1 by multiplying the quartic polynomials by a linear form not vanishing on S̄)'. When dim S̄ … |
| /28 | low | error | sourceIssues E16 | E16 records the misprint T^{2g} for T^{2Mg} only at its first occurrence on p.27. The same misprint recurs twice in the proof of Theorem 6.2: for b_{Δ′} on … |
| /29 | low | missing | items (none); … | Two inputs of §6 have no item. (a) Chevalley's theorem: the image of a finite-type morphism of noetherian schemes is constructible. The proof of Lemma 6.1 uses … |
| /30 | low | error | PAPER-DIMITROV-GAO-HABEGGER-21/51 | Item 51 drops the setting of Lemma 6.3. The paper fixes k algebraically closed, and it defines deg Z for a possibly reducible closed Z ⊆ (ℙ^n_k)^M as the sum … |
| /31 | low | missing | sourceIssues; … | The paper makes an unrecorded false identification. In the proof of Theorem 1.1 it says C_{F′} = C ⊗_F F′ can be identified with the fibre C_s, for F′ = F(s). … |
| /32 | low | other | PAPER-DIMITROV-GAO-HABEGGER-21/57 | The paper itself corrects the source it cites for Lemma 8.2: the height h₁ in DGH19 §2 must involve both the addition and the subtraction polynomials. Item … |
| /33 | low | missing | PAPER-DIMITROV-GAO-HABEGGER-21/42 | Item 42 bundles the Görtz–Wedhorn divisor facts used in the proof of Proposition A.2, but leaves out one the paper cites explicitly. By [GW10, Proposition … |
| /34 | low | error | report (PAPER-DIMITROV-GAO-HABEGGER-21.md), 'What the paper proves', … | The report says the small-moduli-height case 'is finished by Northcott'. Northcott, with the finiteness of the Torelli map, only reduces that case to finitely … |

## Notes for the fix job

- **Route 5.** Replace the constant-family acceptance test; move (Hyp) into route 5 and export it; import M_g, Torelli
  and relative Jacobians for Theorem 6.2; use the roadmap id the queue actually creates.
- **Routes 7 and 8.** State the relative Jacobian over an arbitrary curve family in route 8, and instantiate it at C_g →
  M_g in route 7; record that AbelianSchemesAndArithmeticModuli is already JacobianChallenge's Part II (RS-02).
- **Statements.** Correct item 34 to (L^d·[X]) and item 67/E6 to Rémond's exponent (r+1)g^{5(dim X+1)^2}, with the
  principal polarization hypothesis.
