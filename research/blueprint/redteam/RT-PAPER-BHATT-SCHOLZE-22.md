# RT-PAPER-BHATT-SCHOLZE-22

Red team of the accepted extraction PAPER-BHATT-SCHOLZE-22: Bhargav Bhatt and Peter Scholze, *Prisms and prismatic
cohomology*, Annals of Mathematics 196 (2022), 1135–1275 (arXiv 1905.08229v4). Issue #4071.

Red team: Claude Code, session `cc-c2c06b`, 1 October 2026. I did not write or review:
- the extraction (`cc-7b31c4`, PR #1910);
- its review (`cc-38267a`, PR #2790).

Disclosures:
- I wrote FIX-RT-PAPER-BHATT-MORROW-SCHOLZE-19 (PR #5259). Its move of BMS19 item 066 (Proposition 7.17) into the
  henselian-pairs Part II creates one side of the PR.4 cycle in /1; the finding says so and offers both repairs;
- I wrote FIX-RT-PAPER-BHATT-MORROW-SCHOLZE-18 (PR #5263) and the round-2 fixes FIX-RT-AREA-padic-1~2 and -2~2 (PRs
  #5269, #5266), which edited the P0 and AdicSpacesPartII packets that two findings cite.

**Result: 61 findings, 2 high, 29 medium and 30 low.**

## Method

**The source.** arXiv 1905.08229v4 (<https://arxiv.org/abs/1905.08229v4>), the version the extraction read, was
re-downloaded on 2026-10-01 with its LaTeX source; its SHA-256 (`1d91a6eb…91e4a`) equals the extraction's. The published
Annals text is paywalled and was not read.

**The passes.** Five parallel passes were run by this session.
- Four read all 125 pages: §§1–3, §§4–8, §§9–13, and §§14–18 with the references.
- One checked the six routes, the 121 planned and one library status and the briefs against the atlas, accepted packets
  and restructurings, other papers' accepted routes, earlier red teams and the pinned libraries (Mathlib 082e2d3, Tau
  Ceti f790474).

**Merging.** I merged the PR.4 cycle (three passes), the de Rham and Cartier prerequisites, Proposition 8.5's placement,
Lurie's P⁰, Proposition 10.8 at P0, item 96, and the stale report and summary.

**What I re-verified myself.** Both high findings:
- the PR.4 cycle, from PAPER-BHATT-MORROW-SCHOLZE-19's current route 1 (whose brief imports PR.4), the item's earlier
  place on route 2, and items 55, 56 and 70 here planned at PR.4;
- Lemma 3.9 in the v4 text, whose proof cites Lemma 2.34, which assumes p-adic separatedness.

**Severity I changed.** The de Rham/Cartier prerequisite finding is medium, not high: the links are missing
requirements, and DD.2 and DD.3 do not depend on PR.1, so adding them creates no cycle.

The full list of what was checked is in the result's `checked` field.

## The high findings

### /1 — error

**Where.** PAPER-BHATT-SCHOLZE-22/55, PAPER-BHATT-SCHOLZE-22/56, PAPER-BHATT-SCHOLZE-22/70, PAPER-BHATT-SCHOLZE-22/115
(planned lists and notes); route 4 brief; PAPER-BHATT-SCHOLZE-22/55, PAPER-BHATT-SCHOLZE-22/56, route 4 brief;
PAPER-BHATT-SCHOLZE-22/70, PAPER-BHATT-SCHOLZE-22/71, route 4 brief; also the note of PAPER-BHATT-SCHOLZE-22/56 and the
plan of PAPER-BHATT-SCHOLZE-22/55, which rest on the same input

**Claim.** Theorem 9.4 (item 55), Lemma 9.6 with Corollary 9.7 (item 56) and Theorem 14.1 (item 70) are planned at
PrismaticCohomology:PR.4, but each proof uses statements whose owners lie downstream of PR.4, so the plan has two
dependency cycles. (a) All three use [BMS19, Proposition 7.17] (Z_p(1) = lim µ_{p^n}). After the confirmed
RT-PAPER-BHATT-MORROW-SCHOLZE-19/1, the accepted extraction PAPER-BHATT-MORROW-SCHOLZE-19 puts that proposition (item
066) in RefinedTraceMethodsPartIIHenselianPairs, and that Part II imports PR.4. Route 4 of this extraction says the
same: 'Import PR.4 and RT.6'. The cycle is PR.4 → Part II → PR.4. (b) Item 70's note makes PR.4 depend on Theorem 13.1
at RT.6. Item 56's note says 'PR.4 imports both (RT.6 is not downstream of PR.4)'. But the confirmed
RT-AREA-ktheory-2/36 adds the edge PR.4 → RT.6, so PR.4 and RT.6 would depend on each other. Route 4's sentence 'Import
PR.4 and RT.6; neither depends on this Part II' is false while these items stay at PR.4 with these inputs. Item 56's
note that PAPER-BHATT-MORROW-SCHOLZE-19/066 is 'routed to RefinedTraceMethods RT.6' is out of date. [BMS19, Proposition
7.17] itself has no item. Coordinator note: the move of PAPER-BHATT-MORROW-SCHOLZE-19/066 (Proposition 7.17) from that
paper's route 2 (RefinedTraceMethods) into its route 1 (the henselian-pairs Part II) was made by
FIX-RT-PAPER-BHATT-MORROW-SCHOLZE-19 (PR #5259), written by this session, applying a confirmed red-team finding; that
move created this side of the cycle. Also: Theorem 9.4 (item 55) and Lemma 9.6 with Corollary 9.7 (item 56) are planned
at PrismaticCohomology PR.4. Their proofs rest on [BMS19, Proposition 7.17] (ℤ_p(1) = lim_n μ_{p^n} = T_p𝔾_m on the
quasisyntomic site). That result gives the comparison map α_1 of Theorem 9.4 for n = 1, and Lemma 9.6 is a restatement
of it. Item 55 does not record this input. Item 56's note says it is owned by RefinedTraceMethods RT.6 and that 'RT.6 is
not downstream of PR.4'. Both claims are now false. (a) FIX-RT-PAPER-BHATT-MORROW-SCHOLZE-19 moved Proposition 7.17
(PAPER-BHATT-MORROW-SCHOLZE-19/066) to RefinedTraceMethodsPartIIHenselianPairs. The briefs of that Part II import PR.4:
this extraction's own route 4 does, and so does route 1 of PAPER-BHATT-MORROW-SCHOLZE-19. (b) The confirmed finding
RT-AREA-ktheory-2/36 adds the edge PR.4 → RT.6, and Proposition 7.17 is a statement about RT.6's motivic-filtration
ℤ_p(1). So PR.4 would import a theorem whose owner imports PR.4. This is a dependency cycle. It also reaches Theorem
14.1 (item 70), whose proof cites Proposition 7.17 and Corollary 9.7. Route 4's brief says 'Import PR.4 and RT.6;
neither depends on this Part II'. That sentence is false while items 55 and 56 sit in PR.4 and use Proposition 7.17.
Also: Theorem 14.1 (item 70, planned at PrismaticCohomology:PR.4) uses [BMS19, Proposition 7.17] (Z_p(1) is the
quasisyntomic sheaf T_pG_m = lim_n μ_{p^n}) in its perfectoid n ≥ 1 step, and Theorem 9.4 (item 55, PR.4) and Lemma 9.6
(item 56, PR.4), which Theorem 14.1 also uses, cite the same proposition. The extraction has no item for this cited
result. Its owner is no longer RT.6: FIX-RT-PAPER-BHATT-MORROW-SCHOLZE-19 moved PAPER-BHATT-MORROW-SCHOLZE-19/066
(Proposition 7.17, whose proof goes through K-theory and K ≃ τ_{≥0}TC) into route 1 of that paper, the Part II
RefinedTraceMethodsPartIIHenselianPairs. That Part II imports PR.4 (the accepted PAPER-BHATT-MORROW-SCHOLZE-19 route 1
brief, and this extraction's route 4 brief: 'Import PR.4 and RT.6; neither depends on this Part II'). So the plan has a
cycle PR.4 → Part II → PR.4: PR.4 cannot prove Theorem 14.1 (or Theorem 9.4) the way the paper does. Item 56's note
still justifies the PR.4 placement by '[BMS2, Prop. 7.17], which the accepted PAPER-BHATT-MORROW-SCHOLZE-19/066 routes
to RefinedTraceMethods RT.6', which is stale, and route 4's 'neither depends on this Part II' is false while PR.4 needs
Proposition 7.17.

**Evidence.** The paper (arXiv v4, p. 75), proof of Theorem 9.4: 'By [BMS19, Proposition 7.17], we know that Zp(1) =
lim_n µ_{p^n} as arc-sheaves on perfectoid rings ... so there is a canonical map α'. p. 76, proof of Lemma 9.6: 'But
this is exactly the characterization of Zp(1)(−) by [BMS19, Proposition 7.17], so the lemma follows.' p. 100, proof of
Theorem 14.1: 'By Kummer theory (and [BMS19, Proposition 7.17] to identify Zp(1) as the quasisyntomic sheaf lim_n
µ_{p^n})'. p. 97: ∆̂_S 'is a version of the Nygaard completed prismatic cohomology of S defined using topological
Hochschild homology ... when S lives over a perfectoid ring, this theory coincides with the Nygaard completion of
prismatic cohomology ... (Theorem 13.1)'. PAPER-BHATT-MORROW-SCHOLZE-19 route 1 now carries item 066 ('Z_p(1) is the
Tate module of G_m'), and its brief reads 'Imports: RefinedTraceMethods RT.2, RT.3 and RT.6, PrismaticCohomology PR.4
...'. RT-AREA-ktheory-2/36 (confirmed) fix: 'Add PrismaticCohomology:PR.4 → RefinedTraceMethods:RT.6'. Remark 9.5 (pp.
75–76) gives an algebraic alternative: 'In [BL], we shall give a direct algebraic construction of a comparison map log∆
... Using this, the proof of Theorem 9.4 becomes purely algebraic.' The accepted PAPER-BHATT-MATHEW-23/018 ('The
prismatic logarithm ... log_Δ : T_p(R^×) → Δ_R{1} whose image consists exactly of the y ∈ Δ_R{1} with φ_1(y) = y') is
planned at PR.5, and the confirmed RT-AREA-padic-2/28 adds PR.5 → PR.4. Also: Paper (arXiv v4, p. 75, proof of Theorem
9.4): 'By [BMS19, Proposition 7.17], we know that Z_p(1) = lim_n µ_{p^n} as arc-sheaves on perfectoid rings (or even as
sheaves on the full quasisyntomic site), so there is a canonical map α_1 : F_1 → G_1 determined by Kummer theory.' Paper
(p. 76, proof of Lemma 9.6): 'But this is exactly the characterization of Z_p(1)(−) by [BMS19, Proposition 7.17], so the
lemma follows.' Paper (pp. 75–76, Remark 9.5): 'In [BL], we shall give a direct algebraic construction of a comparison
map log_∆ : T_p(R^*) → φ^{−1}(d)A_inf(R){1} … Using this, the proof of Theorem 9.4 becomes purely algebraic.' Item 56
note: 'Lemma 9.6 restates [BMS2, Prop. 7.17], which the accepted PAPER-BHATT-MORROW-SCHOLZE-19/066 routes to
RefinedTraceMethods RT.6 … PR.4 imports both (RT.6 is not downstream of PR.4).' PAPER-BHATT-MORROW-SCHOLZE-19/066 note:
'Moved by FIX-RT-PAPER-BHATT-MORROW-SCHOLZE-19 (RT-PAPER-BHATT-MORROW-SCHOLZE-19/1) from RT.6 to the Part II (route 1)'.
That paper's route 1 brief: 'Imports: RefinedTraceMethods RT.2, RT.3 and RT.6, PrismaticCohomology PR.4 (Proposition
8.20, used by Corollary 8.23)'. This extraction's route 4 brief: 'Import PR.4 and RT.6; neither depends on this Part
II.' RT-AREA-ktheory-2/36 (verdict confirmed), fix: 'Add PrismaticCohomology:PR.4 → RefinedTraceMethods:RT.6'. Also: The
paper (arXiv v4, p. 100, proof of Theorem 14.1): 'By Kummer theory (and [BMS19, Proposition 7.17] to identify Z_p(1) as
the quasisyntomic sheaf lim_n μ_{p^n}), for any perfectoid ring R, the group H^1(Z_p(1)(R)) is H^0 of the derived
p-completion of R^*'. P. 75 (proof of Theorem 9.4): 'By [BMS19, Proposition 7.17], we know that Z_p(1) = lim_n μ_{p^n}
as arc-sheaves on perfectoid rings … so there is a canonical map α_1 : F_1 → G_1 determined by Kummer theory'; p. 76
(Lemma 9.6): 'this is exactly the characterization of Z_p(1)(−) by [BMS19, Proposition 7.17]'. The accepted
PAPER-BHATT-MORROW-SCHOLZE-19 extraction lists item 066 in route 1 (part-ii RefinedTraceMethodsPartIIHenselianPairs),
whose brief reads 'Imports: RefinedTraceMethods RT.2, RT.3 and RT.6, PrismaticCohomology PR.4 (Proposition 8.20, used by
Corollary 8.23) …'; its fix record says 'Items 066 and 089 move from route 2 to route 1'. Bhatt–Lurie, Absolute
prismatic cohomology (arXiv:2201.06120), Theorem 7.5.6: 'Let R be a p-complete animated commutative ring. Then the
morphism ĉ_1^syn : RΓ_ét(Spec(R), G_m)^∧[−1] → RΓ_syn(Spf(R), Z_p(1)) is an isomorphism … Theorem 7.5.6 is essentially
proven in [BMS19] … (see Proposition 7.17 of [BMS19]). We present here a different proof, which avoids the use of
algebraic K-theory'. PR.4's text lists 'Bhatt–Lurie §§7–8' among its sources. On the atlas stage graph PR.4 is not an
ancestor of PR.5.

**Fix.** Add a cited item for [BMS19, Proposition 7.17], planned at RefinedTraceMethodsPartIIHenselianPairs as
PAPER-BHATT-MORROW-SCHOLZE-19/066. Then do one of two things. (i) Keep items 55, 56 and 70 at PR.4, stated for the
prismatic Z_p(n) (item 115, with ∆̂ the Nygaard completion of prismatic cohomology). Their notes should say that PR.4
identifies Z_p(1) with T_p G_m through Bhatt–Lurie's prismatic logarithm (PAPER-BHATT-MATHEW-23/018 at PR.5, via the
edge PR.5 → PR.4 of the confirmed RT-AREA-padic-2/28), as Remark 9.5 allows, and not through [BMS19, Proposition 7.17].
Delete 'PR.4 imports both (RT.6 ...)' from item 56's note and the RT.6 dependence from item 70's note. Plan item 70 at
PR.4 for the prismatic statement. RT.6 transfers it to the TC-defined Z_p(n) of [BMS19] through Theorem 13.1, so record
RT.6 in item 70's note as a consumer, not as a planner. Plan item 115 at PR.4 only. (ii) Alternatively, move the n ≥ 1
part of item 55, and items 56 and 70, into route 4. In either case, rewrite route 4's sentence 'Import PR.4 and RT.6;
neither depends on this Part II' so that it matches. Alternatively, re-route PAPER-BHATT-MORROW-SCHOLZE-19/066 upstream
of PR.4 (it was a source item of RefinedTraceMethods before that fix), so that PR.4 can import it; either repair removes
the cycle, and the maintainer should choose one. Also: (1) Add an item for [BMS19, Proposition 7.17] (ℤ_p(1) is locally
in degree 0 and equal to T_p𝔾_m on the quasisyntomic site). Cite PAPER-BHATT-MORROW-SCHOLZE-19/066 and its current
owner, RefinedTraceMethodsPartIIHenselianPairs. (2) In item 56's note, replace 'routes to RefinedTraceMethods RT.6 …
(RT.6 is not downstream of PR.4)' with the correct owner, and say that PR.4 cannot import it. (3) Break the cycle the
way Remark 9.5 indicates. Add a new item, planned at PR.4: the Bhatt–Lurie prismatic logarithm log_∆ : T_p(R^×) →
φ^{−1}(d)A_inf(R){1} and the resulting identification of ℤ_p(1) with the p-completed T_p𝔾_m (PR.4 already cites
Bhatt–Lurie among its sources). In the notes of items 55 and 56, and in route 1's reason, say that PR.4 builds α_1 and
proves Lemma 9.6 from that item, not from [BMS19, Proposition 7.17]. If the maintainer prefers to keep the K-theoretic
proof, place Proposition 7.17 in a stage upstream of PR.4 and of RT.6 instead, which the current Part II is not. (4) In
route 4's brief, delete 'neither depends on this Part II' or qualify it to match (3). Also: Add an item for the cited
result [BMS19, Proposition 7.17] (Z_p(1) on quasiregular semiperfectoid rings is locally concentrated in degree 0 and
equal to T_pG_m; equivalently Z_p(1) ≃ RΓ_ét(−, G_m)^∧[−1] on p-complete quasisyntomic rings), with status planned at
PrismaticCohomology:PR.4 by the K-theory-free proof of Bhatt–Lurie, Absolute prismatic cohomology, Theorem 7.5.6 (proved
at PR.4, which names Bhatt–Lurie §§7–8, or imported from PR.5, which does not depend on PR.4), together with the
identification of Bhatt–Lurie's syntomic complexes with those of [BMS19] on quasisyntomic rings. In items 70 and 71 (and
55, 56) say that PR.4 must use that proof and must not import PAPER-BHATT-MORROW-SCHOLZE-19/066 from
RefinedTraceMethodsPartIIHenselianPairs; replace item 56's 'routes to RefinedTraceMethods RT.6' by the current owner. In
route 4's brief add that the Part II's K-theoretic proof of Proposition 7.17 must not be fed back to PR.4. If no
K-theory-free route is accepted, items 55, 56 and 70 cannot stay at PR.4 and must move to the Part II, and route 4's
'Import PR.4' must be withdrawn.

