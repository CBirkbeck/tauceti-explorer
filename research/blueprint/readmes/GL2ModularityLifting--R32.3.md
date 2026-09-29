# GL₂ Modularity Lifting, part 2 (R32.3–R32.6)

## Purpose

This document plans the second part of the roadmap `GL2ModularityLifting`, stages R32.3–R32.6. It covers the modern modularity lifting theorems used by the Dieulefait–Pacetti proof of Serre's conjecture:
- the 2-adic de Rham theorem;
- Pan's residually reducible Fontaine–Mazur theorem;
- the p = 3 ordinary branch;
- the modularity-transfer statements used at each change of coefficient prime, with an audit of which globalisation steps could depend on Serre's conjecture.

This is the first checkpoint. The theorems are planned at the level of their statements and the architecture of their proofs, from the primary sources. The local p-adic Langlands inputs and the completed-cohomology inputs are imported through requests.

## Scope and boundaries

- **RS-08** keeps these four stages unchanged (roadmap action `keep`; no layer entry for R32).
- **Part 1** (`GL2ModularityLifting--R22.1`) owns R22.1–R22.6 and R32.1–R32.2. R32.2, the odd-prime de Rham lifting theorem, is used here as a stage prerequisite. Kisin's 2-adic Barsotti–Tate theorem is its node `R22.6/kisin-dyadic-bt-lifting`.
- **Skinner–Wiles** is planned in OrdinaryAutomorphicFormsAndModularityLifting R21.4–R21.6. R32.5 imports its theorem over ℚ and its p = 3 specialisation rather than planning them again.
- **External inputs:** the local results (Paškūnas, Hu–Tan, Tung) are PadicLocalLanglandsForGL2Qp R30.6. Patched completed modules and their support are CompletedCohomologyAndLocalGlobalCompatibility R31.5, whose R31.6 also audits globalisation.

## Conventions

"ρ is modular" means that, up to a twist, ρ ≅ ρ_f for a cuspidal eigenform f, as in Pan and Tung. Hodge–Tate weights are those of the source; for the lifting theorems only their being distinct matters. χ_p is the p-adic cyclotomic character and ω its reduction.

## R32.3 — Dyadic de Rham lifting

### Theorems

#### Theorem. The 2-adic de Rham modularity lifting theorem (Kisin, Paškūnas, Tung)

*Node* `GL2ModularityLifting:R32.3/dyadic-de-rham-modularity-lifting`.

Let p = 2, E/ℚ₂ finite with ring 𝒪 and residue field k, and ρ : G_ℚ → GL₂(𝒪) continuous, irreducible, odd, unramified outside finitely many primes, with ρ|_{G_{ℚ₂}} de Rham of distinct Hodge–Tate weights. If ρ̄ is modular and has non-solvable image, then ρ is modular: up to a twist, ρ ≅ ρ_f for a cuspidal eigenform f (Tung, Theorem A). Before Tung, Paškūnas proved this over totally real F in which 2 splits completely, for ρ|_{G_{F_v}} potentially semistable with distinct Hodge–Tate weights and det ρ totally odd, under the extra local hypothesis (iv) ρ̄|_{G_{F_v}} ≇ (χ ∗; 0 χ) for every v | 2 (Theorem 1.1). Tung removes (iv), which was the only remaining local restriction at p = 2 (ω = 1 there), by proving that every component of the patched deformation ring lies in the support of the patched module (his Theorem B).

