# RT-PAPER-ZHANG-21

Red team of the accepted extraction PAPER-ZHANG-21: Wei Zhang, *Weil representation and Arithmetic Fundamental Lemma*,
Annals of Mathematics 193 (2021), 863–978. Issue #4075.

Red team: Claude Code, session `cc-c2c06b`, 1 October 2026. I did not write or review:
- the extraction (`codex-a71f92`, checkpoint PR #2041; `cc-442dc5`, PR #2142);
- its review (`cc-39fac3`, PR #2418).

Disclosures. Three findings cite earlier work of this session as evidence:
- I wrote REV-FIX-RT-RS-06 (PR #5283), which accepted round-2 fixes to RS-06, and RT-PAPER-YUAN-26 (PR #5331); /1 cites
  RS-06 for R35.1's kept scope and PAPER-YUAN-26 for a queued Part II id;
- I wrote RT-PAPER-HE-LI-SHI-ETAL-23 (PR #4957); /10 cites that extraction's item 9 as a second duplicate;
- I wrote REV-RT-RS-18 (PR #4944); /39 cites RS-18 for S.7's kept scope.
Other findings list PAPER-LESLIE-25 (my red team, PR #5341) and PAPER-KALETHA-16 (my fix, PR #5200) among the sharers of
a queued Part II; nothing rests on them.

**Result: 57 findings, 9 high, 25 medium and 23 low.**

## Method

**The source.** The published version, from the public YMSC mirror
(<https://archive.ymsc.tsinghua.edu.cn/pacm_download/21/12000-annals.2021.193.3.5.pdf>), was re-downloaded on
2026-10-01; its SHA-256 (`6f8ac537…3b45`) equals the extraction's. It has 116 pages; locators are printed pages.

**The passes.** Six parallel passes were run by this session.
- Five read all 116 pages: §§1–3, §§4–5, §§6–10, §§11–12, and §§13–15 with Appendices A–B and the references.
- One checked the eleven routes, the 13 planned and 7 library statuses and the briefs against the atlas, the accepted
  restructurings, other papers' accepted routes, earlier red teams and the pinned libraries (Mathlib 082e2d3, Tau Ceti
  f790474).

**Merging.** I merged the route 11 brief and the misplaced review corrections (five passes), the stale report (five),
the E28/E36 conflict, route 5, Appendix B's double ownership, and nine single-item findings that two passes each
reported.

**What I re-verified myself.** All nine high findings:
- E28/E36, from Conjecture 3.8 (p. 883), Proposition 4.12 (p. 895), Theorem 14.6 case (ii) (p. 967) and the choice of S
  in Theorem 15.1 (p. 969);
- route 11's brief and route 9's brief as accepted;
- route 5, from R35.1's atlas text and RS-06's kept scope;
- item 116's last clause against route 11's imports;
- item 55 against Proposition 7.9 and Remark 7.7 (p. 911);
- item 160, from the positivity of −Ei(−r) in (8.10) and the infinitude of the lattice vectors;
- Theorem 8.6, from BHKRY (arXiv 1702.07812, §§1.1 and 1.5): n ≥ 3 and odd discriminant;
- items 152 and 131, by the cofactor expansion and the example Spec Z_p[x] ⊃ V(px−1).

**Severity I changed.** Items 152 and 131 are high, not low or medium: each states a false identity, even though the
paper's uses survive. Appendix B's double ownership is medium, not high: this extraction already names route 10 as the
owner.

The full list of what was checked is in the result's `checked` field.

## The high findings

### /1 — error

**Where.** route 5; PAPER-ZHANG-21/73; PAPER-ZHANG-21/76

**Claim.** Route 5 is a source route that sends items 73 and 76 into ArakelovGeometryAndAbelianHeights:R35.1, but R35.1
does not plan them. Item 73 is the arithmetic Chow group Ĉh^1(M) of a regular flat, possibly non-proper arithmetic
scheme over O_E∖S. Its elements are divisors with Green functions on the complex fibres, modulo (div f, −log|f|²). Item
76 is the pairing of Ĉh^1(M) with proper 1-cycles, valued in R_S. R35.1 plans hermitian bundles and arithmetic degree on
arithmetic curves only, both in the atlas and in the narrowed scope that the accepted restructuring RS-06 gives it. No
atlas stage plans arithmetic Chow groups of higher-dimensional arithmetic varieties: GZ.2 covers arithmetic surfaces
only. So the two definitions on which the arithmetic side of the AFL comparison rests have no owner. That side is items
74, 75, 77, 78 and 83 and Theorems 14.6 and 15.1. The route also contradicts an accepted decision: PAPER-LI-ZHANG-22-B's
accepted route 2 has the Kudla–Rapoport Part II construct 'Gillet–Soulé arithmetic degrees'. Both the route's own reason
and the review's notes on items 73 and 76 flag that R35.1's scope must be extended, but the route was accepted
unchanged. R35.1 also lacks the Chow-group input: SchemeAndStackFoundations:SF.5 is not an ancestor of R35.1, which
requires only AbelianSchemesAndArithmeticModuli:A2 and AlgebraicModuliForArithmeticGeometry:R09.3. Coordinator note:
this session wrote REV-FIX-RT-RS-06 (PR #5283), which accepted round-2 fixes to RS-06, and RT-PAPER-YUAN-26 (PR #5331);
RS-06 is cited only for R35.1's kept scope, and PAPER-YUAN-26 only for the queued Part II id. Also: Route 5 is a source
route that places items 73 (the arithmetic Chow group Ĉh^1 of a regular, flat, non-proper model over O_E∖S, with Green
functions) and 76 (its pairing with proper 1-cycles, valued in R_S) in ArakelovGeometryAndAbelianHeights:R35.1. R35.1
plans hermitian bundles and arithmetic degree over arithmetic curves only, and no atlas stage plans Gillet–Soulé
arithmetic Chow groups of higher-dimensional arithmetic varieties or Green currents. A source route must name layers
that plan the items, so these two items have no owner. The review noted this in both items' notes and still accepted the
route. The same Gillet–Soulé Ĉh^1 is also routed, as a missing item, to UnitaryKudlaRapoportCycles by
PAPER-LI-ZHANG-22-B/115 and to GSpinSpecialDivisorHeights by PAPER-ANDREATTA-GOREN-HOWARD-ETAL-18/arithmetic-divisor.
Zhang-21's items, which need exactly that object for the same unitary Shimura varieties, go to a third place, R35.1.

**Evidence.** Atlas, R35.1: 'Construct the hermitian line/vector bundles over arithmetic curves used in the proof, their
determinant, tensor and dual operations, and arithmetic degree.' Accepted RS-06 keeps for R35.1: 'Construct hermitian
line/vector bundles on arithmetic curves, determinant/tensor/dual operations, arithmetic degree and its
model/base-change formulas'. The paper (p. 923): 'We first recall the arithmetic Chow group Ĉh^1(M) (with Q-coefficient)
for a regular flat scheme (possibly non-proper) M → Spec O_E. Elements are represented by arithmetic divisors ... where
Z is a divisor on M and g_{Z,w} is a Green function of Z_w(C) on the complex manifold M_w(C)'. The paper (p. 924):
'there is an arithmetic intersection pairing ... Ĉh^1(M) × Z̃_{1,c}(M) → R (cf. [3, §2.3] when the ambient scheme is
proper)'. Route 5 reason: 'audit the precise extension of R35.1 before final acceptance'. Review note on items 73 and
76: 'The source route must extend R35.1's scope explicitly, or name GrossZagierAndArithmeticHeights:GZ.2, which covers
only surfaces. Otherwise the item stays unowned.' PAPER-LI-ZHANG-22-B route 2 brief (accepted): 'Construct: ...
Gillet–Soulé arithmetic degrees, shared with GSpinSpecialDivisorHeights if both are accepted.' Also: Atlas stage
ArakelovGeometryAndAbelianHeights:R35.1: 'Construct the hermitian line/vector bundles over arithmetic curves used in the
proof, their determinant, tensor and dual operations, and arithmetic degree ... Supply the arithmetic intersection
statements invoked by the moduli-height comparison.' GrossZagierAndArithmeticHeights:GZ.2 covers only 'arithmetic
surfaces'. Notes on items 73 and 76: 'R35.1 as described in the atlas plans hermitian bundles and arithmetic degree over
arithmetic curves only. This item needs Ĉh^1 of a regular, flat, non-proper model of arbitrary dimension ... Otherwise
the item stays unowned.' The paper, p. 923 (§8.4) and pp. 924–925 ((9.1)–(9.4)). PAPER-LI-ZHANG-22-B/115, 'Arithmetic
degrees and the Gillet–Soulé arithmetic Chow group', is routed to UnitaryKudlaRapoportCycles.

**Fix.** Replace route 5 by a part-ii route with these fields: - parent: ArakelovGeometryAndAbelianHeights; - roadmap:
ArakelovGeometryAndAbelianHeightsPartII, the id under which PAPER-YUAN-26's accepted route 8 is already queued; - title:
'Arakelov geometry and heights of abelian varieties, Part II: arithmetic Chow groups and pairings on arithmetic
varieties'; - area: arithmeticgeometry; - items: 73 and 76. The brief must plan: - Ĉh^1 of regular flat, possibly
non-proper, schemes over O_E∖S: arithmetic divisors with Green functions, principal arithmetic divisors (div f,
−log|f|²), and the isomorphism of Remark 8.5; - the pairing with proper 1-cycles, valued in R_S ((9.1)–(9.4); [3, §2.3]
and Prop. 2.3.1(ii)). The brief imports 'Scheme, stack, cohomology and intersection foundations
(SchemeAndStackFoundations) SF.5' and 'Arakelov geometry and heights of abelian varieties
(ArakelovGeometryAndAbelianHeights) R35.1'. In route 11's brief, import Ĉh^1 and the pairing from this Part II, and say
that PAPER-LI-ZHANG-22-B's 'Gillet–Soulé arithmetic degrees' are the same objects, imported and not rebuilt. Update
route 5's paragraph in the report (PAPER-ZHANG-21.md). Also: Move items 73 and 76 to route 11
(UnitaryKudlaRapoportCycles), where they coalesce with PAPER-LI-ZHANG-22-B/115. Keep route 5 only for what R35.1 does
plan: the arithmetic degree on Spec O_E, with its ½-per-embedding archimedean weight (E39), as a planned input, or drop
it. Add a note that the single owner of the Gillet–Soulé arithmetic Chow group (now proposed in three roadmaps) is for
the maintainer to settle.

### /2 — error

**Where.** route 11 brief; route 9 brief (the review's corrections); PAPER-ZHANG-21/21, /33, /34, /39, /40, /70, /125;
PAPER-ZHANG-21/21; route 9 brief; report (PAPER-ZHANG-21.md), route 11 paragraph and 'Result and scope';
PAPER-ZHANG-21/125

**Claim.** Route 11 states the AFL endpoint at p ≥ n without saying that the paper's proof has a gap at p = n. The
review's corrections for the AFL items were put in the brief of route 9 (the Jacquet–Rallis Part II), which owns none of
those items. By the confirmed sourceIssue E36, Proposition 4.12(i) (item 33) proves (b) for V_{n−1} ⇒ (a) for V_n only
when q ≥ n+1. The proof of Theorem 15.1 obtains (a) for S_n by exactly this implication. It then applies Corollary 14.8,
which assumes (a) at every p ∉ S, where S contains only the primes below n. So the planned chain proves part (a) only
for p ≥ n+1. Part (b) for V_{n−1} at p ≥ n follows only if, in the induction step for V_m, S is taken to contain every
prime ≤ m. Route 11's brief tells its design job to prove the printed endpoint along the paper's lines, so it will plan
a proof with a hole. Other corrections for route-11 items also appear only in route 9's brief: E38 (Theorem 5.5 only for
q ≥ n; items 39–40), E51 (Proposition 4.12(ii) without its bound; item 34) and E44 ((8.11) needs 4π; item 70). Also: The
review's E36 correction to the AFL was placed in the wrong brief. Route 11 (UnitaryKudlaRapoportCycles) owns Theorem
15.1 and Proposition 4.12 (items 21, 22 and 33). Its brief says 'Prove ... Theorem15.1. Endpoint: unramified F/Qp, p
odd,p≥n, strongly regular group Sn and literal indexed semi-Lie dimension n−1 satisfy ∂Orb=−Int logp' and asks for
'unit-denominator rank reduction' with no qualification. E36 (confirmed) shows that the printed proof of Theorem 15.1(a)
at p = n has a gap: in Proposition 4.12(i), the direction (b) for V_{n−1} ⇒ (a) for V_n is proved only for q ≥ n+1. That
correction was appended only to the route 9 brief (JacquetRallisRelativeTraceComparison), which owns none of these
items. The route 11 design job is therefore told to prove the group AFL at p = n by the paper's route without being told
that the route fails there. The route 9 bullet on Theorem 5.5 (items 39 and 40, also route 11) is misplaced in the same
way. Also: The review put the corrections for Proposition 4.12(i), Theorem 5.5 and the AFL at p = n into route 9's brief
(JacquetRallisRelativeTraceComparison). The items they concern (PAPER-ZHANG-21/21, /33, /34, /39 and /125) are routed to
route 11 (UnitaryKudlaRapoportCycles). Route 11's brief still sets the endpoint 'p≥n, strongly regular group Sn …' and
says nothing of the following: the paper's proof of the group version at p = n has a gap (E36); Proposition 4.12(ii)
must be stated without its q-bound (E51); and E28 needs a repair. Its only hint, 'Close … the q-bound use in local
constancy', points at a non-issue, since Theorem 5.5 needs no bound on q once the step in E38 is repaired. The design
job for route 11 is instructed only by route 11's brief. Also: The review appended the corrections that the layers must
respect only to the route 9 (JacquetRallisRelativeTraceComparison) brief. That list includes '(8.11) needs 4π, not 2π',
although the Kudla Green function (item 70) is a route 11 item. The route 11 brief, which owns every §§7–10 item,
records none of the corrections that change its layers' statements: E40 (Proposition 7.9(b)'s étaleness off Ram(α) is
false); E39 (the complex-place weight in (9.12) and (10.1) double-counts); E44 (Green function −Ei(4πaR), hence
−Ei(−4πa|ξ′|) in Corollary 10.3); E45 (G^B(ξ,φ) := 0 for ξ ∉ F_{0,+} in (8.14)); E38 (the printed proof of Theorem 5.5
needs q ≥ n); and the n ≥ 3 range of the BHKRY input for Theorem 8.6. It says only 'Source corrections and the analytic
descent/normalization gates are mandatory before final acceptance'. A design job reading the brief will meet the printed
definitions (9.12) and (8.11) first. Also: The route 11 brief owns Theorem 15.1, yet it states the AFL endpoint 'p ≥ n'
for the group version without the restriction the review recorded. The proof of (a) at p = n goes through Proposition
4.12(i) at q = n, whose printed proof has a gap (E36). Item 21's note, E36 and the route 9 brief all say so, but the
route 11 brief and item 125's statement do not. As written, the design job is told to prove the group AFL at p = n from
this paper, which does not supply a complete argument there.

**Evidence.** Route 11 brief: 'Endpoint: unramified F/Qp, p odd,p≥n, strongly regular group Sn and literal indexed
semi-Lie dimension n−1 satisfy ∂Orb=−Int logp.' Its only bound-related instruction is 'Close the maximal-order
bound/rank compatibility with Mihatsch Corollary9.9 and the q-bound use in local constancy.' Route 9 brief (review
corrections): 'for the AFL at p = n (Theorem 15.1(a)) the printed argument leaves a gap'; 'Theorem 5.5 (local constancy)
is proved as printed only for q ≥ n'; '(8.11) needs 4π, not 2π'; 'Propositions 2.7(ii) and 4.12(ii) are applied in §13
...'. The paper (p. 968): 'Assume now that Conjecture 3.8 part (b) holds for V_{n−1}. Then by Proposition 4.12 part (i),
Conjecture 3.8 part (a) holds for S_n.' The paper (p. 969): 'S contains all places dividing d and all primes less than
n'. Corollary 14.8 (p. 967): 'assume that Conjecture 3.8 part (a) holds for all p-adic field Q_p with p ∉ S and for
S_n'. Item 33 as corrected: 'If q ≥ n+1, Conjecture 3.8(b) for V_{n−1} implies Conjecture 3.8(a) for V_n.' Also: E36
correction (review verdict: confirmed): 'So Theorem 13.9(a) at q = n and Theorem 15.1(a) at p = n lack a complete proof.
Parts (b), and all cases with q ≥ n+1, are unaffected.' Route 9 brief: 'Corrections from the review ... for the AFL at p
= n (Theorem 15.1(a)) the printed argument leaves a gap.' The route 11 brief contains no such correction. Paper, p. 895,
proof of Proposition 4.12(i): 'Since q + 1 > n, there exists ξ ∈ F^1 such that det(1 − ξg′) ∈ O_F^× ... From the third
equality in (4.5) and the integrality of det(1 − g), it follows that 1 − d ∈ O_F^×.' I checked the obstruction in E36's
example. F = Q_3(i), g′ = diag(1, −1, i) in an orthogonal basis of norms (1, 1, −1), u0 = v1 + v2 + v3, d = ⟨g′u0, u0⟩ =
−i. Then det(1 − ξg′) = (1 − ξ)(1 + ξ)(1 − iξ) is a unit only for ξ ≡ i mod 3, and there ξd = 1, so 1 − ξd ≡ 0. Paper,
p. 968, Theorem 15.1: 'Conjecture 3.8 holds when F0 = Qp and p ≥ n', proved via 'by Proposition 4.12 part (i),
Conjecture 3.8 part (a) holds for Sn'. Also: Route 11 brief: 'Endpoint: unramified F/Qp, p odd,p≥n, strongly regular
group Sn and literal indexed semi-Lie dimension n−1 satisfy ∂Orb=−Int logp. … Close the maximal-order bound/rank
compatibility with Mihatsch Corollary9.9 and the q-bound use in local constancy.' Route 9 brief, review corrections: '…
for the AFL at p = n (Theorem 15.1(a)) the printed argument leaves a gap'; 'Theorem 5.5 (local constancy) is proved as
printed only for q ≥ n'. E36's correction: 'So Theorem 13.9(a) at q = n and Theorem 15.1(a) at p = n lack a complete
proof.' Route 11's item list contains PAPER-ZHANG-21/21, /33, /34, /39 and /125. Also: Route 11 brief: '... Prove
Theorems8.1/8.6 from their full modularity sources ... Construct the normalized pairing divided by τ(ZQ)[E:F], prove
good-place support and Theorem9.4's exact2logq factor, then the archimedean comparison with every
Gaussian/Whittaker/Green rescaling written out. ... Source corrections and the analytic descent/normalization gates are
mandatory before final acceptance.' Route 9 brief: 'Corrections from the review ...: ... (8.11) needs 4π, not 2π.'
sourceIssues E38, E39, E40, E44 and E45, all confirmed by the review. Also: Route 11 brief: 'Endpoint: unramified F/Qp,
p odd,p≥n, strongly regular group Sn and literal indexed semi-Lie dimension n−1 satisfy ∂Orb=−Int logp.' Route 9 brief:
'for the AFL at p = n (Theorem 15.1(a)) the printed argument leaves a gap'. Item 21's note: 'At p = n, part (a) comes
from Proposition 4.12(i) at q = n, and the printed argument for (b)_{n−1} ⇒ (a)_n has a gap there'. The paper (p. 968):
'Then by Proposition 4.12 part (i), Conjecture 3.8 part (a) holds for Sn'.

**Fix.** Move the bullets for E36 (Proposition 4.12(i)), E38, E51 (Proposition 4.12(ii)) and E44 ((8.11)) from route 9's
brief into route 11's brief. In route 9's brief, keep only the corrections for its own items: Proposition 2.7(i) and
(ii), Lemmas 4.3, 4.9 and 4.10, the §12 Gaussians, the §11.4/§12.5 signs and Lemma 12.6. Restate route 11's endpoint as
follows: 'Theorem 15.1 as printed (p ≥ n). The paper's argument proves part (a) for p ≥ n+1. It proves part (b) for
V_{n−1} at p ≥ n, provided S contains every prime ≤ m in the step for V_m. Part (a) at p = n has no complete proof in
the paper (E36). Plan it as an open gap, or cite an independent proof; do not plan it through Proposition 4.12(i) at q =
n.' Update route 11's paragraph in the report (PAPER-ZHANG-21.md). Also: Append to the route 11 brief: 'Proposition
4.12(i): the direction (b) for V_{n−1} ⇒ (a) for V_n is proved as printed only for q ≥ n+1 (E36). Keep Theorem 15.1 as
the paper states it, but record that part (a) at p = n rests on this gapped step. Either close it separately or state
the proved group endpoint for p ≥ n+1. Part (b) holds for p ≥ n. Theorem 5.5 is proved as printed only for q ≥ n (E38);
cite Mihatsch, Algebra Number Theory 16 (2022), in general.' In the route 9 brief, keep only the bullets about route 9
items. Also: Add a list 'Corrections to respect' to route 11's brief and to its paragraph in the report, with four
entries. (1) Proposition 4.12(i) is proved in the direction (b) for V_{n−1} ⇒ (a) for V_n only for q ≥ n+1 (E36). So
this paper proves the group endpoint for p ≥ n+1 and the semi-Lie endpoint for p ≥ n; plan the group version at p = n as
not proved here. (2) State Proposition 4.12(ii) without the q-bound (E51). (3) In Theorem 15.1, enlarge S by the places
v ≠ v0 with p_v ∈ {n, n+1}, instead of adding them to B (E28, corrected). (4) Theorem 5.5 holds for every odd p, using
the repair recorded under E38 and Lemma 4.3(iii) with det(1−g) ≠ 0 (E33). Replace 'the q-bound use in local constancy'
accordingly. In route 9's brief, keep only the corrections for items route 9 owns (for example items 12, 27, 31 and the
§12 items). Qualify the report's 'Result and scope' sentence 'Theorem15.1 proves the AFL over Qp, p odd and p≥n' in the
same way as (1). Also: Append to the route 11 brief a list 'Corrections from the review, to respect when stating the
layers': E40 (CM(α,g) is proper with finite étale generic fibre; it is neither finite over O_E[1/d] nor étale off Ram(α)
where F′/F ramifies); E39 (a complex place counts the Green value once, ½ per embedding); E44 (G^K = −Ei(4πa_{v0}R), so
Corollary 10.3 reads −ΣEi(−4πa_{v0}|ξ′|_{v′0})·Orb); E45 (G^B(ξ,φ) := 0 for ξ ∉ F_{0,+}); E38 (Theorem 5.5's printed
proof needs q ≥ n; Mihatsch in general); and Theorem 8.6 only for n ≥ 3 from BHKRY, with the n = 2 step of Theorem 15.1
supplied otherwise. Also: In the route 11 brief, replace the endpoint sentence with the following. 'Endpoint: unramified
F/Qp, p odd: the strongly regular semi-Lie AFL in dimension n−1 for p ≥ n, and the strongly regular group AFL for S_n
for p ≥ n+1. At p = n the group version rests on Proposition 4.12(i) at q = n, whose printed proof has a gap (E36); plan
an independent argument or state the endpoint without that case.' Add the same restriction to item 125's statement.

### /3 — error

**Where.** PAPER-ZHANG-21/116 (route 9); routes 9 and 11; the report (PAPER-ZHANG-21.md), 'Acyclic ownership boundary'

**Claim.** As routed, routes 9 and 11 import each other. Item 116 is routed to the Jacquet–Rallis Part II (route 9) but
ends with an AFL clause: '(resp. its intersection number) equal those of the local data'. That clause needs the
intersection number Int(g,u) on the Rapoport–Zink space (items 18–19) and its local constancy, Theorem 5.5 (items
39–40). All of these are routed to UnitaryKudlaRapoportCycles (route 11). Route 11 in turn imports the analytic
matching, the RTF and the FL from the Jacquet–Rallis Part II. In the queue these are
EndoscopicTransferAndUnitaryTraceComparisonPartII and GrossZagierAndArithmeticHeightsPartII, so the two roadmaps would
form a dependency cycle. The clause also contradicts route 9's brief ('This analytic owner has no dependence on RZ
spaces or the AFL'). It contradicts the report too ('The analytic FL proof never imports the AFL').

**Evidence.** Item 116 statement: '... (6) A vector u ∈ V such that (g,u) ... is v0-adically as close to (g_{v0},u_{v0})
as desired. In particular the v0-adic orbital integrals of (g,u) and of its match (resp. its intersection number) equal
those of the local data.' The paper (p. 969), proof of Theorem 15.1: 'By the local constancy of the orbital integral,
and of the intersection numbers by Theorem 5.5, near a strongly regular semisimple (g, u), we conclude that Conjecture
3.8 part (b) holds when (g_{v0}, u_{v0}) ∈ (U(V_n)×V_n)_srs.' Route 11 brief: 'Import ... analytic matching,
Weil-compatible RTF and FL from JacquetRallisRelativeTraceComparison'. Items 18, 19, 39 and 40 are in route 11.

**Fix.** Split item 116. Keep in route 9 the global data (1)–(6) and the equality of the v0-adic orbital integrals. Make
the clause 'Int_{v0}(g,u) = Int(g_{v0},u_{v0}) for (g,u) close enough (Theorem 5.5)' a new missing item, routed to route
11, or add it to item 125. The acyclicity statements in route 9's brief and in the report then become true.

### /4 — error

**Where.** sourceIssues E28; sourceIssues E36; PAPER-ZHANG-21/125; summary; PAPER-ZHANG-21/21; PAPER-ZHANG-21/122; the
gates entry G5 and the report (PAPER-ZHANG-21.md), 'This continuation' (E28 paragraph) and 'Gaps' G5; route 11 brief

**Claim.** E28's recorded repair is unsound for places with p_v = n, given E36. E28 repairs the proof of Theorem 15.1 by
moving the inert places v ∉ S with p_v ∈ {n, n+1} into B, so that case (ii) of the proof of Theorem 14.6 handles them.
Case (ii) at v needs the hypothesis of Theorem 14.6, namely Conjecture 3.8(a) for S_n over Q_{p_v}. In the induction
step of Theorem 15.1 that proves Conjecture 3.8(b) for V_n, the only source of this hypothesis is Proposition 4.12(i) in
the direction (b) for V_{n−1} ⇒ (a) for V_n, at q = p_v. At p_v = n this is exactly the direction that E36 shows the
paper does not prove. Without the repair, the third condition on S makes B ⊆ {v0}, so the hypothesis is needed only at
v0. The repaired proof of Theorem 15.1(b) therefore still has a gap whenever n is an odd prime with n ∉ S. Example:
Theorem 15.1 at p = 7 needs (b) for V_5 at v0 = 7. There S ⊇ {2, 3}, and an inert place above 5 where R_α is maximal is
moved into B, which requires (a) for S_5 over Q_5, i.e. Proposition 4.12(i) at q = n = 5. So E36's sentence 'Parts (b),
and all cases with q ≥ n+1, are unaffected', which the summary repeats, holds only with a different repair. Also: The
recorded repairs E28 and E36 do not fit together inside the proof of Theorem 15.1, and the extraction's claims that
Theorem 15.1(b) is unaffected and that 'Theorem 15.1 stands for p ≥ n' are not justified as recorded. In the induction
step (pairs in U(V_n)×V_n), Corollary 14.8 needs the hypothesis of Theorem 14.6, Conjecture 3.8(a) for S_n at every
prime p ∉ S. The proof supplies it only through Proposition 4.12(i), which E36 says is proved only for q ≥ n+1. S need
only contain the primes below n, so an inert place with p_v = n (other than v0) lies outside S. E28's repair moves
exactly the inert places with p_v ∈ {n, n+1} into B, and case (ii) of Theorem 14.6 then invokes Conjecture 3.8(a) for
S_n at p_v = n: the case E36 leaves unproved. E28 nevertheless says the hypothesis 'holds there'. Separately, §14.3
asserts the FL at every v ∉ S 'by Theorem 13.9'. The FL needed there is for S_n × V′_n (Hermitian dimension n), i.e.
Conjecture 2.3 with n+1 in place of n, which Theorem 13.9 states only for q ≥ n+1, while S only excludes residue
cardinality < n. Inside Theorem 15.1 this is rescued at places where R_α is maximal by Proposition 2.6, but Theorem 14.6
as extracted in item 122 inherits it. So the G5 resolution 'The q ≥ n hypotheses of Propositions 2.7 and 4.12 and
Theorem 13.9 hold where they are applied' is also wrong for Theorem 13.9. The repair is one line. S may be enlarged
freely away from v0. Theorem 15.1 for index N needs the step only in dimension N−1 at p_{v0} ≥ N, so S can contain every
place of residue cardinality ≤ dim V other than v0.

**Evidence.** The paper (p. 969), choice of S in Theorem 15.1: 'S contains all places dividing d and all primes less
than n; for every non-archimedean v ∉ S ∪ {v0}, the ring R_α is locally maximal at v.' (p. 968): 'Assume now that
Conjecture 3.8 part (b) holds for V_{n−1}. Then by Proposition 4.12 part (i), Conjecture 3.8 part (a) holds for S_n.'
(p. 966), Theorem 14.6: 'Assume that Conjecture 3.8 part (a) holds for all p-adic field Q_p with p ∉ S and for S_n.' (p.
967), case (ii): 'By Proposition 4.12, our assumption on Conjecture 3.8 part (a) (for all p-adic field Q_p with p ∉ S
and for S_n) implies that for (γ,u′) matching (δ,u), −∂Orb((γ,u′),1) = Int_v(δ,u)·log q_v'. E28's correction: 'Case (ii)
needs only Proposition 4.12, which requires q_v ≥ n and the hypothesis of Theorem 14.6 for S_n; both hold there.' E36's
correction: 'As printed, Proposition 4.12(i) (and 2.7(i)) at q = n proves only (a)_n ⇒ (b)_{n−1}.' Also: The paper (p.
965, §14.3): 'S contains all places v | 𝔡 and all places with residue cardinality < dim V … Now we have the FL for all
places v ∉ S by Theorem 13.9'. P. 959: 'Theorem 13.9. Conjecture 2.3 holds for F0 with q ≥ n', where Conjecture 2.3(b)
(p. 878) concerns S_{n−1} × V′_{n−1}. P. 966, Theorem 14.6: 'Assume that Conjecture 3.8 part (a) holds for all p-adic
field Qp with p ∉ S and for Sn'. P. 967, case (ii): 'By Proposition 4.12, our assumption on Conjecture 3.8 part (a) …
implies'. P. 968: 'Then by Proposition 4.12 part (i), Conjecture 3.8 part (a) holds for Sn'. P. 969: 'S contains all
places dividing 𝔡 and all primes less than n'. P. 960, enlarging S is allowed: 'By enlarging S suitably (while keeping
v0 ∉ S)'. The extraction, E36: '(b) for V_{n−1} ⇒ (a) for V_n … proved only for q ≥ n+1 … Parts (b), and all cases with
q ≥ n+1, are unaffected'. E28: 'add them to B. Case (ii) needs only Proposition 4.12 … and the hypothesis of Theorem
14.6 for S_n; both hold there … so Theorem 15.1 stands for p ≥ n'.

**Fix.** Replace E28's correction and the review's amendedCorrection with the following. 'Theorem 15.1 needs Conjecture
3.8(b) for V_m only at p ≥ m+1, so run the induction claiming (b) for V_n only at v0 with p_{v0} ≥ n+1. In that step,
enlarge S by every inert place v ≠ v0 with p_v ∈ {n, n+1}. This is allowed: the three conditions on S (p. 969) survive
enlargement, and v0 ∉ S. Case (i) is then used only where p_v > n+1, as Proposition 3.9 requires. Case (ii) is used only
at v0, where q = p_{v0} ≥ n+1, so Proposition 4.12(i), as restricted by E36, supplies Conjecture 3.8(a) for S_n. If
p_{v0} = n+1 and R_α is maximal at v0, treat v0 by case (ii).' Delete 'both hold there' from E28's reason. In E36's
correction and in the summary, qualify 'Parts (b), and all cases with q ≥ n+1, are unaffected' with 'provided S is
enlarged as in E28'. Update item 125's note to the same effect. Alternatively, if [31, Cor. 9.9] is checked to hold at
p_v ∈ {n, n+1}, case (i) applies there directly; record this as the other option. Also: (1) In E28's correction, put the
inert places with p_v = n (other than v0) into S, not B, and add only the places with p_v = n+1 to B. At those places
Proposition 4.12(i) at q = n+1 supplies the hypothesis of Theorem 14.6. Replace 'both hold there' by this. (2) Append to
E36's correction the following. 'The claim that (b) and all q ≥ n+1 cases are unaffected requires S, in the proofs of
Theorems 13.9 and 15.1 and in §14.3, to contain every place of residue cardinality ≤ dim V other than v0. This is
allowed (p. 960), because Theorems 13.4 and 14.6 assume Conjecture 2.3(a) or 3.8(a) for S_n at every place outside S.
The induction uses the step in dimension m only at q_{v0} ≥ m+1.' (3) In items 122, 124 and 125, state S as containing
all places of residue cardinality ≤ dim V (or invoke Beuzart-Plessis's FL for the FL at q_v = dim V). In items 21 and
125, condition the 'unaffected' notes on this choice. (4) In the gates entry G5 and the report's G5 paragraph, delete
'and Theorem 13.9' from 'hold where they are applied'. Record that §14.3 uses Theorem 13.9 in Hermitian dimension n,
i.e. with q ≥ n+1. (5) Add the choice of S to the route 11 brief.

### /5 — error

**Where.** PAPER-ZHANG-21/152

**Claim.** The identity 'det(γ′^i e)_{0≤i≤n−1} = det(a^i b)_{0≤i≤n−2}' is false for even n. Expanding along the first
column e gives det(γ′^i e)_{0≤i≤n−1} = (−1)^{n+1} det(a^i b)_{0≤i≤n−2}. The item's conclusion ω(γ′) = ω(r(γ′)) still
holds, because η̃(−1) = 1 for η̃ = (−1)^v. The review checked the identity only for n = 5. Severity set to high by the
coordinator: item 152 states the identity, and it is false for even n. The coordinator checked the expansion: the vector
e is the last standard basis vector, so expanding det(γ′^i e) along its first column gives the cofactor sign (−1)^{n+1}
times det(a^i b). A false item statement is high, as for items 22c, 22d and 16a in RT-PAPER-FINTZEN-21, even when the
conclusion ω(γ′) = ω(r(γ′)) survives because η̃(−1) = 1.

**Evidence.** (2.16), p. 877: 'ω(γ) := η̃(det(γ)^{−⌊n/2⌋} det(γ^i e)_{0≤i≤n−1})'. Numerical check with random γ′ = c(y′)
∈ S_n in the C/R model, for n = 2, …, 6: the ratio det(γ′^i e)/det(a^i b) is −1, 1, −1, 1, −1. The item's second
identity, det(γ^i u1) = (2/((1−d)√ε))^{n−1} det(1−γ)^{−1} det(a^i b), holds with ratio 1 in every case.

**Fix.** In item 152, replace the first identity with 'det(γ′^i e)_{0≤i≤n−1} = (−1)^{n+1} det(a^i b)_{0≤i≤n−2}', and add
'η̃(−1) = 1' to the deduction of ω(γ′) = ω(r(γ′)).

### /6 — error

**Where.** PAPER-ZHANG-21/55; sourceIssues E40 (its correction)

**Claim.** Item 55's corrected statement says 'CM(α,g) → Spec O_E[1/d] is proper, hence finite by (a)', and the
correction of E40 says 'Keep "proper, hence finite by (a), with generic fibre finite étale over E"'. This is false.
Proposition 7.9(a) says that CM(α,g) → M is finite, and M has relative dimension n−1 over O_E[1/d], so properness over
the base together with finiteness over M does not give finiteness over the base. The paper itself says that the special
fibres of the fat CM cycle can have positive-dimensional components, and its derived-cycle and §9.1 machinery (a class
in F_1 K′_0, proper 1-cycles modulo vertical rational equivalence) exists because of this. For instance, at an inert v0
∤ d, an element δ ∈ G′(α)(F0) that is ≡ 1 modulo ϖ on a vertex lattice Λ of type t ≥ 3 fixes the whole Bruhat–Tits
stratum N_Λ (of dimension (t−1)/2 ≥ 1), so by Proposition 7.17 the special fibre of the corresponding CM(α,g) at v0 (a
place of Ram(α)) contains a curve. Only the generic fibre is finite (étale) over E; the paper claims finiteness over the
base only away from Ram(α).

**Evidence.** The paper, p. 911, Remark 7.7: 'As a result, it could have very complicated structure in positive
characteristic (e.g., with large dimensional components). A complete understanding of the geometric structure of CM(α)
seems a hard question (e.g., to determine all of its irreducible components in its special fibers)'. p. 911, Proposition
7.9(b): 'The morphism CM(α, g) → Spec O_E[1/d] is proper. Its restriction to the open sub-scheme Spec O_E[1/d] \ Ram(α)
is finite étale.' p. 925: 'Since CM(α, g)→B is proper and the generic fiber of CM(α, g) is zero dimensional (cf.,
Proposition 7.9(b)), there is a natural homomorphism Ch_{1,CM(α,g)}(M) → Z_{1,c}(M)', with Z_{1,c} the quotient by
'1-cycles that are supported on proper subschemes Y of the special fibers and are rationally equivalent to zero on Y'
((9.4)). The extraction's own item 53 unit test: 'Do not identify the naive fat cycle with a finite-flat curve at
bad-order primes.'

**Fix.** In item 55 replace 'is proper, hence finite by (a)' with 'is proper; it is not finite in general: above places
of Ram(α) its special fibres can have positive-dimensional components (Remark 7.7)'. Keep 'its generic fibre is finite
étale over E', and keep the paper's finiteness over the complement of the places above Ram(α) only as the paper's claim
(with étaleness corrected as in E40). Make the same change in the correction text of E40 ('Keep "proper, with generic
fibre finite étale over E"').

### /7 — error

**Where.** PAPER-ZHANG-21/160

**Claim.** Item 160 says that 'for ξ ∈ F0 and φ ∈ S(V(A_{0,f}))^{K_G}, the sum (8.13) is locally finite on D_{v0} ×
G(A_{0,f})/K_G'. For n ≥ 2 this is false. Every term φ(g^{-1}u)·G^K(u,h∞) with φ(g^{-1}u) ≠ 0 is strictly positive at
every point off D_{v0,u}, because −Ei(−r) = ∫_r^∞ e^{−t}t^{−1}dt > 0. For a fixed g, the vectors u ∈ V′_ξ(F0) with
φ(g^{-1}u) ≠ 0 are the lattice vectors of norm ξ. Since V′ is indefinite at v0, there are infinitely many of them: the
arithmetic subgroup of U(V′), which is non-compact at v0, has infinite orbits on them. So at every point infinitely many
terms are non-zero. What is locally finite is the family of divisors D_{v0,u} × 1_{gK_G}. The function series converges
absolutely and locally uniformly away from those divisors, because −Ei(−r) ≤ e^{−r}/r and R(u,z) grows with u. That
convergence is the analytic input that the Green-function claim needs, and the item replaces it with a false finiteness
statement.

**Evidence.** The paper, p. 921, (8.10): 'Ei(−r) = −∫_r^∞ e^{−t}/t dt, r > 0'. p. 922: '(8.13) ... where the sum is over
(u, g) ∈ V′_ξ(F0) × G(A0,f)/K_G. This defines a Green function for the divisor Z(ξ, φ); cf. [28, Prop. 4.9]' (the paper
makes no finiteness claim). Ehlen–Sankaran (the paper's [8], arXiv 1607.06545), §3: the cycle Z(m,φ) 'is locally finite,
in the sense that only finitely many Z(x)'s appearing in the sum will intersect a given compact subset', whereas Kudla's
Green function (their Definition 3.1) is the infinite sum Σ_{x∈L′, Q(x)=m} φ(x) β(2πwR_o(x,z)) with β(r) = ∫_r^∞
e^{−t}dt/t.

**Fix.** Replace the sentence with: 'The divisors D_{v0,u} × 1_{gK_G} with φ(g^{-1}u) ≠ 0 form a locally finite family.
The series (8.13) converges absolutely and locally uniformly on compact subsets of the complement of their union (Kudla
[23, §11]; Liu [28, §4B]), and its sum descends to the fibre (8.5): as a Green function for Z(ξ,φ)⊗_{E,ν}C when ξ ∈
F_{0,+}, and as a smooth function otherwise ([28, Prop. 4.9]).' Record the convergence as a proof obligation of the
item.

### /8 — error

**Where.** PAPER-ZHANG-21/75; PAPER-ZHANG-21/79; route 11 brief; prerequisites (the Bruinier–Howard–Kudla–Rapoport–Yang
entry); sourceIssues (a new sourceIssue)

**Claim.** Theorem 8.6 (item 75), and Remark 9.1 (item 79) which rests on it, are stated for every n and every imaginary
quadratic F, and are said to be deduced from [5] (BHKRY, Theorem B). [5] assumes n ≥ 3, an imaginary quadratic field of
odd discriminant, and self-dual lattices. Its §1.5 calls n = 2 'a delicate question', says that the compact case is
outside its methods, and restricts to n ≥ 3 from §5 on. The paper needs n = 2. Theorem 15.1 is proved by induction from
the base case n = 1, and its step for n = 2 runs Theorem 14.6 and Corollary 14.8 on the Shimura curve of a 2-dimensional
V, where Theorem 8.6 is invoked. For n = 2 that V may be anisotropic, which is the compact case. So the printed proof of
Theorem 15.1 at n = 2 uses a modularity theorem outside the range of its cited source. The extraction records this
neither in items 75 or 79, nor in the route 11 brief, nor in a sourceIssue. The odd-discriminant hypothesis of [5] is
not stated either.

**Evidence.** The paper, p. 924: 'Theorem 8.6 (Bruinier–Kudla–Howard–Rapoport–Yang). Let F0 = Q. The generating series
Ẑ_B(·, φ) lies in A_hol(Γ(N), n)_Q ⊗_Q Ĉh^1(M)_Q ... Proof. In [5] the authors proved a stronger version (i.e., Theorem
B in loc. cit.) in a maximal level case'. p. 965: 'By Theorem 8.6 (cf. (9.7)), Int(·, Φ) (defined by (9.5)) also belongs
to A_hol(Γ(N), n)_Q ⊗_Q R_{S,Q}'. p. 968: 'We prove Conjecture 3.8 part (b) by induction on n = dim V_n. The case n = 1
is known [46].', followed by 'Now we define the Shimura variety and its integral model M as in Definition 6.1 for the
nearby hermitian space V of V(v0) at v0 (that is, non-split at v0, with signature (n − 1, 1) at v | ∞ ...)'. [5] = arXiv
1702.07812 (final version), §1.1, p. 2: 'Fix a quadratic imaginary field k ⊂ C of odd discriminant ... W0 and W of
signature (1, 0) and (n−1, 1), respectively, where n ≥ 3. We assume that W0 and W each admit an O_k-lattice that is
self-dual'. §1.5, pp. 11–12: 'Throughout the introduction we have assumed that n ≥ 3, but one could ask if similar
results hold for n = 2. This seems to be a delicate question. ... The compact case falls well outside the reach of our
arguments ... from §5 onwards we restrict to n ≥ 3'. Ehlen–Sankaran (the paper's [8]), Remark 4.17(i): BHKRY 'establish
the modularity of Θ̂^B_V(τ) when n > 2'.

**Fix.** In items 75 and 79 add: 'as deduced from [5], valid for n ≥ 3 ([5] also assumes F of odd discriminant and
self-dual lattices; the passage to the localized, non-maximal-level model over O_E[1/d] is the paper's own claim)'. Add
a new sourceIssue (kind gap, affects the proof): Theorem 8.6 is attributed to [5] beyond its range, and the n = 2 step
of the proof of Theorem 15.1 uses it. For the repair, record that the n = 2 case must come from elsewhere. One option is
the AFL for n = 2 and 3 proved in [46] (the paper, p. 868), with Proposition 4.12(i), subject to the hypotheses of [46]
on p and to E36. Another is an arithmetic modularity theorem for U(1,1) Shimura curves from another source. In the
globalisation of Theorem 15.1, choose F of odd discriminant, which is possible because only its completion at v0 is
prescribed, or justify dropping that hypothesis away from d. Add the restriction and the repair to the route 11 brief
and to the 'why' of the BHKRY prerequisite.

### /9 — error

**Where.** PAPER-ZHANG-21/131; a new sourceIssue

**Claim.** Appendix B.1 asserts, for any regular noetherian formal scheme X of pure dimension d, that F^{d−i}K_0^Y(X) ≅
F_iK′_0(Y). Item 131 extracts this as a general statement. It is false without a dimension formula codim_X Z + dim Z =
d. Take X = Spec Z_p[x], a noetherian (formal) scheme that is regular of pure dimension 2, and Y = V(px−1) ≅ Spec Q_p, a
closed point of height 1. Then K_0^Y(X) ≅ K′_0(Y) = Z and F^1K_0^Y(X) = Z, but F^2K_0^Y(X) = 0, while F_0K′_0(Y) = Z, so
the case i = 0 fails. The paper's uses satisfy the missing hypothesis. Proposition 5.2 uses N_n, a formal scheme over
Spf O_F̆ whose points all lie over the closed point. (7.15) uses schemes of finite type over O_E[1/𝔡]. So the mistake
affects nothing in the paper, but route 10 is asked to build the statement in general. Severity set to high by the
coordinator: item 131 states the comparison in general, and it is false in general. The coordinator checked the example:
Z_p[x]/(px−1) ≅ Q_p is a field, so Y is a closed point of X = Spec Z_p[x] of codimension 1 and dimension 0 in a regular
scheme of pure dimension 2, and F^2K_0^Y(X) = 0 ≠ F_0K′_0(Y). A false item statement is high even where the paper's own
uses satisfy the missing hypothesis.

**Evidence.** The paper (p. 972): 'From now on we assume that X is regular of pure dimension d. Then we have natural
isomorphisms K^Y_0(X) ≅ K′_0(Y) and F^{d−i}K^Y_0(X) ≅ F_iK′_0(Y).' (B.1): 'F^iK^Y_0(X) = ∪_{Z⊂Y, codim_X Z ≥ i}
Im(K^Z_0(X) → K^Y_0(X))'. The ascending filtration is 'F_iK′_0(X) = ∪_{Z⊂X, dim Z ≤ i} Im(K′_0(Z) → K′_0(X))'. In the
example, Z_p[x]/(px−1) = Q_p is a field, (px−1) has height 1, and Y has no closed subset of codimension 2. Item 131:
'For regular pure-dimensional finite-dimensional X … K0^Y(X)≅G0(Y) and F^(d−i) corresponds to Fi.'

**Fix.** Record a new sourceIssue (error; affects nothing) at Appendix B.1, p. 972. Correction: 'the second isomorphism
needs codim_X Z + dim Z = d for every irreducible closed Z ⊂ Y. This holds for the formal schemes over Spf O_F̆ of §§3–5
(dimensions of local rings) and for schemes of finite type over O_E[1/𝔡]. Otherwise only K_0^Y(X) ≅ K′_0(Y) is claimed.'
Add the hypothesis to item 131's statement and give the Spec Z_p[x] example as a unit test.

## All findings

| Finding | Severity | Kind | Where | Claim (abridged) |
|---|---|---|---|---|
| /1 | high | error | route 5; … | Route 5 is a source route that sends items 73 and 76 into ArakelovGeometryAndAbelianHeights:R35.1, but R35.1 does not plan them. Item 73 is the arithmetic Chow … |
| /2 | high | error | route 11 brief; … | Route 11 states the AFL endpoint at p ≥ n without saying that the paper's proof has a gap at p = n. The review's corrections for the AFL items were put in the … |
| /3 | high | error | PAPER-ZHANG-21/116 (route 9); … | As routed, routes 9 and 11 import each other. Item 116 is routed to the Jacquet–Rallis Part II (route 9) but ends with an AFL clause: '(resp. its intersection … |
| /4 | high | error | sourceIssues E28; … | E28's recorded repair is unsound for places with p_v = n, given E36. E28 repairs the proof of Theorem 15.1 by moving the inert places v ∉ S with p_v ∈ {n, n+1} … |
| /5 | high | error | PAPER-ZHANG-21/152 | The identity 'det(γ′^i e)_{0≤i≤n−1} = det(a^i b)_{0≤i≤n−2}' is false for even n. Expanding along the first column e gives det(γ′^i e)_{0≤i≤n−1} = (−1)^{n+1} … |
| /6 | high | error | PAPER-ZHANG-21/55; … | Item 55's corrected statement says 'CM(α,g) → Spec O_E[1/d] is proper, hence finite by (a)', and the correction of E40 says 'Keep "proper, hence finite by (a), … |
| /7 | high | error | PAPER-ZHANG-21/160 | Item 160 says that 'for ξ ∈ F0 and φ ∈ S(V(A_{0,f}))^{K_G}, the sum (8.13) is locally finite on D_{v0} × G(A_{0,f})/K_G'. For n ≥ 2 this is false. Every term … |
| /8 | high | error | PAPER-ZHANG-21/75; … | Theorem 8.6 (item 75), and Remark 9.1 (item 79) which rests on it, are stated for every n and every imaginary quadratic F, and are said to be deduced from [5] … |
| /9 | high | error | PAPER-ZHANG-21/131; … | Appendix B.1 asserts, for any regular noetherian formal scheme X of pure dimension d, that F^{d−i}K_0^Y(X) ≅ F_iK′_0(Y). Item 131 extracts this as a general … |
| /10 | medium | duplicate | route 10; … | The generic formal K-theory of Zhang's Appendix B has two owners in accepted routes. Its content is: - K_0^Y and K′_0 of locally noetherian formal schemes; - … |
| /11 | medium | error | PAPER-ZHANG-21/2; … | Item 2 is planned at AL.0, but AL.0 plans Schwartz–Bruhat spaces only on local additive groups. The item, following the paper, defines S(X(F)) for any smooth … |
| /12 | medium | error | PAPER-ZHANG-21/150 | Item 150 is planned at GeometryOfNumbersAndQuadraticArithmetic:GN.2 alone, but two of its clauses are not hermitian-lattice theory: - 'the stabiliser of [a … |
| /13 | medium | missing | PAPER-ZHANG-21/127; … | Item 127 is planned at MetaplecticAutomorphicForms:MP.2. Its formula γ_V = η(det V) ε(η, ½, ψ)^n rests on a result the paper cites, which no item records: [20, … |
| /14 | medium | error | route 3; … | Route 3 sends items 3, 113 and 171 into AutomorphicFormsOnReductiveGroups AF.0, AF.2 and AF.3, but none of these layers plans what the items state. - AF.0 … |
| /15 | medium | missing | PAPER-ZHANG-21/113 (route 3); … | Item 113 (Lemma 13.6) uses strong approximation for SL2, which is item 170, planned at AdelicAlgebraicGroups:AA.4. AA.4 is not an ancestor of any layer that … |
| /16 | medium | duplicate | PAPER-ZHANG-21/157 (route 8); … | Item 157, the nearby hermitian spaces V^{(v0)}, is routed as missing to the moduli Part II (route 8). But its existence and uniqueness are a direct application … |
| /17 | medium | duplicate | PAPER-ZHANG-21/43 (route 8) | Item 43, the auxiliary CM moduli M0 (Howard Prop. 3.1.2), is routed as missing to the moduli Part II (route 8). An accepted route of another paper puts the … |
| /18 | medium | missing | route 10 brief; … | The proof of Lemma B.2(i) (item 137) uses two standard commutative-algebra results that no item records: - the Koszul complex of a regular sequence is a free … |
| /19 | medium | missing | route 9 brief (review correction on Proposition 2.7(i)); … | Route 9's brief now says that the FL at q = n is 'covered by Beuzart-Plessis's independent proof', because E36 removes the paper's own proof of Theorem 13.9(a) … |
| /20 | medium | error | PAPER-ZHANG-21/13 (and, for the same reason, PAPER-ZHANG-21/34); … | Item 13 still states Proposition 2.7(ii) 'Under Proposition2.7's hypotheses', that is, with q ≥ n. The confirmed E51 and the route 9 brief both say that part … |
| /21 | medium | error | sourceIssues E38; … | E38 says that Theorem 5.5 is proved only for q ≥ n, and should be stated under q ≥ n or taken from Mihatsch [32]. Its reason claims that without det(1−g) ∈ … |
| /22 | medium | missing | PAPER-ZHANG-21/34; … | Two facts about intersection numbers are used in §4.4 and §5.2, and no item states either. (a) If g ∈ U(V_n)(F0) is regular semisimple for … |
| /23 | medium | missing | PAPER-ZHANG-21/39; … | The proof of Theorem 5.5 goes from Lemma 5.4, a submersion statement, to the claim that every g′♯ near g′ is conjugate, by an element h ∈ U(V_{n+1})(F0) near … |
| /24 | medium | missing | PAPER-ZHANG-21/23; … | The proof of Proposition 3.9 uses 'the fact that the assertion holds when n = 2', that is, Conjecture 3.8(b) for V_1. The same statement is the base case 'n = … |
| /25 | medium | error | PAPER-ZHANG-21/154; … | Item 154's first sentence reads 'Ch_1(V(Λ))_Q is spanned by the classes [V(Λ′)] of the Deligne–Lusztig curves V(Λ′) for vertex lattices Λ′ ⊃ Λ of type 3'. This … |
| /26 | medium | error | PAPER-ZHANG-21/83 (unitTests) | The review corrected item 83's statement to the Gillet–Soulé weight: a complex place contributes the Green-function value once, ½ per complex embedding (E39). … |
| /27 | medium | missing | PAPER-ZHANG-21/67; … | The proof of Theorem 8.1 uses two cited results that no item states. (i) The Chow-group modularity of generating series of special divisors on orthogonal … |
| /28 | medium | missing | PAPER-ZHANG-21/50; … | The derivation of the uniformization (7.4) by the relative RZ space N_{n,F_{w0}/F_{0,v0}}, from RSZ's uniformization (7.3) by the absolute PEL-type RZ space, … |
| /29 | medium | missing | prerequisites | The prerequisites omit the papers that §§8–9 build on for Green functions, Chow modularity and the arithmetic pairing, none of which the atlas covers. They … |
| /30 | medium | missing | PAPER-ZHANG-21/104, PAPER-ZHANG-21/105, PAPER-ZHANG-21/93, route 2 | Four standard results that the proofs in Section 11 and 12 cite are not items. (i) The proof of Theorem 12.9 applies the one-variable adelic Poisson summation … |
| /31 | medium | missing | PAPER-ZHANG-21/101, PAPER-ZHANG-21/102, route 9 brief | No item states the Iwasawa decomposition and integration formula that Section 12.4 and the proof of Lemma 12.6 use. In the paper's variant, G'(R) = GL_n(R) = … |
| /32 | medium | missing | PAPER-ZHANG-21/117 (and PAPER-ZHANG-21/9, PAPER-ZHANG-21/10, …; … | The 'zero' half of the FL is never proved, and the main chain uses it, but it is neither an item nor a sourceIssue. That half says the transferred orbital … |
| /33 | medium | missing | PAPER-ZHANG-21/121; … | The proof of Proposition 14.5 cancels the log/a/_v terms using a cited identity between nilpotent orbital integrals. The identity is taken from Jacquet [19, … |
| /34 | medium | missing | PAPER-ZHANG-21/126; … | Theorem A.1's Fourier-transform case rests entirely on two cited results, and neither is an item. They are [47, Th. 4.17] (non-archimedean, with the … |
| /35 | low | other | routes 8, 9, 10 and 11 (briefs and reasons); … | The routes and the report name the Part IIs by ids that the queue never creates: UnitaryRapoportZinkSpacesAndRSZModels, JacquetRallisRelativeTraceComparison, … |
| /36 | low | library-claim | PAPER-ZHANG-21/145 | Item 145 drops a hypothesis of the cited declaration. hasDerivAt_integral_of_dominated_loc_of_deriv_le also requires Integrable (F x₀) μ and … |
| /37 | low | library-claim | PAPER-ZHANG-21/171 | Item 171 is missing and its note cites no library input, but Tau Ceti at f790474 already has the substance of part (i). Part (i) says that SL2(k) is generated … |
| /38 | low | other | the report (PAPER-ZHANG-21.md): opening 'Items' bullet and the …; … | The report's counts predate the review: - the opening bullet says '148 items: 7 library, 10 planned and 131 missing'; the extraction now has 176 items, 7 … |
| /39 | low | error | PAPER-ZHANG-21/139; … | Item 139 is planned at SchemeKTheoryOperations:S.7. The paper needs the supported comparison Gr_1K′_{0,Y}(M)_Q ≅ Ch_{1,Y}(M)_Q ([11, Th. 8.2]) for M regular, … |
| /40 | low | other | sourceIssues (a new sourceIssue); … | An unrecorded misprint in the definition of orbit matching. The text introducing the group matching says 'We recall how the map (2.7) is defined' and then 'An … |
| /41 | low | other | sourceIssues (a new sourceIssue); … | An unrecorded misprint in the set-up of the FL. The text says 'the special vectors u_i ∈ V_i have norm one', but the special vector lies in V♯_i and is … |
| /42 | low | other | sourceIssues (a new sourceIssue); … | An unrecorded misprint in the definition of Fourier coefficients. (1.12) defines the ξ-th Fourier coefficient as 'W_φ(h)', dropping the index ξ, while (1.13) … |
| /43 | low | other | sourceIssues E3 | E3's locator is incomplete. The introduction prints the same wrong test function 1_{K0} for the FL identity, where 1_{K♯_0} is meant. |
| /44 | low | error | PAPER-ZHANG-21/3 | Item 3 says A_hol(Γ, k) and A_hol(H(A0), K, k) have 'Q-structures given by q-expansion at i∞'. The paper says Q̄-structure, after fixing an embedding Q̄ ↪ C. … |
| /45 | low | other | PAPER-ZHANG-21/2 | Item 2 fixes ψ = ψ_Q ∘ tr_{F0/Q} without saying which 'standard' ψ_Q is meant. The paper's own conventions force ψ_{Q,∞}(x) = e^{2πix}. With Tate's other … |
| /46 | low | other | PAPER-ZHANG-21/24; … | The statements of items 24 and 26 still call the variant chart 'r♭'. The paper's name is r♮, and items 27, 30, 31 and 152 use r♮. The review noted this in both … |
| /47 | low | error | PAPER-ZHANG-21/157 | Item 157 says 'In both cases the local invariants change at exactly two places'. In case (b), when v0 is the real place below the distinguished embedding ϕ0, … |
| /48 | low | error | PAPER-ZHANG-21/133 (note) | Item 133's note says that the scheme case of (B.3) 'is applied in (7.15) to Hk[K g K] over the moduli stack M, which is beyond [11]'s scheme setting'. That is … |
| /49 | low | missing | PAPER-ZHANG-21/48; … | The citations that the paper gives for Definition 7.1 and Proposition 7.3, and that the extraction copies, do not point to statements that give them. [30] is … |
| /50 | low | error | PAPER-ZHANG-21/85 | Item 85 does not state the hypotheses or the range of Theorem 10.1. It omits that ξ ∈ F0∖{0} is arbitrary and not only totally positive (Int^K_{v0} is defined … |
| /51 | low | error | PAPER-ZHANG-21/89, PAPER-ZHANG-21/90, route 4 | Item 89 has two defects, and item 90 shares the second. First, item 89 asserts a linear action of O(V)(A) x SL2(A) on S(V(A)) for even-dimensional V, but lists … |
| /52 | low | error | PAPER-ZHANG-21/108, PAPER-ZHANG-21/109, PAPER-ZHANG-21/101 (note); … | On p. 950 the paper fixes the archimedean partial Gaussian test function 'relative to a fixed compact neighborhood Omega_v in S_n(F_{0,v}) of gamma'. Section … |
| /53 | low | other | sourceIssues (new entries); … | sourceIssues does not record three misprints in this share. (a) In the proof of Lemma 11.1 (p. 935), the paper announces 'we prove a stronger result' and then … |
| /54 | low | missing | PAPER-ZHANG-21/109, PAPER-ZHANG-21/107 | The proof of Theorem 12.14 restricts the rank-one distribution over F0' from SL2(A_{F0'}) to SL2(A0) and applies Theorem 12.9 'to the new quadratic extension … |
| /55 | low | other | PAPER-ZHANG-21/87, PAPER-ZHANG-21/88; … | The locators of items 87 and 88 have no printed page, although the review says it added pages to locators. Corollary 10.3 begins on p. 931 and its sentence … |
| /56 | low | missing | PAPER-ZHANG-21/120 (and PAPER-ZHANG-21/87) | In the proof of Proposition 14.5 the paper applies Lemma 14.3, Theorem 10.1 and 'the proof of Lemma 14.4' also to non-zero null vectors: ξ = 0 with refined … |
| /57 | low | other | a new sourceIssue (proof of Theorem 13.9, p. 959) | The paper contains an unrecorded misprint in the globalization of Theorem 13.9. The characteristic polynomial of the Hermitian element x♮_{v0} = x_{v0}/√ε has … |

## Notes for the fix job

- **The AFL chain.** Put the inert places with p_v = n (other than v0) into S, not B, so that Theorem 14.6 never needs
  Proposition 4.12(i) at q = n; restate route 11's endpoint with the E36 gap at p = n, and move the review's AFL
  corrections from route 9's brief into route 11's.
- **Modularity at n = 2.** Theorem 8.6 follows from BHKRY only for n ≥ 3; start the induction from the AFL for n = 2, 3
  of [46], or supply n = 2 modularity elsewhere, and choose F of odd discriminant.
- **Owners.** Give items 73 and 76 a real owner (an Arakelov Part II), split item 116 so that route 9 has no AFL clause,
  and record route 10 as the single owner of Appendix B.
- **False statements.** Correct items 55, 131, 152 and 160 as the findings say, and record the new sourceIssues.
