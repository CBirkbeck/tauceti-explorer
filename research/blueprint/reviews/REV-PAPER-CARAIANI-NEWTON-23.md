# REV-PAPER-CARAIANI-NEWTON-23: review of the extraction of Caraiani–Newton, *On the modularity of elliptic curves over imaginary quadratic fields*

**Verdict: accept.** All six routes are accepted: two Part II routes and four source routes. The review added two source routes, which are also accepted. Corrections were made in place:
- two routes added (7 and 8), and three items moved from route 2 to route 8;
- the briefs of routes 1 and 2 corrected;
- two statuses changed from planned to missing;
- three items added and nine item statements or locators corrected.

All eleven recorded misprints are confirmed. Six new mistakes, E12–E17, are added. One of them, E12, is an **error**: Lemma 5.6.5 is false, and this leaves a gap in the proof of Theorem 5.2 when p ≡ 1 mod 3. The elliptic-curve theorems are unaffected.

Reviewer: Claude Code, session `cc-f805bf`, 29 September 2026. Extraction under review: Claude Code `cc-fb70e5` (issue #4490). It had 166 items (1 library, 36 planned, 129 missing), 6 routes and 11 `sourceIssues`, with status `complete`. `cc-f805bf` appears nowhere in its files.

Source: arXiv:2301.10509.
- **v3**, 27 March 2025, 106 pages (https://arxiv.org/pdf/2301.10509v3). This is the latest version. Its SHA-256 `57abc79a…d0c3` matches the recorded hash. PDF page n is printed page n.
- **No published version.** A Crossref search on the title and authors on 29 September 2026 found none.
- **Earlier versions.** I also downloaded v1 (25 January 2023) and v2 (29 September 2023) and compared them at E1, E3, E9, E12, E14 and E16. All six read the same there.

## 1. Items

**What I read.**
- The whole of §1 and §§6–7 line by line, including every proof in §7.
- §§2–5 in full, split into three parallel passes: §2, §§3–4 (including the proofs of Propositions 4.2.6 and 4.2.13 and Theorem 4.2.15) and §5 (the patching argument of §5.4, §5.6 and the end of the proof of Theorem 5.2).
- Every doubtful formula on 300-dpi page images: pp.17–19, 21, 31, 37, 44, 48, 51, 52, 55, 62, 72, 76, 79, 83, 85, 86, 93, 100 and 101.

**Coverage.** A script check finds every numbered Lemma, Proposition, Theorem, Corollary and Definition in some item locator, with one exception: Corollary 2.3.10, the w = id input to Proposition 2.3.11, appeared only in a note. It is now part of `lem-2-3-8`.

I added three cited inputs that the proofs rest on:
- **[BLGHT11, Lemma 3.3]**, on the components of completed tensor products. It is used to verify Assumption 5.4.1 (p.85). Planned at R03.3/R03.6, as in the accepted PAPER-BOXER-CALEGARI-GEE-ETAL-25 item 122.
- **Solvable base change and descent**, [ACC+18, Prop. 6.5.13]. Used on pp.87 and 90. Planned at GL2AutomorphicRepresentationsAndTransfer R17.4 ("Iterate to solvable extensions") and ML.5, as in the accepted ACC+ items 268 and 269.
- **Allen–Khare–Thorne's Taylor–Wiles data without enormous image**, [AKT23, Prop. A.6] (p.85). Missing, in route 1.

**Statements.** I compared all of them with the text. They match, apart from these corrections:
- **`chi-character` (p.37).** The paper defines χ(m) as Nm det(Ad m)^{−1} divided by its p-adic absolute value. The item multiplied instead, which does not land in O^×.
- **`lem-4-1-5` (p.55).** The first factor is G̃^{S̄₁}, the adelic group away from S̄₁. It is a superscript.
- **`prop-5-4-2` (p.78).** Part (2) requires C_a to contain the automorphic point x.
- **`patching-axioms`.** Assumption 5.4.1 (2) is worded as printed: each generic point of Spec R_∞/ϖ *is the specialization of* unique generic points. Part (1) also gives dim R′_∞/ϖ.
- **`sub-lemma-1-twist`.** Its index i runs over the factors of Ã(ψ)[1/p], not over the blocks of n.
- **`lem-5-6-5`.** It now carries the corrected statement (E12).
- **Locators.** `lem-2-3-15` is on p.41, `local-rings-5-3` is on p.75, and E7 is on pp.18–19.

**Checks redone.**
- **§7 by exact arithmetic over Q(√d):**
  - the point (1+2i, 3+6i) of Proposition 7.2.2 and the special points 0⁺, P₁, P₂ lie on C;
  - (7.2.1)–(7.2.3) follow from the stated Riemann–Roch functions;
  - the conic conditions of Proposition 7.2.2 and Remark 7.2.3 hold. The conics of E₁ and E₂ even have no real points;
  - the factorisation of (x⁶+250x³+5⁵)³ − 1728x¹⁵ on p.94 holds;
  - the three rational roots of the sextic of Proposition 7.3.1 are 2, 1/3 and −1;
  - the Q(√−11) points of Proposition 7.3.3 lie on C;
  - w₁ preserves C₁;
  - the Q(√−55) points P₁, P₂ lie on C₂, and w₂ sends P₁ to the conjugate of P₂;
  - the torsion divisors D₁, D₂ of Proposition 7.4.4 are supported on points of C₂.
- **Group theory:**
  - the case analysis turning Theorem 6.1 and Lemma 7.1.1 into the four curves of p.93;
  - that the full normalizer C⁺_ns(5) meets SL₂(F₅) in an absolutely irreducible group of order 12, as Corollary 7.3.4 needs.

**Not redone.** The Magma computations of §7: the models, Mordell–Weil groups and Box's sieve. Route 2's brief treats them as certificates to reproduce.

## 2. Statuses

**The one library citation holds.** `Subgroup.goursat_surjective` is at Mathlib 082e2d3, `Mathlib/GroupTheory/Goursat.lean:104`. Together with `Subgroup.goursatFst_prod_goursatSnd_le` (line 85), it gives Lemma 6.2.1 for arbitrary groups. Here goursatFst = {g : (g,1) ∈ I} is the paper's H ∩ G₁.

I read every cited layer's description.

**Two planned citations do not hold. Both items are now missing.**
- **`thm-2-1-28`, cited at IG.7.** IG.7 exports ACC+ Theorem 4.3.3 for ρ_m "of length at most two", with [F⁺:Q] > 1. The paper removes both hypotheses by Koshikawa [Kos21, Thm. 1.4], which is essential when F⁺ = Q. It goes to a new route 7.
- **`relative-symmetric-chabauty`, cited at ED.4/ED.5.** ED.4 is classical Chabauty over Q with r < g, and says "number-field … variants require separately proved hypotheses". Neither layer names symmetric powers.

**The other 34 hold.** Some hold only through accepted source routes, which the notes now say:
- `non-eisenstein` through ACC+ route 3 (IHG.5);
- `ctg-weight` through ACC+ route 2 (PA).

**Layers added to planned items:**
- L7 for `semistable-ordinary` ("ordinary deformation functors with a full invariant flag and specified graded characters");
- ALS.6 for `lem-2-1-6`;
- TC.3 for `unitary-group-G-tilde` and `unramified-hecke-polys`, as for the accepted ACC+ items 36 and 44.

**Missing items I searched for.** I searched the pinned declaration index and the atlas stage texts.
- **Lemma 3.2.1.** Mathlib lifts idempotents only across a nilpotent kernel (`CompleteOrthogonalIdempotents.lift_of_isNilpotent_ker`), not over a Henselian base.
- **Lemma 2.3.18.** Its Artin–Rees input is in both libraries (`Ideal.exists_pow_inf_eq_pow_smul`; `TauCeti.ArtinRees.exists_controlled_lift`), but the statement itself is not.
- **The modular curves X(H₁,H₂).**
  - Tau Ceti ModularCurves layer 9 plans the affine Y_H.
  - Layer 10 compactifies only diamond quotients.
  - ModularCurvesPartII R13.4a covers only full, Γ₁ and Γ₀ level.
  - So they stay missing.
- **Lemmas 6.1.4, 6.2.2 and 7.1.1.** These belong to ArithmeticGaloisRepresentations R01.4 ("finite-subgroup facts of GL₂/PGL₂ … behaviour under restriction to cyclotomic fields"), which gives route 8.
- **No owner found** for:
  - Newton above Hodge (Lemma 3.1.3);
  - Emerton–Hauseux P-ordinary parts;
  - the Faltings–Serre method;
  - Zywina's quantitative Hilbert irreducibility. IG.2 plans only the qualitative form.

The reviewed library audit lists ALS.1, ALS.3, ALS.6, ED.4, ED.5 and R01.4 as not built, so no item becomes library.

## 3. Routes

1. **Part II of PotentialAutomorphyInfrastructure** (CrystallineLocalGlobalCompatibilityCM). Accepted, brief corrected.
   - PA.1 and PA.2 stop at the Fontaine–Laffaille and Borel-ordinary cases.
   - Nothing else plans P-ordinary Hida theory for the Siegel parabolic, the Bruhat-filtration computation, degree shifting at deep auxiliary level, Theorems 4.2.15 and 4.3.1, or Theorem 5.2.
   - It is distinct from the accepted sibling WeightZeroCrystallineAutomorphyLifting, which imports this route's results.
   - The brief now names PA.2 as the imported Borel case, PadicFamilies L0a, R03.3/R03.6, R17.4, ML.5 and route 7.
   - It also tells the design to state Lemma 5.6.5 with its A₄ exception and to deal with the gap in Theorem 5.2 (E12).
2. **Part II of EllipticCurveModularity** (EllipticCurveModularityImaginaryQuadratic). Accepted, as corrected.
   - ModularityAndLanglandsExtensions ML.1 organizes "modularity over totally real/CM fields with source-scoped restrictions". It is a registry, and owns none of the switching or quadratic-point mathematics. The brief now says that ML.1 registers Theorems 1.1, 1.2, 6.1 and 7.1, which this Part II proves.
   - The group-theory lemmas moved to route 8.
   - The imports now include Tau Ceti ModularCurves 5C (the twisted curve Y(ρ̄), planned over Q and extended here to L) and layer 9.
   - They also include GlobalNumberFields layer 1 (weak approximation), R17.4, and the accepted GL₂-type Part II for the Q-curves.
3. **Source, ED.4 and ED.5.** Accepted. The set-up item is now missing and stays in this route.
4. **Source, L7, L8 and R08.4.** Accepted.
5. **Source, IHG.1.** Accepted.
6. **Source, ALS.3 and ALS.6.** Accepted.
7. **Source, IG.7** (added). Accepted. It holds Theorem 2.1.28, with Koshikawa as the source of the strengthening.
8. **Source, R01.4 and G7** (added). Accepted. It holds Lemmas 6.1.4, 6.2.2 and 7.1.1, as the accepted ACC+ item 300 was routed.

Every missing item is routed exactly once. No Tau Ceti roadmap is re-planned.

## 4. Mistakes in the paper: 11 of 11 confirmed, 6 added

**Where I looked for corrections.**
- The arXiv listing: v3 is the latest version.
- Crossref: no published version and no erratum.
- The same passages in v1 and v2.

**E1–E11.** Each was confirmed on a 300-dpi page image:
- **E1** (p.52): the tensor product over R^{st} along ζ. The same bullets also print "if and only ρ".
- **E2** (p.52): R^{cris} for R^{△}.
- **E3** (p.44): S_n for S_m. The same statement also writes F for F_v.
- **E4** (pp.89–90): E_{F_w} for E_{L_w}.
- **E5** (p.93): X₀(15) for X(s3,b5).
- **E6** (p.31): a stray λ in a subscript.
- **E7** (pp.18–19): §2.1.1 for §2.1.2.
- **E8** (p.21): α(x) for α(g).
- **E9** (pp.100–101): G₁ for G₂, three times. With 2J ⊂ ⟨G₂, T⟩ and T ≅ Z/2 ⊕ Z/10, we get 10J ⊂ ⟨5G₂, J[2]⟩.
- **E10** (p.62): v̄″ for v̄.
- **E11** (p.18): the missing X^{2n−j}.

**E12 (error; affects a stated result).** Lemma 5.6.5 (pp.85–86) asserts reducibility of ρ̄|_{ker det ρ̄}. For d = 3 the proof says the projective image is A₄, with ρ̄(G₁)/ρ̄(Z) ≅ Z/2 × Z/2, "and it follows that ρ̄|_{ker(det ρ̄)} is reducible". That step fails: for odd p, a Klein four subgroup of PGL₂(F̄_p) fixes no line.
- **Counterexample, for every p ≥ 5.**
  - Take G = 2T ≅ SL₂(F₃) inside SL₂(F̄_p), χ its cubic character (kernel Q₈), and ρ̄ = incl ⊗ χ.
  - Then det ρ̄ = χ² has order 3.
  - Every g ∉ Q₈ has an eigenvalue ±1, which is equivalent to (5.6.1).
  - But Q₈ acts irreducibly.
  - I checked this by hand, and by brute force over F₇.
- **Effect on Theorem 5.2.** Its proof (p.87) uses the lemma to choose v₀, v₀′ with H²(F_{1,v₀}, ad⁰ρ̄) = 0.
  - For such a ρ̄, every unramified Frobenius has eigenvalue ratio det^{±1} or q_v ≡ 1 mod p, so no such place exists.
  - The hypotheses of Theorem 5.2 allow this case when p ≡ 1 mod 3 and [F₁(ζ_p):F₁] = 3, for example p = 7 and F ⊇ Q(√−7).
  - So Theorem 5.2 is not shown false, but its printed proof has a gap there.
- **Not affected.** Theorems 1.1, 1.2, 6.1 and 7.1 use p = 3, 5, where d divides 4 and [DDT97, Lemma 4.11] applies.
- **Versions.** The passage is identical in v1, v2 and v3.

**E13–E17 (misprints; affect nothing).**
- **E13** (proof of Lemma 3.3.2, p.51): the graded pieces are printed F^i_B/F^{i+1}_B for an increasing filtration, and χ_{i,B} is printed with values in E^× instead of B^×.
- **E14** (p.48): "Prop. 3.2.1" for Lemma 3.2.1.
- **E15** (p.83): ρ̄_m : G_{F,T} → GL_n(Q̄_p) for the residual GL₂(k).
- **E16** (p.86): "q-adic places of K" for F.
- **E17** (p.93): r̄_{E,p} for r̄_{E,p_i} in the definition of X(H₁,H₂).

**Not recorded.**
- The spelling slips that the extraction also left out.
- The missing "= 0" in the equation of C₂ (p.100).
- The notation R_v^{ψ,(0,1)} in the proof of Lemma 5.3.3 (p.76): it may follow CEGS25's conventions, and I could not settle what it means.

## 5. Checks

`python3 scripts/check_paper.py` passes on the corrected extraction: 169 items (1 library, 36 planned, 132 missing), 8 routes and 17 `sourceIssues`, each with a review verdict. `python3 research/blueprint/intake.py check-files` reports 0 problems on all four files. The report's new section "Corrections by the independent review" lists every change.