*Hypotheses.* This is a de Rham theorem with arbitrary distinct Hodge–Tate weights; it is not the potentially Barsotti–Tate theorem of the classical proof (Kisin's (0.1), GL2ModularityLifting:R22.6/kisin-dyadic-bt-lifting), and a regular de Rham representation is not Barsotti–Tate after renaming its weights. Residual modularity is a hypothesis; Tung notes that over ℚ it follows from Khare–Wintenberger and Kisin, but his proof does not use that (see R32.6/globalisation-dependency-audit). Non-solvable residual image replaces the cyclotomic irreducibility condition used for odd p.

*Used by.*

- `GL2ModularityLifting:R32.6/transfer-dyadic` — the p = 2 modularity transfer
- ClassicalSerreModularity R33.1 — Dieulefait–Pacetti Theorem 1.5

*Proof outline.*

1. Paškūnas (Theorem 1.1): patch algebraic automorphic forms on definite quaternion algebras following Kisin and Khare–Wintenberger's dyadic patching, and deduce modularity from a weak Breuil–Mézard conjecture proved in his local part; hypothesis (iv) comes from that local part.
2. Tung (Theorem A): patch completed cohomology of definite quaternion algebras (Caraiani–Emerton–Gee–Geraghty–Paškūnas–Shin) with a GL₂(ℚ₂)-action; use the p-adic local Langlands correspondence and Colmez's functor to show V̌(M_∞) is finitely generated, hence every irreducible component of R̃_∞ is in the support of M̃_∞ (Theorem B).
3. Theorem B gives R̃_∞[1/2] ≅ T_∞[1/2] on every component and the Breuil–Mézard conjecture for r a twist of an extension of 1 by itself (Theorem C), and hence Theorem A. The local results are PadicLocalLanglandsForGL2Qp R30.6 and the support statement CompletedCohomologyAndLocalGlobalCompatibility R31.5 (requests).

*Acceptance.*

- A ρ with ρ̄|_{G_{ℚ₂}} ≅ (χ ∗; 0 χ) (for instance ρ̄ unipotent at 2) is covered by Tung's Theorem A but not by Paškūnas' Theorem 1.1.
- A potentially Barsotti–Tate ρ is the case already covered by Kisin's (0.1), used in the classical proof through Hypothesis (H).

*Uses.* `GL2ModularityLifting:R22.6/kisin-dyadic-bt-lifting`, `GL2ModularityLifting:R32.2`, `PadicLocalLanglandsForGL2Qp:R30.6`, `CompletedCohomologyAndLocalGlobalCompatibility:R31.5`.

*Planet:* 2-adic de Rham modularity lifting.

*Sources.*

- Shen-Ning Tung, *On the modularity of 2-adic potentially semi-stable deformation rings*, Introduction, Theorem A, p. 2 (arXiv v3): “Theorem A. Assume p = 2. Let ρ be as in the conjecture.” The 2-adic theorem with no local restriction.
- Shen-Ning Tung, *On the modularity of 2-adic potentially semi-stable deformation rings*, Introduction, p. 3 (arXiv v3): “We focus only on the case p = 2 since this is the only remaining case with the restriction” The removal of the local restriction at 2.
- Vytautas Paškūnas, *On 2-dimensional 2-adic Galois representations of local and global fields*, §1, Theorem 1.1, p. 1 (arXiv v2): “Theorem 1.1. Assume that p = 2. Let F be a totally real field where 2 is totally split” The earlier theorem with hypothesis (iv).


### What is missing

- The proofs of Tung's Theorems A–C and of Paškūnas' Theorem 1.1 are summarised at the level of their strategy; their local and patching inputs are requested from R30.6 and R31.5.

## R32.4 — Pan's residually reducible theorem

### Theorems

#### Theorem. Pan's theorem: the Fontaine–Mazur conjecture in the residually reducible case

*Node* `GL2ModularityLifting:R32.4/pan-residually-reducible-fontaine-mazur`.

Let p be odd and ρ : G_ℚ → GL₂(E), E/ℚ_p finite, continuous, irreducible, odd, unramified outside finitely many primes and potentially semistable at p, with ρ|_{G_{ℚ_p}} of distinct Hodge–Tate weights. Suppose ρ̄^{ss} ≅ χ̄₁ ⊕ χ̄₂ is a sum of two characters, and if p = 3 that χ̄₁χ̄₂^{−1}|_{G_{ℚ₃}} ≠ ω (the mod-3 cyclotomic character). Then ρ comes from a cuspidal eigenform up to twist (Pan, Theorem 1.0.2). When ρ|_{G_{ℚ_p}} is reducible (ordinary) and χ̄₁χ̄₂^{−1}|_{G_{ℚ_p}} ≠ 1 this is Skinner–Wiles; Pan supplies the missing ordinary case χ̄₁χ̄₂^{−1}|_{G_{ℚ_p}} = 1 (his §6) and the non-ordinary case (his Theorem 7.1.1).

*Hypotheses.* Irreducibility of ρ is kept: ρ̄ being a sum of characters does not make ρ a sum of characters. No residual modularity is assumed: residually reducible representations are handled with pseudo-representations. At p = 3 the case χ̄₁χ̄₂^{−1}|_{G_{ℚ₃}} = ω is excluded throughout the paper, for lack of p-adic local Langlands input (Pan's Theorems 3.4.5–3.4.6); Dieulefait–Pacetti quote the theorem only for p ≥ 5.

*Used by.*

- `GL2ModularityLifting:R32.6/transfer-residually-reducible` — residually reducible modularity without a residual modularity hypothesis
- ClassicalSerreModularity R33.1 — Dieulefait–Pacetti Theorem 1.6 (p ≥ 5)

*Proof outline.*

1. Follow Emerton's strategy: a 'big' R = T statement relating a global deformation ring of pseudo-characters with no condition at p to a localised Hecke algebra of completed cohomology (in fact a weaker statement), then classicality: a ρ occurring in completed cohomology with ρ|_{G_{ℚ_p}} irreducible, de Rham of distinct weights, comes from a classical eigenform up to twist.
2. The non-ordinary case uses Skinner–Wiles' work and its generalisations (Pan's §§5–6) as a key ingredient; the ordinary case is Skinner–Wiles with Pan's §6 for χ̄₁χ̄₂^{−1}|_{G_{ℚ_p}} = 1.
3. The completed-cohomology inputs are CompletedCohomologyAndLocalGlobalCompatibility R31.3–R31.5 (requests).

*Acceptance.*

- ρ̄^{ss} ≅ 1 ⊕ χ̄₅ at p = 5 with ρ|_{G_{ℚ₅}} irreducible and de Rham of distinct weights: covered (non-ordinary case).
- p = 3 with ρ̄^{ss} ≅ 1 ⊕ χ̄₃: excluded (χ̄₃|_{G_{ℚ₃}} = ω); this is Dieulefait–Pacetti's p = 3 branch, R32.5/p-three-residually-reducible-branch.

*Uses.* `OrdinaryAutomorphicFormsAndModularityLifting:R21.5/theorem-a-over-q`, `CompletedCohomologyAndLocalGlobalCompatibility:R31.5`, `PadicLocalLanglandsForGL2Qp:R30.6`.

*Planet:* Pan's residually reducible Fontaine–Mazur theorem.

*Sources.*

- Lue Pan, *The Fontaine–Mazur conjecture in the residually reducible case*, Introduction, Theorem 1.0.2, p. 3 (arXiv v2): “Theorem 1.0.2. Let p be an odd prime and ρ be as in the conjecture.” The residually reducible theorem, with the p = 3 exclusion.
- Lue Pan, *The Fontaine–Mazur conjecture in the residually reducible case*, Introduction, after Theorem 1.0.2, p. 3 (arXiv v2): “The assumption that χ̄χ̄21 |Gal(Qp /Qp ) 6= ω when p = 3 is used almost everywhere throughout” Why p = 3 with χ̄₁χ̄₂^{−1} = ω is excluded.


#### Theorem. Pan's Fontaine–Mazur theorem in the residually irreducible case, and its use of Serre's conjecture

*Node* `GL2ModularityLifting:R32.4/pan-residually-irreducible-fontaine-mazur`.

Let p be odd and ρ as in the Fontaine–Mazur conjecture (irreducible, odd, finitely ramified, potentially semistable at p) with ρ|_{G_{ℚ_p}} of distinct Hodge–Tate weights, and if p = 3 suppose ρ̄^{ss}|_{G_{ℚ₃}} is not of the form η ⊕ ηω. Then ρ comes from a cuspidal eigenform up to twist (Pan, Theorem 1.0.4). Its proof (Pan §§8–9) needs residual modularity of ρ̄, which over ℚ Pan takes from Khare–Wintenberger's proof of Serre's conjecture (Remark 8.0.4); so this form of the theorem depends on the general Serre theorem, unlike R32.4/pan-residually-reducible-fontaine-mazur.

*Hypotheses.* Residual modularity is not a hypothesis of the statement: it is supplied by Serre's conjecture (Khare–Wintenberger). For p = 3 Tung proved the result under the usual Taylor–Wiles condition without Pan's exclusion (Pan's Remark 1.0.5).

*Used by.*

- `GL2ModularityLifting:R32.6/globalisation-dependency-audit` — the one read result whose proof invokes the general Serre theorem

*Proof outline.*

1. Pan §8: patch completed homology with auxiliary levels, apply Paškūnas' theory and local–global compatibility; the last condition of his setting (residual modularity) holds over ℚ by Khare–Wintenberger (Remark 8.0.4).
2. Pan §9 completes the residually irreducible case.

*Acceptance.*

- For the modern proof of Serre's conjecture this theorem is not an admissible input (it uses the conclusion); the admissible form is R32.6/transfer-residually-irreducible-odd, with residual modularity as a hypothesis.

*Uses.* `GL2ModularityLifting:R32.4/pan-residually-reducible-fontaine-mazur`, `CompletedCohomologyAndLocalGlobalCompatibility:R31.6`.

*Sources.*

- Lue Pan, *The Fontaine–Mazur conjecture in the residually reducible case*, Introduction, Theorem 1.0.4, p. 5 (arXiv v2): “Theorem 1.0.4. Let p be an odd prime and ρ be as in conjecture 1.0.1.” The residually irreducible theorem.
- Lue Pan, *The Fontaine–Mazur conjecture in the residually reducible case*, Remark 8.0.4, p. 125 (arXiv v2): “When F = Q, the last condition automatically holds by the work of KhareWintenberger [KW09a], [KW09b] on Serre’s conjecture.” The dependence on Serre's conjecture.


### What is missing

- Pan's pseudo-deformation rings, reducibility ideals and the classicality argument are summarised, not decomposed; the completed-cohomology inputs are requested from R31.5.

## R32.5 — Small-prime ordinary completion

### Theorems

#### Theorem. The p = 3 residually reducible branch: Skinner–Wiles, and why Pan's theorem does not cover it

*Node* `GL2ModularityLifting:R32.5/p-three-residually-reducible-branch`.

Let ρ : G_ℚ → GL₂(ℚ̄₃) be continuous, irreducible, odd and finitely ramified with ρ̄^{ss} ≅ 1 ⊕ χ̄₃, ρ|_{I₃} ≅ (∗ ∗; 0 1) and det ρ = ψχ₃^{k−1} (k ≥ 2, ψ of finite order). Then ρ is modular of weight k (Dieulefait–Pacetti Theorem 1.7 = Skinner–Wiles at p = 3, OrdinaryAutomorphicFormsAndModularityLifting:R21.5/theorem-a-at-three). This branch is not a consequence of Pan's theorem: Dieulefait–Pacetti quote Pan only for p ≥ 5, and Pan's Theorem 1.0.2 at p = 3 excludes exactly the case χ̄₁χ̄₂^{−1}|_{G_{ℚ₃}} = ω, which is this one (χ̄₃|_{G_{ℚ₃}} = ω). Normalisation after twisting: if ρ̄^{ss} ≅ χ̄₁ ⊕ χ̄₂, twist ρ by the Teichmüller lift of χ̄₁^{−1} (or χ̄₂^{−1}) so that ρ̄^{ss} ≅ 1 ⊕ χ with the trivial character on the unramified quotient; hypothesis (ii) is then read for the twisted ρ.

*Hypotheses.* Skinner–Wiles' hypothesis (i) χ|_{D₃} ≠ 1 holds automatically for χ = χ̄₃, which is ramified at 3; Dieulefait–Pacetti print it as 'ρ|_{D₃} ≠ (1 0; 0 1)' (source issue OrdinaryAutomorphicFormsAndModularityLifting/E9). The ordinary hypothesis (ii) comes from the local crystalline/ordinary calculation OrdinaryAutomorphicFormsAndModularityLifting:R21.5/crystalline-reducible-reduction-is-ordinary (weights 2 ≤ k ≤ p + 1). OrdinaryAutomorphicFormsAndModularityLifting:R21.5/theorem-a-at-three says Pan's theorem 'needs p ≥ 5'; Pan's statement is for all odd p, and the accurate reason is the exclusion above.

*Used by.*

- ClassicalSerreModularity R33.4 — Paso 6, the terminal case at p = 3
- `GL2ModularityLifting:R32.6/globalisation-dependency-audit` — the Skinner–Wiles branch uses no residual modularity

*Proof outline.*

1. Import Skinner–Wiles over ℚ and its p = 3 specialisation from OrdinaryAutomorphicFormsAndModularityLifting R21.5.
2. Compare with Pan's Theorem 1.0.2 at p = 3: the excluded case χ̄₁χ̄₂^{−1}|_{G_{ℚ₃}} = ω contains ρ̄^{ss} ≅ 1 ⊕ χ̄₃.
3. Twist to the normalised shape before applying (i)–(iii).

*Acceptance.*

- ρ̄^{ss} ≅ 1 ⊕ χ̄₃ with ρ crystalline of Hodge–Tate weights {0, 1} at 3: ordinary by the local calculation, hence modular by this branch; Pan's theorem does not apply.
- ρ̄^{ss} ≅ χ̄₃ ⊕ 1 in the other order: the same after twisting by χ₃^{−1} and relabelling.

*Uses.* `OrdinaryAutomorphicFormsAndModularityLifting:R21.5/theorem-a-at-three`, `OrdinaryAutomorphicFormsAndModularityLifting:R21.5/crystalline-reducible-reduction-is-ordinary`, `GL2ModularityLifting:R32.4/pan-residually-reducible-fontaine-mazur`.

*Planet:* The p = 3 ordinary branch.

*Sources.*

- C. M. Skinner and A. J. Wiles, *Residually reducible representations and modular forms*, Introduction, the Theorem, printed p. 6 (on the page image): “Suppose that ρ : Gal(Q̄/Q) → GL₂(E) is a continuous representation, irreducible and unramified outside a finite set of primes” The theorem with hypotheses (i)–(iii).
- Luis Victor Dieulefait and Ariel Martín Pacetti, *A simplified proof of Serre's conjecture*, Theorem 1.7 and its proof, pp. 4–5 (arXiv v2): “Proof. See [SW99] Theorem in the third page.” Dieulefait–Pacetti's statement of the p = 3 branch.


### What is missing

- Nothing recorded for this stage in this checkpoint.

## R32.6 — Modularity-transfer statements for congruence arguments

### Theorems

#### Theorem. Modularity transfer along a congruence at an odd prime with cyclotomically irreducible residual representation

*Node* `GL2ModularityLifting:R32.6/transfer-residually-irreducible-odd`.

Let p be odd and ρ, ρ′ : G_ℚ → GL₂(ℚ̄_p) continuous, odd, finitely ramified, with ρ̄ ≅ ρ̄′, ρ̄|_{G_{ℚ(√p*)}} absolutely irreducible, and ρ|_{G_{ℚ_p}}, ρ′|_{G_{ℚ_p}} de Rham with Hodge–Tate weights {0, k − 1}, {0, k′ − 1} (k, k′ > 1). Then ρ is modular if and only if ρ′ is. This is Dieulefait–Pacetti's Theorem 1.4 read as a transfer statement: if ρ is modular then ρ̄ = ρ̄′ is modular and Theorem 1.4 applies to ρ′. Its source is Kisin (k = 2, and the general case), with Emerton and Paškūnas removing the local–global hypothesis, Hu–Tan (p ≥ 5) and Tung (p = 3) removing the remaining local restriction.

*Hypotheses.* Absolute irreducibility over ℚ(√p*) is equivalent to that over ℚ(ζ_p) (Dieulefait–Pacetti Lemma 1.13); it is the hypothesis in the combined theorem as Tung states it. Residual modularity is the only global modularity input; no Serre conjecture is used (R32.6/globalisation-dependency-audit).

*Used by.*

- ClassicalSerreModularity R33.1–R33.3 — Dieulefait–Pacetti Theorem 1.4 at every congruence at an odd prime

*Proof outline.*

1. Theorem 1.4 (Kisin, Emerton, Paškūnas, Hu–Tan, Tung) applied to ρ′, whose residual representation is that of the modular ρ.

*Acceptance.*

- A newform f and a congruent de Rham lift ρ′ of ρ̄_f of a different Hodge–Tate weight: ρ′ is modular.
- Non-example: ρ̄ bad dihedral (ρ̄|_{G_{ℚ(√p*)}} reducible) is excluded; Dieulefait–Pacetti avoid it by the Fontaine–Laffaille lemma (ClassicalSerreModularity R33.1).

*Uses.* `GL2ModularityLifting:R32.2`, `PadicLocalLanglandsForGL2Qp:R30.6`.

*Planet:* Modularity transfer along congruences.

*Sources.*

- Luis Victor Dieulefait and Ariel Martín Pacetti, *A simplified proof of Serre's conjecture*, Theorem 1.4 and its proof, p. 4 (arXiv v2): “Our precise statement incorporates the results in [HT15, Theorem 1.4], where the other hypothesis in Kisin’s article is removed for p ≥ 5” The statement and its attributions.
- Shen-Ning Tung, *On the modularity of 2-adic potentially semi-stable deformation rings*, Introduction, the theorem of Kisin, Paškūnas, Hu–Tan and Tung, pp. 1–2 (arXiv v3): “Such a result is known as a modularity lifting theorem, which says that if ρ is modular, then any lift ρ of” The combined theorem and its hypotheses.


#### Theorem. Modularity transfer along a congruence at 2 with non-solvable residual image

*Node* `GL2ModularityLifting:R32.6/transfer-dyadic`.

Let ρ, ρ′ : G_ℚ → GL₂(ℚ̄₂) be continuous, odd, finitely ramified, de Rham at 2 with distinct Hodge–Tate weights, with ρ̄ ≅ ρ̄′ of non-solvable image. Then ρ is modular if and only if ρ′ is (Dieulefait–Pacetti Theorem 1.5, from R32.3/dyadic-de-rham-modularity-lifting).

*Hypotheses.* Non-solvable residual image is needed at p = 2. Irreducibility of ρ, ρ′ follows from that of ρ̄.

*Used by.*

- ClassicalSerreModularity R33.5 — the characteristic-two closure

*Proof outline.*

1. R32.3/dyadic-de-rham-modularity-lifting applied to ρ′ with ρ̄′ = ρ̄ modular.

*Acceptance.*

- Dieulefait–Pacetti §3: a weight-2 system through a dyadic lift of a non-solvable ρ̄ transfers modularity from an odd member back to the 2-adic one.

*Uses.* `GL2ModularityLifting:R32.3/dyadic-de-rham-modularity-lifting`.

*Sources.*

- Luis Victor Dieulefait and Ariel Martín Pacetti, *A simplified proof of Serre's conjecture*, Theorem 1.5 and its proof, p. 4 (arXiv v2): “See [Kis09b, Theorem 0.1] for k = 2 and ρ potentially Barsotti-Tate” The 2-adic transfer and its sources.


#### Theorem. Modularity of residually reducible representations at a ramified coefficient prime

*Node* `GL2ModularityLifting:R32.6/transfer-residually-reducible`.

Let p ≥ 5 (or p = 3 outside Pan's exclusion) and ρ : G_ℚ → GL₂(ℚ̄_p) continuous, irreducible, odd and finitely ramified, de Rham at p with distinct Hodge–Tate weights, with ρ̄^{ss} a sum of two characters. Then ρ is modular (Dieulefait–Pacetti Theorem 1.6, from Skinner–Wiles and R32.4/pan-residually-reducible-fontaine-mazur). In a congruence argument this is used when a member of an almost strictly compatible system is residually reducible at its own prime p, possibly with p in the ramification set: no residual modularity and no ordinarity is needed.

*Hypotheses.* Dieulefait–Pacetti state p ≥ 5; Pan's theorem also covers p = 3 when χ̄₁χ̄₂^{−1}|_{G_{ℚ₃}} ≠ ω, and the p = 3 case with ω is R32.5/p-three-residually-reducible-branch.

*Used by.*

- ClassicalSerreModularity R33.1 — the reducible branch of every congruence in Pasos 1–6

*Proof outline.*

1. Ordinary case: Skinner–Wiles (OrdinaryAutomorphicFormsAndModularityLifting:R21.5/theorem-a-over-q) and Pan §6; non-ordinary case: Pan's Theorem 7.1.1.

*Acceptance.*

- A member ρ_ℓ of a compatible system with ρ̄_ℓ reducible at a prime ℓ ≥ 5 of the ramification set: modular without any local comparison at ℓ.

*Uses.* `GL2ModularityLifting:R32.4/pan-residually-reducible-fontaine-mazur`, `OrdinaryAutomorphicFormsAndModularityLifting:R21.5/theorem-a-over-q`.

*Sources.*

- Luis Victor Dieulefait and Ariel Martín Pacetti, *A simplified proof of Serre's conjecture*, Theorem 1.6 and its proof, p. 4 (arXiv v2): “See [SW99](Theorem in the third page) and [Pan19, Theorem 1.0.2].” The residually reducible modularity theorem.


#### Theorem. Why de Rham lifting suffices when an almost strictly compatible system lacks the Weil–Deligne comparison at the coefficient prime

*Node* `GL2ModularityLifting:R32.6/de-rham-lifting-and-almost-strict-systems`.

Let {ρ_λ} be an almost strictly compatible system (Dieulefait–Pacetti Definition 1.10): conditions (1)–(5) hold for every member, and the Weil–Deligne comparison (6) may fail at a member ρ_λ with ρ̄_λ reducible at its own residue characteristic p unless p is odd and WD_p is unramified. Every member is de Rham at its own prime with Hodge–Tate weights {0, k − 1} (condition (4)–(5)). The theorems R32.6/transfer-residually-irreducible-odd, R32.6/transfer-dyadic and R32.6/transfer-residually-reducible need only this de Rham condition and distinct weights at p, not the local type or the Weil–Deligne parameter there; so a congruence argument at such a member uses them without the missing comparison. Remark 4 of the source then propagates modularity from one member to the whole system.

*Hypotheses.* Distinct Hodge–Tate weights (k > 1) are needed; weight one is excluded by the systems in use. The missing comparison would be needed only by lifting theorems that prescribe the local type at p (for instance the potentially Barsotti–Tate theorems of the classical proof).

*Used by.*

- ClassicalSerreModularity R33 — every change of coefficient prime in Pasos 1–6

*Proof outline.*

1. Read Definition 1.10 and the exception for almost strict systems.
2. Check the hypotheses of Theorems 1.4–1.6 (and of Tung's Theorem A): de Rham with distinct weights at p, no condition on the type.
3. Remark 4: modularity of one member gives modularity of all by Brauer–Nesbitt on Frobenius traces.

*Acceptance.*

- A member with ρ̄ reducible at a prime p of the ramification set: Theorem 1.6 applies although (6) is not imposed there.
- Non-example: a lifting theorem requiring a potentially Barsotti–Tate type at p cannot be applied at such a member without the comparison.

*Uses.* `GL2ModularityLifting:R32.6/transfer-residually-irreducible-odd`, `GL2ModularityLifting:R32.6/transfer-dyadic`, `GL2ModularityLifting:R32.6/transfer-residually-reducible`, `PotentialModularityAndCompatibleSystems:R24.5`.

*Sources.*

- Luis Victor Dieulefait and Ariel Martín Pacetti, *A simplified proof of Serre's conjecture*, §1.4, Definition 1.10 and the definition of almost strictly compatible systems, pp. 6–7 (arXiv v2): “An almost strictly compatible system is a 5-tuple satisfying the first five properties” The exception at residually reducible members.
- Luis Victor Dieulefait and Ariel Martín Pacetti, *A simplified proof of Serre's conjecture*, Remark 4, p. 7 (arXiv v2): “If ρ is part of a compatible system of Galois representations {ρp }, then” Propagation of modularity along the system.


#### Comparison. Dependency audit: which globalisations in the lifting theorems use the general Serre theorem

*Node* `GL2ModularityLifting:R32.6/globalisation-dependency-audit`.

For the statements used by the modern proof of Serre's conjecture (Dieulefait–Pacetti Theorems 1.4–1.7) the proofs read here take residual modularity as a hypothesis or need none, and invoke no form of Serre's conjecture: (a) Tung's Theorem A (p = 2) assumes ρ̄ modular; Tung notes that over ℚ this follows from Khare–Wintenberger and Kisin, but uses Khare–Wintenberger II only for local deformation-ring results and potential-modularity constructions; (b) Paškūnas' Theorem 1.1 uses the Khare–Wintenberger and Kisin modularity lifting theorems in the Barsotti–Tate case as inputs, which are proved without Serre's conjecture; (c) Pan's Theorem 1.0.2 (residually reducible) uses Skinner–Wiles and a local result of Khare–Wintenberger II (Proposition 2.1), not Serre's conjecture; (d) Skinner–Wiles' theorem uses no residual modularity (R21.6/independence-from-serre of OrdinaryAutomorphicFormsAndModularityLifting). By contrast Pan's Theorem 1.0.4 (residually irreducible, without assuming ρ̄ modular) takes residual modularity from Khare–Wintenberger's Serre conjecture (Remark 8.0.4) and is not an admissible input.

*Hypotheses.* The proofs of Kisin (JAMS 2009), Emerton (2011), Hu–Tan (2015) and Tung (ANT 2021, p = 3) are not read; their statements assume residual modularity, and the audit of their globalisation steps is requested from CompletedCohomologyAndLocalGlobalCompatibility R31.6, which the atlas also charges with it. 'Khare–Wintenberger II' inputs are the local and patching results of that paper, which precede and do not use the full Serre theorem.

*Used by.*

- `ClassicalSerreModularity:R33.5/globalisation-dependency-check` — the independence audit that node requests from R32.6

*Proof outline.*

1. List the statements used (Dieulefait–Pacetti Theorems 1.4–1.7) and their sources.
2. For each read source, locate every appeal to Khare–Wintenberger and classify it: residual modularity hypothesis, local deformation-ring result, patching or potential modularity, or the Serre conjecture itself.
3. Record the one appeal to the Serre conjecture found (Pan, Remark 8.0.4, for Theorem 1.0.4) and why it is not used.

*Acceptance.*

- The audit must separate Pan's Theorem 1.0.2 (admissible) from Theorem 1.0.4 (not admissible).
- An input whose statement assumes ρ̄ modular is admissible even though, over ℚ, that hypothesis is known through Serre's conjecture.

*Uses.* `GL2ModularityLifting:R32.3/dyadic-de-rham-modularity-lifting`, `GL2ModularityLifting:R32.4/pan-residually-reducible-fontaine-mazur`, `GL2ModularityLifting:R32.4/pan-residually-irreducible-fontaine-mazur`, `GL2ModularityLifting:R32.5/p-three-residually-reducible-branch`, `GL2ModularityLifting:R32.6/transfer-residually-irreducible-odd`, `OrdinaryAutomorphicFormsAndModularityLifting:R21.6/independence-from-serre`, `CompletedCohomologyAndLocalGlobalCompatibility:R31.6`.

*Sources.*

- Shen-Ning Tung, *On the modularity of 2-adic potentially semi-stable deformation rings*, Introduction, p. 2 (arXiv v3): “since we work over Q, the condition on the modularity of ρ follows from a deep theorem of Khare-Wintenberger [KW09b] and Kisin [Kis09b]” Residual modularity is a hypothesis of the lifting theorem.
- Vytautas Paškūnas, *On 2-dimensional 2-adic Galois representations of local and global fields*, §1.1.2 'Global part', p. 5 (arXiv v2): “We use their results as an input in our proof.” Khare–Wintenberger and Kisin's Barsotti–Tate theorems as inputs.
- Lue Pan, *The Fontaine–Mazur conjecture in the residually reducible case*, Remark 8.0.4, p. 125 (arXiv v2): “When F = Q, the last condition automatically holds by the work of KhareWintenberger [KW09a], [KW09b] on Serre’s conjecture.” The appeal to Serre's conjecture, in the residually irreducible part only.


### What is missing

- The globalisation audit of Kisin, Emerton, Hu–Tan and Tung (p = 3) awaits CompletedCohomologyAndLocalGlobalCompatibility R31.6; only the read sources are audited here.
- Transfer statements for the p = 3 residually irreducible case rest on Tung (ANT 2021), of which only the statement was read.

## Requests

- **PadicLocalLanglandsForGL2Qp:R30.6** — The local results behind the modern lifting theorems, with a theorem-hypothesis table: Paškūnas' Breuil–Mézard results (ANT 2016, local part; Duke 2015), Hu–Tan (p ≥ 5, split residual case), Tung (p = 3, ANT 2021; p = 2, Math. Z. 2021, Theorem C for twists of extensions of 1 by itself). Needed by: `GL2ModularityLifting:R32.3/dyadic-de-rham-modularity-lifting`, `GL2ModularityLifting:R32.4/pan-residually-reducible-fontaine-mazur`, `GL2ModularityLifting:R32.6/transfer-residually-irreducible-odd`.
- **CompletedCohomologyAndLocalGlobalCompatibility:R31.5** — Patched completed modules with a GL₂(ℚ_p)-action and their support on every component of the patched deformation ring (Tung's Theorem B at p = 2; Pan's big R = T for pseudo-deformations). Needed by: `GL2ModularityLifting:R32.3/dyadic-de-rham-modularity-lifting`, `GL2ModularityLifting:R32.4/pan-residually-reducible-fontaine-mazur`.
- **CompletedCohomologyAndLocalGlobalCompatibility:R31.6** — The audit of the globalisation steps in Kisin (JAMS 2009), Emerton (2011), Hu–Tan (2015) and Tung (ANT 2021), whose proofs are not read here: whether any step uses a restricted proved case or the general Serre theorem. Needed by: `GL2ModularityLifting:R32.6/globalisation-dependency-audit`, `GL2ModularityLifting:R32.4/pan-residually-irreducible-fontaine-mazur`.
- **PotentialModularityAndCompatibleSystems:R24.5** — The almost strictly compatible system carrier (Dieulefait–Pacetti Definition 1.10 after Khare–Wintenberger), with the exception at residually reducible members at their own prime. Needed by: `GL2ModularityLifting:R32.6/de-rham-lifting-and-almost-strict-systems`.

## Coverage

- **GL2ModularityLifting:R32.3** (partial). Planned: the 2-adic de Rham modularity lifting theorem, distinguished from Kisin's potentially Barsotti–Tate theorem of the classical proof.
  - Remaining: The proofs of Tung's Theorems A–C and of Paškūnas' Theorem 1.1 are summarised at the level of their strategy; their local and patching inputs are requested from R30.6 and R31.5.
- **GL2ModularityLifting:R32.4** (partial). Planned: Pan's Theorems 1.0.2 and 1.0.4, with the p = 3 exclusion and the dependence of 1.0.4 on Serre's conjecture.
  - Remaining: Pan's pseudo-deformation rings, reducibility ideals and the classicality argument are summarised, not decomposed; the completed-cohomology inputs are requested from R31.5.
- **GL2ModularityLifting:R32.5** (source_decomposed). Planned by importing Skinner–Wiles over ℚ and its p = 3 specialisation from OrdinaryAutomorphicFormsAndModularityLifting R21.5, with the precise reason Pan's theorem does not cover the branch and the twisting normalisation.
- **GL2ModularityLifting:R32.6** (partial). Planned: the three transfer statements, the almost-strict-compatibility explanation and the dependency audit of the read sources.
  - Remaining: The globalisation audit of Kisin, Emerton, Hu–Tan and Tung (p = 3) awaits CompletedCohomologyAndLocalGlobalCompatibility R31.6; only the read sources are audited here.
  - Remaining: Transfer statements for the p = 3 residually irreducible case rest on Tung (ANT 2021), of which only the statement was read.

## Gaps

- **Kisin, Emerton, Hu–Tan and Tung (p = 3) are not read** (needed by `GL2ModularityLifting:R32.6/globalisation-dependency-audit`, `GL2ModularityLifting:R32.6/transfer-residually-irreducible-odd`). Verified: the statements of Dieulefait–Pacetti Theorem 1.4 and of the combined theorem as Tung states it; Tung's Theorem A (p = 2) and Paškūnas' Theorem 1.1 with their use of Khare–Wintenberger; Pan's Theorems 1.0.2 and 1.0.4 with Remark 8.0.4. Not verified: the proofs of Kisin's JAMS 2009 theorem, Emerton's local–global compatibility, Hu–Tan's Breuil–Mézard theorem and Tung's p = 3 theorem, so the absence of an appeal to the general Serre theorem in them is not checked here. Requested from CompletedCohomologyAndLocalGlobalCompatibility R31.6.

## Source issues

None new. Dieulefait–Pacetti's misprinted second hypothesis of Theorem 1.7 is OrdinaryAutomorphicFormsAndModularityLifting/E9 and is cited there.

## Sources

- **A simplified proof of Serre's conjecture**, Luis Victor Dieulefait and Ariel Martín Pacetti. arXiv:2108.07577v2 (3 May 2022); printed page = PDF page. The same file as ClassicalSerreModularity and OrdinaryAutomorphicFormsAndModularityLifting. https://arxiv.org/pdf/2108.07577v2 (SHA-256 0c6850dafda032f7a4008947c519b5aef8cc13762207bb67c36810170a8eebe6). Read: §1.2, Theorems 1.4–1.7 with their proofs (pp. 4–5); §1.4, Definition 1.10, Theorem 1.11 and Remark 4 (pp. 6–7); §3 (p. 15).
- **Residually reducible representations and modular forms**, C. M. Skinner and A. J. Wiles. Publ. Math. IHÉS 89 (1999), 5–126; Numdam scan (OCR text layer poor; the main theorem was read on the page image; printed page = PDF page + 3). The same file as OrdinaryAutomorphicFormsAndModularityLifting and AutomorphicGaloisRepresentations. http://www.numdam.org/item/PMIHES_1999__89__5_0.pdf (SHA-256 ec0697b3e9c9fa68063b19688f10347d204a8b7b86526384c9ccd6e7fe30e6f3). Read: Introduction: the Theorem (printed p. 6) and the outline (pp. 7–8).
- **The Fontaine–Mazur conjecture in the residually reducible case**, Lue Pan. J. Amer. Math. Soc. 35 (2022); arXiv:1901.07166v2 (the latest version). The arXiv version was read; locators give its PDF pages. https://arxiv.org/pdf/1901.07166v2 (SHA-256 590171129d28a65749cf92b1f6099dbacaa90cc6698828f0a4dfd3da943f4824). Read: Introduction: Conjecture 1.0.1, Theorems 1.0.2 and 1.0.4, Remark 1.0.5 and the strategy (pp. 2–5); Remark 8.0.4 (p. 125).
- **On 2-dimensional 2-adic Galois representations of local and global fields**, Vytautas Paškūnas. Algebra Number Theory 10 (2016), no. 6, 1301–1358; arXiv:1509.00332v2 (the latest version, dated 2 August 2018 on its first page). The arXiv version was read. https://arxiv.org/pdf/1509.00332v2 (SHA-256 727addeb49ee302052a493cf097a868a70c340286981598b5e7382fcd8f86749). Read: §1: Theorem 1.1 and §1.1.2 'Global part' (pp. 1–6).
- **On the modularity of 2-adic potentially semi-stable deformation rings**, Shen-Ning Tung. Math. Z. 298 (2021), 107–159; arXiv:1908.06174v3 (the latest version). The arXiv version was read. https://arxiv.org/pdf/1908.06174v3 (SHA-256 a601da3762c35dab9ebdac5fb5106f1e3f627304dfc2390ac43fe2ac862c6de8). Read: Introduction: the combined theorem (Kisin, Paškūnas, Hu–Tan, Tung), Theorems A, B and C and the strategy (pp. 1–3).
- **On the automorphy of 2-dimensional potentially semi-stable deformation rings of G_{Q_p}**, Shen-Ning Tung. Algebra Number Theory 15 (2021), no. 9, 2173–2194; arXiv:1803.07451v4 (21 March 2021, the latest version). Only the abstract and the statement of Theorem 1.2 were read. https://arxiv.org/pdf/1803.07451v4 (SHA-256 22017bc9beb585c2aae5421d2fe1a8a9049d8a93e4f8bb8cf684149616db1ba2). Read: Abstract and Theorem 1.2 (pp. 1–2).
