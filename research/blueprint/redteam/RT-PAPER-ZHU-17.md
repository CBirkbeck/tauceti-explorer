# RT-PAPER-ZHU-17

Red team of the accepted extraction PAPER-ZHU-17: Xinwen Zhu, *Affine Grassmannians and the geometric Satake in mixed
characteristic*, Annals of Mathematics 185 (2017), 403–492. Issue #4110.

Red team: Claude Code, session `cc-c2c06b`, 1 October 2026. I did not write or review:
- the extraction (`codex-c83e7a`, PR #1943; `cc-442dc5`, PR #2123);
- its review (`cc-2aeb03`, PR #2508).

**Disclosures.** Some findings cite, as existing records, work on which this session worked. They carry
coordinator notes; no finding rests on my verdicts.
- /5, /22 and /24: PAPER-BHATT-SCHOLZE-17, whose red team I verified (#5457).
- /5: PAPER-HE-21, whose red team I verified (#5401).
- /4, /5 and /20: RT-AREA-etale, part 2 of whose fixes I reviewed (#5317, not the fix for /16).
- /42: RT-PAPER-HANSEN-26, my red team (#4940); the title defect is established independently from RS-22.

**Result: 44 findings, 5 high, 19 medium and 20 low.**

## Method

**The source.** The published version (<https://annals.math.princeton.edu/wp-content/uploads/annals-v185-n2-p02-p.pdf>)
was re-downloaded on 2026-10-01; its SHA-256 (`5d50b415…4431a7`) equals the extraction’s. It has 90 pages, with printed
page = PDF page + 402.

**The passes.** Five parallel passes were run by this session.
- Four read every page: §§0–1, §§2.1–2.3, §§2.4–3, and Appendices A–B with the references. Page images were rendered for
  the formulas that matter.
- One checked the 18 routes, the briefs, the planned and library statuses and duplication against the atlas stages, the
  accepted GeometricSatakeAndFusion decomposition, PAPER-FARGUES-SCHOLZE-21 and other extractions, earlier red teams and
  their fix reports, and the pinned libraries (Mathlib 082e2d3, Tau Ceti f790474).

Routes are numbered 1–18 in file order.

**Merging.** Findings reported by two or more passes were merged. The largest merges are the unpropagated corrections
(eight findings), the review-added duplicates (five), and the Appendix A placement and the route cycles (four each).

**What I re-verified myself.** Every high finding:
- SF.0’s stage text, which has no perfection or algebraic spaces, against the 22 items planned there;
- the dependency edges between routes 6, 7 and 17;
- two duplicate pairs (lemma-1-5-minuscule-relative-position = G09; cor-1-19-gr-bar-N-irreducible-proper = G23);
- the accepted GS0:Witt-geometry decomposition node on semi-infinite orbits, and FS21’s planned items;
- S07 and Q04 against E47.

The full list of what was checked is in the result’s `checked` field.

## The high findings

### /1 — duplicate

**Where.** research/blueprint/papers/PAPER-ZHU-17.result.json items /greenberg-realization,
/lemma-1-5-minuscule-relative-position, /lemma-1-6-semicontinuity-relative-position, /cor-1-7-diagonal-closed,
/lemma-1-8-cartan, /V-N-and-lemma-1-9, /gr-bar-N-h-torsor, /V-N-h-and-stabilizer-J, /lemma-1-10-J-iso-gr-bar-N-h,
/remark-1-11-teichmuller-lift, /prop-1-12-gr-bar-N-representable, /prop-1-13-gr-mu-bullet-proper,
/lemma-1-14-grassmannian-of-sublattices, /lemma-1-17-pi-perfectly-proper, /lemma-1-18-demazure-fibres,
/cor-1-19-gr-bar-N-irreducible-proper, /notation-coweights-dominance-dual-group; routes 4, 6, 8;
research/blueprint/papers/PAPER-ZHU-17.result.json items /G12 (route 4) vs /lemma-1-8-cartan (route 6); /H04 (route 13)
vs /ly13-omega-star-inverse and /longest-double-coset-elements-twisted-involutions (route 18);
/notation-coweights-dominance-dual-group (route 4) vs /dual-group-and-highest-weight-modules (route 8),
/split-reductive-coweight-notation and /reductive-group-scheme-over-O (route 4);
research/blueprint/papers/PAPER-ZHU-17.result.json route 6 (and routes 1, 7): review-added items restating existing
ones; research/blueprint/papers/PAPER-ZHU-17.result.json items /ly13-omega-star-inverse and
/longest-double-coset-elements-twisted-involutions (route 18) versus /H04 (route 13);
research/blueprint/papers/PAPER-ZHU-17.result.json items six-operations-perverse-ic-perfect vs E02/E04/E05;
perfection-detects-schemes vs A08

**Claim.** Sixteen items added in review restate numbered results of §§1.1-1.3 that already have G-items with the same
statement and locator: greenberg-realization = G02; lemma-1-5 = G09; lemma-1-6 = G10; cor-1-7 = G11; lemma-1-8-cartan =
G12 (first half); V-N-and-lemma-1-9 = G13; gr-bar-N-h-torsor + V-N-h-and-stabilizer-J + lemma-1-10 + remark-1-11 = G14;
prop-1-12 = G15; lemma-1-14 = G17; prop-1-13 = G18; lemma-1-17 = G20; lemma-1-18 = G21 + G22; cor-1-19 = G23.
notation-coweights-dominance-dual-group is the union of reductive-group-scheme-over-O, split-reductive-coweight-notation
and dual-group-and-highest-weight-modules. Both copies of each pair are routed (route 6, or routes 4/6), with
inconsistent statuses: G02, G15, G18 are planned (GS0:Witt-geometry) and their copies missing; G12 is planned in RG2.4
via route 4, lemma-1-8-cartan missing via route 6. The dual group Ĝ, V_μ, V_μ(λ) is routed twice, to route 4 (via
notation-coweights-...) and to route 8 (via dual-group-...). The note of greenberg-realization ('G02 records the
definitions but not this representability result') is false. Also: Items added on review restate existing items and
route the same mathematics to two owners. Lemma 1.8 is G12 (planned, ReductiveGroupsPartII RG2.4) and again
lemma-1-8-cartan (missing, GeometricSatakeAndFusion GS0:Witt-geometry). The two cited facts on p. 453 (ω* = ω^{-1} by
[LY13, Lemma 6.2]; longest double-coset elements lie in I_⋄ by [Lus12, 8.2], [LY13, 6.3(1)]) are inside H04, routed to
RootSystemsPartIIDominanceAndDemazure, and again as two items routed to
GeometricSatakeAndFusionPartIIRationalGelfandProof, whose brief says it imports this indexing from the root-systems Part
II. The §0.5 conventions appear three or four times across routes 4 and 8. Also: At least 15 more review-added items
duplicate items already present, inflating the 254 missing count; two pairs carry contradictory statuses for the same
proposition. G15 (Prop. 1.12, planned GS0:Witt-geometry) vs prop-1-12-gr-bar-N-representable (missing); G18 (Prop. 1.13,
planned) vs prop-1-13-gr-mu-bullet-proper (missing). Further pairs with identical statements and locators:
G09/lemma-1-5-minuscule-relative-position, G10/lemma-1-6-semicontinuity-relative-position, G11/cor-1-7-diagonal-closed,
G13/V-N-and-lemma-1-9, G14/lemma-1-10-J-iso-gr-bar-N-h (G14 also contains V-N-h-and-stabilizer-J and
remark-1-11-teichmuller-lift), G17/lemma-1-14-grassmannian-of-sublattices, G20/lemma-1-17-pi-perfectly-proper,
G21+G22/lemma-1-18-demazure-fibres, G23/cor-1-19-gr-bar-N-irreducible-proper; in route 7
six-operations-perverse-ic-perfect restates E02+E04+E05; in route 1 A08 is contained in perfection-detects-schemes.
Also: H04, routed to route 13 (RootSystemsPartIIDominanceAndDemazure), already states both cited facts: ω^* = ω^{-1} for
ω ∈ Ω, and that the longest element of every (W_J, W_J^⋄)-double coset lies in I_⋄. Route 13's brief owns them ('Test
... ω*=ω⁻¹ and exclusion of arbitrary double-coset elements'), and route 18's brief imports them ('import indexing from
RootSystemsPartIIDominanceAndDemazure'). Yet the two named items assert the same facts again and are listed among route
18's items, so two roadmaps plan the same results. Also: Two added items restate existing items of the same extraction:
six-operations-perverse-ic-perfect contains the six operations (E02), perverse sheaves (E04) and IC_X (E05) for
separated pfp spaces; perfection-detects-schemes repeats A08 ('ε : X^{p^-∞} → X is a universal homeomorphism') and adds
only the scheme criterion. Both are in the same routes as the items they repeat.

**Evidence.** G09: locator 'Lemma1.5', statement 'Lemma 1.5. Let R be a perfect k-algebra and β: E1 ⇢ E2 a quasi-isogeny
... β induces a chain of inclusions pE2 ⊂ E1 ⊂ E2 and E2/E1 is a finite projective W(R)/p = R-module of rank i';
lemma-1-5-minuscule-relative-position: locator 'Lemma 1.5, pp. 416–417', the same statement. Likewise G23 vs cor-1-19
(both 'Gr̄_N is irreducible and perfectly proper. In particular, Gr = Gr_{GL_n} is ind-perfectly proper'). G02's
statement: the functors are 'represented by k-schemes, with L_p^h𝒳 of finite type over k, L_p^+𝒳 = lim← L_p^h𝒳, and
L_p^+𝒳 ⊂ L_p^+𝒴 open when 𝒳 ⊂ 𝒴 is open', which is exactly greenberg-realization. REV-PAPER-ZHU-17.md §1: 'Added (104)
... the numbered statements of §§1.2–1.3 (Lemmas 1.5–1.18, Propositions 1.12–1.13, Corollaries 1.7 and 1.19)'. Also: p.
418: 'Lemma 1.8. (i) The group GL_n(W(k)) acts transitively on the set Gr_μ(k). In fact, Gr_μ(k) = GL_n(W(k))p^μ. (ii)
Gr(k) = ⊔ Gr_μ(k).' G12 statement opens 'Lemma 1.8 (GL_n over W(k)): (i) GL_n(W(k)) acts transitively on Gr_μ(k)...',
planned ['ReductiveGroupsPartII:RG2.4']; lemma-1-8-cartan: same statement, 'Missing: routed to route 6.' p. 453: 'Let ω
∈ Ω. Then by [LY13, Lemma 6.2] ω* = ω^{-1} ... as argued in [Lus12, Prop. 8.2] and [LY13, Th. 6.3 (1)], the longest
element in every (W_J × W_J^⋄)-double coset belongs to I_⋄.' H04 statement contains both; route 18 items include
ly13-omega-star-inverse and longest-double-coset-elements-twisted-involutions; route 18 imports
'RootSystemsPartIIDominanceAndDemazure: indexing adapters'. notation-coweights-dominance-dual-group name: 'Standing
assumption on G; coweights, dominance order, ϖ^λ, dual group, V_μ'. Also: p. 421: 'Proposition 1.12. The functor Gr_N is
represented by a separated perfect algebraic space, perfectly of finite type over k'; G15 statement 'Proposition 1.12.
The functor \overline{Gr}_N = Gr_{≤Nω_1} is represented by a separated perfect algebraic space, perfectly of finite type
over k' (planned) and prop-1-12-gr-bar-N-representable 'The functor Gr̄_N is represented by a separated perfect
algebraic space, perfectly of finite type over k' (missing). p. 421: 'Proposition 1.13. The space Gr_μ• is represented
by a perfect k-scheme, perfectly proper over k'; G18 planned, prop-1-13-gr-mu-bullet-proper missing. REV-PAPER-ZHU-17
(review.json notes): '104 items added ...; item G29e removed as a duplicate of G24'. Also: p. 453: 'Let ω ∈ Ω. Then by
[LY13, Lemma 6.2] ω^* = ω^{−1} ... Then as argued in [Lus12, Prop. 8.2] and [LY13, Th. 6.3 (1)], the longest element in
every (W_J × W_J^⋄)-double coset belongs to I_⋄.' H04 statement: 'For every ω ∈ Ω, ω^* = ω^{−1} ([LY13, Lemma 6.2] ...)
... The longest element of every (W_J, W_J^⋄)-double coset lies in I_⋄ ([Lus12, Prop. 8.2], [LY13, Th. 6.3(1)] ...)'.
Route 18 items include both named items. Also: six-operations-perverse-ic-perfect statement: 'the six operations on
D^b_c(-, Qlbar) are defined through models ... Perverse sheaves P(X), the Goresky-MacPherson intermediate extension and
IC_X are defined as usual'; E02 'Six operations on perfect pfp spaces'; E04 'Perverse t-structure'; E05 'Middle
intersection complex'. A08 'The projection X^perf→X is a universal homeomorphism.'

**Fix.** Delete the sixteen duplicates and notation-coweights-dominance-dual-group, and remove them from the route 4 and
route 6 item lists (continuation.preserveIds keeps the G ids). First move their extra content into the surviving items:
the E-pointers (E4, E5, E39 to G09; E6, E40 to G14; E7 to G17; E8 to G20; E9, E44 to G21/G22; E41-E43 to G18), the
minors proof of Lemma 1.6 to G10's note, the 'Corollary A.23 needs a pfp base' remark to G17's note, the 'used over
arbitrary perfect fields' remark to G12's note, and the [Gre61] citation to G02's note. Keep Ĝ, B̂, T̂, V_μ, V_μ(λ) only
in dual-group-and-highest-weight-modules, in one route. Also: Delete /lemma-1-8-cartan (keep G12; add its note about use
over arbitrary algebraically closed perfect fields to G12). Delete /ly13-omega-star-inverse and
/longest-double-coset-elements-twisted-involutions from items and from route 18 (H04 in route 13 owns them; keep their
notes in H04). Merge /notation-coweights-dominance-dual-group into /split-reductive-coweight-notation and
/reductive-group-scheme-over-O, moving its dual-group/V_μ sentence to /dual-group-and-highest-weight-modules. Recount.
Also: Remove the kebab-case duplicates listed (or keep each only as a note on the original id), keeping G15 and G18
planned; fold their extra notes (E39 Fitting-ideal repair, proof remarks) into the originals; recount items and statuses
in summary, coverage and the report. Also: Remove ly13-omega-star-inverse and
longest-double-coset-elements-twisted-involutions from route 18's items and route them with H04 in route 13 (or delete
them and keep H04, adding their published-numbering remarks to H04's note). Make them prerequisites of H04 and H07.
Also: Narrow six-operations-perverse-ic-perfect to what E02-E05 lack (proper base change for perfectly proper and smooth
base change for perfectly smooth maps, and the IC normalization of E25) and make it a consumer of E02, E04, E05; narrow
perfection-detects-schemes to 'X is a scheme iff X^{p^-∞} is a scheme' with prerequisites A08 and A107.

### /2 — error

**Where.** research/blueprint/papers/PAPER-ZHU-17.result.json items /S07 and /Q04 (sourceIssue E47 not propagated);
research/blueprint/papers/PAPER-ZHU-17.result.json item /S05 (sourceIssue E46 only in a note);
research/blueprint/papers/PAPER-ZHU-17.result.json item /Q01 (sourceIssue E52 not propagated);
research/blueprint/papers/PAPER-ZHU-17.result.json item /O08 (proofSteps);
research/blueprint/papers/PAPER-ZHU-17.result.json item /R06 (statement, proofSteps, prerequisites); route 17
(HeckeStacksAndLocalShtukasIntegralPartII) brief; research/blueprint/papers/PAPER-ZHU-17.result.json items /D07 and
/D08; research/blueprint/papers/PAPER-ZHU-17.result.json items /S10 and /S12 (sourceIssue E27);
research/blueprint/papers/PAPER-ZHU-17.result.json item /framing-tensors-tate

**Claim.** Several confirmed sourceIssue corrections were recorded but never carried into the items they correct, so the
item statements (or their proof outlines) still assert what the corrections reject. S07 states 'The perfect scheme S_λ ∩
Gr_≤μ is equidimensional of dimension (ρ, λ+μ)' and Q04 states 'for any λ•, S_λ• ∩ Gr_≤μ• is equidimensional and
dim(S_λ• ∩ Gr_≤μ•) = (ρ, |λ•|+|μ•|)', with no nonemptiness hypothesis and no note. Both are false whenever λ is not a
weight of V_μ (resp. some λ_i is not a weight of V_{μ_i}), because the scheme is then empty. The extraction's own E47
(confirmed) records exactly this, and §18 requires items to carry corrected statements; the review states that
source-route items carry the corrections, which is not so here. Q04 feeds Q05 (semismallness) and S07 feeds Q02/S12, so
a worker would be asked to prove a false equality. Also: S05's statement still asserts the printed refinement 'the
closure of S_λ ∩ Gr_≤μ is ∪_{λ'≤λ} S_{λ'} ∩ Gr_≤μ', which E46 (confirmed) shows is false; the correction appears only in
the note. §18 requires the item itself to carry the corrected statement. Also: Q01 states 'Q_{1/2} is maximal
parahoric'. E52 (confirmed) shows this is false in type A_n, n ≥ 2, which Lemma 2.11 covers (θ ∈ M for SL_n, GL_n). The
clause is not used downstream, but the item statement is false and carries no correction. Also: The proof outline of
Lemma 2.32 still prescribes the false reduction that sourceIssue E58 (confirmed) and the item's own note reject:
H^*(Gr_mu) = H^*(Gbar/Pbar_mu) is not generated by degree-two Chern classes when P_mu is not a Borel (Gr(2,4) for GL_4,
mu = (1,1,0,0): H^4 is 2-dimensional, H^2 is 1-dimensional). The item is self-contradictory and a worker following
proofSteps would follow the invalid argument; route 18's brief also says the equivariant computation must be used in
every degree. Also: R06 states Proposition 3.11 exactly as printed and its proofSteps compare X_mu(b) and
M̄_mu(b)^{p^-∞} as closed subspaces of the GL_h objects by their k-points. By the confirmed E64 (which lists Proposition
3.11 among the places to correct, and which R04 already carries) the comparison map compatible with the GL_h embeddings
identifies M̄_mu(b)(k) with X_{σ(mu)}(b)(k), not X_mu(b)(k). In the E64 example G = Res_{Z_p^2/Z_p} G_m, mu = (1,0), b =
mu(p), X_mu(b)(k) = {v(g) = (a,a)} and M̄(k) = {(c+1,c)} are disjoint inside the GL_2 set, so the prescribed k-point
comparison fails. Only an abstract isomorphism (through g -> bσ(g)) survives. Route 17's brief carries the correction
for Theorem 3.10(3) but not for Proposition 3.11. Also: Both items reproduce the misprinted indexing of p. 458 that the
confirmed E63 corrects. D07 defines Nm(b) = b_0σ(b_1)...σ^{d-1}(b_{d-1}) for 'b = (b_0,...,b_{d-1}) in the split
factors' and D08 states Lemma 3.5 with μ• = (μ_{τ_0}, σ(μ_{τ_1}), ..., σ^{d-1}(μ_{τ_{d-1}})), without fixing the
labelling. The only labelling in the paper is τ_i = σ^i(τ_0), under which the chain does not typecheck for d ≥ 3,
because σ^* carries the τ-component to the στ-component. Protocol §18 requires items to use the corrected statement;
only remark-3-6-norm-on-classes does. Also: E27 (confirmed) says the bases of Remark 2.4 and Cor. 2.9 are canonical only
up to rescaling each vector by a power of p. S12 has this as a note but its statement still says 'canonical
isomorphism'. S10's statement says 'V^λ_μ• has a canonical basis indexed by B^λ_μ•' and has no note. Also: The item
repeats the paper's justification that the s_i lie in Fil^0 because ρμ fixes them. That argument presupposes condition
(2), that the Hodge filtration of X_0 is the μ-filtration, and the confirmed E21 shows (2) can fail. E21's correction
says this justification must be replaced, but the item was not updated.

**Evidence.** p. 434, Cor. 2.8: 'The perfect scheme Sλ ∩ Gr≤µ is equidimensional, of dimension (ρ, λ + µ).' p. 439, Cor.
2.14: 'Then for any λ• = (λ1, . . . , λm), Sλ• ∩ Gr≤µ• is equidimensional, and dim(Sλ• ∩ Gr≤µ•) = (ρ, |λ•| + |µ•|).'
Counterexamples: G = SL_2, μ = 0, λ = α^∨: S_{α^∨} ∩ Gr_≤0 = ∅ (Gr_≤0 = {ϖ^0} ⊂ S_0) but (ρ, α^∨) = 1. For Q04: m = 1,
μ_1 = α^∨ ∈ M, λ_1 = 2α^∨: S_{2α^∨} ∩ Gr_≤α^∨ = ∅ (nonempty would force ϖ^{2α^∨} ∈ Gr_≤α^∨ by the G_m-contraction, p.
433), but the formula gives (ρ, 3α^∨) = 3. Also: p. 433 page image: 'More precisely, \overline{Sλ ∩ Gr≤µ} = ∪λ′≤λ Sλ′ ∩
Gr≤µ' with the overline over the whole intersection. Counterexample: μ = 0, λ = α^∨ (α simple): left side closure(∅) =
∅, right side ⊇ S_0 ∩ Gr_≤0 = {ϖ^0} since 0 ≤ α^∨. Also: p. 437: '(2) Q_{1/2} is a maximal parahoric;'. Check for SL_3,
θ = (1,0,−1): Q_{1/2} has entry valuations ((0,1,1),(0,0,1),(−1,0,0)); conjugating by diag(1,1,ϖ) gives
((0,1,0),(0,0,0),(0,1,0)), the preimage in SL_3(O) of the stabilizer of the line ke_2, a non-maximal parahoric strictly
inside SL_3(O). Also: p. 451: 'the pullback induces a canonical ring isomorphism H^*(Gbar/Pbar_mu) ≃ H^*(Gr_mu).
Therefore, H^*(Gr_mu) is generated by H^2. ... it is enough to prove that Θ̊_mu = −1 on H^2.' Item O08 proofSteps:
'Reduce to the partial flag; its cohomology is generated by degree-two character Chern classes, on which opposition acts
by −1.' O08 note: 'Correction: H*(Gr_μ) is not generated by H² (Gr(2,4) for GL₄) ... (E58).' Also: p. 464: 'To prove
that X_mu(b) ≃ M̄_mu(b)^{p^-∞}, it is enough to show that the above isomorphism sends X_mu(b)(k) ⊂ X_{ρmu}(ρ(b))(k) to
M̄_mu(b)^{p^-∞}(k) ⊂ M̄_{ρmu}(ρ(b))^{p^-∞}(k). But this follows from Theorem 3.10(3).' E64 correction: 'read X_{σ(μ)}(b)
for X_μ(b) in Theorem 3.10(3), in Proposition 3.11 and the last paragraph of its proof'. R06 statement: 'There is a
canonical isomorphism X_μ(b) ≃ M̄_μ(b)^{p^{-∞}}'. R06 proofSteps: 'Realize both sides as reduced perfect closed
subspaces of the GL object and compare algebraically closed points'. Also: p. 458: 'We fix τ_0 ∈ Σ, and let τ_i =
σ^i(τ_0) ... Nm b = b_{τ_0}σ(b_{τ_1})···σ^{d−1}(b_{τ_{d−1}})'. Under a⊗c ↦ (τ(a)c)_τ one has ((1⊗σ)x)_τ =
σ(x_{σ^{-1}τ}), so the τ_0-component of bσ(b)···σ^{d−1}(b) is b_{τ_0}σ(b_{σ^{-1}τ_0})···σ^{d−1}(b_{σ^{-(d-1)}τ_0}) (E63,
confirmed). Also: p. 432, Remark 2.4: 'there is a canonical basis of V^λ_µ• given by the set B^λ_µ• of irreducible
components'. E27: 'the bases of Remark 2.4 and Corollary 2.9 are canonical only up to powers of p'. Also: p. 462: 'In
addition, the cocharacter ρμ : G_m → GL(Λ⊗W) also fixes {s_i}. Therefore, {s_i} are in Fil^0(D(X_0)^⊗_{F̄_p}).' E21
correction: 'On p. 462, justify s_i ∈ Fil^0 by the G-valued cocharacter that splits the Hodge filtration, not by ρμ.'
framing-tensors-tate statement: 'The cocharacter ρμ fixes the s_i, so they lie in Fil^0(D(X_0)^⊗_{F̄_p}).'

**Fix.** S07 statement: 'S_λ ∩ Gr_≤μ is nonempty iff λ is a weight of V_μ; in that case it is equidimensional of
dimension (ρ, λ+μ). In all cases the number of its irreducible components equals dim V_μ(λ) (corrected per E47).' Q04
statement: 'Let μ• ⊂ M and λ• = (λ_1,…,λ_m). If each λ_i is a weight of V_{μ_i}, then S_λ• ∩ Gr_≤μ• is equidimensional
of dimension (ρ, |λ•|+|μ•|); otherwise it is empty (E47).' Also: Replace the S05 statement by: 'For λ ∈ X_•, S̄_λ =
∪_{λ'≤λ} S_{λ'}; hence S̄_λ ∩ Gr_≤μ = ∪_{λ'≤λ}(S_{λ'} ∩ Gr_≤μ) for every dominant μ. Similarly S̄^−_λ = ∪_{λ'≥λ}
S^−_{λ'}. (The printed refinement closure(S_λ ∩ Gr_≤μ) = ∪_{λ'≤λ} S_{λ'} ∩ Gr_≤μ is false when S_λ ∩ Gr_≤μ = ∅ and
unproved otherwise; E46.)' Also: In Q01 replace 'Q_{1/2} is maximal parahoric' by 'Q_{1/2} is the parahoric of the point
−θ/2; its reductive quotient contains the rank-one group of the affine roots ±(θ^∨+1) (it is maximal unless the simple
factor containing θ is of type A_n, n ≥ 2; E52)'. Also: Replace O08 proofSteps by: 'Use the commutative diagram of p.
451: the equivariant map H^*_Gbar(Gbar/Pbar_mu) = R_{L_mu} -> R_{L_{-mu}} induced by θ, composed with γ (the identity on
R_Tbar), is the restriction to W_{L}-invariants of the ring automorphism of R_Tbar = Sym(X^•(Tbar)) sending χ to −χ; it
therefore acts by (−1)^j in degree 2j. Specialise along R_{Gbar} -> Q̄_ℓ (H^*(Gr_mu) = Q̄_ℓ ⊗_{R_G} R_{L_mu}). Do not
use generation by H^2 (false for Gr(2,4), E58).' Also add open-orbit-comparison-map to O08's prerequisites. Also: R06
statement: 'The isomorphism X_{ω_n}(ρ(b)) ≃ M̄_{X_0}^{p^{-∞}} of R05 restricts to an isomorphism X_{σ(μ)}(b) ≃
M̄_μ(b)^{p^{-∞}} of reduced perfect closed subspaces (E64); composing with X_μ(b) ≃ X_{σ(μ)}(b), g ↦ bσ(g), gives X_μ(b)
≃ M̄_μ(b)^{p^{-∞}}, and dim M̄_μ(b)_red = dim X_μ(b). When {μ} is defined over Q_p, σ(μ) = μ and the printed statement
holds.' proofSteps: compare X_{σ(μ)}(b), not X_μ(b), with M̄ inside the GL_h objects. Add prerequisites G24 (closed
embedding Gr_G -> Gr_{GL_h}) and D01. Add 'and in Proposition 3.11 read X_{σ(μ)}(b)' to route 17's correction sentence.
Also: D07 statement: 'Let E/F be unramified of degree d, Σ the F-embeddings E -> L, τ_0 ∈ Σ and τ_i := σ^{-i}∘τ_0 (i =
0,...,d−1) (E63; the paper prints σ^i). For b = (b_τ) ∈ ∏_Σ (H ⊗_{E,τ} L)(L) put Nm b :=
b_{τ_0}σ(b_{τ_1})···σ^{d−1}(b_{τ_{d−1}}), the τ_0-component of bσ(b)···σ^{d−1}(b).' D08: prefix 'with τ_i := σ^{-i}τ_0
as in D07'. Also: S10: 'V^λ_μ• has a basis indexed by B^λ_μ• (the fundamental classes of the components of dimension
(ρ,|μ•|−λ)); each basis vector is canonical up to a factor in p^Z (E27).' S12: replace 'canonical isomorphism CT_λ(IC_μ)
≃ Q̄_ℓ[B_μ(λ)]' by 'an isomorphism CT_λ(IC_μ) ≃ Q̄_ℓ[B_μ(λ)], canonical up to rescaling each basis vector by a power of
p (E27)'. Also: Replace that sentence by: 'The Hodge filtration ker(ρ(b)σ mod p) of D(X_0) is split by a G-valued
cocharacter (a G(W)-conjugate of σ^{-1}(μ), E21), which fixes the s_i; hence s_i ∈ Fil^0(D(X_0)^⊗_{F̄_p}).'

### /3 — duplicate

**Where.** research/blueprint/papers/PAPER-ZHU-17.result.json items /S04, /S07,
/semi-infinite-orbits-locally-closed-iwasawa, /gm-action-attractors-and-opposite-orbits; route 8
(GeometricSatakeAndFusion); research/blueprint/papers/PAPER-ZHU-17.result.json route 8 items /S02, /S07, /T07 and route
7 item /IC-stalk-parity; research/blueprint/papers/PAPER-ZHU-17.result.json items /S02 and /IC-stalk-parity (status);
research/blueprint/papers/PAPER-ZHU-17.result.json items /G10, /G20, /G21, /G22, /G23, /G27, /G28, /G31, /G32 (status)

**Claim.** These items are marked 'missing' and sent by route 8 to GS1/GS2/GS4. But the accepted base decomposition of
GeometricSatakeAndFusion already plans the Witt-vector semi-infinite orbits S_λ = LU·[λ] and the Mirković–Vilonen
dimension formula in node GS0:Witt-geometry/semi-infinite-intersections-and-MV-cycles, a stage route 8 does not name.
The FS21 extraction marks the same mathematics 'planned' (c6a-mirkovic-vilonen-dim-VI.3.8 and
c6a-witt-semi-infinite-affine-VI.3.7 at GS0:Witt-geometry/GS1; c6a-gm-action-attractor-setup and
c6a-semi-infinite-borel-VI.3.4 at GS1). Following route 8 would add a second node for the Witt MV-cycle dimension in GS1
next to the existing GS0:Witt-geometry node. Only S07's count of components (= dim V_μ(λ), via point counting and
Kato–Lusztig) is not already planned. Also: Several route 8 items are marked missing although the accepted
PAPER-FARGUES-SCHOLZE-21 extraction and the GS stage texts plan the same statements for the Witt Grassmannian: Cor.
2.8's equidimensionality (S07) is FS VI.3.8, planned at GS0:Witt-geometry and GS1; IC-stalk parity on Witt Schubert
varieties, cited by FS from Zhu Lemma 2.1, is planned at GS4:rational-reductivity (so IC-stalk-parity, routed to
EtaleDualityAndPerverseSheaves in route 7, gets a second owner); semisimplicity (S02) is GS4:rational-reductivity's
stated target; Zhu's Satake equivalence (T07) is FS Remark I.2.14, planned at GS1 and GS4:integral-dual-group. Also:
Lemma 2.1 (semisimplicity of the rational Satake category, proved via parity of IC stalks on Witt Schubert varieties) is
what GS4:rational-reductivity explicitly plans, and FS21 marks the parity statement 'planned' there, citing [Zhu17,
Lemma 2.1]. Both S02 and IC-stalk-parity are nevertheless 'missing'. Under §16 an item that a layer plans is 'planned'.
Also: These items are marked missing and routed to route 6 (GS0:Witt-geometry), but that stage's text explicitly plans
their content: relative-position strata (G10, G31, G32), Demazure resolutions (G20, G28) with connected proper fibres
(G21, G22, G23), and flag spaces (G27, G28). Their siblings G08, G15, G16, G18 and G29 are marked planned in the same
stage, so statuses within §1 are inconsistent.

**Evidence.** data/decompositions/GeometricSatakeAndFusion.json (review 'accepted', 2026-09-16), node
GeometricSatakeAndFusion:GS0:Witt-geometry/semi-infinite-intersections-and-MV-cycles: 'In the Witt vector affine
Grassmannian Gr^{Witt}_G over F-bar_q ... let S_lambda = LU . [lambda] be the semi-infinite orbit. Then for any dominant
mu, the intersection S_lambda intersect Gr^{Witt}_{G,<=mu} is representable by an AFFINE scheme, and it is
equidimensional of dimension <rho, mu + lambda>' (same node in
research/blueprint/packets/GeometricSatakeAndFusion--GS0.json). Stage GS1: 'Construct ... semi-infinite orbits and their
intersections with Schubert strata. Prove dimension estimates'. Route 8 stages: GS1, GS2:correspondences,
GS2:Satake-closure, GS4:rational-reductivity, GS4:integral-dual-group. Also: p. 434: 'Corollary 2.8. The perfect scheme
S_λ ∩ Gr_≤μ is equidimensional, of dimension (ρ, λ + μ).' PAPER-FARGUES-SCHOLZE-21/c6a-mirkovic-vilonen-dim-VI.3.8: 'S_λ
∩ Gr^Witt_{G,≤μ} is equidimensional of dimension ⟨ρ, μ + λ⟩', planned ['GeometricSatakeAndFusion:GS0:Witt-geometry',
'GeometricSatakeAndFusion:GS1'], note 'Cf. ... [Zhu17, Cor. 2.8]'. /c6b-rational-IC-clean-Witt-Schubert: 'all geometric
fibres of the intersection complex ... concentrated in degrees of the same parity as d_μ', planned
['GeometricSatakeAndFusion:GS4:rational-reductivity'], 'Cites [Zhu17, Lemma 2.1]'. /c1-rem-I.2.14-witt-satake: 'Theorem
I.2.12 gives a new proof of Zhu's geometric Satake equivalence for the Witt vector affine Grassmannian [Zhu17]', planned
GS1, GS4:integral-dual-group. GS1: 'semi-infinite orbits and their intersections with Schubert strata. Prove dimension
estimates'. GS4:rational-reductivity: 'Prove geometric semisimplicity of the rational Satake category'. FS21 review:
accept. Also: Stage GeometricSatakeAndFusion:GS4:rational-reductivity: 'Apply EDC.7 only to the finite-type proper
models/resolutions of bounded Witt Schubert spaces ... Prove geometric semisimplicity of the rational Satake category
using the decomposition theorem and the orbit/IC calculation'.
PAPER-FARGUES-SCHOLZE-21/c6b-rational-IC-clean-Witt-Schubert (planned, GS4:rational-reductivity): 'all geometric fibres
of the intersection complex j_{μ!*}ℚ_ℓ[d_μ] are concentrated in degrees of the same parity as d_μ' (note cites [Zhu17,
Lemma 2.1], [Gai01, Proposition 1], [Lus83]). Zhu p. 430: 'Lemma 2.1. The category P_{L+G}(Gr_G) is semisimple.' Also:
GeometricSatakeAndFusion:GS0:Witt-geometry: 'On perfect residue algebras define the Witt-vector lattice functor and its
bounded subfunctors. Construct the perfectly finitely presented Grassmannian/flag spaces, their Demazure resolutions,
connected proper fibres and relative-position strata. Use Zhu §§1.1–1.4 and Appendix A ...'. G16 and G18 have status
planned with planned ['GeometricSatakeAndFusion:GS0:Witt-geometry']; G20-G23 have status missing with no planned field.
The report (Proof structure) itself says 'GS0:Witt-geometry supplies lattices, relative-position bounds, Demazure towers
and the bounded Grassmannian geometry'.

**Fix.** Set S04 to status planned with planned: ['GeometricSatakeAndFusion:GS0:Witt-geometry'] (node
semi-infinite-intersections-and-MV-cycles). Set semi-infinite-orbits-locally-closed-iwasawa and
gm-action-attractors-and-opposite-orbits to planned at GeometricSatakeAndFusion:GS1 (node
semi-infinite-orbits-and-hyperbolic-localization). Split S07 into S07a (dimension and equidimensionality, if nonempty),
planned at GS0:Witt-geometry/semi-infinite-intersections-and-MV-cycles with Zhu's point-count proof recorded as an
alternative, and S07b (number of components = dim V_μ(λ)), still missing. Add GeometricSatakeAndFusion:GS0:Witt-geometry
to route 8's stages for S07b, and say in route 8 that these items are sources for existing nodes, not new nodes. Also:
Set S07 planned ['GeometricSatakeAndFusion:GS0:Witt-geometry', 'GeometricSatakeAndFusion:GS1'] (the component count
stays as the item's added content in the note), S02 and IC-stalk-parity planned
['GeometricSatakeAndFusion:GS4:rational-reductivity'] with IC-stalk-parity moved from route 7 to route 8, and T07
planned ['GeometricSatakeAndFusion:GS1', 'GeometricSatakeAndFusion:GS4:integral-dual-group']. Recheck the other S/T
items against the same FS21 items. Also: Set S02 and IC-stalk-parity to status planned with planned:
['GeometricSatakeAndFusion:GS4:rational-reductivity'], and note that Zhu's proof is a source for that layer. Then see
the next finding for the effect on route 18. Also: Set status 'planned' with planned
['GeometricSatakeAndFusion:GS0:Witt-geometry'] on G10, G20, G21, G22, G23, G27, G28, G31 and G32 (and on
gr-leq-mu-strata, gr-bar-N-definition and demazure-resolution-gr-tilde-N if they are kept). Move them from the missing
count to the planned count.

### /4 — error

**Where.** research/blueprint/papers/PAPER-ZHU-17.result.json route 6 (GeometricSatakeAndFusion:GS0:Witt-geometry)
versus route 7 (EtaleDualityAndPerverseSheaves); items B02, B03, B04, E10; and the pending fix RT-AREA-etale/16;
research/blueprint/papers/PAPER-ZHU-17.result.json route 6 (GS0:Witt-geometry) versus route 17 (part-ii
HeckeStacksAndLocalShtukasIntegralPartII); items BC4, B14; research/blueprint/redteam/RT-AREA-etale.fixes.md /16 edit 2
(new route 19) applied to research/blueprint/papers/PAPER-ZHU-17.result.json item E06;
research/blueprint/papers/PAPER-ZHU-17.result.json route 7 and route 6;
research/blueprint/papers/PAPER-ZHU-17.review.json route 7

**Claim.** There is a route cycle GS0:Witt-geometry -> EDC -> GS0:Witt-geometry: route-6 items B02 and B03 (Proposition
B.1) require route-7 items E06, E13, E14, while route-7 item E10 requires route-6 item G05 (and E13 requires E10). The
confirmed fix of RT-AREA-etale/16 moves B02 and B03 into the new perfect-scheme Part II, which imports
GS0:Witt-geometry, but leaves B04 (Proposition B.2) in route 6 with prerequisite B03. After the fix the cycle is
GS0:Witt-geometry (B04) -> Part II (B03) -> imports GS0:Witt-geometry, so the fix as written does not break it. Also:
Item BC4 (Conjecture IV: L̃'_det on M_{N,h} is semi-ample) is routed to GS0:Witt-geometry but its only prerequisite B14
(the line bundle L̃'_det on the isogeny-chain moduli M_{N,h}) is in route 17, a Part II that imports
GeometricSatakeAndFusion and whose items B13, B15 require route-6 items B07, B01. This is a route cycle 6 -> 17 -> 6,
created by a single statement-only item. Also: The fix keeps E06 (decomposition theorem) as a source of EDC.7 in a new
route 19 while moving E02 (six operations on perfect pfp spaces) and E05 (IC on perfect spaces) into the Part II, which
imports EDC.0-EDC.7. E06's recorded prerequisites are exactly E02 and E05, so the applied fix would make EDC.7 require
the Part II and the Part II import EDC.7: a new cycle. Also: The confirmed RT-AREA-etale /16 (route 7 must be a Part II
on perfect schemes, equivariant coefficients and hyperbolic localization, not a source route to EDC.0-EDC.7) has not
been applied. Route 7 is still a source route with 21 items including E06 and IC-stalk-parity; B02 and B03 are still in
route 6; the proposed route 19 (E06 to EDC.7) does not exist; the review's route 7 verdict is unchanged. The fix report
wrote exact edits but left them waiting for a review verdict. Coordinator note: RT-AREA-etale is cited; this session
reviewed part 2 of its fixes (REV-FIX-RT-AREA-etale~2, PR #5317, the Habiro packets only), not the fix for /16. Nothing
here rests on a verdict of this session.

**Evidence.** Prerequisites: B02 PRE [G22, E06]; B03 PRE [B01, B02, E13, E14]; B04 PRE [B01, B03, G22, A261]; E13 PRE
[E10, G26, E14]; E10 PRE [E01, G05]; G05 is in route 6. Route 6 imports 'EDC coefficient comparisons'.
RT-AREA-etale.fixes.md /16, edit 4: 'Route 6. Remove B02 and B03 from items (the cycle reason above)'; edit 1 items:
'the 21 current items minus E06 and IC-stalk-parity, plus B02 and B03'; imports 'GeometricSatakeAndFusion
GS0:Witt-geometry'. Paper p. 483: Prop. B.2 is justified by 'the pushforward of L̃_det along G̃r_N -> Gr̄_N will give
L_det', which needs the fibre-triviality supplied by Prop. B.1 (see E34), so the B04 -> B03 edge is genuine. Also: BC4
PRE [B14]; B14 in route 17; B13 PRE [B12, R05, A21, A22, B07]; B15 PRE [B13, B14, B01]; route 17 imports include
'GeometricSatakeAndFusion'. Paper p. 486: 'Conjecture IV. The line bundle L̃'_det on M_{N,h} is semi-ample.' M_{N,h} and
L̃'_det are defined on pp. 485-486 inside the isogeny-chain discussion that the extraction routes to route 17. Also: E06
PRE ['PAPER-ZHU-17/E02', 'PAPER-ZHU-17/E05']; E06 statement 'A proper map of the finite-type models in use decomposes a
pure shifted intersection complex ...'. RT-AREA-etale.fixes.md /16: route 19 {'stages':
['EtaleDualityAndPerverseSheaves:EDC.7'], 'items': ['PAPER-ZHU-17/E06']} and Part II 'Imports: ... EDC.0-EDC.7 on models
(E06 stays with EDC.7)'. Also: RT-AREA-etale.review.json: RT-AREA-etale/16 'confirmed' ('Route 7 is overall accepted but
its scope extension needs explicit Part II layers under protocol §16'). RT-AREA-etale.fixes.md (cc-39fac3), table: '/16
| ... Zhu route 7 becomes a Part II ... (PE.0–PE.4) | verdict'; section '/16' edits 1-6 (route kind part-ii, roadmap
EtaleDualityAndPerverseSheavesPartIIPerfectEquivariant, items minus E06 and IC-stalk-parity plus B02, B03; new route 19;
route 8 gains IC-stalk-parity; route 6 loses B02, B03). Current file: route 7 'route': 'source', 21 items; route count
18.

**Fix.** When applying RT-AREA-etale/16, also move PAPER-ZHU-17/B04 (Proposition B.2; it has no consumers) from route 6
to the Part II together with B02 and B03, and add B04 to the Part II brief's 'Also here, as tests' sentence
('Proposition B.1 (B02, B03) and Proposition B.2 (B04)'). Independently, drop G05 from E10's prerequisites: the
definition in A.3.5 (p. 482) is for any closed normal pro-unipotent J_1 of finite codimension; the congruence subgroups
are only an instance. Also: Move PAPER-ZHU-17/BC4 from route 6 to route 17 (its object M_{N,h} lives there), or delete
the edge BC4 -> B14 and state Conjecture IV in GS0 terms (semi-ampleness of a model of L̃_det on G̃r_N), which is what
Prop. B.2 needs. Also: When route 19 is created, replace E06's prerequisites by the finite-type inputs it actually uses
(the EDC.5 intersection complex IC_X(L) = j_!*(L[d]) and the EDC.0-EDC.3 operations, recorded as notes since they are
atlas stages, not items), and add to the Part II a one-line transport item 'decomposition for perfectly proper maps of
separated pfp perfect spaces, via ε^* on models' that consumes E06 and feeds S02, Q02, Q03, Q05, B02. Also: Apply edits
1-6 of RT-AREA-etale.fixes.md §'/16' to PAPER-ZHU-17.result.json and record the route 7 and route 19 verdicts in
PAPER-ZHU-17.review.json; in the new Part II's imports replace 'ZHU-17/A09, planned at SF.0' by the SF owner chosen
under the first finding.

### /5 — duplicate

**Where.** research/blueprint/papers/PAPER-ZHU-17.result.json route 1 (SchemeAndStackFoundations), its imports, and
items /A05, /A06, /A07, /A08, /A09, /A100-/A108, /A110-/A113, /A12, /A20, /A21, /A23 (status planned, SF.0);
research/blueprint/papers/PAPER-ZHU-17.result.json route 1 (SchemeAndStackFoundations, stages SF.0, SF.4) versus route 2
(SchemeAndStackFoundations, stages SF.1, SF.2); items A05-A09, A100-A108, A110-A113, A12, A20, A21, A23;
research/blueprint/papers/PAPER-ZHU-17.result.json items A05-A09, A100-A108, A110-A113, A12, A20, A21, A23 (status
planned, SF.0) and A01-A04 (status missing); research/blueprint/papers/PAPER-ZHU-17.result.json routes 1 and 2 (stage
placement of Appendix A within SchemeAndStackFoundations); research/blueprint/papers/PAPER-ZHU-17.result.json route 1
(Zhu Appendix A perfect-space carrier to SchemeAndStackFoundations) versus GeometricSatakeAndFusion:GS0:Witt-geometry
and the RT-AREA-etale/16 Part II brief

**Claim.** The 22 Appendix A items marked planned at SchemeAndStackFoundations:SF.0 are not planned there: SF.0
('Schemes and morphisms') and its reviewed audit targets contain nothing on Frobenius, perfection, perfect or pfp
algebraic spaces, and algebraic spaces themselves are SF.1 targets (audit: 'absent'). The only stage text that plans
Zhu's Appendix A is GeometricSatakeAndFusion:GS0:Witt-geometry, and the accepted PAPER-HE-21 route 7 sends the very same
statements (HE-21/133 = Zhu Cor. A.3 + Remark A.4 = A07 + A08; HE-21/134 = Zhu Prop. A.17 = A23) to
GS0:loop-geometry/GS0:Witt-geometry as missing. So Appendix A has two owners, and route 1's reason ('already used by
BS17 and HE21') is false for HE21. Route 1 also lists 'HE21/133-134' as an import while route 6 (GS0:Witt-geometry)
imports 'SF.0/SF.1 perfect geometry': installed together these give the cycle SF.0 -> GS0:Witt-geometry -> SF.0. The
accepted PAPER-BHATT-SCHOLZE-17 route 1 marks the same perfection lemmas missing at SF.0 (S3040-S3054, its Lemma 3.4,
and S308, étale-site invariance), contradicting Zhu's planned A100-A113 and A09. Also: Route 1 plans perfect ALGEBRAIC
SPACES at SF.0, but algebraic spaces themselves (A01-A04) are routed to SF.1/SF.2 (route 2), and SF.1 requires SF.0 in
the atlas. All 22 items marked planned at SchemeAndStackFoundations:SF.0 depend (transitively, through A05/A06 -> A02 ->
A01) on route-2 items, and route-2 items depend back on route 1 (A29 -> A27, A28; A30 -> A22, A31; A18 -> A17, A112).
The two routes' own import lists state the cycle: route 1 imports 'SF.1 torsor descent' while route 2 imports 'SF.0
perfect models'. As routed, SF.0 must consume SF.1 and SF.1 must consume SF.0. Also: Protocol section 16 makes an item
planned only when an atlas layer plans it. SF.0's text plans schemes, quasi-coherent modules, relative Spec/Proj and
morphism properties; it never mentions Frobenius, perfection, pfp models or algebraic spaces, so the 22 'planned SF.0'
statuses are unsupported. Conversely SF.1 explicitly plans 'effective fpqc/fppf descent ..., algebraic-space quotients,
representable diagonals and atlas independence', yet A02 (algebraic spaces), A03 (fpqc sheaf property) and A04 (fpqc
effective epimorphisms) are missing. The same theorems from Bhatt-Scholze, routed to the same SF route (BS17
S3040-S3046, S3053, S3054: Lemma 3.4 = Zhu Lemma A.7), are recorded as missing, so the two extractions disagree on the
status of identical statements in the same layer. Also: The split of Appendix A between route 1 (SF.0, SF.4) and route 2
(SF.1, SF.2) inverts SF's stage order (SF.0 -> SF.1 -> SF.2 -> SF.3 -> SF.4). Route 1 places perfect algebraic spaces at
SF.0 (A05, whose report-listed prerequisite is A02), but algebraic spaces (A02) are route 2 at SF.1/SF.2. The proof
inputs of Theorem A.29/A.30 and Lemma A.31 (keel-mori-local-structure, finite-flat-groupoid-quotients,
ferrand-splitting-inputs, flatness-modulo-intersection, and A31 itself) are in route 1, while A29, A291 and A30 are in
route 2, although route 2's reason says it owns 'the revised free-action quotient theorem once, including A.30–A.31
flatness'. Inputs at SF.4 (or SF.0, before stacks exist) cannot feed theorems at SF.1. Torsor items are likewise split
(A13 in route 2; A14, A15, A27 in route 1). Also: Two owners are named for the same carrier (perfect algebraic spaces,
pfp, finite-type models, Prop. A.17/A.15). Zhu's extraction sends it to SchemeAndStackFoundations (route 1: 'General
perfect spaces and finite-type models stay in SchemeAndStackFoundations'), while the atlas text of GS0:Witt-geometry
plans it ('Use Zhu §§1.1-1.4 and Appendix A for the perfect-space carrier and its relation to finite-type models'), and
the confirmed RT-AREA-etale/16 fix makes the new perfect-scheme Part II import 'GeometricSatakeAndFusion
GS0:Witt-geometry (the carrier and models, G05)' while also importing A09 'planned at SF.0'. G05 (congruence subgroups)
is not the carrier. Coordinator note: PAPER-BHATT-SCHOLZE-17 is cited as an existing record; this session verified its
red team (REV-RT-PAPER-BHATT-SCHOLZE-17, PR #5457), which does not concern the items cited; PAPER-HE-21 is cited as an
existing record; this session verified its red team (REV-RT-PAPER-HE-21, PR #5401), which does not concern the items
cited; RT-AREA-etale is cited; this session reviewed part 2 of its fixes (REV-FIX-RT-AREA-etale~2, PR #5317, the Habiro
packets only), not the fix for /16. Nothing here rests on a verdict of this session.

**Evidence.** SF.0 description: 'Construct schemes, quasi-coherent modules and relative Spec/Proj, affine gluing and
fiber products. State flat, smooth, etale, proper, separated and finite-presentation hypotheses as properties of named
morphisms.' data/library-coverage.json SF.0 targets: schemes, quasi-coherence, relative Spec/Proj, gluing, fibre
products, morphism properties; SF.1 target 'Algebraic spaces and algebraic-space quotients' = absent. GS0:Witt-geometry:
'Use Zhu §§1.1–1.4 and Appendix A for the perfect-space carrier and its relation to finite-type models'. PAPER-HE-21/133
(locator 'Zhu17 Appendix A.1.2, Corollary A.3 and Remark A.4'): 'the perfection functor on algebraic spaces is right
adjoint to inclusion of perfect spaces, and ε_X:X^perf→X is a universal homeomorphism'; PAPER-HE-21/134 (locator 'Zhu17
Proposition A.17'): 'There are finite-presentation algebraic spaces X0,Y0 and f0:X0→Y0 with f=f0^perf'; HE-21 route 7
stages GS0:loop-geometry, GS0:Witt-geometry, review 'accept'. Paper p. 465: 'Corollary A.3. The embedding AlgSp^pf_k →
AlgSp_k admits a right adjoint functor, given by X ↦ X^{p^-∞}'; p. 466 Remark A.4: 'ε : X^{p^-∞}→X is a universal
homeomorphism'; p. 472: 'Proposition A.17. Let f : X→Y be a morphism between pfp perfect algebraic spaces over k. Then
there exists a morphism f′ : X′→Y′ ... such that f = f′^{p^-∞}.' Route 1 imports: ['Pinned Scheme/PerfectClosure', 'SF.1
torsor descent', 'HE21/133–134 and BS17 general models']; route 6 imports: ['SF.0/SF.1 perfect geometry', ...].
PAPER-BHATT-SCHOLZE-17 S3040-S3054 and S308: status missing, route 1 (SF.0/SF.4). (Disclosure: session cc-c2c06b wrote
REV-RT-PAPER-HE-21 and REV-RT-PAPER-BHATT-SCHOLZE-17, verifications of red teams on those papers; the extraction items
cited here are not touched by either.) Also: Item prerequisites in the result file: A05 (planned SF.0) PRE [L23, A02];
A06 (planned SF.0) PRE [A02]; A14, A15 PRE A13; A17 PRE A01; A19 PRE A04 (all route 2); A29 (route 2) PRE [A28, A27,
A18, A30]; A30 (route 2) PRE [A22, A31] (route 1). Route 1 imports: ['Pinned Scheme/PerfectClosure', 'SF.1 torsor
descent', 'HE21/133-134 and BS17 general models']; route 2 imports: ['SF.0 perfect models', ...]. data/atlas.json
stageEdges: {'source': 'SchemeAndStackFoundations:SF.0', 'target': 'SchemeAndStackFoundations:SF.1'}. SF.0's text:
'Construct schemes, quasi-coherent modules and relative Spec/Proj ...' (no algebraic spaces); SF.1: 'Descent and
algebraic spaces/stacks'. Paper: Lemma A.2, Cor. A.3, Prop. A.5, Lemma A.7 are all stated 'for algebraic spaces' (pp.
465-467). Also: data/atlas.json SchemeAndStackFoundations:SF.0 description: 'Construct schemes, quasi-coherent modules
and relative Spec/Proj, affine gluing and fiber products. State flat, smooth, etale, proper, separated and
finite-presentation hypotheses as properties of named morphisms.' SF.1: 'Prove effective fpqc/fppf descent for the
required objects, algebraic-space quotients, representable diagonals and atlas independence.' PAPER-BHATT-SCHOLZE-17
S3040 'A morphism of F_p-schemes is quasi-compact if and only if its perfection is quasi-compact' status missing, route
1 SF.0/SF.4. Zhu A100 'f has quasi-compactness if and only if f^perf has it' status planned SF.0. Also: Atlas requires:
SF.1 requires SF.0; SF.2 requires SF.1; SF.3 requires SF.2; SF.4 requires SF.3. Route 2 items: A01, A02, A03, A04, A13,
A16, A18, A29, A291, A30; route 2 reason: 'Own perfect-site torsors, groupoids and the revised free-action quotient
theorem once, including A.30–A.31 flatness.' Route 1 items include A14, A15, A27, A31, keel-mori-local-structure
(locator 'Proof of Theorem A.29, p. 476'), finite-flat-groupoid-quotients ('Proof of Theorem A.30, pp. 476-477'),
ferrand-splitting-inputs and flatness-modulo-intersection ('Proof of Lemma A.31, p. 477'). Report item A05: 'Planned
stages: SchemeAndStackFoundations:SF.0. Prerequisites: L23, A02.' Also: data/atlas.json
GeometricSatakeAndFusion:GS0:Witt-geometry: 'Construct the perfectly finitely presented Grassmannian/flag spaces ... Use
Zhu §§1.1-1.4 and Appendix A for the perfect-space carrier and its relation to finite-type models'. PAPER-ZHU-17.md line
137. RT-AREA-etale.fixes.md /16 brief 'Imports: GeometricSatakeAndFusion GS0:Witt-geometry (the carrier and models,
G05); AdicCoefficientsAndComparisons L2 ..., and the étale-site invariance under perfection (ZHU-17/A09, planned at
SF.0)'. E01 PRE [A09, A23] (route 1).

**Fix.** Choose one owner for the perfect-space carrier. Consistent with the accepted BS17 route 1 and route 1's own
reason, keep SchemeAndStackFoundations as owner: set status 'missing' and planned [] on the 22 items; delete
'HE21/133–134 and BS17 general models' from route 1's imports; add a maintainer note that PAPER-HE-21/133 and /134
restate A07+A08 and A23 and should be re-pointed to the SF owner, and that GS0:Witt-geometry's sentence should read
'Import the perfect-space carrier and its finite-type models (Zhu Appendix A) from SchemeAndStackFoundations'. Update
summary/coverage counts to 25 library, 23 planned, 276 missing, and the report. (The RT-AREA-etale /16 fix text cites
'ZHU-17/A09, planned at SF.0'; change it to 'routed to SF'.) Also: Merge routes 1 and 2 into one source route to
SchemeAndStackFoundations with stages SF.1 and SF.2 (SF.2 for A09, which is a statement about small étale sites),
keeping SF.4 only if the blueprint wants the quotient theorem there and then placing A22, A27, A28, A31 no later than
A29/A30. Replace 'planned': ['SchemeAndStackFoundations:SF.0'] on the 22 items by the new stage (or by status missing,
see the next finding), and delete the import 'SF.1 torsor descent' from route 1 and 'SF.0 perfect models' from route 2.
Also: Set status 'missing' (with route 1 as their route) on A05-A09, A100-A108, A110-A113, A12, A20, A21, A23 and delete
their 'planned' fields; set A02 (and A03, A04 if the SF blueprint accepts that SF.1's 'effective fpqc descent' covers
them) to status 'planned', planned ['SchemeAndStackFoundations:SF.1'], keeping them on route 2 as a source. Also: Move
A31, keel-mori-local-structure, finite-flat-groupoid-quotients, ferrand-splitting-inputs, flatness-modulo-intersection,
A14, A15 and A27 from route 1 to route 2. Change route 1's stages to ['SchemeAndStackFoundations:SF.1',
'SchemeAndStackFoundations:SF.4'] (perfect algebraic spaces after algebraic spaces), or merge routes 1 and 2 into one
SF.1-SF.2 source route with the model/properness items kept at SF.4. Also: Keep one owner: SchemeAndStackFoundations
(route 1 after the stage repair above). Maintainer edit to the GS0:Witt-geometry text: replace 'Use Zhu §§1.1-1.4 and
Appendix A for the perfect-space carrier and its relation to finite-type models' by 'Import the perfect-space carrier
and finite-type models (Zhu Appendix A.1-A.2) from SchemeAndStackFoundations; use Zhu §§1.1-1.4 for the Witt lattice
geometry'. In the RT-AREA-etale/16 Part II brief replace 'GeometricSatakeAndFusion GS0:Witt-geometry (the carrier and
models, G05)' by 'SchemeAndStackFoundations (Zhu A.1-A.2: perfect spaces, models, Prop. A.17; items A05-A23, A265) and
GeometricSatakeAndFusion GS0:Witt-geometry (congruence subgroups, G05)'.

## All findings

Locations are in the extraction’s `result.json` unless stated.

| Finding | Severity | Kind | Where | Claim (abridged) |
|---|---|---|---|---|
| /1 | high | duplicate | items /greenberg-realization, /lemma-1-5-minuscule-relative-position, …; … | Sixteen items added in review restate numbered results of §§1.1-1.3 that already have G-items with the same statement and locator: greenberg-realization = G02; … |
| /2 | high | error | items /S07 and /Q04 (sourceIssue E47 not propagated); … | Several confirmed sourceIssue corrections were recorded but never carried into the items they correct, so the item statements (or their proof outlines) still … |
| /3 | high | duplicate | items /S04, /S07, /semi-infinite-orbits-locally-closed-iwasawa, …; … | These items are marked 'missing' and sent by route 8 to GS1/GS2/GS4. But the accepted base decomposition of GeometricSatakeAndFusion already plans the … |
| /4 | high | error | route 6 (GeometricSatakeAndFusion:GS0:Witt-geometry) versus route 7 …; … | There is a route cycle GS0:Witt-geometry -> EDC -> GS0:Witt-geometry: route-6 items B02 and B03 (Proposition B.1) require route-7 items E06, E13, E14, while … |
| /5 | high | duplicate | route 1 (SchemeAndStackFoundations), its imports, and items /A05, …; … | The 22 Appendix A items marked planned at SchemeAndStackFoundations:SF.0 are not planned there: SF.0 ('Schemes and morphisms') and its reviewed audit targets … |
| /6 | medium | missing | sourceIssues (new), item /G25, notes of … | The proof of the second assertion of Theorem 1.4 (G reductive over O implies Gr_G ind-perfectly proper) has a gap for ramified O, and no sourceIssue records … |
| /7 | medium | error | items /G29 (prerequisites, proofSteps), /G27, /G28, /G24, /G02, /G03, … | The prerequisites of G29 (Theorem 1.4) are G15, G24, G25 and G28. They omit G23 (Corollary 1.19, the paper's proof that Gr_GLn is ind-perfectly proper) and the … |
| /8 | medium | missing | prerequisites; … | Three works that §1's proofs rest on are absent from the prerequisites list. (1) [Kat79] Katz, Slope filtration of F-crystals: Lemma 1.6 is 'recalled' from it … |
| /9 | medium | error | item /normalised-intersection-cohomology | The item says that IH_{L+G}(Gr_≤μ) := H*_{L+G}(Gr, IC_μ[−(2ρ,μ)]) and IH*(Gr_≤μ) 'are concentrated in degrees 0,…,2(2ρ,μ)'. That holds for IH*, but the … |
| /10 | medium | error | items /S07 (prerequisites) and /Q02 (prerequisites); … | Cor. 2.8 proves equidimensionality from Proposition 2.7, but S07's prerequisites (S04, H01, H02, E08) omit S11. Adding S11 naively creates a cycle, because Q02 … |
| /11 | medium | error | item /S01 | S01 combines the abelian category P_{L+G}(Gr_G) with the monoidal structure ('Sat_G is the monoidal category (P_{L+G}(Gr_G), ⋆) ... (perverse by Proposition … |
| /12 | medium | error | the 104 added items (no prerequisites field, never cited as …; … | None of the 104 added items has a prerequisites field, and no item lists any of them as a prerequisite. The cited inputs of §2.1–2.3 are therefore disconnected … |
| /13 | medium | missing | items /G28 and /IC-stalk-parity (cited input of Lemma 2.1) | The proof of Lemma 2.1 rests on 'the Demazure resolution (1.4.2) whose fibers have pavings by (perfect) affine spaces'. No item states this paving. §1.4.2 … |
| /14 | medium | missing | items /Q02, /Q03 (cited computation [NP01, §8]) | The quasi-minuscule case of Lemma 2.11 ends by citing a computation in the flag variety Ḡ/P̄_θ ([NP01, §8]), which compares H^i(C) with H^i_c(π^{-1}(S_0 ∩ … |
| /15 | medium | missing | items /commutativity-constraint-characterisation, /O10i, /O13, /O10, … | Many load-bearing results in §§2.4-3 have no edges in the dependency graph. (1) Proposition 2.21 (commutativity-constraint-characterisation) has no … |
| /16 | medium | error | items /D05, /D03, /D12, /R03, /R05 (prerequisites) | Several prerequisite lists are wrong. D05 is the N ≃ 𝔫 input to the GHKR Levi reduction (D03), but it depends on D04, the superbasic reduction that comes after … |
| /17 | medium | missing | item /H07 (proofSteps, prerequisites); … | H07's proofSteps rely on 'the equal-characteristic IC trace realization' of P^{σ,⋄}, but no item records it and H07's prerequisites (H03, H04, H06) do not … |
| /18 | medium | error | route 5 (BunGAndNewtonStrata, source) item /remark-3-6-norm-on-classes | Remark 3.6 is routed as a source item to BunGAndNewtonStrata BG0/BG1, but those stages plan no norm map and no Weil-restriction comparison of σ-conjugacy … |
| /19 | medium | duplicate | item limits-and-finite-presentation (route 1) and its consumers A23, … | The cited approximation theorem ([Gro66 §8.14], [CLO12 Prop. A.3.1], [St 049I]: Hom from a limit of qcqs spaces with affine transitions into a locally finitely … |
| /20 | medium | missing | Appendix A cited inputs; … | Several results the Appendix A proofs cite have no item: (i) topological invariance of the étale site under universal homeomorphisms of schemes [St, Tag 04DZ] … |
| /21 | medium | library-claim | item A263 (proofSteps) and item perfect-grassmannian-notation | A263's proof step says 'do not identify its quotient convention with Mathlib subspace Grassmannians without dualization'. At the pin Mathlib's Grassmannian is … |
| /22 | medium | duplicate | route 4 (items /G24, …; … | Witt-Grassmannian geometry is routed to ReductiveGroupsPartII and BunGAndNewtonStrata, whose stage texts plan no affine Grassmannian, while the accepted … |
| /23 | medium | duplicate | route 18 (GeometricSatakeAndFusionPartIIRationalGelfandProof): items …; … | The Part II's end results (Prop. 2.21, the commutativity constraint, and Cor. 2.22, symmetry and hexagon) are already planned: GS3:fusion constructs the … |
| /24 | medium | library-claim | items /witt-vectors-of-perfect-rings and /teichmuller-lift (route 3); … | Both are marked missing although the pinned Mathlib proves most of them and RF0 plans the rest. For perfect R of characteristic p, Mathlib has … |
| /25 | low | library-claim | items /G08, /G12 (and /lemma-1-8-cartan if kept) | The existence half of the elementary-divisor statement in (1.2.1), that bases with β(e_i) = p^{m_i} f_i exist, and hence the transitivity in Lemma 1.8(i) are … |
| /26 | low | missing | items /G19, /G33, /convolution-map-1-3-3 | Several claims of §1 have no item. Remark 1.15 defines the equal-characteristic Demazure variety G̃r^♭_N and the bounded Gr̄^♭_N, and asserts G̃r_N ≅ … |
| /27 | low | library-claim | item /L43 (consumer /A01; … | L43 supplies the fppf topology as the carrier for A01 ('Fpqc space'). The paper's spaces, including Gr_G = [LG/L^+G] of §1.1.2, are sheaves for the fpqc … |
| /28 | low | error | item /G01 (status planned in RelativeFarguesFontaine:RF0) | G01 is the coefficient ring W_O(R) = W(R) ⊗_{W(k)} O, with O any totally ramified extension of W(k) and k an arbitrary perfect field (the setting of Theorem … |
| /29 | low | other | items /S01, /S03, /S04, /S08, /S13, /S14, /S15, /S16, /Q05, /Q06, … | Presentation slips. (1) Several locators are vague or lack pages: S01 '§2.1' (category p. 430, monoidal structure p. 433); S03 '§2.1' (pp. 430–432); S04 '§2.2' … |
| /30 | low | missing | sourceIssues (pp. 449, 452, 457, 459) and item /D05; … | Four slips in the range are not recorded. (a) p. 449: the bottom arrow of the Θ-diagram is labelled H^*(c'_{A1⋆A2}) for H^*(c'_{A1,A2}). (b) p. 452: 'degree 2j … |
| /31 | low | error | items /H05 and /H06 (planned … | H05 and H06 are stated 'over C' (Ginzburg, MV07, LY13's based loop group of a compact group). H05 is marked planned at GS.1, which plans ℓ-adic geometric … |
| /32 | low | missing | items /T02, /T03 | §2.5 obtains rigidity, finite type and connectedness 'as in [MV07, §7]'. That argument rests on the Deligne–Milne criteria: [DM82, Prop. 1.20] (rigidity from … |
| /33 | low | error | items /S17 and /O06 | S17 records only the second half of Proposition 2.20. It omits the first assertion, that the L^+G-equivariant hypercohomology H^*_{L+G}: Sat_G -> Proj_{R_G} … |
| /34 | low | other | uses.where of /G34, /O05, /D02, /D06, /D07; … | Several locator and label slips remain. G34 and O05 cite 'Theorem2.21', repeating the paper's misprint E55; it is Proposition 2.21. D06 and D07 cite … |
| /35 | low | library-claim | items A01 (prerequisite L43) and L43 | A k-space (A01) is an fpqc sheaf, but A01's only topology prerequisite is L43, the fppf topology; L43 has no other consumer. Mathlib at the pin has the fpqc … |
| /36 | low | library-claim | items A07, A09, E01, A266, A267, A26, zariski-main-theorem-spaces | Pinned declarations that supply the scheme or affine case of Appendix A items are not cited anywhere, although the brief asked for library reuse: the affine … |
| /37 | low | duplicate | sourceIssues E29 and E70 | The single misprint 'php' on p. 482 is recorded twice: E29 bundles it with the unrelated B.1 slip 'E/E_0', and E70 records it alone with a different correction … |
| /38 | low | other | items B10 and remark-B5-ic-comparison | Both items point to a 'new source issue' that does not exist. B10 says 'In the unqualified form it fails when Gr_{≤λ} is a point, e.g. GL_2, λ = (1,1) < μ = … |
| /39 | low | missing | item BC3 (Conjecture III) and prerequisites | BC3 says Conjecture III is 'Not proved'. Anschütz-Gleason-Lourenço-Richarz (arXiv:2201.01234) prove it for Schubert varieties in the μ-admissible locus … |
| /40 | low | error | item E04 | E04 asserts the perverse t-structure on D^b_c of 'a pfp perfect space'. The paper sets up constructible sheaves, D^b_c, six operations and perverse sheaves … |
| /41 | low | other | routes 13-18: imports, briefs and reasons | The Part II briefs do not consistently name imports by title and stage id (PROTOCOL 16). Routes 13, 14 and 15 have empty 'imports'; their briefs give … |
| /42 | low | other | routes 15 and 17, field title | Both titles start with the parent's pre-RS-22 title. The accepted RS-22 retitled HeckeStacksAndLocalShtukas 'Hecke correspondences on the Fargues–Fontaine … |
| /43 | low | other | research/blueprint/papers/PAPER-ZHU-17.md (route section, item …; … | The report contradicts the JSON beyond the counts it flags as superseded. Route headings 16-18 carry old titles ('Finite flat groups and integral p-adic Hodge … |
| /44 | low | other | item /equal-characteristic-affine-grassmannian (route 10) | Three accepted extractions disagree on the status and owner of the equal-characteristic affine Grassmannian. Zhu marks it missing and routes it to … |

## Notes for the fix job

- **Apply the confirmed corrections first (/2).** Carry E21, E27, E46, E47, E52, E58, E63 and E64 into the items they
  correct.
- **Remove the duplicates (/1).** Delete or merge the review-added copies, keeping one item per result with one status
  and owner.
- **Re-route Appendix A (/5).** Choose one owner for the perfect-space carrier: GS0:Witt-geometry, or a
  SchemeAndStackFoundations stage that actually plans perfection and algebraic spaces. Fix the SF.0 statuses
  accordingly.
- **Break the cycles (/4).** Move E10’s G05 input, BC4 and the RT-AREA-etale/16 Part II so that EDC and the HeckeStacks
  Part II do not import GS0:Witt-geometry back.
- **Point items at the existing GeometricSatakeAndFusion nodes (/3).** These are the semi-infinite orbits, the MV
  dimensions, IC parity and semisimplicity, as FS21 already does.
