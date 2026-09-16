# Review REV-PLAN-HABIRO: the Habiro plan and its five roadmap definitions

**Reviewed:** `research/blueprint/plans/HABIRO.md` (job PLAN-HABIRO) and the definitions it proposes in
`research/blueprint/roadmaps/`: `QWittVectors`, `SolidAnalyticRings`, `AnalyticStacks`, `RingStacksAndTransmutation`
and `AnalyticHabiroStack`.

**Verdict: accepted**, with the corrections below applied in place. The structure holds: five new roadmaps, and the
six existing roadmaps kept and rescoped. Before correction the plan had real defects:

- two ordering errors;
- a missing requirement (HQ.4 on HQ.3);
- a requirement that pulled analytic stacks into PR.5;
- a theorem whose proof needs an input no requirement supplied (Wagner v2 Theorem 4.22(b));
- two forward references to Aoki's definitions (AS.4, RS.2);
- a wrong acceptance test (QW.2);
- misattributed statements and wrong page or statement locators;
- boundary overlaps.

Every defect with a clear fix has been corrected. The remaining items are decisions, listed under "Questions for the
user".

## 1. Method

The review used the planner's sources, re-read independently:

- GSWZ arXiv:2412.04241v2: PDF SHA-256 `308d1dd1…`; e-print `b93170cf…`, with the TeX source and `.bbl`.
- Ong's V5A2 notes: all four versions (`bd4f7cfc…`, `9d97824e…`, `ce9b93de…`, and `58c2ea7f…` for 6 March 2025).
- Ong's V5A4 notes: `4cc50e0b…`.
- Wagner v5 (`c1c7426f…`) and v2 (`591d0bdf…`).
- Scholze, *Six-Functor Formalisms* v2 (`bef03551…`).
- Aoki (`a178c823…`).
- Rodríguez Camargo, *Notes on solid geometry* (`6277c6a2…`).
- Text extracts of the campaign-library copies of:
  - Garoufalidis–Wheeler, *Explicit classes in Habiro cohomology*;
  - Meyer–Wagner v4;
  - Wagner, *q-de Rham cohomology and THH over ku*.
