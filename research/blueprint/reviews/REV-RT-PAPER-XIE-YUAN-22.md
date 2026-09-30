# REV-RT-PAPER-XIE-YUAN-22

**Complete: all ten findings confirmed.** Six of the fixes need corrections or completions, set out below.

- **Job.** Refs #4525.
- **Verifier.** Claude Code, session `cc-48533a`, 30 September 2026.
- **Independence.** The extraction (PAPER-XIE-YUAN-22), its review and the red team (RT-PAPER-XIE-YUAN-22, session `cc-f805bf`) were done by other sessions.
- **Verdicts.** They are in `research/blueprint/redteam/RT-PAPER-XIE-YUAN-22.review.json`, and `python3 scripts/check_redteam.py` reports it `ok`.

## Evidence and scope

- **Source.** arXiv:2108.09722v1 (SHA-256 2587e703…c2ab, the file the extraction read). It is the only arXiv version.
  - It was published as Invent. Math. 229 (2022), 607–637, doi:10.1007/s00222-022-01112-1, but Springer refused the request.
  - Every verdict is therefore about v1, as the red team's were. Finding 1 should be added to the extraction's existing published-version collation gap.
- **Method.** Three verifiers worked in parallel: finding 1; findings 2, 3 and 7; and findings 4, 5 and 6. The lead verifier checked findings 8–10 and read every verdict.
- **What was read:**
  - every quoted passage, on the page images;
  - every counterexample, re-derived step by step;
  - all 65 extraction items, for the "missing" findings;
  - the cited stage descriptions and packet nodes;
  - Tau Ceti's AbelianVariety files and the declaration index at the pinned commits;
  - Scanlon's arXiv paper, for finding 10.
- **Not read.** Gubler, Conrad and Yamaki could not be opened here. The theorem numbers quoted from them in finding 4 rest on the paper's own citations.

## /1 — confirmed, and stronger than stated (high)

The proof of Proposition 5.4 (p. 25) asserts "Both 𝒜′ and ℬ are abelian schemes over S" without argument, then applies Propositions 2.1 and 4.2 and Lemma 4.1(4) to these closures.

**The red team's example holds step by step:**
- On a chart the family G_λ ⊂ E × E is k[a][y]/(y^p), so it is flat of rank p, and it is a subgroup because its equation is linear.
- The quotient is Moret-Bailly's abelian scheme over P¹.
- Two subgroups that meet trivially at the generic point coincide at λ₀.
- So the closure of the image has a fibre of multiplicity p there. It is non-reduced and not normal.

**The step fails inside the paper's own hypotheses (a)–(e).** The Moret-Bailly family has non-trivial trace, so it shows the mechanism but not a failure under the paper's assumptions. A stronger example does:
- Take a non-isotrivial abelian surface 𝒞 over a projective curve that is generically ordinary and has trivial trace. For example, a general complete-intersection curve in the minimal compactification of A_{2,n}. It meets the p-rank ≤ 1 divisor.
- Generically 𝒞[F] ≅ μ_p², which has p+1 subgroups of order p.
- At a fibre of p-rank 1, 𝒞[F] ≅ μ_p × α_p, which has only two such subgroups. So two closures G, H coincide there.
- Then A = (𝒞/G × 𝒞/H)_K with A′ the image of 𝒞_K satisfies (a)–(e), and the closure of A′ is again non-reduced.

**Proposition 5.4 survives through Néron models, as the finding says:**
- A′ has good reduction (Poincaré reducibility and isogeny invariance), so its Néron model 𝒜′_N is an abelian scheme.
- ℬ_N = 𝒜 ×_S 𝒜′_N, and in these coordinates h is the second projection, so it is flat.
- Propositions 2.1 and 4.2 and Lemma 4.1(4) then apply unchanged.

**Fix, adjusted:**
- The replacement clause for good-reduction-model is right. Add that the closure is an abelian subscheme in characteristic 0, or whenever the kernel of the extended homomorphism is étale.
- Add NeronModelsAndSemistableAbelianVarieties:R11.5 ("preservation of good reduction under isogeny") beside R11.1.
- Record the new issue E16 as kind **error**, not gap, since the printed step is false. It affects the proof only. Its reason should give the trivial-trace example.
- The prop-5-4 note and the Part II brief should name the Néron models of A′ and B and cite E16 beside E2.

## /2 — confirmed (medium)

I(K/k) is the set of intermediate fields algebraically closed in K, of any transcendence degree.