### /2 — error

**Where.** PAPER-BHATT-SCHOLZE-22/18; sourceIssues (a new entry); the extraction's summary and the report
(PAPER-BHATT-SCHOLZE-22.md), review section

**Claim.** Item 18 repeats Lemma 3.9's assertion that d is a nonzerodivisor in the uncompleted perfection A_perf =
colim_φ A. That assertion is false for some prisms. The paper deduces it from Lemma 2.34, but Lemma 2.34 assumes A is
p-adically separated, and A_perf need not be. The other assertions survive. p is a nonzerodivisor (A_perf is perfect).
A_perf/d[p^∞] = A_perf/d[p] holds because the proof of Lemma 2.34 (2) never uses separatedness. The conclusions about
A_∞ and (A, I)_perf hold because the proof passes to the p-adic completion, where Lemma 2.34 applies. The same
overstatement appears in the proof of Lemma 3.6: 'any distinguished element in a perfect δ-algebra is a nonzerodivisor
by Lemma 2.34'. It is harmless there, because it is applied to the p-adic completion B of A_perf. sourceIssues does not
record the mistake. The summary's claim that 'no stated result of the paper changes' is therefore wrong.

**Evidence.** The paper (arXiv v4, p. 31), Lemma 3.9: 'Then IA_perf = (d) is generated by a distinguished element, d and
p are nonzerodivisors in A_perf, and A_perf/d[p^∞] = A_perf/d[p].' Its proof: 'As A_perf is perfect, p is a
nonzerodivisor, and by Lemma 2.34, d is a nonzerodivisor'. Lemma 2.34 (p. 21) assumes 'a p-torsionfree and p-adically
separated δ-ring with A/p reduced', and its proof of (1) (p. 22) uses separatedness: 'since A is p-torsionfree and
p-adically separated, we may assume p ∤ f'.  Counterexample (checked by hand): - Setup. Let B = ℤ_p⟦q−1⟧ with φ(q) = q^p
and d = [p]_q, which is distinguished (Example 2.20 (2)). Then φ^k(d) = Φ_{p^{k+1}}(q) and B/φ^k(d) ≅ ℤ_p[ζ_{p^{k+1}}].
- The module. Let M = ∏_{k≥1} B/φ^k(d), and let σ : M → M be the φ-semilinear map (m_k)_k ↦ (0, φ̄(m_1), φ̄(m_2), …). It
is well defined because φ(φ^k(d)) = φ^{k+1}(d). - The δ-ring. Let A = B ⊕ M be the square-zero extension, with φ_A(b, m)
= (φ(b), pσ(m)). This is a ring endomorphism, since (b + m)^p = b^p + p b^{p−1} m. It lifts Frobenius, and A is
p-torsionfree, so A is a δ-ring. - The prism. d acts injectively on each factor, because Φ_p(ζ_{p^{k+1}}) ≠ 0 for k ≥ 1.
A is classically (p, d)-complete, being a product of complete modules. And p ∈ (d, φ(d)). So (A, (d)) is an oriented
prism, and even a bounded one: M/dM is killed by p. - The zero-divisor. In A_perf, let y be the class of (0, e_j) at
stage j, where e_j is 1 in the factor B/φ^j(d) and 0 elsewhere. At stage j, d is represented by φ_A^j(d) = (φ^j(d), 0),
so d·y is the class of (0, φ^j(d) e_j) = 0. But y ≠ 0, because φ_A^i(0, e_j) = (0, p^i e_{j+i}) ≠ 0 for every i. - What
survives. The M-part of A_perf is a ℚ-vector space, so it dies under derived (p, d)-completion. The completed statements
of the lemma survive.  The paper's own Remark 2.29 already gives a non-separated A_perf. Take ℤ_p[x]/(x²) with φ(x) =
px; it is a crystalline prism by Example 3.3. In its perfection, x = p^n φ^{-n}(x) for every n.