- The atlas extracts of the six Habiro roadmaps and their neighbours.
- The pinned baseline: Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369` and Mathlib
  `082e2d37e8b0463410cdb532e111cd43d5a66174`.

All hashes above were recomputed and match plan §1. Access date 2026-09-16.

The checks were:

- **Locators.** Every numbered statement of GSWZ, V5A2 and V5A4 was located by page. The plan's descriptions were
  compared with the printed statements, with rendered pages where formulas matter (V5A4 pp. 42–43).
- **Other sources.** Checked in the sources themselves:
  - Wagner v2 §3: numbering and section boundaries;
  - Wagner v5: Lemmas 2.1 and 2.9 and Remark 2.47;
  - *Six-Functor Formalisms*: Lecture X;
  - Aoki: §4 and Theorem 1.7;
  - Rodríguez Camargo: fifty locators, and the texts of Theorems 2.3.3, 6.2.11, Remark 2.3.4 and §6.5;
  - Garoufalidis–Wheeler: statement numbers;
  - Meyer–Wagner v4 and the ku paper: Theorem 4.17 and its surroundings.
- **Baseline.** About sixty cited Mathlib line numbers were re-read in the pinned tree, and all were correct. Every
  documentation and absence claim was re-checked, and six content claims were wrong (§3.4).
- **Graph.** The plan's requirement changes and this review's changes were applied to the atlas stage graph together
  with the five new definitions. The union graph is acyclic and every reference resolves. The planner's definition
  validator, pointed at the edited files, reports no errors and no warnings.
- **Wording.** The definitions contain no forbidden wording ("optional", "deferred", …) and no private paths.

An earlier run of this job stopped at a session limit before editing anything. Its scratch notes were used only as
leads, and each was checked again against the sources before any change.

## 2. Findings that changed the plan's structure

| # | finding | evidence | correction |
|---|---|---|---|
| S1 | HR.5-number-field-comparison was in step 3, but it requires HB.6, which was in step 5. | atlas: HR.5-number-field-comparison requires HB.6 | §7: HB.6 first in step 5 (it needs only HC.3, HC.4, HR.1), then HR.5-number-field-comparison. |
| S2 | HR.2 gains SA.1 (§6.2), yet §7 put all of `SolidAnalyticRings` in Track B, "independent of Track A until step 12". | plan §6.2 against §7 | §0 and §7: SA.0–SA.1 come before HR.2, and §7 lists where the tracks meet. |
| S3 | HQ.7 requires HQ.6 in the atlas, and the plan adds HS.3 to HQ.6. Step 8's "HQ.7" therefore waited for the whole analytic track. | atlas HQ.7 requires; plan §6.5 | HQ.7 drops HQ.6 and adds HQ.4, HQ.5, HQ.5-trace; its tests are algebraic. HQ.8 does not need HQ.6 either (§7 step 8). |
| S4 | HQ.4 proves Theorems 4.8–4.9 "via Wagner v2 Ex 3.12 and Cor 3.54", but Example 3.12 is in §3.2 and Corollary 3.54 in §3.8, both HQ.3's. HQ.4 did not require HQ.3. | Wagner v2 pp. 26, 50–51 | HQ.4 adds HQ.3. This is acyclic because HQ.3 drops HQ.4. |
| S5 | Wagner v2 Theorem 4.22(b) (spherical $E_1$-lift) is proved as "a special case of [Wag25, Theorem 4.17]", the ku paper's §4 on THH over ku. HQ.5 owned it without RT.4:q-Hodge. V5A4 Theorem 1.7, its $\mathbb Z_p$ case, had no owner at all. | Wagner v2 p. 65; ku paper §4 | 4.22(b) and V5A4 Thm 1.7 move to HQ.5-trace, which requires RT.4:q-Hodge; §6.7 records the request; §8 item 24. |
| S6 | RS.0 required AS.2, so with D13 (PR.5 imports RS.0) prismatization would depend on analytic stacks. | RS.0 requires | RS.0 is stated for fpqc stacks and any ∞-category of stacks with finite limits, and drops AS.2. RS.2 gains the analytic instance. |
| S7 | AS.4 defined normed analytic rings "in the sense of Aoki Definition 4.31", a notion owned by RS.3, which requires AS.4. RS.2 likewise used Aoki's sutured, stable and smooth ring stacks, also RS.3's. | definitions | AS.4 states the axioms itself. RS.3 gains the comparison of maps to $[0,\infty)^{\mathrm{Betti}}$ with Aoki's locale $[0,\infty)$ (Aoki Lemma 4.34) and the comparison of Theorem 10.6's hypotheses with Aoki's notions. |
| S8 | HS.3 computed the Habiro cohomology of the disc $D_0(1)^\dagger$ (Prop 7.11) before HS.4 defines Habiro discs. HS.4 also claimed "the transmutation of $D_0(r)^\dagger$", which the HS README makes a roadmap-for-a-roadmap. | definitions | Prop 7.11 moves to HS.4 for the closed Habiro unit disc $N^{-1}[0,1]$, with its source status; the transmutation claim is replaced. |
| S9 | HB.8 requested $D_{\zeta_m}(1)^{24m}=m^{12m}$ from QM.1, which requires `MetaplecticAutomorphicForms` MP.7–MP.8. The identity is elementary. | GSWZ proof of Lemma 2.12 | HB.8 proves it directly, and QM.1 is dropped. The proof: $D_{\zeta_m}(1)^m=P:=\prod_{\ell=1}^{m-1}(1-\zeta_m^\ell)^\ell$; pairing $\ell$ with $m-\ell$ and using $\prod_{\ell}(1-\zeta_m^\ell)=m$ gives $P^2=m^m(-1)^{m(m-1)/2}\zeta_m^{-m(m^2-1)/6}$, so $P^{24}=m^{12m}$. Checked by hand for $m=2,3$. |
| S10 | HB.9 took $\varepsilon_m$ for V5A2 Thms 11.3 and 12.1–12.6 "from HB.2". These theorems define $\varepsilon_m$ and $L_m$ through the étale realisation of $V^{univ}$ (Lecture 9, excluded by D5). HB.2's $\varepsilon_m$ lives on $K_3$ of a number field, not over the relative ring $R_m$. | V5A2 pp. 44–46 | HB.9 restates the theorems with GSWZ's explicit $U^{\mathrm{FGI}}_m$ and $D_{\zeta_m}$ (Lemma 2.12, HB.8) and defines Thm 12.5's base change directly. The identification with $V^{univ}$'s regulator is a gap (§8 item 28, D5). |
| S11 | Ownership overlaps: <ul><li>V5A4 Ex 4.5 with Lemma A.1 in both HR.7 and HQ.4 (and HR.7 already has the $\Phi_5$/$\mathbb F_{11}$ test);</li><li>GSWZ Examples 5.6–5.10 in both HC.4 and HB.6;</li><li>V5A2 Props 2.13 and 2.20 in both HB.2 (§6.3) and HB.4 (§4.2);</li><li>Wagner v2 3.21–3.22 in both QW.7 and HQ.2;</li><li>Betti and de Rham stacks (with their six functors) in both RS.1 and AS.3/AS.1;</li><li>the $q$-Pochhammer forcing test in both SA.4 and HS.0;</li><li>the algebraic–analytic functor in both HS.3 and HQ.6.</li></ul> | sources as cited | One owner each: <ul><li>HQ.4;</li><li>HC.4 (5.6–5.7) and HB.6 (5.8–5.10);</li><li>HB.2;</li><li>QW.7 owns 3.21, 3.23–3.28, 3.30–3.31, HQ.2 owns 3.14–3.20, 3.22, 3.29;</li><li>AS owns the stacks, RS.1 the ring-stack structure;</li><li>HS.0;</li><li>HS.3 owns the functor, HQ.6 the comparison.</li></ul> |
| S12 | Holes: <ul><li>V5A4 Thm 1.7 had no owner;</li><li>V5A4 Examples 1.4–1.5 sat in HQ.7 with no supplier (they are Garoufalidis–Wheeler's Legendre examples);</li><li>V5A2 Def 1.1, Table 1 and Prop 2.1 had no owner;</li><li>GSWZ (FAdef), (FAmdef), (PhiAshift), (zjt), (Sdef), (taulambda), (RA), (Phidef) were not named in any stage;</li><li>the Bloch class of an arbitrary non-degenerate Nahm solution (Theorem 5's setting) had no owner, since HB.3 treats only the distinguished real solution;</li><li>GSWZ §§4.2–4.4 had no owner.</li></ul> | sources as cited | <ul><li>HQ.5-trace;</li><li>HQ.9;</li><li>HC.1;</li><li>HB.8;</li><li>HB.3;</li><li>HB.10, with source status.</li></ul> |

## 3. Changes to the plan, by section

### 3.1 §0 and §1

- **§0.** The blueprint-order summary now shows SA.0–SA.1 before HabiroRings and HR.5-number-field-comparison after
  HB.6.
- **§1.2, 4 Feb row.** "1–12 + App. A": the 4 Feb table of contents lists Appendix A.
- **§1.2, 12 Nov → 1 Dec.** Ten references were added, and Definition 1.6 was corrected from $(q;q)_\infty$ to $(q;q)_n$.
- **§1.2, 1 Dec → 4 Feb.** Rewritten:
  - Lectures 7–12 and App. A were added.
  - The new Lecture 3 material is on p. 17: the expected ratios for $(t;q)_\infty$, and
    $f_A(q)\sim\exp(\mathrm{Li}_2(\xi))\sqrt\delta/\sqrt[m]{\varepsilon_m(\xi)}\,O(h)$ "for some class $\xi\in K_3(K)$". The plan had
    "Lecture 2/3" and a garbled formula.
  - Proposition 3.3's comparison ring changed from the correct re-expansion to a false isomorphism.
  - Lecture 4's warning was dropped, and Lecture 5 changed.
- **§1.2, 4 Feb → 6 Mar.** The relative Habiro ring of Lecture 10 is only a stated aim ("We seek…"). The realisation
  maps went from $N$ variables to one, and the Lecture 12 tilt index was corrected. "Nothing of mathematical
  substance is lost" is replaced by an accurate account.
- **§1.4.**
  - Exact citations of Kontsevich–Soibelman (CNTP 5, 2011) and Efimov (Compos. Math. 148, 2012), with GSWZ's
    alternative proof of Theorem 6.
  - Rademacher–Grosswald is replaced by the direct proof.
  - The Zickert item now reads: Suslin's surjection $K_3(K)\to B(K)$ (cited through Zickert, Eqn (1.1)), and the
    Kashaev–Mangazeev–Stroganov identity as used in CGZ.
  - Added: the 2024 Meyer–Wagner version cited by V5A4 Thm 1.7.

### 3.2 §3 (targets)

- **GSWZ §3.1.**
  - (emdef) is eq. (16) on p. 8, not p. 7. Definition 1.3 is on p. 9.
  - "The text before Def 1.4 assumes $p$ prime to 6" becomes "the text after": the sentence follows the definition on
    p. 10.
  - The finite-projectivity claim after Def 1.1 is justified in one sentence on p. 7. The label is (eq.habp).
  - Remark 2.14 is the lift of (dphiA2) when $U^{\mathrm{FGI}}_m$ is a $p$-unit, not $q$-difference equations. Lemma 2.15 is
    (PhiFGIAshift).
  - §5.3 (Examples 5.6–5.8) is now separated from §5.4 (Examples 5.9–5.10). 5.9 is "only conjecturally", and 5.10
    checks one expected congruence.
- **V5A2 §3.2 table.**
  - Prop 1.5 is flagged.
  - Lemmas 2.17, 2.18 and 2.19 are described separately (only 2.17 is about Bernoulli polynomials).
  - The Prop 2.20 formula is corrected (printed $\zeta_m$ for $\zeta_m^i$), and Prop 3.3's false $\cong$ is flagged.
  - The $K_3(K)\to\mathrm{Pic}$ expectation is located after Remark 3.8.
  - (4.5) gives the symmetries and (4.6) the five-term relation.
  - Remarks 9.2–9.4 are described as group rings, log version and homotopy orbits.
  - Lecture 10 is an aim, not a construction; Lecture 11 assumes $a$ even.
  - Prop 12.3's $L_1$ lives over $\widehat R[[q-1]]$ and is trivialised over $\widehat R[1/p][[q-1]]$.
  - Example 12.2 is listed under D6.
- **V5A4 §3.3 table.**
  - The Thm 1.7 locator is annotated.
  - Lecture 6: "Examples 6.6–6.9" becomes Examples 6.6–6.7 and Remarks 6.8–6.9.

### 3.3 §4 (dependency chain)

- **§4.1 baseline.** Corrected and extended; §3.4 below gives the details.
- **§4.2 L1.** V5A2 Cor 2.6 contains only $(t;q)_\infty^{-1}=\sum t^n/(q;q)_n$. The second Euler identity is in the proof of
  Prop 1.5, and V5A2 has no $q$-binomial theorem.
- **§4.2 L7.** Props 2.13 and 2.20 go to HB.2, and Thm 4.13 with CGZ 7.1 to HB.4. The V5A2 owner statement is corrected
  to Lectures 11–12.
- **§4.2 L8 and L9.** Wagner v2 numbering corrected (S11).
- **§4.3.**
  - $q$-dRW row: numbering corrected.
  - Bloch-group row: the V5A2 locators are Def 4.3, Defs 6.17–6.18, Thm 6.19, L8 and App. A; V5A2 has no Suslin
    sequence.
  - Admissible-series row: V5A2 Def 1.2; V5A2 has no formal Gaussian integration.

### 3.4 Baseline corrections (§4.1)

Checked by reading the pinned sources:

1. **`PowerSeries.subst`.** `HasSubst a` is nilpotence of the constant coefficient (`Substitution.lean`, l. 40), and
   `subst` returns 0 otherwise. So it cannot re-expand at $x+\zeta_{pm}-\zeta_m$, contrary to the plan. The tool is
   `HasEval`/`eval₂Hom`/`aeval` (`Evaluation.lean`, l. 61), with
   `MvPowerSeries.LinearTopology.isTopologicallyNilpotent_of_constantCoeff` (l. 147).
2. **Light condensed modules.** The monoidal and closed structure is at `Light/Monoidal.lean` ll. 35–62, with
   `MonoidalClosed (LightCondMod R)` at l. 56 (plan: ll. 29–53).
3. **`BinomialRing`.** The λ-ring TODO is in the module docstring of `Binomial.lean` (ll. 56–59), not in the class
   documentation at l. 76. `Dickson.lean` l. 115 also notes the absence of Λ-rings.
4. **Tau Ceti "Witt groups".** Tau Ceti has no Witt groups, only Witt's theorems for quadratic forms.
5. **`SSet.Quasicategory` "(basic only)".** Wrong: nerves, inner fibrations, strict Segal and 2-truncated
   quasicategories, `SimplicialNerve`, model categories and Dold–Kan exist. The absence of ∞-categorical derived
   categories stands.
6. **`Spa`.** There is no declaration `Spa`; it is `TauCeti.ValuationSpectrum.spa` (`Spa/Basic.lean`, l. 97).

Two file attributions were also fixed: `CondensedMod`/`CondensedAb` are in `Module.lean` (ll. 40, 61), and
`DescentData` is in `DescentData.lean` (l. 59).

Added: `Polynomial.resultant` (l. 134) with `exists_mul_add_mul_eq_C_resultant` (l. 874); Tau Ceti
`AdjoinRoot.norm_mk_eq_resultant` (l. 284); `Algebra.FormallySmooth.exists_mkₐ_comp_eq_of_isAdicComplete` (l. 94,
absent from the index); `Pentagonal.tprod_one_sub_pow` (l. 146); `WittVector.fontaineTheta` (l. 165) and
`BDeRhamPlus`. All other cited declarations and line numbers were confirmed.

### 3.5 §§5–7

- **§5.3.** The diagram is replaced by a list of prerequisite → consumer edges. The old arrow "HR.2–HR.5 → HB.6" was
  wrong, and the edges SA.1 → HR.2, HR.1 → HB.6 → HR.5-number-field-comparison and HQ.1 → HS.1 were missing.
- **§6.1.**
  - HC.1: the Euler-identity attribution; V5A2 Def 1.1, Table 1 and Prop 2.1; the corrected Prop 1.5 as a test.
  - HC.4: Wagner Lemma 2.1 with $\alpha\ne0$; Examples 5.6–5.7.
- **§6.2.**
  - HR.1 keeps PR.0: it applies Bhatt–Scholze Lemma 2.18 directly.
  - HR.7 is unchanged (S11).
- **§6.3.** HB.6 takes Example 5.8 and §5.4.
- **§6.4.**
  - HB.3: the general Bloch class.
  - HB.8: the GSWZ equations, the direct identity, and QM.1 dropped.
  - HB.9: Cor 1.11(b) inputs (V.4 through HB.7, and HB.2), and the V5A2 L11–L12 restatement.
  - HB.10: GSWZ §§4.2–4.4.
- **§6.5.**
  - HQ.1: comparison of QW.6's framed complexes with PR.6's $p$-complete ones.
  - HQ.3: "§§3.5–3.7 (3.32–3.54)" becomes 3.32–3.54, that is §3.5 from 3.32 and §§3.6–3.8.
  - HQ.4: add HQ.3.
  - HQ.5 and HQ.5-trace: S5.
  - HQ.6: boundary with HS.3.
  - HQ.7 and HQ.8: S3.
  - HQ.9: V5A4 Examples 1.4–1.5.
- **§6.7.** PR.5/RS.0; QM.1 no longer needed; the request to RT.4:q-Hodge.
- **§6.8.** The consistency check was repeated with this review's changes.
- **§7.** Rewritten:
  - S1–S3; S6 lets RS.0 precede PR.5;
  - step 2 adds DD.1 and E5:abstract;
  - step 4 adds `ArithmeticKTheory` N.5, which HB.1 requires;
  - step 7 adds the EDS stages;
  - step 8 places RT.4:q-Hodge before HQ.5-trace;
  - step 13 is HQ.6 only.

### 3.6 §8, §9 and Appendix A

- **§8, items 1–19.**
  - Item 1: "after Def 1.4".
  - Item 3 (rewritten): the printed $\cong$ is false, not "notational". For odd $p$ the right-hand ring contains $\zeta_p$.
    Both rings map by re-expansion to $\mathbb Z_p[\zeta_{pm}][[q-\zeta_m]]$ (Wagner v2 Remark 2.14, which uses re-expansion,
    not "identification with the $(p,\Phi_m)$-adic completion"). The Nov and Dec versions print the correct form.
  - Item 8: the Lecture 8 variant must drop all of (ii), since over $\mathcal H^{\mathrm{an}}$ the polynomial $\Phi_m(q)$ divides the unit
    $1-q^m$.
  - Item 9: Remark 8.5 is described precisely, and the inconsistency between $(1-t;q)_\infty$ and $(t-1;q)_\infty$ is added.
  - Item 17: the V5A2 "erratum" is a margin note pointing to [GZ21]. The notes do not claim a correction of the
    published asymptotics.
  - Item 18: finite projectivity; Cor 1.11(b); Lemma 2.12.
  - Item 19: the Efimov citation.
- **§8, items 20–28.**
  - Item 20: Def 5.4's defects stated precisely.
  - New items:
    - 24: the V5A4 Thm 1.7 locator. Meyer–Wagner v4 has no such theorem; its §3.5 applies the ku paper's Theorem 4.17.
    - 25: Wagner Lemma 2.1 fails for $\alpha=0$.
    - 26: eleven V5A2 misprints, each assigned to its owning stage.
    - 27: source status in V5A4 Lectures 7–8.
    - 28: $V^{univ}$.
- **§9.**
  - D4 cites item 27.
  - D5 is rewritten (S10), and the exclusions are extended to Remarks 9.2–9.4, Example 9.5, Remark 9.7 and the Lecture
    10 continuation.
  - D6 gains V5A2 locators, including Remark 7.4, Example 12.2 and p. 40.
  - D13 notes that RS.0 has no analytic prerequisites.
- **Appendix A.**
  - GSWZ: Def 1.3 on p. 9; §5.3 on p. 65.
  - V5A2: "printed page = PDF page"; Table 1 (p. 7), Remarks 3.1–3.2 (p. 17), Remarks 9.2–9.4 (p. 38), Remark 9.7
    (p. 40), (10.1) (p. 41).
  - V5A4: p. 33; Appendix A starts on p. 44.

## 4. Changes to the roadmap definitions

### 4.1 `QWittVectors`

- **Boundary with HC.4.** Lemma 2.1's last clause holds for $\alpha\ne0$, since $\mathbb Z[q]/(\Phi_m,\Phi_m)=\mathbb Z[q]/\Phi_m$.
- **Boundary with PR.6.** PR.6's $p$-complete framed complexes are completed base changes of QW.6's, and HQ.1 records
  the comparison. This avoids a duplicate twisted-Leibniz theory.
- **QW.1.**
  - The equivalent descriptions of "perfectly covered" were lost when HR.1's text moved here, and are restored: a
    faithfully flat Λ-map to some perfect Λ-ring, or all $\psi^m$ faithfully flat (Wagner v5 Remark 2.47 footnote;
    Wagner v2 1.22(e), p. 12).
  - Free Λ-rings are added as examples.
- **QW.2 acceptance.** The test claimed that $q\text{-}W_p(\mathbb Z)$ is the quotient of $W_p(\mathbb Z)[q]$ by $(q-1)\,\mathrm{im}\,V_p$
  alone, which is false. Lemma 2.9 also imposes $q^p-1$ and $[p]_q-V_pF_p$, and the ring is $\mathbb Z[q]/(q^p-1)$
  (Corollary 2.37).
- **QW.7.**
  - Header numbering corrected: 3.22 and 3.29 are HQ.2's, and 3.30–3.31 open §3.5.
  - The acceptance test's "$R=(\mathcal O_{\mathbb C_p})$" becomes $\mathcal O_{\mathbb C_p}=A_{\inf}(\mathcal O_{\mathbb C_p})/\xi$.
- **Sources.** The Wagner v2 read sections are updated.

### 4.2 `SolidAnalyticRings`

- **SA.4.** The acceptance test that forced $((q;q)_n)$ to decay rapidly duplicated HS.0's Lemma 7.10. It is replaced by the
  $(T^n/u^{kn})$ case of the same construction, with a pointer to HS.0.

### 4.3 `AnalyticStacks`

- **README boundary.** RS uses the Betti stacks of AS.3 and the de Rham stacks and D-modules of AS.1, and compares the
  norms of AS.4 with Aoki's absolute values.
- **AS.3 Betti stacks.** Now states $X^{\mathrm{Betti}}=\operatorname{Spec}C(X,\mathbb Z)$ for profinite $X$, and records that the Betti
  realisation recovers the Heyer–Mann formalism ($D_{qc}\simeq D(X,\mathbb Z)$, Scholze Ex. 10.1) and its
  $D(\mathbb Z_{\mathrm{cond}})$-linear variant (RC §6.5).
- **AS.4.** The norm axioms are stated without appeal to RS.3's notion (S7).

### 4.4 `RingStacksAndTransmutation`

- **Conventions and RS.0: variance.** Aoki Def. 4.21 takes finite-coproduct-preserving functors
  $\mathrm{Pol}\to\mathrm{CAlg}(\mathcal C)$, and stacks are $\mathrm{CAlg}(\mathcal C)^{\mathrm{op}}$. A ring stack is therefore a finite-product-preserving
  functor $\mathrm{Pol}^{\mathrm{op}}\to$ stacks. The definition said "finite-coproduct-preserving functor from Pol to stacks".
- **RS.0.**
  - Stated generally, without AS.2 (S6).
  - "A ring stack is determined by its unit group stack together with $x\mapsto1-x$" is replaced by the precise
    statement for functors as in V5A4 Prop 6.12: the Zariski cover $\mathbb A^1=D(T)\cup D(1-T)$ and Remark 6.13.
- **RS.1.** Betti and de Rham stacks, with their six functors, are imported from AS.3 and AS.1. RS.1 keeps the ring-stack
  structure, the pro-étale description, and transmutation along $\mathbb C^{\mathrm{Betti}}$.
- **RS.2.** Gains "ring stacks in analytic stacks". The Aoki correspondence moves to RS.3.
- **RS.3.** Gains the Betti-norm/Aoki-locale comparison and the comparison with Theorem 10.6, marked as written in no
  source.

### 4.5 `AnalyticHabiroStack`

- **Conventions.** $\mathcal H^{\mathrm{an}}_{\mathrm{(i)}}$ drops all of (ii). This is forced because $\Phi_m(q)\mid1-q^m$, a unit in
  $\mathcal H^{\mathrm{an}}$, so the specialisations at $q=\zeta_m$ exist only for the variant. $\mathcal H^{\mathrm{an}}$ maps to $B_m$.
- **HS.0.** Nonvanishing locators.
- **HS.1.**
  - Source status added: Lemma 8.1 calls $G$ a subgroup without proof, and Lemma 7.14 is a proof outline.
  - The roots-of-unity and de Rham specialisations are placed over $\mathcal H^{\mathrm{an}}_{\mathrm{(i)}}/\Phi_m(q)$ and
    $\mathcal H^{\mathrm{an}}_{\mathrm{(i)}}/(q-1)$. They had been stated "after base change to $B_m$ or to a quotient where $\Phi_m(q)=0$",
    which is zero over $\mathcal H^{\mathrm{an}}$. The $B_m$ version is marked "not in the notes".
- **HS.2.**
  - The Cartier-duality print inconsistency is recorded.
  - The pentagon route to associativity is marked a gap.
  - $n^{\mathrm{Hab}}$ is placed over the variant, with "$n^{\mathrm{Hab}}$ invertible" as printed and "should" status.
  - The specialisations are placed over the variant.
- **HS.3.** Prop 7.11 is moved out (S8), and the interface boundary is set against HQ.6.
- **HS.4.** Prop 7.11 is added with its "should be quasi-isomorphic" status; the Berkovich-transmutation claim is
  replaced; the specialisation status is recorded.

## 5. Checked and unchanged

- **Source statements.** The following match their sources:
  - GSWZ: Definitions 1.1–1.7, Theorems 1–12, Props 5.1–5.4 and the equation labels cited;
  - Wagner v5: Theorem 4.27 and Theorem 5.1;
  - Wagner v2: Theorems 2.9, 3.11, A.1 and Lemma 2.12, including the $\Phi_5$/$\mathbb F_{11}$ repair;
  - Scholze's Theorem 10.6, Remarks 10.7–10.8 and Examples 10.1–10.4, 10.9;
  - Aoki Definitions 4.20–4.31, Remarks 4.32–4.33, Proposition 4.30 and Theorem 1.7 (stated with no proof and a
    citation of the lecture videos);
  - the Rodríguez Camargo statements cited by SA and AS;
  - the Garoufalidis–Wheeler statement numbers cited for HQ.9 and HB.10.
- **Other items confirmed.**
  - The source hashes and version dates in §1.1–1.2.
  - V5A4 Definition 8.4's $q$-trinomial and the $q=1$ analysis in §8 item 9, confirmed on the rendered page.
  - `PadicHodgeRegulators` D.3 already contains GSWZ Lemma 3.1, Props 3.2–3.3 and Theorem 9 in substance.
  - All stage ids in the five definitions and in §6 exist in the atlas.
  - The union graph is acyclic before and after the changes.

## 6. Observations outside this review's edit scope

1. `Polylogarithms` P.1 and `K3BlochGroups` V.3 (reserved ids) both own the Bloch–Wigner function and its five-term
   identity.
2. The ku paper's Theorem 4.16, used near Theorem 4.17, is attributed to "Nikolaus, unpublished" for all primes. The
   RT.4:q-Hodge blueprint must record the source status at $p=2$.
3. HR.1's Taylor-glued ring and HR.5's Taylor equaliser are two constructions linked by a comparison. That is D3's
   intended design, but it keeps duplicate constructions.
4. The atlas texts of HQ.1, HQ.3 and HQ.4 still describe the old split (framed complexes from PR.6, Cor 3.31 recorded
   in HQ.4). They must be rewritten when the plan is adopted.
5. `SolidAnalyticRings` SA.1 and `VStackSheavesAndLisseCategories` VS2 develop solid abelian groups in the light and
   κ-condensed settings respectively (D12).

## 7. Questions for the user

1. **D5.** V5A2 Theorems 11.3 and 12.1–12.6 can be stated with GSWZ's explicit units over $R_m$, with the identification
   with the regulator of $V^{univ}$ recorded as a gap (the review's default). Should they instead be excluded together
   with Lecture 9?
2. **HB.8.** Accept the direct proof of $D_{\zeta_m}(1)^{24m}=m^{12m}$ and the removal of QM.1, which would otherwise bring in
   `MetaplecticAutomorphicForms`?
3. **HQ.5 and HQ.5-trace.** Accept moving Wagner v2 Theorem 4.22(b) and V5A4 Theorem 1.7 to HQ.5-trace? This makes
   RT.4:q-Hodge responsible for the ku paper's Theorem 4.17.
4. **HQ.7.** Accept that it no longer waits for HQ.6?
5. **D13.** Accept RS.0 without analytic prerequisites, with the analytic instance in RS.2?
6. **Lecture 8 variant.** Confirm the reading that $\mathcal H^{\mathrm{an}}_{\mathrm{(i)}}$ drops all of condition (ii), including invertibility
   of $1-q^n$, and that HS states the $q=\zeta_m$ specialisations over it and the $B_m$ base changes over $\mathcal H^{\mathrm{an}}$.
7. **D7(i).** HQ.9 works in Garoufalidis–Wheeler's naive relative cohomology $H_{\mathrm{naiv}}(X/B)$ of families with
   Gauss–Manin connection, next to the relative conjectures that D6 excludes. Confirm that HQ.9's classes are in scope
   and the relative conjectures are not.
8. **D10.** QW.1 and HR.1 still require PR.0, which requires `PerfectoidQuotients` Q0:integral-algebra and hence
   `PerfectoidSpaces` P1 and P3. Should the δ-ring split of PR.0 be decided before `QWittVectors` is blueprinted?
