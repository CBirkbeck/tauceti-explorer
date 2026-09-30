# RT-PAPER-NELSON-VENKATESH-21: red team of the Nelson–Venkatesh orbit-method extraction

Red team: Claude Code, session `cc-f805bf`, 30 September 2026 (issue #4334).

**Target.** `PAPER-NELSON-VENKATESH-21` extracts P. D. Nelson and A. Venkatesh, *The orbit method and analysis of automorphic forms*, [Acta Math. 226 (2021), 1–209](https://doi.org/10.4310/ACTA.2021.v226.n1.a1) (arXiv [1805.07750](https://arxiv.org/abs/1805.07750)).

**Who did what.**
- Claude Code `cc-d67081` wrote a partial checkpoint (PR #2214).
- Claude Code `cc-442dc5` completed the extraction (PRs #2227, #2230).
- `REV-PAPER-NELSON-VENKATESH-21` was written by Claude Code `cc-7b31c4` (PR #2360). It accepted both routes and corrected one library citation.
- I did none of this. The string `cc-f805bf` occurs in none of the four target files, in the handoff or in the commits that touch them.

**Disclosure.**
- This session wrote FIX-RT-AREA-automorphic-1 (PR #4648), which proposed the stages AutomorphicFormsOnReductiveGroups AF.1b (real representation theory, including the Langlands classification) and AF.1c (Paley–Wiener).
  - Finding 5 names AF.1b as an owner of the real Langlands classification.
  - That finding rests on the merged fixes file and on an accepted route of BEUZARTPLESSIS-LIU-ZHANG-ETAL-21, not on my judgement.
- This session also wrote PAPER-LUST-STEVENS-20, which joined SmoothRepresentationsPartII. No finding depends on it: finding 6 concerns SR.3 of the base roadmap.

**Result: fourteen findings.** Two are high, ten medium and two low. The machine-readable file is [RT-PAPER-NELSON-VENKATESH-21.result.json](RT-PAPER-NELSON-VENKATESH-21.result.json).

- **Where the work is sound.**
  - Every numbered statement of the paper has an item, and all 99 locators are right.
  - The nine library citations hold at the pins.
  - All fifteen recorded source issues are real.
- **Where it breaks.**
  - E1 is understated: in the dihedral (SO3, SO2) case the main theorem is false, not just unproven.
  - Several item statements drop hypotheses or copy false statements.
  - Five pieces of mathematics are planned twice or split between owners.
  - Two "planned" statuses are too generous.
  - Many mistakes in the paper went unrecorded.

## Source

| Text | Where | SHA-256 |
| --- | --- | --- |
| Published, Acta Math. 226 (2021), 209 pp. | [International Press PDF](https://www.intlpress.com/site/pub/files/_fulltext/journals/acta/2021/0226/0001/ACTA-2021-0226-0001-a001.pdf), fetched 30 September 2026 | `85e14654…aea76e` (matches the extraction) |
| arXiv v3 (7 January 2021, the latest; v1 May 2018, v2 July 2019) | [arXiv](https://arxiv.org/pdf/1805.07750v3) | `9bce49cb…22c03e` (matches) |

- **How I read it.**
  - I read the whole paper, part by part, in a text extraction with journal page markers.
  - I rendered about twenty-five pages at up to 300 dpi to settle symbols. The images decided E1 (p. 182), the reversed region (p. 136) and the missing y (p. 95).
  - Parallel readers covered the four parts. I verified every finding filed here at its locator myself.
- **Errata.** Crossref registers no update for the DOI, and I found no erratum.

## Findings

### 1. Theorem 27.1 and the main average (31.3) are false for dihedral (SO3, SO2) (high, error)

**What the extraction says.**
- E1 records that the proof of Lemma 27.3 claims the spinor norm is surjective on SO_{n−1} "for n−1⩾2", which fails for SO2.
- It leaves open (gap G-SO3) whether Theorem 27.1 and Theorem 31.11 fail when Π ≅ Π ⊗ (η_{K/F}∘θ).

**They fail.** Take this data:
- F = Q, and D a quaternion division algebra split at ∞.
- G = PD^× = SO(D⁰, Nrd), and H = K^×/Q^× for an imaginary quadratic field K ⊂ D.
- Π the Jacquet–Langlands transfer of a dihedral π(ψ). Then Π is tempered and a discrete series D_k at ∞, and Π ⊗ χ ≅ Π with χ = η_K∘Nrd = η_{K/F}∘θ.

§25.7 allows this data. The argument:
1. χ is trivial on G(F), on H(A) and on G(A)⁺. So every H-period of φ equals that of χφ.
2. Multiplication by χ preserves Π and factors as ⊗M_v.
   - At ∞, χ_∞ = sgn∘det. So M_∞ commutes with PGL₂(R)⁺ ⊇ SO(2) and swaps the sign on the two halves D^±: it acts by c·sgn(n) on SO(2)-weight n.
   - Elsewhere M_v preserves the unique H_v-functional up to a sign c_v.
3. Hence the Σ-period vanishes identically whenever c·sgn(n)·∏c_v = −1. For fixed σ′ that happens for every Σ of one sign of weight.
4. A one-sided admissible U and U′ = {σ′} therefore give an average of L(Π, Σ) equal to 0, not ½.

This is the familiar ε-dichotomy for CM forms: L(½, π_K ⊗ Ω) = L(½, ψΩ)L(½, ψ^cΩ), and one factor has root number −1 on one side.

**What survives.**
- The weak subconvex bound (1.4). [a] ≥ 0, and [H] meets at least half of the components, so the upper bound costs a factor of at most 2.
- The unitary cases.

**A smaller slip in the same sentence.** Local surjectivity also fails at definite real places even when dim V_H ≥ 3. There Kneser's theorem repairs the argument globally.

**Fix.**
- Make E1 an error affecting a stated result.
- Add the hypothesis Π ≇ Π ⊗ (η_{K/F}∘θ) for (SO3, SO2) to items /85, /86 and /98.
- Close gap G-SO3.
- Correct both briefs.

### 2. Two items drop a hypothesis and are false as written (high, error)

- **/48 (Theorem 14.5).** It omits §14.3's "assume that k is algebraically closed".
  - Over R the item fails. For (SO(3), SO(2)) a stable pair (a, b) with |b| > a has an empty fibre, so g → [g]×[h] is not onto.
- **/56.** It states (17.3), O_{π,σ} = O_π(λ_σ) = O^{λ_π,λ_σ}, without the paper's "and O_{π,σ} is non-empty" (p. 117).

### 3. Four items copy false statements from the paper (medium, error)

- **/26 (Cotlar–Stein).** The paper says the series converges "in the Banach space of bounded linear operators" (p. 62). It converges only strongly.
  - Counterexample: rank-one projections onto an orthonormal sequence satisfy both Cotlar–Stein bounds with C = 1, but their partial sums are not Cauchy in norm.
- **/23 ((8.3), p. 57).** A factor h^{−|α|} is missing, since a_h^∨(x) = h^{−n}a^∨(x/h).
- **/3 (p. 28).** Op(a⋆_h b, χ′) should be Op_h(a⋆_h b, χ′), as Theorem 5.8 writes it.
- **/22 (Lemma 7.14).** The sign (−h)^j should be h^j under the paper's own convention (4.1).

Nothing downstream breaks. All four should become sourceIssues.

### 4. Other items omit hypotheses (medium, error)

- **/75.** It drops "φ₊ positive definite" from Definition 24.3(ii).
- **/68.** The normalisation (22.8), on which (22.11) depends, is only in the note.
- **/40.** Lemma A.1(i) is for τ-isotypic v only.
- **/50.** It needs π and σ tempered, and §15 works over R only.
- **/61–/62.** These are for an archimedean field.
- **/99.** It reads as if Σ were fixed.

### 5. The real Plancherel theorem and the real Langlands classification have several owners (medium, duplicate)

- **What this extraction does.** Route 1 sends /64 (Harish-Chandra's Plancherel formula) and /30 (the Langlands classification) to the new orbit-method roadmap.
- **Another accepted route.** BEUZARTPLESSIS-LIU-ZHANG-ETAL-21 (items /25 and /20(b), accepted after this review) sends both to AutomorphicSpectralTheory Part II.
- **An accepted fix.** The merged RT-AREA-automorphic-1 fixes make AF.1b the owner of the real classification (disclosure above).
- **Fix.**
  - Import /30 from AF.1b.
  - Choose one owner for the real Plancherel theorem.
  - Treat the p-adic half as in finding 6.

### 6. The p-adic tempered classification is already routed to SR.3 (medium, duplicate)

- **The overlap.** /72 (Lemma 23.4: tempered ⊂ induced from square-integrable) is Harish-Chandra's theorem.
- **Already routed.**
  - GAN-SAVIN-23's accepted source route puts it at SmoothRepresentationsOfLocalGroups SR.3.
  - LIU-ETAL-22 puts it at ET.4/ET.7a.
- **Fix.** Route /72 as a source of SR.3 next to /71, with Waldspurger's p-adic Plancherel formula.

### 7. GIT and Hilbert–Mumford are planned twice (medium, duplicate)

- **The two plans.**
  - /46 plans affine GIT, the stable locus and the Hilbert–Mumford criterion in the orbit-method roadmap.
  - FINTZEN-21's accepted route 4 already sends semistability, closed orbits and the destabilizing-cocharacter theorem to a Part II of Tau Ceti's Reductive algebraic groups (DESIGN-ReductiveGroupsPartIII, pending).
- **Fix.** Make that design the single owner, adding M//H and the principal-bundle statement it lacks.

### 8. The local relative character is split between the two new roadmaps (medium, duplicate)

- **The split.**
  - /59 (the definition of H_σ and the convergence (18.1)) goes to route 1.
  - Its positivity (/60) and its non-vanishing and ℓ_σ (/66) go to route 2.
- **The existing owner.** The GGP roadmap owns the same Ichino–Ikeda/N. Harris local integral through BEUZARTPLESSIS-CHAUDOUARD-ZYDOR-22 /4.
- **Fix.**
  - Move the definition to route 2.
  - Route 1 keeps the Plancherel disintegration and the uniform extension to Ψ^{−N}(π).

### 9. Ratner is not planned at GN.4 in the generality used (medium, error)

- **What GN.4 plans.** Only unipotent-flow proofs "needed for Oppenheim/Duke-type arithmetic applications". Its packet has no Ratner node.
- **What the paper needs.** Ratner's measure classification for a semisimple G∞, an arithmetic lattice and the unipotent part of a regular nilpotent centralizer, with ergodic decomposition. Borel's density theorem (Lemma 27.8) has no item.
- **Fix.**
  - Mark /89 missing and route it to route 1 in full generality, or request it from GN.4.
  - Add a Borel density item.

### 10. Chevalley restriction and Harish-Chandra for reductive g are not planned (medium, error)

- **What /28 needs.**
  - [g*_C] is an affine space ≅ t*/W.
  - γ : Z(U(g_C)) ≅ C[[g*_C]] for reductive g, since the paper's groups include U(n) and GL_n.
- **What the cited layers plan.**
  - LieHighestWeight layer 7 proves the isomorphism only for a Killing-semisimple split L.
  - Layer 9 (gl_n) has no Harish-Chandra isomorphism.
  - No layer states Chevalley's theorem.
  - AF.1 plans only "U(g_C), its center action".
- **Fix.** Add a missing item for the reductive statement, importing layers 7 and 9.

### 11. Cited inputs without items (medium, missing)

| Input | Where the paper uses it | Status and owner |
| --- | --- | --- |
| Local multiplicity one, dim Hom_H(π, σ) ≤ 1 | pp. 8, 122 | GGP roadmap, via JIANG-ZHANG-20's bessel-uniqueness |
| Schwartz kernel theorem | p. 179 | in neither library |
| Riesz–Markov–Kakutani | p. 179 | Mathlib `NNRealRMK.rieszMeasure` |
| Spinor norm | p. 182, the locus of E1 | Tau Ceti `CliffordAlgebra.spinorNorm` and `CliffordAlgebra.range_spinToSpecialOrthogonal_eq_ker_spinorNorm`; the local images and Kneser are missing |
| Compactness criterion | p. 185 | planned at AA.3 |
| Nelson's theorems on ∆ and π^∞ | p. 28 | no owner |
| Rao's local finiteness of orbital measures | p. 83 | no owner |
| Uniform admissibility | p. 163 | no owner |
| Cartan's connectedness theorem | p. 185 | no owner |

### 12. Sixteen further source mistakes (medium, missing)

All of these are in arXiv v3 too, except (viii).

| # | Page | Printed | Correct |
| --- | --- | --- | --- |
| (i) | 136 | the region ‖s−1‖ ⩾ h^{1/2−η}, which Lemma 19.8 shows is negligible | ⩽ |
| (ii) | 147 | (22.10) is claimed exactly, but the proof gives it only up to O(h^N) | a gap in the proof; the weaker form suffices for Theorem 30.1 |
| (iii) | 165 | Θ^unit for PGL₂ | include the negative interval (η∘det, twisted Steinberg, twisted complementary series). E3's correction repeats the omission, and for odd n the example also fails f ≥ 1 there |
| (iv) | 185 | "s⩽g" | s ⩾ g |
| (v) | 4 | "family size is the fourth power of the conductor" | fourth root (C ≍ \|F_h\|⁴, Lemma 31.10) |
| (vi) | 136 | κ = −cΣx² | this is 0 on the trivial K-type, so it cannot serve |
| (vii) | 110 | O^{λ,µ} as the fibre of g*×h* → [g*]×[h*] | the map g* → [g*]×[h*] |
| (viii) | 95 | the dim U′ = 1 line omits y | include y (published text only; arXiv v3 has it) |
| (ix) | 134 | "ψ≡0 on B(ω, 3h^δ)" | ψ≡0 outside that ball |
| (x) | 79 | b₂ | the sign in b₂ is wrong |
| (xi) | 69 | the right-division recursion | the correct recursion |
| (xii) | 43 | d | half the maximal orbit dimension |
| (xiii) | 88 | (O, π) | (O, ω) |
| (xiv) | 191 | tr(T1∗T2) | tr(T1∗T1) |
| (xv) | 3, 203 | [Z1] cited for the Ichino–Ikeda/N. Harris formula | [Z1] proves only the global GGP conjecture. Its hypothesis that every archimedean place splits, with §25.7, leaves only (U2, U1) |
| (xvi) | 155 | E15 locates Lemma 23.4 on p. 154 | p. 155 |

### 13. The GGP proposer list is wrong (low, other)

- **The brief's list.** It cites LESLIE-25, which never proposed the roadmap, and BEUZARTPLESSIS-CHAUDOUARD-25, whose route was rejected.
- **The review's list.** It names MAO-WAN-ZHANG-26, which later dropped the route.
- **The accepted proposers.** JIANG-ZHANG-20, BEUZARTPLESSIS-LIU-ZHANG-ETAL-21, BEUZARTPLESSIS-CHAUDOUARD-ZYDOR-22 and LIU-ETAL-22.

### 14. sourceVersions and review verdicts are missing (low, other)

- **sourceVersions.** E1 affects a stated result, so section 18 requires the list. The versions read appear only in prose.
- **Review verdicts.** The review's confirmations are not in the findings' `review` fields, so the register shows all fifteen as awaiting review.

## What I checked

- **Coverage.** About 150 numbered statements, each matched to an item. None is missing.
- **Locators.** All 99 are correct.
- **Statements.** The main theorems' items, compared hypothesis by hypothesis with the paper.
- **§25.7.** The pairs it allows and τ(G) = τ(H) = 2 for each of them.
- **Recorded source issues.** E1–E15 at their locators.
- **Library citations.** All nine at Mathlib 082e2d3 and Tau Ceti f790474; the review's in-place fix is right.
- **Atlas layers.** GN.4 with its packet; AA.2–AA.4; SR.1 and SR.3; AF.0–AF.5; LieGroups layers 0, 1, 3 and 9; LieHighestWeight layers 7 and 9.
- **Searches.** Every atlas stage and all 239 extractions, for the paper's key notions.
- **Design jobs.** Both are pending, so nothing was designed without this paper.
- **Areas.** Both are galaxy ids.
- **Independence.** Confirmed as described at the top.

## Validation

- `python3 scripts/check_redteam.py research/blueprint/redteam/RT-PAPER-NELSON-VENKATESH-21.result.json`: ok.
- `python3 research/blueprint/intake.py check-files` on both files: 2 files, 0 problems.
