# Kisin–Pappas–Zhou (2026): integral models of Shimura varieties with parahoric level, II — extraction and routing

Issue [#1342](https://github.com/CBirkbeck/tauceti-explorer/issues/1342). Status: **complete**. Implementation and proof closure are not claimed.

- **Provenance.** Completed by Claude Code, session cc-442dc5, on 23 September 2026. It continues the merged Codex checkpoint, whose report follows below as history.
- **The paper.** M. Kisin, G. Pappas and R. Zhou, *Integral models of Shimura varieties with parahoric level structure, II*, Forum Math. Pi 14 (2026), e14, 1–89.
  - The publisher's PDF link returned HTML here.
  - The published version was read from the Cambridge repository copy that Unpaywall lists: 89 pages, with the journal header, SHA-256 b3e4bf8b…. Its hash differs from the checkpoint's copy because of the repository's PDF processing.
  - arXiv v3 was re-fetched; its SHA-256 (d0834555…) matches the checkpoint. It is the latest arXiv version, and Crossref lists no correction for the DOI.
- **Items.** The result has **205 items: 14 library, 13 planned and 178 missing**. Every missing item is routed exactly once, and every numbered statement is an item.
- **Mistakes.** Fourteen are recorded under `sourceIssues`. The checkpoint described four printed issues in its report but recorded none.

## This continuation (cc-442dc5)

**Printed corrections of other papers.** The paper corrects Kisin–Pappas 2018 ([KP18]) and Pappas 2023 ([P23]) in §1.3, Remark 5.1.17, footnote 8 and §7.3. These are recorded with `known` values that name this paper:
- **E1.** The connection isomorphism c of [KP18, Lemma 3.1.9] is not canonical, and [KP18, Lemma 3.1.12] fails for it. It is replaced by Lemma 5.1.15, following Hoff.
- **E2.** [KP18, 3.2.12] and the results that depend on it need a very good Hodge embedding. [KP18, Theorems 4.2.7 and 4.6.23] are replaced by Theorems 7.1.3 and 7.2.21.
- **E3 and E4.** Two proof repairs: q^loc in [KP18, Theorem 4.2.7] is smooth rather than a torsor, and [KP18, Lemma 3.1.17] needs p-adic completeness.
- **E5.** The connected components in [KP18, Lemma 4.6.13 and Corollary 4.6.15] need conjugated levels jK°_p j^{-1}.
- **E6.** H♯ in [KP18, 4.6.21] is defined only in abelian type.
- **E7.** [P23] needs the very good hypothesis.

**New findings.**
- **E9 (a stated result).** In characteristic p, §4.2.9's claim that "X_α v ≠ 0 for some weight vector" is equivalent to "ϖ′ and ϖ′ + α are weights" is false.
  - Counterexample: GL_2 with highest weight (p, 0), where X_α v_1 = p·v_0 = 0.
  - As a result, the last step of the proof of Proposition 4.2.10(2) fails, and the proposition is not established for general λ ≼ μ.
  - For minuscule weights the step is valid. That is all Theorem 4.2.3 needs, through Proposition 4.2.13's inequality k_α ≥ j_α. So Theorem 4.2.3 and the main results stand.
- **E8 (affects nothing).** Remark 4.1.5(2) repeats a variable and calls X = Spec k[x, y, z]/(x² + xyz) normal. In fact x² + xyz = x(x + yz) is reducible, so X is not normal. The tangent-space example holds as stated.
- **E10–E14 (misprints, affect nothing).**
  - E10: characters are written as cocharacters in §§4.2.6–4.2.10, and the reverse slip occurs in Proposition 4.3.9.
  - E11: the type-B weight lattice is printed as Z^n, and the sums for ϖ_i use the wrong index.
  - E12: α_n = e_{n−1} + e_{n−1}, and the sign of the last coordinate of μ in type D^H.
  - E13: Corollary 4.2.19 prints k_α and l_α for k_{−α} and l_{−α}. Both of its uses read k_{−α}.
  - E14: in the published proof of Lemma 7.2.8 a sentence was garbled in typesetting. It is restored from arXiv v3.

**Items.**
- Lemma 5.1.11 (F34) and Lemma 7.2.5 (S43) were added.
- Theorem 1.1.1, Corollary 1.1.2 and Theorem 1.2.3 were mapped as introduction forms of S32–S35, S37 and R30.
- R12's locator now reads Proposition 4.2.10(2).

**Gaps.**
- G-roots, G-reps and G-global are recorded through E9, E11–E14.
- The other eleven are deferred as cited suppliers' proofs or design work.

**Why the status is now complete.**
- Every numbered statement is an item.
- Every missing item is routed exactly once.
- The findings the checkpoint left open are recorded.

## Mistakes found (`sourceIssues`)

- **E1** (error; affects a stated result), Kisin–Pappas, Integral models of Shimura varieties with parahoric level structure, Publ. Math. IHÉS 128 (2018) ([KP18]), Lemma 3.1.9 and Lemma 3.1.12. *Printed:* the connection isomorphism c constructed in the proof of Lemma 3.1.9 from a normal decomposition M = L ⊕ T, and Lemma 3.1.12 for that c *Correction:* The construction depends on the normal decomposition and is not canonical, and Lemma 3.1.12 fails for it. Use the canonical c of Lemma 5.1.15 (via Lemma 5.1.11), following Hoff.
- **E2** (error; affects a stated result), Kisin–Pappas, Integral models of Shimura varieties with parahoric level structure, Publ. Math. IHÉS 128 (2018) ([KP18]), 3.2.12, Lemma 3.2.14, Propositions 3.2.17 and 3.3.13, Theorem 4.2.7, Corollaries 4.2.12–4.2.13 and Theorem 4.6.23. *Printed:* the isomorphism Ψ_{R_G} of 3.2.12 for an arbitrary (good) Hodge embedding, and the results using it *Correction:* Ψ_{R_G} exists only when the Hodge embedding is very good (Definition 5.2.5). Add that hypothesis to the listed results, whose proofs are otherwise unchanged. Theorem 4.2.7 is replaced by Theorem 7.1.3 and Theorem 4.6.23 by Theorem 7.2.21 (Theorem 1.1.1), refined by Corollary 7.2.24.
- **E3** (error; affects the proof), Kisin–Pappas, Integral models of Shimura varieties with parahoric level structure, Publ. Math. IHÉS 128 (2018) ([KP18]), proof of Theorem 4.2.7. *Printed:* the morphism q^loc is a G-torsor *Correction:* q^loc is isomorphic to the action morphism G × M^loc → M^loc, which is smooth as the composite of (g, m) ↦ (g, g·m) with a projection; the rest of the proof is unchanged.
- **E4** (error; affects the proof), Kisin–Pappas, Integral models of Shimura varieties with parahoric level structure, Publ. Math. IHÉS 128 (2018) ([KP18]), proof of Lemma 3.1.17. *Printed:* p^{-m}φ^m(x) → 0 for the topology τ on Ŵ(A)[1/p] *Correction:* Ŵ(A)[1/p] is not complete for τ. It is p-adically complete and separated ([Zi01, Prop. 2.3, 2.4]), and p^{-m}φ^m(x) → 0 p-adically, by Zink's logarithmic coordinates for p > 2.
- **E5** (error; affects a stated result), Kisin–Pappas, Integral models of Shimura varieties with parahoric level structure, Publ. Math. IHÉS 128 (2018) ([KP18]), Lemma 4.6.13 and Corollary 4.6.15. *Printed:* the description of Sh_{K°_{2,p}}(G_2, X_2) as a union of connected Shimura varieties at the level K°_p *Correction:* The component indexed by j ∈ J has level jK°_p j^{-1}: Sh_{K°_{2,p}}(G_2, X_2) ≅ ⨆_{j∈J} [Sh_{K°_p}(G, X)^{j,+} × 𝒜(G_{2,Z(p)})]/𝒜(G_{Z(p)})°, and the integral model of Corollary 4.6.15 uses the Zariski closures of the Sh_{K°_p}(G, X)^{j,+}.
- **E6** (error; affects a stated result), Kisin–Pappas, Integral models of Shimura varieties with parahoric level structure, Publ. Math. IHÉS 128 (2018) ([KP18]), 4.6.21. *Printed:* H♯ is defined for any (H, Y) with H of classical type *Correction:* H♯ need not satisfy the third defining condition in general; it does when (H^ad, Y^ad) is of abelian type.
- **E7** (error; affects a stated result), Pappas, On integral models of Shimura varieties, Math. Ann. 385 (2023) ([P23]), §4.5, Proposition 4.5.3, §8 and Theorem 8.1.6. *Printed:* the constructions and results without the hypothesis that (G, μ) ↪ (GL(Λ), μ_d) is very good *Correction:* Add that hypothesis. The independence in Theorem 8.1.6 holds for models built from different very good Hodge embeddings.
- **E8** (error; affects nothing), Remark 4.1.5(2), p.31. *Printed:* Consider the normal surface X = Spec k[x, y, x]/(x² + xyz). *Correction:* X = Spec k[x, y, z]/(x² + xyz), which is not normal: x² + xyz = x(x + yz), so X is the union of two smooth surfaces meeting along x = yz = 0, and its local ring at the origin is not a domain.
- **E9** (error; affects a stated result), §4.2.9 and proof of Proposition 4.2.10(2), p.35. *Printed:* (ϖ, ϖ′) ∈ W(α) if X_α v_{ϖ′} ≠ 0 for some weight vector … Equivalently, (ϖ, ϖ′) ∈ W(α) if and only if ϖ′ and ϖ′ + α are weights of V(ϖ); … If we let ν and v ∈ V(ν) range over all such pairs with X_α v ≠ 0, then (ϖ, ϖ′ − α) range over all elements of W(α). *Correction:* The equivalence fails in characteristic p, and the printed proof bounds l only over the pairs realised by a nonzero X_α. Every pair with ϖ minuscule is realised, so the argument gives l ≤ j_α (the minimum over ϖ ∈ S of Proposition 4.2.13) for (α, ⟨λ, α⟩ − l) ∈ Φ^FM. With k_α ≥ j_α from the proof of Proposition 4.2.13, this still gives Φ^cur = Φ^tan = Φ^FM, so Theorem 4.2.3 stands.
- **E10** (misprint; affects nothing), Definition 4.2.6, §4.2.9 and proof of Proposition 4.2.10(2), pp.34–35; Proposition 4.3.9, p.41. *Printed:* ν ∈ X_*(T)^+ a dominant weight; ϖ ∈ X_*(T)^+ is a dominant cocharacter; ϖ = −w_0ν ∈ X_*(T)^+; and, in Proposition 4.3.9, λ ∈ X^*(T)_+ *Correction:* ν, ϖ ∈ X^*(T)^+ are dominant weights (characters), and λ ∈ X_*(T)^+ is a dominant cocharacter.
- **E11** (misprint; affects nothing), Proof of Theorem 4.2.3 (§4.2.15), types B_n and D_n, pp.37–38. *Printed:* Type B_n. We identify P^∨ and P with Z^n … ϖ_n = (1/2, …, 1/2); and, in types B_n and D_n, ϖ_i = Σ_{j=1}^{i} e_i *Correction:* P = Z^n + Z·(1/2, …, 1/2) (P^∨ = Z^n), and ϖ_i = Σ_{j=1}^{i} e_j.
- **E12** (misprint; affects nothing), Proof of Theorem 4.2.3 (§4.2.15), types D^R_n and D^H_n, pp.38–39. *Printed:* α_n = e_{n−1} + e_{n−1}; and, for type D^H_n, μ = sϖ^∨_{n−1} + tϖ^∨_n with q = s − t and μ = (r/2, …, r/2, q/2) *Correction:* α_n = e_{n−1} + e_n. With the printed ϖ_{n−1} = (1/2, …, 1/2, −1/2) and ϖ_n = (1/2, …, 1/2), μ = (r/2, …, r/2, −q/2); equivalently take q = t − s.
- **E13** (misprint; affects nothing), Corollary 4.2.19, p.40. *Printed:* k_α = min_{ϖ∈S} ⟨μ, ϖ⟩ − ⟨λ, ϖ_α⟩ = l_α *Correction:* k_{−α} = min_{ϖ∈S} ⟨μ, ϖ⟩ − ⟨λ, ϖ_α⟩ = l_{−α}.
- **E14** (misprint; affects nothing), Proof of Lemma 7.2.8, p.79. *Printed:* Bil_{H^c}(V) ⊗_Q F ≅ ∏_{σ:F→R} Bil_{H^c_{R,σ}}(V_{R,σ}) … we have h = ∏_{σ:F→R,σ} ×V_{R,σ} → R. We also have an isomorphism Let h ∈ X; then considering h as a H′_{R,σ} is the weight homomorphism for h_σ. … We choose Ψ ∈ Bil_{H^c} ∩ ∏_{σ∈F} U_σ. *Correction:* Bil_{H^c}(V) ⊗_Q R ≅ ∏_σ Bil_{H^c_{R,σ}}(V_{R,σ}). Restore the sentence of arXiv v3 (p.82): h = ∏_σ h_σ for some h_σ: S → H′_{R,σ}, and h_σ(i) is a Cartan involution of H′_{R,σ}/w_σ(R)^×, where w_σ: G_m → H′_{R,σ} is the weight homomorphism of h_σ. Choose Ψ ∈ Bil_{H^c}(V) whose image in Bil_{H^c}(V) ⊗_Q R lies in ∏_σ U_σ.

The reasons and the places searched are in the JSON.

## Gaps: status after this continuation

- **G-local** (deferred). Bruhat–Tits, Edixhoven, tame fixed-point, Néron-model and Levin results are cited suppliers.
- **G-models** (deferred). Pappas–Zhu, Levin, AGLR, FHLR and Haines–Richarz are cited suppliers; splitting long constructions is design work.
- **G-roots** (recorded). E11–E13 record the B/D coordinate misprints and the Corollary 4.2.19 sign; with them the case checks and Proposition 4.2.13's inequality k_α ≥ j_α go through as printed. Declaration-level proofs are formalisation work.
- **G-reps** (recorded). E9: the adjacent-weight criterion fails in characteristic p (GL_2, highest weight (p, 0)), but it holds for minuscule weights, which is all Theorem 4.2.3 needs. Jantzen and the Kostant lattice are cited suppliers.
- **G-display** (deferred). Zink, Lau, Bültel–Pappas and Hoff are cited suppliers. E1 records the KP18 Lemma 3.1.9 construction that §5.1 replaces; Lemma 5.1.11 now has its own item (F34).
- **G-purity** (deferred). Anschütz Proposition 10.3 and PR24 Appendix A are cited suppliers.
- **G-tensors** (deferred). The absolute-Hodge and integral comparison theorems are cited suppliers.
- **G-siegel** (deferred). Zhou's parahoric Siegel lattice-chain moduli (Zh20 §6.3) is a cited supplier.
- **G-diamonds** (deferred). Scholze–Weinstein and the DvHKZ appendix are cited suppliers.
- **G-shtukas** (deferred). DvHKZ, PR24 and PR26 are cited suppliers.
- **G-prismatic** (deferred). The DvHKZ appendix and its prismatic sources are cited suppliers.
- **G-components** (deferred). KP18 §§4.3–4.6 is a cited supplier; E5 records the conjugated component levels the paper applies.
- **G-global** (recorded). E14 reconstructs Lemma 7.2.8's garbled sentence from arXiv v3. Deligne, Satake, Zarhin and KP18 are cited suppliers; Lemma 7.2.5 now has its own item (S43).
- **G-shimura** (deferred). Declaration-sized splitting is design work; E2, E3 and E5 record the KP18 corrections that §7 applies.

## Validation (cc-442dc5)

`scripts/check_paper.py` and `research/blueprint/intake.py check-files` pass on the result. Item ids are unique, every missing item is routed exactly once, and every prerequisite target exists. No Lean deliverable is part of a paper job.

## Checkpoint history (unchanged)

The report of the earlier checkpoint follows as it was written. Where it says *partial* or *open*, or gives the earlier classification of the findings reclassified here, this continuation supersedes it.

## PAPER-KISIN-PAPPAS-ZHOU-26 — integral parahoric models, II

Agent: Codex. Session: `codex-c83e7a`. Issue: #1342. Status: **partial checkpoint**. All items have implementation status `unchecked`.

This extraction reads the complete published paper by Mark Kisin, Georgios Pappas and Rong Zhou, *Integral models of Shimura varieties with parahoric level structure, II*, Forum of Mathematics, Pi 14 (2026), e14, pp. 1–89, [DOI 10.1017/fmp.2026.10031](https://doi.org/10.1017/fmp.2026.10031). The final result constructs integral models at connected parahoric level for every abelian-type Shimura datum at every odd prime. It also supplies the corrected display connection, a condition called very-goodness that makes the tensor deformation argument work, existence of suitable embeddings including the exceptional classical cases, and the local-model geometry those proofs need.

The main paper, its proofs, introduction, conventions, bibliography and errata have all been read. This does **not** close the recursive prerequisite graph. The original proofs of several cited local-model, purity, integral shtuka, prismatic and component-descent results remain to be extracted. Long constructions still need finer dependencies. The result is deliberately partial so the next worker can continue from an explicit mathematical inventory rather than inherit an unsupported claim of completeness.

### Source and baseline discipline

All locators refer to the **89-page published version**, online 27 April 2026, accepted 27 February 2026. Its SHA-256 is `1abf681bd3795e76118842347f9789c2abcac3740b46f09d258b7d3947ee53d8`. The publisher identifies the text as CC BY 4.0. The 94-page arXiv v3 was also acquired, but its numbering is not mixed into this extraction. Earlier KPZ locators in other paper checkpoints must be converted before they are imported here.

Three original sources received focused reads. Pappas 1995, Example 4.5(a), printed pp. 64–65, clarifies the singular surface discussed in Remark 4.1.5. Hoff's arXiv v1 PDF pp. 12–16 gives the relative pair factorization, display deformation equivalence, universal display and contravariant classification statements behind the correction. Daniels–van Hoften–Kim–Zhang PDF pp. 36–40 and 49–52 supplies the canonical model statement, component reduction and Appendix A3's comparison proof. Their download hashes and precise read scopes are in `sourceArchives`. No claim is made to have read the rest of those papers. In particular the earlier prismatic construction in the last source is still a gap.

The pinned libraries are Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The 22 declaration references used for 14 narrowly scoped baseline items were statement-read at these identical pins in this worker session. They provide Witt coefficient carriers, Frobenius, reductive/torus carriers, character–cocharacter pairings, dominant Weyl representatives, the abelian-variety carrier, divided powers and related finite-free/order structure. They do not provide the new geometric and integral comparison theorems.

Several tempting matches fail the actual statement test. `TauCeti.IsMinuscule` is a characteristic-zero Lie-module predicate over an algebraically closed field with the stated Killing and finite-dimensional hypotheses. It is not the integral root-pairing definition and is not the modular Weyl-module construction. `TauCeti.YoungTableau.weylModule` is a Young-symmetrizer construction over a Q-algebra. It does not give Jantzen's Weyl module for an arbitrary reductive group in characteristic p. The Kostant root-subgroup coordinate tangent theorem does give a concrete matrix differential over the required base-change coefficient algebras, but an identification with the abstract pinned group root map and the affine-Grassmannian loop quotient is additional work.

The reviewed library audit and relevant stage descriptions were read. The manifested atlas sweep covers 294 files, supplemented by all 38 current paper extractions, fetched with both Git-blob and SHA-256 checks. Search matches were used to find potential owners, not to certify mathematical coverage. The two upstream documents read in depth are ReductiveGroups and RootSystems. Current packets, decompositions, proposals, reserved ids and relevant candidate routes were inspected before assigning the missing items.

### What the local theory must keep separate

The local group model matters throughout. A full stabilizer at a building point can be disconnected. Its neutral component is the connected parahoric. A quasi-parahoric retains a smooth integral model between the connected and full fixers, rather than merely naming a compact subgroup of rational points. Weil restriction, tame fixed points and the graded lattice chain each have their own data. The total lattice uses a determining segment without counting the periodic endpoint twice.

R-smoothness concerns schematic closures in the appropriate Néron lft model. Generic-fiber smoothness is not enough. Quasi-tameness permits products of restrictions of scalars from fields that themselves may be wildly ramified, provided the factor groups split tamely over those fields. Essential tameness in the standard assumptions is a condition on the adjoint group. Tameness is needed for the smooth fixed-point arguments but is not required by the earlier existence of a Galois-stable lattice for a faithful representation. These distinctions prevent an artificial restriction of the final theorem to tamely ramified Shimura data.

The standard local assumptions combine p greater than two, local abelian type, essential tameness and the classical-type restriction excluding trialitarian D4. Local Hodge type is normalized by the two representation weights 1 and 0. Local abelian type uses an isomorphism of adjoint data from an auxiliary Hodge-type pair; it does not silently identify central cocharacters or reflex fields.

Section 3 constructs several different objects. The bounded local-model v-sheaf is a v-closure. The polynomial Beilinson–Drinfeld construction uses torsors trivialized away from the Eisenstein polynomial E(u), not automatically away from u. Its naive scheme-theoretic orbit closure is distinguished from the auxiliary-cover construction and from the final normal integral representative. Under the theorem's conditions the final representative is flat, proper and normal, with reduced special fiber. Normal Cohen–Macaulay irreducible components and the stronger whole-model Cohen–Macaulay statement are separate inputs.

A closed integral representation can give only a normalization map from the local model onto its Grassmannian image. **Goodness** is the stronger assertion that this map is a closed immersion. The existence theorem may replace the representation by a direct-sum power and may replace the quasi-parahoric while preserving its connected component. Using the original full stabilizer requires the stated generic-facet and division-index conditions. These qualifications appear explicitly in the inventory rather than being hidden inside the words “good embedding.”

There is also a proof-order issue. The closed embedding theorem 3.3.25 is used, together with the v-sheaf recovery in 3.4.1, to establish the choice-independent local model in 3.2.15. Reversing that order creates a cycle. The dependency graph follows the proof order rather than numerical order.

### Tangent geometry and the source corrections

The central geometric input is that certain Schubert tangent spaces are **spanned** by formal-curve tangent images. This means linear span. It does not assert that every individual tangent vector lifts to one formal curve. The ambient negative big cell separates root directions from Cartan directions; the rotation action records the loop degree.

For a root alpha and dominant lambda below mu, the integer k_alpha measures the largest allowed coroot step after passing to the dominant Weyl representative. Root curves supply the lower tangent bound. The Finkelberg–Mirković scheme imposes two lattice inclusions in every dominant Weyl module and supplies an upper bound. Its projectivity and the inclusion of the ordinary Schubert variety are needed; the stronger reduced-equality remark is not used as a theorem in this proof. The active-weight set retains the nonvanishing condition on the root operator. The source's general equivalence with existence of adjacent weights in characteristic p still needs checking against the original modular representation theory before it can be treated as a reusable lemma.

Proposition 4.2.13 is a finite minuscule-weight test for integral dominance within one coroot-lattice coset. The cases are genuinely different: all fundamental weights in A, the spin weight in B, the vector weight in C, two half-spin weights for D-real and the vector plus both half-spins for D-quaternionic. Root tangent equality includes all these mod-p abelian types. The Cartan argument is more restrictive: it works at all points in A/B/C/D-real, while the D-quaternionic statement requires one of the two end-wall conditions. The minimal stratum satisfies the required condition. The restriction-of-scalars special-fiber comparison then gives curve spanning at the minimal stratum in all cases, and at every point without D-quaternionic factors.

Four printed issues are recorded rather than reproduced as mathematical facts. First, Remark 4.1.5 literally repeats x in its polynomial-ring variables and calls the repaired surface normal. Replacing the repeated variable gives x(x+yz)=0, a reducible surface whose local ring at the crossing is not normal. The tangent obstruction is valid: along a pointed curve the leading degree-two equation forces the first x coefficient to vanish, while the Zariski tangent space at the origin has all three coordinates. Pappas's original example has a **regular mixed-characteristic total model** and a special fiber with two smooth components meeting nontransversely. That distinction explains the useful example without certifying the later normality wording. The published page was rendered and visually checked, so this is not merely a text-extraction artifact.

Second, Corollary 4.2.19 prints k_alpha where its preceding lemma and later use give the negative-root bound k_minus_alpha. In A1, lambda=mu=(1,-1) yields k_alpha=2 and k_minus_alpha=0. The exact regression detects the sign. Third, the B coordinates must include the half-integral spin weight, so the abstract weight lattice cannot be only Z^n. Fourth, the last D simple root is e_(n-1)+e_n; the source repeats e_(n-1). The D-quaternionic coordinate sign also depends on the order of the half-spin labels. The extraction uses the intrinsic coweight expression until that adapter is proved.

The D4 example at the end of the Cartan discussion is a useful limit on the argument. At the stated mu, lambda and H, the two negative-root curve bounds are two and the representation bound is three. This shows a gap between the constructed curve directions and the FM bound. It does not, without another theorem, show that the actual Schubert tangent space contains the extra direction. The report and item R27 preserve that distinction.

### The corrected display argument

The coefficient ring is Zink's subring of Witt vectors, with the decaying maximal-ideal Witt coordinates. A full Witt ring is not a interchangeable replacement. The frame includes its ideal, Frobenius lift and semilinear divided Frobenius; the identity phi(i)=p phi1(i) must be used without dividing by p in a torsion ring.

A normal-decomposable pair consists of a free module M and a filtration module M1 admitting M=L plus T and M1=L plus IT. The tilde construction is a **free module functor**. For a pair morphism with blocks A,B,C,D and C in I, its matrix becomes phi(A), p phi(B), phi1(C), phi(D). This formula proves composition and change-of-decomposition compatibility. There is a natural map to the Frobenius pullback whose diagonal matrix is 1,p. It identifies the tilde module with a Frobenius image only under p-torsion-freeness. Its reduction can lose injectivity even when the unreduced coefficient ring was torsion-free.

The canonical connection c has direction from the constant residual tilde module to the universal tilde module after first-order reduction. Its construction uses the relative Dieudonné frame and Zink's logarithmic coordinates. The chosen identification of M with the constant residual module reduces to the identity. An arbitrary normal decomposition is not a replacement for this construction. In particular the commutative square in Lemma 5.1.15 does not characterize c, since its horizontal maps may cease to be injective. The corrected constant-first-order condition is the equation involving Psi composed with this c. Hoff's original universal-display statement was read with its hypotheses and contravariant normalization; the covariant sources require a convention adapter.

For the local-model deformation, a scheme-theoretic tensor stabilizer must be valid over every coefficient algebra. Rational tensors alone do not prove integral tensor membership, and equality on field-valued points does not prove the group-scheme stabilizer equality. Integrality and triviality of the tensor isomorphism torsor use the specific Anschütz and Pappas–Rapoport purity inputs. These remain named gaps rather than being replaced by a different Grothendieck–Serre theorem.

A very-good embedding is a good embedding whose tensors are horizontal for the canonical connection modulo m squared plus the reflex uniformizer. The definition is independent of the chosen tensor family; the connection then gives the corresponding tensor-torsor comparison. The formal API includes unramified base-change detection, endomorphism horizontality, intersection with endomorphism stabilizers, direct summand descent, sums of **isomorphic copies**, and products for separate groups. These results do not establish arbitrary diagonal sums of unrelated representations of one group.

Theorem 5.3.11 detects the tensor defect along formal curves spanning the tangent space. The proof uses a power-series p-frame, its dual-number comparison, integral tensors obtained by a lattice intersection argument, and the logarithmic description of a square-zero Witt ideal. Finitely many tangent images suffice, and their combined cotangent map is injective. The printed intermediate map from the first-order quotient to k[[u]] must be interpreted through the actual composite from the local ring to k[[u]] and then to k[epsilon]. Only the latter composite factors through the first-order ideal. The separate arithmetic-curve criterion has its own statement and is not made an unnecessary prerequisite of this proof.

Section 6 then supplies the embeddings. The non-exceptional theorem excludes D-quaternionic factors and type A division algebras with p-divisible index, and also retains R-smoothness, prime-to-p derived fundamental group and the generic-facet hypothesis. Its proof descends from the reductive tame extension through endomorphism cutouts and a total-lattice direct summand. The paired lattice-and-dual result uses the trace form and inverse different, so it is stronger than a bare statement about arbitrary sums.

The exceptions receive separate constructions. D-quaternionic cases use orthogonal or quaternionic PEL realizations, their larger endomorphism-defined groups and the passage to the smooth closure of the generic neutral group. The latter is not necessarily the relative identity component. The division-algebra A construction uses the standard and opposite-dual representations and remains valid when p divides the index. Left/right module conventions, Morita equivalence, reduced trace, exchange involution and matching multipliers are all necessary data. These constructions explain why the final global theorem has no non-exceptional restriction.

### Global models and the two different local comparisons

The Hodge integral model is the normalization of the generic Hodge variety's closure in the relevant integral Siegel model. The supplier for general lattice-chain Siegel moduli is stated separately: the existing PEL good-level smoothness stage does not prove the parahoric statement. Under the full-stabilizer, R-smooth, prime-to-p fundamental-group and very-good embedding hypotheses, Theorem 7.1.3 gives the pro-level DVR extension property and a tensor-frame torsor with a smooth equivariant map to the local model. If the integral group is connected, it also gives the ordinary henselization comparison with the same finite residue field.

Theorem 7.1.8 has weaker embedding assumptions and gives **strict** henselization comparison. Its proof uses the canonical integral shtuka model, a formal-completion comparison, full faithfulness of the normal integral diamond functor and Artin approximation. The integral shtuka theorem itself depends on this paper's Sections 5–6. It cannot be fed backwards to prove very-goodness. Nor does a strict-henselian statement automatically give the same finite residue field needed by the earlier ordinary-henselian result.

The global cohomological condition uses C=ker(G_sc to G_der), a finite central group. It says that vanishing at every finite prime other than p forces vanishing at p. This C is not the full center Z_G, whose R-smooth torus condition is separate. Under the required assumptions the connected-parahoric normalization is finite étale, its components descend over the maximal extension unramified above p, and a derived central cover yields a finite map of integral components. The adjoint structure group in the descended local-model diagram is the smooth quotient of the integral group by the schematic center closure. Its neutral component is the adjoint parahoric; the whole quotient need not be the full adjoint fixer.

The auxiliary Hodge cover is also substantial mathematics. The abelian-type hypothesis is required when choosing H-sharp and Deligne's minuscule vertices. The construction uses CM scalar data, p-splitting and disjointness, a compact-center subgroup, trace polarizations and weak approximation, followed by the integral form of Zarhin's trick. The non-exceptional and exceptional covers have different inertia-coinvariant conclusions. The final product is a fiber product over a **common similitude multiplier**, rather than an unrestricted product of groups acting on a sum of alternating spaces.

Proposition 7.2.19 supplies a derived fundamental group that is a 2-group, and trivial without D-quaternionic factors; the local-to-global condition; splitting in the composite reflex field; an R-smooth center and quasi-tame compact center; and a very-good self-dual embedding. Torsion-free inertia coinvariants of the abelian quotient require the additional exclusion of p-divisible division indices. These conclusions are not merged into one indistinct cover-existence assertion.

Theorem 7.2.21 then gives, for every abelian-type datum at p greater than two, the finite étale away-p tower, the pro-level bijection on mixed-characteristic DVR points, étale-local identification with the local model, and the smooth adjoint torsor diagram. Its elementary reduction to the connected group has the non-exceptional hypothesis. Corollary 7.2.24 removes that hypothesis by a different argument.

For that corollary, Daniels–van Hoften–Kim–Zhang Proposition 4.3.3 requires the scheme-theoretic diagram to be compatible with its crystalline shtuka diagram. Appendix A3.3 proves the compatibility through relative prismatic Dieudonné theory and a generic comparison into a separated quotient. The portion actually read uses the self-dual lattice and smooth Siegel base in its footnote, which the chosen global cover supplies. It should not be generalized to every lattice contained in its dual without checking. The component-torsor section descends through full faithfulness for perfect schemes and topological invariance of the étale site; its inverse image is an open connected-group torsor and retains the smooth map. An arbitrary smooth group torsor is not enough.

All three corrections to KP18 and the added Pappas23 hypothesis are retained. The local action morphism is used for smoothness, without the erroneous torsor assertion. The logarithmic tail after inverting p uses the topology of a p-adic lattice, since p is a unit in the localized ring. The component indexed by j uses the conjugated level j Kp-neutral j inverse. The prior display-moduli and independence arguments require very-goodness.

### Ownership and remaining work

The following route briefs are the proposed design instructions. Existing candidate ids are retained where the direction is already present. In particular the earlier HE21 dominance candidate is the common owner for the overlapping KZ25 dominance proposal. This paper does not silently create a third copy. No file belonging to another issue is changed.

#### Route 1: `ReductiveGroupsPartII`

The existing continuation owns integral Weil restriction, buildings and smooth parahoric/fixer models. Add quasi-tame and R-smooth inputs, tame fixed-point and stable-chain statements, the GO/GO+ distinction and smooth center/multiplier intersections here. No new copy of Bruhat–Tits theory is proposed.

Supplier stages: `ReductiveGroupsPartII:RG2.0a`, `ReductiveGroupsPartII:RG2.2`, `ReductiveGroupsPartII:RG2.3`.

This route owns 22 extracted items.

#### Route 2: `RootSystemsPartIIDominanceAndDemazure`

An earlier HE21 continuation already owns integral dominance and related Weyl combinatorics. This extraction extends that candidate and records the later KZ25 alias for consolidation; it does not propose another parallel root roadmap.

Continue the candidate already proposed by PAPER-HE-21. Import root data, integral pairings, Weyl actions, dominant representatives and numbered classical types from Root systems, Weyl groups, and the Cartan–Killing classification (tauceti:TauCetiRoadmap/RepresentationTheory/RootSystems). Import group root vectors and their modular representation action from Reductive algebraic groups (tauceti:TauCetiRoadmap/ReductiveGroups) and the integral-representations continuation below. Add the integral-coroot order and mod-p abelian coweight families needed here, without replacing the cocharacter lattice by a rational vector space. Define minuscule weights, k_alpha, active-weight minima l_alpha and the Cartan bound l_H. Prove Proposition4.2.13 with its fixed coroot coset and dominance-detecting minuscule set, then the separate A,B,C,D-real,D-quaternionic cases. Prove the sign-sensitive geodesic formula of Lemma4.2.18, correcting Corollary4.2.19 to k_minus_alpha. Prove Propositions4.3.9 and4.3.10; the latter requires an end-wall condition. Compute the D4 example while making no claim about the unknown actual Schubert tangent beyond the proved bounds. Keep the spin weight lattice and D end-root convention explicit. The Kisin–Zhou candidate RootSystemsDominancePartII overlaps this earlier direction: consolidate its dominant-coroot/Stembridge lane into this candidate at design intake, retaining both papers’ stable item ids and the additional Frobenius-orbit proof obligation. Do not build two dominance orders. Tests include A1 parity and the unequal signed bounds, half-integral B spin weights, the D last-root pairing, the D4 bound3 versus2, and failure of the test-set property for the source’s B example mu=(2,1,1).

This route owns 17 extracted items.

#### Route 3: `ReductiveGroupsIntegralRepresentationsPartII`

The upstream reductive group roadmap supplies group/comodule and pinned group-scheme foundations, but not these positive-characteristic Weyl-module statements. ClassicalGroups and LieHighestWeight are characteristic zero in the relevant stages; the arithmetic and local-group continuations have different targets.

Build on Reductive algebraic groups (tauceti:TauCetiRoadmap/ReductiveGroups), specifically its representation/comodule dictionary, reductive groups, pinnings and integral Chevalley–Demazure root maps. Import the abstract root datum from tauceti:TauCetiRoadmap/RepresentationTheory/RootSystems and the existing Kostant lattice and root-subgroup coordinate APIs at the pins. Construct Weyl modules V(nu)=Ind_B^G(-w0 nu)^* for arbitrary dominant characters over algebraically closed fields of positive characteristic, via a compatible integral construction. Export weight spaces, duality, root-operator matrices, base change and the exact active-weight criterion used by KPZ4.2.9. Prove that minuscule modules have the needed one-dimensional orbit weights and nonzero root arrows, and distinguish that restricted fact from the printed general adjacent-weight assertion, which must be checked against Jantzen before use. Establish the centralizer-conjugacy of stable lattices in minuscule characteristic-zero representations used in Proposition3.3.10. Tests must include SL2 in characteristic p, a root action with a coefficient killed by p, minuscule spin weights, and the lattice-centralizer comparison. Do not re-plan characteristic-zero Lie highest-weight theory or Young-symmetrizer GL_n modules: their field and Q-algebra hypotheses do not supply this task. This lane is distinct from ReductiveGroupsArithmeticPartII, which owns global tori, cohomological transfer and rational conjugacy, and from ReductiveGroupsPartII, which owns local buildings and integral fixers. Coordinate-to-abstract-group comparison remains an explicit theorem.

This route owns 3 extracted items.

#### Route 4: `GeometricSatakeLocalModelsPartII`

The existing GS0 geometry stops before flat integral scheme recovery and these tangent/embedding theorems. The KZ25 candidate already opens this exact direction; current work fills its major KPZ supplier.

Extend the existing candidate from PAPER-KISIN-ZHOU-25, retaining its same-residue-field curve lane. Import Geometric Satake over the Fargues–Fontaine curve (GeometricSatakeAndFusion GS0 loop and Witt geometry), Global shtukas and function-field Langlands (GlobalShtukasAndFunctionFieldLanglands GS.1), Reductive groups, Part II (ReductiveGroupsPartII RG2.0a,RG2.2,RG2.3), the dominance continuation and the integral diamond comparison continuation. Define local Hodge/abelian-type data, standard assumptions, the local-model v-sheaf, polynomial Beilinson–Drinfeld model, naive closure, auxiliary prime-to-p cover and normal integral representative as separate objects. Under p>2, local abelian type, essential tameness and classical type, prove the flat proper normal representative with reduced special fiber. Separate component Cohen–Macaulayness from the stronger whole-model input. Prove Theorem3.1.9’s normalization-of-image statement and the genuinely stronger good closed-embedding existence in3.3.25, retaining the possible change of quasi-parahoric and the generic-facet/index refinements. The proof order is3.3.25 then3.4.1 then3.2.15. Define curve-spanned tangent spaces and the FM lattice-bound scheme. Prove root tangent equality for every mod-p abelian type under p-prime derived fundamental group, Cartan equality for A/B/C/D-real and the specified D-quaternionic end walls, then Theorems4.1.6 and4.4.3. Minimal-stratum spanning includes D-quaternionic; all-point spanning does not. Do not infer FM reducedness or infer spanning for arbitrary normal singularities. Import representation theory rather than rebuilding Weyl modules. Tests include a GL_n hyperspecial Grassmannian, a central cocharacter, a nonclosed normalization map, root degrees and the corrected reducible tangent-cone example.

This route owns 36 extracted items.

#### Route 5: `FiniteFlatGroupsWithTensorsPartII`

The existing candidate owns tensor displays and very-good deformations. KPZ supplies the corrected construction and existence proofs; ordinary classification in R07 is imported, not repeated.

Continue the existing tensor-deformation and ordinary-lift candidate from PAPER-KISIN-ZHOU-25. Import Finite flat group schemes and integral p-adic Hodge theory (FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.2,R07.4,R07.6), Witt and divided-power carriers at the pins, integral local models from GeometricSatakeLocalModelsPartII, and local fixer/lattice theory from ReductiveGroupsPartII. Define Zink’s coefficient subring, strict frames, normal-decomposable pairs, the free tilde functor and relative PD frames. Prove the block formula, functor composition, decomposition independence and base change. The natural map to Frobenius pullback is injective only over p-torsion-free rings. Construct the canonical connection using relative frames; its commutative square does not characterize it after reduction. Prove the corrected constant-first-order versality theorem with the contravariant display/p-divisible convention. Define integral stabilizer tensors, adapted deformations and very-goodness modulo m^2+pi_E. Prove tensor integrality and triviality through the precise Anschütz purity supplier, then tensor-family independence, endomorphism horizontality, summand descent, sums of isomorphic copies and products of separate groups. Prove Theorem5.3.11 by power-series frames, integral tensor comparison and injective cotangent detection. Establish the separate arithmetic-curve criterion and the smooth generic-neutral closure lemma. Prove Theorem6.1.1 and the paired trace-dual theorem6.1.9 under non-exceptional,R-smooth,p-prime and generic-facet hypotheses. Independently construct D-quaternionic PEL and p-divisible-index A representations and their self-dual very-good chains. General goodness implies very-goodness remains unproved. Preserve KZ’s separate ordinary Breuil–Kisin lift lane. Tests include torsion kernels, canonical versus arbitrary connection, multiplier compatibility, dual conventions, Morita handedness and the distinct exceptional-factor assumptions.

This route owns 48 extracted items.

#### Route 6: `DiamondsAndVStacksIntegralPartII`

D6 explicitly concerns analytic diamonds and étale-category equivalence, and disclaims general full faithfulness. The38 prior paper extractions contain no candidate owning these normal integral recovery statements.

Import Diamonds and v-stacks (DiamondsAndVStacks D6) for the analytic diamond and site comparison, together with the perfectoid/v-descent foundations it names. Add the precise Scholze–Weinstein18.3.1 full faithfulness for perfect schemes and18.4.1 full faithfulness for normal integral schemes/formal models. Read and state the original hypotheses before filling the present supplier contracts: an equivalence on étale categories is not full faithfulness on all spaces. Prove compatibility with the normal completions and generic-fiber restrictions used in local-model recovery. Prove the separated integral quotient GL(Λ)^diamond/G^diamond under DvHKZ AppendixA3.5’s exact group-scheme hypotheses, importing the saturated line-stabilizer representation. Prove the generic restriction injectivity of LemmaA3.4. Export the component-torsor section descent via perfect schemes and topological invariance of the étale site, with naturality needed by integral shtuka diagrams. The final applications are recovery of KPZ3.4.1’s normal flat closure and the normal-completion identification in7.1.8. Tests must distinguish a normal integral model from its special-fiber point set, an infinitesimal thickening, a perfect component torsor, and generic equality into a separated versus unverified target.

This route owns 4 extracted items.

#### Route 7: `HeckeStacksAndLocalShtukasIntegralPartII`

HS2 supplies generic Hecke-fiber moduli, not canonical integral parahoric systems. The earlier ADLV continuation has a different endpoint. This is the missing integral direction needed for the strict-henselian and all-case connected-diagram refinements.

Import Hecke stacks and local shtukas (HeckeStacksAndLocalShtukas HS2) for bounded generic-fiber moduli, integral diamond recovery from DiamondsAndVStacksIntegralPartII, corrected tensor displays from FiniteFlatGroupsWithTensorsPartII and integral local models from GeometricSatakeLocalModelsPartII. Define the canonical integral parahoric/quasi-parahoric model system with the actual axioms of PR24 and DvHKZ4.1.4. Prove the Hodge-type existence theorem DvHKZ4.2.3 and the integral local-shtuka formal-completion comparison PR26 Theorem2.5.5. That comparison consumes KPZ §§5–6 and cannot prove those earlier results. Establish relative prismatic Dieudonné compatibility and the crystalline local-model comparison of DvHKZ AppendixA3.3 with its self-dual/smooth Siegel base assumptions. Prove the exact small/big diamond component sequences of Lemma4.3.4, then Proposition4.3.3: a scheme local-model diagram compatible with the crystalline one reduces to a connected-parahoric torsor, still with a smooth map. Use perfect-scheme full faithfulness and étale topological invariance for the component section. Do not infer this reduction for an arbitrary smooth torsor diagram. Tests include the connected case, a nontrivial component quotient, the identity level map and a diagram lacking crystalline compatibility. The HE21 candidate HeckeStacksAndLocalShtukasPartIIAffineDeligneLusztig owns generic ADLV dimensions/cordiality, which is a distinct lane; import any shared generic objects instead of recreating them.

This route owns 6 extracted items.

#### Route 8: `ShimuraVarietiesHondaTatePartII`

The existing integral reduction candidate is the shared owner of these Shimura models. This work supplies the all-abelian odd-prime foundation and corrected descent rather than proposing another Shimura roadmap.

Extend the candidate already used by PAPER-KISIN-MADAPUSIPERA-SHIN-22 and PAPER-KISIN-ZHOU-25; retain its reduction,Honda–Tate and Frobenius lanes. Import Complex Shimura varieties and canonical models (ShimuraVarieties V1,V6,V8), Shimura data (ShimuraData), Siegel and PEL moduli problems (PELModuli M1,M2,M4), Abelian schemes and arithmetic moduli, AutomorphicBundles tensor comparisons, and the four integral continuations in this extraction. Construct the parahoric Siegel lattice-chain supplier, then the Hodge normalization at a full stabilizer. Under(A) generic-facet full stabilizer,(B) R-smooth and p-prime derived fundamental group,(C) a very-good lattice embedding, prove Theorem7.1.3: pro-level DVR extension, G-torsor smooth local-model diagram, and ordinary henselization comparison with the same finite residue field when G is connected. Keep7.1.8 separate: its weaker self-dual-chain stabilizer hypotheses yield strict henselizations through integral shtukas. Define C=ker(G_sc→G_der), condition(D) on H¹(Q,C), and the distinct R-smooth center condition(E). Prove finite étale connected-level normalization, unramified component descent and the derived-cover finite component map. Construct H-sharp, Deligne’s minuscule vertex data, CM scalar extension, compact-center enlargement, trace polarization and Zarhin self-dual lattice; the abelian-type hypothesis is essential. Prove Proposition7.2.19’s four outputs and conditional torsion-free coinvariants via the common-multiplier fiber product. Finally prove Theorem7.2.21 for EVERY abelian-type datum at p>2: finite étale away-p tower, pro-level DVR bijection, étale-local local-model geometry and the smooth adjoint quotient torsor diagram. Prove its elementary connected reduction under(NE), then Corollary7.2.24 in all cases using the compatible crystalline diagram. Apply every erratum in§7.3, especially conjugated component levels and the added very-good hypothesis. No duplicate generic canonical-model construction is allowed.

This route owns 40 extracted items.

### Explicit closure gates

- **G-local** (22 direct consumers): Read and decompose the original Bruhat–Tits, Edixhoven, tame fixed-point, Néron-model and Levin inputs at each cited proposition. Close the full-fixer/connected-fixer, R-smooth quotient and integral lattice adapters. The published KPZ proofs were read; this is recursive original-source closure.
- **G-models** (37 direct consumers): Expand Pappas–Zhu, Levin, AGLR, FHLR and Haines–Richarz at the actual local-model representability, normality, reducedness and Cohen–Macaulay results. Split polynomial-model construction, auxiliary-cover comparison and all long proof steps to declaration size. Do not use Theorem3.2.15 to prove3.3.25.
- **G-roots** (17 direct consumers): Complete the declaration-level classical dominance and Cartan cancellation proofs, with the corrected B/D weight conventions and the negative-root formula of Corollary4.2.19. The exact A1 and D4 regressions pass; they do not prove all ranks or replace modular representation input.
- **G-reps** (7 direct consumers): Read Jantzen II Chapters1–2 and the original integral/minuscule lattice results. Verify the nonzero-root-action versus adjacent-weight assertion in characteristic p before using it outside the proved minuscule cases. Identify the pinned Kostant differential with the abstract group root map, and prove the line-stabilizer and Morita adapters.
- **G-display** (46 direct consumers): Complete Zink/Lau/Bültel–Pappas original frame/display proofs and Hoff prerequisites. Hoff PDF12–16 was read, including1.21,1.23,1.28,1.29 and the contravariant normalization remark. Expand the universal pair, logarithmic Witt square-zero detection, arithmetic-curve criterion and all long construction proofs. Do not inherit pre-correction tensor horizontality from Hoff v1 without checking.
- **G-purity** (2 direct consumers): Read Anschütz Proposition10.3 and PR24 AppendixA3.2 in full and expose the exact parahoric torsor extension/triviality hypotheses for the punctured perfectoid/Witt base. A regular-semilocal Grothendieck–Serre theorem is not this supplier.
- **G-tensors** (3 direct consumers): Complete the absolute-Hodge, integral étale/crystalline and de Rham tensor comparison sources, preserving dual Tate versus H¹ and contravariant display conventions. The all-algebras stabilizer and integral adapted-deformation equivalence must be proved, not inferred from rational stabilizers.
- **G-siegel** (1 direct consumers): Read Zh20§6.3 and the exact integral Siegel lattice-chain construction. Supply its representability, universal isogeny chain and nonprincipal-polarization hypotheses; PELModuli M2 only supplies the stated good-level case.
- **G-diamonds** (8 direct consumers): Read the full original SW18.3.1 and18.4.1 statements and proofs, and the generic Hom-injectivity/separated-quotient suppliers. DvHKZ AppendixA3.4–A3.5 and component-section argument were read, but their original SW/HdS and étale-invariance inputs are not recursively closed.
- **G-shtukas** (9 direct consumers): Acquire and decompose DvHKZ Definition4.1.4 and the associated PR24 canonical axioms, PR24 Theorem1.3.2 and PR26 Theorem2.5.5. DvHKZ4.2.3,4.3.3–4.3.4 and AppendixA3 were read selectively. The canonical axioms themselves and earlier constructions need full reading. Preserve the dependency on KPZ §§5–6.
- **G-prismatic** (2 direct consumers): Read DvHKZ AppendixA1–A2 and its original relative prismatic Dieudonné and generic comparison sources. AppendixA3.3 compatibility is checked as a statement/proof, but the earlier prismatic inputs remain open. Preserve the self-dual smooth Siegel base used in footnote24.
- **G-components** (11 direct consumers): Read KP18§§4.3,4.5,4.6 with the complete quotient-action and unramified component descent constructions. Only its p195 star-product passage was read in the preceding extraction. Apply KPZ§7.3’s conjugated levels to every component index before exporting finite maps and descended torsors.
- **G-global** (13 direct consumers): Read Deligne71/79, Satake, Zarhin85 and the explicit integral Zarhin form, and KP18’s CM/reflex/center enlargement proofs. Reconstruct Lemma7.2.8’s garbled positivity sentence from its formulas and source; expose the local-to-global C-cohomology proof and conditional coinvariants.
- **G-shimura** (12 direct consumers): Close the Hodge/abelian normalization, descent and extension proofs using the preceding supplier gates and precise Artin approximation. Main theorem outputs are split, but the inherited global constructions need further declaration-sized dependencies before a complete classification.

### Validation and interpretation

The extraction has 203 items: 14 library carriers, 13 planned imports and 176 missing items. Every missing item belongs to exactly one of eight routes. All 67 definitions and constructions have three API statements and three unit-test specifications, for 201 of each. The graph is acyclic and every internal dependency resolves. Planned items cite actual current stage ids; they are not declarations claimed to exist in Lean. The 22 baseline declaration references retain their pinned source statements and limited scope.

Eight exact arithmetic regressions passed: the A1 root-sign example; the B3 spin lattice pairing; the D4 negative-root and Cartan-weight bounds; 768 two-by-two tilde-functor composition cases; the mod-p kernel of the comparison diag(1,p); the reducible-surface leading tangent obstruction; the common-multiplier restriction; and the need to conjugate a nonnormal component level. These are checks of specific examples and formulas. They do not prove the geometric theorems or all-rank representation results. The API tests in the JSON are specifications, not compiled tests.

The authorized deliverables are this report, the paper result JSON and the handoff. No Lean file is authorized for this issue, and none is supplied or claimed to compile. The paper schema checker and the intake file checker are run on these three files. The handoff records their final result. No atlas or another paper's deliverable is edited, and no downstream design job is marked complete by this extraction.

The next worker should preserve item ids and first close the modular root-action and corrected frame/purity suppliers, then integral model recovery and shtuka comparison, followed by global covers and component descent. The full published paper need not be read again from scratch: the outstanding tasks are original-source verification and finer proof decomposition. Bibliographic groups are acquisition leads until that work is done. A source route or a Part II candidate is an ownership decision, not proof closure.

### Item index

The JSON contains the full statements, hypotheses, dependency lists, use-derived APIs, test specifications and gap assignments. This index lets a reader locate an item without scrolling through its machine-readable fields.

| Item | Kind | Status | Mathematical item | Source locator |
|---|---|---|---|---|
| L01 | definition | library | Witt-vector coefficient carrier | §5.1, p47 (Witt coefficient carrier) |
| L02 | construction | library | Frobenius on the Witt fraction field | §5.1, p47 (Frobenius coefficient carrier) |
| L06 | definition | library | Connected reductive group predicate | §§2–4 (group/root prerequisites) |
| L07 | definition | library | Algebraic torus predicate | §§2–4 (group/root prerequisites) |
| L08 | definition | library | Geometric character lattice | §§2–4 (group/root prerequisites) |
| L09 | definition | library | Cocharacter lattice and pairing | §§2–4 (group/root prerequisites) |
| L10 | theorem | library | Perfect character-cocharacter pairing | §§2–4 (group/root prerequisites) |
| L11 | definition | library | Closed dominant chamber of a root pairing | §§2–4 (group/root prerequisites) |
| L12 | theorem | library | Unique dominant representative in a Weyl orbit | §§2–4 (group/root prerequisites) |
| L13 | definition | library | Abelian variety over a field | §§5,7 (display/abelian prerequisites) |
| L15 | definition | library | Divided-power structure | §§5,7 (display/abelian prerequisites) |
| L16 | theorem | library | Finite free cocharacter lattice | §§2–4 (group/root prerequisites) |
| L17 | theorem | library | Galois invariance of the pairing | §§2–4 (group/root prerequisites) |
| L18 | definition | library | Coxeter Bruhat order | §§2–4 (group/root prerequisites) |
| P01 | theorem | planned | Extended buildings and facet fixers | §2.1.1–2.1.3 |
| P02 | theorem | planned | Bruhat–Tits smooth stabilizers and connected parahorics | §2.1.1 |
| P03 | theorem | planned | Affine Weil restriction | §2.1.2; §3.3.18 |
| P04 | theorem | planned | Pinned root subgroup maps | §4.1.7–4.3.1 |
| P05 | theorem | planned | Equal-characteristic affine Grassmannian | §3.2.1; §4.1.1 |
| P06 | theorem | planned | Witt affine Grassmannian geometry | §3.1.8; §5.3.13 |
| P07 | theorem | planned | Bounded v-sheaf Grassmannian | §3.1.7; §3.4.1–3.4.2 |
| P08 | theorem | planned | Dieudonné and nilpotent deformation theory | §5.1; §7.1.3 |
| P09 | theorem | planned | Integral p-divisible group classification | §5.2.1; §7.1.5–7.1.6 |
| P10 | theorem | planned | Formal moduli and Artin approximation | §7.1.8, citing Artin69 Corollary2.6 |
| P11 | theorem | planned | Local shtuka generic-fiber moduli | §7.1.8; §7.2.24 |
| P12 | theorem | planned | Siegel and PEL good-level moduli | §7.1.2 |
| P13 | theorem | planned | Canonical generic Shimura models | §7.1.1 |
| D01 | definition | missing | Quasi-parahoric model | §2.1.1, p9 |
| D02 | definition | missing | R-smooth torus and group | §2.1.4, pp9–10 |
| T01 | theorem | missing | Weil-restricted building and fixer | §2.1.2 |
| T02 | theorem | missing | Tame fixed-point building descent | §2.1.3 |
| T03 | theorem | missing | Quasi-tame tori are R-smooth | Proposition2.1.5(1) |
| T04 | theorem | missing | R-smoothness in torus extensions | Proposition2.1.5(2) |
| T05 | theorem | missing | Derived-isomorphism closed fixer embedding | Proposition2.1.5(3) |
| T06 | theorem | missing | Tame hyperspecial realization of a generic facet fixer | Proposition2.2.2(1) |
| T07 | theorem | missing | Fixer as tame fixed points | Proposition2.2.2(2) |
| D03 | definition | missing | Periodic graded lattice chain | §2.3, pp12–13 |
| C01 | construction | missing | Total lattice of a chain | §2.3; §3.4.3 |
| T08 | theorem | missing | Chain stabilizer diagonal immersion | Lemma2.3.1 |
| T09 | theorem | missing | Tame invariant lattice chain | Lemma2.3.3 |
| T10 | theorem | missing | Invariant-chain total lattice is a direct summand | §2.3.7–2.3.8 |
| T11 | theorem | missing | Galois-stable lattice for a faithful representation | Proposition2.4.2 |
| T12 | theorem | missing | Fixed closed immersion and tame smoothness | Remark2.4.3; §2.4.5 |
| M01 | construction | missing | Local Hodge-type datum | §3.1.1–3.1.3 |
| M02 | construction | missing | Local abelian-type datum | §3.1.4 |
| M03 | construction | missing | Standard local assumptions | §3.1.5–3.1.6 |
| M04 | construction | missing | Scholze–Weinstein local-model v-sheaf | §3.1.7–3.1.8 |
| M05 | construction | missing | Integral local-model scheme | Theorem3.1.8; Theorem3.2.15 |
| M06 | construction | missing | Beilinson–Drinfeld polynomial model | §3.2.1–3.2.5 |
| M07 | construction | missing | Naive scheme-theoretic Schubert closure | §3.2.6–3.2.8 |
| M08 | theorem | missing | Normality and reduced special fiber of the naive model | Theorem3.2.9(1) |
| M09 | theorem | missing | Normal Cohen–Macaulay special-fiber components | Theorem3.2.9(2) and footnote3 |
| M10 | construction | missing | Auxiliary prime-to-p derived cover | Proposition3.2.11 |
| M11 | theorem | missing | Minuscule stable lattices differ by a centralizer | Proposition3.3.10 |
| M12 | theorem | missing | Closed fixed-model embedding | §3.3.7 |
| M13 | theorem | missing | Closed representation local-model embedding | Proposition3.3.14 |
| M14 | theorem | missing | Restriction of structure preserves the closed model embedding | Proposition3.3.20 |
| M15 | theorem | missing | Existence of good lattice embeddings after a representation power | Theorem3.3.25, general case |
| M16 | theorem | missing | Good embeddings with the original generic facet stabilizer | Theorem3.3.25, refinements |
| M17 | theorem | missing | Normalizer-of-image statement for Hodge embeddings | Theorem3.1.9 |
| M18 | theorem | missing | Normal scheme recovery from the v-sheaf closure | Proposition3.4.1 |
| M19 | theorem | missing | Auxiliary-cover construction is independent of choices | Theorem3.2.15 |
| M20 | theorem | missing | Existence of the normal integral representative | Theorems3.1.8 and3.2.15 |
| M21 | construction | missing | Good integral Hodge embedding | Definition3.4.4 |
| M22 | theorem | missing | Galois endomorphism cutout gives a good embedding | Proposition3.4.6 |
| M23 | theorem | missing | Closed comparison diagram for good lattice chains | §3.4.8 |
| I01 | theorem | missing | Full faithfulness for normal integral models | §3.4.1; §7.1.8, citing SW20 Theorem18.4.1 |
| R01 | construction | missing | Integral dominance order | §4.1.1–4.1.2 |
| R02 | construction | missing | Mod-p abelian-type coweight | Definition4.1.2 |
| R03 | construction | missing | Formal-curve span of a Zariski tangent space | Definition4.1.4 |
| R04 | theorem | missing | Reduced tangent cone contains curve directions | Remark4.1.5 |
| R05 | construction | missing | Root-curve length bound | §4.2.1 |
| R06 | construction | missing | Negative big-cell tangent decomposition | §4.1.7 |
| R07 | theorem | missing | Root curves lie in the Schubert variety | §4.2.1–4.2.2 |
| R08 | construction | missing | Positive-characteristic Weyl module | Definition4.2.6; §4.2.9 |
| R09 | construction | missing | Finkelberg–Mirković lattice-bound functor | Definition4.2.6 |
| R10 | construction | missing | Active root-weight pairs | §4.2.9 |
| R11 | construction | missing | Representation root bound | §4.2.9–4.2.10 |
| R12 | theorem | missing | FM root tangent upper bound | Lemma4.2.10 |
| R13 | theorem | missing | Dominance-detecting minuscule test set | Proposition4.2.13 |
| R14 | theorem | missing | Type A dominance test set | Proof of Theorem4.2.3, §4.2.15, pp37–39 |
| R15 | theorem | missing | Type B dominance test set | Proof of Theorem4.2.3, §4.2.15, pp37–39 |
| R16 | theorem | missing | Type C dominance test set | Proof of Theorem4.2.3, §4.2.15, pp37–39 |
| R17 | theorem | missing | Type D-real dominance test set | Proof of Theorem4.2.3, §4.2.15, pp37–39 |
| R18 | theorem | missing | Type D-quaternionic dominance test set | Proof of Theorem4.2.3, §4.2.15, pp37–39 |
| R19 | theorem | missing | All root tangent directions are root-curve directions | Theorem4.2.3 |
| R20 | theorem | missing | Geodesic minuscule-weight formula for the negative root bound | Lemma4.2.18; Corollary4.2.19 |
| R21 | construction | missing | Cartan representation bound | §4.3.3–4.3.6 |
| R22 | theorem | missing | Cartan bound vanishes off the derived torus | Lemma4.3.7 |
| R23 | theorem | missing | Cartan bound from negative simple-root lengths | Proposition4.3.9 |
| R24 | theorem | missing | Type D-quaternionic Cartan bound on an end wall | Proposition4.3.10 |
| R25 | theorem | missing | Cartan tangent directions generated by conjugated root curves | Theorem4.3.2 |
| R26 | theorem | missing | All Schubert tangent spaces are curve-spanned without D-quaternionic factors | Theorem4.1.6 |
| R27 | theorem | missing | D4 FM-versus-curve Cartan gap | Remark4.3.14 |
| R28 | theorem | missing | Restriction-of-scalars special-fiber Schubert comparison | Lemma4.4.2 |
| R29 | theorem | missing | Curve spanning at the minimal stratum of reductive local models | Theorem4.4.3(1) |
| R30 | theorem | missing | Curve spanning at all points without D-quaternionic factors | Theorem4.4.3(2) |
| F01 | construction | missing | Zink coefficient ring | §5.1.1 |
| F02 | construction | missing | Display frame | §5.1.1–5.1.2 |
| F03 | construction | missing | Normal-decomposable frame pair | §5.1.2 |
| F04 | construction | missing | Tilde functor on frame pairs | §5.1.3 |
| F05 | theorem | missing | Tilde base change for strict frame maps | §5.1.4 |
| F06 | theorem | missing | Tilde comparison with Frobenius image in the torsion-free case | §5.1.7, p49 |
| F07 | construction | missing | Relative Zink frame | §5.1.5–5.1.9 |
| F08 | theorem | missing | Relative pair factorization | §5.1.9; Hoff Lemma1.21 |
| F09 | construction | missing | Display via the tilde isomorphism | §5.1.19 and its KP18 display equivalence |
| F10 | construction | missing | Canonical first-order comparison c | Lemma5.1.15; Remark5.1.17; formula(5.1.18) |
| F11 | theorem | missing | Universal display from a constant first-order matrix | §5.1.19; Hoff Theorem1.28 |
| F12 | construction | missing | Integral stabilizer tensors | §5.2.1 |
| F13 | construction | missing | Universal local-model pair and tilde tensors | §5.2.1–5.2.2 |
| F14 | theorem | missing | Integral tilde tensors and trivial tensor torsor | §5.2.1–5.2.2 |
| F15 | construction | missing | Very-good integral Hodge embedding at a point | Definition5.2.5 |
| F16 | theorem | missing | Horizontality is independent of defining tensors | Proposition5.2.3 |
| F17 | theorem | missing | Unramified base change detects very-goodness | Lemma5.2.7 |
| F18 | theorem | missing | Endomorphism tensors are horizontal | Proposition5.3.2 |
| F19 | theorem | missing | Endomorphism-defined embeddings are very good | Corollary5.3.3 |
| F20 | theorem | missing | Intersection with endomorphism stabilizers preserves very-goodness | Corollary5.3.4 |
| F21 | theorem | missing | Direct summand descent of very-goodness | Proposition5.3.7(a) |
| F22 | theorem | missing | Sums of isomorphic representations preserve very-goodness | Proposition5.3.7(b); Remark5.3.8 |
| F23 | theorem | missing | Products of very-good embeddings | Proposition5.3.9 |
| F24 | construction | missing | Power-series and dual-number comparison frames | §5.3.12–5.3.15 |
| F25 | theorem | missing | Power-series tensors are integral | Lemma5.3.13 |
| F26 | theorem | missing | Curvewise canonical comparison preserves tensors | §5.3.14–5.3.15 |
| F27 | theorem | missing | Curve-spanned tangent criterion for very-goodness | Theorem5.3.11 |
| F28 | theorem | missing | Smooth points are very good | Corollary5.3.16 |
| F29 | theorem | missing | Arithmetic-curve tangent criterion | Proposition5.3.18 |
| F30 | theorem | missing | Very-goodness for the closure of the generic neutral group | Proposition5.3.20 |
| F31 | theorem | missing | Relative display deformation equivalence | §5.1, underlying Hoff Theorem1.23 |
| F32 | theorem | missing | Contravariant display classification of p-divisible groups | §5.1 and§7.1.3; Hoff Theorem1.29 and Remark1.30 |
| V01 | construction | missing | Non-exceptional local datum | §6.1; condition(NE) |
| V02 | theorem | missing | Compatibility of maximal tame extensions | Lemma6.1.2 |
| V03 | theorem | missing | Very-good lattice chains in the non-exceptional case | Theorem6.1.1 |
| V04 | construction | missing | Trace polarization on the induced representation | §6.1.9 |
| V05 | theorem | missing | Very-goodness of the chosen representation-plus-dual sum | §6.1.9 |
| V06 | construction | missing | Even orthogonal similitude neutral group | §6.2.1–6.2.2 |
| V07 | construction | missing | Orthogonal PEL tensor realization | §6.2.1–6.2.3 |
| V08 | construction | missing | Quaternionic PEL tensor realization | §6.2.2–6.2.3 |
| V09 | theorem | missing | Very-good self-dual chains for D-quaternionic PEL representations | Proposition6.2.3 |
| V10 | construction | missing | Central enlargement balancing Hodge weights | §6.2.8 |
| V11 | theorem | missing | Very-goodness for sums of the chosen enlarged D-quaternionic representation | Proposition6.2.10 |
| V12 | construction | missing | Division-algebra standard representation and integral chain | §6.3.1 |
| V13 | theorem | missing | Very-good division-algebra embeddings with p-divisible index | Proposition6.3.2 |
| V14 | construction | missing | Paired division-algebra symplectic representation | §6.3.4 |
| V15 | theorem | missing | Self-dual very-good chains for the exceptional A cover | Proposition6.3.5 |
| S01 | construction | missing | Hodge integral model by normalization | §7.1.1–7.1.2 |
| S02 | construction | missing | Adapted p-divisible deformation | §7.1.4–7.1.6 |
| S03 | theorem | missing | Integral local-model deformation identification | Theorem7.1.3, deformation input |
| S04 | theorem | missing | DVR extension property for the Hodge pro-level model | Theorem7.1.3(1) |
| S05 | construction | missing | Hodge local-model torsor diagram | Theorem7.1.3(2) |
| S06 | theorem | missing | Ordinary henselization comparison at connected parahoric level | Theorem7.1.3(3) |
| S07 | theorem | missing | Adapted deformation criterion for integral points | Proposition7.1.6 |
| I02 | construction | missing | Canonical integral parahoric shtuka model | §7.1.8 and§7.2.24 |
| I03 | theorem | missing | Canonical Hodge models for quasi-parahoric levels | §7.1.8; DvHKZ Theorem4.2.3 |
| I04 | theorem | missing | Integral local-shtuka completion comparison | §7.1.8, citing PR26 Theorem2.5.5 |
| S08 | theorem | missing | Canonical identification of Hodge integral models | Proof of Theorem7.1.8 |
| S09 | theorem | missing | Strict henselization comparison under weaker Hodge hypotheses | Theorem7.1.8 |
| S10 | construction | missing | Global center local-to-global condition | §7.1.10 |
| S11 | theorem | missing | Connected-parahoric normalization is finite étale | Proposition7.1.11(1) |
| S12 | construction | missing | Adjoint local-model structure group | Proposition7.1.14 |
| S13 | theorem | missing | Abelian-type descent extension property | Proposition7.1.14(1) |
| S14 | construction | missing | Derived cover H-sharp of an abelian-type adjoint datum | §7.2.1–7.2.4 |
| S15 | construction | missing | Deligne vertex and CM scalar data | §7.2.4–7.2.7 |
| S16 | construction | missing | Compact-center subgroup of a Hodge group | §7.2.6–7.2.8 |
| S17 | theorem | missing | Global trace-polarization construction | §7.2.8 |
| S18 | theorem | missing | Non-exceptional Hodge cover derived group | Proposition7.2.10(1) |
| S19 | theorem | missing | Non-exceptional Hodge cover: very-good self-dual lattice | Proposition7.2.10(3) |
| S20 | theorem | missing | Non-exceptional Hodge cover: center and coinvariants | Proposition7.2.10(4) |
| S21 | theorem | missing | R-smooth center implies R-smooth group in the cover construction | Lemma7.2.11 |
| S22 | construction | missing | Zarhin self-dual enlargement | Proof of Proposition7.2.10 |
| S23 | theorem | missing | Neutral group as a smooth symplectic intersection | Lemma7.2.13 |
| S24 | theorem | missing | Scalar torus gives smooth multiplier map at odd p | Lemma7.2.14 |
| S25 | theorem | missing | Exceptional Hodge covers with very-good self-dual embeddings | Proposition7.2.16 |
| S26 | construction | missing | Common-multiplier product Hodge cover | §7.2.18–7.2.19 |
| S27 | theorem | missing | Global cover fundamental group and local-to-global condition | Proposition7.2.19(1) |
| S28 | theorem | missing | Global cover reflex-field splitting | Proposition7.2.19(2) |
| S29 | theorem | missing | Global cover center and R-smoothness | Proposition7.2.19(3) |
| S30 | theorem | missing | Global cover very-good self-dual embedding | Proposition7.2.19(4) |
| S31 | theorem | missing | Conditional torsion-free inertia coinvariants | Proposition7.2.19, final assertion |
| S32 | theorem | missing | Integral models for every abelian-type datum at odd p | Theorem7.2.21, opening assertion |
| S33 | theorem | missing | Abelian-type pro-level extension property | Theorem7.2.21(1) |
| S34 | theorem | missing | Étale-local geometry of all abelian-type models | Theorem7.2.21(2) |
| S35 | construction | missing | Abelian-type adjoint local-model diagram | Theorem7.2.21(3), diagram(7.2.22) |
| S36 | theorem | missing | Elementary connected reduction in the non-exceptional case | Theorem7.2.21, final assertion |
| I05 | theorem | missing | Crystalline compatibility of the scheme-theoretic local-model diagram | DvHKZ AppendixA TheoremA3.3; used in§7.2.24 |
| I06 | theorem | missing | Component exact sequences on integral diamonds | DvHKZ Lemma4.3.4 |
| I07 | theorem | missing | Connected reduction from a compatible crystalline diagram | DvHKZ Proposition4.3.3 |
| I08 | theorem | missing | Perfect-scheme full faithfulness and étale section descent | DvHKZ proof of Proposition4.3.3 |
| I09 | theorem | missing | Generic restriction detects morphisms of the required v-sheaves | DvHKZ LemmaA3.4 |
| I10 | theorem | missing | Separatedness of the integral linear-group quotient | DvHKZ LemmaA3.5 |
| S37 | theorem | missing | Connected local-model diagram in all cases | Corollary7.2.24 |
| E01 | theorem | missing | Correct smooth action statement in the earlier proof | §7.3.1(1) |
| E02 | theorem | missing | Correct topology for the divided-power logarithm tail | §7.3.1(2) |
| E03 | construction | missing | Component gluing at conjugated parahoric levels | §7.3.1(3) |
| E04 | theorem | missing | Very-good hypothesis in the earlier display-moduli results | §7.3.2 |
| D04 | definition | missing | Quasi-tame reductive group | §3.1.5 and§3.2.3 |
| R31 | construction | missing | Root-datum minuscule weight | §4.2.12–4.2.13, p36 |
| R32 | theorem | missing | Projectivity of the FM lattice-bound scheme | §4.2.6–4.2.8 |
| F33 | theorem | missing | Very-goodness independent of the determining segment | Definition5.2.5, lattice-chain paragraph |
| S38 | theorem | missing | Siegel moduli with the prescribed parahoric lattice-chain level | §7.1.2 and Theorem7.1.8; cited Zh20§6.3 |
| S39 | theorem | missing | Unramified descent of connected components | Proposition7.1.11(2) |
| S40 | theorem | missing | Finite map of integral connected components under the derived cover | Proposition7.1.14(2) |
| S41 | theorem | missing | Adjoint local-model diagram for derived-cover descent | Proposition7.1.14(3) |
| S42 | theorem | missing | Non-exceptional Hodge cover reflex splitting | Proposition7.2.10(2) |
