# RT-PAPER-HEUER-25

Red team of the accepted extraction PAPER-HEUER-25: Ben Heuer, *A p-adic Simpson correspondence for smooth proper rigid
varieties*, Invent. Math. 240 (2025), 261–312 (arXiv 2307.01303v3). Issue #5065.

Red team: Claude Code, session `cc-c2c06b`, 1 October 2026. I did not write or review:
- the extraction (`cc-fb70e5`, PR #4343);
- its review (`cc-58621d`, PR #4717).

**Disclosures.** Some findings cite, as existing owner decisions, work of this session:
- PAPER-BHATT-MORROW-SCHOLZE-18 route 14, which my FIX-RT-PAPER-BHATT-MORROW-SCHOLZE-18 (#5263) set;
- PAPER-ZAVYALOV-25 route 7, a paper I red-teamed (RT-PAPER-ZAVYALOV-25, #5344).

The findings that cite them (/1, /7, /26) carry coordinator notes. The high finding /1 rests on the stage contracts, not
on those routes.

**Result: 45 findings, 2 high, 19 medium and 24 low.**

## Method

**The source.** arXiv 2307.01303v3 (<https://arxiv.org/pdf/2307.01303v3>), 34 pages, dated 21 January 2025, was
re-downloaded on 2026-10-01. Its SHA-256 (`df8caac5…18943`) equals the extraction's `sourceVersions` entry.

**The published version was not available.** The Springer text could not be fetched: the PDF link, the article page and
the DOI all return a JavaScript challenge, as they did for the extraction's review. So the findings check statement
numbers and content against v3. The published page numbers in the extraction's locators are unchecked.

**The passes.** Four parallel passes were run by this session.
- Three read all 34 pages: §§1–2, §3, and §§4–5 with the references.
- One checked the six routes, the 15 prerequisites, the planned and library statuses and the briefs. It compared them
  with the atlas, the packets, other accepted paper extractions and the pinned libraries.

**Merging.** Nine pairs of findings that two passes each reported were merged.

**What I re-verified myself.** Both high findings.
- /2: v3 Corollary 2.19 (p. 13), on an Enriques surface with p = 2. Pic⁰ = 0, while H¹_ét(X, μ₂) = Pic[2] = Z/2.
- /1: the stage requirements in the PadicHodgeTheory and CohomologyComparisons extracts. P8 requires CP.3, and CP.3
  plans the Hodge–Tate spectral-sequence comparison, whose E₂ terms are H^i(X, R^jν_*Ô).

The full list of what was checked is in the result's `checked` field.

## The high findings

### /1 — error

**Where.** research/blueprint/papers/PAPER-HEUER-25.result.json route 1 (source PadicHodgeTheory:P8) and item /6; route
4 brief ('the primitive comparison, R^nν_*Ô and pro-étale base change from PadicHodgeTheory P8')

**Claim.** Route 1 sends item 6 (R^nν_*Ô = Ω^n(−n) over the algebraically closed K, Scholze's finiteness and the
primitive comparison) to the proper-comparison suffix PadicHodgeTheory:P8, which requires CohomologyComparisons CP.3 and
CP.4. But CP.3 itself plans the Hodge–Tate spectral-sequence comparison for proper smooth X over C, and that spectral
sequence is the Leray sequence of ν, whose E_2 terms are H^i(X, R^jν_*Ô) and whose abutment is identified with étale
cohomology by the primitive comparison. So CP.3 consumes item 6, and owning it at P8 makes CP.3 → P8 → CP.3 a cycle. For
this reason PAPER-BHATT-MORROW-SCHOLZE-18 route 14, after RT-PAPER-BHATT-MORROW-SCHOLZE-18/3, sends Scholze's finiteness
(BMS-18/085) and the B_dR^+ primitive comparison (BMS-18/197) to P8:local-rational, saying that 'P8 is downstream of
AI.4 and CP.3'. Route 1's reason cites that route as a precedent for P8. It is the opposite precedent, and the two
routes now give the same theorems two owners. Coordinator note: PAPER-BHATT-MORROW-SCHOLZE-18 route 14 was set by this
session's FIX-RT-PAPER-BHATT-MORROW-SCHOLZE-18 (PR #5263), and PAPER-ZAVYALOV-25 route 7 was red-teamed by this session
(RT-PAPER-ZAVYALOV-25, PR #5344). Both are cited only as existing owner decisions; the finding rests on the stage
contracts: PadicHodgeTheory:P8 requires CohomologyComparisons:CP.3, and CP.3 plans the Hodge–Tate spectral-sequence
comparison whose E_2 terms are H^i(X, R^jν_*Ô).

**Evidence.** research/blueprint/atlas/roadmaps/PadicHodgeTheory.json: stage PadicHodgeTheory:P8 has requires
['CohomologyComparisons:CP.3', 'CohomologyComparisons:CP.4', 'PadicHodgeTheory:P8:local-rational'], and its text says
'P8's later proper-comparison application consumes this CP.3 theorem, not conversely'.
research/blueprint/atlas/roadmaps/CohomologyComparisons.json, CP.3: 'For a proper smooth adic space X/C ... Prove
filtration strictness and the Hodge–Tate/de Rham spectral-sequence comparisons in characteristic zero'. Scholze,
Perfectoid spaces: a survey (arXiv:1303.5948, PDF p. 21), proof of Theorem 3.20: 'we use the projection ν : X_proét →
X_ét, and the spectral sequence E_2^{ij} = H^i(X_ét, R^jν_*Ô_X) ⇒ H^{i+j}(X_proét, Ô_X) = H^{i+j}_ét(X, Q_p) ⊗ C; this
reduces us to the next proposition' (Proposition 3.23, R^jν_*Ô = Ω^j(−j)), after the primitive comparison 'H^i_ét(X,
Q_p) ⊗ C ≅ H^i(X_proét, Ô_X)'. Item 6's own note says 'the Hodge–Tate spectral-sequence comparison is planned at
CohomologyComparisons CP.3'. PAPER-BHATT-MORROW-SCHOLZE-18.result.json route 14 has stages
['PadicHodgeTheory:P8:local-rational'] and items 085 and 197, with the reason: 'P8 is downstream of AI.4 and CP.3, so
these items are routed to P8:local-rational ... PAPER-SCHOLZE-13 route 1 ... should be restricted to P8:local-rational'.
Stage reachability over data/atlas.json stageEdges plus research/blueprint/links and accepted RS links: CP.3 → P8 is an
edge, and P8 does not reach CP.3.

**Fix.** Split route 1. New route: {route: source, roadmap: PadicHodgeTheory, stages:
['PadicHodgeTheory:P8:local-rational'], items: ['PAPER-HEUER-25/6'], reason: 'R^nν_*Ô = Ω̃^n over the algebraically
closed K (survey Proposition 3.23), Scholze's finiteness and the primitive comparison are inputs of
CohomologyComparisons CP.3 (the Hodge–Tate spectral sequence is the Leray sequence of ν, with E_2 = H^i(X, R^jν_*Ô)) and
of AInfCohomology AI.4. P8 requires CP.3, so they belong to P8:local-rational, with PAPER-BHATT-MORROW-SCHOLZE-18 route
14 (items 085, 197) and the widening of that stage which that route requests. PAPER-ZAVYALOV-25 route 7 and
PAPER-SCHOLZE-13 route 1 should follow.'} Keep item 44 alone at PadicHodgeTheory:P8. In the route 4 brief, replace 'the
primitive comparison, R^nν_*Ô and pro-étale base change from PadicHodgeTheory P8' with 'R^nν_*Ô and the primitive
comparison from P-adic Hodge theory and geometric comparison (PadicHodgeTheory P8:local-rational), pro-étale base change
from PadicHodgeTheory P8'. Update the summary and report to match.

### /2 — error

**Where.** research/blueprint/papers/PAPER-HEUER-25.result.json item /PAPER-HEUER-25/24; sourceIssues (new)

**Claim.** Item 24 says '[p] : Pic^0_{X′} → Pic^0_{X′} is a finite étale H^1_ét(X′, μ_p)-torsor'. This copies Corollary
2.19's 'More precisely' clause, which is false whenever NS(X′) has p-torsion. The kernel of [p] on Pic^0_{X′} is
Pic^0_{X′}[p] = Pic^0_{X′} ∩ H^1_ét(X′, μ_p), which can be a proper subgroup. Counterexample: X = Y^an for an Enriques
surface Y over K, B = O_X (so X′ = X) and p = 2. Then Pic^0_{X′} = 0, since H^1(Y, O) = 0 and char K = 0, but H^1_ét(X,
μ_2) = Pic(Y)[2] = Z/2. The proof's surjectivity step is also incomplete: the Kummer sequence shows Pic^0 ⊆
[p](Pic_{X′}), not Pic^0 ⊆ [p](Pic^0). The 'finite étale' conclusion, which is all that is used later, remains true.

**Evidence.** v3 p. 13, Corollary 2.19: 'If PicX′ = R1π′∗O× is representable, then [p] : Pic0X′ → Pic0X′ is finite
étale. More precisely, it is an étale torsor under H1ét(X′, µp).' Proof: 'By Proposition 2.18, the last map goes from a
rigid group to a constant group, so it sends Pic0X′ to 0. Hence [p] is surjective on Pic0X′.' For the Enriques surface:
the Kummer sequence gives 0 → K^×/K^×2 = 0 → H^1(Y, μ_2) → Pic(Y)[2] = Z/2 → 0. Pic_Y is étale, so Pic^0_Y is trivial.
Finite étale cohomology is unchanged by analytification, and Pic_{X} = (Pic_Y)^an by §2.2.

**Fix.** Replace the clause in item 24 by: '[p] : Pic^0_{X′} → Pic^0_{X′} is finite étale; it is a torsor under
Pic^0_{X′}[p] = Pic^0_{X′} ∩ H^1_ét(X′, μ_p), a subgroup of the finite group H^1_ét(X′, μ_p). On all of Pic_{X′}, [p]
has kernel H^1_ét(X′, μ_p), and its image is an open and closed subgroup containing Pic^0_{X′}.' Add a sourceIssue (kind
error, affects nothing). Printed: 'More precisely, it is an étale torsor under H^1_ét(X′, μ_p)'. Correction: 'it is an
étale torsor under Pic^0_{X′}[p] ⊆ H^1_ét(X′, μ_p)'. Repair the surjectivity step as follows: [p] is étale (Fargues,
Lemme 1), hence open (Huber, Prop. 1.7.8), so [p](Pic^0) is an open subgroup of the connected group Pic^0. An open
subgroup is also closed, so it is all of Pic^0.

## All findings

| Finding | Severity | Kind | Where | Claim (abridged) |
|---|---|---|---|---|
| /1 | high | error | research/blueprint/papers/PAPER-HEUER-25.result.json route 1 (source …; … | Route 1 sends item 6 (R^nν_*Ô = Ω^n(−n) over the algebraically closed K, Scholze's finiteness and the primitive comparison) to the proper-comparison suffix … |
| /2 | high | error | research/blueprint/papers/PAPER-HEUER-25.result.json item …; … | Item 24 says '[p] : Pic^0_{X′} → Pic^0_{X′} is a finite étale H^1_ét(X′, μ_p)-torsor'. This copies Corollary 2.19's 'More precisely' clause, which is false … |
| /3 | medium | error | research/blueprint/papers/PAPER-HEUER-25.result.json item /1 (status …; … | Item 1 counts the affinoid perfectoid basis of X_proét ([36, Cor. 4.7, Prop. 4.8]) and Ô^+ as planned at P8:local-rational. The review replaced AInfCohomology … |
| /4 | medium | error | research/blueprint/papers/PAPER-HEUER-25.result.json item /7 …; … | Item 7 states Faltings's extension 0 → O → E → ν*Ω̃^1_X → 0 on X_proét with no hypothesis, for any smooth X over the algebraically closed K. Remark 2.17, the … |
| /5 | medium | error | research/blueprint/papers/PAPER-HEUER-25.result.json route 2 (source … | Route 2 puts all of item 2 in D2: the definition of a pro-étale vector bundle (a finite locally free Ô-module on Scholze's flattened X_proét of a rigid space) … |
| /6 | medium | error | research/blueprint/papers/PAPER-HEUER-25.result.json route 6 (part-ii … | The brief presents Heuer's Proposition 2.18 (R^m g_*(Z/n) = H^m(Z, Z/n) on smooth rigid spaces) as Bhatt–Hansen's Theorem 3.15 and tells the design job to … |
| /7 | medium | missing | research/blueprint/papers/PAPER-HEUER-25.result.json item … | The proof of Proposition 2.15 (HT_B ∘ s_{𝕏,B} = id; item 22) depends on the normalisation of R^1ν_*Ô(1) ≅ Ω^1 fixed by Scholze's survey, Lemma 3.24: the … |
| /8 | medium | missing | research/blueprint/papers/PAPER-HEUER-25.result.json (new item); … | No item records the period sheaf B_dR^+/ξ² on X_proét together with θ : B_dR^+/ξ² → Ô and the identification ker θ ≅ Ô(1). Definition 2.12 defines L_𝕏 as a … |
| /9 | medium | missing | research/blueprint/papers/PAPER-HEUER-25.result.json (new item) | Section 2.1 uses the full faithfulness of X ↦ X^◇ on smooth rigid spaces over K to 'freely switch back and forth' between rigid spaces and diamonds. The proof … |
| /10 | medium | missing | research/blueprint/papers/PAPER-HEUER-25.result.json (new item; … | The corollary in §1.1 is recorded in item 40: for connected X and x ∈ X(K), S_{𝕏,Exp} gives a fully faithful exact tensor functor Rep_K(π_1(X, x)) → Higgs … |
| /11 | medium | error | research/blueprint/papers/PAPER-HEUER-25.result.json route 4 …; … | The route 4 brief imports 'algebraic Picard functors from AbelianSchemesAndArithmeticModuli A2'. A2 plans only the degree-zero Picard functor of abelian … |
| /12 | medium | duplicate | research/blueprint/papers/PAPER-HEUER-25.result.json item …; … | Item 2 routes Kedlaya–Liu II Thm 3.5.8 to D2 as missing. Its content is that, on a perfectoid space, vector bundles for the analytic, étale, pro-étale and v … |
| /13 | medium | missing | research/blueprint/papers/PAPER-HEUER-25.result.json items …; … | Four cited inputs of §2 have no item. (1) Gerritzen [15, Satz 1 and 2] is used in Lemma 2.23 (Theorem 2.4(4)): a homomorphism G_a^+ → Pic_{X′} gives a class in … |
| /14 | medium | error | research/blueprint/papers/PAPER-HEUER-25.result.json item …; … | Item 15 copies the paper's §3.3 claim that the topological p-torsion subgroup Ĝ is "an analytic p-divisible group when [p] is surjective ([24, Prop. 6.10])". … |
| /15 | medium | error | research/blueprint/papers/PAPER-HEUER-25.result.json item …; … | Item 16 states Theorem 3.20 with the paper's hypothesis "[p] surjective on K-points" and attributes it to HWZ Thm. 6.12. HWZ Thm. 6.12 (v1 and v2) assumes G … |
| /16 | medium | missing | research/blueprint/papers/PAPER-HEUER-25.result.json items (new item); … | The proof of Lemma 3.5 cites generic freeness, [8, 051S]. No item records it: item 28 only names it in parentheses. PROTOCOL §16 says "A result the paper cites … |
| /17 | medium | missing | research/blueprint/papers/PAPER-HEUER-25.result.json items (new item); … | Theorem 3.14(2) needs étale torsors under Q^M ≅ G_a^r × G_m^s over a rigid space to be locally trivial in the analytic topology. The same input gives … |
| /18 | medium | error | research/blueprint/papers/PAPER-HEUER-25.result.json item … | Item 30 drops the hypothesis that makes Lemma 3.11 true: M must be a B-rigidifying multiset, with B an O_X-torsion-free coherent O_X-algebra on smooth proper … |
| /19 | medium | error | research/blueprint/papers/PAPER-HEUER-25.result.json item … | Item 46 states only the Cartan-Leray identification H^n_cts(Delta, V(U~)) = H^n(U_proet, V). The proof of Lemma 5.7 uses something stronger, cited as [21, … |
| /20 | medium | missing | research/blueprint/papers/PAPER-HEUER-25.result.json items …; … | The proof of Lemma 5.7 ends by citing [8, 0625]: Koszul complexes on two sequences related by an invertible matrix are isomorphic. It is used to replace … |
| /21 | medium | duplicate | research/blueprint/papers/PAPER-HEUER-25.result.json item … | Item 35 is 'missing' with an empty planned list and is routed whole to the new PadicHodgeTheory Part II. Part of it is already planned: the existence of toric … |
| /22 | low | other | research/blueprint/papers/PAPER-HEUER-25.result.json route 1 reason … | Item 6 needs finiteness of H^n_ét(X′, F_p) for the proper but possibly singular spectral variety X′ (survey Theorem 3.17). The survey proves the singular case … |
| /23 | low | error | research/blueprint/papers/PAPER-HEUER-25.result.json route 4 brief …; … | PROTOCOL §16 asks a brief to name its imports by title and id, and the review says route 4's brief does so. Several imports have no title: … |
| /24 | low | error | research/blueprint/papers/PAPER-HEUER-25.result.json route 3 reason; … | Route 3's reason says item 10's pro-étale clause left R3 'since the pro-étale site is downstream of R3', and the review gives the chain 'R3 → A1 → R4'. Neither … |
| /25 | low | error | research/blueprint/papers/PAPER-HEUER-25.result.json prerequisites … | The 'why' of the Scholze survey entry is 'Rν_*Ô and the Hodge–Tate decomposition (Prop. 3.23, Thm. 3.20)'. It leaves out the two uses that carry weight: … |
| /26 | low | other | research/blueprint/papers/PAPER-HEUER-25.md (sections 'What the atlas … | The report's body still describes the pre-review extraction and contradicts the result file. The post-review paragraph at the top does not repair it. Under … |
| /27 | low | error | research/blueprint/papers/PAPER-HEUER-25.result.json sourceIssues E7; … | E7's locator 'Proof of Theorem 3.2, after the diagram (8)' is wrong for v3, the version E7 is scoped to. Diagram (8) and the sentence are in 'Proof of Theorem … |
| /28 | low | missing | research/blueprint/papers/PAPER-HEUER-25.result.json sourceIssues …; … | Remark 2.22 prints H^0(X, B × Ω̃) where H^0(X, B ⊗ Ω̃) is meant, and the source issues do not record it. Item 23 already uses the corrected form. |
| /29 | low | missing | research/blueprint/papers/PAPER-HEUER-25.result.json sourceIssues …; … | Section 1.1 defines 'an exponential for K' as a continuous splitting of log : 1 + m_K → K. Definition 3.19, and Heuer–Werner–Zhang Def. 6.1, which Theorem 3.20 … |
| /30 | low | error | research/blueprint/papers/PAPER-HEUER-25.result.json items …; … | The proof of Proposition 2.9(iii) identifies R^nν_*𝓑^+ with R^nν_*𝓑^× through x ↦ exp(px), and R^nν_*𝓑^+ with R^nν_*𝓑 through the inclusion 𝓑^+ ⊆ 𝓑. Read … |
| /31 | low | missing | research/blueprint/papers/PAPER-HEUER-25.result.json sourceIssues …; … | In the proof of Lemma 2.16, the lift attached to Σ a_i∂_i 'sends T_i ↦ [T_i^{1/p^∞}] + a_i'. But ∂_i is dual to dT_i/T_i, so the derivation D = Σ a_i∂_i has … |
| /32 | low | other | research/blueprint/papers/PAPER-HEUER-25.result.json items … | The extraction writes B both for the coherent algebra on X_ét and for 𝓑 = ν^*B on X_proét, and B^+ for both B^+ and 𝓑^+. As a result item 18 reads 'B/p^kB^+ = … |
| /33 | low | library-claim | research/blueprint/papers/PAPER-HEUER-25.result.json item … | Item 13, the exactness of f_{ét*} for finite f (Huber Prop. 2.6.3), is marked planned at ClassicalAdicEtaleCohomology H0. But H0's stage text does not name it, … |
| /34 | low | error | research/blueprint/papers/PAPER-HEUER-25.result.json items … | Three statements omit their standing hypotheses, although PROTOCOL §16 asks for "the exact statement, with every hypothesis". The review supplied them for … |
| /35 | low | error | research/blueprint/papers/PAPER-HEUER-25.result.json items … | Both items write "X(B_dR^+/ξ²)" for the points of the lift, which should be 𝕏(B_dR^+/ξ²). X is a rigid space over K, and B_dR^+/ξ² is not a K-algebra, so … |
| /36 | low | missing | research/blueprint/papers/PAPER-HEUER-25.result.json sourceIssues …; … | The proof of Lemma 3.5 applies generic freeness ([8, 051S], which needs R to be a domain) to "any non-empty affinoid open subspace" U = Spa(R) with s/_U ≠ 0. … |
| /37 | low | missing | research/blueprint/papers/PAPER-HEUER-25.result.json sourceIssues … | A misprinted cross-reference in §3 is not recorded. The proof of Lemma 3.17 compares LP^M_𝕏 with "that of P^M_𝕏 in Theorem 3.2", but P^M_𝕏 is defined in … |
| /38 | low | other | research/blueprint/papers/PAPER-HEUER-25.result.json items …; … | Items 4, 15 and 16 cite by bracket numbers that match neither v3's bibliography nor the extraction's own usage. Item 15's "[21, Prop. 2.14]" is Heuer's … |
| /39 | low | missing | research/blueprint/papers/PAPER-HEUER-25.result.json item … | The proof of Theorem 3.22 lifts the points of a B-rigidifying set M ⊆ X(K) to 𝕏(B_dR^+/ξ²). It uses that the flat lift 𝕏 → Spa(B_dR^+/ξ²) is smooth, and that … |
| /40 | low | missing | research/blueprint/papers/PAPER-HEUER-25.result.json item …; … | The proof of Theorem 5.5 uses that T_X -> T^_J = lim T_X/J^n is flat: an adic completion of the Noetherian ring O(U)[d_1, ..., d_d] is flat over it. No item … |
| /41 | low | missing | research/blueprint/papers/PAPER-HEUER-25.result.json items … | Proposition 4.13 states that E = V (x)_B L^-1 is 'an analytic-locally trivial vector bundle', and Theorem 5.1 uses this to say ν_*(...) is a Higgs bundle, that … |
| /42 | low | error | research/blueprint/papers/PAPER-HEUER-25.result.json item … | Item 36 repeats the misprint the review recorded as E10: it says LS_f goes from small pro-etale vector bundles to small Higgs bundles, 'sending (E, theta) to … |
| /43 | low | missing | research/blueprint/papers/PAPER-HEUER-25.result.json sourceIssues … | Two slips are unrecorded, and items 35-37 copy them. (1) Section 4.1 calls smallness 'intrinsic'. The cited definition depends on the toric chart: the integral … |
| /44 | low | error | research/blueprint/papers/PAPER-HEUER-25.result.json item … | Item 34 says enlarging B 'through any coherent quotient of T_X' leaves ν*E (x)_B L_B unchanged. The identification uses L_{B'}, which Theorem 3.22 defines only … |
| /45 | low | error | research/blueprint/papers/PAPER-HEUER-25.result.json item … | 'natural in (X, 𝕏, K, Exp)' does not say what naturality is with respect to. Theorem 5.1(2) gives the natural transformation t_f̃ : f* ∘ S_{𝕏,Exp} => … |

## Notes for the fix job

- **Route 1.** Send item 6 to PadicHodgeTheory P8:local-rational, alongside BMS-18 route 14, and keep item 44 at P8. Fix
  the route 4 brief's import to match.
- **Item 24.** Restate Corollary 2.19 with Pic⁰[p] in place of H¹_ét(X′, μ_p), and add a source issue. Repair the
  surjectivity step through openness of [p] and connectedness of Pic⁰.
- **§3 inputs from Heuer–Werner–Zhang.** Record two source issues against HWZ v2: Ĝ° is analytic p-divisible, but Ĝ need
  not be; and Theorem 6.12 needs local p-divisibility.
- **Missing inputs and owners.** Add the cited inputs as items with the owners the findings name, and correct the
  planned statuses of items 1, 13 and 35.