- **What fails.** φ(k′) = k′ ∩ K is well defined, preserves order and is surjective. Only injectivity fails.
- **Counterexample.** φ(k(√s + t)‾) = k = φ(k̄). A point with x-coordinate √s + t is special over k′ but not over k, so the claimed equivalence fails too.
- **Characteristic 2.** In characteristic 2, √s is fixed by every automorphism, so the example needs u = s^{1/ℓ} + t with ℓ a prime different from the characteristic.
- **Statement survives.** The Galois argument is correct, so Proposition 3.6's statement stands. Use the compositum of all conjugates of F; "finitely many" needs a finiteness the statement does not give. The minimal-polynomial step suffices.
- **Cross-reference.** The algebraically closed case itself rests on Corollary 3.5(i), so E17 should cross-reference E18 (finding 3).
- **Theorem 1.1** survives as stated in the finding, since k̄₁ ∩ k̄₂ = k.

## /3 — confirmed, with a complete fix (medium)

- **The claim.** A flat quasi-finite ψ : U → S₁ × S₂ forces dim U = dim S₁ + dim S₂, which is algebraic independence of k₁ and k₂. Without it, V need not dominate S₁.
- **Example.** The finding's example is right: k(x,y)‾ ∩ k(z, x+yz)‾ = k, with the two fields dependent.
- **Where it bites.** Corollary 3.5(i) applies Proposition 3.2 to k′ and k_A with no control over their dependence.

