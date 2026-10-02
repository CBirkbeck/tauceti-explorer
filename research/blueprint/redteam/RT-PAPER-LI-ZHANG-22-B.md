# RT-PAPER-LI-ZHANG-22-B

Red team of the accepted extraction PAPER-LI-ZHANG-22-B: Chao Li and Wei Zhang, *Kudla–Rapoport cycles and derivatives
of local densities*, J. Amer. Math. Soc. 35 (2022), 705–797 (arXiv 1908.01701v3). Issue #4262.

Red team: Claude Code, session `cc-c2c06b`, 2 October 2026. I did not write or review:
- the extraction (`cc-fb70e5`, PR #1928);
- its review (`cc-7b31c4`, PR #2438).

**Disclosures.** Some findings cite work of mine:
- my fix of PAPER-BURUNGALE-KOBAYASHI-OTA-21 (#5153), which added the sentence naming this paper as a consumer of the
  Lubin–Tate Part II;
- my red-team findings RT-PAPER-ZHANG-21/1 and /10 (#5405);
- as existing routings, extractions I red-teamed (ZHANG-21, LI-LIU-21, HE-LI-SHI-ETAL-23,
  ANDREATTA-GOREN-HOWARD-ETAL-18, CAI-FRIEDBERG-KAPLAN-24, FENG-YUN-ZHANG-24) or whose red team I verified
  (SHANKAR-SHANKAR-TANG-ETAL-22).

The findings that rely on them most directly (/1, /2, /8, /15, /17, /18) carry coordinator notes, and none rests on a
verdict of mine.

**Result: 42 findings, 7 high, 19 medium and 16 low.**

Four of the highs (/3, /4, /5, /7) are unrecorded errors in the paper that the extraction copies; none affects the main
theorems. /6 is a dependence on Conjecture 10.4.1 that the extraction drops from the global theorems; the conjecture is
now proved by Li–Rapoport–Zhang. /1 and /2 are duplications of accepted Part IIs.

## Method

**The source.** arXiv 1908.01701v3 (<https://arxiv.org/pdf/1908.01701v3>), 92 pages, re-downloaded on 2026-10-02 with
its LaTeX source. The PDF's SHA-256 (`7db1843f…9d49`) equals the extraction's. The JAMS version was not read.

**The passes.** Four parallel passes were run by this session.
- Three read all 92 pages against the text, the TeX and page images, with brute-force checks of local densities at q =
  3: §§1–5 (pp. 1–32), §§6–9 (pp. 33–62), and §§10–15 with the references (pp. 63–92).
- One checked the five routes, the 7 planned statuses, the 22 prerequisites, the briefs and the report against the
  atlas, the stage graph, the packets, other accepted extractions and the pinned libraries.

**Merging.** Twelve sets of findings reported by two or three passes were merged; the largest is item 58's (−q)^n
misprint, which all three section passes found.

**What I re-verified myself.** Every high finding, against the TeX:
- **/1, /2.** The accepted routes that already plan the material: PAPER-BURUNGALE-KOBAYASHI-OTA-21 route 2 (before my
  fix) and PAPER-ANDREATTA-GOREN-HOWARD-ETAL-18 route 8; PAPER-ZHANG-21 route 10, present from its first checkpoint.
- **/3.** At n = m = 1 the p.16 identity reads (1 + q^{−1})(1 − q^{−2}) = 1 + q^{−1}.
- **/4.** Y_d is smooth projective and X_i has codimension d − i, so for j < d − i the hyperplane class survives in
  H^{2j}(Y_d − X_i)(j).
- **/5.** The printed formulas are asymmetric in (a, b); the rank-2 density (1 − X)(1 + qX + X²) of ⟨ϖ⟩ ⊕ ⟨ϖ²⟩ is their
  value at (2, 0), not at (0, 2).
- **/6.** (13.5.0.2) lives on M_{K∩K♯}, uniformized by Ñ¹_n, so Theorem 13.6.1 needs the conditional comparison of p.72.
  The paper assumes Conjecture 10.4.1 from p.67 on; the extraction does not.
- **/7.** The (−q)^n of p.63 contradicts the next display and Remark 10.3.2, which use (−q)^{−n}.

The full list of what was checked is in the result's `checked` field.

## The high findings

### /1 — duplicate

**Where.** research/blueprint/papers/PAPER-LI-ZHANG-22-B.result.json items /30 (canonical lifting ℰ), /48, /59; route 1
brief (framing 𝔼 and its canonical lifting) and route 2 brief ('Construct: … quasi-canonical lifting cycles');
research/blueprint/papers/PAPER-LI-ZHANG-22-B.result.json items /59 and /48; route 2 brief ('Construct: … horizontal and
vertical parts, and quasi-canonical lifting cycles')

**Claim.** The canonical and quasi-canonical lifts of the height-2 formal O_{F_0}-module with CM by O_F (Gross 1986:
existence, End = O_{F_0} + ϖ^s O_F, field of definition the ring class field of degree q^{s−1}(q+1)) and the
lifting-depth computation behind Example 2.4.3 are planned by the accepted Part II
LubinTateFormalModulesAndQuasiCanonicalLifts (PAPER-BURUNGALE-KOBAYASHI-OTA-21 route 2,
PAPER-ANDREATTA-GOREN-HOWARD-ETAL-18 route 8), whose brief names UnitaryKudlaRapoportCycles and PAPER-LI-ZHANG-22-B as
consumers that must import them. This extraction instead routes items 30, 48 and 59 to its own Part IIs as missing, and
neither brief imports the Lubin–Tate Part II, so the design jobs would build Gross's theory a second time. Coordinator
note: FIX-RT-PAPER-BURUNGALE-KOBAYASHI-OTA-21 is this session's fix (PR #5153); it added the sentence of the Lubin–Tate
Part II brief that names PAPER-LI-ZHANG-22-B as a consumer. The duplication does not rest on that sentence: the Part II
and its quasi-canonical lifts were already routed by the original PAPER-BURUNGALE-KOBAYASHI-OTA-21 route 2, and
PAPER-ANDREATTA-GOREN-HOWARD-ETAL-18 route 8 (an extraction this session red-teamed, PR #5476) augments the same Part
II. RT-PAPER-BURUNGALE-KOBAYASHI-OTA-21/12, which raised the same point, is not this session's. Also: Gross's
quasi-canonical lifts are planned at the general level this paper needs in 'Finite flat group schemes and integral
p-adic Hodge theory, Part II: Lubin–Tate formal modules and quasi-canonical lifts'
(LubinTateFormalModulesAndQuasiCanonicalLifts). That roadmap covers height-2 formal O_{F_0}-modules with CM by O_F,
level-s lifts with End = O_{F_0} + ϖ^sO_F, and the ring class field of degree q^{s-1}(q+1) in the unramified case. Item
59 nevertheless plans the same objects inside UnitaryKudlaRapoportCycles: Z_s ≅ Spf O_{F̆,s} with degree q^s(1+q^{-1}),
citing [Gro86]. Item 48's input, that the canonical lift's special endomorphism of valuation val lifts exactly to
O_F̆/ϖ^{(val+1)/2}, is the unramified case of the lift-depth theorem PAPER-ANDREATTA-GOREN-HOWARD-ETAL-18/lift-depth
(Theorem 2.5.5) on the same route. Route 2's brief imports neither.

**Evidence.** PAPER-BURUNGALE-KOBAYASHI-OTA-21 route 2 brief (accepted): 'Construct lattice isogenies and marked
quasi-canonical lifts for a finite F_0/Q_p and F/F_0 quadratic, unramified or ramified: height-2 formal O_(F_0)-modules
with CM by O_F, quasi-canonical lifts with End = O_(F_0) + ϖ^s O_F over the ring class field extension of degree [O_F^×
: (O_(F_0) + ϖ^s O_F)^×] (Gross 1986 Proposition 5.3 …). … Consumers besides BKO: UnitaryKudlaRapoportCycles
(PAPER-LI-ZHANG-22-B, PAPER-HE-LI-SHI-ETAL-23, PAPER-LI-LIU-22) and GrossZagierAndArithmeticHeights GZ.7 …; they import
these lifts rather than building them.' PAPER-ANDREATTA-GOREN-HOWARD-ETAL-18 item lift-depth (same Part II): 'f lifts
(necessarily uniquely) to V_µ(G_k) iff ord_E(f) ≥ k', with ord_E of a generator 1 for E/F unramified — the computation
giving Int(L) = (val(L)+1)/2 on N_1 ≅ Spf O_F̆. Paper p.12 (Example 2.4.3): 'If rank L = 1, then by the theory of
canonical lifting ([Gro86]), we have Int(L) = (val(L)+1)/2'; p.19 (§4.1): Z_s the quasi-canonical lifting cycle [Gro86].
Also: PAPER-BURUNGALE-KOBAYASHI-OTA-21 route 2 brief, as fixed: 'quasi-canonical lifts with End = O_(F_0) + ϖ^s O_F over
the ring class field extension of degree [O_F^× : (O_(F_0) + ϖ^s O_F)^×] … Consumers besides BKO:
UnitaryKudlaRapoportCycles (PAPER-LI-ZHANG-22-B, PAPER-HE-LI-SHI-ETAL-23, PAPER-LI-LIU-22) … they import these lifts
rather than building them.'  RT-PAPER-BURUNGALE-KOBAYASHI-OTA-21/12 was confirmed; its fixes file says: 'One owner,
route 2's LubinTateFormalModulesAndQuasiCanonicalLifts. The following should import these lifts rather than build them:
PAPER-LI-ZHANG-22-B/59; …'. That change has not been applied here.  This paper, p.19: 'Z_s ≅ Spf O_{F̆,s}' with 'degree
… q^s(1 + q^{−1}) when s ≥ 1'. p.12, Example 2.4.3: 'by the theory of canonical lifting ([Gro86]) … Int(L) =
(val(L)+1)/2'.

**Fix.** Add a part-ii route joining LubinTateFormalModulesAndQuasiCanonicalLifts ('Finite flat group schemes and
integral p-adic Hodge theory, Part II: Lubin–Tate formal modules and quasi-canonical lifts') for the Gross-1986 content:
the canonical lifting ℰ of 𝔼 (from item 30), the quasi-canonical lifts Z_s ≅ Spf O_{F̆,s} with their degree (from item
59) and the unramified lifting-depth statement behind item 48. Keep in UnitaryKudlaRapoportCycles only the decomposition
Z(y) = Σ_i Z_{val(y)−2i} [KR11, Prop. 8.1] and Int(L) = (val(L)+1)/2 as a corollary. Add that Part II, by title and id,
to the import lists of both briefs, and replace 'Construct: … quasi-canonical lifting cycles' by 'Import quasi-canonical
lifts from LubinTateFormalModulesAndQuasiCanonicalLifts; construct the cycles Z_s ⊂ N_2 and Z(M^♭)°'. Also: Split item
59. Make a new item for '[Gro86] quasi-canonical lifts of level s and their fields of definition, of degree
q^s(1+q^{-1}) over O_F̆ for s ≥ 1', with status missing and a part-ii route to
LubinTateFormalModulesAndQuasiCanonicalLifts (parent FiniteFlatGroupsAndIntegralPadicHodgeTheory, the BKO/AGHMP id), or
planned once that Part II is in the atlas. Keep in item 59 only [KR11, Prop. 8.1], the decomposition Z(y) =
Σ_{i=0}^{⌊val(y)/2⌋} Z_{val(y)-2i} on N_2, and the primitive part. In item 48's note, cite
PAPER-ANDREATTA-GOREN-HOWARD-ETAL-18/lift-depth (E/F unramified) as the input. In route 2's brief, add to Import:
'quasi-canonical lifts and the lifting depth of special endomorphisms from Finite flat group schemes and integral p-adic
Hodge theory, Part II: Lubin–Tate formal modules and quasi-canonical lifts
(LubinTateFormalModulesAndQuasiCanonicalLifts)'. Change the Construct bullet to '… and the quasi-canonical lifting
cycles Z_s ⊆ N_2 (KR11 Prop. 8.1), from imported lifts'.

### /2 — duplicate

**Where.** research/blueprint/papers/PAPER-LI-ZHANG-22-B.result.json item /46; route 2 brief ('Construct: … K-theory
with supports and derived intersections on formal schemes (Zhang App. B)'); dependent items /47, /56, /66, /76;
research/blueprint/papers/PAPER-LI-ZHANG-22-B.result.json item /46 and route 2 brief ('Construct: … K-theory with
supports and derived intersections on formal schemes (Zhang App. B)')

**Claim.** Item 46 is routed as missing to UnitaryKudlaRapoportCycles, and the route 2 brief has that Part II construct
K-theory with supports. But the scheme layer is already planned: SchemeKTheoryOperations S.3 (K_Z(X) acyclic off Z,
dévissage), S.4 (codimension filtration) and S.6 (products with supports). The formal-scheme extension of Zhang 2021
Appendix B, with Lemma B.2(i)–(ii) and the derived Euler pairing, is owned by the accepted Part II
FormalSupportedIntersections (PAPER-ZHANG-21 route 10). Its brief says UnitaryKudlaRapoportCycles imports it, replacing
its 'unexpanded generic AppendixB placeholders'. So the KR Part II would build a second copy of both layers. Coordinator
note: PAPER-ZHANG-21 is an extraction this session red-teamed (PR #5405), and RT-PAPER-ZHANG-21/10, which raised the
same duplication, is this session's finding. FormalSupportedIntersections was routed by PAPER-ZHANG-21 from its first
checkpoint (PR #2041), so this finding does not rest on that red team. Also: Item 46 covers K_0^Y, K′_0, the codimension
filtration, Gr, derived intersections, χ and (B.3) on locally noetherian formal schemes. It is routed missing to
UnitaryKudlaRapoportCycles, and route 2's brief tells that design job to construct it. The accepted PAPER-ZHANG-21 route
10 plans exactly this material, as items 128–131, 134, 135 and 176, in 'K-theory of schemes, localisation and
operations, Part II: supported formal K-theory and derived intersection degrees' (FormalSupportedIntersections). That
route says the cycle Part IIs import it. The confirmed RT-PAPER-ZHANG-21/10 asked for this extraction to be re-routed,
but the file is unchanged, so the material is still planned twice.

**Evidence.** Atlas SchemeKTheoryOperations:S.3: 'Define K_Z(X) using perfect complexes acyclic off a closed subset Z …
For regular closed immersions … prove dévissage'; S.4: 'Construct the codimension filtration and coniveau exact couple';
S.6: 'Extend the external products of K.7 to schemes, supports and relative theories'. PAPER-ZHANG-21 route 10
(accepted) brief: 'Build noetherian formal schemes' J-power-supported coherent and perfect categories; rational K0/G0,
cup products and dimension/codimension filtrations … Endpoints are Zhang2021 AppendixB LemmaB.1 …, LemmaB.2(i) …,
LemmaB.2(ii) … and (B.4)'s derived Euler pairing … UnitaryKudlaRapoportCycles and any orthogonal cycle consumer import
this one supplier, replacing their unexpanded generic AppendixB placeholders.' PAPER-ZHANG-21 items 132–133 mark the
scheme Adams/(B.3) statements planned at S.4/S.6; PAPER-LI-LIU-21 item 75 routes Gillet–Soulé K_0 with supports to
S.6/S.7. Also: PAPER-ZHANG-21 route 10, reason: 'The existing UnitaryKudlaRapoportCycles brief mentions it as a
construction obligation; factor that obligation into this shared supplier and have all cycle consumers import it.' Its
brief: 'UnitaryKudlaRapoportCycles and any orthogonal cycle consumer import this one supplier'.  RT-PAPER-ZHANG-21/10
(duplicate, medium), fix: 'Add a maintainer note asking that PAPER-LI-ZHANG-22-B/46 be re-routed to
FormalSupportedIntersections, with UnitaryKudlaRapoportCycles importing it'.  This extraction's route 2 lists
PAPER-LI-ZHANG-22-B/46, and its brief says 'Construct: Kudla–Rapoport cycles Z(L), K-theory with supports and derived
intersections on formal schemes (Zhang App. B), and Int(L)'.

**Fix.** Split item 46. Make its scheme part planned at SchemeKTheoryOperations:S.3, S.4 and S.6: K_0^Y(X), the
codimension filtration, K_0^Y(X) ≅ K′_0(Y) for regular X, supported products and scheme (B.3). Route its formal-scheme
extension to FormalSupportedIntersections ('K-theory of schemes, localisation and operations, Part II: supported formal
K-theory and derived intersection degrees') through a part-ii route joining PAPER-ZHANG-21's. In the route 2 brief,
delete 'K-theory with supports and derived intersections on formal schemes (Zhang App. B)' from Construct, and add to
Import 'FormalSupportedIntersections (formal K_0^Y, filtrations, Lemma B.2) and SchemeKTheoryOperations S.3/S.4/S.6'.
Also: Re-route item 46. Remove it from route 2. Either give it status planned with the FormalSupportedIntersections
design (once that Part II is in the atlas), or move it to a part-ii route with parent SchemeKTheoryOperations, roadmap
FormalSupportedIntersections and the same title as PAPER-ZHANG-21 route 10. Add the note 'the same objects as
PAPER-ZHANG-21/128–131, 134, 135, 176'. In route 2's brief, change the first Construct bullet to 'Kudla–Rapoport cycles
Z(L) and Int(L)', and add to Import: 'K-theory with supports, filtrations and derived intersection degrees on formal
schemes from K-theory of schemes, localisation and operations, Part II (FormalSupportedIntersections)'.

### /3 — error

**Where.** research/blueprint/papers/PAPER-LI-ZHANG-22-B.result.json item /6; sourceIssues (no entry)

**Claim.** Item 6 states, from p.16, that Den(<1>^{n+m+k}, L^♭ ⊕ M) = Den(<1>^{n+k}, L^♭) for M self-dual of rank m and
L^♭ integral of rank n. This is false. The left side carries the extra factor Den(<1>^{n+m+k}, M) =
Π_{i=n+k+1}^{n+m+k}(1 - (-q)^{-i}). The consequence (3.2.1.1), Den(X, L^♭ ⊕ M) = Den(X, L^♭), is nevertheless true,
because the normalizing denominator Den(<1>^{n+m+k}, <1>^{n+m}) carries the same factor. No sourceIssue records the
misprint. Coordinator note: Verified by the coordinator: with n = m = 1, k = 0 and L^♭ = M = ⟨1⟩ the printed identity
reads Den(⟨1⟩², ⟨1⟩²) = Den(⟨1⟩, ⟨1⟩), that is (1 + q^{−1})(1 − q^{−2}) = 1 + q^{−1}.

**Evidence.** p.16, §3.2: 'for any self-dual lattice M of rank(M) = m and any integral lattice L^♭ of rank(L^♭) = n, we
have Den(<1>^{n+m+k}, L^♭ ⊕ M) = Den(<1>^{n+k}, L^♭) and therefore we obtain a cancellation law: Den(X, L^♭ ⊕ M) =
Den(X, L^♭). (3.2.1.1)'.  Counterexample n = m = 1, k = 0, L^♭ = M = <1>. By the paper's own (3.2.0.1), Den(<1>^2,
<1>^2) = (1 + q^{-1})(1 - q^{-2}), while Den(<1>^1, <1>) = 1 + q^{-1}. Direct counts agree: #U_1(O_F/ϖ^N) = (q+1)q^{N-1}
and #U_2(O_F/ϖ^N) = q^{4N}(1+q^{-1})(1-q^{-2}).  The correct relation splits off the self-dual image of M, whose
orthogonal complement in <1>^{N} is ≅ <1>^{N-m}: Den(<1>^N, L^♭ ⊕ M) = Den(<1>^N, M)·Den(<1>^{N-m}, L^♭). The dimensions
match: m(2N-m) + n(2(N-m)-n) = (n+m)(2N) - (n+m)^2.  (3.2.1.1) was confirmed by brute force in rank 2 (q = 3): Den(X,
<1> ⊕ <ϖ^b>) = Σ_{i=0}^{b}(-X)^i for b ≤ 4.

**Fix.** Replace the first sentence of item 6 by: 'For a self-dual M of rank m and an integral L^♭ of rank n,
Den(<1>^{n+m+k}, L^♭ ⊕ M) = Den(<1>^{n+m+k}, M)·Den(<1>^{n+k}, L^♭), where Den(<1>^{n+m+k}, M) = Π_{i=n+k+1}^{n+m+k}(1 -
(-q)^{-i}). Since Den(<1>^{n+m+k}, <1>^{n+m}) = Den(<1>^{n+m+k}, <1>^m)·Den(<1>^{n+k}, <1>^n), this gives Den(X, L^♭ ⊕
M) = Den(X, L^♭) (3.2.1.1).' Add a sourceIssue E6 with: kind error; locator §3.2, p.16; the printed display as quoted;
this correction; affects nothing (the cancellation law (3.2.1.1) holds); known new.

### /4 — error

**Where.** research/blueprint/papers/PAPER-LI-ZHANG-22-B.result.json item /68 (and /70's proof); sourceIssues (no
entry); route 2 brief ('Lusztig's eigenvalues, the Deligne–Lusztig Tate theorem')

**Claim.** Item 68 reproduces Lemma 5.3.1(iii) as printed: for all d, i ≥ 0 and j ≥ 1, F^s has no nonzero invariants on
H^{2j}(Y_d - X_i)(j). This is false whenever 1 ≤ j < d - i. The printed proof ('Y_d - X_i = ⊔_{m=i+1}^d X°_m') treats a
locally closed stratification as a disjoint union, but ordinary cohomology is not additive over strata. Theorem 5.3.2
uses (iii) only with j = d - i, where it is true by a Gysin-sequence argument, so the theorem stands. The item and the
brief nevertheless carry a false lemma, and no sourceIssue records it. Coordinator note: Verified by the coordinator:
Y_d is smooth projective of dimension d inside a Grassmannian over k_F and X_i is closed of dimension i, so for j < d −
i semi-purity gives H^{2j}_{X_i}(Y_d) = 0, and the k_F-rational class h^j injects into H^{2j}(Y_d − X_i)(j).

**Evidence.** p.25: 'Lemma 5.3.1. For any d, i ≥ 0 and s ≥ 1, the action of F^s on the following cohomology groups are
semisimple, and the space of F^s-invariants is zero when j ≥ 1. … (iii) H^{2j}(Y_d − X_i)(j). … (iii) It follows from
(ii) since Y_d − X_i = ⊔_{m=i+1}^d X°_m.'  Counterexample (d, i, j) = (2, 0, 1). Y_2 is a smooth projective surface
(§2.5) and X_0 is a finite nonempty set of points, the superspecial points. Since H^k_{X_0}(Y_2) = 0 for k ≠ 4,
restriction gives H^2(Y_2)(1) ≅ H^2(Y_2 - X_0)(1). The class c_1 of the Plücker line bundle restricted from Gr_{3}(V) is
defined over k_F, hence F-invariant, and it is nonzero because its square has positive degree. The same argument gives
H^{2j}(Y_d - X_i) ≅ H^{2j}(Y_d) ∋ h^j ≠ 0 whenever j < d - i, the codimension of X_i.  The proof of Theorem 5.3.2 (p.26)
uses (iii) only as H^{2i}(Y_d - X_{d-i})(i), that is j = d - i.

**Fix.** Replace item 68's statement by: 'For d ≥ 0, s ≥ 1 and j ≥ 1: F^s acts semisimply on H^{2j}(Y°_d)(j) and
H^{2j}(X°_i)(j), with eigenvalues among (-q)^{2js}, (-q)^{(2j-1)s}, so it has no nonzero invariants there. For 0 ≤ i ≤ d
and j ≥ d - i, H^{2j}(Y_d - X_i)(j) has no generalized F^s-eigenvalue 1. The proof filters Y_d - X_i by the closed
strata X°_m (m = i+1, …, d) of the opens U_m = ⊔_{m' ≥ m} X°_{m'}, and uses the purity isomorphisms
H^{2j}_{X°_m}(U_m)(j) ≅ H^{2j-2(d-m)}(X°_m)(j-d+m), where j - d + m ≥ 1. The printed (iii) for j < d - i is false
(counterexample d = 2, i = 0, j = 1).' In item 70's outline, note that only j = d - i is used and only the vanishing of
the generalized 1-eigenspace of H^{2i}(Y_d - X_{d-i})(i), not its semisimplicity. Add a sourceIssue (kind error, locator
Lemma 5.3.1(iii) and its proof, p.25; affects the proof; correction as above; Theorem 5.3.2 unchanged).

### /5 — error

**Where.** research/blueprint/papers/PAPER-LI-ZHANG-22-B.result.json item /20 (Example 9.1.3); sourceIssues (missing
entry)

**Claim.** Example 9.1.3 assumes a <= b, but under that hypothesis (9.1.3.1) and (9.1.3.2) are false whenever a < b.
Both formulas compute Den(X, <varpi^a> + <varpi^b> + <varpi>) only when a >= b. Den(X, L^sharp) is symmetric in a and b,
but the printed formulas are not, so the paper has the inequality the wrong way round. Item /20 copies the false
hypothesis. Its note checks only that the two printed formulas agree with each other, which they do for all a, b, so the
check cannot detect this. No sourceIssue records it. Coordinator note: Verified by the coordinator. Sankaran's (9.1.3.1)
and Terstiege's (9.1.3.2) agree with each other for all (a, b), and both are asymmetric. By the cancellation law, Den(X,
L^♯) at (a, b) = (0, 2) is the rank-2 density Den(X, ⟨ϖ⟩ ⊕ ⟨ϖ²⟩) = Σ_{l=0}^{1}(qX)^l Σ_{k=0}^{3−2l}(−X)^k = (1 − X)(1 +
qX + X²). The printed formulas give this value at (2, 0), not at (0, 2).

**Evidence.** p.62: "Let L = <varpi^a> + <varpi^b>, a <= b, a+b even ... (9.1.3.2) Den(X, L^sharp) =
1/(1+X){sum_{l=0}^{b+1} X^l(q^l - q^{1+b-l}X^{a+1}) - sum_{l=0}^{b-1} X^{1+l}(q^{2+l} - q^{1+b-l}X^{a+1})}".
Counterexample (a,b) = (0,2). By the cancellation law (item /6), Den(X, L^sharp) = Den(X, <varpi> + <varpi^2>). Its
integral overlattices are L itself (type 2, weight m(2;X) = (1-X)(1+qX)) and <varpi> + <1> (type 1, weight X^2(1-X)).
Theorem 3.5.1 then gives Den(X, L^sharp) = (1-X)(1+qX+X^2), so dDen = q+2 = m(2)+m(1), as Corollary 3.5.3 requires. At
(a,b) = (0,2), (9.1.3.2) and (9.1.3.1) both give (1-X)(1-(q^3+q^2-q)X+X^2), with -d/dX at X=1 equal to 2+q-q^2-q^3. At
(a,b) = (2,0) they give (1-X)(1+qX+X^2), the correct value. A brute-force enumeration over Z_3[i] (q = 3) for (0,2),
(1,3) and (0,4) and a symbolic check in q via Proposition 3.7.1 for (2,0), (4,0) and (3,1) agree: the formulas equal
Den(X, L^sharp) exactly when evaluated at (max(a,b), min(a,b)). For (0,2) the printed value minus the true one is
q^2(q+1)X(X-1), and for (1,3) it is q^3(q+1)X^2(X-1).

**Fix.** In item /20 replace "a <= b" by "a >= b" (equivalently, interchange a and b in (9.1.3.1)-(9.1.3.2)). Add to the
note: "Printed with a <= b; the formulas hold for a >= b (checked against the Cho-Yamauchi value, e.g. (a,b) = (0,2):
Den(X, L^sharp) = (1-X)(1+qX+X^2), while the printed formula gives (1-X)(1-(q^3+q^2-q)X+X^2))". Add sourceIssue E6: kind
error, locator "Example 9.1.3, p.62", printed "Let L = <varpi^a> + <varpi^b>, a <= b", correction "a >= b (or
interchange a and b in (9.1.3.1)-(9.1.3.2))", affects "a stated result" (only the example; nothing downstream uses it),
known new.

### /6 — error

**Where.** research/blueprint/papers/PAPER-LI-ZHANG-22-B.result.json items /108, /110, /116; route 1 brief (final
theorems; 'Theorems 10.4.3 and 10.5.1, only under Conjecture 10.4.1'); sourceIssues (missing entry); report section
Routes 2 ('Conjecture 10.4.1 stays an explicit hypothesis of the two conditional theorems')

**Claim.** The almost self-dual case of Theorem 13.6.1 rests, as printed, on Conjecture 10.4.1, and the extraction
states it (and Theorems 14.5.1 and 15.5.1, which use it) unconditionally. The semi-global number (13.5.0.2) is an Euler
characteristic of derived tensor products on M_{K∩K♯}, whose p-adic uniformization is by the auxiliary space Ñ¹_n
(§13.4); Theorem 10.3.1, which the proof invokes, computes the Euler characteristic on Z(x_0) (Definition 10.2.3). The
only comparison of the two in the paper is the step on p.72 in the proof of Theorem 10.5.1, which uses that π_2 is an
isomorphism off the zero-dimensional Z(x_0)^ss (Conjecture 10.4.1(ii)) and Lemma 10.4.2 (which needs Ñ¹_n regular, a
consequence of the conjecture). Remark 15.5.2 makes the almost self-dual places unavoidable in Theorem 15.5.1, so the
paper's main global theorem depends on the conjecture through this step. Li–Rapoport–Zhang (arXiv:2404.02214) now supply
it, so the theorems hold, but the dependency must be recorded and imported. Coordinator note: Verified by the
coordinator in the TeX. (13.5.0.2) defines the almost self-dual Int_{T,ν} on M_{K∩K♯}, whose uniformization is by Ñ¹_n
(§13.4), while the proof of Theorem 13.6.1 cites only Theorem 10.3.1 and Remark 10.3.2, which concern Z(x_0). The paper
declares Conjecture 10.4.1 a standing assumption from p.67 ('which from now on we assume to hold'), so its later
theorems are conditional as printed. What is unrecorded is that Theorem 13.6.1 needs the conditional comparison of p.72,
and the extraction states Theorems 13.6.1, 14.5.1 and 15.5.1 unconditionally. PAPER-LI-LIU-21/E3 comes from that
extraction's review (PR #4783), which preceded this session's red team of it.

**Evidence.** p.82 (§13.4): 'The p-adic uniformization theorem (13.1.0.1) of [RZ96] then holds for M_{K∩K♯} with N =
Ñ¹_{F_{w0}/F_{0,v0},n}, the auxiliary Rapoport–Zink space defined in §10.2', and Z^♭(T, ϕ_K)(S) consists of points of
M_{K∩K♯} with x in the cycle Z^♯(T, ϕ_K) of M^♯ (so locally it is π_2^{−1} of a cycle on N_{n+1}). p.83 (13.5.0.2):
'Int_{T,ν}(ϕ_K) := (1/deg π_1) χ(Z^♭(T, ϕ_K), O_{Z^♭(t_1,ϕ_1)} ⊗^L ⋯ ⊗^L O_{Z^♭(t_n,ϕ_n)})·log q_ν'. p.66 (10.2.3.1):
'Int(L; x_1, ⋯, x_n) = (1/(q+1)) χ(Z(x_0), Z^♭(x_1) ∩^L ⋯ ∩^L Z^♭(x_n)), where the derived tensor product is taken as
O_{Z(x_0)}-sheaves'. p.84: 'The identity follows in a similar way from our main Theorem 10.3.1 and Remark 10.3.2 in the
almost self-dual case.' p.72 (proof of Theorem 10.5.1): 'Note that π_{2∗}(O_{Ñ¹_n}) − O_{Z(x_0)} is supported on
Z(x_0)^ss which is zero-dimensional. We obtain χ(Ñ¹_n, π_2^*(O_{Z^♭(x_1)}) ⊗^L ⋯ ⊗^L π_2^*(O_{Z^♭(x_n)})) = χ(Z(x_0),
Z^♭(x_1) ∩^L ⋯ ∩^L Z^♭(x_n))'; p.67: 'In [KRSZ19] the authors will prove this conjecture, which from now on we assume to
hold. It follows from the conjecture that Ñ¹_n is regular'; p.70: 'Note that the result is conditional on Conjecture
10.4.1.' p.89, Remark 15.5.2: 'it is necessary to allow almost self-dual level at some inert place (as we did in (G2))'.

**Fix.** Add sourceIssue E6: kind 'gap'; locator 'Proof of Theorem 13.6.1, almost self-dual case, p.84; (13.5.0.2),
p.83; §13.4, p.82'; printed 'The identity follows in a similar way from our main Theorem 10.3.1 and Remark 10.3.2 in the
almost self-dual case.'; correction 'Int_{T,ν} in (13.5.0.2) is computed on M_{K∩K♯}, uniformized by Ñ¹_n, whereas
Theorem 10.3.1 computes χ on Z(x_0). The comparison χ(Ñ¹_n, ⊗^L_i O_{π_2^{−1}Z^♭(x_i)}) = χ(Z(x_0), Z^♭(x_1) ∩^L ⋯ ∩^L
Z^♭(x_n)) is needed; the paper proves it only on p.72 under Conjecture 10.4.1 (with Lemma 10.4.2). It holds by
Li–Rapoport–Zhang, arXiv:2404.02214v2, Theorem 14.6.2 with Corollary 16.1.5 (as checked for the same step in
PAPER-LI-LIU-21 sourceIssues E3). Alternatively define (13.5.0.2) on the Kudla–Rapoport divisor Z^♯(u_0) of M^♯, which
is uniformized by the regular Z(x_0) [Ter13b], where Theorem 10.3.1 applies directly.'; affects 'the proof' (Theorem
13.6.1 almost self-dual case, Theorem 14.5.1 at (G2) places, Theorem 15.5.1). Item /108: append to the proof outline 'In
the almost self-dual case the local factor is an Euler characteristic on Ñ¹_n; it equals (q+1)Int(L) by the comparison
of p.72, which needs Conjecture 10.4.1 (now Li–Rapoport–Zhang, Thm. 14.6.2, Cor. 16.1.5) (E6).' Items /110 and /116: add
to the note 'Uses Theorem 13.6.1 at almost self-dual places, hence E6.' Route 1 brief: replace 'Theorems 10.4.3 and
10.5.1, only under Conjecture 10.4.1, which the source assumes and which must stay an explicit hypothesis until proved'
by 'Theorems 10.4.3 and 10.5.1, and the comparison χ(Ñ¹_n, …) = χ(Z(x_0), …) that Theorem 13.6.1 needs at almost
self-dual level (E6), all from Conjecture 10.4.1; plan Li–Rapoport–Zhang (arXiv:2404.02214v2) Theorem 14.6.2 and
Corollary 16.1.5 as the cited input that proves it, or carry the conjecture as a named hypothesis of Theorems 10.4.3,
10.5.1, 13.6.1 (almost self-dual case), 14.5.1 and 15.5.1'. Update the report sentence accordingly.

### /7 — error

**Where.** research/blueprint/papers/PAPER-LI-ZHANG-22-B.result.json item /58 (the §9.2 half); sourceIssues (missing
entry); research/blueprint/papers/PAPER-LI-ZHANG-22-B.result.json item /58; sourceIssues (no entry)

**Claim.** Item 58 states W_T(1, k, ϕ_1) = (−q)^n Den(Λ ⊕ ⟨1⟩^{2k}, L) for the almost self-dual Λ = ⟨1⟩^{n−1} ⊕ ⟨ϖ⟩.
This is a misprint copied from p.63: at k = 0 it contradicts the next line of the paper, W_T(1, 0, ϕ_1) = (−q)^{−n}
Den(Λ, L), and (9.2.0.1)–(9.2.0.2), which the item cites. The correct factor is (−q)^{−n}: W_T(1, 0, 1_{Λ^n}) =
γ_𝕍^n·vol(Λ)^n·Den(Λ, L) with the self-dual measure, γ_𝕍 = −1 and vol(Λ) = [Λ^∨ : Λ]^{−1/2} = q^{−1} (the self-dual case
ϕ_0, with γ = 1 and vol = 1, gives the paper's W_T(1, k, ϕ_0) = Den(⟨1⟩^{n+2k}, L), consistently). As written the item's
formula is false by the factor q^{2n} in exactly the normalisation that Remarks 10.3.2 and 10.5.4 and Theorem 13.6.1
use. No sourceIssue records the misprint. Also: Item /58 states W_T(1, k, phi_1) = (-q)^n Den(Lambda + <1>^{2k}, L),
copying a misprint from section 9.2 (p.63, just past this range but part of section 9). At k = 0 the paper's very next
line reads W_T(1,0,phi_1) = (-q)^{-n} Den(Lambda, L), which contradicts it. (9.2.0.1)-(9.2.0.2) and Remark 10.3.2 both
use (-q)^{-n}. The exponent must be -n: the item's formula is off by a factor (-q)^{2n}. Also: Item 58 states W_T(1, k,
ϕ_1) = (−q)^n Den(Λ ⊕ <1>^{2k}, L) for Λ = <1>^{n−1} ⊕ <ϖ>, copying p.63. The source cited, KR14 Prop. 10.1, gives the
factor γ_p(V)^n |N(det S)|^{n/2} = (−1)^n q^{−n} = (−q)^{−n}. That is also the factor in the paper's own next display
and in (9.2.0.1)–(9.2.0.2), so the item is inconsistent with the formulas it says it gives. This misprint is not
recorded.

**Evidence.** p.63 (§9.2, page image checked): 'By [KR14, Proposition 10.1], when g = 1, it satisfies the interpolation
formula for integers s = k ≥ 0 (notice γ_p(V) = −1 in the notation there), W_T(1, k, φ_1) = (−q)^n · Den(Λ ⊕ ⟨1⟩^{2k},
L). So its value at s = 0 is W_T(1, 0, φ_1) = (−q)^{−n} · Den(Λ, L) = (−q)^{−n} · Den_Λ(L) · Den(⟨1⟩^{n−1}, ⟨1⟩^{n−1})',
then (9.2.0.1) W_T(1,0,φ_1) = Den_Λ(L)·(−q)^{−n}Π_{i=1}^{n−1}(1 − (−q)^{−i}). TeX line 3044 has the same '(-q)^n' and
'(-q)^{-n}'. Item 58: '…W_T(1, k, ϕ_1) = (−q)^n Den(Λ ⊕ ⟨1⟩^{2k}, L), giving (9.2.0.1)–(9.2.0.2).' Also: p.63:
"W_T(1,k,phi_1) = (-q)^n . Den(Lambda + <1>^{2k}, L). So its value at s = 0 is W_T(1,0,phi_1) = (-q)^{-n} . Den(Lambda,
L)". Remark 10.3.2 (p.66) gives Int(L) = W'_T/log q^2 . ((-q)^n - 1)/(q+1) . prod_{i=1}^n (1-(-q)^{-i})^{-1}. With
Theorem 10.3.1 this forces dDen_Lambda = (-q)^n W'_T/(log q^2 . prod_{i=1}^{n-1}(1-(-q)^{-i})), which is (9.2.0.2) with
(-q)^{-n}. Independent check: by section 12.3, omega(w_n) phi = gamma_V^n hat(phi), with gamma_V = -1 for the span of
Lambda = <1>^{n-1} + <varpi> (det varpi, nonsplit) and vol(Lambda^n) = q^{-n}. Hence W_T(1,0,1_{Lambda^n}) = (-1)^n
q^{-n} Den(Lambda, L), and the same factor applies to Lambda + <1>^{2k}. Also: p.63, §9.2: 'W_T(1,k,ϕ_1) = (−q)^n ·
Den(Λ ⊕ <1>^{2k}, L). So its value at s = 0 is W_T(1,0,ϕ_1) = (−q)^{−n} · Den(Λ, L)'.  Kudla–Rapoport II, arXiv
0912.3758v2, Proposition 10.1: 'Let S_r = diag(1_r, S, 1_r). Then W_{T,p}(r, Φ_p) = γ_p(V)^n |N(det S)|_p^{n/2} |∆|^e_p
α_p(S_r, T)'. Here det S = ϖ, N(det S) = ϖ², ∆ is a unit and γ_p(V) = −1.

**Fix.** In item 58 replace 'W_T(1, k, ϕ_1) = (−q)^n Den(Λ ⊕ ⟨1⟩^{2k}, L), giving (9.2.0.1)–(9.2.0.2)' by 'W_T(1, k,
ϕ_1) = (−q)^{−n} Den(Λ ⊕ ⟨1⟩^{2k}, L) (the paper prints (−q)^n; E7); hence W_T(1, 0, ϕ_1) =
Den_Λ(L)·(−q)^{−n}Π_{i=1}^{n−1}(1 − (−q)^{−i}) (9.2.0.1) and W′_T(1, 0, ϕ_1) = ∂Den_Λ(L)·(−q)^{−n}Π_{i=1}^{n−1}(1 −
(−q)^{−i})·log q² (9.2.0.2), for val(L) even'. Add sourceIssue E7: kind misprint; locator '§9.2, interpolation formula,
p.63'; printed 'W_T(1, k, φ_1) = (−q)^n · Den(Λ ⊕ ⟨1⟩^{2k}, L)'; correction '(−q)^{−n}'; reason 'at k = 0 it must agree
with the next display, W_T(1, 0, φ_1) = (−q)^{−n}·Den(Λ, L); the factor is γ_𝕍^n vol(Λ)^n with γ_𝕍 = −1 and vol(Λ) =
q^{−1}'; affects nothing; known new. Also: In item /58 replace "W_T(1, k, phi_1) = (-q)^n Den(Lambda + <1>^{2k}, L)" by
"W_T(1, k, phi_1) = (-q)^{-n} Den(Lambda + <1>^{2k}, L) (printed (-q)^n)". Add sourceIssue: kind misprint, locator
"Section 9.2, p.63", printed "W_T(1,k,phi_1) = (-q)^n . Den(Lambda + <1>^{2k}, L)", correction "(-q)^{-n}", reason as
above, affects nothing, known new. Also: In item 58, write 'W_T(1, k, ϕ_1) = (−q)^{−n} Den(Λ ⊕ <1>^{2k}, L)' and add to
the note: 'printed (−q)^n on p.63; KR14 Prop. 10.1 gives γ_p(V)^n|N(det S)|^{n/2} = (−q)^{−n}, as in (9.2.0.1)'. Add the
misprint to sourceIssues (§9.2, p.63, affects nothing).

## All findings

| Finding | Severity | Kind | Where | Claim (abridged) |
|---|---|---|---|---|
| /1 | high | duplicate | result items /30 (canonical lifting ℰ), /48, /59; … | The canonical and quasi-canonical lifts of the height-2 formal O_{F_0}-module with CM by O_F (Gross 1986: existence, End = O_{F_0} + ϖ^s O_F, field of … |
| /2 | high | duplicate | result item /46; … | Item 46 is routed as missing to UnitaryKudlaRapoportCycles, and the route 2 brief has that Part II construct K-theory with supports. But the scheme layer is … |
| /3 | high | error | result item /6; … | Item 6 states, from p.16, that Den(<1>^{n+m+k}, L^♭ ⊕ M) = Den(<1>^{n+k}, L^♭) for M self-dual of rank m and L^♭ integral of rank n. This is false. The left … |
| /4 | high | error | result item /68 (and /70's proof); … | Item 68 reproduces Lemma 5.3.1(iii) as printed: for all d, i ≥ 0 and j ≥ 1, F^s has no nonzero invariants on H^{2j}(Y_d - X_i)(j). This is false whenever 1 ≤ j … |
| /5 | high | error | result item /20 (Example 9.1.3); … | Example 9.1.3 assumes a <= b, but under that hypothesis (9.1.3.1) and (9.1.3.2) are false whenever a < b. Both formulas compute Den(X, <varpi^a> + <varpi^b> + … |
| /6 | high | error | result items /108, /110, /116; … | The almost self-dual case of Theorem 13.6.1 rests, as printed, on Conjecture 10.4.1, and the extraction states it (and Theorems 14.5.1 and 15.5.1, which use … |
| /7 | high | error | result item /58 (the §9.2 half); … | Item 58 states W_T(1, k, ϕ_1) = (−q)^n Den(Λ ⊕ ⟨1⟩^{2k}, L) for the almost self-dual Λ = ⟨1⟩^{n−1} ⊕ ⟨ϖ⟩. This is a misprint copied from p.63: at k = 0 it … |
| /8 | medium | duplicate | result item /102 (and the I_n(s,χ)-section part of item /25); … | Item 102 has the KR Part II construct the degenerate principal series I_n(s,χ) of U(n,n), the Siegel Eisenstein series E(g,s,Φ), its convergence for Re(s) ≫ 0 … |
| /9 | medium | error | result item /21 (status missing; … | The local Fourier transform on a finite-dimensional space over a p-adic field, with respect to an additive character and the self-dual Haar measure, is planned … |
| /10 | medium | error | result items /22 and /25 (status missing; … | Item 22 is planned, not missing. The generator formulas (8.1.2.1) of the SL_2 Weil representation of an even-dimensional quadratic space and the Weil constant … |
| /11 | medium | error | result route 5 (item /26, Tate's theorem routed as a source to … | Route 5 puts Tate's full-faithfulness theorem Hom(G,H) ≅ Hom_{Γ_K}(T_pG,T_pH) inside R07.1. Tate proves it from the Hodge–Tate decomposition of T_p(G) ⊗ C_K … |
| /12 | medium | duplicate | result item /49 (generalized Deligne–Lusztig varieties Y_V) and item …; … | The variety Y_V is defined as {U ⊆ V, dim U = d+1, U^⊥ ⊆ U} for a nondegenerate hermitian space V over k_F of dimension 2d+1, and is smooth projective of … |
| /13 | medium | duplicate | result item /29 and route 1 brief (final theorem 'N_n … is formally …; … | The Rapoport–Zink representability theorem and the EL/PEL Rapoport–Zink spaces it produces are planned elsewhere. The accepted Part II … |
| /14 | medium | other | result item /107 (Ichino's Siegel–Weil formula), routed to … | The Siegel–Weil formula is a general theorem of theta correspondence: a regularized theta integral equals a value of a Siegel Eisenstein series. It is not … |
| /15 | medium | duplicate | result item /115 (Gillet–Soulé arithmetic Chow group and arithmetic …; … | The extraction plans the Gillet–Soulé arithmetic Chow group in UnitaryKudlaRapoportCycles and leaves sharing conditional on both Part IIs being accepted. … |
| /16 | medium | missing | result prerequisites | The prerequisites omit works that the proofs and constructions cite and that the atlas does not cover. RZ96 (Rapoport–Zink) is cited for N_n's representability … |
| /17 | medium | missing | result prerequisites; … | Conjecture 10.4.1 has been proved. Li–Rapoport–Zhang, arXiv:2404.02214, Theorem 14.6.2 with Corollary 16.1.5, proves every part of it that §§10.4–10.5 use. The … |
| /18 | medium | error | result items /46, /47, /66 (and /76); … | Item 46 states Zhang's (B.3) for locally noetherian formal X without qualification: if F_i ∈ F^{r_i} with Σ r_i ≥ dim X, then χ(X, ⊗^L F_i) depends only on the … |
| /19 | medium | missing | result items (none); … | The uniqueness of lifts to O_K[ε] in the proof of Theorem 4.2.1 rests on a cited deformation result. A lift of z ∈ Z(L^♭)(O_K) to O_K[ε] corresponds to an … |
| /20 | medium | missing | result item /52 (Lemma 2.8.1) and route 2 | The proof of Lemma 2.8.1 uses two cited inputs that no item records. The first is the base case n ≤ 3 of the induction ('known by the proof of [Ter13a, Lemma … |
| /21 | medium | missing | result items /67-/70 (no item for the étale inputs); … | Lemma 5.3.1 and Theorem 5.3.2 use three étale-cohomology inputs that no item records. They are Frobenius-equivariant Poincaré duality H^{2d-j}_c × H^j(d) → Q_ℓ … |
| /22 | medium | missing | result (no item); … | The n = 3 case of the proof of Lemma 6.2.1 for u in Lambda takes two intersection numbers on N_3 from Terstiege [Ter13a]. Lemma 6.2.1 lies on the main chain … |
| /23 | medium | missing | result (no item); … | Section 6.4 uses two cited inputs that no item records. (1) Poincare duality for the l-adic cohomology of the smooth projective variety V(Lambda) over k-bar, … |
| /24 | medium | error | result item /99 (Lemma 10.4.2) | Item 99 states Lemma 10.4.2 unconditionally, but the paper assumes Conjecture 10.4.1 from §10.4 on and the proof uses it: it applies an observation about … |
| /25 | medium | error | result items /36, /37, /38 (all 'with the same set-up as §11.2') | Item 36 drops the standing hypothesis of §11.2 at p = 2: all places of F_0 above 2 must be unramified in F. As stated, the item asserts that the RSZ moduli … |
| /26 | medium | missing | result (no items); … | Five cited results that the proofs in §§10.4, 13 and 14 use are recorded by no item (PROTOCOL §16: 'A result the paper cites from elsewhere is one item, with … |
| /27 | low | error | result item /28 (planned …; … | The accepted restructuring RS-02 moved the Dieudonné–Manin classification out of R07.2 to VectorBundlesAndIsocrystals:VB0. R07.2 keeps the integral Dieudonné … |
| /28 | low | error | result item /86 (planned ['SchemeAndStackFoundations:SF.5']); … | Item 86 contains two statements. The ring isomorphism ch: K_0(X)_Q ≅ ⊕Ch^i(X)_Q (Gr^iK_0 ≅ Ch^i) is the regular-scheme K/Chow comparison, which accepted RS-18 … |
| /29 | low | error | result item /87 (planned ['MotivesAndAlgebraicCycles:MC.2']); … | The ℓ-adic cycle class map CH^i(X)_Q → H^{2i}(X,Q_ℓ(i)) for smooth varieties over a finite field, with its compatibility with intersection and cup products, is … |
| /30 | low | error | report sections 'Checks', 'What the atlas already has' and 'Review'; … | The report repeats statements that are false. (a) 'Stage ids were checked against … the accepted restructures …: none of the cited stages is restructured or … |
| /31 | low | other | result route 1 and route 2 briefs (import naming and theorem … | PROTOCOL §16 requires a brief to name its imports by title and id, and to state its final theorems as the paper does. Route 2 names … |
| /32 | low | duplicate | result item /56 (δ_M : N_{n−r} ↪ N_n, X ↦ X × ℰ̄^r, identified with … | The embedding δ: N_{n−1} → N_n, (X,ι,λ,ρ) ↦ (X × ℰ, …), and its closedness are already routed by the accepted PAPER-ZHANG-21/16 to the RZ Part II. Item 56 … |
| /33 | low | error | result item /72 (Lemma 5.4.4(iv)) | Item 72 states Lemma 5.4.4(iv) without its range hypothesis: 't(L′^♭ ⊕ M) is 2 or 1 according as L′^♭ ⊆ L^♭_{ϖΛ_e^∨} or not'. The paper restricts to L^♭ ⊆ L′^♭ … |
| /34 | low | missing | result sourceIssues (no entries); … | Two misprints in pp.1–32 are unrecorded. First, Definition 2.9.1 calls the horizontal part 'the maximal vertical closed formal subscheme'; it is the maximal … |
| /35 | low | other | result item /27 (status planned, … | Item 27 is Breuil's classification by Breuil modules M(G) = D(G)(S) over Breuil's divided-power ring S, with M(G)/uM(G) the Dieudonné module and M(G) ⊗_S O_K = … |
| /36 | low | other | result sourceIssues E1 (reason); … | E1 is correct but too weak. The two equalities printed in the proof of Theorem 8.2.1 do not merely fail to follow; they are false in general. A worker reading … |
| /37 | low | other | result sourceIssues E2 (correction, reason); … | E2's conclusion is right, and the true value is c_{V(Lambda)}(0) = (-1)^d c(d)(1-q^{2d}). Its correction, however, omits the two projection-formula steps in … |
| /38 | low | missing | result sourceIssues (missing entry); … | The proof of Lemma 6.2.1 has a small gap that no sourceIssue records. In the n = 3 case with u not in Lambda, it gets the value 1 from (5.4.5.5). That identity … |
| /39 | low | missing | result sourceIssues (missing misprints in sections 5.4-8) | No sourceIssue records six misprints in this range; the intended meaning of each is clear. (a) In Lemma 6.3.1(ii), 'the image of (Lambda')^vee' should be 'the … |
| /40 | low | missing | result item /41; … | In §14.1 the global model imposes (M7) and (M9) at every finite ν but omits (M8), the Eisenstein condition at v_0. (G1) allows inert places with self-dual … |
| /41 | low | missing | result items /103, /109; … | Two misprints in the definitions of the global identity are not recorded. (a) §12.3 defines Diff(T, 𝕍) as a set of finite places, but (12.3.0.1) and the proofs … |
| /42 | low | error | result item /40; … | Item 40 copies 'an isogeny α : A × A_0 → A^♯ of degree q_{v_0}'. The symbol q_{v_0} is never defined, and with the natural reading (the residue cardinality of … |

## Notes for the fix job

- **Source errors.** Add sourceIssues for the p.16 identity, Lemma 5.3.1(iii), Example 9.1.3 (a ≥ b), the (−q)^n of p.63
  and the unstated comparison in the proof of Theorem 13.6.1, and correct items 6, 20, 58, 68, 108, 110 and 116.
- **Conjecture 10.4.1.** Add Li–Rapoport–Zhang (arXiv:2404.02214) as a prerequisite and cited input, and state which
  theorems used the conjecture.
- **Owners.** Import Gross's lifts from LubinTateFormalModulesAndQuasiCanonicalLifts, K-theory with supports from
  SchemeKTheoryOperations and FormalSupportedIntersections, and the other planned material (items 21, 22, 25, 29, 49,
  102, 107, 115) from its existing owners.
