# RT-PAPER-YUN-ZHANG-19

Red team of the accepted extraction PAPER-YUN-ZHANG-19: Zhiwei Yun and Wei Zhang, *Shtukas and the Taylor expansion of
L-functions (II)*, Annals of Mathematics 189 (2019), 393–526. Issue #4091.

Red team: Claude Code, session `cc-c2c06b`, 1 October 2026. I did not write or review:
- the extraction (`codex-a71f92`, PR #2048; `cc-442dc5`, PR #2134);
- its review (`cc-39fac3`, PR #2468);
- the later fix edit (`codex-J6LwjP`, PR #5257).

**Disclosures.** Some findings cite, as existing records, work on which this session worked. They carry
coordinator notes; no finding rests on my verdicts.
- /17: PAPER-FENG-YUN-ZHANG-24, which I red-teamed (#4955) without reporting the point this finding extends to its item
  30.
- /21: PAPER-CESNAVICIUS-SCHOLZE-24, which I red-teamed (#5351), cited only for the queue order.
- /16 and /22: RT-AREA-etale, part 2 of whose fixes I reviewed (#5317, the Habiro packets, not the fix for /13).

**Result: 40 findings, 1 high, 21 medium and 18 low.**

## Method

**The source.** The published version (<https://math.mit.edu/~zyun/GZW_ramified_published.pdf>) was re-downloaded on
2026-10-01; its SHA-256 (`700e0b09…d296c`) equals the extraction’s. It has 135 PDF pages, the first a JSTOR cover, with
printed page = PDF page + 391.

**The passes.** Five parallel passes were run by this session.
- Four read every page: §§1–2, §3, §§4–5, and §§6–7 with Appendix A and the references. Page images were rendered for
  the formulas that matter.
- One checked the eight routes, the briefs, the planned and library statuses and duplication against the atlas stages,
  PAPER-YUN-ZHANG-17, PAPER-FENG-YUN-ZHANG-24, PAPER-LAFFORGUE-18 and other extractions, earlier red teams and their fix
  reports, `make_queue.py` and the pinned libraries (Mathlib 082e2d3, Tau Ceti f790474).

**Route numbers.** The findings count this extraction’s routes from 1 in file order, unless they name another file’s
numbering:
- route 1 is the GlobalShtukas source route (GS.0–GS.3);
- routes 2–4 are the SF.3, EDC.5/EDC.7 and SF.1/SF.5 source routes;
- route 5 is the EDC stacks Part II;
- route 6 is ShtukaSpecialCyclesAndHigherSiegelWeil;
- route 7 is RamifiedGeometricClassFieldTheory;
- route 8 is the EDC ind-constructibles Part II.

**Merging.** Findings reported by two or more passes were merged: the two owners of the Hecke and Eisenstein machinery
(three passes), the unrecorded misprints (five findings) and nine points that two passes each reported.

**Severity changes.** I made two:
- The Serre-quotient library claim (/16) is medium, not high. It is the confirmed RT-AREA-etale/13, whose edits are
  written out but not yet applied to this file.
- Item /217’s degree range (/14) is medium, not low: the paper works under d ≥ 2g′−1+N there.

**What I re-verified myself.** The high finding: route 1’s items and reason, the GS.1–GS.3 stage texts,
PAPER-YUN-ZHANG-17’s route for its items 12, 16 and 21–24, and the paper’s own statements that these proofs are YZ17’s
(pp. 404, 433, 434, 452). I also re-checked the Serre-quotient claim against Mathlib and RT-AREA-etale.fixes.md, and
item /217’s range against p. 490.

The full list of what was checked is in the result’s `checked` field.

## The high finding

### /1 — duplicate

**Where.** research/blueprint/papers/PAPER-YUN-ZHANG-19.result.json route 1 (source, GS.0-GS.3) items 15, 42-49, 50-62,
65-78, 179-182, 200-203 and route 6 brief ('Import ... GS.0-3 for all moduli/Hecke/HN/spectral foundations'); versus
research/blueprint/papers/PAPER-YUN-ZHANG-17.result.json route 1 (ShtukaSpecialCyclesAndHigherSiegelWeil) items 12, 16,
21, 22, 23, 24 and its brief; research/blueprint/papers/PAPER-YUN-ZHANG-19.result.json route 1 (source,
GlobalShtukasAndFunctionFieldLanglands GS.0–GS.3): items /15, /42–/49, /50–/62, /65–/78, /179–/182, /199–/203; route 6
brief (ShtukaSpecialCyclesAndHigherSiegelWeil, sentence 'Import … GS.0–3 for all moduli/Hecke/HN/spectral foundations');
research/blueprint/papers/PAPER-YUN-ZHANG-19.md, route paragraph ('The geometric foundations belong to GS, not to the
special-cycle extension'); research/blueprint/papers/PAPER-YUN-ZHANG-19.result.json item /15 (route 1, source ->
GlobalShtukasAndFunctionFieldLanglands GS.0-GS.3) vs research/blueprint/papers/PAPER-YUN-ZHANG-17.result.json item /12
(part-ii route ShtukaSpecialCyclesAndHigherSiegelWeil)

**Claim.** The PGL2 Hecke-on-cycles, Eisenstein-ideal and Eisenstein-sector machinery has two owners. YZ19 sends its
Iwahori-level versions (Lemma 2.1, Lemma 3.13, Propositions 3.14-3.15, Lemmas 3.16-3.17, the horocycle/instability
strata and constant term of sections 3.4-3.5, Lemma 3.36, Proposition 3.39, Corollary 3.40, Theorem 3.41) to the
GlobalShtukas blueprint as source items, and its Part II brief imports them from GS.0-3. The accepted YZ17 extraction
routes the unramified originals of the same statements (Definition 4.1/Lemma 4.2, section 5.3, Proposition 7.1, Lemmas
7.2-7.8, 7.13, Theorem 7.14) to the Part II, whose brief says 'Construct ... the H-action on H^*_c(Sht_G), the
stratification by instability with the cohomological constant term and the Satake intertwining, the finiteness theorems
making H_l a finitely generated algebra of Krull dimension one, and the resulting orthogonal decomposition'. The YZ19
statements contain the YZ17 ones as the case Sigma = R = empty, so the GS.3 blueprint and the merged Part II design
would both plan them, and the two briefs of the one joint tranche give contradictory instructions. GS.3's text does not
plan this material: it plans V. Lafforgue's Hecke-finite sector, not finiteness modulo the Eisenstein ideal. Also: YZ19
§3.3–§3.5 proves the Hecke action on the Chow groups and cohomology of PGL_2 shtukas, the horocycle/constant-term
analysis and the Eisenstein-ideal spectral decomposition at Iwahori level Σ. The paper says these are the YZ17 results
'with the same proofs', and at Σ = ∅ they are exactly YZ17's statements. The accepted PAPER-YUN-ZHANG-17 routes the
unramified versions (/12 Eisenstein ideal and Lemma 4.2, /16 §5.3, /21 §7.1, /22 §§7.2–7.3, /23 §7.4, /24 Theorems
7.14–7.17) to the Part II ShtukaSpecialCyclesAndHigherSiegelWeil. Its brief tells that Part II to construct them. YZ19
routes their Iwahori generalizations as a source of GS.0–GS.3, and its ShtukaSpecialCycles brief says to import
'spectral foundations' from GS.0–3. So the same mathematics is planned in two roadmaps. The GS route is also wrong on
its own terms: GS.3 plans V. Lafforgue's Hecke-finite sector, not an Eisenstein-ideal decomposition. Item /15's own note
concedes that 'The Eisenstein ideal, ι_Pic and the surjectivity of Lemma 2.1 are not planned', yet /15 is routed as a GS
source. Also: The Eisenstein ideal has two owners. YZ19/15 defines a^S_Eis: H^S_G -> Q[Pic_X(k)]^{iota_Pic} and I^S_Eis
and states the surjectivity of Lemma 2.1. Lemma 2.1 is YZ17 Lemma 4.2 'with the same proof', and S = ∅ is YZ17/12
itself. YZ19 sends this to the GS source route, while YZ17/12, the same construction, is owned by the shared Part II.
Nothing in GS.0-GS.3 or the GS packet plans an Eisenstein ideal. Two blueprints would build I_Eis and a_Eis.

**Evidence.** The paper says these are the YZ17 proofs: p. 404 'analogue of [10, Lemma 4.2] with the same proof'; p. 431
'similar to that of [10, Lemma 5.9]'; p. 433 'the same argument as in [10, Prop 5.10] proves the following result.
Proposition 3.14' and 'the same argument as in [10, Prop. 7.1] shows Proposition 3.15'; p. 434 'The following two
results are analogues of [10, Lemmas 5.12, 7.2, and 7.3], with the same proofs'; p. 441 'similar to [10, Lemma 7.5]'; p.
446 'The same argument as [10, Prop. 7.1]'; p. 449 'similar to that of [10, Lemma 7.8]'; p. 452 'The proof of part (1)
is the same as [10, Lemma 7.13(2)]' and 'The same argument as that of [10, Th. 7.14]'. YZ17 items 12, 16, 21-24 note
'Routed to the Part II ShtukaSpecialCyclesAndHigherSiegelWeil'. GS.3 description: 'Construct the Hecke-finite/cuspidal
sector used by V. Lafforgue and prove its required finiteness'. YZ19 route 1 reason: 'GS.3 owns their compact
cohomology, truncation colimits and spectral finiteness. This paper adds precise PGL2 horocycle and Eisenstein-sector
proofs within those targets.' Also: Paper p. 433: 'the same argument as in [10, Prop 5.10] proves the following result'
(Proposition 3.14). P. 434: 'The following two results are analogues of [10, Lemmas 5.12, 7.2, and 7.3], with the same
proofs.' P. 441 (Lemma 3.28): 'The argument is similar to [10, Lemma 7.5]'. P. 452 (Theorem 3.41): 'The argument for (2)
and (3) is the same as that of [10, Th. 7.14].' PAPER-YUN-ZHANG-17 route 'part-ii
ShtukaSpecialCyclesAndHigherSiegelWeil' lists items 12, 16, 21, 22, 23, 24. Its brief: 'Construct … the cohomological
spectral decomposition: the H-action on H^*_c(Sht_G), the stratification by instability with the cohomological constant
term and the Satake intertwining (§§7.2–7.3), the finiteness theorems making H_ℓ a finitely generated algebra of Krull
dimension one, and the resulting orthogonal decomposition of V and V′ (Theorems 7.14 and 7.16)'. YZ17/61 note: 'The
Picard involution and Eisenstein quotient are separately constructed in item 12.' Atlas GS.3: 'Construct the
Hecke-finite/cuspidal sector used by V. Lafforgue and prove its required finiteness'. The GS packet (partial) has no
node mentioning Eisenstein, horocycle, Iwahori or Yun–Zhang. Also: Paper p.403-404: 'In [10, §4.1] we defined the
Eisenstein ideal I_Eis ... We restrict the homomorphism to the subalgebra H^S_G ... Lemma 2.1. The map a^S_Eis: H^S_G ->
Q[Pic_X(k)]^{iota_Pic} is surjective' ('analogue of [10, Lemma 4.2] with the same proof'). PAPER-YUN-ZHANG-17/12 note:
'Owned by the joint Yun-Zhang function-field analytic adapter in the proposed ShtukaSpecialCyclesAndHigherSiegelWeil
tranche'. research/blueprint/packets/GlobalShtukasAndFunctionFieldLanglands.json contains no occurrence of 'Eisenstein'.
The atlas GS.0-GS.3 descriptions mention bundles, Hecke stacks, shtukas and the Hecke-finite sector only.

**Fix.** Give this material one owner in both extractions. Recommended (matches the YZ17 brief and GS.3's text): move
YZ19 items 15, 42-49, 50-62, 65-78, 179-182 and 200-203 from route 1 to route 6; keep 27-41, 177-178 and 197-199 in
route 1. Replace route 1's reason sentences 'GS.3 owns their compact cohomology, truncation colimits and spectral
finiteness. This paper adds precise PGL2 horocycle and Eisenstein-sector proofs within those targets.' with 'GS.3
supplies compactly supported cohomology of finite-type truncations; the PGL2 horocycle, Eisenstein-ideal and
spectral-decomposition statements are planned in ShtukaSpecialCyclesAndHigherSiegelWeil with YZ17/12, /16, /21-/24.' In
route 6's brief replace 'GS.0-3 for all moduli/Hecke/HN/spectral foundations' with 'GS.0-2 for Bun_G(Sigma), Hecke and
shtuka stacks and GS.3 for compact-support cohomology of truncations'. The alternative is to move YZ17/12, /16, /21-/24
into a GS.3 source route and rewrite the YZ17 brief. Either way the two briefs must agree. Also: Give the PGL_2
Hecke/horocycle/spectral material one owner. Move YZ19 items /15, /42–/49, /50–/62, /65–/78, /179–/182 and /199–/203
from route 1 to the shared Part II ShtukaSpecialCyclesAndHigherSiegelWeil (route 6), stated once in the Iwahori-level
generality of YZ19 §3.3–§3.5 with YZ17/12, /16, /21–/24 as the Σ = ∅ case. Keep in route 1 only the generic
level/shtuka-stack items /27–/41, /177, /197 and /198. Replace the route 6 brief sentence by: 'Import GS.0–GS.2 for
Bun_G, Hecke stacks, shtuka stacks and HN truncations; construct here, jointly with YZ17/12, /16, /21–/24, the Hecke
action on Chow groups and compactly supported cohomology, the parabolic horocycle stratification, the cohomological
constant term, the Eisenstein ideal and the cohomological spectral decomposition, in the Iwahori-level form of YZ19
§§3.3–3.5.' Fix the reader report's route paragraph to match. Also: Give the Eisenstein ideal one owner. Recommended:
state YZ17/12 for an arbitrary finite excluded set S (definition of a^S_Eis, I^S_Eis and Lemma 2.1 surjectivity). Move
YZ19/15 out of route 1 into the ShtukaSpecialCyclesAndHigherSiegelWeil part-ii route as that S-generalisation, coalesced
with YZ17/12. Have the GS-routed cohomological items (/71, /75-/78) import it. Otherwise move both to GS.3 with a
request in the GS packet.

## All findings

Locations are in the extraction’s `result.json` unless stated.

| Finding | Severity | Kind | Where | Claim (abridged) |
|---|---|---|---|---|
| /1 | high | duplicate | route 1 (source, GS.0-GS.3) items 15, 42-49, 50-62, 65-78, 179-182, …; … | The PGL2 Hecke-on-cycles, Eisenstein-ideal and Eisenstein-sector machinery has two owners. YZ19 sends its Iwahori-level versions (Lemma 2.1, Lemma 3.13, … |
| /2 | medium | error | items /24 and /25 (Proposition 2.9) | Items /24 and /25 drop the §2.5 standing hypothesis that psi_x is unramified, and with it the measure d^x t_x = zeta_x(1) dt_x//t_x/ with vol(O_x^x) = 1. … |
| /3 | medium | missing | no item; … | No item records the fact, asserted in Theorem 1.2, that for cuspidal pi of level K the character lambda_pi of H^Sigma_G does not factor through a^Sigma_Eis. … |
| /4 | medium | missing | item /17 (and its consumers /16, /23-/26, /193, /196, /18, /20) | No item states the definitions that §2's constants rest on. Item /17's statement is only 'Normalize local Whittaker pairings and the two toric linear forms as … |
| /5 | medium | error | item /41 (Standard Iwahori PGL2 shtuka, Definition 3.12) | The statement reads 'Sht_G^r(Σ;Σ∞) uses the standard half-divisor at infinity and any sign tuple compatible with r≡#Σ∞ mod2'. Read literally this is false. … |
| /6 | medium | error | items /34 and /41 (status planned, GS.2); … | Items /34 and /41 are marked planned at GS.2, but GS.2 plans neither fractional twists nor Atkin–Lehner twists at Σ∞. The review itself notes that 'The … |
| /7 | medium | missing | items (none), prerequisites and gate G3; … | Several cited results are used as black boxes in §3 but appear only under prerequisites or gate G3, not as items with status and route, as PROTOCOL §16 … |
| /8 | medium | missing | (no item); … | §3 uses several definitions imported from YZ17 that no YZ19 item records or cites. (i) The spherical Hecke algebra H^Σ_G = ⊗_{x∈/X−Σ/} H_x with Q-basis {h_D : … |
| /9 | medium | error | item /178 (One-leg Drinfeld-module comparison), route 1 | /178 is routed as a source to GlobalShtukas GS.0–GS.3. But the elliptic-sheaf/Drinfeld-module comparison belongs to DrinfeldModulesAndTModules:DM.7, which GS … |
| /10 | medium | missing | items /121, /216 (no item for (5.49) S_{µµ'}, Ξ_S and the … | The proof of Theorem 5.6 passes from the D-component of (id,Fr)^!ζ on Sht^{µ,µ'}_{M,d} (indexed through s: H_d(Σ) → U_d, (5.15), (5.28)) to a sum over a ∈ … |
| /11 | medium | duplicate | route 6 brief and reason; … | With Σ = R = ∅ (hence Σ∞ = ∅, r even) and µ = µ', every §4-§5 construction of YZ19 specialises to the YZ17 one: the torus shtukas (item 194 already records … |
| /12 | medium | duplicate | items /82 (and /79, /110) versus PAPER-YUN-ZHANG-17/52 and /38 and … | Item 82 (Lemma 4.2/Corollary 4.3: the torus-shtuka projection is a Bun_T(k)-torsor, via the Lang map on Bun_T) is 'missing', with the proof step 'Use the Lang … |
| /13 | medium | error | item /85 | Item 85 says only 'Push L on X′ to ν*L on X and attach the chosen split flags and the signed half-orbit inert flags'. It does not define θ^{µΣ}_Bun: which … |
| /14 | medium | error | items /217, /99, /100 | Item 217 assumes only d ≥ 3g−2+N. But [H̄♦±] ∈ H^BM_{2m}(H±) defines an endomorphism of Rf_{d,!}Q_ℓ only when M_d is smooth of pure dimension m (Proposition … |
| /15 | medium | missing | items /240, /175, /150 (no item planned at … | Two cited results used in the scope have no item. (a) Section A.3.4 and the proof of Proposition A.12 rest on global class field theory for F'/F: the existence … |
| /16 | medium | library-claim | route 8 (EtaleDualityAndPerverseSheavesPartIIIndConstructibles) …; … | The confirmed fix of RT-AREA-etale/13 was never applied to this file. The route still says 'Mathlib already provides Ind and abelianness, but not the paper's … |
| /17 | medium | error | item /11 (status planned, EDC.7) and route 5 … | Item 11's second half, that the direct image of a proper small map is the intermediate extension, is planned nowhere. EDC.5 and EDC.7 do not state the generic … |
| /18 | medium | missing | route 4 (SF.1/SF.5) and route 6 brief ('SchemeAndStackFoundations …; … | YZ19 uses YZ17's intersection theory on Deligne-Mumford stacks (Appendix A.1-A.2) as cited results, but no item records it. Only the Octahedron Lemma (item … |
| /19 | medium | error | item /196 (planned: GL2AutomorphicRepresentationsAndTransfer:R16.2, …; … | Item 196 marks as planned the normalized local period values lambda♮_x(W0,chi,s) = 1, theta♮_x(W0,W0) = 1 - q_x^{-2} (unramified) and 1 - q_x^{-1} (Steinberg). … |
| /20 | medium | other | research/blueprint/papers/PAPER-YUN-ZHANG-19.review.json routes 1-9 …; … | After FIX-RT-PAPER-YUN-ZHANG-17 the result has 8 routes, but the review still lists verdicts for 9 old routes. accepted_routes keeps result route n whenever … |
| /21 | medium | other | routes 5 and 8 (parent EtaleDualityAndPerverseSheaves) and the …; … | The deferral confirmed in RT-PAPER-YUN-ZHANG-17/2 for the GlobalShtukas parent also hits YZ19's two EDC Part IIs. paper_designs merges every accepted Part II … |
| /22 | medium | other | research/blueprint/papers/PAPER-YUN-ZHANG-19.md (whole report); … | The reader report was never synchronized with the review or with FIX-RT-PAPER-YUN-ZHANG-17, and it contradicts the JSON. It gives 190 items (7 library, 10 … |
| /23 | low | missing | sourceIssues (no entry), §1.2.1 p.398; … | The paper contradicts itself on the shift relating L(E,s) to L(pi,s). §1.2.1 says L(E,s) is L(pi, s+1/2). §1.3.2 and the paper's conventions give L(E,s) = … |
| /24 | low | missing | sourceIssues (no entry); … | The paper gives the one symbol ℒ_{F'/F}(pi,s1,s2) two different definitions: without L(pi,Ad,1) on p.395, and divided by L(pi,Ad,1) on p.414. Theorem 1.2 uses … |
| /25 | low | error | item /195 (proof sentence) | The proof in /195 applies [YZ17, Th. B.2] to pi_F'. As recorded in YZ17/37, that theorem needs a cuspidal representation of GL_n. pi_F' is not cuspidal when pi … |
| /26 | low | missing | item /190 (prerequisites) | The statement of Conjecture 1.6 in /190 uses Drinfeld's GL2 Langlands correspondence (rho_pi) and the identity L(pi_F', s-1/2) = det(1 - q^{-s}Fr / W'_pi). No … |
| /27 | low | missing | item /16 (proofSteps) and the ShtukaSpecialCyclesAndHigherSiegelWeil … | The proof of Theorem 2.2 uses the spectral decomposition of K_f at Iwahori level K = Iw_S × K^S, summing over all Hecke characters chi, including chi ramified … |
| /28 | low | error | prerequisites[1] (Varshavsky 2004), field 'why' | The prerequisite says Varshavsky's Proposition 2.16(a) supplies 'separatedness'. The paper uses it only for the Deligne–Mumford property. Separatedness comes … |
| /29 | low | duplicate | sourceIssues E45 and E71; … | E71 records the same misprint as E45: the reference to the nonexistent 'Lemma 3.19(3)' in the definition of /κ − κ′/ on p. 436. E45 already covers both that … |
| /30 | low | error | item /119 proofSteps[1], item /121 proofSteps[1], item /148 …; … | The reviewed outcome of E20 is that Lemma 5.19 needs only d ≥ max{2g′−1+N, 2g+min(N+,N−)}, which follows from the printed bound. So Theorems 5.6, 5.20 and 7.4 … |
| /31 | low | error | items /185-/189 (prerequisites) | Item 185 (Definition 5.7, H_d(Σ)) lists item 101 (the master diagram) as its prerequisite, but the dependency runs the other way. Item 101's statement is built … |
| /32 | low | missing | item /107 (Proposition 5.16) | The paper proves Proposition 5.16 for µ1 = µ′1 = 1 ('the other case is similar') and for µ1 = 1, µ′1 = −1 only. I checked the two omitted cases (µ1 = µ′1 = −1, … |
| /33 | low | error | item /120 (locator); … | (a) Item 120's locator '§5.5' names a subsection that does not exist. §5 ends with §5.4.4, and the Lefschetz formula is applied at (5.52), p. 491. (b) Items 91 … |
| /34 | low | error | item /163 (also /223); … | Lemma A.5's normalization 'varpi_x^{-1} /-> O_X(x)#' contradicts the map in its own proof. It also contradicts the way Section 6.2.3-6.2.4 uses the … |
| /35 | low | missing | item /127 (used by /146, /147) | Proposition 7.3 uses two facts that no item states. First, the square (6.4) is Cartesian over A♦_d; the paper attributes this to Proposition 6.2(3), but 6.2(3) … |
| /36 | low | error | item /136 (Lemma 6.4), as used by /133, /224, /226 | Item /136 states (6.9) as a sum over X_{D,γ̃} for every γ̃ in GL2(F). For inv(γ̃) ∈ {0, ∞}, however, J(γ̃,...) is a regularised integral, and X_{D,γ̃} has … |
| /37 | low | missing | item /126 (needed by /132 through /227) | Theorem 6.3(2) (item /132) has no degree hypothesis. Its proof applies the Lefschetz trace formula, which item /227 states for a proper map from a … |
| /38 | low | error | item /174 ((A.11)); … | Item /174 asserts that (A.11), 1 → Pic_X → Pic_{X′} → Pic_{X′} → Pic^{√R}_X → 1, is 'exact in its 2-categorical sense'. As a sequence of four Picard stacks it … |
| /39 | low | other | route 5 brief, route 6 brief, route 7 brief | Several imports are not named by title and id, as PROTOCOL section 16 requires, and one locator is wrong. Route 5: 'SF.1 stack geometry, SF.5 ...' has no … |
| /40 | low | library-claim | item /9 (planned at Tau Ceti AlgebraicCurves layer 7) | Item 9 cites no library support, but Tau Ceti at the pin already has the different divisor and the tame different theorem. For the tame double cover these give … |

## Notes for the fix job

- **One owner for the Hecke and Eisenstein machinery (/1).** Move the Iwahori-level Eisenstein ideal, Hecke
  correspondences, horocycle analysis and Eisenstein/cuspidal decomposition (items 15, 42–78, 179–182, 200–203) to the
  ShtukaSpecialCyclesAndHigherSiegelWeil Part II, stated once in YZ19’s generality. Keep only the generic level and
  shtuka-stack items in the GS source route, and correct both reasons and the Part II brief.
- **Apply the confirmed fixes already written.** Apply RT-AREA-etale/13’s edits to items 63, 64 and 176 and route 8
  (/16). Carry over the YZ17 red team’s cuspidal/Eisenstein inputs (/3).
- **Statuses and hypotheses.** Correct the planned statuses (/6, /19, /17). Restore the dropped hypotheses (/2, /14,
  /5). Add the missing cited inputs as items.
- **Bookkeeping.** Renumber the review’s route verdicts and send the repaired routes to review (/20). Regenerate the
  reader report (/22).