**The dependent case can be proved, so the gap closes in full.** The proof is an induction on the defect δ = trdeg k₁ + trdeg k₂ − trdeg(k₁k₂):
- Choose a k₁-embedding τ of K = (k₁k₂)‾ with τK independent of K over k₁. Then k₂ ∩ τk₂ = k, and A₂ ∼ τA₂ over a common field.
- A degree count shows that the defect δ′ of the pair (k₂, τk₂) satisfies δ′ < δ. The equality case would make the locus of c over k₂ defined over k₂ ∩ τk₂ = k (by the paper's Lemma 3.4), forcing δ = 0.
- By induction A₂ ∼ A₀ ⊗ k₂ with A₀ over k, and Lemma 3.3 gives A₁ ∼ A₀ ⊗ k₁.
- The verifier checked the count on the finding's example (δ = 1 → 0) and on a δ = 2 example.

**Fix:**
- Record E18 as proposed: gap, affects the proof. Use this induction as its correction, in place of the open-ended option (a).
- Proposition 3.2, Corollary 3.5(i), Proposition 3.6 and E1's repair then stand as stated.
- The notes of prop-3-2 and cor-3-5-i, and the Part II brief, should say that the printed proof covers only independent k₁, k₂ and that E18 supplies the rest.

## /4 — confirmed (medium)

- **Extraction.** None of the 65 items states any of the listed properties of ĥ: functoriality under homomorphisms and isogenies, additivity on products, comparability, behaviour under extension, and the identification with the M_K-field Néron–Tate height.
- **Paper.** Lemma 5.3 (p. 24) and Proposition 5.4 (p. 26) use them, as do the reductions "by extending K and k" (pp. 23–25). The cited inputs of Conrad, Gubler and Yamaki are stated for M_K-field heights.
- **Libraries.** Neither library has a Néron–Tate height beyond Tau Ceti's elliptic-curve `canonicalHeight`.
- **Atlas.** RP.0, GZ.1 and DY.1 are for number fields.
- **Verdict.** "Missing" is right, and so is the owner: RP.0, as a source, beside PAPER-GAO-HABEGGER-19/5–6.
- **Fix, completed.** State the items at least for transcendence degree 1 (K the function field of a curve), where every use lies. The extension item must also cover extending the constant field k, citing PAPER-GAO-HABEGGER-19/72.

## /5 — confirmed (medium)

- **Extraction.** No item states the density of prime-to-p torsion.
- **Paper.** p. 27 uses it twice: off A′_{e+1}, and within each torsion component of f⁻¹(t).
- **Libraries.** Tau Ceti has only `mulBy` (AbelianVariety/End/Basic.lean:243), and its Isogeny.lean defers "the later torsion theory".
- **Atlas.** A3 plans the rank n^{2g} and étaleness but not density.
- **Fix.** The proposed statement, proof and owner (A3) are right. The item should also name its other inputs: divisibility of A, and either the quotient by an abelian subvariety (RP.5) or Poincaré reducibility (A6). Cite it in manin-mumford, torsion-subvariety and section-5-3.

## /6 — confirmed, with corrections (medium)

All four uses are real (pp. 20, 21, 26), and no item states any of the facts. The corrections:

- **"No roadmap mentions seesaw" is literally false.** Tau Ceti ModularCurves Layer 2D uses seesaw identities for the genus-one Poincaré bundle. That does not own the general principle, so the finding stands.
- **deg[m] = m^{2g} is already planned.** A3's text and the packet node A6/degree-of-an-endomorphism plan it, so that item is planned [A3], not missing.
- **Lemma 4.1(3) uses different facts.** It does not use the existence of a relatively ample bundle. It uses two other facts, and the lemma-4-1-3 note should name both:
  - for π-ample ℒ over projective S, ℒ ⊗ π*L′ is ample for suitable ample L′ (EGA II 4.6.13, under R09.1's relative ampleness);
  - the pullback of an ample bundle by a finite morphism is ample (missing, SF.0).
- **Right fix:**
  - The seesaw principle is missing and goes to A1 as a source. A1's relative theorem of the cube would give Lemma 4.1(1) directly.
  - The generic-fibre-triviality fact is missing and goes to SF.0, with PAPER-DIMITROV-GAO-HABEGGER-21/29.
  - Projectivity with a symmetric, relatively ample, rigidified bundle is missing and goes to A2. Cite PAPER-DIMITROV-GAO-HABEGGER-21/26.
- **One further unstated input.** Proposition 2.1 needs h : ℬ → 𝒜′ flat, which no item states. It holds automatically under the Néron-model repair of finding 1.

## /7 — confirmed (low)

- **The gap.** §1.1 defines a polarization only over an algebraically closed field, with a normal model. Lemma 3.7 uses one over k′ = k(P¹), and its proof shows only that H is geometrically integral.
- **The fix is right.** Normalize (H_{k̄ᵢ})~ → H_{k̄ᵢ}. The pullback of M is ample, the heights agree by the projection formula, and intersection numbers do not change under ground-field extension.
- **Addition to the fix.** State that ĥ on the non-normal model is defined by the same formula (1.1).
- **Alternative.** Choosing H₀ normal would need a Bertini theorem for normality that has no item, so prefer the normalization.

## /8 — confirmed, narrower fix (low)

p. 9 defines multiplicities by Serre's Tor formula. The proof of Proposition 2.4 (pp. 10–11) uses associativity of multiplicities for successive Cartier divisors. SF.5's text names neither, and the item's note covers only Fulton Prop. 7.1(b).

**Fix:**
- Keep intersection-multiplicity **planned** at SF.5. Both facts are standard parts of the intersection theory SF.5 plans from its named source, Fulton.
- Expand the item's note to say that SF.5 must supply two things: the agreement of Serre's Tor multiplicity with Fulton's for proper intersections on a smooth variety, and associativity for successive Cartier divisors.
- Separate missing items are not needed.

## /9 — confirmed (low)

Route 2's reason builds the pencil blow-up on AlgebraicModuliForArithmeticGeometry R09.7a. R09.7's description says "Its exact scope is varieties of finite type over a characteristic-zero field". The paper uses the blow-up in every characteristic (proof of Lemma 3.7, p. 17).

- **Correction to the claim.** The pencil-blowup item's note already mentions LPV.3; only the route reason omits it.
- **The fix is right.** Say in route 2 and in the note that SF.4 must supply the Rees-algebra blow-up of an arbitrary closed subscheme over any field, or confirm that R09.7a's construction does not depend on the characteristic. Name LPV.3's smooth-axis pencil as the special case it must agree with.

## /10 — confirmed (low)

Scanlon is missing from the prerequisites, although the note of item manin-mumford tells the blueprint to derive Theorem 5.1 from his Theorem 2.2. That theorem, read in arXiv:math/0303340v1, says the Zariski closure of X(K) ∩ G(K)_tor is a finite union of special subvarieties, for G semiabelian over an algebraically closed field of characteristic p.

**Fix, with the reference completed:** T. Scanlon, "A positive characteristic Manin–Mumford theorem", Compositio Math. 141 (2005), 1351–1364, doi:10.1112/S0010437X05001879 (arXiv:math/0303340).

## For the fix job

- **High and medium findings.** Findings 1–6 become FIX-RT-PAPER-XIE-YUAN-22. Apply them with the adjustments above.
- **New issue numbering.** The new source issues are E16 (finding 1), E17 (finding 2) and E18 (finding 3), plus E19 (finding 7) if the low findings are applied.
  - Finding 1's E16 is an error.
  - Finding 3's E18 should carry the inductive proof of the dependent case.
