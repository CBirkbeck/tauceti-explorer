# Betts–Stix (2025): Galois sections and p-adic period mappings, extraction and routing

Issue [#2175](https://github.com/CBirkbeck/tauceti-explorer/issues/2175). Status: **complete**. Implementation and proof closure are not claimed.

- **Provenance.** Written by Claude Code, session cc-442dc5, on 23 September 2026.
- **The paper.** L. A. Betts and J. Stix, *Galois sections and p-adic period mappings*, Ann. of Math. 201 (2025), 79–166, DOI 10.4007/annals.2025.201.1.2.
- **Items.** The result has **100 items: 1 library, 19 planned and 80 missing**. Every numbered statement is an item, and every missing item is routed exactly once.
- **Mistakes.** Six findings are recorded under `sourceIssues`.
  - The one reaching a stated result is Proposition 6.7(c), the principal trichotomy: as printed it is false for non-reduced A. The paper only ever applies it to étale A.

## The version read

- **arXiv v1.** 2204.13674v1 (28 April 2022, 59 pages, SHA-256 `7d4b7d49…`) is the only arXiv version, and it was read in full. Stix's hosted preprint (29 April 2022) has the same text.
- **The published text was not available.** The Annals text was revised (received 20 July 2022, revised 24 May 2024) and is not openly available: the Annals PDF links return HTML, and Unpaywall lists no open copy.
- **Consequences.** Numbering and locators are arXiv v1's. Whether the findings survive in print could not be checked (gap G-source).

## What the paper proves

**The main results.**
- **Theorem A.** Let K be a number field containing no CM subfield and Y/K a smooth projective curve of genus ≥ 2. For every finite place v, the Selmer sections, whose local restrictions all come from local points, have finite image in Y(K_v).
- **Theorem B.** Via Harari–Stix, every local projection of the finite descent locus is finite.
- These are unconditional finiteness statements, predicted by the Section Conjecture, for every curve over such K.

**The method: the Lawrence–Venkatesh argument read as an obstruction.**
- **Selmer sections give global pairs (Theorem 7.1).** Restricting the relative étale cohomology of an abelian-by-finite family X → Y′ → Y along a Selmer section gives a global symplectic pair (A_s, V_s) that interpolates the local cohomology at every place. So loc_v lands in the Lawrence–Venkatesh locus.
- **The locus is finite at every self-conjugate place (Theorem 6.5).** For a Kodaira–Parshin family with suitable q, this rests on three inputs:
  - **Model-free period maps (§§3–5).** They control D_pst of the local Galois representations with no good-reduction hypothesis (Theorem 3.3). The proof goes through Scholze's relative comparison and Shimizu's horizontal semistability rather than crystalline cohomology.
  - **Zariski density.** Full monodromy makes the period maps Zariski dense (Lemma 5.9).
  - **The symplectic principal trichotomy (Proposition 6.7).** It splits the interpolating pairs into types (a), (b) and (c): (a) and (b) are handled by dimension counts in the Lagrangian period domain, and (c) is empty for the Kodaira–Parshin family (Proposition 6.20).
- **Every finite place is covered.** With no CM subfield every finite place is self-conjugate, so Theorem A covers all v, including the places above 2, ramified places and places of bad reduction that [LV20] cannot reach.

## What the atlas has

**Where the pieces live.**
- **AnabelianGeometryAndNonabelianChabauty.** It owns Galois sections (NC.0) and the Chabauty–Kim tower, but no Lawrence–Venkatesh obstruction and no Selmer sections.
- **MordellLawrenceVenkatesh, a proposed draft roadmap.** It plans the original argument:
  - the semisimple Faltings lemma and friendly places (LV.1);
  - abelian-by-finite families with good models (LV.2);
  - period maps on residue disks centred at K-points (LV.3);
  - the crystalline bridge (LV.4) and the size_v criterion (LV.7);
  - Kodaira–Parshin families and their monodromy (LV.8–LV.10).
- **PadicHodgeTheory.** It plans D_pst, filtered (φ, N)-modules and Berger's theorem (R06.2, R06.3), and the relative period sheaves with the proper-smooth comparison (P8).
- **CohomologyComparisons CP.6.** It plans Chern-class compatibility.
- **HeightsRationalPointsAndObstructions RP.3.** It plans finite descent.

**The libraries.** They contain none of this apart from Dirichlet's theorem.

## Routes

The maintainer routed the paper to a new Part II of the anabelian roadmap, GaloisSectionsPadicPeriodMaps (DESIGN-BETTS-STIX), which imports the Lawrence–Venkatesh period maps rather than planning them again. The routes follow that:
- **Part II.** The paper's new mathematics goes there, with its brief.
- **Sources for the Lawrence–Venkatesh roadmap.** Four source routes give its layers LV.1, LV.2, LV.3 and LV.7 the sharper or more general statements this paper proves.
- **p-adic Hodge theory and comparisons.** The relative p-adic Hodge theory goes to PadicHodgeTheory P8 and the Chern-class compatibility to CohomologyComparisons CP.6, where that infrastructure is already owned.

### Route 1: Part II — Anabelian geometry and nonabelian Chabauty, Part II: Galois sections and p-adic period mappings (GaloisSectionsPadicPeriodMaps, area arithmeticgeometry)

The maintainer routed the paper to a new Part II, GaloisSectionsPadicPeriodMaps (DESIGN-BETTS-STIX), of the anabelian roadmap. Its new mathematics is the obstruction-theoretic reading of Lawrence–Venkatesh applied to Selmer sections. The Lawrence–Venkatesh method is extended to every self-conjugate place: no good reduction is needed, which requires (ϕ, N, G_v)-modules and relative p-adic Hodge theory in place of crystalline cohomology. The route also covers the symplectic principal trichotomy. NC.0–NC.6 do not go there, and the Lawrence–Venkatesh roadmap plans only the good-reduction, friendly-place argument for K-points.

**Brief for the design job.** Design GaloisSectionsPadicPeriodMaps, the Part II of Anabelian geometry and nonabelian Chabauty (AnabelianGeometryAndNonabelianChabauty) following Betts and Stix. Final theorems, exactly as the paper states them: Theorem A — for a number field K with no CM subfield and a smooth projective curve Y/K of genus ≥ 2, the image of loc_v: Sec^Sel(Y/K) → Y(K_v) is finite for every finite place v; Theorem B — the projection of the finite descent locus Y(A_K)_•^{f-cov} to Y(K_v) is finite; Theorem 6.5 — for self-conjugate v some abelian-by-finite family has finite Lawrence–Venkatesh locus Y(K_v)^LV_{X,S}; Theorem 7.1 — Selmer sections localise into Y(K_v)^LV_X. Cover: Selmer sections and the attached symplectic pairs (A_s, V_s) (§7); symplectic pairs, S-good pairs and the adelic, local and period-domain Lawrence–Venkatesh loci (§§1, 4, 6); self-conjugate places and the average Hodge–Tate weight (Proposition 2.19, Corollary 2.21); filtered discrete (ϕ, N, G_v)-modules with restriction, induction and automorphism groups (Lemma 2.15, Proposition 2.16, proved with Frobenius as well as G_v); the model-free control of D_pst by period maps (Theorems 3.3, 3.22, Proposition 3.5, Proposition 4.11); the principal trichotomy with #Σ_A in (c); the finiteness of types (a) and (b) and the emptiness of type (c) for Kodaira–Parshin families (Propositions 6.9, 6.15, 6.20). Import rather than re-plan: from The Mordell conjecture after Lawrence and Venkatesh (MordellLawrenceVenkatesh) the Faltings lemmas (LV.1), abelian-by-finite families and their cohomology (LV.2), Lagrangian period domains, period maps and the complex–v-adic comparison extended to K_v-points (LV.3), the Lagrangian general-position lemma (LV.7), and Kodaira–Parshin families with full monodromy (LV.8–LV.10); from p-adic Hodge theory (PadicHodgeTheory) D_pst, filtered (ϕ, N)-modules and Berger's theorem (R06.2, R06.3) and Scholze's relative comparison with Shimizu's horizontal semistability (P8); from Cohomology comparisons (CohomologyComparisons) the Chern-class compatibility (CP.6); from Anabelian geometry and nonabelian Chabauty the Galois sections of NC.0; from Heights, rational points and obstructions (HeightsRationalPointsAndObstructions) the finite descent locus (RP.3) together with the Harari–Stix theorem; purity from Deligne's weights (DeligneWeightsAndPurity DWP.4). Keep the Section Conjecture a conjecture and Theorem A's no-CM hypothesis visible.

**Missing items taken (48).** Selmer sections and the localisation maps (/2); Theorem A (/3); Harari–Stix: finite descent and Selmer sections (cited) (/5); Theorem B (/6); The Lawrence–Venkatesh argument as an obstruction (Remark 1.3) (/7); The non-symplectic locus (Remark 1.4) (/8); Local systems constrain Selmer sections (Remark 1.5) (/9); Restriction and induction of filtered (ϕ, N, G_v)-modules (/19); Automorphism groups of (ϕ, N, G_v)-modules and the modules M(Φ) (/20); Lemma 2.15: the orbit lemma (/21); Proposition 2.16: dimension bounds (/22); Self-conjugate places (/23); Proposition 2.19: Hodge–Tate weights of pure characters (/24); Remark 2.20: pure characters at self-conjugate places (/25); Corollary 2.21: average Hodge–Tate weight (/26); Theorem 3.3: period maps control D_pst (/31); Proposition 3.5: period maps and local Galois representations (/32); Theorem 3.22: horizontal de Rham local systems (/46); Lemma 3.23: reduction to spherical polyannuli (/47); Symplectic modules and symplectic pairs (/54); The symplectic pair of p-adic Hodge cohomology (/56); The symplectic pairs M^{≤1}(Φ) (/60); Proposition 4.11 (/61); Decomposition of the period domain (Lemma 4.12) (/62); The adelic Lawrence–Venkatesh locus (/71); S-good pairs and the Lawrence–Venkatesh locus (/72); The Lawrence–Venkatesh locus in the period domain (/73); Lemma 6.4 (/74); Theorem 6.5 (/75); Mordell from Theorem 6.5 (/76); Remark 6.6: the algebra of a fibre (/77); Proposition 6.7: the principal trichotomy (corrected) (/78); Types (a), (b), (c) and their loci (/79); Proposition 6.9 (/80); Corollary 6.10 (/81); The sets T_i and their finiteness (Lemma 6.12) (/82); Lemma 6.13 (/83); Proposition 6.15 (/84); Corollary 6.16 (/85); Lemma 6.17 (/86); Proposition 6.20 (/89); Remark 6.21 (/90); Corollary 6.22 (/91); Remark 6.23: which (v, q) work (/93); The relative symplectic pair R^{≤1}π_ét*Q_p (/94); Representations attached to a section (/95); Proposition 7.2 (/96); Theorem 7.1 (/97).

### Route 2: source of MordellLawrenceVenkatesh:LV.1

The symplectic form of Faltings's lemma ([LV20, Lemma 2.6]) and GSp-irreducibility belong beside the semisimple Faltings lemma that LV.1 already plans; this paper uses them in place of LV Lemma 2.3.

**Missing items taken (2).** Symplectic representations and GSp-irreducibility (/12); Lemma 2.4: symplectic Faltings lemma (cited) (/13).

### Route 3: source of MordellLawrenceVenkatesh:LV.2

LV.2 plans abelian-by-finite families with their de Rham bundle, Lagrangian F¹ and Gauss–Manin connection. This paper supplies the étale and de Rham symplectic module structures with perfect polarisation pairings (Lemmas 4.2, 4.6), relative de Rham Chern classes (Lemma 4.7) and transport compatible with them (Lemma 4.8).

**Missing items taken (5).** Étale cohomology of a fibre and the polarisation pairing (/52); Lemma 4.2 (/53); De Rham side: Lemma 4.6 (/55); Lemma 4.7: relative de Rham Chern classes (/57); Lemma 4.8 and Remark 4.9 (/58).

**Planned items the paper is a good source for (1).** Abelian-by-finite families (/51).

### Route 4: source of MordellLawrenceVenkatesh:LV.3

LV.3 plans period maps on residue disks centred at K-points and the transfer of Zariski density from the complex side. This paper redoes it around K_v-rational centres without a model: parallel transport on rigid neighbourhoods, the analytified flag variety, Proposition 5.3 with its lemmas, Lemma 5.9 and Corollary 5.10. As the paper's footnote 1 notes, the K_v-centred version is needed even for [LV20]'s own argument.

**Missing items taken (7).** Parallel transport on rigid neighbourhoods (/27); Proposition 3.2: the analytified flag variety (/29); Lemma 5.1 (/64); Proposition 5.3: v-adic and complex Zariski closures agree (/66); Lemmas 5.4–5.6 and Remark 5.7: the formal germ (/67); Lemma 5.9 (/69); Corollary 5.10 and Remark 5.11 (/70).

**Planned items the paper is a good source for (5).** The v-adic period map (/28); The Lagrangian period domain (/59); Complex period maps (/63); Lemma 5.2 (/65); Full monodromy (/68).

### Route 5: source of MordellLawrenceVenkatesh:LV.7

Sublemma 6.18 is the isotropic, r ≥ 4 version of the general-position lemma LV Lemma 6.4 that LV.7 plans for r ≥ 5.

**Missing items taken (1).** Sublemma 6.18 (/87).

### Route 6: source of PadicHodgeTheory:P8

P8 owns the relative period sheaves on the pro-étale site and the proper-smooth comparison with connection and tensor compatibility. The paper's relative p-adic Hodge theory belongs there, not in a Diophantine roadmap: de Rham pairs and their full faithfulness, pullback and pushforward, completion, cup-product and base-change compatibilities, and algebraic versus analytic pushforwards. So do the resulting comparison isomorphism c_dR, Shimizu's horizontal semistable period ring with its specialisation lemmas, and the filtered-derived-category lemmas. Theorem 3.12 itself is planned there.

**Missing items taken (16).** Local systems, filtered bundles and OB_dR-bundles (Definition 3.6) (/34); Proposition 3.7: full faithfulness (/35); De Rham pairs (/36); Derived pushforward of de Rham pairs (/37); Lemma 3.14: completion is harmless (/39); Proposition 3.16: cup products (/40); Proposition 3.17: base change (/41); Proposition 3.18: algebraic versus analytic pushforwards (/42); The comparison isomorphism c_dR (/43); Proposition 3.19: formal compatibilities of c_dR (/44); Shimizu's horizontal semistable periods (/48); Lemma 3.25 and Corollary 3.26 (/49); Lemma 3.27: local systems as G_{R_v}-representations (/50); Filtered derived categories (/98); Lemma A.2 (Deligne) (/99); Lemma A.3 (/100).

### Route 7: source of CohomologyComparisons:CP.6

CP.6 plans the compatibility of comparison maps with traces, cup products and first Chern classes. Proposition 3.20 proves these for Scholze's c_dR, which the paper needs for the polarisation pairings.

**Missing items taken (1).** Proposition 3.20: duality, cycle and Chern classes (/45).

## Prerequisite papers the atlas does not cover

- K. Shimizu, A p-adic monodromy theorem for de Rham local systems, Compositio Math. 158 (2022), 2157–2205 (https://doi.org/10.1112/s0010437x2200776x). [Shi20]: full bases of horizontal sections (Theorem 9.7), horizontal semistable periods and potentially horizontal semistable local systems (Definitions 4.7, 4.15, Lemmas 4.4, 8.9, Proposition 4.9), behind Theorem 3.22.
- D. Harari and J. Stix, Descent obstruction and fundamental exact sequence, in The Arithmetic of Fundamental Groups (PIA 2010), Springer 2012, 147–166 (https://doi.org/10.1007/978-3-642-23905-2_7). [HS12, Theorem 11]: the finite descent locus is the image of the Selmer sections (Theorem B).
- M. Stoll, Finite descent obstructions and rational points on curves, Algebra & Number Theory 1 (2007), 349–391 (https://doi.org/10.2140/ant.2007.1.349). Modified adelic points and the finite descent locus.
- L. A. Betts, Local constancy of pro-unipotent Kummer maps, Proc. LMS 127 (2023), 836–888 (https://doi.org/10.1112/plms.12554). [Bet22, Theorem 6.1, Lemma 6.4]: the same horizontal constancy result and the Galois-category argument of Lemma 3.27.
- N. Katz and T. Oda, On the differentiation of de Rham cohomology classes with respect to parameters, J. Math. Kyoto Univ. 8 (1968) (https://doi.org/10.1215/kjm/1250524135). Relative de Rham cohomology and the Gauß–Manin connection as a connecting map (§§3.1, 3.2.2).
- H. Diao, K.-W. Lan, R. Liu and X. Zhu, Logarithmic adic spaces: some foundational results (2019) (arXiv:1912.09836). [DLLZ19, Corollary 6.3.5]: R^iπ_*𝔼 is a local system for π smooth proper.

## Mistakes found (`sourceIssues`)

The findings are in arXiv v1; the published text could not be compared (G-source). Where each was searched for an existing correction is recorded in the result.

- **E1** (error; affects a stated result), arXiv v1 Proposition 6.7(c) and its proof, pp.46–47; Proposition 1.8(c), p.6.
  - *Printed:* c) the number of ψ ∈ Σ satisfying [G_v : G_{w_ψ}] < 4 is ≥ (1/(d+1)) dim_{Q_p}(A). … So A would also satisfy (c) because #Σ ≤ dim_{Q_p}(A).
  - *Correction:* Replace dim_{Q_p}(A) by #Σ_A in (c), or assume A reduced (hence étale over Q_p), where #Σ_A = dim_{Q_p}(A). This is what the proof shows, and every application has A ≅ H^0_ét(X_{y_v,K̄_v}, Q_p), which is étale.
  - *Why:* The reduction step needs #Σ ≥ dim A, the opposite of what it cites. A counterexample to (c) as printed: K = Q (every place self-conjugate), E/Q an elliptic curve, A = Q_p[ε]/(ε³) with trivial Galois action, V = A ⊗_{Q_p} H^1_ét(E_Q̄, Q_p), L = A(−1), and ω the A-linear extension of the Weil pairing. This is a symplectic pair with V of rank 2 (d = 1), de Rham with Hodge–Tate weights {0, 1} and pure of weight 1 outside a finite set. Σ_A has one point, fixed by G_v, so (a) and (b) fail, and (c) asks 1 ≥ 3/2. The pair is also S-good, so Proposition 1.8 fails in the same way.
- **E2** (gap; affects the proof), arXiv v1 proof of Proposition 2.16(1), p.12.
  - *Printed:* Since each ψ_i commutes with the action of G_v on D, we thus have Σ_i σ(αλ_i)ψ_i = 0 for all α ∈ Q_p^nr and all σ ∈ G_v. Taking a suitable linear combination of this identity then shows that Σ_i tr_{Q_p^nr/Q_p}(αλ_i)ψ_i = 0
  - *Correction:* Use also that the ψ_i commute with ϕ, which is semilinear for the Frobenius of Q_p^nr: conjugating by ϕ gives Σ Frob(λ_i)ψ_i = 0. The group generated by Frobenius and the image of G_v is dense in Gal(Q_p^nr/Q_p), so averaging gives the trace to Q_p, and the injectivity of Q_p^nr ⊗ End(D) → End_{Q_p^nr}(D) follows.
  - *Why:* G_v acts on Q_p^nr only through Gal(Q_p^nr/K_{v,0}), so G_v alone only yields traces to K_{v,0}. With G_v alone the step is false: for K_v = Q_{p²} and D = Q_p^nr with its natural G_v-action, the G_v-equivariant Q_p^nr-linear endomorphisms are Q_{p²}, and Q_p^nr ⊗_{Q_p} Q_{p²} → Q_p^nr is not injective. With ϕ they are Q_p.
- **E3** (gap; affects the proof), arXiv v1 proof of Proposition 3.20(8), p.28 (and footnote 18, p.35).
  - *Printed:* But in this case the projection V → X from the total space of V induces an isomorphism on étale and de Rham cohomology, and the first Chern class of V is none other than the cycle class of the zero section in V. So we are done by (2) and (7).
  - *Correction:* Stay among smooth proper varieties. A line bundle on the smooth variety X is O(D_1 − D_2) with D_1, D_2 effective divisors, and in each theory c_1(O(D)) = cl(D_1) − cl(D_2); then (8) follows from (7). Alternatively use the projective completion P(V ⊕ O).
  - *Why:* The comparison isomorphism (3.8) and properties (2) and (7) are constructed and proved only for smooth proper varieties (§3.4, Proposition 3.19). The total space of a line bundle is not proper, so (2) and (7) cannot be applied to it. The conclusion is used in §4.1.3 to match c^ét_1(λ) with c^dR_1(λ).
- **E4** (misprint; affects nothing), arXiv v1 Lemma 4.12, p.38.
  - *Printed:* factorising as the product ∏_i Φ′_i of Lagrangian L_{w_i}-subspaces Φ′_i of H^1_dR(X_{y′_0}/L_{w_i})
  - *Correction:* … of H^1_dR(X_{y′_i}/L_{w_i}).
  - *Why:* The factors are indexed by the closed points y′_i of Y′_{y_0}, as in the paragraph before the lemma and in (4.3).
- **E5** (misprint; affects nothing), arXiv v1 §6.3, definition of H_{y_0}(K_v)^LV_{X,(b)} and (∗) in the proof of Proposition 6.15, pp.49, 51.
  - *Printed:* M^1(Φ) ≅ (D_pH(A), D_pH(V))
  - *Correction:* M^{≤1}(Φ) ≅ (D_pH(A), D_pH(V)), an isomorphism of symplectic pairs as in Proposition 6.9.
  - *Why:* The right side is a pair (algebra, module), and the proof then uses the algebra part to identify ψ with a point of Y′_{y_0}, as for type (a).
- **E6** (gap; affects nothing), arXiv v1 Remark 6.23(I), p.54.
  - *Printed:* choose an auxiliary prime number r_0 ≥ 100 strictly greater than all odd prime divisors of [K′ : Q], and let q be the least prime number congruent to 3 modulo 4 and congruent to 2 modulo all odd primes less than r_0. Then … K′ is linearly disjoint from Q(ζ_{q−1})
  - *Correction:* Also take r_0 larger than every prime ramified in K′. Then K′ ∩ Q(ζ_{q−1}) is unramified everywhere, since Q(ζ_{q−1}) = Q(ζ_{(q−1)/2}) is ramified only at primes ≥ r_0, so it is Q.
  - *Why:* K′ ∩ Q(ζ_{q−1}) can be Q(√±r) for a prime r ≥ r_0 dividing q − 1, if [K′ : Q] is even and r ramifies in K′. The stated choice of r_0 does not exclude this.

## Gaps

- **G-source** (unavailable). The published Annals text (revised May 2024) could not be read. Locators and findings are for arXiv v1 and Stix's identical preprint; the review, or a later reader with access, should compare the published numbering and check whether E1–E6 persist.
- **G-inputs** (deferred). Cited theorems — [LV20] Lemmas 2.3, 2.6, §§7–8, [Sch13] Theorems 7.6, 8.8, 9.1, 9.3, [Shi20], [HS12, Theorem 11], [Fon94b], [Ber02], [KO68], [Del74] — were read only as the paper states them. Suppliers named in the routes; prerequisites list the ones the atlas lacks.

## Validation

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-BETTS-STIX-25.result.json`: ok.
- `python3 research/blueprint/intake.py check-files research/blueprint/papers/PAPER-BETTS-STIX-25.result.json research/blueprint/papers/PAPER-BETTS-STIX-25.md`: ok.
- **Library checks.** Mathlib 082e2d3 and Tau Ceti f790474 were searched (git grep) for Galois sections, Selmer, period maps, Lagrangian Grassmannians, (φ, N)-modules, B_dR, pro-étale, Hodge–Tate, Faltings, Kodaira–Parshin, Grassmannian and Dirichlet. Only Dirichlet's theorem applies directly. Near misses: Tau Ceti's IsLagrangian is for real symplectic spaces and finite bilinear modules; Mathlib's pro-étale site is the scheme-theoretic one; Mathlib's Grassmannian is a module-theoretic functor, not a Lagrangian period domain. The library audit lists NC.0–NC.6 as not built, and nothing covers relative p-adic Hodge theory.
- **Checked by cc-442dc5.**
  - The counting in Propositions 6.7 and 6.20 and Lemma 6.13, and the Sublemma 6.18 construction.
  - Remark 1.4 and Remark 6.23(III) (q = 23 against q = 11, relative dimensions 55 and 25).
  - The counterexample in E1.

## Item index

| Item | Kind | Name | Locator | Status | Layers or declarations |
|---|---|---|---|---|---|
| /1 | definition | Galois sections of a curve | arXiv v1 §1, (1.1), p.1 | planned | AnabelianGeometryAndNonabelianChabauty:NC.0, InverseGaloisAndArithmeticFundamentalGroups:IG.1 |
| /2 | definition | Selmer sections and the localisation maps | arXiv v1 Definition 1.1, p.1 | missing | routed: part-ii GaloisSectionsPadicPeriodMaps |
| /3 | theorem | Theorem A | arXiv v1 Theorem A, p.1 | missing | routed: part-ii GaloisSectionsPadicPeriodMaps |
| /4 | definition | Modified adelic points and the finite descent locus | arXiv v1 §1, p.2 | planned | HeightsRationalPointsAndObstructions:RP.3 |
| /5 | theorem | Harari–Stix: finite descent and Selmer sections (cited) | arXiv v1 §1, p.2 | missing | routed: part-ii GaloisSectionsPadicPeriodMaps |
| /6 | theorem | Theorem B | arXiv v1 Theorem B, p.2 | missing | routed: part-ii GaloisSectionsPadicPeriodMaps |
| /7 | theorem | The Lawrence–Venkatesh argument as an obstruction (Remark 1.3) | arXiv v1 Remark 1.3 and footnote 1, p.3 | missing | routed: part-ii GaloisSectionsPadicPeriodMaps |
| /8 | definition | The non-symplectic locus (Remark 1.4) | arXiv v1 Remark 1.4, p.3 | missing | routed: part-ii GaloisSectionsPadicPeriodMaps |
| /9 | theorem | Local systems constrain Selmer sections (Remark 1.5) | arXiv v1 Remark 1.5, pp.3–4 | missing | routed: part-ii GaloisSectionsPadicPeriodMaps |
| /10 | definition | Purity and integrality | arXiv v1 Definition 2.1, p.7 | planned | MordellLawrenceVenkatesh:LV.1, WeightsInEtaleCohomology:R34.1 |
| /11 | theorem | Example 2.2: étale cohomology is pure outside S | arXiv v1 Example 2.2, p.7 | planned | DeligneWeightsAndPurity:DWP.4, MordellLawrenceVenkatesh:LV.1 |
| /12 | definition | Symplectic representations and GSp-irreducibility | arXiv v1 §2.1, Definition 2.3, p.7 | missing | routed: MordellLawrenceVenkatesh:LV.1 |
| /13 | theorem | Lemma 2.4: symplectic Faltings lemma (cited) | arXiv v1 Lemma 2.4, Remark 2.5, pp.7–8 | missing | routed: MordellLawrenceVenkatesh:LV.1 |
| /14 | definition | De Rham representations | arXiv v1 §2.2.1, p.8 | planned | PadicHodgeTheory:R06.2 |
| /15 | definition | Filtered discrete (ϕ, N, G_v)-modules | arXiv v1 Definitions 2.6–2.7, pp.8–9 | planned | PadicHodgeTheory:R06.2 |
| /16 | definition | D_pst and D_pH | arXiv v1 §2.2.2, Example 2.8, p.9 | planned | PadicHodgeTheory:R06.2, PadicHodgeTheory:R06.3 |
| /17 | theorem | Theorem 2.9 (Fontaine, Berger) | arXiv v1 Theorem 2.9, p.9 | planned | PadicHodgeTheory:R06.2, PadicHodgeTheory:R06.3 |
| /18 | definition | p-adic Hodge cohomology | arXiv v1 Example 2.10, Remark 2.11, pp.9–10 | planned | PadicHodgeTheory:R06.5 |
| /19 | construction | Restriction and induction of filtered (ϕ, N, G_v)-modules | arXiv v1 §2.2.3, Example 2.12, pp.10–11 | missing | routed: part-ii GaloisSectionsPadicPeriodMaps |
| /20 | definition | Automorphism groups of (ϕ, N, G_v)-modules and the modules M(Φ) | arXiv v1 Definition 2.13, Remark 2.14, p.11 | missing | routed: part-ii GaloisSectionsPadicPeriodMaps |
| /21 | theorem | Lemma 2.15: the orbit lemma | arXiv v1 Lemma 2.15, p.12 | missing | routed: part-ii GaloisSectionsPadicPeriodMaps |
| /22 | theorem | Proposition 2.16: dimension bounds | arXiv v1 Proposition 2.16, p.12 | missing | routed: part-ii GaloisSectionsPadicPeriodMaps |
| /23 | definition | Self-conjugate places | arXiv v1 Definition 2.17, Remark 2.18, p.13 | missing | routed: part-ii GaloisSectionsPadicPeriodMaps |
| /24 | theorem | Proposition 2.19: Hodge–Tate weights of pure characters | arXiv v1 Proposition 2.19, pp.13–14 | missing | routed: part-ii GaloisSectionsPadicPeriodMaps |
| /25 | theorem | Remark 2.20: pure characters at self-conjugate places | arXiv v1 Remark 2.20, p.14 | missing | routed: part-ii GaloisSectionsPadicPeriodMaps |
| /26 | theorem | Corollary 2.21: average Hodge–Tate weight | arXiv v1 Corollary 2.21, pp.14–15 | missing | routed: part-ii GaloisSectionsPadicPeriodMaps |
| /27 | construction | Parallel transport on rigid neighbourhoods | arXiv v1 §3.1, p.15 | missing | routed: MordellLawrenceVenkatesh:LV.3 |
| /28 | definition | The v-adic period map | arXiv v1 Definition 3.1, pp.15–16 | planned | MordellLawrenceVenkatesh:LV.3 |
| /29 | theorem | Proposition 3.2: the analytified flag variety | arXiv v1 Proposition 3.2, p.16 | missing | routed: MordellLawrenceVenkatesh:LV.3 |
| /30 | definition | Relative de Rham cohomology and Gauss–Manin | arXiv v1 §3.1, p.16 | planned | AbelianSchemesAndArithmeticModuli:A4, MordellLawrenceVenkatesh:LV.2 |
| /31 | theorem | Theorem 3.3: period maps control D_pst | arXiv v1 Theorem 3.3, pp.16–17, proved in §3.5 | missing | routed: part-ii GaloisSectionsPadicPeriodMaps |
| /32 | theorem | Proposition 3.5: period maps and local Galois representations | arXiv v1 Proposition 3.5, p.17 | missing | routed: part-ii GaloisSectionsPadicPeriodMaps |
| /33 | definition | The pro-étale site and its period sheaves | arXiv v1 §3.2, p.18 | planned | PadicHodgeTheory:P8 |
| /34 | definition | Local systems, filtered bundles and OB_dR-bundles (Definition 3.6) | arXiv v1 Definition 3.6, (3.1), footnote 12, pp.18–19 | missing | routed: PadicHodgeTheory:P8 |
| /35 | theorem | Proposition 3.7: full faithfulness | arXiv v1 Proposition 3.7, Remark 3.8, pp.19–20 | missing | routed: PadicHodgeTheory:P8 |
| /36 | definition | De Rham pairs | arXiv v1 Definition 3.9, Remark 3.10, Proposition 3.11, p.20 | missing | routed: PadicHodgeTheory:P8 |
| /37 | construction | Derived pushforward of de Rham pairs | arXiv v1 §3.2.2, footnote 15, pp.20–22 | missing | routed: PadicHodgeTheory:P8 |
| /38 | theorem | Theorem 3.12: Scholze's relative comparison | arXiv v1 Theorem 3.12, Remark 3.13, p.22 | planned | PadicHodgeTheory:P8 |
| /39 | theorem | Lemma 3.14: completion is harmless | arXiv v1 Lemma 3.14, Remark 3.15, pp.22–23 | missing | routed: PadicHodgeTheory:P8 |
| /40 | theorem | Proposition 3.16: cup products | arXiv v1 Proposition 3.16, pp.23–24 | missing | routed: PadicHodgeTheory:P8 |
| /41 | theorem | Proposition 3.17: base change | arXiv v1 Proposition 3.17, pp.24–25 | missing | routed: PadicHodgeTheory:P8 |
| /42 | theorem | Proposition 3.18: algebraic versus analytic pushforwards | arXiv v1 §3.3, Proposition 3.18, pp.25–26 | missing | routed: PadicHodgeTheory:P8 |
| /43 | construction | The comparison isomorphism c_dR | arXiv v1 Remark 3.4, §3.4, (3.8), pp.17, 26 | missing | routed: PadicHodgeTheory:P8 |
| /44 | theorem | Proposition 3.19: formal compatibilities of c_dR | arXiv v1 Proposition 3.19, p.27 | missing | routed: PadicHodgeTheory:P8 |
| /45 | theorem | Proposition 3.20: duality, cycle and Chern classes | arXiv v1 Proposition 3.20, Remark 3.21, pp.27–28 | missing | routed: CohomologyComparisons:CP.6 |
| /46 | theorem | Theorem 3.22: horizontal de Rham local systems | arXiv v1 Theorem 3.22, pp.28–29, proof pp.31–32 | missing | routed: part-ii GaloisSectionsPadicPeriodMaps |
| /47 | theorem | Lemma 3.23: reduction to spherical polyannuli | arXiv v1 Lemma 3.23, p.29 | missing | routed: part-ii GaloisSectionsPadicPeriodMaps |
| /48 | definition | Shimizu's horizontal semistable periods | arXiv v1 §3.5, Definition 3.24, p.30 | missing | routed: PadicHodgeTheory:P8 |
| /49 | theorem | Lemma 3.25 and Corollary 3.26 | arXiv v1 Lemma 3.25, Corollary 3.26, p.30 | missing | routed: PadicHodgeTheory:P8 |
| /50 | theorem | Lemma 3.27: local systems as G_{R_v}-representations | arXiv v1 Lemma 3.27, Remarks 3.28–3.29, p.31 | missing | routed: PadicHodgeTheory:P8 |
| /51 | definition | Abelian-by-finite families | arXiv v1 Definition 4.1, p.32 | planned | MordellLawrenceVenkatesh:LV.2 |
| /52 | construction | Étale cohomology of a fibre and the polarisation pairing | arXiv v1 §4.1.1, (4.1), pp.32–33 | missing | routed: MordellLawrenceVenkatesh:LV.2 |
| /53 | theorem | Lemma 4.2 | arXiv v1 Lemma 4.2, p.33 | missing | routed: MordellLawrenceVenkatesh:LV.2 |
| /54 | definition | Symplectic modules and symplectic pairs | arXiv v1 Definitions 4.3–4.4, Example 4.5, pp.33–34 | missing | routed: part-ii GaloisSectionsPadicPeriodMaps |
| /55 | theorem | De Rham side: Lemma 4.6 | arXiv v1 §4.1.2, (4.2), Lemma 4.6, pp.34–35 | missing | routed: MordellLawrenceVenkatesh:LV.2 |
| /56 | theorem | The symplectic pair of p-adic Hodge cohomology | arXiv v1 §4.1.3, p.35 | missing | routed: part-ii GaloisSectionsPadicPeriodMaps |
| /57 | theorem | Lemma 4.7: relative de Rham Chern classes | arXiv v1 Lemma 4.7, footnote 18, pp.35–36 | missing | routed: MordellLawrenceVenkatesh:LV.2 |
| /58 | theorem | Lemma 4.8 and Remark 4.9 | arXiv v1 Lemma 4.8, Remark 4.9, pp.36–37 | missing | routed: MordellLawrenceVenkatesh:LV.2 |
| /59 | definition | The Lagrangian period domain | arXiv v1 §4.2, p.37 | planned | MordellLawrenceVenkatesh:LV.3 |
| /60 | definition | The symplectic pairs M^{≤1}(Φ) | arXiv v1 Definition 4.10, p.37 | missing | routed: part-ii GaloisSectionsPadicPeriodMaps |
| /61 | theorem | Proposition 4.11 | arXiv v1 Proposition 4.11, p.37 | missing | routed: part-ii GaloisSectionsPadicPeriodMaps |
| /62 | theorem | Decomposition of the period domain (Lemma 4.12) | arXiv v1 §4.2.1, (4.3), Lemma 4.12, p.38 | missing | routed: part-ii GaloisSectionsPadicPeriodMaps |
| /63 | definition | Complex period maps | arXiv v1 §5.1, p.39 | planned | MordellLawrenceVenkatesh:LV.3 |
| /64 | theorem | Lemma 5.1 | arXiv v1 Lemma 5.1, p.39 | missing | routed: MordellLawrenceVenkatesh:LV.3 |
| /65 | theorem | Lemma 5.2 | arXiv v1 Lemma 5.2, footnote 19, pp.39–40 | planned | MordellLawrenceVenkatesh:LV.3 |
| /66 | theorem | Proposition 5.3: v-adic and complex Zariski closures agree | arXiv v1 Proposition 5.3, p.40 | missing | routed: MordellLawrenceVenkatesh:LV.3 |
| /67 | theorem | Lemmas 5.4–5.6 and Remark 5.7: the formal germ | arXiv v1 Lemmas 5.4–5.6, Remark 5.7, pp.40–42 | missing | routed: MordellLawrenceVenkatesh:LV.3 |
| /68 | definition | Full monodromy | arXiv v1 Definition 5.8, p.42 | planned | MordellLawrenceVenkatesh:LV.3, MordellLawrenceVenkatesh:LV.10 |
| /69 | theorem | Lemma 5.9 | arXiv v1 Lemma 5.9, p.43 | missing | routed: MordellLawrenceVenkatesh:LV.3 |
| /70 | theorem | Corollary 5.10 and Remark 5.11 | arXiv v1 Corollary 5.10, Remark 5.11, p.43 | missing | routed: MordellLawrenceVenkatesh:LV.3 |
| /71 | definition | The adelic Lawrence–Venkatesh locus | arXiv v1 Definition 6.1, p.43 | missing | routed: part-ii GaloisSectionsPadicPeriodMaps |
| /72 | definition | S-good pairs and the Lawrence–Venkatesh locus | arXiv v1 Definitions 1.2 and 6.2, Remark 6.3, pp.2, 43–44 | missing | routed: part-ii GaloisSectionsPadicPeriodMaps |
| /73 | definition | The Lawrence–Venkatesh locus in the period domain | arXiv v1 Definition 1.7, §1.1.2, p.5 | missing | routed: part-ii GaloisSectionsPadicPeriodMaps |
| /74 | theorem | Lemma 6.4 | arXiv v1 Lemma 6.4, footnotes 20–21, p.44 | missing | routed: part-ii GaloisSectionsPadicPeriodMaps |
| /75 | theorem | Theorem 6.5 | arXiv v1 Theorem 6.5, p.44, proof §6.5, p.53 | missing | routed: part-ii GaloisSectionsPadicPeriodMaps |
| /76 | theorem | Mordell from Theorem 6.5 | arXiv v1 §6, after Theorem 6.5, p.44 | missing | routed: part-ii GaloisSectionsPadicPeriodMaps |
| /77 | theorem | Remark 6.6: the algebra of a fibre | arXiv v1 Remark 6.6, p.46 | missing | routed: part-ii GaloisSectionsPadicPeriodMaps |
| /78 | theorem | Proposition 6.7: the principal trichotomy (corrected) | arXiv v1 Proposition 6.7, pp.46–47; Proposition 1.8, pp.5–6; Remark 1.9, p.6 | missing | routed: part-ii GaloisSectionsPadicPeriodMaps |
| /79 | definition | Types (a), (b), (c) and their loci | arXiv v1 Definition 6.8, p.47 | missing | routed: part-ii GaloisSectionsPadicPeriodMaps |
| /80 | theorem | Proposition 6.9 | arXiv v1 Proposition 6.9, pp.48–49 | missing | routed: part-ii GaloisSectionsPadicPeriodMaps |
| /81 | theorem | Corollary 6.10 | arXiv v1 Corollary 6.10, p.48 | missing | routed: part-ii GaloisSectionsPadicPeriodMaps |
| /82 | definition | The sets T_i and their finiteness (Lemma 6.12) | arXiv v1 Definition 6.11, Lemma 6.12, p.48 | missing | routed: part-ii GaloisSectionsPadicPeriodMaps |
| /83 | theorem | Lemma 6.13 | arXiv v1 Lemma 6.13, Remark 6.14, pp.48–49 | missing | routed: part-ii GaloisSectionsPadicPeriodMaps |
| /84 | theorem | Proposition 6.15 | arXiv v1 §6.3, Proposition 6.15, pp.49–52 | missing | routed: part-ii GaloisSectionsPadicPeriodMaps |
| /85 | theorem | Corollary 6.16 | arXiv v1 Corollary 6.16, p.50 | missing | routed: part-ii GaloisSectionsPadicPeriodMaps |
| /86 | theorem | Lemma 6.17 | arXiv v1 Lemma 6.17, (6.1), pp.50–51 | missing | routed: part-ii GaloisSectionsPadicPeriodMaps |
| /87 | theorem | Sublemma 6.18 | arXiv v1 Sublemma 6.18, Remark 6.19, p.51 | missing | routed: MordellLawrenceVenkatesh:LV.7 |
| /88 | definition | The Kodaira–Parshin family (cited) | arXiv v1 §6.4, pp.52 | planned | MordellLawrenceVenkatesh:LV.8, MordellLawrenceVenkatesh:LV.10 |
| /89 | theorem | Proposition 6.20 | arXiv v1 Proposition 6.20, pp.52–53 | missing | routed: part-ii GaloisSectionsPadicPeriodMaps |
| /90 | theorem | Remark 6.21 | arXiv v1 Remark 6.21, p.53 | missing | routed: part-ii GaloisSectionsPadicPeriodMaps |
| /91 | theorem | Corollary 6.22 | arXiv v1 Corollary 6.22, p.53 | missing | routed: part-ii GaloisSectionsPadicPeriodMaps |
| /92 | theorem | Dirichlet's theorem | arXiv v1 used in Corollary 6.22, p.53 | library | mathlib:Nat.forall_exists_prime_gt_and_eq_mod |
| /93 | theorem | Remark 6.23: which (v, q) work | arXiv v1 Remark 6.23, pp.53–54 | missing | routed: part-ii GaloisSectionsPadicPeriodMaps |
| /94 | construction | The relative symplectic pair R^{≤1}π_ét*Q_p | arXiv v1 §7.1, p.55 | missing | routed: part-ii GaloisSectionsPadicPeriodMaps |
| /95 | construction | Representations attached to a section | arXiv v1 §7.2, (†), p.56 | missing | routed: part-ii GaloisSectionsPadicPeriodMaps |
| /96 | theorem | Proposition 7.2 | arXiv v1 Proposition 7.2, p.56 | missing | routed: part-ii GaloisSectionsPadicPeriodMaps |
| /97 | theorem | Theorem 7.1 | arXiv v1 Theorem 7.1, pp.54, 56 | missing | routed: part-ii GaloisSectionsPadicPeriodMaps |
| /98 | definition | Filtered derived categories | arXiv v1 Appendix A, Remarks A.1, A.4, A.5, pp.56–58 | missing | routed: PadicHodgeTheory:P8 |
| /99 | theorem | Lemma A.2 (Deligne) | arXiv v1 Lemma A.2, p.57 | missing | routed: PadicHodgeTheory:P8 |
| /100 | theorem | Lemma A.3 | arXiv v1 Lemma A.3, pp.57–58 | missing | routed: PadicHodgeTheory:P8 |