**Fix.** Replace the statement of item 18 with the following. 'Let (A, I) be a prism and A_perf = colim_φ A. Then
IA_perf = (d) for a distinguished d, p is a nonzerodivisor in A_perf, and A_perf/d[p^∞] = A_perf/d[p]. On the p-adic
completion of A_perf, which is p-torsionfree, p-adically separated and has perfect reduction mod p, d is a
nonzerodivisor (Lemma 2.34). Consequently the derived (p, I)-completion A_∞ of A_perf agrees with its classical
completion, d is a nonzerodivisor in A_∞, and (A, I)_perf := (A_∞, IA_∞) is the universal perfect prism under (A, I). In
general d can be a zero-divisor in A_perf itself.' Add a new sourceIssue: - kind: error; - locator: Lemma 3.9, p. 31
(TeX ll. 1121, 1124), with the parenthetical in the proof of Lemma 3.6, p. 30 (TeX l. 1068); - printed: 'd and p are
nonzerodivisors in A_perf'; - correction: d is a nonzerodivisor only after p-adic completion, and the Lemma 3.6
parenthetical needs 'p-complete'; - reason: the counterexample above; - affects: a stated result (the middle assertion
of Lemma 3.9; its conclusion and all later uses are unaffected); - known: new. In the summary and in the report's review
section, replace 'no stated result of the paper changes' accordingly.

