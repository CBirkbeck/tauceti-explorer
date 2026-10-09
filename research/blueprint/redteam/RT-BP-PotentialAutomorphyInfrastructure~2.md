# RT-BP-PotentialAutomorphyInfrastructure~2

Issue #7293. Claude Code, session `cc-4691d7`, 9 October 2026.

Complete adversarial audit of the accepted round-2 blueprint of *Reusable
infrastructure for potential automorphy over CM fields*. It found **fourteen
findings: five high, six medium and three low**.

The endpoint statements hold up well. Theorems 6.1.1 and 6.1.2, Corollary 6.5.5,
Theorem 6.6.2, Proposition 6.5.13, both good-level hypothesis lists and the
rank-two lemmas of §7.1 all match the published text. So do the ten Mathlib
baseline citations and the compiled Lean cores.

What breaks is the layer underneath. The packet never names a supplier for the
torsion Galois representations that every local–global statement presupposes. Two
central normalisations are defined nowhere: the twisted Hecke action, and the
ordinary weight algebra. Several cited inputs and internal edges are missing. The
reflection step of Corollary 4.4.8 has a gap that the source shares.

## Scope and independence

I did not author or review `BP-PotentialAutomorphyInfrastructure`, its round 2, or
either review. I checked the files at `origin/main` 1a52067c: the 123-node packet,
the reader, the suggested file and the BP~2 handoff. I also read the round-2
review report and calibrated against three earlier red teams and their verdicts.

The node statements were checked stage by stage against the source at their
locators, with the proof steps compared to the cited proofs. Five parallel passes
covered PA.0/PA.1, PA.2 §5.1–5.2, PA.2 §5.3–5.5 with the ι-ordinary nodes,
PA.3/PA.4, and PA.5. I re-verified every finding below myself against the source
text and the packet before recording it. Candidate issues I could not make
airtight were dropped; they are listed at the end.

| Source | Use in this audit |
| --- | --- |
| ACC, *Potential automorphy over CM fields*, Annals 197 (2023), author-hosted published PDF, https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf, read 2026-10-09 | The main text. Its SHA-256 `c5429e4f…` equals the packet's, and page 1 has the title and Annals header. Printed page = PDF page + 896. |
| ACC arXiv 1812.09999v2, SHA-256 `7c882c4d…` | Numbering comparison only. |
| Caraiani–Newton, arXiv 2301.10509v3, SHA-256 `57abc79a…` | Every `[ACC+18]` citation traced to its PA (or other) owner. The title was verified on page 1. |
| Qian (NSF copy), BCGNT `SatoTate.pdf`, BCGP, BLGGT (arXiv and author copy) | For the PA.2 ι-ordinary nodes and the PA.5 nodes. Hashes equal the packet's. |

## High-severity findings

### 1. No supplier for the Hecke-algebra-valued Galois representations

**The gap.** ACC Theorems 2.3.5, 2.3.7 and 2.3.8 / Proposition 2.3.9 (Scholze) are
the first input of several statements: Proposition 4.4.6 (p. 981), Corollary 4.4.8
(p. 982), Theorem 4.5.1 (p. 985), Proposition 5.4.18 (p. 1022), and Propositions
6.5.3 and 6.5.11 (pp. 1063, 1067). The PA nodes either assert the representation's
existence in their conclusion or name "Theorem 2.3.7" in their statement. Yet no
prerequisite, request or gap names an owner. TorsionCohomologyInfrastructure occurs
0 times in the packet, although the atlas lists it as a prerequisite of the roadmap
and the accepted ACC extraction plans these theorems in TC.2–TC.4.

**Related unused nodes.** The accepted IHG packet already states:
- ACC Definition 2.3.6 (Galois type, non-Eisenstein), as IHG.3/galois-type-maximal-ideal;
- ACC Lemma 2.2.4, as IHG.2/ghost-nilpotence.

PA cites neither, though "non-Eisenstein" appears in almost every PA statement.

**Fix.** Make TC.4 a prerequisite, with an exact request covering the T^S,
equivariant, ordinary and O[Δ_Q] forms and the unitary 2n-dimensional form. Cite
the IHG.2/IHG.3/IHG.4/IHG.5 nodes. A reachability check shows no cycle results.

### 7. The twisted action that normalises the U-operators is defined nowhere

