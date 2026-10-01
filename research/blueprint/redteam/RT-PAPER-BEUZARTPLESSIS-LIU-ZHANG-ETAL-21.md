# RT-PAPER-BEUZARTPLESSIS-LIU-ZHANG-ETAL-21

Red team of the accepted extraction PAPER-BEUZARTPLESSIS-LIU-ZHANG-ETAL-21: Raphaël Beuzart-Plessis, Yifeng Liu, Wei
Zhang and Xinwen Zhu, *Isolation of cuspidal spectrum, with application to the Gan–Gross–Prasad conjecture*, Annals of
Mathematics 194 (2021), 519–584 (arXiv 1912.07169v3). Issue #4081.

Red team: Claude Code, session `cc-c2c06b`, 1 October 2026. I did not write or review:
- the extraction (`cc-39fac3`, PR #2043);
- its review (`cc-2aeb03`, PR #2548).

Disclosures. Some findings cite, as existing owner decisions or sharers, deliverables of this session:
FIX-RT-PAPER-GAN-ICHINO-18 (#5231), FIX-RT-PAPER-TREUMANN-VENKATESH-16 (#5236), FIX-RT-PAPER-KALETHA-16 (#5200),
RT-PAPER-LESLIE-25 (#5341), RT-PAPER-ZHANG-21 (#5405) and RT-PAPER-ALLEN-ETAL-23 (#5382). The findings that cite them
(/2, /8, /9, /19) carry coordinator notes; no finding rests on my verdicts.

**Result: 35 findings, 1 high, 17 medium and 17 low.**

## Method

**The source.** arXiv 1912.07169v3 (<https://arxiv.org/pdf/1912.07169v3>), the version the extraction read, was
re-downloaded on 2026-10-01 with its LaTeX source; its SHA-256 (`f2834146…ac13`) equals the extraction's. It has 48
pages. The Annals version was not read.

**The passes.** Four parallel passes were run by this session.
- Three read all 48 pages: §§1–2, §3, and §4 with Appendix A and the references.
- One checked the three routes, the 7 planned statuses and the briefs against the atlas, `make_queue.py`, other papers'
  accepted routes, earlier red teams and the pinned libraries.

**Merging.** I merged strong multiplicity one, isobaric sums and Ramakrishnan (five findings), the GGP / Jacquet–Rallis
mutual imports, and eight findings that two passes each reported.

**What I re-verified myself.** The high finding: route 2's "Additional imports" of the GGP roadmap, against the accepted
PAPER-LIU-ETAL-22 route 17, which proposes that roadmap and imports JacquetRallisRelativeTraceComparison, and which
carries PAPER-LIU-ETAL-22/cited-BPLZZ-ggp.

The full list of what was checked is in the result's `checked` field.

## The high findings

### /1 — error

**Where.** route 3 brief; route 2 brief; PAPER-BEUZARTPLESSIS-LIU-ZHANG-ETAL-21/5;
PAPER-BEUZARTPLESSIS-LIU-ZHANG-ETAL-21/63; PAPER-BEUZARTPLESSIS-LIU-ZHANG-ETAL-21/58; the report
(PAPER-BEUZARTPLESSIS-LIU-ZHANG-ETAL-21.md), 'Routes';
PAPER-BEUZARTPLESSIS-LIU-ZHANG-ETAL-21/unique-quasi-split-pair-V-star; PAPER-BEUZARTPLESSIS-LIU-ZHANG-ETAL-21/9;
PAPER-BEUZARTPLESSIS-LIU-ZHANG-ETAL-21/42; PAPER-BEUZARTPLESSIS-LIU-ZHANG-ETAL-21/admissible-hermitian-pairs-V-S; route
3

**Claim.** The Gan–Gross–Prasad roadmap and the Jacquet–Rallis Part II are told to import each other. Theorem 1.8
(1)⇒(2) with Remark 4.17, which sits between them, has two owners. (a) Route 2's brief makes the Jacquet–Rallis Part II
import GanGrossPrasadConjecturesForClassicalGroups. So does PAPER-BEUZARTPLESSIS-CHAUDOUARD-ZYDOR-22 route 2.
make_queue.paper_designs merges every part-ii route with parent EndoscopicTransferAndUnitaryTraceComparison into one
job, DESIGN-EndoscopicTransferAndUnitaryTraceComparisonPartII. (b) The GGP roadmap is one design job,
DESIGN-GanGrossPrasadConjecturesForClassicalGroups, made from five accepted routes: JIANG-ZHANG-20 r1, this paper's r3,
LIU-ETAL-22 r17, BEUZARTPLESSIS-CHAUDOUARD-ZYDOR-22 r4 and NELSON-VENKATESH-21 r2. Of these, PAPER-LIU-ETAL-22's
accepted route 17 tells the design to 'Import JacquetRallisRelativeTraceComparison'. It also routes two items to the GGP
roadmap: PAPER-LIU-ETAL-22/cited-BPLZZ-ggp, which is this paper's Theorem 1.8 with Remark 4.17 (items 5 and 63, routed
here to route 2), and PAPER-LIU-ETAL-22/lemma-8-2-1, which is derived from them. The two designs therefore form a
dependency cycle, and the same theorem is planned in both. (c) Route 3's brief does not rule this out. It says only that
the proofs 'belong to the consumer'. Its correction, 'the existence of weak base change in Remark 1.7 is for π cuspidal
automorphic, as in Theorem 4.14 (E11, E45)', asks the GGP design to carry the existence statement of Remark 1.7, which
is Theorem 4.14(1): item 58, owned by route 2. Also: Two route-3 items are stated with objects that only route 2
defines, while route 2 imports route 3. (a) unique-quasi-split-pair-V-star says that there is a unique V* ∈ 𝔙 with
G^{V*} quasi-split, and that 'V* lies in 𝔙_(S) for every finite set S'. Here 𝔙 is defined in item 42 and 𝔙_(S) in
admissible-hermitian-pairs-V-S, both in route 2. (b) Item 9 asserts the injectivity of 'Temp_{H^V_□}(G^V_□) →
Temp(G^{qs}_□)/stab', with G^V and H^V from item 42. As routed, the GGP roadmap must either import the Jacquet–Rallis
Part II, which closes a cycle, or define these objects a second time. (c) Item 42 itself defines again what the GGP
roadmap owns. 𝔙, the pairs (V_n, V_n ⊕ Ee) of hermitian spaces with their unitary groups, is the set of relevant pairs
of pure inner forms for U(n) × U(n+1): the codimension-one unitary case of PAPER-JIANG-ZHANG-20/relevant-pairs.
PAPER-LIU-ETAL-22 route 17 also asks the GGP design to 'Cover the relevant pairs (V_n, V_{n+1} = V_n ⊕ unit line)'.

**Evidence.** Route 2 brief: 'Additional imports: The Gan–Gross–Prasad conjectures for classical groups
(GanGrossPrasadConjecturesForClassicalGroups, proposed by PAPER-JIANG-ZHANG-20 and extended by this extraction) for
hermitian representations, weak base change, the global and refined (Ichino–Ikeda) conjectures and the local
Gan–Gross–Prasad theorems'. PAPER-LIU-ETAL-22 route 17 (accepted): 'Import JacquetRallisRelativeTraceComparison (the
Part II of EndoscopicTransferAndUnitaryTraceComparison proposed for the global Gan–Gross–Prasad conjecture) and
AutomorphicLFunctionsAndLocalFactors AL.3'. That route's items include PAPER-LIU-ETAL-22/cited-BPLZZ-ggp, 'Global
Gan–Gross–Prasad for U(n) × U(n+1) [6, Theorem 1.8, Remark 4.17] (as used)', and lemma-8-2-1, whose note says 'it is the
direction (1)⇒(2) of [6, Theorem 1.8] together with [6, Remark 4.17]'. PAPER-BEUZARTPLESSIS-CHAUDOUARD-ZYDOR-22 route 2
imports 'The Gan–Gross–Prasad conjectures for classical groups (GanGrossPrasadConjecturesForClassicalGroups) for
Hermitian Arthur parameters, base change, local periods and the local conjecture'. The paper (p. 4, Remark 1.7): 'The
weak automorphic base change ... of π exists as long as there exist infinitely many places v of F split in E such that
π_v is generic', which is Theorem 4.14(1) (p. 39). No earlier red team records this cycle. Also: Item 42 (route 2): '𝔙
is the set of isomorphism classes of pairs V = (V_n, V_{n+1}) of nondegenerate hermitian spaces over E with V_n of rank
n and V_{n+1} = V_n ⊕ E·e, e of norm 1; ... For V ∈ 𝔙: G^V_n = U(V_n), ... H^V ⊆ G^V the graph of the natural
embedding'. admissible-hermitian-pairs-V-S (route 2): '𝔙_(S) is the set of V = (V_n, V_{n+1}) ∈ 𝔙 such that G^V_v is
unramified for every prime v of F not in S.' PAPER-JIANG-ZHANG-20/relevant-pairs (accepted route 1 to the GGP roadmap):
'if (W, q) ⊂ (V, q) is an 𝔪-dimensional non-degenerate subspace whose orthogonal complement (W⊥, q) is F-split of odd
dimension ... then (G_n, H_m) is a relevant pair [GGP12, §2] ... Over a number field relevance is defined in the same
way.'

**Fix.** 1. In route 3's brief, add this text. 'This roadmap states the definitions and the conjectures only. It does
not import the Jacquet–Rallis Part II (Endoscopic transfer and unitary trace comparison, Part II, queued as
EndoscopicTransferAndUnitaryTraceComparisonPartII), which imports it. The proved cases are owned there: Theorems
1.8–1.10, Remark 4.17 and the existence of weak base change (Theorem 4.14(1), stated in Remark 1.7), items 5–7, 58 and
63. Remark 1.7 appears here only as a pointer to that roadmap.' 2. Move the E11 correction from route 3's brief to route
2's brief. 3. In the report's 'Routes' section, add a note for the maintainer. PAPER-LIU-ETAL-22 route 17 imports
JacquetRallisRelativeTraceComparison into the GGP roadmap. Together with this extraction's route 2 and
PAPER-BEUZARTPLESSIS-CHAUDOUARD-ZYDOR-22 route 2, which import the GGP roadmap into the Jacquet–Rallis Part II, that
closes a cycle. LIU's items cited-BPLZZ-ggp and lemma-8-2-1 restate or derive from items 5 and 63. They should be
imported from the Jacquet–Rallis Part II by a roadmap downstream of it, and the import should be removed from LIU's
route-17 brief. Also: 1. Make the GGP roadmap the owner of 𝔙, G^V, H^V and the localisation 𝔙 → 𝔙_v. 2. In item 42, keep
the general-linear side and the matching: G′, H′_1, H′_2, η, regular semisimple orbits, B′, B^V and matching pairs. Say
that 𝔙, G^V and H^V are imported from GanGrossPrasadConjecturesForClassicalGroups, as the ℓ = 0 unitary relevant pairs
of PAPER-JIANG-ZHANG-20/relevant-pairs. 3. Split unique-quasi-split-pair-V-star. The existence and uniqueness of V* stay
in route 3. The clause 'V* lies in 𝔙_(S) for every S' moves to route 2, into admissible-hermitian-pairs-V-S or a new
item. 4. Leave item 9 in route 3; it then uses the GGP roadmap's own G^V and H^V.

## All findings

| Finding | Severity | Kind | Where | Claim (abridged) |
|---|---|---|---|---|
| /1 | high | error | route 3 brief; … | The Gan–Gross–Prasad roadmap and the Jacquet–Rallis Part II are told to import each other. Theorem 1.8 (1)⇒(2) with Remark 4.17, which sits between them, has … |
| /2 | medium | duplicate | PAPER-BEUZARTPLESSIS-LIU-ZHANG-ETAL-21/56 (route 2); … | Strong multiplicity one for GL_n and the isobaric sums it concerns are sent to three different new roadmaps, although accepted routes already give them one … |
| /3 | medium | duplicate | PAPER-BEUZARTPLESSIS-LIU-ZHANG-ETAL-21/55; … | Flicker's criterion relating distinction to Asai poles (item 55) and the Asai-pole characterisation of hermitian cuspidal representations … |
| /4 | medium | error | PAPER-BEUZARTPLESSIS-LIU-ZHANG-ETAL-21/60 (status 'planned' at …; … | ML.5 does not plan the Ginzburg–Rallis–Soudry descent, and no accepted route has added the case this paper needs. The item is marked planned at ML.5, but … |
| /5 | medium | error | PAPER-BEUZARTPLESSIS-LIU-ZHANG-ETAL-21/16 (status 'planned' at …; … | Item 16 is planned at AF.1 as a whole, but AF.1 does not plan its first clause, the Harish-Chandra isomorphism Z(g) ≅ C[h*_C]^W for a reductive g. Route 1's … |
| /6 | medium | duplicate | PAPER-BEUZARTPLESSIS-LIU-ZHANG-ETAL-21/20 (parts (a) and (b)); … | Real representation theory that accepted decisions give to AutomorphicFormsOnReductiveGroups is sent to the AutomorphicSpectralTheory Part II instead: - … |
| /7 | medium | error | PAPER-BEUZARTPLESSIS-LIU-ZHANG-ETAL-21/normalized-parabolic-induction …; … | The item is planned only for its non-archimedean and adelic cases. The paper defines I^G_P(σ) for admissible representations of P(R) over any ring R for which … |
| /8 | medium | duplicate | PAPER-BEUZARTPLESSIS-LIU-ZHANG-ETAL-21/treves-separately-continuous-bi …; … | Route 1 plans two general foundations that accepted routes already give to more foundational owners. (a) treves-separately-continuous-bilinear-maps has two … |
| /9 | medium | missing | route 3 brief; … | The route-3 items need the local–global classification of hermitian forms over E/F (Landherr's Hasse principle and the local invariants), but the GGP roadmap's … |
| /10 | medium | duplicate | PAPER-BEUZARTPLESSIS-LIU-ZHANG-ETAL-21/order-of-entire-function-and-we …; … | The order of an entire function, the canonical (Weierstrass) product Ψ_{Λ,p} = z^δ∏E_p(z/λ) with the elementary factors E_p, and Lemma 2.2 (the canonical … |
| /11 | medium | library-claim | PAPER-BEUZARTPLESSIS-LIU-ZHANG-ETAL-21/11 | Item 11 (Mul(S), the C-linear maps μ⋆ with μ⋆(f∗g) = (μ⋆f)∗g = f∗(μ⋆g)) is marked missing with no library reference. Mathlib at 082e2d3 has exactly this notion … |
| /12 | medium | missing | PAPER-BEUZARTPLESSIS-LIU-ZHANG-ETAL-21/26 (Proposition 2.24); … | The proof of Proposition 2.24, and with it Theorem 2.13 (= Theorem 1.4), defines μ⋆f for f ∈ S(G) as the limit of μ⋆f_n for a sequence f_n in C_c^∞(G)_{(K)} … |
| /13 | medium | error | PAPER-BEUZARTPLESSIS-LIU-ZHANG-ETAL-21/lattice-in-complex-vector-space; … | The item states the paper's uncorrected definition of a lattice ('a subgroup L of U such that L ⊗_Z C → U is injective'), although the extraction's own E15 … |
| /14 | medium | missing | PAPER-BEUZARTPLESSIS-LIU-ZHANG-ETAL-21/4 (Definition 1.6); … | Definition 1.6 compares Π_v with 'the (split) local base change of π_v' at places v of F split in E, and the same local map is used for BC(π) throughout §4. No … |
| /15 | medium | error | PAPER-BEUZARTPLESSIS-LIU-ZHANG-ETAL-21/def-3-9-cuspidal-data; … | Definition 3.9 defines the cuspidal data 𝔇(G, ω)^♡, with the standard-Levi notation of §3.2 (P_M, Z_M, Ω_M(ω), M(A_F)^1, a_M, ξ_s, σ_s). The extraction marks … |
| /16 | medium | missing | PAPER-BEUZARTPLESSIS-LIU-ZHANG-ETAL-21/9; … | Item 9 states the local Gan–Gross–Prasad theorem only for v archimedean or split in E, but its locator includes the proof of Theorem 1.10 (p. 43), and that … |
| /17 | medium | missing | PAPER-BEUZARTPLESSIS-LIU-ZHANG-ETAL-21/40; … | The proof of Proposition A.1 uses the closed graph theorem for Fréchet spaces twice: for the continuity of μ_1⋆ and μ_2⋆, and for the separate continuity of … |
| /18 | medium | missing | PAPER-BEUZARTPLESSIS-LIU-ZHANG-ETAL-21/57; … | In situation (b) of Proposition 4.13, quasi-cuspidality comes from a supercuspidal matrix coefficient at a split prime v_0, not from a multiplier. No item … |
| /19 | low | other | route 1 (roadmap, title); … | The routes and the report name roadmaps by ids the queue never creates, and they misdescribe what the queue does. make_queue.paper_designs keys every part-ii … |
| /20 | low | error | PAPER-BEUZARTPLESSIS-LIU-ZHANG-ETAL-21/32 (planned at …; … | Item 32's planned status and note rest on an identification that a confirmed red team rejected. The item states the coarse decomposition (3.1) by cuspidal … |
| /21 | low | other | PAPER-BEUZARTPLESSIS-LIU-ZHANG-ETAL-21/delorme-1984-multipliers-of-com …; … | On p. 3 the paper writes, for G = G(R) with G connected reductive over R, that 'if G has no compact factors, then the only W-invariant holomorphic functions on … |
| /22 | low | error | PAPER-BEUZARTPLESSIS-LIU-ZHANG-ETAL-21/22; … | Item 22's note says 'Lemma 2.21's proof has /u/ = 1 where /u/ ≤ 1 is needed (sourceIssues E4).' The review revised E4 to the double bars only and found the /u/ … |
| /23 | low | error | PAPER-BEUZARTPLESSIS-LIU-ZHANG-ETAL-21/jacquet-shalika-classification- …; … | Two locators are wrong or duplicated. The Jacquet–Shalika item gives the citation [JS81, Theorem 4.4] as 'also §1.1, before Theorem 1.3, p. 3', but it is on p. … |
| /24 | low | missing | sourceIssues (a new sourceIssue); … | The proof of Proposition 3.15 applies the multiplier identity π(μ⋆f) = μ(χ_π)π(f) to Ind^G_{P_M}(σ_s) for every s ∈ a*_{M,C}. The end of the proof of … |
| /25 | low | error | sourceIssues E31 | E31's correction ends with a gloss: '(i.e. either F = Q and G is split, or G is semisimple and anisotropic over F)'. Its review reason repeats it: 'i.e. F = Q … |
| /26 | low | missing | sourceIssues (two new sourceIssues) | Two misprints in §3 are not recorded. (1) The opening of §3.3 (p. 25) announces the construction of an element called μ^χ_∞, with μ^χ_∞(χ_∞) ≠ 0, such that … |
| /27 | low | missing | §3.1–§3.4 (no item); … | Two standard results that §3 uses throughout have no item of their own. They appear only inside definition and construction items that are routed as missing to … |
| /28 | low | missing | PAPER-BEUZARTPLESSIS-LIU-ZHANG-ETAL-21/38 (cited inputs without items) | Remark 3.20 strengthens Theorem 3.19 using two cited results, and neither has an item of its own. Item 38 folds both into its own statement, with status … |
| /29 | low | error | route 1 brief | Route 1's brief states Theorems 3.6, 3.7 and 3.19 without the standing data of §3.1, which are what make 'T-multiplier of S(G(A_F))_K' meaningful. The missing … |
| /30 | low | error | PAPER-BEUZARTPLESSIS-LIU-ZHANG-ETAL-21/arthur-admissible-maximal-compa …; … | The item 'Maximal compact subgroups admissible relative to M_0 (Arthur)' is marked missing and routed to route 1. Its content is already planned elsewhere. At … |
| /31 | low | error | sourceIssues E9; … | E9's reason, and the report's summary of E9 ('swapped factors and K-type subscripts'), misdescribe the misprint. If both the factors and their subscripts were … |
| /32 | low | error | PAPER-BEUZARTPLESSIS-LIU-ZHANG-ETAL-21/33 | Item 33 is cited for p. 38, but its statement is weaker than the form used there. It assumes a fixed finite set of K_∞-types, while p. 38 fixes only the … |
| /33 | low | missing | sourceIssues (no entry); … | An unrecorded misprint: Theorem 4.14(3) is stated for (G•, T_0)-CAP, but its proof argues from '(G•, T)-CAP'. The meaning is unaffected. By Definition 3.4, CAP … |
| /34 | low | other | route 2; … | Route 2's area is 'modular', which is not a galaxy id. The extraction's own route reason says so and asks the review to correct it, but the accepted review … |
| /35 | low | other | sourceIssues E45 (and E19); … | E45, located on p. 39, and E19 have affects 'a stated result', yet the extraction has no sourceVersions list. PROTOCOL section 18 requires one, and … |

## Notes for the fix job

- **The cycle.** Make one direction of the GGP / Jacquet–Rallis dependency: either the GGP roadmap imports the
  Jacquet–Rallis Part II (as PAPER-LIU-ETAL-22 says) and route 2 drops its GGP import, or the reverse; restate the
  route-3 items without route-2 objects, and give Theorem 1.8 one owner.
- **Owners.** Import strong multiplicity one, isobaric sums and Ramakrishnan from AL.3, Flicker/Asai from the Asai Part
  II, and real representation theory from AF, as the accepted routes decided.
- **Statuses and inputs.** Correct items 16, 60 and the normalised induction to their true planned extent, and add the
  missing inputs (tempered p-adic local GGP, Fréchet closed graph theorem, supercuspidal matrix coefficients).