## All findings

| Finding | Severity | Kind | Where | Claim (abridged) |
|---|---|---|---|---|
| /1 | high | error | PAPER-BHATT-SCHOLZE-22/55, PAPER-BHATT-SCHOLZE-22/56, …; … | Theorem 9.4 (item 55), Lemma 9.6 with Corollary 9.7 (item 56) and Theorem 14.1 (item 70) are planned at PrismaticCohomology:PR.4, but each proof uses … |
| /2 | high | error | PAPER-BHATT-SCHOLZE-22/18; … | Item 18 repeats Lemma 3.9's assertion that d is a nonzerodivisor in the uncompleted perfection A_perf = colim_φ A. That assertion is false for some prisms. The … |
| /3 | medium | error | PAPER-BHATT-SCHOLZE-22/46 (last sentence of the statement); … | Two statements planned at PR.2 are proved in the paper only through Proposition 8.5 (item 47). The review moved Proposition 8.5 to the Part II of route 3, … |
| /4 | medium | other | route 3 brief (export sentence) | Two confirmed findings of RT-AREA-padic-1 give the Part II of route 3 consumers that its brief does not name. The round-1 fix wrote exact edits to this brief, … |
| /5 | medium | other | route 3 (roadmap id, reason and brief); … | make_queue.py does not create the roadmap PerfectoidQuotientsPartIIIntegralPerfectoidization. It merges every Part II proposal for the parent … |
| /6 | medium | duplicate | PAPER-BHATT-SCHOLZE-22/111; … | Item 111 (Tor-independence of perfectoid rings) is routed as missing to PR.0, including the claim that the completed tensor product of perfectoid rings is … |
| /7 | medium | error | PAPER-BHATT-SCHOLZE-22/20 (status and planned layer); … | Item 20 (Remark 3.11, perfectoid covers of complete regular local rings) is marked planned at PR.0 only because PR.0 lists 'BS22 §§2–3' among its sources. This … |
| /8 | medium | duplicate | PAPER-BHATT-SCHOLZE-22/50; … | Proposition 8.10 and Remark 8.9 have two owners in two accepted extractions. This paper calls them missing and routes them to ArcTopologyAndDescent. The … |
| /9 | medium | error | PAPER-BHATT-SCHOLZE-22/37b (planned list) | Corollary 15.4 is planned at both PR.1 and PR.3. PR.1 cannot prove it. Its proof reduces the map φ̃ of Theorem 15.3 (PR.3) modulo I, and PR.3 comes after PR.1. … |
| /10 | medium | other | the report (PAPER-BHATT-SCHOLZE-22.md): opening paragraph, 'What the …; … | The body of the report still describes the rejected extraction, and the appended review section corrects only part of it. The opening gives 96 items, 83 … |
| /11 | medium | missing | PAPER-BHATT-SCHOLZE-22/19; … | The proof of Theorem 3.10 has an unrecorded gap. To show that R = A/I is perfectoid for a perfect prism (A, I), it checks only three conditions: Frobenius … |
| /12 | medium | missing | PAPER-BHATT-SCHOLZE-22/19, PAPER-BHATT-SCHOLZE-22/89 | Two cited results in the proof of Theorem 3.10 are not items. (a) [BMS1, Remark 3.11]: for R perfectoid, ker θ is generated by a distinguished element that is … |
| /13 | medium | missing | PAPER-BHATT-SCHOLZE-22/4d; … | Van der Kallen's theorem is not an item, although the proof of Lemma 2.18 cites it. The theorem says that W_r(A) → W_r(B) is étale for étale A → B ([BMS1, … |
| /14 | medium | missing | PAPER-BHATT-SCHOLZE-22/17b | The proof of Lemma 3.7 (2) rests on [BMS19, Lemma 4.7], which is not an item. That lemma says: a derived p-complete, p-completely flat complex over a ring with … |
| /15 | medium | missing | PAPER-BHATT-SCHOLZE-22/20 | Two cited results behind Remark 3.11 are not items, and neither is listed as a prerequisite. The first is [Bha18a, Proposition 5.1]. This is what upgrades the … |
| /16 | medium | missing | PAPER-BHATT-SCHOLZE-22/22, PAPER-BHATT-SCHOLZE-22/30 | Item 22's locator includes Example 3.14, but its statement omits what Example 3.14 asserts. Example 3.14 says that a certain pair (B, J) satisfies the … |
| /17 | medium | error | PAPER-BHATT-SCHOLZE-22/101, PAPER-BHATT-SCHOLZE-22/102, route 5; … | The de Rham complex of a p-completely smooth algebra (item 102, routed by route 5 to DerivedDeRhamCohomology DD.2) and the classical Cartier isomorphism for … |
| /18 | medium | error | PAPER-BHATT-SCHOLZE-22/28; … | Item 28 states the sheaf-level base change of Corollary 4.12 and adds 'equivalently RΓ_∆(X/A) ⊗̂^L_A B ≅ RΓ_∆(Y/B)'. The global form is not equivalent to the … |
| /19 | medium | missing | PAPER-BHATT-SCHOLZE-22/110; … | The proof of Lemma 8.4 (item 110, routed to PR.2) uses two facts about E∞-F_p-algebras taken from Lurie. First, the levelwise Frobenius of a simplicial … |
| /20 | medium | missing | PAPER-BHATT-SCHOLZE-22/32 | The general case of Theorem 5.2 (a pd-ideal I ∋ p with I ≠ (p)) is the case Theorem 6.4 applies, to the pd-ideal J ⊂ W(A/I). Its proof lifts the smooth … |
| /21 | medium | missing | PAPER-BHATT-SCHOLZE-22/37, PAPER-BHATT-SCHOLZE-22/90, … | The proof of Theorem 6.4 uses 'generalities on crystalline cohomology': RΓ_crys((R/p)/W(A/I)) ⊗̂^L_{W(A/I)} A/I ≅ Ω^•_{R/(A/I)}. This is base change of … |
| /22 | medium | error | PAPER-BHATT-SCHOLZE-22/66, PAPER-BHATT-SCHOLZE-22/68, … | The proofs of Proposition 12.8 (item 114) and of Theorem 13.1 (item 69) use André's lemma, Theorem 7.14 (item 45, planned at PerfectoidQuotients Q3). Theorem … |
| /23 | medium | missing | PAPER-BHATT-SCHOLZE-22/53, PAPER-BHATT-SCHOLZE-22/55, … | Three results cited in the proofs of §9 have no item. (a) The Artin–Schreier–Witt description RΓ_ét(Spec T, ℤ/p^n) ≃ fib(W_n(T) →^{F−1} W_n(T)) for an … |
| /24 | medium | missing | PAPER-BHATT-SCHOLZE-22/60, PAPER-BHATT-SCHOLZE-22/64, route 3 brief | Two results cited in the proofs of §§10–11 have no item. (a) [And18b, Lemma 1.9.2]: a finite étale cover of constant degree r is the quotient by Σ_{r−1} of a … |
| /25 | medium | missing | PAPER-BHATT-SCHOLZE-22/69, PAPER-BHATT-SCHOLZE-22/67, prerequisites | The proof of Theorem 13.1 (item 69) cites three results of [BMS19] that this extraction does not record: Construction 7.12 (the non-completed Δ̂^nc_{S/A}), … |
| /26 | medium | duplicate | PAPER-BHATT-SCHOLZE-22/59b, route 6, route 3 brief; … | Item 59b (Proposition 10.8) is marked missing and is routed by route 6 to PerfectoidSpaces P0. Route 6's reason says that P0 'does not treat almost Galois … |
| /27 | medium | error | PAPER-BHATT-SCHOLZE-22/96; … | Item 96 (the adic generic fibre X_η = X ×_{Spf R} Spa(R[1/p], R) of a p-adic formal scheme over a perfectoid ring, as a pre-adic space, with its étale site and … |
| /28 | medium | error | PAPER-BHATT-SCHOLZE-22/82; … | Item 82 says that Theorem 16.22 with Theorem 16.18 proves '[Sch17, Conjecture 1.1]'; the Sch17 prerequisite says Theorems 16.18 and 16.22 'resolve' Conjecture … |
| /29 | medium | missing | PAPER-BHATT-SCHOLZE-22/70, PAPER-BHATT-SCHOLZE-22/115 | The proof of Theorem 14.1 rests on two cited results of [BMS19] that have no item and are named in no note: Remark 7.20 (p-torsion-freeness of Z_p(n) follows … |
| /30 | medium | missing | PAPER-BHATT-SCHOLZE-22/74, PAPER-BHATT-SCHOLZE-22/75, … | Cited results used in the proofs of §15 have no item: [BMS19, Proposition 5.8] (a filtered map whose source is connective in the Beilinson t-structure lifts to … |
| /31 | medium | missing | PAPER-BHATT-SCHOLZE-22/83, PAPER-BHATT-SCHOLZE-22/116, … | The proof of Theorem 17.2 uses cited results that no item covers: [BMS18, Theorem 9.2] (AΩ_R/ξ̃ ≃ Ω̃) and [BMS18, Theorem 8.3] (the Hodge–Tate isomorphism for … |
| /32 | low | other | route 2 reason; … | Both reasons describe make_queue.py as it no longer is, and route 2 also gets the paper order wrong. Since the change of 28 September, make_queue.py merges … |
| /33 | low | other | route 2 reason ('Putting these statements in PR.2 would also close a … | The reason's cycle argument rests on a single edge, PerfectoidQuotients:Q4 → AdicEtaleGeometry:A3, and the confirmed RT-AREA-padic-1/6 deletes that edge. Once … |
| /34 | low | other | PAPER-BHATT-SCHOLZE-22/3, PAPER-BHATT-SCHOLZE-22/32, … | These items list as planners some layers that only supply an input to the result or import it. That gives each statement a second, false owner. … |
| /35 | low | other | route 2 brief, route 3 brief, route 4 brief (imports) | The briefs name the roadmaps they import from by id only, while the protocol asks for title and id. Examples: 'PerfectoidQuotients Q0:integral-algebra', … |
| /36 | low | library-claim | PAPER-BHATT-SCHOLZE-22/109 (library field) | Example 8.3 identifies S_perfd with 'the direct-limit perfection S_perf' of an F_p-algebra S. Pinned Mathlib has that perfection, with its universal property, … |
| /37 | low | error | PAPER-BHATT-SCHOLZE-22/9c, PAPER-BHATT-SCHOLZE-22/10c, … | Four page numbers in locators are wrong. - Item 9c: Corollary 2.31 starts on p. 20, not p. 21. - Item 10c: Lemma 2.34 is stated on p. 21, not p. 22; its proof … |
| /38 | low | missing | sourceIssues (a new entry) | Two wrong cross-references in §§1 and 3 are unrecorded. Unlike E7 (right number, wrong environment word), these point to the wrong result. (1) On p. 6, before … |
| /39 | low | other | sourceIssues E5 | E5 locates its misprint partly in Theorem 1.12 (1). Read with the introduction's own definition, that statement is correct. Remark 1.7 defines the absolute … |
| /40 | low | missing | PAPER-BHATT-SCHOLZE-22/47 | The proof of Proposition 8.5 cites [BMS19, Remark 4.22]: a p-complete algebra T over a perfectoid ring R with T/pT semiperfect is semiperfectoid, being a … |
| /41 | low | missing | PAPER-BHATT-SCHOLZE-22/42 | The last step of Example 7.9 is not proved in the paper. That step shows that J/I maps onto gr_1 = J/(J²+I){−1}, which makes B = A{J/I}^∧ → ∆_{R/A} an … |
| /42 | low | other | PAPER-BHATT-SCHOLZE-22/50, PAPER-BHATT-SCHOLZE-22/112, route 2 brief | Item 50's note says 'The imported inputs are item 112', and route 2's brief lists only items 112 and 113 as inputs. Item 112 covers the arc_p topology, … |
| /43 | low | other | PAPER-BHATT-SCHOLZE-22/36 | Proposition 6.2 is the base case of the Hodge–Tate comparison. Its proof leaves one step to the reader: that the base-change identification b̂^*∆̄_{R/A} ≃ … |
| /44 | low | error | the report (PAPER-BHATT-SCHOLZE-22.md), section 'Checks run on the … | The report says that in Lemma 7.7 (3) 'the authors prove only that (∆_{R/A}, I∆_{R/A}) is weakly initial, a retract of the initial object under an idempotent'. … |
| /45 | low | other | a new sourceIssue (Definition 4.1) | Unrecorded misprint. Definition 4.1 glosses a faithfully flat map of prisms as one where C is (p, IB)-completely flat over B, dropping 'faithfully'. Read … |
| /46 | low | other | a new sourceIssue (proof of Lemma 5.4) | Unrecorded misprint. Equation (3) in the proof of Lemma 5.4 indexes the coset decomposition by s ∈ M instead of s ∈ S. Over all s ∈ M the translates pM + s are … |
| /47 | low | other | a new sourceIssue (proof of Corollary 7.3) | Unrecorded misprint. The proof of Corollary 7.3 identifies perfectoid rings under S with perfect prisms (A, I) with a map R → A/I; it should be S → A/I. R is … |
| /48 | low | other | a new sourceIssue (proof of Proposition 7.10) | Unrecorded misprint. The proof of Proposition 7.10 writes ∆_{S/R} and ∆_{S′/R}, which are not defined. The objects meant are ∆_{S/A} and ∆_{S′/A} for (A, I) = … |
| /49 | low | other | a new sourceIssue (Remark 7.15 (1)) | Unrecorded misprint. Remark 7.15 (1) identifies A/f^p → D_{(f)}(A) with A/f^p → A/f^p[g_1, g_2, …]/(g_1^p, g_2^p, …) via g_i ↦ γ_{ip}(f). It should be g_i ↦ … |
| /50 | low | other | a new sourceIssue (proof of Corollary 8.12) | Unrecorded misprint. In the proof of Corollary 8.12, the sheaf-of-sets form of the pushout F_S = F_{S′} ⊔_{F_{S′/I}} F_{S/I} is printed as F(S) = F(S′) … |
| /51 | low | error | PAPER-BHATT-SCHOLZE-22/53 | The statement of item 53 writes ∆_{X/A} and ∆_{S/A} for arbitrary, possibly singular, p-adic formal schemes over R without saying that these denote derived … |
| /52 | low | error | PAPER-BHATT-SCHOLZE-22/113 | Item 113 combines two cited results with different statuses and gives the whole item status missing and route 2. The first is Huber's comparison [Hub96, Cor. … |
| /53 | low | other | sourceIssues (a new sourceIssue), PAPER-BHATT-SCHOLZE-22/69 | §13 has two misprints that sourceIssues does not record. (1) In the proof of Theorem 13.1, the sentence 'Moreover the upper map is the derived p-completed base … |
| /54 | low | other | sourceIssues (a new sourceIssue), PAPER-BHATT-SCHOLZE-22/64 | The proof of Theorem 11.1 has an unrecorded gap. It reduces to F = j_!L with j : U → X 'the inclusion of a quasicompact open subset of a constructible closed … |
| /55 | low | error | sourceIssues E19 | E19 records the negative exponent in colim_{g^{1/p^i − 1/p^{i−1}}} R/p^n only at TeX l. 2466, the sentence before Proposition 10.8. The first display of … |
| /56 | low | error | PAPER-BHATT-SCHOLZE-22/57, PAPER-BHATT-SCHOLZE-22/59 | Item 57 states Proposition 10.4 only as 'such complexes form a thick tensor ideal' and drops its other assertion: the J-almost zero derived p-complete … |
| /57 | low | error | PAPER-BHATT-SCHOLZE-22/76; … | The paper cites '[BMS19, Proposition 11.5]' for the definition of RΓ_𝔖(X); in BMS19, 11.5 is a Construction (the cyclotomic structure on THH(−/𝕊[z])), and the … |
| /58 | low | error | sourceIssues (a new one); … | Five misprints in §§14–17 are not recorded (E27, E28 and E30 cover other lines). (1) Proof of Lemma 14.4: after the display Fil^n_N D = ⊕ … |
| /59 | low | error | sourceIssues E29 | E29 records four misprints in the proofs of Theorem 18.2 and Lemma 18.3 but misses two more of the same kind in Lemma 18.3. In the perfectoid case the paper … |
| /60 | low | missing | prerequisites | Two papers cited in the proofs of §§12 and 17 have no prerequisite entry and no extraction in the atlas. Bhatt, Cohen–Macaulayness of absolute integral … |
| /61 | low | missing | PAPER-BHATT-SCHOLZE-22/70b, route 4 brief | Item 70b and route 4's brief state as a final theorem that π_*K(O_C/pⁿ; Z_p) vanishes in odd degrees 'by Corollary 14.3'. Corollary 14.3 only transfers … |

## Notes for the fix job

- **PR.4 cycle.** Choose one repair: build the n = 1 comparison at PR.4/PR.5 from the Bhatt–Lurie prismatic logarithm
  (Remark 9.5), or re-route PAPER-BHATT-MORROW-SCHOLZE-19/066 upstream of PR.4. Update item 56's note, which still names
  RT.6.
- **Lemma 3.9.** Restrict item 18 to the p-adic completion (or to p-adically separated perfections) and record the
  overstatement as a new sourceIssue.
- **Prerequisite links.** Add DD.2/DD.3 → PR.1 and DD.3 → PR.2 (and the CR.3 crystalline base change) as requests in the
  PrismaticCohomology blueprint.
- **Ownership.** Reconcile with ČS24, GR24 and André (Proposition 10.8 cannot go to P0 with its flatness hypothesis),
  and refresh the report and summary, which still describe the rejected extraction.