**What ACC does (p. 923).** It defines the Iwahori-level operators through
g·ₚx = α_λ(g)⁻¹g·x on V_λ, with α_λ(k₁ diag(ϖ^{a})k₂) = ∏τ(ϖ)^{a_i(w₀λ)_{τ,i}}.
That twist is what makes U_{v,i} integral and invertible.

**What the packet does.** Its sourceCoverage gives this item (45) to
PA.2/iwahori-level-tower. That node only says U_{v,i} acts by the double coset
operator, and no node anywhere defines α_λ or ·ₚ. Two other nodes refer to "the
·ₚ-action of §2.2.5" as if it existed.

**Why it matters (n = 1).** Take a weight with λ_τ ≥ 0, not all zero. Without the
twist, U_{v,1} carries the non-unit factor ∏τ(ϖ)^{λ_τ}, so it is not invertible.
The ordinary part is then zero and T^{S,ord} cannot act.

**Fix.** Define α_λ, ·ₚ, and the action of H(Δ_p, K_p) through it, together with
the G̃ analogue. Add an n = 1 test.

### 8. The ordinary weight algebra Λ is undefined, and hypothesis (3) of Theorem 6.6.2 is unused

**What ACC does (p. 1076).** It defines Λ_{1,v}, Λ_1, p_μ and ℘_μ, then ℘_{0,v}
(the minimal prime below ℘_{μ,v}), Λ_v and Λ. It notes that condition (3) of
Theorem 6.6.2 makes ℘_{0,v} also the minimal prime below ℘_{λ,v}.

**What the packet does.**
- Nine ordinary nodes use "Λ_1", "Λ", "the weight algebra" and "the specified minimal prime", but none defines them.
- The symbol ℘ never occurs in the packet.
- No proof step uses hypothesis (3).
- L8/ordinary-coefficient-ring allows any intersection of minimal primes, so it cannot supply this choice either.

**Fix.** Add a PA.3 definition node and a lemma that (3) ⇔ ℘_{0,v} ⊂ ℘_{λ,v}. Use
the lemma in the proof of Theorem 6.6.2.

### 9. Proposition 5.4.18 lacks its characteristic-zero ordinary input

**What ACC uses (pp. 1022–1024).**
- Theorem 2.4.11, [Ger19, Lem. 5.4], and Theorem 2.3.3 with [Tho15, Th. 2.4], to get the 2n-dimensional representation ordinary of the form (5.4.19).
- An auxiliary character χ with conditions (1)–(3).
- An ordinary twisting isomorphism generalising Proposition 2.2.23.

**What the packet does.** The node's prerequisite closure (65 nodes) contains none
of these. Its proof step speaks of a "crystalline" representation, which is wrong
at Iwahori level. Thorne's theorem is planned only in PL.0/iota-ordinary-implies-ordinary,
which is in PA's own Part II and downstream of PA.2. PA.1's genericity twist cannot
serve as χ, because it is trivial at every place of S.

**Fix.** Plan the ordinary local–global input upstream: in PA.2, with PL.0
importing it, or by a request to AG2.5/AG2.6. Add the χ and twisting nodes.

### 11. The reflection step of Corollary 4.4.8 does not deliver condition (b)

**The claim.** PA.1/degree-reflection-duality says, as ACC does on p. 983, that
ρ = (f∘ρ′)^∨ ⊗ ε^{1−2n+(p−1)/2} has "the same properties (a)–(c)".

**Why (b) does not follow.**
- MF^a consists of modules with jumps in [a, a+p−2] (p. 966).
- (b) for ρ′ places its jumps in [n₀−λ_{τ,1}, n₀−λ_{τ,1}+p−2]. After dualising and twisting, this window becomes [λ_{τ,1}+n+1−p, λ_{τ,1}+n−1].
- (b) for ρ needs the window [λ_{τ,n}, λ_{τ,n}+p−2]. Under hypothesis (3) the two windows never coincide.
- (c) concerns the 2n-dimensional representation and does not say which n of the 2n weights belong to ρ′.
- The reflections of the conjugate-block weights are all below λ_{τ,n}. If ρ′ carried any of them, ρ would fail (b).

