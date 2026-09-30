# RT-PAPER-BENOIST-19: red team of the Benoist real-surface period-index extraction

Red team: Claude Code, session `cc-48533a`, 30 September 2026 (issue #4302).

**Target.** `PAPER-BENOIST-19` extracts O. Benoist, *The period-index problem for real surfaces*, [Publ. Math. IHÉS 130 (2019), 63–110](https://doi.org/10.1007/s10240-019-00108-7).

**Who did what.**
- The extraction was written by Claude Code `cc-442dc5` (issue #1454; PRs #2016, #2066, #2120, #2122), after a checkpoint by Codex `codex-a71f92` (PR #1673); `codex-c83e7a` appears in item notes.
- `REV-PAPER-BENOIST-19` was written by Claude Code `cc-d67081` (PR #2458) and accepted the extraction with no change to items, statuses or routes.
- The separate errata record was written by `cc-442dc5` (PR #2161) and reviewed by Codex `codex-hjdg0j` (PR #2295).
- I did none of this. The string `cc-48533a` occurs in none of the target files and in none of the commits that touch them.

**Disclosure.** This session wrote or reviewed extractions of other papers and verified other red teams (listed in the `checked` field). None of them is compared against here, and no finding depends on them.

**Result: 60 findings.** 6 are high, 27 medium and 27 low. The machine-readable file is [RT-PAPER-BENOIST-19.result.json](RT-PAPER-BENOIST-19.result.json); it carries the full evidence for every finding.

- **Where the work is sound.** Most of the 187 items follow the published text; the 13 library claims and the 13 planned placements hold at the pins apart from the points below; and most recorded source issues (E1, E2, E5, E6, E10–E12, E17 and others) were re-derived and confirmed.
- **Where it breaks.**
  - Four items are false as stated: 78 (a dropped hypothesis), 107 (wrong stalks), 118 (S(ℝ) = ∅) and the last sentence of 15. Item 141 is stated too weakly for its one use.
  - The proof of Proposition 6.6 has an unrecorded gap at its final transport step, and Lemma 6.4's printed construction is wrong. Both are new source issues.
  - The recorded reasons for E3 and E4 misquote the definition of Θ, and two reviewed records of the same mistakes disagree.
  - The routes contain dependency cycles through SF.2 and depend on a queue mechanism that can defer the Part IIs they need. Thirteen items duplicate material other accepted work already plans.

## Source

| Text | Where | SHA-256 |
| --- | --- | --- |
| Published, Publ. Math. IHÉS 130 (2019), 48 pp. | [Numdam](https://www.numdam.org/item/10.1007/s10240-019-00108-7.pdf), fetched 30 September 2026 | `8dfc0f22…398d3b` (matches the extraction) |
| arXiv 1804.03642v2 (15 May 2019), PDF and LaTeX | [arXiv](https://arxiv.org/abs/1804.03642v2) | `5dc12ae7…9c3cda` |

- **How we read it.**
  - Five readers split the work into disjoint slices: items 01–56, items 57–110, items 111–187, routes and prerequisites, and source issues.
  - Each read the published text, rendered page images where the text layer drops symbols (pp. 64, 79, 84, 85, 92, 95, 96), and used the TeX for every formula.
  - I merged their reports and checked the single-reader findings with the most at stake myself:
    - Proposition 5.5's hypothesis in the TeX (finding 4);
    - the Witt step of Proposition 4.2 in the TeX (finding 3);
    - §8.1's standing assumption S(ℝ) ≠ ∅ in the TeX (finding 11);
    - the grouping key and the 'plan the first here' instruction in `make_queue.py` (finding 1).
  - Ten findings were reached independently by two or three readers and are merged: 2, 5, 6, 7, 9, 10, 14, 21, 30 and 40.
- **Errata.** arXiv has no version after v2, Crossref has no update relation for the DOI, and neither the journal page nor the author's page lists an erratum.

## High findings

### 1. make_queue can defer Benoist's Part II suppliers (high, other)

**Where.** research/blueprint/papers/PAPER-BENOIST-19.result.json routes 6, 7, 8 (and 5); research/blueprint/make_queue.py paper_designs

**What goes wrong.** The queue does not plan the four Part IIs under the ids and titles the routes give. paper_designs groups every accepted part-ii route by its parent alone, names the job <base>PartII, drops the route's 'Part II: <what it adds>' title, and tells the design job to plan only the FIRST proposal (registry order) when the proposals split into independent directions, recording a restructure proposal for the rest. For two of Benoist's Part IIs the first proposal is an unrelated direction: DESIGN-AlgebraicTopologyPartII lists Browning–Sawin's 'configurations and rational double loops' first, then BW20 and Benoist's 'involutions and real-locus cohomology'; DESIGN-QuadraticFormInvariantsPartII lists Dittmann–Pop's 'all-characteristic higher Pfister forms' first, then BW20 and Benoist's 'orderings and real function fields'. DESIGN-HodgeStructuresPartII merges seven continuations with Landesman–Litt's 'variations, period maps and non-abelian Hodge theory' first. So the equivariant real-locus topology (29 items here, 49 from BW20) and the ordering/u-invariant theory can legitimately be deferred to a restructure proposal, leaving RealSurfacePeriodIndex without the suppliers its brief imports. The review's claim that the Part IIs merely 'join existing proposals with identical id, parent and title' is checked against the wrong key: the queue ignores the id.

**Evidence.** make_queue.py paper_designs: 'key = ("part-ii", route["parent"]) if route["route"] == "part-ii" else ("new", route["roadmap"])'; 'part, rid, built = "Part II", base + "PartII", ""'; job text 'Plan them as this one roadmap, merging what overlaps; if they split into independent directions, plan the first here and record a restructure proposal for the rest.' Read-only simulation with make_queue's own accepted_routes/paper_designs on the current repository gives: DESIGN-AlgebraicTopologyPartII = [PAPER-BROWNING-SAWIN-20 route 7 ConfigurationSpacesAndRationalLoops (registry #39), PAPER-BENOIST-WITTENBERG-20 route 6 (#120), PAPER-BENOIST-19 route 6 (#197)]; DESIGN-QuadraticFormInvariantsPartII = [PAPER-DITTMANN-POP-23 route 5 HigherPfisterForms (#26), BW20 route 7, BENOIST-19 route 8]; DESIGN-HodgeStructuresPartII = [LANDESMAN-LITT-24 route 2 HodgeStructuresPartII (#15), GAO-HABEGGER-19 route 7, HEUER-25 route 5, QIAN-23 route 14, BAKKER-KLINGLER-TSIMERMAN-20 route 8, BENOIST-19 route 7, ESNAULT-GROECHENIG-20 route 1]; DESIGN-SemisimpleAlgebrasPartII = [BENOIST-19 route 5, ESNAULT-GROECHENIG-20 route 2 SemisimpleAlgebrasPartIIGeometricMorita]. None of AlgebraicTopologyPartII, HodgeStructuresPartII, QuadraticFormInvariantsPartII, SemisimpleAlgebrasPartII exists in data/atlas.json, so no Part III shift occurs.

**Fix.** For the maintainer: either key part-ii groups by (parent, roadmap) or instruct the merged job to plan every accepted direction as successive layers, not 'the first here'. In the extraction: add to the briefs of routes 6, 7 and 8 an explicit sentence that this tranche is a required supplier of the accepted new roadmap RealSurfacePeriodIndex and must be planned in the merged '<parent>, Part II' job, not deferred to a restructure; name the co-proposers the queue will merge (routes 6: PAPER-BROWNING-SAWIN-20 route 7; 7: PAPER-LANDESMAN-LITT-24 route 2, PAPER-HEUER-25 route 5, PAPER-QIAN-23 route 14, PAPER-ESNAULT-GROECHENIG-20 route 1; 8: PAPER-DITTMANN-POP-23 route 5).

### 2. Route 1 closes cycles through SF.2 (high, error)

**Where.** PAPER-BENOIST-19 route 1 (SchemeAndStackFoundations:SF.2), items 33, 34, 55, 56, 148; interaction with routes 2 and 6 and with PAPER-BENOIST-WITTENBERG-20 routes 1 and 6; route 2 (MC.2) item 43; atlas edge SchemeAndStackFoundations:SF.2 → MotivesAndAlgebraicCycles:MC.2; prerequisites note 'Route SF2 consumes TOPO'

**What goes wrong.** Route 1 puts into SF.2 statements that need objects owned downstream of SF.2, which closes cycles in the recorded stage graph. Items 33 and 55 (complex and real Kummer sequences) contain Pic(X)/n; Pic is owned by SF.3, whose only input is SF.2. Items 34 and 56 (topological Brauer sequences) contain cl(Pic X) in H²(X(C),Z) and H²_G(X(C),Z(1)); that cycle class map is item 43 (with 53), which route 2 sends to MC.2, whose inputs include SF.2. So SF.2→SF.3→SF.2 and SF.2→MC.2→SF.2. Item 148 (Scheiderer's equivariant–étale comparison) makes SF.2 import the equivariant-topology Part II ('Import general equivariant topology'), while the brief of the same proposed Part II from BW20, which route 6 says to coalesce with, says that Part II imports 'scheme/étale comparison from Scheme and stack foundations': SF.2⇄AlgebraicTopologyPartII. Route 1 also carries none of the splitting guard that BW20 route 1 and Česnavičius-19 route 3 attach to the same stage. A second reader found the same cycle independently. Its evidence adds that the atlas already has the edge SF.2 → MC.2, that items 55 and 56 also need equivariant Betti cohomology (items 40–41, route 6), that the prerequisites note says 'Route SF2 consumes TOPO', and that SF.2's own description ('Own Zariski, etale, fppf and pro-etale site comparisons …; Inputs: SF.1') has no Betti or equivariant side.

**Evidence.** data/atlas.json SF.3: 'Integrate AlgebraicCurves and JacobianChallenge: divisors, line bundles, Riemann-Roch, Serre duality, genus, Picard schemes and Jacobians … Inputs. SchemeAndStackFoundations:SF.2'. MC.2: 'Inputs. MotivesAndAlgebraicCycles:MC.1, SchemeAndStackFoundations:SF.2, SchemeAndStackFoundations:SF.6'. Item 34: '0→H²(X(C),Z)/(nH²+cl Pic(X))→Br(X)[n]→H³(X(C),Z)[n]→0'; item 56: '0→H²_G(X(C),Z(1))/(nH²_G+cl Pic(X))→Br(X)[n]→…'; item 43 (route 2, MC.2): 'construct cl_C…, equivariant cl:CH^k(X)→H^{2k}_G(X(C),Z(k))'. Route 1 reason: 'Import general equivariant topology'. PAPER-BENOIST-WITTENBERG-20 route 6 brief: 'Import scheme/étale comparison from Scheme and stack foundations (SchemeAndStackFoundations)'. BW20 route 1 reason: 'Split early site foundations from the later Gersten/norm-residue-dependent suffix at integration, never introduce a blanket cyclic stage dependency.' No Pic of a scheme exists at the pinned libraries (declaration index: only TauCeti.NumericalType Picard lemmas for stable reduction). Published p. 76: '(2.17) 0 → H²_G(X(C), Z(1))/⟨n, Pic(X)⟩ → Br(X)[n] → H³_G(X(C), Z(1))[n] → 0, where cl : Pic(X) → H²_G(X(C), Z(1)) is Krasnov's cycle class map.' Item 56 prints 'nH²_G+cl Pic(X)'. Route 2 reason: 'MC.2 owns realization and cycle-class maps … consuming the equivariant topological supplier'. The atlas stageEdges contain {source: SchemeAndStackFoundations:SF.2, target: MotivesAndAlgebraicCycles:MC.2}. Atlas SF.2: 'Inputs. SchemeAndStackFoundations:SF.1'. The extraction's prerequisites entry for Scheiderer 1994: 'Route SF2 consumes TOPO.' PAPER-BENOIST-WITTENBERG-20 route to EquivariantTopologyRealVarieties, brief: 'Import scheme/étale comparison from Scheme and stack foundations (SchemeAndStackFoundations)'.

**Fix.** Move items 33, 55 and 148 to SchemeAndStackFoundations:SF.6 ('exact interface comparisons to … analytic … owners'), which lies after SF.3 and before MC.2, or to an explicitly named late suffix of SF.2 that requires SF.3 and the topology Part II. Move items 34 and 56 to MotivesAndAlgebraicCycles:MC.2 beside items 43 and 53 (or to RealSurfacePeriodIndex). Add to route 6's brief: the topology Part II must not import SchemeAndStackFoundations; the étale comparison lives in SF and imports the Part II, and consumers (MC.2, RealSurfacePeriodIndex) import both. Keep only the étale statements in SF.2 (Br(X) = H²_et(X, G_m) and 0 → Pic(X)/n → H²_et(X, μ_n) → Br(X)[n] → 0, with items 09 and 10), and move the Betti and equivariant-Betti forms (1.1), (1.2), (2.16) and (2.17) downstream of both MC.2 and the topology Part II. Update the prerequisites note 'Route SF2 consumes TOPO' so that no SF stage depends on a topology Part II.

### 3. Item 141 states Witt's theorem too weakly, making Proposition 4.2 circular (high, error)

**Where.** PAPER-BENOIST-19.result.json item 141 (consumer item 64, Proposition 4.2; proof spine 'Real degree-two sufficiency under uniform evaluation')

**What goes wrong.** Item 141 states Witt's theorem only for classes that are UNRAMIFIED on the curve: 'A quaternion/conic class over the function field of a smooth integral real curve which is unramified and trivial at every real point is split.' That is not the input Proposition 4.2 uses, and with that hypothesis the proof of Proposition 4.2 becomes circular. There the curve Gamma' passes through the point x of the exceptional curve Gamma, and the class p*alpha restricted to R(Gamma') has residue at x equal to res_Gamma(alpha)|_x, which is exactly the quantity being shown to vanish. So one cannot know in advance that the restricted class is unramified at x. The input needed is Witt's local-global principle for classes that may be ramified.

**Evidence.** Published p.80, proof of Proposition 4.2: 'choose a curve Gamma' in T that meets Gamma transversally at x, and that intersects T_U ... p*alpha|_y = 0 in Br(R) for y in T_U(R), hence for y in Gamma'(R) general. By a theorem of Witt, it follows that p*alpha|_R(Gamma') in Br(R(Gamma')) = 0 ... As a consequence, the residue of p*alpha|_R(Gamma') at x vanishes. Since it coincides with the restriction of res_Gamma(alpha) at x, the proof is complete.' Only vanishing at general real points of Gamma' is available, so the hypothesis of item 141 that the class is unramified along the whole curve is not available at x. Item 141 appears in no dependency list and in no proof spine; item 64 has no dependencies.

**Fix.** Restate item 141: 'Let C be a smooth integral curve over R and beta in Br(R(C))[2], not assumed unramified. If beta vanishes at every point of a dense subset of C(R) at which it is unramified (equivalently, beta vanishes at every ordering of R(C)), then beta = 0. In particular Br(R(C)) = 0 when C(R) is empty.' This is Witt's theorem that conics over a real function field of one variable satisfy the local-global principle at the orderings. Add item 141 as a dependency of item 64 and to the proof spine that contains 64.

### 4. Items 75 and 78 drop Proposition 5.5's hypothesis; item 78 is false (high, error)

**Where.** PAPER-BENOIST-19.result.json items 75 and 78 (Proposition 5.5)

**What goes wrong.** Item 75 builds N from an arbitrary very ample A and item 78 then asserts H^1(R', N|R') = 0. Proposition 5.5 assumes instead that A is ample with H^1(R, A|R) = 0, and part (iii) is exactly that hypothesis. Without it, item 78 is false. P and Q are disjoint from R, so N|R' = A|R and H^1(R', N|R') = H^1(R, A|R) whatever points are blown up.

**Evidence.** Published p.89, Proposition 5.5: 'Let A be an ample line bundle on S, such that H1(R, A|R) = 0. Let N := mu*A(2F - 2E).' Proof: 'Condition (iii) follows from our choice of A.' Counterexample to item 78 as stated: S = P^2 over R, R a smooth real plane quartic (an SNC divisor of genus 3), A = O(1), which is very ample. By adjunction A|R = O_R(1) = K_R, so h^1(R, A|R) = h^0(R, O_R) = 1, not 0.

**Fix.** State item 75 as the paper does: 'A ample on S with H^1(R, A|R) = 0' (very ample is an unneeded strengthening). Make item 78 cite this hypothesis, and add that such an A exists because a high power of any ample bundle works by Serre vanishing on R (item 138). Proposition 6.6 chooses A this way.

### 5. Proposition 6.6's transport step needs a normalised lift (high, error)

**Where.** Items 85 and 87, and the proof of item 166 (Proposition 6.6, pp.94-95); route 6 brief ('Prove equivariant Ehresmann transport'); the proof of Proposition 1.2 (p. 71) and E2; sourceIssues (no entry)

**What goes wrong.** The last step of Proposition 6.6 transports the integral lift beta from T = T_s to a nearby fibre T_x. It concludes alpha_{T_x} = 0 from beta_x = 2gamma + 2delta + cl(phi) and (2.17). That needs the transported beta_x to be a lift of alpha_{T_x}, which nothing proves. Lifts of alpha_T are only defined modulo 2H^2 + cl(Pic(T_s)), and Proposition 4.5 (and its typed repair, item 165) accept any lift. For example, beta and beta + cl(O_T(C)), with C the special curve, both lift alpha_{T_s}. Their transports differ by the transport of cl(C), which leaves the (1,1) locus at nearby real points: that is exactly what items 74 and 86 show. So the two transports cannot lift the same class unless that transported class is algebraic modulo 2. The printed proof never picks beta. Item 87 as stated (plain equivariant local triviality) cannot close the gap, because alpha-tilde lives only on U, so the comparison happens on the open pieces T_{y,U}. A second reader found the same gap independently. It adds that in section 1 the E2 repair (beta mod n = p*alpha-tilde, with alpha-tilde a class on S and hence on the whole family) is what makes the transport in Proposition 1.2 valid, a second role that E2 does not record; in section 6 nothing plays that role. Neither reader built an explicit counterexample, so the finding is that the step is unjustified, not that the conclusion fails.

**Evidence.** p.95: 'By the real Lefschetz (1,1) theorem [9, Proposition 2.8], there exists phi in Pic(T_x) such that beta = 2gamma + 2delta + cl(phi) in H2G(T_x(C), Z(1)). By the exact sequence (2.17), replacing T with T_x proves the proposition.' p.84: beta is 'a class beta in H2G(T(C), Z(1))' lifting p*alpha, with beta|TU = p*alpha~ + 2epsilon + cl(phi), phi in Pic(TU). This is the same issue the extraction already repaired in section 1 by choosing beta mod n = p*alpha~ (item 36, gap G2). No real-case counterpart exists: item 165 says 'for any integral beta lifting p*a'. p. 94: 'From now on, using this G-equivariant isomorphism, we identify the Betti cohomology groups and the equivariant Betti cohomology groups of the fibers of pi'. p. 95: 'there exists phi in Pic(T_x) such that beta = 2gamma + 2delta + cl(phi) in H^2_G(T_x(C), Z(1)). By the exact sequence (2.17), replacing T with T_x proves the proposition.' p. 71 (section 1): 'beta = n gamma + n delta + cl_C(phi) for some phi in Pic(T_x) ... The exact sequence (1.2) then shows that alpha|_{T_x} = 0'. p. 93: beta is obtained from Propositions 4.2, 4.4 and 4.5 only as 'a class beta in H^2_G(T(C), Z(1))' inducing alpha_R(T).

**Fix.** (a) Add a normalisation step before Proposition 4.5. Write beta mod 2 restricted to T_U as p*alpha~ + cl(phi) with phi in Pic(T_U), and replace beta by beta - cl(phi-bar), where phi-bar is any extension of phi to T (Pic(T) -> Pic(T_U) is onto). Then beta mod 2 restricted to T_U equals p*alpha~, and item 165 still applies. (b) Strengthen item 87 to a relative version: over a small contractible Omega(R), the G-equivariant trivialisation can be chosen to preserve the divisor p^{-1}(R) (the pairs (T_y, p_y^{-1}(R)) form a locally trivial family: the curves over Sing R are fixed and R cap D_y moves smoothly). Then p*alpha~ on the complement is carried to p_y*alpha~, and beta_x mod 2 restricted to T_{x,U} equals p_x*alpha~. (c) Finish with: beta_x in 2H^2 + cl(Pic(T_x)) gives p_x*alpha~ in cl(Pic(T_{x,U})) mod 2, so alpha_{T_x} = 0 by (2.16) and purity. Record this as a gap in the source under section 18 (affects: the proof). Record the source issue with locators 'Proposition 6.6, pp. 94-95' and 'Proposition 1.2, p. 71', kind gap, known new; state the choice of beta in item 166 and in the proof outline of items 86-90; and add to E2's reason that the compatible choice also makes the transport in Proposition 1.2 valid.

### 6. Item 107's stalks are Z/4 when 4 ∤ n (high, error)

**Where.** PAPER-BENOIST-19.result.json item 107 ('The second circle double cover'), statement and unit test 1

**What goes wrong.** Item 107 asserts that 'The extension in item 106 is locally constant with F2^2 stalks'. That is false when 4 does not divide n, including n = 2, where the stalks are Z/4 and the extension (7.6) does not split. The paper states both cases and says it does not need the fact; the file's own item 156 and gap G4 also say that no split circle extension follows. A worker formalising item 107 as stated would be trying to prove a false statement. The double cover the item needs is unaffected: the preimage of 1 under a surjection Z/4 → Z/2 still has two elements. Two readers found this independently; the clause is not used downstream, but a false statement in an item is a proof obligation that cannot be met.

**Evidence.** p. 100: 'One can compute that its stalks are isomorphic to Z/2 + Z/2 if 4 | n (resp. to Z/4 if 4 does not divide n), but we will not need this fact.' Check for n = 2: at x in S^1 the two sheets are swapped by sigma, Q = Z^2/Z(1,1) = Z with sigma = -1, so Q(1) = Z with trivial action and 1 + sigma = 2; phi_2(q) = q mod 2. Then G = (Z/2 + Z)/<(1,2)> = Z/4, via (e, m) -> m + 2e mod 4, and 0 -> Z/2 -> Z/4 -> Z/2 -> 0 is not split. For n = 4 the same computation gives Z/2 + Z/2. Second, independent computation for n = 2: Q(1)_x = Z²/diagonal is Z with trivial sigma-action, (phi_2, 1+sigma)(t) = (t mod 2, 2t), and coker[Z → Z/2 ⊕ Z] = Z/4, generated by (0,1); for n = 4 the same computation gives (Z/2)².

**Fix.** Replace the clause by: 'locally constant, with stalks (Z/2)^2 if 4 | n and Z/4 otherwise (not used); the fibre over 1 of (0,phi) has two elements in either case, so it defines a double cover of S^1'. Restrict unit test 1 ('A split F2^2 extension gives two constant sections') to 4 | n, or replace it with the n = 2 stalk Z/4.

## Medium findings

### 7. The E3/E4 reasons and their review invert Θ (medium, error)

**Where.** PAPER-BENOIST-19.result.json sourceIssues E3 and E4 (reason fields) and the review.reason of E3; the report research/blueprint/papers/PAPER-BENOIST-19.md lines 17-18; research/blueprint/reviews/REV-PAPER-BENOIST-19.md lines 125-127; carried into research/errata/REGISTER.md line 1028

**What goes wrong.** The recorded reasons for E3 and E4 turn the paper's evaluation locus inside out. The extraction says Proposition 6.7 'takes Psi = Theta = {x : alpha|_x = 0}; there the evaluation of the lift of (n/2)alpha is identically 0', and that [alpha-tilde]_0 'is 0 on Xi and 1 on Psi minus Xi'. The review says 'p. 79 defines Xi := {x in U(R) : alpha|_x = 0} and fixes Psi ... containing Xi', and that the step 'fails on Xi'. In fact the paper defines Theta as the locus where alpha|_x is NONZERO, and Psi contains Theta; the letter Xi appears only in section 6, where it denotes S(R) minus Psi. The correct mechanism runs the other way. [alpha-tilde]_0 is 1 on Theta and 0 on Psi minus Theta. So the printed identity ([zeta]_1)|_Psi = ([e]_1)|_Psi holds on Theta, and fails exactly where Psi minus Theta carries a nonzero [e]_1. In Proposition 6.7 (Psi = Theta(alpha), class (n/2)alpha) the evaluation on Psi is n/4 mod 1. It is identically 1 when n = 2 mod 4, so the printed argument is valid there, including every period-2 use (Theorem 0.5 with n = 2, Theorem 0.6). It is identically 0 when 4 divides n, so there the printed argument fails whenever Theta(alpha) is nonempty and needs the t = 0 repair (omit cl(phi)). The conclusion that the main theorems survive is right, but the stated reason is false. It contradicts the file's own item 15 ('Theta = {x : alpha_x != 0}'), item 167 and gap G4a ('for n divisible by 4, a = (n/2)alpha evaluates zero on Psi = Theta(alpha)'), and the earlier reviewed errata record, whose E3 says 'Theta is the NONZERO evaluation locus'. A second reader found the same misquotation independently, and adds that for n ≡ 2 mod 4 the recorded claim that the evaluation is identically 0 on Psi = Theta is false: it is identically 1 there.

**Fix.** In E3 and E4, replace the reason sentences with: 'Theta = {x in U(R) : alpha|_x != 0}; [alpha-tilde]_0 is 1 on Theta and 0 on Psi \ Theta, so the printed identity holds on Theta and fails where [e]_1 restricted to Psi \ Theta is nonzero. In Proposition 6.7 the half-period class has evaluation (n/2 mod 2) on Psi = Theta(alpha): the printed argument is valid for n = 2 mod 4, and for 4 | n it fails when Theta(alpha) is nonempty and is repaired by the uniform t = 0 variant (items 161-162, 166-167).' Make the same correction in PAPER-BENOIST-19.md lines 17-18. Have a new review (or the fix job) replace the E3 review reason, whose quotation of p. 79 is false. Regenerate the register.

### 8. Two conflicting records of the same nineteen mistakes (medium, other)

**Where.** PAPER-BENOIST-19.result.json sourceIssues against research/blueprint/errata/PAPER-BENOIST-19.json; research/errata/REGISTER.md lines 1007-1041

**What goes wrong.** The same 19 mistakes are recorded twice, with conflicting content and verdicts, and nothing reconciles the two records. The errata job ERRATA-PAPER-BENOIST-19 and its review REV-ERRATA-PAPER-BENOIST-19 (merged 2026-09-23 14:46) corrected several points. REV-PAPER-BENOIST-19 (merged 20:07 the same day) then confirmed the uncorrected versions in the extraction and does not mention the errata record. The two records differ as follows. E3 and E4: affects 'a stated result' in the extraction against 'the proof' in the errata record, and reversed against correct Theta (finding 7). E7: gap/'the proof' against misprint/'nothing'. E8: gap/'the proof' against misprint/'nothing'; the errata review also withdrew the 'restricted period only divides n/2' objection, which the extraction's own G5 concedes, although E8's correction still says 'initially conclude the restricted period divides n/2'. E10: different, but both valid, repairs. E19: confirmed in the extraction, rejected in the errata record. The public register lists every Benoist finding twice, gives E3 two contradictory reasons, and lists E19 under 'New mistakes, confirmed' although another finished review rejected it.

**Fix.** Reconcile the extraction's sourceIssues with the reviewed errata record. Take over its classifications for E7 and E8 (misprint, nothing), its corrected Theta for E3 and E4, and its E19 rejection (finding 34). For E3 and E4, choose one value of affects and record it in both files. Then make the register carry one entry per finding id: either de-duplicate by id in scripts/errata.py, or mark the extraction's entries as superseded by the errata record, for example with an 'errata' cross-reference field. The review record should state which verdict counts.

### 9. Lemma 6.4's printed t vanishes twice along R (new source error) (medium, error)

**Where.** Paper, Lemma 6.4 proof, published p. 92 (arXiv v2 section 6.1); not in sourceIssues; item 83

**What goes wrong.** A new error: the printed construction of t does not have the stated properties. The proof takes h_1 in R(S)* 'that vanishes at order one along R and H' and sets t := -h_1 h_2 r u. Both h_1 and r then vanish along R, so t vanishes to order 2 along R. Hence {t = 0} contains R and is not reduced there, and its real locus Z contains R(R). The claim Z = iota'(S) therefore fails whenever R(R) is nonempty, a case the main theorems need (Theorem 0.4, and Proposition 6.6, where R(R) lies in Xi). The error feeds straight into Proposition 6.6: the section s, which is close to the product of t and c, would acquire real zeros near R(R), and the real locus of D would no longer be iota(S), as Lemma 6.5 requires. The lemma itself is true with a corrected h_1. Take h_1 with divisor H - R along S(R), that is, a simple zero along H and a simple pole along R. Bröcker's theorem applies, since cl_R(H - R) = cl_R(H + R) = 0. Let D be the part of the polar divisor of h_1 h_2 not supported on R; it does not meet S(R). Then t = -h_1 h_2 r u is regular along R, its real zero locus is exactly H(R) = iota'(S) with multiplicity one, and rt = -h_1 h_2 r^2 u is negative on S(R) minus Xi, where h_1 h_2 > 0. A second reader found the same error independently, from the divisor count div(h1 h2) + div(r) + div(u) = (R + H + E - D) + R + 2D, and proposed an equivalent repair that keeps the printed h_1 and changes u and r instead (see fix).

**Fix.** Add a sourceIssue: kind error, affects 'the proof', known new, locator 'Lemma 6.4, proof, p. 92', printed 'vanishes at order one along R and H', correction 'choose h_1 with divisor H - R along S(R) (simple zero along H, simple pole along R), and let D be the part of the polar divisor of h_1 h_2 away from R; then t = -h_1 h_2 r u has real zero locus exactly iota'(S)'. State the same divisor in item 83's proof outline. Equivalent alternative (second reader): keep h_1 as printed, take u_i in H^0(A^{l/2} ⊗ N(-D)) with A^{l/2} ⊗ N(-D) very ample, u = sum u_i^2 in H^0(A^l ⊗ N^2), and t := -h1 h2 u / r, which is regular in H^0(A^l ⊗ N^2(-R)) because h1 vanishes simply on R; its real zero locus is H(R) = iota'(S) and rt = -h1 h2 u < 0 on S(R) minus Sigma. Either recipe is acceptable; state one in item 83.

### 10. Proposition 4.2 misses the P¹ fibres over R ∩ D (medium, error)

**Where.** Item 64 (Proposition 4.2, p.80); source issue E1's 'affects'; sourceIssues (no entry)

**What goes wrong.** Proposition 4.2 lists the curves of T lying over R as those mapping onto components of R and 'otherwise' the exceptional divisors of T -> T-bar. Because T-bar -> S is not finite (E1), a third kind exists: the P^1 fibre of T-bar, and hence of T, over each point of R cap D. Such a fibre maps to a point, and it is not exceptional for T -> T-bar, which is smooth there. Item 64 ('exceptional P1 residues ...') inherits the incomplete case split, and E1's correction mentions only p.86. A second reader found the same gap independently. The printed argument (the residue is unramified by Gersten; Gamma = P^1_R or P^1_C; test at one real point with a transverse curve Gamma' meeting T_U) applies to these curves verbatim, so Proposition 4.2 is unaffected; what is wrong is the case split recorded in item 64, and the missing source issue. The same point bears on E1: no numbered result is false, and E1's actual reach is this proof and the p. 86 wording, so affects 'the proof' fits better than 'a stated result'.

**Fix.** Restate item 64 with three cases: curves dominating components of R (ramification index 2 kills the residue); exceptional curves over Sing R; and the fibres over R cap D (P^1_R over real points, P^1_C otherwise). The Gersten-plus-Witt argument applies unchanged to the third case, because the curves of the last two kinds are pairwise disjoint smooth rational curves. Add Proposition 4.2 to E1's 'affects'. Add a sourceIssue E20: kind gap, affects 'the proof', known new, locator 'Proposition 4.2, p. 80', printed 'Otherwise, Gamma is an exceptional divisor of the blow-up T -> T-bar', correction 'Otherwise p contracts Gamma to a point of Sing(Delta) = Sing(R) + (R cap D): Gamma is an exceptional curve of T -> T-bar or the fibre of T-bar over a point of R cap D; the same argument applies'. In item 64, name both kinds of contracted curve. In E1, note this downstream use and reconsider affects ('the proof').

### 11. Item 118 is false when S(ℝ) is empty (medium, error)

**Where.** item 118

**What goes wrong.** Item 118 is false without the hypothesis S(R) nonempty, which the paper imposes before this step. If S(R) is empty, both halves are empty and H^0(S(R)) = 0, so every delta satisfies [delta]_0 = 0. H^1_G(S(C),F2) then has order 4, because it contains R*/R*^2 and maps onto Pic(S)[2] = Z/2. So nonzero deltas with [delta]_0 = 0 exist although it is not true that exactly one half is empty, and there are three of them, not one.

**Fix.** Begin item 118 with 'Let S be a real Enriques surface with S(R) nonempty.' For the proof, note that when S(R) is nonempty the class omega (the image of -1) has [omega]_0 = 1, and the two lifts delta_1, delta_2 of K_S have [delta_i]_0 equal to the indicator functions of the two halves.

### 12. Item 15's last sentence is false when 4 divides the period (medium, error)

**Where.** PAPER-BENOIST-19/15 (last sentence); consumers 21, 22, 167

**What goes wrong.** Item 15 ends: 'A Kummer lift's degree-zero fixed-locus component is this characteristic function.' The item is stated for arbitrary α ∈ Br(U), and there the sentence is false. For α of period n, the Kummer lift α̃ lies in H²_G(U(C), Z/n(1)). A degree-zero component is only defined after reducing modulo 2, and that reduction lifts (n/2)α, not α. So [α̃ mod 2]_0(x) = (n/2)·α|_x. This is 1_Θ when n ≡ 2 mod 4, but identically 0 when 4 | n, even though Θ can be nonempty. The sentence holds only for a lift in (2.16) with n = 2, that is, for α ∈ Br(U)[2]. The extraction's own item 167 states the correct value.

**Fix.** Replace the last sentence of item 15 with: 'If α ∈ Br(U)[2] and ξ ∈ H²_G(U(C), Z/2) lifts α in (2.16) with n = 2, then [ξ]_0 ∈ H⁰(U(R), Z/2) is the characteristic function of Θ. For α of even period n and α̃ a lift in H²_G(U(C), Z/n(1)), [α̃ mod 2]_0 = (n/2 mod 2)·1_Θ(α).' Add item 55 to its dependencies. Add a unit test: a class of period 4 whose Θ is nonempty has [α̃ mod 2]_0 = 0.

### 13. No item for the bound ind ∈ {per, 2per} (medium, missing)

**Where.** PAPER-BENOIST-19 items; §0.2 p. 63; consumers 20, 22, 92, 110, 115, 128

**What goes wrong.** The extraction has no item for the bound that §0.2 states and the rest of the paper uses repeatedly: for a connected smooth projective surface S over R and α ∈ Br(R(S)), de Jong's theorem and a norm argument give ind(α) = per(α) or ind(α) = 2 per(α), with ind(α) = per(α) when per(α) is odd. Item 22 (index 2n 'otherwise') cannot be derived without it. Item 110 only proves that ind = n forces a good lift, so the value 2n also needs ind | 2n. Items 92, 115 and 128 each re-derive the norm step inline, and item 22 has no dependencies.

**Fix.** Add an item: 'Norm bound (§0.2 p. 63). Let S be a connected smooth projective surface over R and α ∈ Br(R(S)). Then ind(α) divides 2 per(α), hence ind(α) ∈ {per(α), 2 per(α)}; if per(α) is odd, ind(α) = per(α).' Proof: put L = R(S)(√−1). This is the function field of a connected smooth projective complex surface: S_C if S is geometrically connected; otherwise R(S) already contains C, and de Jong applies directly. Then ind(α) | [L : R(S)]·ind(α_L) = 2 per(α_L) | 2 per(α) (items 08 and 16), and for odd period use item 07. Give it dependencies 07, 08 and 16 and route it to RealSurfacePeriodIndex. Add it to the dependencies of items 20, 22, 92 and 110, and cite it from 115 and 128. Item 128 needs the version for an arbitrary real closed field, with de Jong over the algebraically closed field K(i).

### 14. De Jong's theorem has no consistent owner; Lieblich's is unused (medium, error)

**Where.** PAPER-BENOIST-19/16 and /17; route 9 (new RealSurfacePeriodIndex), its brief; prerequisites entry 'de Jong 2004 … Lieblich 2015'; prerequisite 12

**What goes wrong.** The owner of de Jong's theorem (item 16) and Lieblich's theorem (item 17) is inconsistent. Both are routed into the new roadmap RealSurfacePeriodIndex as owned items. That roadmap's brief says to import de Jong's general theorem, and the prerequisites list defers both papers, unread, to a later batch. As routed, no stage plans a proof of item 16, yet the real-surface roadmap is its only owner. Item 17 is labelled 'background only' and 'not … used', but its routing makes a finite-field period-index theorem owned mathematics of a real-surface roadmap. The paper needs de Jong only over algebraically closed fields of characteristic 0: C(S) on pp. 95 and 104, and K(i) for the Puiseux field K on p. 108. §1 proves only the unramified complex case, and the reduction to it (the characteristic-0 reduction, the Lefschetz principle, de Jong's §7 trick, p. 68) has no items. A second reader reached the same conclusion from the routes side: the brief tells the design job to import a theorem that it alone owns, since no atlas layer, blueprint or accepted route owns de Jong's theorem. A third observation: in the TeX source Lieblich's theorem (label piLieblich) is referenced only in the introduction's survey sentence, so a design job reading route 9's items could plan an unrelated finite-field theorem.

**Fix.** Change the brief to: RealSurfacePeriodIndex owns item 16 restricted to algebraically closed fields of characteristic 0, proved from items 31–39 (the unramified complex case) plus de Jong §7's reduction to unramified classes and the Lefschetz principle, gated on reading de Jong 2004 §7. Narrow item 16's statement accordingly, or record the characteristic-p case as out of scope. Add Lieblich 2008 to prerequisites (finding 33). If a shared period-index owner is preferred instead (for example alongside the stable twisted-sheaf consumer of Charles 16), route item 16 there and have RealSurfacePeriodIndex import it. In either case take item 17 off the real-surface roadmap: mark it a statement-only context item like items 186 and 187, and say in route 9's brief that it is not a proof obligation.

### 15. No item or prerequisite for Artin's étale–Betti comparison (medium, missing)

**Where.** PAPER-BENOIST-19/33 (Complex Kummer sequence); prerequisites; §1 p. 69

**What goes wrong.** The extraction has no item and no prerequisite for Artin's comparison theorem between étale and Betti cohomology with finite coefficients. Sequence (1.1) (item 33) rests on it, and item 33 only absorbs it in the phrase 'using the algebraic/analytic finite-coefficient comparison'. Only the real, equivariant comparison (Scheiderer, item 148) is extracted and listed as a prerequisite. No atlas stage plans the complex comparison either. WeilConjectures:WC.4 says to 'Use existing algebraic/analytic comparison owners', but none exists, and SF.2's description covers only algebraic sites.

**Fix.** Add an item: 'Artin comparison (cited [5, Théorème 4.1], p. 69): for X of finite type over C and a finite abelian group M, H^k_et(X, M) ≅ H^k(X(C), M), naturally and compatibly with cup products and Kummer boundaries; μ_n ≅ Z/n via e^{2πi/n}.' Give it the same owner as the comparison item 148; the complex case is the Weil restriction to R of the real one, which is a derivation, not a proof of Scheiderer. Add SGA 4 Exposé XVI (Artin) to prerequisites, and make item 33 depend on the new item.

### 16. Tsen–Lang duplicates Schröer-23 item 206 (medium, duplicate)

**Where.** PAPER-BENOIST-19/25 and /26 (route 8 → QuadraticFormsRealFunctionFields); PAPER-SCHROER-23/206 (accepted route 2 → GenusOneFibrationsAndRationalEllipticSurfaces)

**What goes wrong.** Item 26 (Tsen–Lang: fields of transcendence degree i over an algebraically closed field are C_i) and its definition item 25 duplicate Tsen's theorem, which an accepted route already owns. Schröer 23's item 206, 'For an algebraically closed field k, the field k(t) is C₁, so Br(k(t))=0', is routed by its accepted route 2 to the Part II 'Néron models and semistable abelian varieties, Part II: genus-one fibrations and rational elliptic surfaces'. Tsen's theorem is the case i = 1 of item 26. PROTOCOL §15 requires one owner, in the most general form. The duplication arose because both extractions were accepted on the same day, and nothing in either links them.

**Fix.** Plan C_i fields and the Tsen–Lang theorem once, in the general form of item 26, with the i = 1 corollary that k(t) is C₁ and so Br(k(t)) = 0. The natural home is QuadraticFormsRealFunctionFields or a foundational field-arithmetic owner. Record in both extractions that the other roadmap imports it, and give the maintainer a note that Schröer 23's Part II should import Tsen's theorem rather than prove it.

### 17. Route 9 imports roadmap ids that will never exist (medium, error)

**Where.** PAPER-BENOIST-19 route 9 brief; routes 1–3 reasons; queue ordering of DESIGN-RealSurfacePeriodIndex

**What goes wrong.** The new roadmap's brief imports suppliers under roadmap ids that will never exist: 'EquivariantTopologyRealVarieties's self-duality', 'DegeneratingHodgeStructures's real cone', 'the parent Brauer and QFI carriers, and the four continuations above'. The queue creates AlgebraicTopologyPartII, HodgeStructuresPartII, QuadraticFormInvariantsPartII and SemisimpleAlgebrasPartII instead (finding 1). In addition, DESIGN-RealSurfacePeriodIndex is queued with no dependency on those four design jobs, so it may run before any of its suppliers has stages to cite.

**Fix.** Rewrite route 9's import list with the ids the queue will create (AlgebraicTopologyPartII, HodgeStructuresPartII, QuadraticFormInvariantsPartII, SemisimpleAlgebrasPartII), each with its title, and ask the maintainer to add those four design jobs to the 'after' list of DESIGN-RealSurfacePeriodIndex.

### 18. The VHS carrier is sent to ShimuraData:D3, against the Hodge Part II (medium, duplicate)

**Where.** PAPER-BENOIST-19 route 10 (ShimuraData:D3, item 151) and route 7 brief

**What goes wrong.** The general variation-of-Hodge-structure carrier is sent to ShimuraData:D3, and the Hodge Part II is told to import it from there. But the Tau Ceti parent reserves exactly this datum for its named successor, and the accepted HodgeStructuresPartII proposals (Landesman–Litt, Esnault–Groechenig), which the queue merges into the same job, plan VHS as their first layer. The merged job therefore gets two contradictory owners for the same definition. Routing through D3 also makes the Hodge Part II and RealSurfacePeriodIndex descend from D2 and its adelic/reductive-group ancestors. Route 7's reason ('not a second generic Hodge successor') overlooks that HodgeStructuresPartII is already that successor. Finding 19 is the companion problem inside route 7.

**Fix.** Route item 151 to the Hodge Part II (the parent's named successor; HodgeStructuresPartII in the queue) and drop route 10, or keep route 10 only as a pointer that D3 must import the Part II's carrier; record the D3/HodgeStructuresPartII double ownership for a restructure decision. In route 7's brief replace 'Import the general VHS … from ShimuraData:D3' by 'build on the early VHS layer of this same Part II (Landesman–Litt, Esnault–Groechenig tranches)'.

### 19. Route 7 duplicates the accepted HodgeStructuresPartII tranches (medium, duplicate)

**Where.** Route 7 (DegeneratingHodgeStructures) brief; items 70, 86, 88

**What goes wrong.** Two accepted Part II proposals now extend tauceti:TauCetiRoadmap/HodgeStructures in the same direction. Benoist's route 7 plans 'the geometric weight-two variation' and 'Griffiths' derivative formula' (needed for item 86 and for the Kodaira-Spencer map in item 70) in DegeneratingHodgeStructures. Meanwhile HodgeStructuresPartII (Landesman-Litt route 2 and Esnault-Groechenig route 1, both accepted) already plans VHS, the period map and its derivative, the Gauss-Manin composite, Griffiths filtrations and the Kodaira-Spencer map. Neither the extraction nor its review mentions HodgeStructuresPartII. Finding 18 is the companion problem for the VHS carrier itself (route 10).

**Fix.** Plan the Kodaira-Spencer map of a smooth projective family and Griffiths' formula (the Gauss-Manin derivative of a Hodge class is contraction with the Kodaira-Spencer class, Voisin Theorem 10.21) once, in HodgeStructuresPartII, or merge the two Part II proposals. Have route 7 import them and keep only the real open-cone criterion (item 88) and the Noether-Lefschetz-locus material as additions. Note the conflict for the maintainer.

### 20. Item 91 is at MC.7 here and at MC.2 in BW20 (medium, duplicate)

**Where.** PAPER-BENOIST-19 item 91, route 3 (MotivesAndAlgebraicCycles:MC.7)

**What goes wrong.** Item 91 (BW1 Proposition 2.9, first assertion: the cokernel of Pic(X)→H²_G(X(C),Z(1)) is torsion-free) is routed to MC.7, but the accepted BW20 extraction routes the same statement to MC.2. One statement, two owning layers.

**Fix.** Move item 91 to route 2 (MC.2), matching BW20. That also keeps the real-surface proof off MC.7's 43-stage ancestry for this input. Keep items 90 and 135 in MC.7, where BW20 also routes Proposition 2.8.

### 21. Serre vanishing (item 138) is already planned three times (medium, duplicate)

**Where.** PAPER-BENOIST-19 item 138, route 4 (AlgebraicModuliForArithmeticGeometry:R09.1 and A0-extension)

**What goes wrong.** Serre vanishing is now planned by a promoted, accepted blueprint node, so route 4 would plan it a second time. That blueprint (promoted 28 September 2026, after this extraction) covers a proper morphism to a noetherian affine base with an ample line bundle, and so contains the projective-over-R case used here. Very ampleness of large twists is already in R09.1's own text. It is also already placed by two accepted paper routes: Hacon–Witaszek-23 plans projective Serre vanishing at A0-extension, and an accepted Witaszek-22 route places it at SF.2. Item 138 would be a fourth placement.

**Fix.** Mark item 138 planned: Serre vanishing at AdicSpacesPartII:F0 (node graded-cohomology-finiteness (ii)), very ampleness at AlgebraicModuliForArithmeticGeometry:R09.1. Delete route 4. Keep the paper-specific application to the finite list of Assumption 5.1 in RealSurfacePeriodIndex. Cross-reference the Hacon–Witaszek-23 and Witaszek-22 placements for the maintainer.

### 22. Items 133–134 belong in the topology Part II (medium, duplicate)

**Where.** PAPER-BENOIST-19 items 133, 134, route 7 (Hodge Part II)

**What goes wrong.** The integral weak Lefschetz theorem (item 133) and Andreotti–Frankel's affine vanishing (item 134) are topological theorems, but they are routed to the Hodge Part II. Their equivariant refinements from the same circle of papers (BW1 Propositions 1.14–1.16 and the affine relative vanishing of Remark 1.17(ii)) are routed by the accepted BW20 extraction to the topology Part II. Both need the same Andreotti–Frankel input, so the Lefschetz hyperplane package would be planned in two Part IIs.

**Fix.** Move items 133 and 134 to route 6 (the topology Part II), placed before the equivariant Lefschetz theorems, and have the Hodge Part II import them. Delete 'Prove integral weak Lefschetz and the precise Andreotti–Frankel affine-surface input' from route 7's brief.

### 23. Ehresmann's theorem is already planned (medium, duplicate)

**Where.** Item 87; route 6 (EquivariantTopologyRealVarieties) brief

**What goes wrong.** Route 6 plans to 'Prove equivariant Ehresmann transport' from scratch. Ehresmann's fibration theorem, including its version relative to a closed submanifold, is already planned by an accepted route (Landesman-Litt item 135 in MappingClassGroupsAndCanonicalRepresentations), and an Ehresmann trivialisation also appears in Gao-Habegger item 26 (DegeneratingHodgeStructures). Item 87 names no supplier.

**Fix.** Make item 87 import the plain and relative Ehresmann theorem from its accepted owner and add only G-equivariance (a G-invariant complete connection, or averaged horizontal lifts). Use the relative form to supply the p^{-1}(R)-preserving trivialisation required by finding 5.

### 24. Equivariant sheaf cohomology is already at SF.2 (medium, duplicate)

**Where.** Items 89 and 106; route 6 brief ('construct equivariant sheaf cohomology for involutions')

**What goes wrong.** The general Grothendieck equivariant sheaf cohomology is already owned by SchemeAndStackFoundations:SF.2 through an accepted route. That covers equivariant Ext, the spectral sequences H^p(G, H^q(X,F)) => H^{p+q}(X; G, F) and H^p(G, Ext^q) => Ext^{p+q}_G, and the Borel-construction comparison. Item 89's Hochschild-Serre finite-cokernel input and item 106's stalk identification Ext^q_G(Z, F)_x = H^q(G, F_x) ([32, section 4.4]) are special cases for G = C2 acting on the ringed space (X(C), Z). Route 6 re-plans them.

**Fix.** Route 6 imports SF.2's equivariant cohomology, equivariant Ext and the two spectral sequences, specialised to C2, and adds only the C2-specific periodic resolution, parity twists and fixed-locus decompositions. Items 89 and 106 (and the carrier, item 40) cite SF.2 as supplier.

### 25. Item 113 duplicates BW20's splitting and self-duality (medium, duplicate)

**Where.** item 113 (route 6, EquivariantTopologyRealVarieties) versus PAPER-BENOIST-WITTENBERG-20 items mod2-splitting, gamma, gamma-invertible, gamma-sw, selfdual-les, boundary-trace and selfduality, all on BW20 route 6 to the same proposed Part II. The BW20 review accepts that route (REV-PAPER-BENOIST-WITTENBERG-20, 24 September 2026).

**What goes wrong.** Item 113 restates Benoist-Wittenberg I, Proposition 1.3 and Theorem 1.12 (the canonical splitting of the support sequence, support-to-real equal to multiplication by w, and self-duality with the pairing deg(xy w)) as a new missing construction owned here. The accepted BW20 extraction already owns these statements, from their source paper, under the same Part II id. The route 6 text of this extraction says to 'coalesce' with BW20 and still calls neither extraction accepted, which is now out of date.

**Fix.** Change item 113 to a dependency on BW20/{mod2-splitting, gamma-sw, selfdual-les, selfduality, boundary-trace}. Keep only the specialisation that belongs to Benoist: with d=2 and k=2, the image of tau followed by the projection to H^1 + H^2 is the annihilator, under deg(x cup y), of the image of H^1_G(S(C)) -> H^0 + H^1. It can go into the proof of item 112. Update route 6 to say that BW20's tranche is accepted.

### 26. Item 148 duplicates BW20's étale comparison at SF.2 (medium, duplicate)

**Where.** item 148 (route 1, SchemeAndStackFoundations:SF.2) versus PAPER-BENOIST-WITTENBERG-20/etale-comparison (BW20 route 1, SF.2, accepted)

**What goes wrong.** Both extractions add Scheiderer's Corollary 15.3.1, comparing equivariant Betti cohomology with etale cohomology for torsion coefficients, to the same stage SF.2 as separate missing items. Only the compatibilities (Kummer boundaries, cup products, cycle classes) are new in item 148.

**Fix.** Make item 148 depend on BW20/etale-comparison. Restrict its statement to the compatibilities the paper uses: with the Kummer boundary in (2.16), with cup products, and with Krasnov's cycle class. Do not add a second comparison item at SF.2.

### 27. Enriques surfaces are already defined by Schröer-23's roadmap (medium, duplicate)

**Where.** item 114 (and items 115 and 118 in part; route 9, new RealSurfacePeriodIndex) versus PAPER-SCHROER-23/26 and /28 (new roadmap EnriquesSurfacesAndIntegralNonexistence, Schroer route 6, accepted) and PAPER-BENOIST-WITTENBERG-20/enriques-pic (MC.7, accepted)

**What goes wrong.** Item 114 defines Enriques surfaces inside the new roadmap RealSurfacePeriodIndex. An accepted route already created a roadmap that owns the definition, so the carrier would be built twice with two different definitions: here 'H^1(O)=H^2(O)=0 and K nontrivial of order 2'; in Schroer 'numerically trivial K and b_2=10, over other fields use the geometric condition'. Likewise 'H^2(S,O_S)=0' (item 115) and 'Pic(S)[2] is generated by K_S' (item 118) are the accepted BW20 item enriques-pic. The route 9 reason, 'No accepted roadmap, packet or reservation owns ... Enriques ... applications', is right about the applications but not about the carrier.

**Fix.** Import the Enriques carrier from EnriquesSurfacesAndIntegralNonexistence (Schroer 26 and 28). Add only the characteristic-0 equivalence with q=p_g=0 and 2K=0, K not 0, together with the real halves and the two Kummer lifts (Degtyarev-Kharlamov section 1.3). Make items 115 and 118 depend on BW20/enriques-pic for H^2(O)=0 and for Pic[2] = <K_S>. Amend the route 9 reason.

### 28. Routes 8 and 9 supply each other (medium, error)

**Where.** PAPER-BENOIST-19 routes 8 and 9: items 27, 28, 29, 97 (route 8) versus items 19, 96, 30 (route 9)

**What goes wrong.** Route 8 puts into the quadratic-form Part II the paper's own applications of the real-surface theorem. Theorem 0.12 (items 28, 29), Theorem 0.10 (item 27) and the sharp example (item 97) are proved from Theorem 0.4 (item 19, route 9) through item 96 (route 9). Theorem 0.13 (item 30, route 9) then uses items 27 and 143 (route 8). The two roadmaps become mutual suppliers. Stage-level acyclicity then depends on the merged QuadraticFormInvariantsPartII job, whose first proposal is Dittmann–Pop's, splitting itself into early and late layers, which the brief can only request. The queue's tarjan_levels merges mutually dependent roadmaps into one component.

**Fix.** Route items 27, 28, 29 and 97 to RealSurfacePeriodIndex (a final 'applications' layer with item 30). Keep in route 8 only the field-theoretic inputs 14, 25, 26, 94, 95, 141, 142, 143, 186 and 187. The dependency then runs one way, QuadraticFormInvariantsPartII → RealSurfacePeriodIndex, and route 8's paragraph on the reciprocal edge can go.

### 29. Part II items are stated about objects of the application roadmap (medium, other)

**Where.** Routes 6 and 7 versus route 9: items 59, 99, 100, 106, 107 (EquivariantTopologyRealVarieties) and 70, 74, 86 (DegeneratingHodgeStructures)

**What goes wrong.** Several items routed to the two foundational Part II roadmaps are stated about objects owned by the application roadmap RealSurfacePeriodIndex, which itself imports those Part IIs. Examples: 59 'In item 58'; 99 'For item 98'; 106's conclusion involves zeta from item 103 on Theta0 from item 102; 107 compares with the alternating cover of item 101 and feeds Lemma 7.6 (item 108, route 9); 70 'For item 69'; 74 'Under item 72's hypotheses'; 86 'For the real double-cover family'. Each Part II would then depend on RealSurfacePeriodIndex while RealSurfacePeriodIndex depends on it. Application geometry would sit inside a foundational extension of a Tau Ceti roadmap (the route 7 brief even calls item 74 'an acceptance application consuming ... its algebraic family').

**Fix.** Either restate these items generically, or move them. Generic versions: 59 for any double cover branched along an SNC divisor; 99-100 for any generically finite morphism of smooth complex surfaces with compatible involution; 106 for any G-sheaf Q on S^1 whose p_*Z-stalks are Z[G]-free and any class zeta with phi(zeta)_x nonzero; 107 for any choice of sheet-pairing data. Otherwise move the family-specific statements (70, 74, 86, 107 and the application half of 106) to RealSurfacePeriodIndex, importing only the general theorems (Griffiths' formula, item 131, item 88, the sheaf-extension machinery).

### 30. Orderings, real closures and the Harrison space have no item (medium, missing)

**Where.** Items 14, 94, 95, 96 and 124; §0.5 p. 66 (definition of a real field); route 8 (QuadraticFormsRealFunctionFields) brief

**What goes wrong.** The orderings of a field, the real closure of a field at an ordering and the space of orderings with its Harrison topology have no item. Yet item 94's statement ('trivial over every real closure'), item 95 and item 96 depend on them. Part of this is already in the libraries or planned. Pinned Mathlib has orderings (RingPreordering with RingPreordering.IsOrdering) and the IsRealClosed class. Existence of an ordered real closure is planned by the Tau Ceti roadmap RealAlgebraicGeometry, Layer 1, which reached the atlas feed on 2026-09-28, after this review, and must not be re-planned. The Harrison topology and its compactness are planned nowhere. The paper also defines 'real field' (a field that can be ordered) on p. 66, and item 14's Elman–Lam invariant quantifies over orderings. None of the pinned carriers (RingPreordering, RingPreordering.IsOrdering, IsSemireal, IsFormallyReal, IsRealClosed) is named anywhere in the extraction, and route 8's brief asks to 'extend to signatures at every ordering, Harrison spaces and compactness' without saying that they are to be reused, which risks a parallel ordering and real-closed-field API. Three readers found this independently.

**Fix.** Add a definition item 'orderings of a field and real closures at an ordering' (status library for the notions, citing mathlib:RingPreordering.IsOrdering and mathlib:IsRealClosed; existence planned by tauceti:TauCetiRoadmap/RealAlgebraicGeometry Layer 1, once the atlas includes it). Add a theorem item 'the Harrison space of orderings is compact and the non-vanishing locus of a Brauer class is closed' (missing, route 8). Have route 8's brief import RealAlgebraicGeometry Layer 1. Record the Mathlib carriers in items 14 and 95 and add to route 8's brief: orderings of K are Mathlib's RingPreordering.IsOrdering (orderings of a field have zero support); 'real field' is IsSemireal or IsFormallyReal; real closures are fields with IsRealClosed; the Artin–Schreier equivalence, signatures, the space of orderings and the Harrison topology are built on these.

### 31. A dozen cited theorems carry steps but have no item (medium, missing)

**Where.** Sections 3-7 as a whole (items 62, 65, 66, 67, 74, 86, 95, 101, 106, 110); prerequisites

**What goes wrong.** Cited theorems that carry steps on pp.79-103 have no item, or appear only inside another item's API. They are: BW1 section 1.1.3 (restriction to the real locus is an isomorphism in degrees above 2 dim), the base of the induction in Proposition 3.3; BW1 Proposition 1.22 (pushforward commutes with the real-locus components), used in Propositions 3.3, 4.3, 4.5 and 7.1; BW1 Lemma 2.11(ii) (the norm exact sequence H^4 -> H^4_G -> H^0 + H^2 of the real locus), used in Proposition 4.3; BW1 (1.21) (purity: H^2_G(S(C),Z(1)) -> H^2_G(S0(C),Z(1)) is onto), used in Proposition 4.4; Griffiths' formula (Voisin Theorem 10.21, nabla(lambda) = phi_lambda), used in Proposition 6.6; Zariski-Nagata purity of the branch locus, used in section 7.2 to compute V; Bredon II Theorem 7.1(c), used in Lemma 5.3(ii); Grothendieck Tohoku section 4.4, used in Lemma 7.5; Arason's Hilfssatz 2 and Lam VIII Theorem 6.3, used in the proof of Theorem 0.12 (only inside item 95); Brocker Satz a/b and Bochnak-Coste-Roy Theorem 12.4.11, used in Lemma 6.4 (only inside item 83). The corresponding gaps in the prerequisites are finding 33.

**Fix.** Add one cited-input item for each theorem, with its exact hypotheses, and route it: the BW1 inputs and Tohoku section 4.4 to route 6 (or SF.2, per finding 24); Griffiths' formula to the Hodge Part II; Zariski-Nagata purity to SchemeAndStackFoundations (or state and prove the elementary normal-double-cover case inside item 101); Arason and Lam to QuadraticFormsRealFunctionFields; Brocker and BCR to RealSurfacePeriodIndex's source-scoped real-algebraic interface; Bredon to SF.2. Add the missing sources to prerequisites (finding 33).

### 32. Twelve prerequisite links point to Benoist's own paper (medium, error)

**Where.** PAPER-BENOIST-19 prerequisites 4–16 (links)

**What goes wrong.** Twelve of the sixteen prerequisite links point to Benoist's own article, the Numdam PDF of doi:10.1007/s10240-019-00108-7 at its bibliography pages (#page=46/47/48), not to the work cited. Prerequisite 11 links to Benoist 2018 (NLsquares.pdf) for Andreotti–Frankel, Voisin 2002 and Atiyah 1957. A maintainer adding these to a batch would fetch the wrong document.

**Fix.** Replace each link with the DOI(s) above; where no DOI exists give the bibliographic citation.

### 33. Prerequisites leave out works the proofs use (medium, missing)

**Where.** PAPER-BENOIST-19 prerequisites

**What goes wrong.** The prerequisites leave out works that the proofs use (not just cite for context): Arason 1975 Hilfssatz 2, which shows the set of orderings where α survives is closed and so drives the compactness step for u(K)≤4 (item 95); Sernesi 2006 Proposition 3.2.9(i), the Kodaira–Spencer factorization behind items 70, 74 and 131; Krasnov 1991 §2.1 and Krasnov 1994 Theorem 0.6, which give the equivariant cycle class and its compatibility (2.14) with Borel–Haefliger (items 43, 53); Borel–Haefliger 1961 §5, which defines cl_R (item 43); Grothendieck, Tohoku 1957 (4.4.1) and §4.4, for equivariant sheaf cohomology (items 40, 106); Colliot-Thélène 1993 (3.8) and §3.3.1, for the commutativity of diagram (2.15) in the proof of Lemma 2.1 (item 54); Lieblich 2008 §4.1.2, for the reduction of de Jong's theorem to characteristic 0; a source for Zariski–Nagata purity of the branch locus (pp. 97–98, used to compute V in section 7.2); and Mangolte–van Hamel Theorem 1.1 (p.107; prerequisite 13 lists only Theorems 1.3 and 4.4). Conversely, prerequisite 12's Lieblich 2015 is background only (Theorem 0.2 is never used).

**Fix.** Add these entries, each with its locator, its use and its owner route. Move Lieblich 2015 to a context note.

## Low findings

Claims only; the fix for each is in the result file.

### 34. E19 is not a mistake of the paper (error)

E19 is not a mistake of the paper, and the errata review was right to reject it. The paper fixes the anti-invariant summand of p_*O_T only through the involution. It never fixes the isomorphism of that summand with L^{-1}(-R), which is determined only up to a unit in H^0(S, O_S*) = R*. With the generator z' = rv/(sqrt(a_1) w), the restriction map in (5.5) is exactly (1, rg), as printed. E19's own reason concedes that 'the printed expression can be retained'. Recording it as a confirmed misprint puts a non-mistake into the public register.

### 35. No sourceVersions list (other)

Neither file has a sourceVersions list, although E1, E3 and E4 have affects 'a stated result'. PROTOCOL section 18 requires the list in that case. For errata files scripts/check_errata.py enforces it, so the errata record, whose E1 also affects a stated result, would fail that checker. The extraction does describe what it read, but only in free text (source.version, source.sha256, source.versionChecks), and collation.py falls back on that text. The searched lists also record no check of citing works.

### 36. Misprint in Proposition 4.5's proof (p. 85) (error)

A new misprint. The proof asserts '[p_*epsilon]_1 = p_*[epsilon]_1 = 0 in H^1(S(R))'. Here epsilon lies in H^2_G(T_U(C), Z(1)), so the class lives in H^1(U(R)), not H^1(S(R)). Assumption 4.1(i) only gives vanishing after restriction to Psi. Push-forward from H^1(T_U(R)) need not vanish; Assumption 4.1(ii) relies on its image being large. Only ([p_*epsilon]_1)|_Psi = 0 is used in the next clause, so nothing breaks.

### 37. Misprint in Lemma 6.5's proof: Θ for Ψ (p. 92) (error)

A new misprint. The proof says 'In particular, p(T(R)) is disjoint from Theta, and Assumption 4.1 (i) holds'. Assumption 4.1(i) asks for disjointness from Psi, and in section 6.1 only Xi is fixed, so Theta is undefined there. The intended set is Psi := S(R) \ Xi, which is what the preceding sentence, 'p(T(R)) is contained in Xi', gives.

### 38. E13 is incomplete (p. 108) (error)

E13 is incomplete, and its review misdescribes the paper. At the second point the paper excludes only 'any divisor of poles of f_0 or g_0 distinct of D'. A zero divisor of odd order through x would still make a sign change near x, so zeros must be excluded too. The earlier sentence ('lies outside of the poles of f_0 and g_0, then at least one of f_0(x) and g_0(x) is positive iff u/w(x), v/w(x) > 0') has the same omission: at a zero of f_0 with g_0 < 0 inside the region u/w, v/w > 0 the equivalence fails. REV-PAPER's E13 review says 'the paper does take this care at the second point', which is inaccurate. Item 128 already says 'avoiding zeros and poles'.

### 39. Proposition 5.5's part labels are shifted; other locators (error)

The labels of Proposition 5.5 are shifted. Item 75 ('5.5(i)') is the paper's (iv), cup-product injectivity; item 76 ('(ii)') is (i); item 77 ('(iii)') is (ii); item 78 ('(iv)') is (iii). Lemmas 6.4 and 6.5 lie entirely on p.92, not 'pp.91-92' and 'pp.92-93'. Item 70's (5.2) is in section 5.2, not section 5.1.

### 40. Wrong locators in items 17–39, 114 and Conjecture 0.9 (error)

Several locators give the wrong page or label in the published text. Item 17: Theorem 0.2 is on p. 63, not p. 64. Items 20–22: Theorem 0.5 is entirely on p. 64, not 'pp. 64–65' or 'p. 65'. Item 24: the paper calls it 'Proposition 0.7', not 'Theorem 0.7'. Item 31: the family is set up at the start of §1 on p. 69; p. 68 is §§0.6–0.7. Item 38: the lattice step in Proposition 6.6 is in its proof on p. 94, not p. 97 (p. 97 is §7). Item 39 is Theorem 1.1, stated and proved on p. 69, but its locator 'p. 71' does not name it. Item 114: the halves of a real Enriques surface are introduced in §0.3 on p. 64, not '§0.4 p. 65'. Also, Conjecture 0.9 is on p. 66, not p. 65 (item 186 already gives p. 66). Items 24 and 38 were found independently by a second reader, and item 114 by a third.

### 41. Item 72's proof sketch is wrong (error)

The proof sketch is wrong. Part (i) uses no extension class and no cup map. It uses the sequence (5.3), T_{X/S}|C = L|C, H^1(C, L) = 0 (from H^1(S, L) = 0 and H^2(S, N(-R)) = 0, the latter Serre dual to H^0(N^-1 (x) K_S(R)) = 0) and H^1(S, A^l) = 0. Cup-product injectivity is used in part (ii), item 73.

### 42. Wording of items 57 and 59 (error)

Item 57 defines B by 'D smooth and transverse to R away from Sing R'. That wording allows D to pass through Sing R, which would make Delta not SNC. The paper requires D to meet R only in its smooth locus, transversally, and item 174 says 'avoiding Sing R'. Item 59's 'higher direct images zero' reads as if R^1 vanishes; the paper says R^i vanishes for i >= 2 while R^1 j0_* p_*Z = R^1 j0_* Z is non-zero.

### 43. Items 92–93 skip the extension of the lift (other)

Proposition 6.6 is applied to a = (n/2)alpha. It needs a lift on the unramified open U_a of a, which can be larger than U_alpha, while the given xi lives only on U_alpha. The paper skips the one-line extension step, and item 93 does not state it.

### 44. Item 26 strengthens Theorem 0.8 (error)

Item 26 strengthens Theorem 0.8. The paper states it for the function field of an integral variety of dimension i over an algebraically closed field, which is a finitely generated field. The item states it for every field of transcendence degree i, including fields that are not finitely generated. The stronger statement is true (Lang's theorem plus the fact that algebraic extensions of C_i fields are C_i), but it is not the source's statement and needs the extra algebraic-extension lemma.

### 45. Item 52 omits the p. 74 sign criterion (missing)

Item 52 assumes that 'σ acts on L|Y as (−1)^j' but omits the criterion the paper states for when this holds. By that criterion, for L the sign system of p: X̃ → X, the condition holds for even j exactly when Y ⊂ p(X̃(R)), and for odd j exactly when p(X̃(R)) ∩ Y = ∅. It is how the hypothesis is checked in every later use (Θ, Ψ and Θ₀ avoiding the real points of the cover). Item 160 re-derives only the odd case, for its own cover.

### 46. Items 162 and 166 omit item 64 as a dependency (error)

The new items 162 and 166 omit their direct prerequisite, Proposition 4.2 (item 64). The topological obstruction tau in 162 is defined only after Proposition 4.2 has placed alpha_R(T) in Br(T)[2], and the proof of Proposition 6.6 applies Propositions 4.2, 4.4 and 4.5 in turn.

### 47. Item 128's 'positive powers' (other)

Item 128 says the t-valuations of f and g are normalised 'by positive powers'. If this means positive exponents, it is wrong: the paper multiplies by 'an appropriate power of t^(1/n)', which may be a negative power. What keeps the sign pattern is that t^(1/n) is positive, not that the exponent is.

### 48. Kahn's theorem and the degree-1 Kummer sequence have no item (missing)

Kahn's theorem cl_R(K_X) = w1(X(R)), for any smooth real variety, is a general external input that the proof of Theorem 0.6 uses. It is listed among the prerequisites but has no item: it is folded into item 118 as '[delta]1=cl_R(K_S)=w1'. The H^1 Kummer sequence 0 -> R*/R*^2 -> H^1_G(S(C),Z/2) -> Pic(S)[2] -> 0, also used there, has no item either. No accepted extraction owns Kahn's theorem: BW20's cycle-constraints item is the different Kahn-Krasnov Steenrod relation.

### 49. Item 124 overlaps BW20's semialgebraic site (duplicate)

Item 124 makes 'semialgebraic cohomology and components' over an arbitrary real closed field part of its own definition. The accepted BW20 tranche of the shared Part II owns the semialgebraic site and its cohomology over real closed fields. What belongs to Benoist is only the Puiseux field K with t > 0 and the fact that it is real closed. For that, the pinned Mathlib already has the target predicate.

### 50. Item 141 overlaps BW20's witt-curve (duplicate)

Two Witt inputs about real curves sit in the same Part II. BW20/witt-curve (for C(R) empty, -1 is a sum of two squares in R(C), hence Br(R) dies in Br(C)) is the C(R)-empty special case of the corrected item 141 (finding 3).

### 51. Item 136 is not planned at SF.4 (other)

The SF.4 stage text does not plan characteristic-0 embedded resolution or SNC compactification. It says only 'Resolution is a theorem only in a named proved setting', and RS-25 narrows it to 'proved resolution settings'. AlgebraicModuliForArithmeticGeometry:R09.7 does plan exactly what item 136 needs, and three accepted extractions route it there. BW20 routes its own resolution input to SF.4, so the atlas is split. Item 136 should at least name the stage that plans the construction.

### 52. Item 144's transverse-circle representation is not in stage 6 (other)

Item 144 includes 'detect H^1 classes by transverse embedded circles', meaning that mod-2 classes on a surface are represented by embedded circles in general position with a divisor. The paper uses this in section 6.1 and section 7.4. Stage 6 plans cochains, products, orientation local systems and Poincare(-Lefschetz) duality, not the representation of classes by embedded submanifolds or transversality. So that part is not planned.

### 53. Uncited library declarations for items 97, 101, 106 (library-claim)

Pinned library declarations that supply parts of these items are not cited. For 106's 'A stalk Z[G]^k has no higher G-cohomology': Mathlib's Shapiro isomorphism groupCohomology.coindIso together with groupCohomology.isZero_groupCohomology_succ_of_subsingleton (Z[G] is coinduced from the trivial subgroup). For 101's sign of the monodromy: Equiv.Perm.sign. For 97's step 'anisotropic over C((y1))((y2)), hence over R(S)': Tau Ceti's QuadraticForm.not_anisotropic_baseChange.

### 54. Some prerequisites are already atlas sources (other)

Several prerequisites are already atlas sources, although the field lists 'papers this one builds on that the atlas does not yet cover'. BW1 is a registry paper (PAPER-BENOIST-WITTENBERG-20, accepted extraction). Lam 2005 is the primary reference of tauceti:TauCetiRoadmap/QuadraticFormInvariants. Voisin 2002 is referenced by tauceti:TauCetiRoadmap/HodgeStructures in its English translation 'Voisin, Hodge Theory and Complex Algebraic Geometry I–II'. Brown's Cohomology of Groups is referenced by tauceti AlgebraicTopology and ProfiniteCohomology. BBD is a source of EtaleDualityAndPerverseSheaves.

### 55. Route 7 imports a nonexistent id 'ComplexComparison' (error)

The brief imports 'the analytic-space carrier of ComplexComparison', but no roadmap has the id ComplexComparison. The carrier is ComplexComparisonPartII:C0, which is how the coalesced BKT20 brief names it.

### 56. Briefs do not name all imports by title and id (other)

The briefs do not name all their imports by title and id, as PROTOCOL §16 requires. Route 9 cites 'MC.2/MC.7', 'LD.6' and SF stages without roadmap titles, and 'the parent Brauer and QFI carriers' without ids. It omits the suppliers of its own planned items: DeformationAndDerivedPatchingAlgebra:R03.3 (items 170, 171), tauceti:TauCetiRoadmap/StableReduction Layer 4 (items 172, 179), SchemeAndStackFoundations:SF.1 (item 173), tauceti AlgebraicTopology Stages 5–6 (items 144, 145) and QuadraticFormInvariants 7b (item 12). Route 5 says 'through the existing Galois-cohomology owners' without naming ProfiniteCohomology Layers 9–10 (galoisRes, galoisCor) or QuadraticFormInvariants Layer 7.

### 57. Route 9's brief does not state all final theorems exactly (other)

Not every final theorem is stated as the paper states it. Theorem 0.3 appears only as 'derive the no-real-points result' (hypotheses: S connected smooth projective over R with S(R)=∅ and α∈Br(R(S)) arbitrary). Theorem 0.6 appears as 'the real Enriques halves/Picard-image cases' without the equivalence (ii). Proposition 0.7 appears as 'period2/index4' without H¹(S(K),Z/2)=0. Theorem 0.13 appears only as an acceptance item. Theorems 0.4 and 0.5 are stated correctly; I checked the even-period criterion and Θ={x: α|x≠0} against p.64.

### 58. Stale note in prerequisite 9 (other)

Prerequisite 9 says 'item 149 deliberately has no route until the precise typed contract is verified', but route 6 routes item 149 ('Item 149 is owned here as an unresolved, explicitly gated obligation').

### 59. Route 8 coalesces with a Jannsen extraction the queue never applies (other)

The brief asks to 'coalesce the existing PAPER-JANNSEN-16 … tranches'. Jannsen's extraction has verdict 'revise', so the queue applies none of its routes (accepted_routes returns nothing unless the paper verdict is accept). The brief also omits Dittmann–Pop's HigherPfisterForms, which the queue merges into the same job and which plans the Pfister-form theory (all-length roundness, Arason–Pfister, the invariant-zero criterion) on which Pfister's Proposition 9 (item 94) may rest.

### 60. Route 1 does not coalesce with Česnavičius-19's route to SF.2 (other)

Route 1 does not mention the accepted Česnavičius-19 source route to the same stage. That route already brings into SF.2 the cohomological Brauer group Br'(X), injection into the function field for regular integral X, the codimension-one intersection formula (purity), DVR residues with their exactness, and Kummer sequences. Benoist's items 09 and 10 therefore add only the ramification-index formula for residues under finite extensions and the maximal unramified open; the blueprint job will receive both sources.

## For the maintainer

- Finding 1 is a `make_queue.py` issue, not only an extraction issue. `paper_designs` groups accepted Part II routes by parent alone and tells the merged job to plan only the first proposal. The same grouping has produced duplicate design jobs for other papers (BCGP-18/25, Skinner, Pan, Betts–Stix).
- Finding 8: the errata register lists every Benoist mistake twice, with contradictory reasons for E3 and opposite verdicts for E19.