**Counterexample to the deduction** (n = 1, λ = 0, p = 5, F_v = Q₂₅):
- A character ρ′ with jumps (2, −1) satisfies (b) and is compatible with (c).
- ρ = ρ′⁻¹ε then has inertial character ω₂³.
- No rank-one object of MF^{(0,0)} has that character, because j₀ + 5j₁ ≡ −3 (mod 24) has no solution with 0 ≤ j₀, j₁ ≤ 3.

**Consequences.** Theorem 4.5.1 takes (b) directly from Corollary 4.4.8 (p. 987),
so the planned Theorem 4.5.1(b) inherits the gap. None of E21–E32 records it. This
is a gap in the published argument, not a claim that the theorem is false.

**Fix.** Record a source gap. Either supply an input pinning the residual
Fontaine–Laffaille weights of ρ′ to the GL_n block, or restate (b) in the reflected
range and re-derive Theorem 4.5.1(b).

## Medium-severity findings

- **2. Wrong owner for Theorem 3.1.1.**
  - The packet requests ACC Theorem 3.1.1 (torsion, pro-ℓ-Iwahori, Hecke-valued local–global compatibility at R) from AG2.5. AG2.5 is the characteristic-zero comparison stage.
  - The accepted extraction (route 1) sends Theorem 3.1.1, Proposition 3.1.2 and the §2.2.5 operators t_{v,i}(σ), e_{v,i}(σ) to IntegralHeckeAndGaloisDeterminants Part II. That design job is open, as issue #3383.
  - PA.0/ramified-satake-descent uses those operators with only SR.1 cited.
- **3. Theorem 2.4.11 is unsupplied.**
  - Propositions 4.4.6 (p. 980) and 5.4.18 (p. 1023) cite Theorem 2.4.11; that is what the CTG hypothesis is for. No PA node names it, and the only ALS.5 request asks for Theorem 2.4.10.
  - The accepted ALS packet states Theorem 2.4.11 as ALS.5/unitary-middle-degree and Theorem 2.4.10(2) as ALS.5/non-eisenstein-degree-range. PROTOCOL §3 requires these exact ids.
  - Caraiani–Newton's Proposition 4.2.11 (CL.7) is a variant of the same theorem.
- **4. A stage cycle through PA's own Part II.**
  - PA.5's two field checklists import PotentialAutomorphyInfrastructurePartII:PL.0/auxiliary-cm-extensions.
  - PL.0 now requires PA.2 and PA.5. This followed PA's own restructure request, whose claim that no cycle arises only defers it.
  - The strongly connected component is {PA.2, PA.5, PL.0}.
  - The needed field lemma has an accepted upstream owner, R23.1/cht-soluble-prescribed-completions.
- **10. No ι-ordinary ↔ T^{S,ord} comparison.**
  - ACC uses this comparison in both directions in the proof of Theorem 6.6.2 (pp. 1076, 1080) and in Corollary 5.5.2 (p. 1028). The packet cites Theorem 2.4.10, which concerns only T^S.
  - The closure of the Theorem 6.6.2 node contains no ι-ordinary node, and hypothesis (8) is used nowhere.
  - Corollary 5.5.2 also drops the source's [F′:Q] > 2.
- **12. Missing hypotheses in PA.1.**
  - Propositions 4.4.1 and 4.4.6 are stated, as in ACC, for "a good K̃". Their own prerequisites (Theorem 4.2.1, Proposition 4.3.4) need K̃ decomposed with respect to P. E16 adds only the K̃_U condition.
  - The §4 standing hypothesis (p unramified in F; an imaginary quadratic subfield in which p splits) appears in full only in the Theorem 4.5.1 node. Yet G^a and V_λ̃ depend on it.
- **13. Missing internal edges.**
  - Theorem 5.4.3 (p. 1014) uses Lemma 5.3.3 and Proposition 5.2.15, but its node cites neither. The Lemma 5.3.3 node is therefore consumed by no node in any packet, and its proof sketch ("surjectivity", "ordinary localization") misdescribes the lemma.
  - Proposition 4.4.6 uses Lemma 4.3.6 (p. 979), which its node does not cite.
  - Proposition 5.2.15 and Corollaries 5.2.16 and 5.2.18 do not reach the node defining the finite-level ordinary summand.
- **14. Completed cohomology without its owner.**
  - PA.2 builds its own carriers π(K^p,λ,m) and π̃_∂, and uses localisations that need Lemma 5.2.14 (pp. 998–999).
  - The extraction plans these in CompletedCohomologyPartII CC.1/CC.6/CC.8, and CC.8 asks consumers not to build second carriers.
  - The packet never mentions CompletedCohomologyPartII, and item 149 (Lemma 5.2.14) is absent from its coverage.

## Low-severity findings

- **5. Requests that duplicate existing supplier nodes.**
  - The L7 request asks for ACC Lemma 6.2.11 and Proposition 6.2.12. These are the accepted L8/distinct-characters-flag and L8/determinant-flag-comparison, which sit in L8, not L7.
  - The G8 variable-determinant nodes exist but are cited only as a stage.
- **6. Unit tests that miss their own conventions.**
  - Every KostantShuffle test permutation is an involution, so "w increasing on the blocks" passes all four tests. The review's claim that the tests "distinguish inverse-increasing left shuffles" does not hold.
  - The CTGWeight tests cannot see a dropped reversal or a difference in place of the sum.
  - The weak-automorphy tests cannot see rec versus rec^T, or arithmetic versus geometric Frobenius.
  - Concrete distinguishing tests are proposed in the finding.

## What was checked and holds

The `checked` list in the result file gives the details. In brief:

**Endpoint statements.**
- Theorems 6.1.1/6.1.2 with Remarks 6.1.3–6.1.4.
- The seventeen §6.5.1 and fifteen §6.6.1 hypotheses.
- Corollary 6.5.5 and Theorem 6.6.2.
- Proposition 6.5.13. Its every-place local identity holds through ET.7a with Harris–Taylor VII.2.6, confirmed through two secondary quotations.
- Theorems 4.5.1 and 5.5.1.
- Lemmas 7.1.1–7.1.3 and facts (1)–(8).
- Definition 4.3.5, (2.2.2) and χ_{λ,v,i}.

**Source issues and conventions.**
- E58 is right: only g = qn − n²[F⁺:Q] balances the dimension count.
- The q_GL/q_patch conventions are right.

**Baseline.** All ten Mathlib declarations were read at 082e2d3, and every
"provides" text holds. Tau Ceti f790474 supplies none of the PA targets.

**Suggested Lean file.** It was compiled under the lock with
`lake env lean <worktree>/research/blueprint/suggested/PotentialAutomorphyInfrastructure.lean`.
The result was exit 0 with 92 warnings, all `sorry`. Every typed core is true as
stated; I checked in particular the subgroup and diamond-quotient claims, the flag
count ≡ n!^{#Q}, the Fitting-summand claims, and the cell/openness and orientation
formulas. The tests other than those in finding 6 discriminate.

**Caraiani–Newton.** It needs from PA the results PA plans (Theorems 2.4.4, 4.2.1,
4.5.1, 5.4.1, Proposition 4.4.1, Corollary 4.4.8, the §5.2–5.3 lemmas, and
Propositions 6.5.3 and 6.5.13). It also needs the inputs missing in findings 1–3.
CL.7 can use PA.1/ctg-weight unchanged, because CN Definition 4.2.10 equals ACC
Definition 4.3.5.

## Noticed outside the target (not findings against this packet)

**CrystallineLocalGlobalCompatibilityCM (PA's Part II for the focus area).**
- CL.9/proof-thm-5-2 imports ML.5 for ACC Proposition 6.5.13, which PA.5 now owns. ML.5/cyclic-base-change-gln restates it, and PA's restructure entry covers ML.5 but not CL.9.
- CL.3/lem-2-3-2 imports PA.2/relative-bruhat-cells for P\G/P double cosets indexed by ^PW^P. That node provides P\G/B cells indexed by W_P\W, so it is a near miss.
- CL's AG2.5 request repeats the characteristic-zero routing of torsion local–global compatibility questioned in finding 2.
- CL's PA.0 request cites an "ACC+ Theorem 3.4.2" that does not exist in the published numbering.

**Smaller PA points left out as low value.**
- Lemma 7.1.3 says "contains SL₂(F_l)", as the source does, where "a conjugate of" is meant.
- An example congruence in the FL field checklist includes p_c, so it cannot be satisfied as literally written.
- The u_p label in the PositiveTorusMonoid API is wrong when ϖ_v ≠ p.
- The IG.7 request mentions a "Corollary 4.3.2" that does not exist.
- The descent nodes do not state n ≥ 2.
